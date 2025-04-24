Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 915FEC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:43:03 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.37])
 by mx.groups.io with SMTP id smtpd.web11.12075.1745491373499243757
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=p9CZ0YVq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=p9CZ0YVq;
 spf=pass (domain: arm.com, ip: 52.101.71.37, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=euy63CtLS9piCQgn4FL25Z8yIV64D3+I1GEth5l2ELPojVFk1R+rOyVvIkQkrt88rj/J27dAAsKCX78wxxTg5LIBNfNDD/J4KUbgbB+7nHRAV1psNWREOg9uVpFhv/Wp8bLH5q6Iw5RfPsF1SIhPeaunOkLDoCyYdcYhDF5LMQXEIhr12OgCqIm69iH611eom/hqCVvCFnZiCB6i8XVabyfurAt0Pb00FqGJXlaThNP27eE5C5uSs/WzzxSuHNaU8DM+Zs8nh0VmnkfD9Czsiwoc13tqBO4D4qpYawjKfvv8Kqk2Ma9QdiHCVLUlSvfwLFEsQK6q8OE+6nW4DkAW8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mHJp353MY8jdfIuCPlsvTh63cb0IkDCaMAy4RYb20A=;
 b=fwy1NfjtkujPJOTAJRpVcr5RfiZ+BsKvBDj9oLHFjH090j8F9MWguZDpe/aTi+GA0399qmHVWZ9JS+OnsBtInrOBVmQncnjTa7j8SoKoNLnnb095tIFDmWvcHst22IdBYNLBy9VYltv3ZZr78XA4jFklOz0XvA2DcgbyUs7UU6ez2yStLv0O6KxYc0TOLDAQZ7b/ByWEiJSiUjpwan2DqeFi6HuMjyDGR//zhiiSRfAJkGwAJIrJMbDyLwGo3KCGfruAu0nD55bx1+TsRW2y4/gUsDtK+DvymCDImwtNEsGt+D4QhdzT+dlr0vTTZ/XzE6B/E81Ln5dd1vsY9R5vKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mHJp353MY8jdfIuCPlsvTh63cb0IkDCaMAy4RYb20A=;
 b=p9CZ0YVqIfMGuSgWCAhssJWBukuCeW2OuHBkev7yodblfK7F5rnDkvu0kJ6nsL+woLh00h/Jathv9X1mTpghI5J+2jWah9gCsvbhRqT29b5yGlKb3icuXsTd9lXTcGzu4Q1Dpl4scX0E9Gtnvj0mSPsw0RfEDxxyr48SZSEjQRw=
Received: from AM8P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::24)
 by AS8PR08MB6326.eurprd08.prod.outlook.com (2603:10a6:20b:335::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 10:42:50 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::61) by AM8P251CA0019.outlook.office365.com
 (2603:10a6:20b:21b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 10:42:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 24 Apr 2025 10:42:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HyJienIOc2Fo7HhLzck8AAUZl1csu//MugS/BGY6zddo2FPZnPvj766YIO0s60yr6+wgG1/opc2pOQkyRydvef93qflv/aTpEu2abdt0t3EGlIeR5uVavrvtq/2rwqSKGE7XEuYUuTXaQq7kFpmU1vfmj1SUdNjtZ9gHqLybQQ36B/M1TA9WT7MMUHuMslFtR4JgNHutR1p7g/g2gKofDSKSQ/0E3ExBaBkddKVzW6Oc95+so0rDyydRK0D3mL3RxTP76HvPzlz9k+n1DeA3ZnZJ/S7hKrKqKN/t3EUsH+PfkvGAZ8voMhzI9PGpZQYqYO8FCf469ZeXYSrBx1ZG5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mHJp353MY8jdfIuCPlsvTh63cb0IkDCaMAy4RYb20A=;
 b=CEithUjbLED5//e4giAlPPdkGq+9IagatvKwnByHDIRb4V7A6lVJaBHXVS8NThkU5UQQf2HRpf9YGodoS3rH70cKAv9vhyHnhcTwwPKNHWwSPNqGPt2S1q26hwIlRwws6YKdTyR8AO243HAL2zzoISlcNDFSsyNPVcOJwLfddkjas7lsTxpd5ePb1S+EUT8cwTYo6ZT2N1VMkxUpeaS+/EDTPM6J/w7jTz2IGDGEkzWWIEsLgsBK3EekONZqQ01N0kBDOcLP1Z6KD2hxvkFEZWmOTJgVFOjFsmceiE9fsybu/ikuuRPNHtCwrUXBLV/6Z9IvQZM4sZn7GngQHIFDYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mHJp353MY8jdfIuCPlsvTh63cb0IkDCaMAy4RYb20A=;
 b=p9CZ0YVqIfMGuSgWCAhssJWBukuCeW2OuHBkev7yodblfK7F5rnDkvu0kJ6nsL+woLh00h/Jathv9X1mTpghI5J+2jWah9gCsvbhRqT29b5yGlKb3icuXsTd9lXTcGzu4Q1Dpl4scX0E9Gtnvj0mSPsw0RfEDxxyr48SZSEjQRw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB11160.eurprd08.prod.outlook.com (2603:10a6:102:46e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 24 Apr
 2025 10:42:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 10:42:14 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/7] libgpg-error: drop -unknown suffix from
 version number
Thread-Topic: [OE-core] [PATCH 2/7] libgpg-error: drop -unknown suffix from
 version number
Thread-Index: AQHbr0RJtC02esjzZkeTQVXFNFfuJ7OyrIAA
Date: Thu, 24 Apr 2025 10:42:14 +0000
Message-ID: <F5CD3550-04A0-49FF-8C9C-2188B08B6481@arm.com>
References: <20250417025532.1363790-1-yi.zhao@windriver.com>
 <20250417025532.1363790-2-yi.zhao@windriver.com>
In-Reply-To: <20250417025532.1363790-2-yi.zhao@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB11160:EE_|AM2PEPF0001C716:EE_|AS8PR08MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: f6afe2f8-bafe-4c15-157b-08dd831cc1df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZFBsRHNwMEtHMkJqUDFtd01TdnpOU01yaDVjWjB6bmRpVUdiSUhBa3JYMDFN?=
 =?utf-8?B?SnNzZlJISVp5cEFwT2hlMDFDbFIvTEZrTU9qditwQkxJQllKbjErM1JPQzl4?=
 =?utf-8?B?dzNnUCtsQXZPREY0WFRnYXBaZ3NMd3FrVmZiT2JNdXVMM3laY1IwK2UvRWpt?=
 =?utf-8?B?eTVUU201a3VON1ZYM0FUNEJBdHQ4VUVyaHpJdTE4S3RSU0ZEWWpVcm9IK0FR?=
 =?utf-8?B?MEhvUHV0MXBZQ29tWFJlemJtQUZhR2hsdGNwOUdPT2Jjd24xSG9DdzFsVzdR?=
 =?utf-8?B?Qlp0bjZjUDJXdWFnSVhxRW5WcXFnM2c4NGRwL2x6OU9pYitmeU5zN2IyenZB?=
 =?utf-8?B?dHBYSHR4MFUraSsyVVRnaFpFalNnM3djZm8rdWJub1NMS1E1Nk5DTXBBSVJF?=
 =?utf-8?B?bm5KTXNBNmVUdXAyRFZ6UUY5bFFxUkpRRVo5djRnRVF2aVJPVW1GOXcrZXlo?=
 =?utf-8?B?VGg3eDRubCtXVUVZR3k0Y2FvRFlITWZ2Ri9ZaWVhZklNcU9EK0VsL0lGNDJD?=
 =?utf-8?B?SlpiSnRLZk0wQnp6OGZtb0krSWNSd3YrbDczbjA4WlFGMEVtampOLzRaeVBy?=
 =?utf-8?B?QUp4aTg2N09VWjVsZzdGeFYrRmdPMlJLWW1UNDhZNEJ2anRJUjl5aXMyclhY?=
 =?utf-8?B?TUxuTWNwazRFZ09EWXIrTlJsWDZZay9idytxTFlESVQva3h4VXE4c20vZmNT?=
 =?utf-8?B?VzE1c3BFVTB6VE8yWGhyY3VBV3RuRlhoZk1FdG95UlNKSk5DVHY4Z3YxNEpm?=
 =?utf-8?B?Vmxyd1hDbW9CT3ArWGJDUkd1RlB3aVhjSTUwTjJqRXp4cG9BWEhNL0ZIZzdu?=
 =?utf-8?B?NlJHa1RMSUMrMUVqaUR6b2FiRGFjVi95UHJEMUFLQnEzdDRvQ3ZWTDBnRnMy?=
 =?utf-8?B?V2xXSFp4aEV6SVprN0tNZEMxTGRqc2JpM0VhNUh5QkJ2QzY0S1lEY01uVklB?=
 =?utf-8?B?eWhuWkNoMlczMW5scEs5SVUyNzBKVEdYOEVldEIwZ1NzRWI1YlFRcEdicTVK?=
 =?utf-8?B?OXdaVjZDVjJNSTB6M1E3dGlueFRhMGUzWldaY2t2NFEzdms4VWdRK0tnV2Ux?=
 =?utf-8?B?TEMxWFJhOHdIZXVQajRuM3lRVjMxNlJraGNQWlhtUERSd3F0bGRvQkQ0WFlZ?=
 =?utf-8?B?ZEtpd1ZJUnc5YUVYcjEwRjB0eElLQXc1SXh6amJLUXVRbWJXc0hOaUZRRHQ2?=
 =?utf-8?B?VXA5cTV5bVBkNm5LV3RWL0pEbU1pY2xYQ0NaVnZIanZFVzJiV3ZMcEx3Qmhi?=
 =?utf-8?B?eVRZTGQwdUNPaWRJdDRWazBwMHdzUVhNYWxqcEE5dDhxc3oybFpIb0NKSlF0?=
 =?utf-8?B?a293VmRTejh5Y3lNMmdrT2tySDJRRXBhdm1Wb0pXZWZPYnE1ZGdzaERDclpN?=
 =?utf-8?B?RFBITlcxeldHMjFyY0FkQ01lYkxHZWpNM0ZRekhRMTNwbWpnMkpmSmZOSnhD?=
 =?utf-8?B?U0hIY2d2alRuZVlaakt1WlNCS0t5VFRUT21NSjZRUkJxSW1pTGJHTXpUUlV4?=
 =?utf-8?B?ZFV2TDJoUlZQV3pVa00yNFBsOW84czhBY1NLUi9ndVlVZkE0VHRBQk9DOFRU?=
 =?utf-8?B?VXdZZnBUOHVSQk1tZS9udDA5QlJ4VjRCOWIvSnNwdnFWUGthRS83K1NXZTFr?=
 =?utf-8?B?bHVpY2drczZWYnhNdDlHeDY1aHpOc2cxZ2c1aUkwYVVMemtZVGFPUVZCMlZR?=
 =?utf-8?B?SGUzU09SOTdxNk1TSEZETWg0ZVo2ZXJPMnB1ME80Q0pTL1lKcEJUNk9sa3Ni?=
 =?utf-8?B?T1Y3Lyt3NHFWQkhHVm9kdUc4WWphWjZSdVAyM09rUFZFUUp2V3FWZHh3eHBl?=
 =?utf-8?B?d1kvdXR3dkZNZVFycHRMU09LS0lCSGNOSkxnWXFmMXowVzdpdWpTbE05WHMz?=
 =?utf-8?B?UEhLbzNnQjhyYTdQb0d6eitoTzlyYm1Tb0wwUTdIN21SNk54aUZHZHF1RXR6?=
 =?utf-8?B?YlJnb3dUbUtzM1U4OXdSZlRpQUR5dnJsWEVhZmFJWDcxYnI1aDJwTWNNdkwz?=
 =?utf-8?B?bnNlYVlmSUVBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <270775A39AC3484B80E8670AD0B9A746@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11160
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9ad5d59a-ede9-4b63-24d2-08dd831cad74
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?czZ6WnN4Nm11THg2Z3JPd2t0aGdoaTl0OHlaY0F4cmE0SzBrbnFXM0tIdGRV?=
 =?utf-8?B?cGpFYlhNSmhvRGd2UW0vWmRsRmd0R08yM2dJc0ZVSzNqMG8yaVNmMzROZE5y?=
 =?utf-8?B?aXpKUlNNNGlJRWZCQm5la0lseTFHZHBOanh4U29RREtiWTh2bXhtdWsrek10?=
 =?utf-8?B?V2RtWXI5YmtKQ3l5Yi9sZUlTNHJtUWl0L3czWlRKWjJHQzU4SFh0MnU0eThv?=
 =?utf-8?B?SkF0ZjZWNTdNb3RPVTZCZEI5aG5uOXJPWW8wV2NzQkNOY3VVRmVXblJwUXpm?=
 =?utf-8?B?MVRmNG4rS25qNTkzVTFsMzYrSkpoREdFSHVyN1diS24xeC9FZzZDSnVSMTh2?=
 =?utf-8?B?VGNjandmUXNTUit3cG9NdUhJQnNWK2dRRnV6NGJ2aEp0Qk5Ob2tHcWViYjdj?=
 =?utf-8?B?alovZzlmNVNlYldZV2ZwcDZtbWsrT0dtK3BtZnhGQnJsbHVGMmJpOUVxNWU5?=
 =?utf-8?B?NzNkQlBvVGs1Sk50KzZiK2EzQjAwelBxYzhkYXV4MnpwQkhTSVE0NThNbEpn?=
 =?utf-8?B?bnIwZ1ZVSGtlTVBpaTA2bFZkekQxQUphaHBjbUwwdVkram91dlhCQ2RvalpT?=
 =?utf-8?B?WmlGVE01R01RK0Rka21vRldmTkppaWZ3UStIekQrc1ZZSWRMVFZneW84WFE4?=
 =?utf-8?B?WlN5YmVPVkpaODN1SlN2d1poNlMrWWFFSUpRRkJFNElNNk9mYWx0OUdXb3lk?=
 =?utf-8?B?WFhLaUY5RmJrbFpUbWs4YUwzWWZpMWlsU2RZbkx3MVNqL016RTZuZUo3NHY2?=
 =?utf-8?B?T1RBZHVCMFZaWXgzVXpPemRjcWd3Z2xVREZKeXdWbGk2UWdiZ0U4WFMwOGt6?=
 =?utf-8?B?cENCWG9SVUcyZHRSd1Jna0NkeHNKZU9PblFBL3dHSWNPZ0t3ZWVvQjVKUW9G?=
 =?utf-8?B?SVl3UDhxY1VzL0xiRldHais4bEI2TW1PNi93dk0rU2lLeHZjQmFoa04xRGNU?=
 =?utf-8?B?bkZrZk82UkZsWDFvWVpHcElDQ2V2WEZGV2lSV1UyVTdCaXNDM2FaOGo5MGNi?=
 =?utf-8?B?UTRBYzBDekhUZUFMT0EyTXA1RzRXemMzWU5nN3NZV0dRSkVEOWFtc0FSVHNQ?=
 =?utf-8?B?cXhyMm1PdXJjQlo0NFN1VnVzSlRPckg1cnZZSThxOGM1bkN1emp6MjBybThz?=
 =?utf-8?B?b2h3VGJvQWI0NTNaTjFaSkptTTNKLzFLVlhYSWQzdlg5ZEMyTWE2TGdKMGc3?=
 =?utf-8?B?SHVPTjFvWmhWWERKeEZaNGd6eXpuN3pic1pZNDRVVVVQL3Q5OVFNR0NyRU9J?=
 =?utf-8?B?UFBvUWRPbm9LQllNRzVOWkJ0ZldNM0Yrd01WMUpyUGxCcGtIcTNnQ201TWhx?=
 =?utf-8?B?Skk3VVdQRXlMT3JhR2RuVGtiMmhMZUxLZEhTVHl2ajJzL2ZKUDVzNjZUZmNJ?=
 =?utf-8?B?VkRqNGgzeVRMdGxCTTZ4NFl3WFJSRWZISFpKOUpGb3BGcVU0SkQ1Q0lHTVUr?=
 =?utf-8?B?aGZTVGgzbjBQc05mcnhTeFVGcWRVUU9VMjNIcFBlVnU0dUFiUUp1dmNibFJv?=
 =?utf-8?B?Uy9tdjl3Q29hUzY1KzVZUHF2NVgzdmJSZXNVU041RXdFS1BSNVRUc1k4NUpK?=
 =?utf-8?B?MW9CT2p6VTBvN0RYZXh1NjRtcFJhTlMxTDZpOGNlMUU3MDhRemQ4RjB1cUh6?=
 =?utf-8?B?UTFmN1RES0lTVmxCZnlJUW83NWhqZW9TMHg0RzRXNzlYbTB6VFJlNmVYUjZk?=
 =?utf-8?B?dndEMm5WSGk2WjdBMkZZVk5oTEJxUklWZ3dXM29pZUlHdGthbXFoc0xGbFNw?=
 =?utf-8?B?cThhV3doeVp3OGtqYzRkMHArWmRtTGY2eTJUVkRTS0R4Q1JTTm9ONENLaWJE?=
 =?utf-8?B?KzYvRmZsaFlOMGh1NW5Rb1FkRllVY0EreHUwSTcvSVR4a2pKWnQ4RVB2NnZo?=
 =?utf-8?B?VEM3NFY1OXBDQ29DVVF3NjJGcFZHVk9QTDFSTTlrMjBRNWZDejBndGx5R1Ay?=
 =?utf-8?B?V1VQcWNUMGtpQVczK1dUZUxOdGgyNFZxdXhqZDNFY1FweFROQ0twZzNHQjdJ?=
 =?utf-8?B?VFcxbG5tUFVFbVprOWdMSFQ0bWk5b0JrcmZmSStNb2FQQ3QxaGtlNG13TlBj?=
 =?utf-8?Q?evVCub?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:42:49.1111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6afe2f8-bafe-4c15-157b-08dd831cc1df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6326
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215355

T24gMTcgQXByIDIwMjUsIGF0IDAzOjU1LCBZaSBaaGFvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDx5aS56aGFvPWVuZy53aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gSWYgYXV0b2dlbi5zaCBpcyBydW4gb3V0c2lkZSBvZiBhIGdpdCByZXBvLCB0
aGUgZmluZC12ZXJzaW9uIGZ1bmN0aW9uDQo+IGFsd2F5cyBhc3N1bWVzIHRoYXQgbGliZ3BnLWVy
cm9yIGlzIGEgYmV0YSB2ZXJzaW9uIGFuZCBhZGRzIHRoZSBzdWZmaXgNCj4gJy11bmtub3duJyB0
byB0aGUgdmVyc2lvbiBudW1iZXIuDQo+IA0KPiBCZWZvciB0aGUgZml4Og0KPiAkIGdwZy1lcnJv
ciAtLXZlcnNpb24NCj4gZ3BnLWVycm9yIChsaWJncGctZXJyb3IpIDEuNTEtdW5rbm93bg0KPiAN
Cj4gQWZ0ZXIgdGhlIGZpeDoNCj4gJCBncGctZXJyb3IgLS12ZXJzaW9uDQo+IGdwZy1lcnJvciAo
bGliZ3BnLWVycm9yKSAxLjUxDQoNClRoaXMgc2VyaWVzIGltcGxpZXMgdGhhdCB3ZeKAmWxsIGJl
IGNhcnJ5aW5nIHBhdGNoZXMgYWdhaW5zdCBhIG51bWJlciBvZiByZWNpcGVzIGZvcmV2ZXIuICBB
cyByZS1ydW5uaW5nIGF1dG9yZWNvbmYgb24gYSB0YXJiYWxsIGlzbuKAmXQgdW5oZWFyZCBvZiBp
dCB3b3VsZCBiZSBnb29kIHRvIHRyeSBhbmQgcmVzb2x2ZSB0aGlzIHVwc3RyZWFtIHNvbWVob3cu
ICBQbGVhc2UgZGlzY3VzcyB3aXRoIHVwc3RyZWFtIHRoZSB1c2UtY2FzZSBoZXJlLCBtYXliZSB0
aGUgZmluZC12ZXJzaW9uIHNjcmlwdCBjb3VsZCBhbHNvIHdyaXRlIHRoZSB2ZXJzaW9uIHRvIGEg
aGlkZGVuIGZpbGUgd2hpY2ggZ29lcyBpbnRvIHRoZSB0YXJiYWxsIHdoaWNoIGNvdWxkIGJlIHVz
ZWQgaWYgdGhlIGRpcmVjdG9yeSBpc27igJl0IGEgZ2l0IHRyZWUuDQoNCkNoZWVycywNClJvc3M=

