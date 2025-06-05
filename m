Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37006C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 10:56:09 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.66])
 by mx.groups.io with SMTP id smtpd.web11.4691.1749120958403786882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 03:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lC3mcS5z;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lC3mcS5z;
 spf=pass (domain: arm.com, ip: 40.107.159.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d6HuJf3rbI2mUQmAimeOQk2rLiSfklF2VNhRmjqLLTh3xxWcPvHzkuz/AdTNaqSWIwm/2YeAylpAkleBEVdvix8UIVxxijEEPQBwgK2Ebc4vr0k/td/tF8cbFPbxxnNBVtqfK+ECmf5+PeEFlIJYY1+8Y+LMZAigdJ483jW4z+v+w15HMoim3eycBNsOwTTE51Ea6DHxQgr28h1Jkzy5YIAblhbFTEjBiwV1io86thY8d7D9F4KoRf6RxCpsHhAQy9fwNniPz95REOD3UZgWoHHbtxwPv/G5ShqC0S0ZJaiwrLeP5d9JGNkVIKniErpUtZYKXXzMaHWHGLAr0LI+Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFvcoDbiAUzD7FV79wvY3SpvrvC40rDq8zX7VbH67GI=;
 b=KIf7Vufvy4tNg6g/zr266ckJnOc36ccTDoidfMV2BXiQN/y60ZZ2JQ1K7/pzR6oAjrlfK01XNCzzg4ZQuLMykMQoooqCWQRVtdIgEBE4zrZkidVRSYMs3PnPhRCo+13KEiF/joEL12M7tclz/sjYtmtv7Cu1NxuWFJgRXv1FAstI5yZRcPhJN1xCDU/P32DAujpmmUX2NcVPimF2MemQspxBy2oo5Hc36Nh37eCZ5Z8PJHQyUbHPoiMsQhZSaUc6Tb6BRqjtgtH3k6u83HOxh6NQbbLABiXBNCeMWMMYxRFemvjKOMro1B5hRe75TWG+iTVvbeaceror9JAuKHV21w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFvcoDbiAUzD7FV79wvY3SpvrvC40rDq8zX7VbH67GI=;
 b=lC3mcS5zKYlwZVmm6nA1lQ8PEbEzzTD70Kr94f01b5NrzzIMpl00MG2AAybfTDFfdhfd4jBEkpfozkz9ZQCOm4841aXyCkFrYXYV5AWxfvq/ZFzZKWWPy8iXShyrJ0htbIS6S5xCtUjTVprjlYGzWtYTOzjdjO0aBUb+C1kRIFA=
Received: from AS4P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::14)
 by DB9PR08MB6411.eurprd08.prod.outlook.com (2603:10a6:10:261::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 10:55:53 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::9f) by AS4P250CA0026.outlook.office365.com
 (2603:10a6:20b:5e3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Thu,
 5 Jun 2025 10:55:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 10:55:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jiiF8KxMu3sHZv2pq6W5gqlrkRebsso8MeD+uFHGKf2b621vNy4wiHQ2fPZLCgqttJnn1J6A1lPxCtbTe4IaDuLTAPgtNx1kD6EvnwNWIL0T/zpsynKvIV+oB87BSLFJMYcxQEZ4o+KrX7BrMkB1A9m9/vvRG2UzTMc5AzR/UYQ6Pp5pAUt2odeAuVvtPyVy0zjqrn4dXTkEi3O7ugX3eov2wcMmxzlgCTKZZwhZ70CzA7XjgwbkwGmairIbbeA3dSv5yd5ELx3scpbKG2Hr4gCgbX6WHGqM9O5DiPMiFxxcWo0WxOexwYt/lmFRqewGmu+0aUjKjTkxPWzegj7riQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFvcoDbiAUzD7FV79wvY3SpvrvC40rDq8zX7VbH67GI=;
 b=YbvFjPHL+CbQQDnsnw2p2LZtK//oMXiVaf8yRXIuSNcWwiPvKMwm7NMo/iZprEMIHWwjqpqmK1VupB1j0n7473uBHZ1GDndu3Wp8mSlObAS/NWZB1PvWNnp+pBF0HTLshJX+T7htJ3U2YaJH1bhCQMFMKrnbswoTSmPxnP03teyXEmyZ6ne02/3ce2d372O2NLD22JJAncQr7Oec5EJpIXcPMkJerDY7z8P1gmELZtF7Ncclvd7BGpSTTpP9IzjnYWVUV32O/OuqOaaGCRzCXENtks9HtdvT9nQhHfnD4/IW31JF30vsioQdoZ6fSkFONxWcOoovV8SZcLHeToqy/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFvcoDbiAUzD7FV79wvY3SpvrvC40rDq8zX7VbH67GI=;
 b=lC3mcS5zKYlwZVmm6nA1lQ8PEbEzzTD70Kr94f01b5NrzzIMpl00MG2AAybfTDFfdhfd4jBEkpfozkz9ZQCOm4841aXyCkFrYXYV5AWxfvq/ZFzZKWWPy8iXShyrJ0htbIS6S5xCtUjTVprjlYGzWtYTOzjdjO0aBUb+C1kRIFA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6432.eurprd08.prod.outlook.com (2603:10a6:102:154::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 10:55:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 10:55:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] buildtools: Add a replacement for file
 command
Thread-Topic: [OE-core] [PATCH 1/1] buildtools: Add a replacement for file
 command
Thread-Index: AQHbytjKLhIaxA1TPUCpYShGvUhb+7PelnCAgBRM9gCAAZeBgA==
Date: Thu, 5 Jun 2025 10:55:17 +0000
Message-ID: <CE4E6488-9EA8-428D-92CF-C803EFCFA414@arm.com>
References: <20250522051651.3711352-1-changqing.li@windriver.com>
 <20250522051651.3711352-2-changqing.li@windriver.com>
 <BAA25366-9801-4043-BC16-A8C2BF807543@arm.com>
 <EA4E1A7F-9586-49FC-A98C-C1407E6A5C4F@arm.com>
In-Reply-To: <EA4E1A7F-9586-49FC-A98C-C1407E6A5C4F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6432:EE_|AM4PEPF00027A63:EE_|DB9PR08MB6411:EE_
X-MS-Office365-Filtering-Correlation-Id: f4bf8b85-b948-43f0-2781-08dda41f89b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bnloaTFhcjVDdURaRW12VHdveFg0T0ZaTFA5dkxmTmNkSi9ob1pHTFhBd2Zu?=
 =?utf-8?B?bHRJeFZmK3Z0NEVxbVBxeEIxUklPWFp5bzBmOWRwdW5zTkl0WWZxZ1doaTlL?=
 =?utf-8?B?QWJOakFORXY5c2p1NWs2N1hXVUVxNXphdUhuaFRFUE80WEp5VUZ3cERrZnBj?=
 =?utf-8?B?VTl4N3RleFJwL0Q3U3EvWXYyYTQwMHVNby9STzRwWDhoK1ZxcWxIb21sYUY0?=
 =?utf-8?B?UjkrVy82NnpvSXluUkE1K3V1MnFvZSt1cUFMZkdaVDhnWmFjS0hyUHF5ejdJ?=
 =?utf-8?B?aGVaeFN0bEM5NDk3S2ZrYlo2WXhZSXZZVUl5bzV1Z09HbXhvWmJvRmVNZitT?=
 =?utf-8?B?RW85QnpYU2lyZUhTUEd2UmZZUVFCeGlhNlNycGdhWWJaT3JaQyswdEpRUzBQ?=
 =?utf-8?B?Q0wwZEFMWFU4RWRWaGdqbEQzSnllR0lUZTNvV0hTdVlZQlFHbWhmVHJKd2t3?=
 =?utf-8?B?N2ZzU1RjajFzem93WWJPSEZKTHVEaFQzdndsUStWMlBqdkRFcVhhWTIvL0Fr?=
 =?utf-8?B?cTN4cjdqVnpDWnBOeWpRTUJWbC91ZzkvNlFHZ240Yi9KdjJKS1VVdFdUUDJ3?=
 =?utf-8?B?VkZ4S01kUmt6ZE0weXlFcG5aWjREQTRobVQyRkJtbHFKS2NTMFJDZUJ0ZEZm?=
 =?utf-8?B?Y1FyS29BUVJXZUtGa01kVHNCSWliRUdJdC8zUTBpL3Y1UkJFdlA4b2IyR0xu?=
 =?utf-8?B?K2lVaUZsRHovT3BYZ0k5SUJmMmFtM2NwQkZ3NndnMzIxL2hEcm4vOU9QMm9i?=
 =?utf-8?B?WHkvMnpaa1JkS2VMbWt2cFl2N3RrM2ZLdlRRalB3YmQ5SGlBMi9pakYwWTha?=
 =?utf-8?B?WUFyTTBHMXErWXFVMzNEMlA1ZitnWlFWVG84M0JqOHppVUhWTFdhZGNwYnhQ?=
 =?utf-8?B?dUtJSGUraWpOTTdUVXJnamtsQ1VnZ0ZOejdIdFBKSU1BSXorZGJST3NqMlNJ?=
 =?utf-8?B?Z2dVcVBqSnEzZm92eW5oUUVndWJLRE56UFByK3FZVGlVNzY4MVJyYml4c011?=
 =?utf-8?B?S0Jlc09zU1V6NTJlQWpNbm5HQURmL0ZZanJMZ2lMYkI0NVVPUHJINkVLSTBP?=
 =?utf-8?B?YnZLbzlKSUJlK1Q2MDVDdjlwanlMTXRBZ0dIdXlnL0hnR3RpdE50V01qRmdk?=
 =?utf-8?B?eW0wV0JJQ2ZRUFVxY0diS2tHUGlocmUwU2hMcS8yNUJVMzkvczIvSnJLSnFT?=
 =?utf-8?B?RURBUFlyYkwwOXdlWmh4dEJxOU9RWGJlUnVCZ1J5QmJDMFRPa2tZblBCZVBw?=
 =?utf-8?B?Y0J3dElJa3EydDIyWDNsU2o0OVIycXBzczBKQUpSRlduVlNoNEpoMEJpSkdL?=
 =?utf-8?B?UTJ6ZG1HZDdLOUZ4RmRVbkVpZzFQVlhQU3pWRE9oaFU1TWV5Q3k3ZVBLWFg3?=
 =?utf-8?B?bzhTOExqcG5jdGMrdUFOaUZOTlRnZVdrODBHZnB6SnU1U0VUNS8wNDNWdStL?=
 =?utf-8?B?MG42Z2JDYUd5Y28xYUo2aVFiUWhJdHUxeFdTUW9jSitBV2dETUpJcUpYVm1s?=
 =?utf-8?B?d2d2ZFNYa1pFVDVIZEhkeGljM3JjZHoycjVtRW0xQlpRVWNWbHYrRUNIQnNr?=
 =?utf-8?B?MHM2d29KSFdKWE12TDdoV2VJc2FkamRUbit2TTExTE9lYldlZnVIZ1VhSUVL?=
 =?utf-8?B?em5ScStaclZQQXhhM0x2a1o1VGxwS214VXVDbTJRZmFudjdTWnNlazdjTldX?=
 =?utf-8?B?V2hQY2FMSG1SRXU5aU9yU0RVRUJpS09CVVM3QXFhWjNaQ3N1Uzc4cTVsc3Zw?=
 =?utf-8?B?UmYrdU1QYjU4ZFZJMmVyWmZYYk54NzlVbTBCdjlzTzkvZDZvcG8wY2x5eVkr?=
 =?utf-8?B?STJSZHVtZFJaY3ppaU0xUTd5WWlKbmViMC9uWW5pTm1RZDNUck5TYmppSXNM?=
 =?utf-8?B?Z1pUOXJIMUYwT05GWnlaVmppaGFCSEcwNVNwYlp1M0taLzNSeFNHM05DeW1X?=
 =?utf-8?Q?kfhjlvskCTY=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BCB332C54CA76E46AA1F8C02A315846C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6432
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	16307203-61cb-4bca-e55d-08dda41f759d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|36860700013|82310400026|1800799024|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c21mb0h0aSswSEdYVElxVWIzZlJuNi8zcUlpZlZ2WE5VTXR5YmY2UGxqVUNk?=
 =?utf-8?B?SlNkS1FxajgyYU5jTlBuci95eEtINERBVUpIdDhCeCtVVnllaDRGQ0lnNko2?=
 =?utf-8?B?RFJDUUM4blg2MDRaV1N1K1FJZEpTcE5PRnhlTENFNGVLSUJua1dDZEpoVXpQ?=
 =?utf-8?B?V1AybHdadkNsdkYyNUwvd2h3aTVUTitNdWllNVdoSlpkVmY1b0I0OHozODRG?=
 =?utf-8?B?ejhlVVFiTVczQ1hKcTl6WUlGeVpnYkVKNEsvQUVRclFxYVZmcUFBM2Myd2NH?=
 =?utf-8?B?YlA3Wm9oL1RQWTJTOVZySHE1SnlYU1dWN2pla01ZeHVZZm93OVpXOVlRM1du?=
 =?utf-8?B?U1ArMktBM1JMcHR2NDZtZUg4RU9aWUxQM1BKL3JPblByOXRXZFZHakRidTdB?=
 =?utf-8?B?S1daN2VSdmQxWmxJK3BKQnZub1h6TlNVK0MrbmE3T1QvOWdqdXZvd0wyTTQ4?=
 =?utf-8?B?YnZLc2toU3lmOUxYd0VHYzdXODlZN284RGRMQk54bS96SnVxK3BzVGNxV2tB?=
 =?utf-8?B?TGcyWVBncWNvdDFTeWlid1BDUHBmU2RuRWZkSXo5UE5vSjlNY3U1Rk5ZMHdG?=
 =?utf-8?B?UG9HTjFaMU5GejBRcWpReTRyRkZqTi9YL29ibGVXNTB1WVJpMEdUYmJCQkly?=
 =?utf-8?B?VnBZckJOWFZMek96VU5yZklqQ2xZUWRqSVRleUZUVEd3RWwrYVM5L1BzWk51?=
 =?utf-8?B?akNsNWUwd0k1QXFnS3haWVpCczlxVzlEUlZ1S24wRjJOV0tvZVc2WG8rT3Rw?=
 =?utf-8?B?eVFJVzJpQktKYWtmYURBMFZ2bENZZFlQbHRQOWdkVlcrMGJYc3RmYnZGajlh?=
 =?utf-8?B?TXI1djZBa1Vnenk1Sld2OEpXZi9kdnlzR1hmRTd2QkNlaXJNdWRDMC9xOFJW?=
 =?utf-8?B?MjBodGVqa3lya09KbXl0SG5qeWUyZzhUbEFHcVdMdWNZN2tVcFhOT2tWYis1?=
 =?utf-8?B?L1BlUitINkEvVkFxTWNjRU5wU3JleEVhNEZxVUtRbkNMcE1XLzIrUzRkV3c0?=
 =?utf-8?B?SUxydmRwck9sWjlLekhOV0hWMlBFMlAvTHhSSDVtQTRtelRIUkczL0htaTZj?=
 =?utf-8?B?Nmh6aFJ4cXZNODAzekdsbWVKQWw1UlliZTBuRnlHelNEMnZJQzN6UEhMdkxZ?=
 =?utf-8?B?RFhOWG0yYmxoR1hDYjhVcGZNL3V0Q3hBc2JIbUhOemhoTHJHN3o1REFIcnpl?=
 =?utf-8?B?UWNWSVQzWFBoSnhhTjNic3RESVhYVEh0RDV6eE1CRzZJRXROSkQxYlM1TCty?=
 =?utf-8?B?dGg1SGlIQ1NCaHJ1RnBCcE0vYU1abVl5R2JjVWJVSVJxa0JvajBkajA4T1Ju?=
 =?utf-8?B?UUx5bWwvYThHTEpNZVpmK1UyTTZqVTYwTUlSNTBkOVFobGZzUzhqRHR2eG05?=
 =?utf-8?B?SzVqMXBwUHhHN3g2SlYzN2NUUHF5MVdWQU44NTJDc2V1bkVvbFZiNXFLMkdE?=
 =?utf-8?B?a3FvUXZXaTF4UmpGSkRNamdtR0pVaTJZU0VCZEE2NXYrNzd5b2pXZkMzc1FN?=
 =?utf-8?B?cnlXcWdLbkRNSG9ocjVzWEVUM3BaamJ5ZXFUNzBMV1dIQjhQY1llNGs3dlND?=
 =?utf-8?B?Yi8yc0YzMWVTQ3ljR1lISTl2Y1c3Tm9icjlOZFNUcGZ4ZXVERUxuSWFxME94?=
 =?utf-8?B?bUt5TVZEVU5jdXlHa1RsTXh0bmhjWVdqU0R0dWhEdVN0MThoUnFwdFNPb25Z?=
 =?utf-8?B?VXBSNk9HZGlmbWhZeGRaTU1UVkhzZ01Yc1EvdUdrc1lPNlJhcTVqL1RiOEN0?=
 =?utf-8?B?RThiaXNhQ1B3cHNBZHFrTGUyaFQ0NUxvRU5IZ2FMTTBlUHFKdXRvangzU1JP?=
 =?utf-8?B?NXFuREVzcTFteW1sc0V5ODRxNTk2TDFPTzd3a1dEaDB1NzdJWUpQRW12eUJG?=
 =?utf-8?B?ZStkTU11UDU4cGkxOVdpNFJZYkcvVStpVkJBYW9ITVdTY2l2MHZrMWpyc3FL?=
 =?utf-8?B?ekZqaVNYRWpzaHAyMmhld2xsZ1phOVFTT3NLQ1ovbk9nT01pMTlZVnNKcUI5?=
 =?utf-8?B?T29scDA0ZFp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(36860700013)(82310400026)(1800799024)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 10:55:51.7260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4bf8b85-b948-43f0-2781-08dda41f89b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6411
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 10:56:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218003

T24gNCBKdW4gMjAyNSwgYXQgMTE6MzYsIFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29t
PiB3cm90ZToNCj4gDQo+IA0KPj4gT24gMjIgTWF5IDIwMjUsIGF0IDEzOjM1LCBSb3NzIEJ1cnRv
biA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiANCj4+IE9uIDIyIE1heSAyMDI1LCBh
dCAwNjoxNiwgQ2hhbmdxaW5nIExpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxjaGFuZ3Fp
bmcubGk9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiAN
Cj4+PiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPg0KPj4+
IA0KPj4+IEZlZG9yYSA0MiBoYXMgZmlsZSA1LjQ2IGluc3RhbGxlZCwgYnV0IHRoaXMgdmVyc2lv
biBoYXMgYW4gaXNzdWUsIHNldHVwDQo+Pj4gd2lsbCBmYWlsZWQgd2l0aCBlcnJvciAiU2V0dGlu
ZyBpdCB1cC4uLioqKiBidWZmZXIgb3ZlcmZsb3cgZGV0ZWN0ZWQNCj4+PiAqKio6IHRlcm1pbmF0
ZWQiLCByZWZlciBbMV0sIGhhcyBmaXhlZCBpbiBbMl0sIGJ1dCBub3QgaW4gYW55IHJlbGVhc2Us
DQo+Pj4gYWxzbyBub3QgY2hlcnJ5IHBpY2tlZCBieSBmZWRvcmEsIHJlZmVyIFszXS4NCj4+IA0K
Pj4gVGhlcmUgaXMgbm93IHRyYWN0aW9uIG9uIHRoZSBGZWRvcmEgYnVnLCBzbyBJIGhvcGUgdGhp
cyB3aWxsIGJlIGZpeGVkIGluIEZlZG9yYSBzaG9ydGx5IGFuZCB3ZSBkb27igJl0IG5lZWQgdGhp
cyB3b3JrYXJvdW5kLg0KPiANCj4gVGhpcyBoYXMgbm93IGJlZW4gZml4ZWQgaW4gcmF3aGlkZVsx
XSBhbmQgYmFja3BvcnRpbmcgaXMgaW4gcHJvZ3Jlc3MgZm9yIEY0Mi4NCg0KVGhlIEY0MiB1cGRh
dGUgaXMgaW4gcHJvZ3Jlc3Mgbm93OiBodHRwczovL2JvZGhpLmZlZG9yYXByb2plY3Qub3JnL3Vw
ZGF0ZXMvRkVET1JBLTIwMjUtNGZmZjRmNDFjNA0KDQpSb3Nz

