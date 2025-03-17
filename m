Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160B6C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 13:39:50 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.81])
 by mx.groups.io with SMTP id smtpd.web11.52774.1742218782623682457
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 06:39:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hDLWlxOR;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hDLWlxOR;
 spf=pass (domain: arm.com, ip: 40.107.104.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mx6mvLTesSAWxhe+7PVwHyYzfIqaedNZFSSBgAUtm6dYoP69yzEZ1C2PgwH9GbGAwyBCrG2XAxABlcoZZwhpWX70hDpHNoZ+NXvSzhU6/z/xHAo9MGhxTIKejG1cAz0+2nWG1BetwGpFgTWYZJBPPOUU0Nc8mONEtzoYQifgGi57kgFVidsypw9PJvsMc4m6DhP/Jx4w0MZ51kGMbYtrBUUvRki4lzgbwUjZLKauEiAEMwunsloOW5zAdaVgLLi8ZUrIWcc1N/xb5uLLuIIqf7PH0TMGb3kn9/GC3pPRbJ9VTQLTGNcVmaxTU0TQVY5jhNLs7+jzab/sM/EbDvDyLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kohvWXIFRqJf8y+W+M6whNqdqyqLkDOgWFDU44cZ/FI=;
 b=uiXBzhXQkLnOtjlfet0MBFwuEyfPtTuzLpxPo8LpBj67vnhbPnpk57gNFnOBF4Y6e3GHGA91Gl5eOHmfVKQOoOFUx+rUkYNWoiaYinWEtg6A4ZuGEZMCFSXVSKjVlu6SrnM618zIRGUVGQtTnUHJ8fQ4woG4wAeGhwNAgB6d6X2JfjmmaZzRsJ5el2eGL8zUsmqLVephhPCcx3hVe5EROYF4F+Yuxzwej9i+tcRuzsyeDZIlseRks50oQepVSTJPnwvLdnoqqFWofphqJ4WDyGGNPWsygtYiHJsH+r1EImxCwbaAdK9LfhBuETkluTqhGeXMhwh7fg5R03Nkpq0yZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kohvWXIFRqJf8y+W+M6whNqdqyqLkDOgWFDU44cZ/FI=;
 b=hDLWlxORhO5ks4z3NWcHny75kKbzBTkyF1vtxts02RZgH04oXtAA1h1eCh4zYb36ZZEEP3U7SL+U9XB7EQuVbw2V7ga675kE3lkH7AJPiRvOA7em2QzqftH4i7g4tKZIKXCs9+KxbfQAU2CxCTvXJFOQ7yXnIz7JCr9oobfM2wo=
Received: from DB9PR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::35) by AS8PR08MB7743.eurprd08.prod.outlook.com
 (2603:10a6:20b:524::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:39:39 +0000
Received: from DB1PEPF000509EB.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::b2) by DB9PR01CA0030.outlook.office365.com
 (2603:10a6:10:1d8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Mon,
 17 Mar 2025 13:39:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EB.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 17 Mar 2025 13:39:37 +0000
Received: ("Tessian outbound 273c03480eca:v594"); Mon, 17 Mar 2025 13:39:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d5a8e997420821bc
X-TessianGatewayMetadata: 2FxYtGYBVjp28Ore9hJGuz7tNpIrbmbP79Ze8Ubv3/fUN72Fv2NOMWmDycuUINDBwoUDncF3sURkTbPL9MBYbuSDmZvIEVeGPy/u45PMCUbPxWVzAnkTa89SJ8li8bLgpUkdIlomVHNj0MAQIcwp3HaJr2xZgs/rRL03b/7MHwU=
X-CR-MTA-TID: 64aa7808
Received: from Ld28f7db3a6c5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 866820C5-5AE4-4415-963E-2D284A0CE338.1;
	Mon, 17 Mar 2025 13:39:31 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld28f7db3a6c5.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 17 Mar 2025 13:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVs/63xh/flGPTMPlV7NCO9gsgw8psXSNsqE13Q5By5GXoowf1qBx7o/dOKMYc6xPG3jQrWdUjx3mKRdzGfZUG6ryacspYuiOj1nrh06XCqg0kYEEDm2PxE+04dObE5gvRSdV9iL998BExyQZxRb7SK1F2I1H1IudvvQrTi4XiPlq5JOiJJhCDInbwP0zmRaIvg9x6P3GcWdiKXILWkVt6AOX7C1afl/5QGqyLnotCRhCj6BXW0sUlQZrAC+H6gba25x/UCCZNgEwdSP6wQrF9Q/ajqekxMtPOW9ajXfdkz9Q8y3/W/W31/yw/NEtK/rgGmVS+KVjclAdn30NPc2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kohvWXIFRqJf8y+W+M6whNqdqyqLkDOgWFDU44cZ/FI=;
 b=qOrbmHTTnY2aIj5bKkg0TYhNQ80OQmWRlk3TxBXgTvxkRvufg6A58qixYOJ09ACoE9JPxz436p26Mcu8EDxu75yWUPiv1s15vCy2qiP2oH39NGWyaNIPKMXqtySGwUJOOQ+drUCnmdBaqyaij3EVqd4N/8M2P0RN4YPBgfh3MBxZHFV69pIidj0zvL20SeKRK2ku3+r+IRHbr6su4kb6Z+PAreWAv3D4lQsYvr4Lpq+pdx/lyymr7nLpph49H/R+wJeV3P8Y58/Q/Qi1oSnockdF3bWHJoCTVhFbphrgddf+dVj73bYMBl8gBtyyCJCVDL2ly/jtL+0VJIRYbjO7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kohvWXIFRqJf8y+W+M6whNqdqyqLkDOgWFDU44cZ/FI=;
 b=hDLWlxORhO5ks4z3NWcHny75kKbzBTkyF1vtxts02RZgH04oXtAA1h1eCh4zYb36ZZEEP3U7SL+U9XB7EQuVbw2V7ga675kE3lkH7AJPiRvOA7em2QzqftH4i7g4tKZIKXCs9+KxbfQAU2CxCTvXJFOQ7yXnIz7JCr9oobfM2wo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10249.eurprd08.prod.outlook.com (2603:10a6:20b:62f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 13:39:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 13:39:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Qi.Chen@windriver.com"
	<Qi.Chen@windriver.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] Add PREFERRED_RPROVIDER_dbus-x11 variable
Thread-Topic: [OE-core] [PATCH 2/2] Add PREFERRED_RPROVIDER_dbus-x11 variable
Thread-Index: AQHblyyhpoHxypMlYU6/s6+0agT0cbN3VZ6A
Date: Mon, 17 Mar 2025 13:39:29 +0000
Message-ID: <70F4EF09-1316-463B-98B3-481E45E80D39@arm.com>
References: <20250317110519.1562513-1-niko.mauno@vaisala.com>
 <20250317110519.1562513-3-niko.mauno@vaisala.com>
In-Reply-To: <20250317110519.1562513-3-niko.mauno@vaisala.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10249:EE_|DB1PEPF000509EB:EE_|AS8PR08MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: bfee5b35-dea0-4d42-385b-08dd65592954
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?d1FrS0RtS0ZZZHhCRkZOSWFWRHRKTFpwYTZ0YUdIcExVaERKRTRjbzlWZE5K?=
 =?utf-8?B?am1jOC9RNjBZckZFWFNHRDRjdm55eUlPbG9jbTdTZVJFQVFmcC80TGlYSVd5?=
 =?utf-8?B?YW4yRkFlK1Y2TEJXOElmcDZSZ25FeWE1S1NKcCtSY0VobHZ6T0xPSzU4UnA1?=
 =?utf-8?B?cEp3NzNrcWhxNWYvNmhGZDNPK2pIejZOeE5NaUplaEpzTmR1ZitOa3BkaHVk?=
 =?utf-8?B?ZjFHR0dFRDFGeTgxNi9MaTYwWkQ1blI0bkVib3BXWE1ibjFLcFlSd0lXNGhl?=
 =?utf-8?B?bEJWQTYxQWNRTUdYS3RxblpyWmMzMHYzblV5K0krUGNJdkJxV21FK0dacWpr?=
 =?utf-8?B?aXpKQjBuNk9JRnNWeHk2Ujk4SmVaWVZXaFBabkM5YXBlekRMRk1pU2ZGZ3Ns?=
 =?utf-8?B?aHM2THl3UHc5M1RMRDN1RisrTzVpUnBxY0hmcFNCR1NQTlVwU0dkSUNua1Zo?=
 =?utf-8?B?ZzcvcEpTbnBBczlJS1I2eW8zZFYwb25iQ25qNXpJVFhvS25KbFVmSnErZkly?=
 =?utf-8?B?N2w3Q2J1UG1nSW5JV2lBRXk5UU5NSVQvZWVPYy90ZHc2S25GR1Q1cFFXZmpU?=
 =?utf-8?B?cDhhdklPeG1uYXA3aFRxT0dNbGViMDkyb3J3VmpZZkFkdEdld1F5cVRxb3cv?=
 =?utf-8?B?VW9OTmNKR0Q2M1QrZkFvdExRZmROZVdqQ0pSNTMrcVhDb3dnaVliVlVZaFF5?=
 =?utf-8?B?OFNUclYxZ1dmL0VkaTB1SzRWYVh6a3hWclRlMzRhWmcyVUs2ZDFuT3JhWGtO?=
 =?utf-8?B?cjN4NFNwSGRvL1Z5ZzRxOE9sNTZ0RzgzVWR5Rjd3QnRvVXJzYyt5a3Y0b2JK?=
 =?utf-8?B?aHRxVko1VzA5aHhXTXdKVzFEeFZMRTdXRzg4M3dLOFd2SGJXczRGTjVKV1JI?=
 =?utf-8?B?end2ZWxzbUNEZDA0M0VyUlBFcDg1bHhFSnhEWElWNjRhcExJZlBQOGRXUzNr?=
 =?utf-8?B?V0xLclBKNGVJbi9nWlRyTzNvbHlkOWFQSDdQVGE0VjdxK0h4SVN2SGRpQWtM?=
 =?utf-8?B?SFcxR0NjWllISDkwcWd4MDV2aGRnanRDSWM3ZmZZdVBPUEFoVGJ2bEtKNkFt?=
 =?utf-8?B?cXZXWGNNVTFtNElseEljVlE0SHMyVitZaWRMOEtiam5ySTA3WW9NM0xVWFQz?=
 =?utf-8?B?RTFkZ1lBZ1JpN21EUDk5eE5CYWVaMlJZR1d2aXZHVmROZkIvWXhNRGJmdjM0?=
 =?utf-8?B?VzBWSW00ZFJrTU4vZHlWRmttTWZUYTdWam54OXM3Q0w5Tk9LT0I2NW8wYTU4?=
 =?utf-8?B?bm4xSkdFdkJ6SFRSVmRkejR6b0dNbU14T3FFOER4aW4vSTBNbTk4NHk1UllR?=
 =?utf-8?B?akMzaUZrUDdoOE80SEtKZ0hBYnlsZVRxcDRQV2N5M1JqT2s3KzZTeVFJUnBJ?=
 =?utf-8?B?NEZhMGFjVGJyVmNoemVwTk1PQnZxREJHMkRGVFkzbG5oMlJGVU8rQ3l2KzJ0?=
 =?utf-8?B?bzZFQ1Z0ajRrakVlSzZ1bkFMRC9maC82MENVUEVYNzk1eWtJT0dQZkN4OWNW?=
 =?utf-8?B?Z0RHY1ZTTXFhTWFvSjlNSjlFd3pjNjFaWDhQVXdqTTZjTGVUSXFsY0NZaXlY?=
 =?utf-8?B?aWlBVGdidW93TjJDWkoya3hBSklZWGpMS2RyazNTd0VhQ256elJ0SjVaSjRn?=
 =?utf-8?B?VDM3VWhySnBQNExaeDRQL0Q5VXRGWDh0dVdIelVndFlITmRMTWJLaUJHY0VK?=
 =?utf-8?B?TDdnRm1lTEJMamdGaG9XOU1JaTdJVWo5a2NvNDFrNG8yMHMxNkhXYTJ3d1B6?=
 =?utf-8?B?c2gwUlY0dE1EQUk1Q3J0bFd6TTRkT25CS3pKWnY1bG5uTTVpSWU5NjBnZjk1?=
 =?utf-8?B?a29TQkNKTjJZWjlFdkVJcVJycmMzL1RmaEZhU05lZHAyU0h0bEQvWmNYSGtV?=
 =?utf-8?B?bnBKYzhNU0s2ZTczTTd6aHhteGd0SE5tZDlMWFNuZWhJL2RIMEFseWZQaWhs?=
 =?utf-8?Q?XY5uC5t128bpfUmQ8n5+6BwLasLOWtt5?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <933ABA4A66CDDD4D8775B8C544506933@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1fc1548f-c070-4efa-afa5-08dd65592459
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cWdIcEFnbjRoTjMxanlDeklpbUd0SXZ0NlNmekt0WmtpY0Y2N1RrMDZvTVov?=
 =?utf-8?B?WGFBR1d3NUphZ1MwN3JDdVYzSldRUCtLdUFIMjZ5WkUrZWNhM3hKUEliOWFS?=
 =?utf-8?B?ZUNwUVBBTFV5Z2d2Q29iRnRhS2VieFZ0MTRDVlk2RXk2YWJ0ekNwMEg3SWE0?=
 =?utf-8?B?UE51WXJWZTIwZEswS0NVQkU5RGRDdFZqWTlQeXQwMk45NUpOS08xV0FMcVpq?=
 =?utf-8?B?bHcvUGJ3UXdXc3pmSVpDMDFqdzJQSXVZdjRGVkZDaDJRdnpqSnQvUThpL1pP?=
 =?utf-8?B?ZEkvaU9Obm93S21yR08rV3dJUTNNN1V4cTAxMTBhV0ZDTU9zTWRYZlgvMXRy?=
 =?utf-8?B?MFE1S3dwRGYyeWw3K2VKQ0NSVkJTQ3RVYlhScE9wYXZ1MGV3NUdINU9xVVdJ?=
 =?utf-8?B?bWN3REFKYmdNRURGclFDcFpVQ0dHYUpCWmEvUG14aWZONG1XeEdWamRQTERq?=
 =?utf-8?B?RzdzMVMybGFBKzBIa0R1MXpWQ2Y2L1BzYTQ2anBWQ01KYlhUVWZaeXZnenJv?=
 =?utf-8?B?ZGxITWF5UG5NR3VZYVBNL1N0T2owSFpvd3prTTZPTW9xV2Z2RE5NSXF2T3FX?=
 =?utf-8?B?YnpERDdpSzQ2VGVwVlpGNHhUSDRZaHlNS3NkQ2l0aDdsOTBBNlNJcDFURFBh?=
 =?utf-8?B?VU1FN1dWbjgvdndnUHVSS1NVLzVhYVg3K1h0ZVF6ZFMzZzdhdkdjdStWUzd4?=
 =?utf-8?B?M0dSTTZNTUdTRzdqNVNRUlY4WTNYV0xXV3V1b3FuNE8wODJHU2tKaVVMUzFx?=
 =?utf-8?B?aU9BZ0ZFM05pYytZODdrL3NEK3dMM0JuWGljSVRUUUpxVEZjMmVCNGcvK2lY?=
 =?utf-8?B?K1p2SmIxZXVqMy8zU09hLzZ5UEhaSWZLSmVUcHlYUHdWR1ZEd1pZTXJoUnJF?=
 =?utf-8?B?N3lkaGxrTDltMmhCZGVsZlZvTDE3aXI3REJpei8vbUhrK2VUMTlwR29uY2Nv?=
 =?utf-8?B?bHFKQUo4dm96M3I5ZllNV29SN2dQL3MwSjNkaFE4ckhka1NCWkFTS1pTbk41?=
 =?utf-8?B?SXk1bGRaTVJuM1Z2OXFJSnVqTU1oQUp2YkJVeTRuYS9kVjVaaTNnZUtpTTV0?=
 =?utf-8?B?L3R4ZnduVTR1cEd0UUhCQ1k0WlRncnRRMkVtb1M0V1p4VS9Vd3E2cjBCUDlR?=
 =?utf-8?B?OTNvWFl2em8zTVU3RnVqZjFZOUJrY29QSUMvMlVCRmhNcFpKS0x6bUlFdjJl?=
 =?utf-8?B?OUlxRlEzZVc2MkowcWcxWFk5eW5FY0NYYUthaGtoenJZV3lJUEpaLzZMQXcw?=
 =?utf-8?B?Unh6ZmRnbjBXc3NDbVdDM2l0NnI3OWE2bTExbG9ZT3FIQmd3Y1NRUmdHNEsv?=
 =?utf-8?B?L0NySENkZnRvTVAyeUtwYUJiOUtaenk3TTJpWDZ5Q3c0SVordDJIODNCS0lz?=
 =?utf-8?B?bHptVTRnZ09SK0Z5VjVkanFmVk9EWExrU3Q2c3lhV2xGc0Mzclo5aldrbDdL?=
 =?utf-8?B?TUxPYXBIOFNDUzMreVROT2p5UVlhZGJrNis4M2pUKzZrdlIzdi9SQkszMjI3?=
 =?utf-8?B?Nm9UTWpzRTlwOFJDbHFOb2YzbVNXVm50bUsxQWIrTUw5WjNpcVhaRUdMZHRL?=
 =?utf-8?B?NEQ2aWFjVlFCMExIVnEzeEg1cTVVK2Q2MDl0SFVMcFdYbHFkOWFGNzluTmIv?=
 =?utf-8?B?b2lNM0FuN05WbnNYQ253Znp2cGdnMC9PWmY0RzRlNnJKRk92S0piK1dNTVVj?=
 =?utf-8?B?ZmFNWG1mNUtPeld4MTh6ZEpRMTJJT205WmdDeXFxcTRlSjB2OUNKUVMxa3Zi?=
 =?utf-8?B?a1hBN0s2NUVndUcyTmdPaXZ4VmRQbWxad0x1UnJYc1JLTG0wckRMbTUxcEVU?=
 =?utf-8?B?ODFpb3loK0llVVZPNTROS3ZoeGRDM2E5YnBNNFNtWXErVGsrSnZPTTdzRFVP?=
 =?utf-8?B?ZlpONVlkNTNkaHpxQlBNMXNtVkhnRnN4SUhRdjBhVENKWmJJak1qcnlEUXdH?=
 =?utf-8?B?VHd1dVZFZGFERTF2WHh0Zi9IWHlQQTZidm8vZHJad0hBTGU2NUNEVFk4L3ZS?=
 =?utf-8?Q?gRJpq4xonUrEde4pDv2lHts/FfDvpY=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 13:39:37.6202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfee5b35-dea0-4d42-385b-08dd65592954
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 13:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213096

T24gMTcgTWFyIDIwMjUsIGF0IDExOjA1LCBOaWtvIE1hdW5vIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxuaWtvLm1hdW5vPXZhaXNhbGEuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gVXNlIG5ldyBQUkVGRVJSRURfUlBST1ZJREVSX2RidXMteDExIHZhcmlhYmxl
IHRvIGRldGVybWluZSBkYnVzLXgxMQ0KPiBwcm92aWRlci4gVGhpcyBmYWNpbGl0YXRlcyB1c2lu
ZyB0aGUgbmV3IFZJUlRVQUwtUlVOVElNRV9kYnVzIHZhcmlhYmxlDQo+IGZvciBzZWxlY3Rpbmcg
cHJlZmVycmVkIEQtQnVzIGltcGxlbWVudGF0aW9uLg0KDQpkYnVzLXgxMSBpcyBhIGhpc3Rvcmlj
YWwgcGFja2FnZSBuYW1lIHRoYXQgaXMgb25seSBwcm92aWRlZCBieSB0aGUgZGJ1cyByZWNpcGUg
YW5kIHNib3VsZG7igJl0IGJlIHVzZWQgYW55d2hlcmUgZWxzZS4NCg0KUm9zcw==

