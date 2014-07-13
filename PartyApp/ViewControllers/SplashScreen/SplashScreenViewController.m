//
//  SplashScreenViewController.m
//  PartyApp
//
//  Created by Gaganinder Singh on 22/06/14.
//  Copyright (c) 2014 WebFactory. All rights reserved.
//

#import "SplashScreenViewController.h"
#import "ProfileViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *userDefs = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary *userInfo = [userDefs objectForKey:@"userDetail"];
    
    NSString *userName = [userInfo objectForKey:@"login"];
    NSString *password = [userDefs objectForKey:@"Password"];
    
    // QuickBlox application authorization
    QBASessionCreationRequest *extendedAuthRequest = [[QBASessionCreationRequest alloc] init];
    extendedAuthRequest.userLogin = userName;
    extendedAuthRequest.userPassword = password;
    
    [QBAuth createSessionWithExtendedRequest:extendedAuthRequest delegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Secure Session Response
- (void)completedWithResult:(Result *)result{
    
    if([result isKindOfClass:[QBAAuthSessionCreationResult class]]){
        
        // Success result
        if(result.success){
            
            // Get all notes
//            [QBCustomObjects objectsWithClassName:customClassName delegate:self];
            [self dismissViewControllerAnimated:false completion:nil];
        }
        
        // Get all notes result
    }
    [self dismissViewControllerAnimated:false completion:nil];
    // QuickBlox application authorization result
    if([result isKindOfClass:[QBAAuthSessionCreationResult class]]){

        // Success result
        if(result.success){

            NSDate *sessionExpDate = [[QBBaseModule sharedModule] tokenExpirationDate];
            [[NSUserDefaults standardUserDefaults] setObject:sessionExpDate
                                                      forKey:_pudSessionExpiryDate];
    
        }
        else{
            
        }
    }
}
@end
