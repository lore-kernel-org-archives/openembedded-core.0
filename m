Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2653CCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 14:27:17 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.58])
 by mx.groups.io with SMTP id smtpd.web11.1795.1760020033654181497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 07:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=eXesSuMO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=eXesSuMO;
 spf=pass (domain: arm.com, ip: 52.101.72.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sb3QfPTpXfot15xgfJA9y1SY8g/NQII98gZzL/LTEev54JCB/o6BKzvOI42VH9xNBEDexKu2NC11m6BvSzpitT6CN8j4YjNa2Tyf+HLNolRaDI0McXK7IW7bVcEkf8+XgaXp7+eajk8nxxkfnRfjrOC6XjrTePBQKc77u/tl000u6AC+wM7TdZR3zhW+23CPd6O1plOx9ecsxuQPKpwrFi1kXHA4fN2YO/81LvY2Z4XbAayFcOzClhtzQYe9aejfHbLQQnymGcNXC6KeN12GYBzXSpPAYPwZy6GzbslS3O6/HrkiBRnayUr1DKk1mDYTz3WGx4P1hAtqWtum9bN4sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQE+47xWQULQJH8P6WcVJPng7aacbBW+IeFWul20PFc=;
 b=nrYRNsCUkBtkEmd6m+FQO4OwZWjvJuzqEs7RF4whY2BRthTBuDUu5Al3hRLcHNHXNj2w/vv0TwUEpllQ2Qy5CctarQxuVOuJp/1E33+HiysuohQbNJdAPi4CC4LAtCA6X+HbGppOrLO5pWmaU+M0DSe9ABEuzhwgWGUBaVoTfICXw9mEyZMGL4RJOzZTKwzNBzSD52T5vBH900Ytfb8YNmEl+VPJxL+bmW6ix/c5WGl/Cvndd4f6n8yXolOCGYwZ+fMwst7O65xWAzN5zaRDLXefiaBQ8tzRQIKqGx4PDLRc/TAg8WWz9eNzW1GAN8BD/mD5qlQ6sXZrnAasWG6z7Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQE+47xWQULQJH8P6WcVJPng7aacbBW+IeFWul20PFc=;
 b=eXesSuMOd74bJZurqo+r1OZS1uQ0xW/QZjcbaLN+wQWdg4vPsnN1beNe4ZExv5eAYnU3RcyhkVcuYKc/cVPRbUFUul4qFrJTBk0BIyQq3nTIaMt9kb+jj8qLBTI6u5/PHx5sy6ik9OsW88yJdKNB1W8mhq25hh0vkpGteJipfvA=
Received: from AS4P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::13)
 by VI0PR08MB10896.eurprd08.prod.outlook.com (2603:10a6:800:254::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 14:27:09 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::ec) by AS4P192CA0003.outlook.office365.com
 (2603:10a6:20b:5da::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Thu,
 9 Oct 2025 14:27:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Thu, 9 Oct 2025 14:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeyYhv6kQRkWZKQBy2C6a9Pi9RGIih9MkphWuebYCdQpYKrDqx1kMN7QipLOOrcYcAJDYxMzzd6aRnep5Q0LnfJSMGxx+uwpnnqlZWS+qddGBmHRDRdVWwacIpeEHbW0erh8S84lq7Qgfeer3Ig/EqazEvv5bNGQnSi1Q45Zot//Kua8cZfflwfgZ7FzGyc6hRDQNrlAfNATkjEzftWUQ0oSwfkEdnd6xt643N80bP/c6/OnpGFrH8R3br9t9pqkXqsy1Wum8pQvx/Z4dG4+tnU4Yc1YBaLhHfY0yT7JqjvOlswK6fxfXARe6yaZfxbgVSbpLHfvd9Y0nIGG5QKk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQE+47xWQULQJH8P6WcVJPng7aacbBW+IeFWul20PFc=;
 b=SJB8PduNdRMJD+075yV8HqOrmNDQZGzfGiA1A6A11M5vCeJwdwMZ5D8cbE9NGbuZk5E7Xg0lP9fQGyZIsdUV9N1HU8beDAdVF8RAb0QSiQy9i5Z0m/ZUBnUr6eAKELzvurUp+MGUMVk4AZL1ZwEg+GCzK6SGQRvXnimgIX/BbRzpJxJpQbd5mOQCGZqDtCkVPRUOGm8vVhGTrGJVrAVOYuW1nOcAhEDwGNJVe7vD+JRwZxtRPVOf9SGQVz29aFpauS9UWly0BaAQVUq/VjFO0oyVvYMzTjbiMTWim36disWMNMXWMAwwWE47YPAPIw4k6iyy9DJeDymO8NwO0D6GMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQE+47xWQULQJH8P6WcVJPng7aacbBW+IeFWul20PFc=;
 b=eXesSuMOd74bJZurqo+r1OZS1uQ0xW/QZjcbaLN+wQWdg4vPsnN1beNe4ZExv5eAYnU3RcyhkVcuYKc/cVPRbUFUul4qFrJTBk0BIyQq3nTIaMt9kb+jj8qLBTI6u5/PHx5sy6ik9OsW88yJdKNB1W8mhq25hh0vkpGteJipfvA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8436.eurprd08.prod.outlook.com (2603:10a6:10:3d4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 14:26:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 14:26:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/4] oeqa: runtime: Ignore SSH errors during
 setup and tear down
Thread-Topic: [OE-core] [PATCH 2/4] oeqa: runtime: Ignore SSH errors during
 setup and tear down
Thread-Index: AQHcN7E7Gq87Xj5eWEmgC6Qvj11EAbS54gEA
Date: Thu, 9 Oct 2025 14:26:36 +0000
Message-ID: <DC955EFB-988F-4BCA-91C9-8205286AA5D7@arm.com>
References: <20251007-mathieu-ssh-fails-v1-0-a6affee3571b@bootlin.com>
 <20251007-mathieu-ssh-fails-v1-2-a6affee3571b@bootlin.com>
In-Reply-To: <20251007-mathieu-ssh-fails-v1-2-a6affee3571b@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8436:EE_|AM3PEPF0000A793:EE_|VI0PR08MB10896:EE_
X-MS-Office365-Filtering-Correlation-Id: 439928db-f22c-4dad-a1e5-08de073fedf5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RXZHUjQ3bytaRndyVFpnUndNbmVSM2dyNUxvM2xkVFJQVkZObkVselQyNURZ?=
 =?utf-8?B?d1ZLOW11QjBBWWl6V3VhZzlwNkg1UmdsOE5RNmZjUTdsd3VNZmw1RVRPazlJ?=
 =?utf-8?B?QnBBSnVkYVNGYUs0aXJXclRvWjREZWdmWEY0bDAyTDJRWWUwdXJaYU1tOG5I?=
 =?utf-8?B?VVhrRXM0WWExaEpiNlNiR2ZmVXhVSVd2Tk1zdVlwbVhFZFZJQ1MwcWUxcGtI?=
 =?utf-8?B?dlRyU3pKWStzRFVTcjZnMU9HQklJM3hJZ3UxcFVQS3RoQ01xdm5VWlQranpn?=
 =?utf-8?B?REY5Wlg3cGZybkRVOVVuTCt1NzRqK0pCWmhhcDNiSzg1T2VpQjZMYU9xeFV1?=
 =?utf-8?B?elU5WjVINEwxUmpHczhFbU1BMEk5TFZkdWp6cHc0OEVVcjNtV05uVmVjTEIv?=
 =?utf-8?B?MGN3S0E1cStwaTNvUGtRak9CN2FxRCt6cjNyYnhNVXJYMEwyNG55c2xrTXNz?=
 =?utf-8?B?eDNEbGdUVU05cWlZdTNQTVRDY3I0NWJPbVcxT1V2U1hLQzc3T0tsYmgzVVZE?=
 =?utf-8?B?dGIyR0QzWmFBeHF0dHZubkhGMzllZ01TVzN2bjhuU1hEVHVnWlJPMUZSdHV4?=
 =?utf-8?B?Tk5aQnkyZXdtNmRoUy9RSCs2Q3NkNWUxUHVSU0N3anlKY2JlZDd6eFZHTTMx?=
 =?utf-8?B?MEsxc2FVLzZ0OWNycGF3Ti9NVjdEZjNPSDBCQTNaY3pmY0hWcVgzVVZVT054?=
 =?utf-8?B?ZGJBUGN0ZmpmRG81cHUyQkpDMWIzMlVYUytXQWJsc2dCSEhCRVdZN1VyWlY5?=
 =?utf-8?B?cVVVenN2T3AzdEd2TmYzWTk1QzY2M2o5ODhaeHFWbUZvaUJPWlNzTWF3QSsy?=
 =?utf-8?B?eWNxaDd6N3J4WXBPRjlYTkxPaEF3b1BLSXZlQUNVSWNRYmN6bkdrblVPM092?=
 =?utf-8?B?MTkvSlAyUnc2RURRUkxUUE45aEd6TU52cWpmUmJiWFFvc0FHSGgzY3hkK3Qr?=
 =?utf-8?B?NHBtL2N6c1QxMFA5bU05aEFDSnRjMFEveVlDWVp4WkM5MUZtQ0lybmFTOHhN?=
 =?utf-8?B?SFdvWTduNlZWYnowdTE3K1BPeEhkVytYMmRoc2duSnVYUnJpZEJkUU1DbXFp?=
 =?utf-8?B?NkhJZjlwWGJINkQ0OURBNk5tUlpQT1VCNWVlTkloeXVKOWJFUER3bnpOaUor?=
 =?utf-8?B?YytRRkE4WmpiM3BzV01SRElHU3E5SjNuTzNlR0FDYkJrYTg0SnFrdmtaV1Fr?=
 =?utf-8?B?bEdXazVtSEFxaGdEdmpUbmRJakhndzN2cXhiVFVPZ0tvVGhqMUxoSU54NjhK?=
 =?utf-8?B?aENHWDhBMkRYTnE2SmZESU1OWnJqYXRBYUFjUk9IQmFNZStabU5xd3VCT2Zu?=
 =?utf-8?B?SHZSNUlEQmZ1dFNQdG1tM21jQ243MVRyM3BhTHduSzI5WUY1NlorQWo0TkI4?=
 =?utf-8?B?dStPVjFYd2FWZHRmMDdRTWlhZEEybDQ4Z09BRDQ5dE1yeDQ1RVgxVHJzeWMz?=
 =?utf-8?B?T2NySTJQWWpUTktuZmdZSTRaVi9sTExyRk1xSURYaEVJSU5PNHMwSkhFeDho?=
 =?utf-8?B?d25GT0xFMDV2c2YyTFdia3BXRzlnTGdmbis4N1BtYzVwTVkvSlNWbDY2Q25s?=
 =?utf-8?B?OWpBbXNQRG1Wem1zZzJWVVZyVVp1YUowOTVWKzVEcEN5dllVN2trcWFVTndk?=
 =?utf-8?B?NnNTZDZLWks1ck5FcDNlVEJtOGdQV2FvSkFxdk1vaEZkYTFZcHNFNTdndERO?=
 =?utf-8?B?dEZUQXhXZmY5cWlFYzFVaW1KempWdVdudzgzS01NVWgxVXRtK2EwWUxvdU1Y?=
 =?utf-8?B?cGJya0ZLK0phYklubDNkUEhWcVNUN2tUNk54ZzdZTEx1d1VnQmJ4S2RFckpy?=
 =?utf-8?B?OWpXNVRrYzBpQnY2QWhnZHFtSDF0TkpFQnpCM2FacndTL1dHeFlGRFZCMTRi?=
 =?utf-8?B?R2dYNEkwdUhOSDZMSDFiYkZSVFQwUE1SWStpenhxVURiUGZwUlczOXJFa2Zo?=
 =?utf-8?B?dUVGQ1FCL2xNcDlTekFvNkRWSVZTOFZsb3FDR2lyODI5alduV3VublJBMnBo?=
 =?utf-8?B?WVdSdVU0VmIySENka21EVmtmaWZqbnRPVzZoSFhVMWdQK0IrNDMwQjZUMFBz?=
 =?utf-8?Q?WiqKOq?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFFEED7E49201D4E9A9E144D7F01A189@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8436
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a18740ed-2575-49f2-849f-08de073fda94
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|82310400026|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UWtHK3hMRjJmd1ByeWphamZzcFhNTU1hQWJrNzFnR0o5SGpQSnRkQ2hEeGlr?=
 =?utf-8?B?SlVFL245OTVjYWdtQklCeDZSdGZqSHJlV3hMTTlmSmJTdGFaU3ljbFRzVXFq?=
 =?utf-8?B?RjUwelZIOU5ONHc4RUxIZllzRlptUkZyNVlhanhZQnhUKzdXOGYxU1ZSeUxa?=
 =?utf-8?B?Q1lxcnd6NTN6WkFkOUM3TURKanFCdUtjU1dpZjd5ckp6dHd6NGlDQ1kxeE0z?=
 =?utf-8?B?NjNyOWRUSGRHQlBKTVczQjhUaGR5RWVFQW43SjUvckJ4L0QrOUl0OXhhRXhB?=
 =?utf-8?B?S09JTlY1Q1VSM1NiRVRMSHNheDE0RTRWd3dncnRabnVzdUNQZXRJaUdaNXNi?=
 =?utf-8?B?VDBSQ1RqdXdTK3FmcjdkRm5pU1FDUTJCbDA4WE5oK1NpUEFPMGVvWDRFalNV?=
 =?utf-8?B?TC9handWNTU4b2I3R2U2Y1ZmZzNtOThzYXdIcVpuYWx6TGxCY3h2blZEQ2tr?=
 =?utf-8?B?NFhIY1hnT0xaT2Y2YlhVTUM0WW51WTczR0VmV1ZRbTFEam9TdmI4ZUJiS1dl?=
 =?utf-8?B?c1UwZ2NDTVhRU1RLMkNPZUlyWVdCSzdIMjlkWFZKYzNMYUE3cWZ4THNYYStN?=
 =?utf-8?B?UHd6eEdzQUhKM3VONm81YldVZWJpZndTczRjRmliUmVTSWJiU1FCSERuS0dX?=
 =?utf-8?B?TG5aaXlROS8xelVUVGdhRHlTZmFZK250alo5Q2FwMHhXRzlHenIyaEdRVmtz?=
 =?utf-8?B?ZjRDNDF6Y1p5aElyK21CUitpdGtBb2ZsRHFJY0Z6LzVXNnI4VnYzZHlqRTBT?=
 =?utf-8?B?andNdkt3YkJPcmtIM3ZrYUZOTmNJTjR4YXpTN3kvNzMyQVJ5WHBJMXhwSnlO?=
 =?utf-8?B?ckk3UXRvQkpYM04xRVF3K2M3dVlZV2VmMEZPN09ud3M2Z3QvZHZGVFBtT3Rx?=
 =?utf-8?B?dmVhWVdLWWxOVG0xNzc0WHZIY1BJUXhFQmVzZWpBS1pueElmWWNueXBWV1Vm?=
 =?utf-8?B?WmxKZEJ0TnlrSGVuRnJSamRQN2Q1dEZtRGI2ZmpMSTgrYVZoNHFsNUIzbEdi?=
 =?utf-8?B?V3JLOXBOeUE4aWpGSnY0WE1JVGhBNDhWZWJmUC9xMW5vdTdIRmJseWpJR0sv?=
 =?utf-8?B?NlV0TjJBTHd3c3c2MHBiYUZCMVJyWHYrbEplckdmNmJrS1E5VHdFTVhxNEZ4?=
 =?utf-8?B?VDRPWHZtOGtSWVc2SW96MWZsUGZ2NE1senpXWTVTd29hRnIrYml1eXI2cDZ1?=
 =?utf-8?B?NWFmWW45aFNvMk4rMStYdVp2bFkwYWNSTWdndGtlWHNaTXh6Y3dzYmxzWlhy?=
 =?utf-8?B?cm9yeGhrYm1KeW5kcGFUa3FmVEhWanpHZ25SekVNRjE5aW5ZOWFTdStzdERh?=
 =?utf-8?B?MFY2RE01bDJCclBVK1BUWE81Y0hzbjh0cTdSV253RFExZkZwS1BLMEpGN1VF?=
 =?utf-8?B?RUZPZWZ5eWR1VUVXVERIbnZQSW9wZkhDWTJVT1lyZWp6a0l0RE8zSmwxUXZZ?=
 =?utf-8?B?eXFWaVBsTlJNN1FWRzB5K0wyVUtGd0E1c1VZL09iMXJ1dnl2eGdqdWhMcmxr?=
 =?utf-8?B?bFltQUVtNWI3OHFrVTc4VjVBckpoYjdiWjdZNVlNU09pNXVIdEVZVGJld0U0?=
 =?utf-8?B?OVJyc1ZMc055UXo2bFhXTUNFNHZ2KzVwMWN6RTEzMVBrcFJnL2xHNnhOR1cr?=
 =?utf-8?B?TEJGQ3lrSXN2dnNzZEF1ci92ampyWEZVS0x2WU5pUTNZWjhSWGFWd2gvWXRn?=
 =?utf-8?B?eVVXcENiUGp0RFdoQzdiVGh6V2MwVFY3Sms5S29hSjBDbWZGY3A0eFFpVkd6?=
 =?utf-8?B?WnVUbEpxUlhtdjVpNUJRTk9Lbnd6dWpOd1JFb2FneFhLY2NrbnJPMXZwTzRP?=
 =?utf-8?B?YU5EVEpGdC9EU2N1SVVGTUo2Y0hvUE1GaUczZnZHTWxPT0o2TFVLWVFTM01G?=
 =?utf-8?B?U1RPOWFyNW03eW5SMWlmUmFuOExlVjVPbzhzVFRLci9SNzNkZnhqOUJ1VDl0?=
 =?utf-8?B?S01SbFdIZU9DUTBJZmtuS3JPdmJRemxHUmtDSHJxV1pyOGNYbURaNXhMYXZK?=
 =?utf-8?B?TjRHYll0YjRoSHBxWnRtU0dMU3hPTWZoWlJHSkdtVk80bWF5UFkyUFVSOGFJ?=
 =?utf-8?B?REU3RzJTQVVwZGtGdkswZTF0NHIrWmNmclQ1QTFwQTZiVlMwQWF4TlBXdS8y?=
 =?utf-8?Q?hhXE=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:27:08.8853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 439928db-f22c-4dad-a1e5-08de073fedf5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10896
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 14:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224616

T24gNyBPY3QgMjAyNSwgYXQgMTg6MzgsIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8bWF0aGlldS5kdWJvaXMtYnJpYW5kPWJvb3RsaW4uY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gVGVzdHMgdXNpbmcgU1NIIHdpbGwgZmFp
bCB3aGVuIG5vIFNTSCBzZXJ2ZXIgaXMgcHJlc2VudCBvbiB0aGUgdGFyZ2V0Lg0KPiBUaGVzZSB0
ZXN0cyBhcmUgZGlzYWJsZWQgaW4gdGhlc2UgY2FzZXMsIGJ5IGJlaW5nIG1hcmtlZCB3aXRoIGEN
Cj4gZGVwZW5kZW5jeSBvbiBzc2guU1NIVGVzdC50ZXN0X3NzaCwgd2hpY2ggaW4gdHVybnMgaGFz
IGEgZGVwZW5kZW5jeSBvbg0KPiBoYXZpbmcgZWl0aGVyIGRyb3BiZWFyIG9yIG9wZW5zc2gtc3No
ZCBpbiB0aGUgaW1hZ2UuDQo+IA0KPiBCdXQgc2V0VXBDbGFzcygpIGFuZCB0ZWFyRG93bkNsYXNz
KCkgZnVuY3Rpb25zIGFyZSBhbHdheXMgZXhlY3V0ZWQsIGV2ZW4NCj4gb24gdGVzdHMgZmFpbGlu
ZyB0aGUgZGVwZW5kZW5jeSBjaGVja3MsIGxlYWRpbmcgdG8gdW5leHBlY3RlZCBmYWlsZWQNCj4g
dGVzdHMuDQoNCldlbGwgdGhhdOKAmXMganVzdCBzaWxseS4gIEkgd29uZGVyIGlmIE9FSGFzUGFj
a2FnZSgpIHdvcmtzIG9uIHRoZSBjbGFzcyBzY29wZSB0b28gYW5kIGRvZXMgYWN0dWFsbHkgYXZv
aWQgZG9pbmcgdGhlIHNldHVwL3RlYXJkb3duPw0KDQpIb3dldmVyLCB0aGlzIGRvZXMgZGVtb25z
dHJhdGUgdGhhdCBkb2luZyBub24tdHJpdmlhbCBzZXR1cC90ZWFyZG93biBpcyBhIGJhZCBpZGVh
IGluIHRlc3QgY2FzZXMsIGFuZCBjb3B5aW5nIGZpbGVzIHRvIHRoZSB0YXJnZXQgaXMgZGVmaW5p
dGVseSBub24tdHJpdmlhbC4NCg0KSSBzdWdnZXN0IG1lcmdpbmcgYWxsIG9mIHRoZSBsb2dyb3Rh
dGUgdGVzdHMgYW5kIHNldHVwL3RlYXJkb3duIGludG8gYSBzaW5nbGUgdGVzdCB0aGF0IHVzZXMg
ZmluYWxseTogdG8gY2xlYW51cCwgYW5kIGp1c3QgcmVtb3ZpbmcgdGhlIHRlYXJkb3duIGZyb20g
dGhlIHdlc3RvbiB0ZXN0Lg0KDQpDaGVlcnMsDQpSb3Nz

