Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A13CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 16:13:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22070.1764259991413453942
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 08:13:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GUs7xN0k;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GUs7xN0k;
 spf=pass (domain: arm.com, ip: 52.101.70.27, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TFA1MazxQZSGiH8hQvL6YleyjXzUZe+RStNRF6EqMJzj//K0cd4ibWtxI851kfdlf4grM/uXqwfYvvedUES8IkpCgFwgyRYyCw0sBSOhSvNWtsrvBq0VFMDJQK1Z6w2MeobCJo8HqlUCfHi/3XrfFwoLqilT65ZGzGStHXQu2fDpTMOx7XX/i2ZaLq9mBBhjoEm+c4/S3vQSIQN0kQjQ6JvomQam9IWXoibTDe8j0eHXRkC22b5shqN0UstZ3zMtcn2YkMlWRJJk1u3/WSX6kPbXWvveTLI1R39srKaZKVjdl8vjkK9rNL8+kPXlUVCOT0zDXKWvY6/ik4gJPMKi7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP0o2lTS65yc8mjPvCXcd5C2tyIAV3Qms+4hRk0ZSp0=;
 b=bjdGv7NUNrmUNhj5ZE2xo3qm1niA30A0wUXhW4B9Dn1vzj7xiekOXpxg8rSbw7V2WTM/9dRGL9ZcHGR75ozr+LUd9vMJL+jmyfw6iN5BFyFugKTRMaHbrSBmcVZSMRo5LHDqdO962Z3cvSKihq0wWUj640f2h6Es5OUuMxz+RdmR3m0OpvhIjfHh86kEN1KaESqBNdfP9djUPpifsdin9iwO4w+NWvF1VbfS7yiucxycNEaHkZw33WsWJKnzWS0kqZ6EYE+FcTEVCOkj/6PA5Co2iwTDQ7sFzrx8XYsyfvO013y48JoyF+jxgz2L4dNZtoxudDskQDN1YcxIOLvdQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JP0o2lTS65yc8mjPvCXcd5C2tyIAV3Qms+4hRk0ZSp0=;
 b=GUs7xN0kk1yOYEtfDRXaeDDisbOlZSYGfTebi0rLyQmCyBATIuahXcsCYF0UWSs2ZFxInZcKdCKdfMw8JId/BpWb7VnpZlK/syaZu8aDR+VucbqY6MQtJttnSRdap0oFYvgIkX01XLK6hfhOuZjqT9RP0R4zDmXPrYeBRoFTYzk=
Received: from AS4P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::10)
 by DU0PR08MB9002.eurprd08.prod.outlook.com (2603:10a6:10:467::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:13:05 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::c4) by AS4P190CA0034.outlook.office365.com
 (2603:10a6:20b:5d1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 16:13:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Thu, 27 Nov 2025 16:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuuITmc/JUiHb4eaezxeTEBIw4n2AfAkEvpkSQYND3aOgbI/C1wG7NGjjeUCSMFXjF88P9rardpEPSZskUTMc8NXW0i7L00OJV3nbqaQJuX14mQEglB7K0woH3j0fz1lIRDmpVpvH4vbp+HPyosFl3oArhC1rK64nQQdqNmZTdvYpmAc6VKPy8AdR+I5E1+AYFHso6iOmyHInJyj6SffHzr8z1SiDZhsXuL15FXkw6HKZ2EuRRLHdshj4LYpqaHeNDYv0ze+yNZ/eVcw/vO41q1j/gM4Yc8MyTgqDsfDdzT3lYsT2S717iFO7fYAN8zWNdIyq6CISV1FoHU1q75Uyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JP0o2lTS65yc8mjPvCXcd5C2tyIAV3Qms+4hRk0ZSp0=;
 b=eP0WYbTGD1MSCmIIecSSK4roRr+iHqfEUJswyrG3GEHXM/DicfhAGoK+SC9luKn8lKwBJzXpQS3Vi4tFyhPc84o1uBNnGw9f9DZ2OkKxb9ke46ItdDbuMK7xGb2gs4N/KFAyu01GPTSEM5yGUXsNf7qDI4jb+1ECkJVBQvQckv26kR2+FSD6Amm1S0nWsSWZz2drAXIwrFmWvqMVSuByaa4Vl/MHk49BP1qaLfUgvx+hUdUZ7wwyEVa6oKoTpkHgKJdHetdvnhirzpDZDoHhP/YYKHxs3fpcWXLwtxFzgw8No+ybr000G8QdiF+sP1FViM0mik2Z5KKmipDQZV+Spg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JP0o2lTS65yc8mjPvCXcd5C2tyIAV3Qms+4hRk0ZSp0=;
 b=GUs7xN0kk1yOYEtfDRXaeDDisbOlZSYGfTebi0rLyQmCyBATIuahXcsCYF0UWSs2ZFxInZcKdCKdfMw8JId/BpWb7VnpZlK/syaZu8aDR+VucbqY6MQtJttnSRdap0oFYvgIkX01XLK6hfhOuZjqT9RP0R4zDmXPrYeBRoFTYzk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10759.eurprd08.prod.outlook.com (2603:10a6:800:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 16:12:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.009; Thu, 27 Nov 2025
 16:12:31 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/5] libxcrypt-compat,libxcrypt: upgrade 4.4.38
 -> 4.5.0
Thread-Topic: [OE-core] [PATCH 3/5] libxcrypt-compat,libxcrypt: upgrade 4.4.38
 -> 4.5.0
Thread-Index: AQHcT7VgK1n5vl5pjk+3yZMsOgN4obUGebsAgABXO4CAAADXgA==
Date: Thu, 27 Nov 2025 16:12:31 +0000
Message-ID: <E93BD7D5-D4E9-44D8-8F78-BFF8FECAEAFA@arm.com>
References: <20251107070819.3751599-1-raj.khem@gmail.com>
 <20251107070819.3751599-3-raj.khem@gmail.com>
 <7B947F4A-F020-4AEB-B311-22B5444845A4@arm.com>
 <CAMKF1srnVxnBEgEPKJ=WoEt5ZmMyME2hyC3uew4yuxj-5u=eZw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srnVxnBEgEPKJ=WoEt5ZmMyME2hyC3uew4yuxj-5u=eZw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10759:EE_|AMS0EPF000001A7:EE_|DU0PR08MB9002:EE_
X-MS-Office365-Filtering-Correlation-Id: 6db0763a-8e22-4679-23a5-08de2dcfd8f7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TUZhSzdVVmdUSTIyNHp1NHk4eTVXZm5xMVVLVzRvWjRxVWJRbm1HUlF3RWNB?=
 =?utf-8?B?bTh4VU8rWWwyWm1MR0ExTHVpWUVOTEFMbWlaZEk5cE9raU44d00zYmtZMHZo?=
 =?utf-8?B?NHBHSTdLQk9hY2JmN2xLYjVqWW4vajdkT2JHWVFkQ0FPZFloREIzU1lPTFB3?=
 =?utf-8?B?M0J6RkRrVkVGV1RvZjhNQjJ0QVlpRU1LSG02RmN6ZHBiVFl3aXR1SUo5Rm1y?=
 =?utf-8?B?a1JpUHBUTU90REx6RCtSZDJBUXhZdnRiMzJML0VuUURBeWRBN2ZVdG1GeERy?=
 =?utf-8?B?V0loZHZQcnkyNHVZenZmTEk1ZkJtRGgyd2dkS21KMDVuTHUvazlER3ZaOWdh?=
 =?utf-8?B?NTZmZ2UrY3BTTlRZSnhPTW8zdzVKTGRveUVBWlZneFU4ekZNYWVpTDExeGxu?=
 =?utf-8?B?TDZlV0NKcE1TclA1bm05K2x2WFoxcjhGTFJMTDNqS1EzeHJrVVFuYmI4VEhQ?=
 =?utf-8?B?N3RwVEZ3UmgvczFMRXdjb3lmSkhwb0NObnJJWGR5Zi9HQUlQcGdjVWk5U3Nw?=
 =?utf-8?B?ZDZDenp4MzR2dVc4TlViNnNwQ0hYdWRJL09QZnNuNm1jQXVpUkZKVm1aYzYx?=
 =?utf-8?B?NG1tK2xFaW82RVJlWGM0WDZ4TGxBUWVkUW1hblhqbTdETGZ4Q3JaU3RmKyta?=
 =?utf-8?B?U0xIYmFyUUUreCs1enRwYkZsZDYxSGdOQ3RySE8rY0RpNkxmQ21QaXNOblBn?=
 =?utf-8?B?c0M3UEpzVHhXODUzOUcwYXhScnVoZFZXaWlpbHdhbjRpdGxaUEZFK0FWczhv?=
 =?utf-8?B?YlBHT1puMHF5ZnNXTmlqanJNWVhicElWTDlhMjJxUTErZWVOa2lUekE3WE1K?=
 =?utf-8?B?N2IvS2NhRkt2bzFjZ2dmMktObjAzcW1MMGVIbVF5aDJ5S0NaR21zZ2hKSG81?=
 =?utf-8?B?OVM2VGVlNkZpWmFBSXdSdFdFR25CbG1POFpCRS80Y2RFU2ROV0N4U3U1cERT?=
 =?utf-8?B?b0lZSXA2ZkxCb3QyZkdZRlhnemRUbDRpSGMrdVlBMDdodmprKzdIZVJtWWFj?=
 =?utf-8?B?cGZ3bXVPWThpb0tLOFQ4ZUNjb1lHbzdTaFFYU3d6TVA2bWE2dW0wamdmSWw5?=
 =?utf-8?B?WFhMRHZERE5uanZNSWQvSEpVd2s1cHF4OFNzQ1FGSGtDSjNUYUsxdXZnRGsr?=
 =?utf-8?B?S3dlNnBtOXlrenpOcTJnQXp3TzNWVkk5WnRCMGkzZWtDQVY0VTgyalhtdkNY?=
 =?utf-8?B?Q3hWODZFdjNaRWFUN0ZVUjBxcUxTdDArMlY2V2lNTXN0T09PVnJrMjhtY0kv?=
 =?utf-8?B?cXdsL1dTVjh3dzRvTThTemlEVXFoUVNWa1k1anpBWFVFSmlMTXdkdldPTXA3?=
 =?utf-8?B?WXBXaExSR3dGcytUMnRVbko2Ylp3blNJRUh2dm9NSnp3NGdDL0pSMWZWenlB?=
 =?utf-8?B?b2pwTWpjK3d6VjNtRlIyLzFQR3I2c1ZQOUtla1A1REtGdHpLVVU0QkcxMVRn?=
 =?utf-8?B?TVFSUUtBWC9YRGJHM1MvdENPSEZwS0s4RFRiclNROURwQkprUnVsLzEyY1Ur?=
 =?utf-8?B?QlNKY0NtMjBqRzk5TW9LTktGeHNjTExqcDUrM2tTRnlqUG9VQk1yWEtqd1Yv?=
 =?utf-8?B?NFNpZWVycyswZkswMGFWM2l0MzJpRTN1UlppcU5UME1LWGZGMk41czV5ZEZu?=
 =?utf-8?B?SWpNRUphMmdKcUNqaTMxY3kxWUI2VVI5Ny9LR0xQcnN1cTlZdUp1dVBVSGxt?=
 =?utf-8?B?ZmEvWS9uVGNSOFByR214emRCUjFVL0QwZkxKaGxRSUo1YTRHQnVGY01QQlY4?=
 =?utf-8?B?Vm1hTnZaMFZIUHFjbGVVSjBIWlFPOVcwSlNrc3BWWGF6VkszU1J1TG94K095?=
 =?utf-8?B?K2RqeE5GREs4WlJiUzZjWnVKM0MzLytXNU04RHlqU09tQTRKNG1uU0xCeVFn?=
 =?utf-8?B?M24xUlpmUWhqMzhOdFh1Sy9sazF5WVM2K0xsbG5Kc0Faa2NldkZaT3M1VCtE?=
 =?utf-8?B?aVcxclo2anprQTFVUkJvR2syZ29zem5iM2FYNlZpSDkxeVU0UFhJU3h2aUxS?=
 =?utf-8?B?eTBtTXh1OWREVkxoTmQybkdkMUJUTFUxUmlNUmRCcTEzYzJBMWxsU25qT21M?=
 =?utf-8?Q?S32iw0?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D315B6591D9CC4F84DDD14725DAD86B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10759
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3c0f6981-507f-40c2-d22c-08de2dcfc4f4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|376014|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cC9MVlJZM1crT0VYVzV2TnMxeFNyYnU5WEhQZDMxZWQyYVUxeERPcEtmTUg5?=
 =?utf-8?B?RXAwMXZ2UmQydXhGOXFaV0JsM0c5d2pVU1QvS2YzKy9ER24wdTNZNUYvTno1?=
 =?utf-8?B?blMxams1aVpVejl4UHZ0ZUZ3aXhNbGFOTElOcjhIMlRkZ3J0ZXBPRVNicGxS?=
 =?utf-8?B?NVc5eFZFTFhYNlFIU2crU1BHNXRSYndrN0IwYnhnODIxSnJVK1pYaWkreDhz?=
 =?utf-8?B?ODNTV21GdldNaFFDekFpd3h3QVF1TEszV3JzaE1ET01naVltQWZ6N21CRFQv?=
 =?utf-8?B?RVdmOE1uT0RqV2gxY2c5cGNVeGp2d2JxTTJJSC9aZEpqRkJid2hsTmhHNk5v?=
 =?utf-8?B?YnVXUWt5ZXZ0clU5aDFOTVBVZmhwZHZNVnJ1WUZYTWh0dllpbndiZTdCUTh3?=
 =?utf-8?B?TDkyVGliS21LbTRjMFJySlVNQStDckd3b0UrYzZ6TjJzaUltSFJ6dmxpeVhp?=
 =?utf-8?B?VS8wTE1jY1hmWU5EOGhSZ0VvZTVuVzFId3dRL25jRmdidG1RMnY4aVJJMFdJ?=
 =?utf-8?B?Wm1tOTJ5RXkwVkNzbkpYREhzMHdGZUJvUnhUdHNUUmtJNXB3WDJJbWpqQXEr?=
 =?utf-8?B?dktaVUNuQzJGd1M5QXZNcTVqNlJGdStoT2RCbkRyWkRXL2t2Qm5wR0tvaElM?=
 =?utf-8?B?MXBIQnpIc3FKMUtBWit0Vm9VdGhtRXJReHVVT09EL2luemNFUVBlQnljK2pU?=
 =?utf-8?B?cWdwMGZ1cWpsMjhrT3dxMEcva1JqVXd2WlJhVVhHaUFiY0tHV2FubTdjSUw0?=
 =?utf-8?B?WCtYbGxieWxFNjJtY25ZK0YrWWk1QkNITHhRSU9GcjIvV2Z4amN5WjRIb1Ft?=
 =?utf-8?B?SkRBaFRKbmxLR2J1TnY0MGZOZE5Ea3YyZGI1S2twK2JxWnVtOVFZNXpSaW9H?=
 =?utf-8?B?SGRVbDg4MFFFcDdieEJOd0lqYXVxZzJScThWUTBMRXpXdFdVUFduWTJLSjRU?=
 =?utf-8?B?K2VqSUo4WjU2RnZNc2N3QU5OLzJWTGh5c1AzUjViS2RoU3VubUJFdko5YTUy?=
 =?utf-8?B?UmJHcWFtODFzVGFFU0pTcUhudjFvdjlocHp5Zm1NYjhRTHQ2Mmd4VDZlVHVE?=
 =?utf-8?B?b0dOL3owR1VaZTNwb0tFcm5Qem5EWDhnUTlKQ0NDbUFqU2xsTDhVTVJvdEI2?=
 =?utf-8?B?UmlaZ3BBYXZIZnE5OTl1NUJwL2NSOW54dGloTVZIeEVqTndSTHhFR0lOYXpt?=
 =?utf-8?B?bDBBVmlJblJoUDRrenVtcFc3UGtMM0Nqa3l0eFE1cGQySVdhMWNYbzltYm9y?=
 =?utf-8?B?R0pKZnFYOG5lQ1c5RC84amdjQ2oxajVFa2VtQXBlMWNXaHQyeCtsOVdncC93?=
 =?utf-8?B?T2lRUmhxb0V0SStpT09vZGU3QzlQQk5IQW5qeXM5K1FxaDRkMmlkMm1BbFRa?=
 =?utf-8?B?NGNDcXVlc2hNbDV0QXVoUzloTjZORGNWMHB3Q3dmUERmS25MZUJ2VUtqV0NY?=
 =?utf-8?B?REp6YVlMZHU1MkJibnpIYUI4ZVZxOUd1b0UrMjIyQnZkN05GdWNiUXovUGwy?=
 =?utf-8?B?V2dQeDJOUnpVci9QRXpTejV1Vi9NdmJwVHFlbjdSTFA2bkswSXBHNTRRNXlt?=
 =?utf-8?B?bWJkNnBhZktSaWZrcGgwZEVBRzNXWHNsb0E1TkYzWWF5ZXJBVHQ2SThZNDNE?=
 =?utf-8?B?d3JmVDJaMmJqQ2djTXZCZnRlTTNoZjM5RHYrVWU4NVYrZnRpZGRrc0N6ZlBT?=
 =?utf-8?B?bHQ1a2U5V2F4NFE2WCthYVpkUjJkREtpbWN3WmZIQ3NidVFvdGg4Yzg2UGdE?=
 =?utf-8?B?TEJ6cWc1TXhnY2pWWVU0T1lxZWVwdEFuOFRwWGNGS3dPR1NvYzMvSEhaY2k2?=
 =?utf-8?B?TGdsWDlMVnpWdlExZm1WaENUNXRETXZkZ3hvREMxNzArV3FsK1hVY0J3dlFM?=
 =?utf-8?B?bnZJdTQvbkVWUDF5NGNTVjJBdDlOc3hENDdjajY3MDA0Z2hzTE0wN1FKV1RJ?=
 =?utf-8?B?VzBrSDhnMkhic0lyOUgrbHNadzdUd25Hd3M5bUhFU25FUDJ1R2dEeDM5cUVs?=
 =?utf-8?B?cmNvckxsYmNRNTkxd2tkeTVhb2ZIT3ZJMlB2Tm9XMWhMRzdvcE9BQlRHSDRI?=
 =?utf-8?B?b2pyWkhQOW5GUmFkZ3BkWGVseFBGMkMrRWxzR1NpdVF2NGE3RnI2Z3hQQ3Za?=
 =?utf-8?Q?vvks=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(376014)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 16:13:05.4377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6db0763a-8e22-4679-23a5-08de2dcfd8f7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 16:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226848

T24gMjcgTm92IDIwMjUsIGF0IDE2OjA5LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IA0KPiANCj4gT24gVGh1LCBOb3YgMjcsIDIwMjUgYXQgMjo1N+KAr0FNIFJv
c3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4gT24gNyBOb3YgMjAyNSwg
YXQgMDc6MDgsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyYWoua2hlbT1n
bWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gTGljZW5zZS1VcGRh
dGU6IE5ldyBzb3VyY2UgZmlsZXMgYWRkZWQgdW5kZXIgMC1CU0QgYW5kIEJTRC0zLUNsYXVzZSBs
aWNlbnNlcw0KPiANCj4gVGhpcyBwcm9iYWJseSBtZWFucyB0aGUgTElDRU5TRSBzaG91bGQgYmUg
dXBkYXRlZCB0b28sIHJpZ2h0Pw0KPiANCj4gVGhlcmUgd2VyZSBmaWxlcyB1bmRlciB0aGUgc2Ft
ZSBsaWNlbnNlIGJlZm9yZSBhcyB3ZWxsIHNvIHRoZXkgd2VyZSBub3QgbmV3Lg0KPiBMSUNFTlNF
IHNob3VsZCBiZSB1cGRhdGVzIHBlcmhhcHMgYnV0IHRoYXRzIG5vdCByZWxhdGVkIHRvIHRoaXMg
Y2hhbmdlDQoNCkNhbiB5b3UgZG8gYm90aCBpbiB0aGUgc2FtZSBwYXRjaD8NCg0KUm9zcw==

