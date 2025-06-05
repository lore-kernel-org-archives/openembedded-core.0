Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC0EC5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:13:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.10])
 by mx.groups.io with SMTP id smtpd.web11.8818.1749132770324365929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 07:12:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cLfXrr5E;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cLfXrr5E;
 spf=pass (domain: arm.com, ip: 52.101.66.10, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NPArQKKZQK67YaACLQ2yOJsJTMo7scRBdqjlxsnLEPCySuMWqhJcXZZxhfNcQC/07vFWUNTbptVCog54edZ4vf87xzKb57M/CdMtqc9A56ka49FYsLguxDFgTPnJ2q/GGxUNPGsH0U789lWza/HJrDilWEb7naiNmiM3KtdSSc4OfKg4/NSA9vGuv9xo+ExkKcP3u4s9f0Kr7iQ8fTKzyIahj+pt3V5h3QP6CWgol5IaTpchy/dxKgOjqcNlQPOsVZ8XpmM2UV7LFyId8ypHnufrpmI1zm1kkvxYR2bPR2hv7obm+aGw2yUBg7dRjw97Y2CQ3alSyZVhvAPzqgYtyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Phjrv+F/LgGKjuCMtEg9ejZT8CG7kmZkHdZaawGkCY8=;
 b=BIwu2FaU9GrNrX7Mz800vLCRr965ukB5cemfjZW7T2kBurea3UrNe5015yriJDoj+BN4vTrTbLcbr7L0O1485AtOUhgM/7W9Gnx4EeSEONkh0oCDcJzT3jEET5jKC/GnMl80EszOtjKr77b5rr58S81PQtm1BMo/GPAw/JG9tN4j11ngMyIU9YpaBkjg3iBC+bLFqn1KQcpxa+hbkru5q5EwDgZSYY607wM1fBr6UTvXm721vay5mEsMUgInaddMe61R/2nP2s48HLwwRchNCtMMEd5MpFN1EC3RnQZ9nAgixSeWk9mauqPj94yEniqa3VE2zmdRbyGXkaVXh5RwOw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phjrv+F/LgGKjuCMtEg9ejZT8CG7kmZkHdZaawGkCY8=;
 b=cLfXrr5ETGaSs4BcxX9QxWnLmJLfz/3UbXyNUnVBQmQBA1Hxb/X5CjmqgX2rtRf1KaS3bsdrYFTsOLJt2/nIVkvw+fmRC1XyHmDX4rZS7ELoyDFDaVGPfL2bjCfbjslLJ2RaoIAC+5lwzSoXvylEC4JkEoIzv4LSOwDptzqK5+A=
Received: from BE1P281CA0215.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:88::17)
 by AS8PR08MB8063.eurprd08.prod.outlook.com (2603:10a6:20b:54c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 14:12:46 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:b10:88:cafe::1a) by BE1P281CA0215.outlook.office365.com
 (2603:10a6:b10:88::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Thu, 5
 Jun 2025 14:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 14:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJZ33qdwrkK4YEQN5EijetlWCR5d5f1g6QCk7VOlwbgkN/l1XhaoDFDo0Qu8UiShR7Fdhcaw+mJXQ5BcTuhooEQ2WGRrls1YI66WgpQujjxSRYT8x8KfR58y5+eBpmr1h1wMiEiPXbLmWwEBFHY3dyE3FZiCHVsdo9HOhMYP29mKzXiRc+yFjZnoyBHhJLYCoFJf2/NwVU1rllyzUb9lfteppfxtK7gcu1IA9wl2cRdqU+0XbrGXROpnh+gVKH1geMyLZQzP2nZ2WHk5Bq8f8ChEP9VcLp2Q/nkXNHZ3mjmcvL5MHHFn2pRydOKq9Se8wC5DrHRaGsWW6wXp2VRcsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Phjrv+F/LgGKjuCMtEg9ejZT8CG7kmZkHdZaawGkCY8=;
 b=gOnz4fAiq1iIcdNgQwlM5gKWsBS9dP202gH4Xai2Ocuv1nYX8KcojZSi6BWX2uFXPz16zdvG3mtlGah9EaTlJlgIVyysO9IX/J7qQn8PutNWN3ucZ99vLJfbc6ElINcZ7vkvF6fc+Yx9+YoaYXfBdvl12Y8HHCakbLEM0MkAQptwLuqK/sbwDtrsdWOVQEURn11eW6kbzMEILRFak70NVpuhd2sgANOi6hMI2sh+O2lTuzmvR8xK9EmQ+/nBcdwwxj6eTy9RkLP3YqJWbo+a+ItA6K17LWX+/7IkqhEFAbp+rtKHyCx4RwUPa5PVTvqaejXJfPlLuxBOAygkwuRfsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phjrv+F/LgGKjuCMtEg9ejZT8CG7kmZkHdZaawGkCY8=;
 b=cLfXrr5ETGaSs4BcxX9QxWnLmJLfz/3UbXyNUnVBQmQBA1Hxb/X5CjmqgX2rtRf1KaS3bsdrYFTsOLJt2/nIVkvw+fmRC1XyHmDX4rZS7ELoyDFDaVGPfL2bjCfbjslLJ2RaoIAC+5lwzSoXvylEC4JkEoIzv4LSOwDptzqK5+A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB8961.eurprd08.prod.outlook.com (2603:10a6:10:428::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 14:12:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 14:12:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sandeep.gundlupet-raju@amd.com" <sandeep.gundlupet-raju@amd.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
Thread-Topic: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
Thread-Index: AQHb0RHl6ng8QZi8TUOeHzY1cNAZKrP0pXcA
Date: Thu, 5 Jun 2025 14:12:11 +0000
Message-ID: <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com>
References: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB8961:EE_|DB3PEPF0000885A:EE_|AS8PR08MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: ba786d1c-f735-4d8f-1c15-08dda43b0a92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?M3VzMWlYUWFPWUtZWElYd1BFbmRHYzQzUUhxSkQzSzA0bjZBbmkxdzVFT1ZO?=
 =?utf-8?B?encvR2huUUhRRFZmWUhraktzOWlxa09SclZqaVBqWmkranlnVEZHeEtvaTQ1?=
 =?utf-8?B?NzU2K2U2aUljSmdtckxscEZzV0dseFFGR3JCWDN6ajgxRlIxY3VnOVo2RHZy?=
 =?utf-8?B?M3FPSDNrdG5BNEduZ2NSbVBJNU5DREtLZ0tManVPYUtINzcrMTZTVDhOb1V2?=
 =?utf-8?B?a1gySUdvaGRpZjhWbFU3MVR6Y1pmTFErSDcrbS9lbi9SNlZHenhtNmVRYlda?=
 =?utf-8?B?amp5UmJaV3ovODloeDlTSWdFVStxU2Rlb3ZJL3RzY1VzdXlVRElyVmNqbkkr?=
 =?utf-8?B?RHY1aGZDTEk1dE1WV1QvaTRHSURDVGtBODRLRDFDNk44alV6bG1zbzMwTUxk?=
 =?utf-8?B?bzRoamFvNk1MN0RoYWptQ1d2V0ZhOW80ckE5M0tkTWxnaFJJd0hXemFqNFZu?=
 =?utf-8?B?aVZ0ZjlSZzg2VXBTYTJURllhZ1lCODRKWHZCUFhzaXNMRTJIL3JZNFJtL0d1?=
 =?utf-8?B?dFRRT2k0UURMWWowVlFVZFE0RzBPaVFwZmoyZFN4T1cvMkIzQnBNKy9kd1dL?=
 =?utf-8?B?Y2ZuWTE0TS9iOVNMcktQR1htY1BQQTd6TzVQWGlmTmgwK1NFL09UZWRyQUkr?=
 =?utf-8?B?a2hyQnFkY0MrNUM0V2FRS2swRGx5MVlFRXIxU2U1YS95YTk2K3dYK0xVMnpL?=
 =?utf-8?B?RFprakdhZ016SStISGhrMW9VU3dFNVpZYklicHFNbzB4c3o4eUg5YnZubDVt?=
 =?utf-8?B?NnE3aTZnWFZnSExSbFI0RkpsVUxyVzNmdUdwdTl2NW5CU041N2NGeGtrQ3M4?=
 =?utf-8?B?SGlwSk5SallvSjNDZTIvV3piUlIxOWo4bzhkOVZ4bVBFYXVoQ0J3YWJoMEIw?=
 =?utf-8?B?aEViUzh1eDVlWVhNZktZMGxqZWhXOWMvUXcwUGVKdllsNkRwRHhmSjY0OWVY?=
 =?utf-8?B?ZzJHTEUyOXM1SUlHYzFDMkNjbjgwRnQvbnJLY2E0NnlHY2VqUk5JRklUNVhS?=
 =?utf-8?B?SFk0ck55d3RNTFhMTytsYWZOeUU2OEF0RnBnWXFOdnR6eWs4eDlDbFNOUlhZ?=
 =?utf-8?B?WXV2THVWZmNQZjhqNHgrUU9ZT3pYYXZHM3BGbmZFRFpYWWxscVpKZTVsRWJE?=
 =?utf-8?B?K3FCajlENGhXRzBXaTk5NHl2cUh2SkFSMEd3UWR6ZGt1QWRvUUtHeC90UjBh?=
 =?utf-8?B?bWlqcGhkVFpOUUxueEdRTVV5ZTczTE5YWFZDR2tzU0UxK0QyQ2RCRVVmcHpp?=
 =?utf-8?B?bW54Um5HK2cram9zcTJxcjdHcmNhUDB4ZEc0aDErTnl2MllTL1hFZ01VTzlT?=
 =?utf-8?B?N0NBUFpqS2xLU3lneVJraFJoaFlZZ216TUYzd0w1MFJZaGZFUFlLNkt6L21p?=
 =?utf-8?B?eitzdnk4R3FCaVVDemE5TnlyMWVjRTlFUTZvRnUvWVJuZGlXeEQwTTJuU1Y2?=
 =?utf-8?B?b1pSaWRYSE5EN0o1bzFCNGtQN2JFTmNaTGVHdGw2MEt0WlE2SkZEZ0Q5WEpS?=
 =?utf-8?B?MHNFSmdHaDl3Vm5nbHB5WHBrWUZZVmdRNlM4bC9UbFByTnJQclFmY250cmE4?=
 =?utf-8?B?NHYwSVZSa1BiaFRJY0hpbS9nZjVIT1ZLZnFFOVRXMkpuSW1QSU83ei9XZGl5?=
 =?utf-8?B?d1pDQXZET2dkZUpFNC9sOEhjRXU3WDhuQjRsMk5LQjFvNG4ydE1GYUtqVEc4?=
 =?utf-8?B?YXJFK1Y5Q3NOOTNuekx2WS9BeTd5a1FUWXNTNmxSMXVySlpKY1N2Nm5yMElG?=
 =?utf-8?B?UTdweWtNa3g1bHVPYTAwSkVWQVVDY1pxT2NPa255b05WS2Fld3BLN3VLSUNx?=
 =?utf-8?B?VEtQRUNneXh0YUtra2wvLytTdHo5ZGloMHZJNzhmL0UyaHZEclVjajE0QXdB?=
 =?utf-8?B?Nzg4S092bVJUbFVOejNtY09HbUtYOS90dDVwQlJGTEdTbEZNSEFzWXdVSWR5?=
 =?utf-8?B?THcrdEtkMjR3OWQ1dEtiV3Y0K3JPZWlQL2FpM0JqQ2YySnVLNkN1VkpyWUsr?=
 =?utf-8?B?T3RYS1JkWmJRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4935936E23802B4A867A17C623DD2DF2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8961
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bd2269ed-8b04-41e9-a249-08dda43af6f1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|14060799003|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mmp0T2trL0FRanMxSzNqQnMwWGJGWFowUzN3b3N1RkZZMDE1aWZiNXVrVHZy?=
 =?utf-8?B?b0ZYZ0pSMVpSdmx3R2diZVRXQ0RKb3AvT3Q2WVRuVjI3VHNzU09zdy9TZXo1?=
 =?utf-8?B?Z3NzcU9DZ21TbTRNUXBNQVlFMzhwZStPeXJ5ai9Xai93VitUK2J0ajBqL2ls?=
 =?utf-8?B?OFMrUVBaK3VIZFBEcFpHOTcyVVhUQ290cG0yZzQ1aFZOUHpTaW5oMUtOakNS?=
 =?utf-8?B?NXJ5VDc5WEQ4SVRPSi9kNi84UHRYaUhJcUo1VGdWWnVJK0NxNE0yeVlJSW5K?=
 =?utf-8?B?U3M5SDRYbEgyWlBPMDI2NGRsZWR4TERZWDVzK2kvc25NbkdrUFdNWjVVblJN?=
 =?utf-8?B?WkgxT3RTaW94SUdKWktGcjNHVkdHdTYwMG9ETk5KWFAxTGVuNWhsTGpsM2tn?=
 =?utf-8?B?Q2YxZFE4K2FwSHQxNEdBMllTMkRsZGtsTU1RRWNWOXVISUc3ZUVFS0FOZmZH?=
 =?utf-8?B?T1NNUytQVnM3bFhZVjFIMTd6UzR1eXJ1M1FiU2ZkQ1VYQ2kwdk9LaDZRUmJh?=
 =?utf-8?B?WXluNDFlTDcrLzZvMU9UVHhDeVVrbWI5czNkQ2NKVHJEK2QwVWhQMUt4a3Qr?=
 =?utf-8?B?ajR1RXhWSTMxWnB4TitseHJsZm9NWG1jSWNjeWtna3ZkOU83NEtrQU9SYWFF?=
 =?utf-8?B?VFJhODlpT2h4ekhFM3BudE5oaU1rUzBtcjYxUjdxU3VOZm1wU1FkUjNkaDVS?=
 =?utf-8?B?VGh1WGVaSkh2Nmg3bEVDY2F6OUVmbWd4T21pQktCUi81Y0grWjdzN0Y3cHln?=
 =?utf-8?B?VW1qS3o0eExUUCtDSTlrMHBUQjRFa2RoS2VqZVVGK0VETFphWHZTMk1QNWZT?=
 =?utf-8?B?MnIyS0F4QjlhVjlLQWY3S3FQeG9IZi9IVjNoV2hUaWVoSSs0a1RxaVhxWXV5?=
 =?utf-8?B?NkVleWVsYkx1VG44NkxLay8yUmIyWmNxS2V3L1d4Q283SjhrdWVDbVdlVUkx?=
 =?utf-8?B?VEMrOERta2pCSGlENnQyQWxNUlAvay9nMVZTSG9wOUdtek5OM1V3bnE4Unhz?=
 =?utf-8?B?NlJQUCt3U3ovSUxEWTJqdFhVVUp3emZ2MkxHTm9LbGNUUUFEL1l0Wkp1SkFP?=
 =?utf-8?B?c0MrTDVodW42TVkzV2o2SkljN2Z3TEwveDhoWHc1NHpEVWtleitYNVlSMUZ5?=
 =?utf-8?B?RkhTZXhreWdTaDhjU2tYZThodkVoTFptWEVwWlNsaGplZHNlbzR6MW9Dc29w?=
 =?utf-8?B?dW9ocHNKYjJ4MzRiaHdvQmxlb0ovdlY4MGtQVWVUMFA2UmRlbFZReEpyUTVY?=
 =?utf-8?B?MkpXQjRRc1RyMElERmZNOVJucHNXbFlVakZOemxxdGZEVGdpOUZnN1RRbFJq?=
 =?utf-8?B?eityaFpHSDdqbGpKY1REaHBqaEhQS01JRUE2TWE4dGxQcnlPNzVKNWlqelN6?=
 =?utf-8?B?dXhmbHlsNkRETlFlSGhDRzNtcWpMaUJEMXl4L3MvSG1mdXlqaXhSMzFSOGow?=
 =?utf-8?B?cE5vUCtjRyt5bDk2YTZueFFaNFo3Q2t6UFJ3eTd3Ni81R1lRZmZTYzJqNURp?=
 =?utf-8?B?YVljVlNra1FFMmNSaHUvcVFlZ2NrckFvOWNJNHhXUzhvRHZHMDRhaVdoRTFT?=
 =?utf-8?B?My9GRVdCN0xLYkVBVDlXOTB2ZGlqZDNSU3hxa1NqeGgwZGk0S29aU2tjck90?=
 =?utf-8?B?UmJJSnVMTklLVUZjdmRUQXNhRTU0MlA4WHVITWpxZlA1blRNU2pqWE1qM0NK?=
 =?utf-8?B?aEdheUd4dk4zb3Z5U2phQk80ekNoQzFOWWZlY3NiUXpKTkl5bkRHYndTREVJ?=
 =?utf-8?B?UGtzdkNVb2VwTG1zMXBXMWlIc0tsdzczSlhqUCtTaUQ3VENXQkoxUU5SL3Zq?=
 =?utf-8?B?WGEvYlc1Y3grcGlROG84dXBOandSRUgrZU9oRFdjVDJVczBEVHczMUFKKzFM?=
 =?utf-8?B?cXljVTJGL0lBL3VlRXVIcmR6eHNZTHg0ZFNJSWtpNkF3Mkh1WlhXck9mbmd6?=
 =?utf-8?B?REVBNmY0cnIyN1piNndaYVpVRmFUTUw4WStvRFpzTGFrS2k4WnRVSXIwRG5y?=
 =?utf-8?B?aDhCM2ZxL25FelhVNXZYUzg3V2NMNm9Pd1U5WTU0REx1UlhmS0drdGg0R3JL?=
 =?utf-8?Q?NFkdvZ?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:12:44.2875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba786d1c-f735-4d8f-1c15-08dda43b0a92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 14:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218026

T24gMzAgTWF5IDIwMjUsIGF0IDA0OjIwLCBTYW5kZWVwIEd1bmRsdXBldCBSYWp1IHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxzYW5kZWVwLmd1bmRsdXBldC1yYWp1PWFtZC5jb21AbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBBZGQgdHVuZSB2YXJpYW50IGZvciBBUk0g
Q29ydGV4LVI1MiAzMi1iaXQgaW4gR0NDIGFzIHRoZXJlIGlzIG5vDQo+IHN1cHBvcnQgZm9yIENv
cnRleC1SNTIgMzItYml0IHRvb2xjaGFpbi4NCg0KVGhpcyBpcyB0aGUgd3JvbmcgZml4IGFzIHRo
ZSBleGlzdGluZyB0dW5lIGZpbGUgaXMganVzdCB3cm9uZy4NCg0KVGhlIGNvcnRleHI1MiB0dW5l
IHNheXM6DQoNClRVTkVfRkVBVFVSRVM6dHVuZS1jb3J0ZXhyNTIgPSAiYWFyY2g2NCBjcmMgc2lt
ZCBjb3J0ZXhyNTLigJ0NCg0KQnV0IHRoZSBDb3J0ZXggUjUyIFRlY2huaWNhbCBSZWZlcmVuY2Ug
TWFudWFsWzFdIHNheXMgIlRoZSBDb3J0ZXjCri1SNTIgcHJvY2Vzc29yIGltcGxlbWVudHMgdGhl
IEFybXY4LVIgQUFyY2gzMiBhcmNoaXRlY3R1cmXigJ0sIHNvIHRoZXJlIGlzIG5vIDY0LWJpdCBS
NTIuDQoNClRoZSBzb2x1dGlvbiBoZXJlIGlzIHRvIHN0b3AgaXQgY2xhaW1pbmcgdG8gYmUgNjQt
Yml0IGF0IGFsbC4NCg0KUm9zcw0KDQpbMV0gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1
bWVudGF0aW9uLzEwMDAyNi8wMTA0L1RoZS1Db3J0ZXgtUjUyLXByb2Nlc3Nvci9TdXBwb3J0ZWQt
c3RhbmRhcmRzL0FybS1hcmNoaXRlY3R1cmU/bGFuZz1lbg==

