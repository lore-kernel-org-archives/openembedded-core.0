Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC60DC61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 12:45:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.61])
 by mx.groups.io with SMTP id smtpd.web11.11973.1749732345899928565
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 05:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MX2C9r83;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MX2C9r83;
 spf=pass (domain: arm.com, ip: 52.101.69.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TbgCjbf4ctTsF2oGI4jxIgo6NYcmB9CBR9Ymkmm7byBwS6w9VeVVV7+qBmpeDcpKofcmraN7Zj/f60eOtKJecky9YwAkiDg7XzVylfeIS2+VYCeJiLNLC3W57LsJcJW4zgrmE+XOGceECO7y+d9OQ63VIkNfz8SwTJp/kcYm4Nj9JSvhmP+HgP5fZPc24OMHSobddvR6MQVxyEsfEXqW5wddkTuy0FBxR4f7afqSuSCZNyC5uSJuzplMNBs5jixozRxa40sT5fcIUVuBJmhu/vgZhxrl7Cmj2OtVpbQuhH4mrS4rmeHz33ikOc8yPGavqcWYyr1vdQJGSBkfg0o28w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SBi+xrBvrC9NQRBlFZVvRExF5FifKS5zybw2ZjSw8M=;
 b=my/iep1B3KqhevkDbphRoD5xcD+QL7RVbanZqsOqIGVPUHah/HN5eVv68rzrl+/9NJF2brKbQVMBI/5GAQNh+s2UDid3KZTqE1z6FCJU8kYi0VBnB3ITjun29IRg1kWp0dsIijXuvarCErXEponmcyEVbHrbDxB3cR/pCw6U0VmtmWCp9r0WaG1VgAUUlT+ec0I/F76D2LLx5E13dS1YbgH+RQnqWY+gelwDIfgV/iJNH5N4Xwigq9JtZqhIkEkTOUCvOm4FaOIeM4bGNlWLGVYJPkFrKMTsh3JEkrcXEgoaoRvvg/PG8EgpTHI+u7y1haYR7ZQVkv2HOnMuznn/nQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SBi+xrBvrC9NQRBlFZVvRExF5FifKS5zybw2ZjSw8M=;
 b=MX2C9r83JNEsQpjxkLxGaHAYzjbtDule36w5aX65lf4C6jpBBGK4bLzdhk7s/+dBxbBvhe+iaC5sTK5ihgCaaarSSTa8a4uVfREEhJsp/5A/T3l5oxW+WBAbLzdeNwpPAZMtBZADjfwDzdklDpeMBvsnWgVNw8phzaH8tUbd7h4=
Received: from DUZPR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::7) by PAVPR08MB9884.eurprd08.prod.outlook.com
 (2603:10a6:102:32f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Thu, 12 Jun
 2025 12:45:42 +0000
Received: from DU6PEPF0000A7E2.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::5) by DUZPR01CA0044.outlook.office365.com
 (2603:10a6:10:468::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 12:45:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E2.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15 via
 Frontend Transport; Thu, 12 Jun 2025 12:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHUzMaXqp2lC7FJCzpEGouVwdJpWFVvPE0p24oGyp20v2UwkAkYAwdJo4QZGGAtntANEQE8ClsMvR/24jBOPN0hzIZqnob9tp+SQNBS/tQjDrPrL/OWvKNL2452j/BLh08vQCCVf22lELmB5iNLah927xqcnPbkvHizwq6dbfYO3zDkS6Ovz87hdgV/3j78KZWKDP2pqapJFrc7b+G9NM1mGktsvPUOa28eWdRP8qjwm6R1xQt/WGVsQEyjLGN/A5Vq0BLSSHHDrqGS/lMeRspavjJdSCKN1oXkqHxC2VwOieOUPFhre6T3KlPb3Jpgs1x2UsWibngHiAiD5acx6Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SBi+xrBvrC9NQRBlFZVvRExF5FifKS5zybw2ZjSw8M=;
 b=PZVUA8i+2VeKIcC3f4FS6VeKonMn9euhN9y2rcQg2tk8wQOBAgyfMu3OjQzJbT8qQO2hrFWmBFcBNGtVVXE8ZrIdvo/DbEvKd2Ul0Yyn7rSwXQvY9n2OJiZUgKlHjUFXw1pXSdKd4Li6u2N+2gSwtcK2CQ3wSoib5z25VafiQxhcGrPHqR6ZX/BWJuQmTi/jpM2Ep0RYPsaB7YP/wkzKHogo4SWcv4FHg8p0VfnmMlPgxLKxEwdbBlI46KAe1baAvnYvjPkpWyPSKYUJ55FDtYp7y81TQfSzCpklpZHNMhH8aEzt8iEC20W65Ob9O8lvh+XvxjcWvaPhc6V/rnUWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SBi+xrBvrC9NQRBlFZVvRExF5FifKS5zybw2ZjSw8M=;
 b=MX2C9r83JNEsQpjxkLxGaHAYzjbtDule36w5aX65lf4C6jpBBGK4bLzdhk7s/+dBxbBvhe+iaC5sTK5ihgCaaarSSTa8a4uVfREEhJsp/5A/T3l5oxW+WBAbLzdeNwpPAZMtBZADjfwDzdklDpeMBvsnWgVNw8phzaH8tUbd7h4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10781.eurprd08.prod.outlook.com (2603:10a6:102:3d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 12:45:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 12:45:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Gyorgy Sarvari <skandigraun@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] weston: upgrade 14.0.1 -> 14.0.2
Thread-Topic: [OE-core] [PATCH] weston: upgrade 14.0.1 -> 14.0.2
Thread-Index: AQHb1xS9aZxt99ZwLkGOvMgidXGjkLP/W3wAgAAA/oCAACT4AA==
Date: Thu, 12 Jun 2025 12:45:08 +0000
Message-ID: <D47EE67C-BF88-4506-8D9D-A1BBD670A25B@arm.com>
References: <20250606185625.4087714-1-skandigraun@gmail.com>
 <5FC76FC6-42A3-4AE2-92EA-6A0CB2A8BDC5@arm.com>
 <8f3c3945-c413-4d86-987a-d0337b815edf@gmail.com>
In-Reply-To: <8f3c3945-c413-4d86-987a-d0337b815edf@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10781:EE_|DU6PEPF0000A7E2:EE_|PAVPR08MB9884:EE_
X-MS-Office365-Filtering-Correlation-Id: b8951683-fce7-431b-12c3-08dda9af0a9e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SU5nTHFFbkZSczk4UlZTdCtDVWJrdGRkckpHc0c5WjNHcktwL1lGbUx3TCsx?=
 =?utf-8?B?bkFqemRiSmlzWTh0Rm5nTGkwZ2MrK3FLTUYvaHVVYWg4bE9nTWN6UGZrSmdz?=
 =?utf-8?B?MnFLRlNHWmliVHVucEFKQ0FaRVBZWHVUbzhEZzBIelpBcGRXdmRwSERoN2VF?=
 =?utf-8?B?UWpMOUZveDNzLzFYSklkRitPcDNCZWNIeCtZZTdXN050VkdGK2pqekRFckdI?=
 =?utf-8?B?MnBKTzlQV1ZCY2ZmTEZUZTF5Y0M4TlpNcUZYQUhEVTJWcG1UR3NuUDZReDdY?=
 =?utf-8?B?bmtrSVNNQlByZkRpa0NKWjVKMmZseGVPcGdGS1o3ZytNaXlwQWpqcGx4bGxY?=
 =?utf-8?B?ZG5CNnF4NmdiU3NIOUJQVGc2cmh5QzdRTDZ0ejlJeVNUblVNS1ZyN3JpVHc3?=
 =?utf-8?B?b2hhMmFta2JERXJCTWt2U1BKR0xpS1Nlb1VVWW9PTVM3VUtrb2dWZXRYVDNu?=
 =?utf-8?B?RHFNWU0ycERNd0lLQXZ3YlBlcW1kQ215b3IxRFUvaEJLM1NSSDY2MGNXVjlz?=
 =?utf-8?B?RzFIVER5bnJybVJBa2ZrM1RUM2h6TjVuLzV4eGtGTFBNd0FWRndzTXNZQ2V4?=
 =?utf-8?B?TlNLNWNIdWFqSUV1eGRad0V0QUJUdldoYm5TODRvQmNxYkNsNzF3UnV0bjhj?=
 =?utf-8?B?ZVRhL3BiQUlqbk8wNm1ONTlHc2xzTEF2aGtXbldJQmxTOThWMzJqb0RpQzE4?=
 =?utf-8?B?WHBGL01YSnFzc0ZUbGk3ZEo0Nlhpa2dCaEpJN3F4RUFFbXpiczdBZEJkOWs5?=
 =?utf-8?B?eitFVllRNjVteXRZaExXS0M0RjlMZHhHKy9tdlVEZ1NSSjdhNWNtSHprcHpN?=
 =?utf-8?B?dStRUElUemNPSmxaMWZYSElkV0xoSG1ibU96S2lzOWFDdmhhWjFCWGFNQUJq?=
 =?utf-8?B?bS9ETmVDK3FVRHVFVEpydXpGU1ByamlDR0Q1YzZCL3U1ZkxlTzRxOFFhUlN5?=
 =?utf-8?B?c2tjbTlKSnNHQ1lHZHpnaGRzZ3E2RWk2R29lN0c4ckRBSlZRcm1ua2c3R3Ex?=
 =?utf-8?B?cG9zUklyTFRTUW9DbUk1bzdEK0hlWFozVVR4VjRFOXJOTU5zR2w4a2diQU1Y?=
 =?utf-8?B?bzFrQXhibExMN3NQOEJhemJKYzV0UVdzVXdZbThlUHB5eVdiaEJzei8zcHZ0?=
 =?utf-8?B?eFl1V0lhb3EvYUg1aXpieDZ6N0w1TitqNTJ5NERnc1VQVkV6UDBMSkRPdjIx?=
 =?utf-8?B?QUNaVGpjclpkN3hsZTlzd2ZxS3ZReFF5U0dmcTlrMUdLQ3B4ZFMrRWVRZGhs?=
 =?utf-8?B?TFJqOG5ZM1AxWXV3eFdNM1BDTjlpL3ozcy9ib2oySGIvc0hVVFRGOE41UHJt?=
 =?utf-8?B?L1ZhdVJmK0Nla0x3b1VxRHNuZExDOEx0NEg0TTUyTlJLd2twWUxGamRLSWZ0?=
 =?utf-8?B?dkZaa2g3TkdqRXBROFFRb2gvWHZiQ1VRNWN6R09RakZJU1BOaWdvUWpvTXNt?=
 =?utf-8?B?Y1MyMnZvS0VBY0tPUHVmOHNZRzNjRWh0dXFBbWJIQ2s0SDhjejNnVDc1SDdB?=
 =?utf-8?B?VXN3bmJDUDNndFpzVVRUV2QvcUV6S0t3SXFvNUpDbEZGSjZlRW8vNzd2RkFK?=
 =?utf-8?B?RmY3aVpSU2JRY2REclFJc3BFUDFpL1NKVm04YlMvZHpHdURkWTNzM2dWWGtT?=
 =?utf-8?B?MytmcTgrYTYvV1ZFV3d5cjZNaGpyQzhtSFc2YVZEVXZqekR5M05vNlBlNERT?=
 =?utf-8?B?cUFuY3JlVldXNmRsdFJhaEE4Zjd4dFM4b0pTMUY3OE9FK0I5Z1UvMkZyWWUy?=
 =?utf-8?B?ajc0OFM0Q2MyOWhLOWlsemkvQWszS2xzQWg2R3RmNWpVV2hwQWRiSWpkVHRL?=
 =?utf-8?B?WjZNcHBlRWFxNkpyOEdVZGhHS0RaZVZaVElIQzNra041cGFDdnlVSW8vWEtu?=
 =?utf-8?B?K0hvdjJsWUJlYnI0N0NDbXR6bTQxak5tK1ZhYUw5dnMrR3pHZCtQNE4xODNN?=
 =?utf-8?B?YUZ4NUJIZkx3b1dFNTZTOHVIU3F1RnpOQklHRzhOKzJIZk51bit1TEdyYWtI?=
 =?utf-8?Q?RZ2UrZPaTo5z0/U9r1GzWljdr4m0I8=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C775D273154054DA8640ECE8440F137@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8cc0f545-011f-4db9-cb76-08dda9aef6fd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|36860700013|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WUMrckVDVFkvajFRSmkvdjR1bzhuaXh6dmlPaEV2Q0lVR3I5WEJ5NUdBZ3Ex?=
 =?utf-8?B?akZ3K2RTTG92c2NzUEY3K3hWNGptSlZhaGhwcjJabk5uMStMdVUzcDhDdlhl?=
 =?utf-8?B?S0xGdWlDeW1PWjdRcFA1RTNoOENIZzB2N1F1RzIzYmREQ2hxNWxyOHlJbG5B?=
 =?utf-8?B?djkwcnVVN0tGOUwzckt5YmpnQ0QwSFBqYUJmVUxtK2xJZlFHai9VNU1BcHJl?=
 =?utf-8?B?YU5Xclo0cFEzVGNSeExrRzBkbjRYNy93bkY2V2xYU2E4eFkxUW9PT3ovS3NB?=
 =?utf-8?B?ZVdYZVQ3NDNTK2d5R3JJUDBQOENBaVpUTCtRTVVmRHR5OXZjalNWNE5uMVFp?=
 =?utf-8?B?eDNHTGdCU3kyMmpLVHZxenE0YWY3OTZDMjBrT05JN2dRMUhtbFBGUkNNNlFv?=
 =?utf-8?B?bDZ0WXBSR1VmNGtVYzZrcVpRdFlxUUd0VlZUc1V0TklwUy9lZVFNTnFKZUg3?=
 =?utf-8?B?Q01DZWNFNVdVOGxwV2g3OHV0YnBuTVZydHdHOFlENTBXd0ZiamtCcHhUbmJP?=
 =?utf-8?B?TTJUNnVrNWcwZFA3dHEvVXdqSFIzWEhKNFUvdEY2eVd4ZFBGUzZrWXplV0RW?=
 =?utf-8?B?YlMvWTNxTVBBUXJQTkZHY2NQVElEM0dDcStxdUJ2ZWU5d3ZyS0JsNTJNb2JZ?=
 =?utf-8?B?NkRsYVErd0JlR2poMlFWQmRzQ0VRQi8weDFhR0ZEMy9ENTBjVGtwb0gzZ2xa?=
 =?utf-8?B?Yk45YUgvOGdVQXFUV0FFNEZHTVZqWHhVUUxqYVd6cWZla0NDWGVma1c1Tm04?=
 =?utf-8?B?VURId0J5N201bGRkOHZzSkpTRDF6NjhFUzIwMjhJOEo1R1h3MzFxU3ZTeHhG?=
 =?utf-8?B?M3JVWUtLSUpRbmpwWWpiTW5LdHFLTXBBT015QUFxbGM1LzFOZVFKZU1zbFBV?=
 =?utf-8?B?RlZ2azRMeEZ3OWxnZ0FVQlduR0txbDlrUFFUUndsSndLUXJXajN5WW5pY2xV?=
 =?utf-8?B?Mk9XN2dGSThPb2puZm5MZXhNaHQ5bmtKNjQwSzZSZHNYSFhnUE1HV09OTVZK?=
 =?utf-8?B?aGZ4dFpqRWNMeGMrZ2pCZHRRcU9BbHJaVFJsWlU0RTFqVy9sSXU3RGZwUVZh?=
 =?utf-8?B?NXEvOHRLMlYrNklOMnd4T1hzUlAvOUN3d000SG9RNmlSK0Y3c1hJdEdlOG12?=
 =?utf-8?B?dURUSWlzK1dPYVFtWkIxWTFJdGh6VnBoNTRNSkdjbnlSbHhzTWdVZEU5N0N1?=
 =?utf-8?B?UzJ4Mjl0RU51ZDRTRThndGpVV1k1ZEx4WGkxMW8xaVRBREJWVVFHQTVQNFlh?=
 =?utf-8?B?ajkwN0VQejg4b0dLTHE2eDFUSHdoK3R1c2VNVFVwamdabmRsRy9pbWNwLzFu?=
 =?utf-8?B?YU5zdGg5eEpLK2xkcXBsZWUwOXg4RTVCTi9ndGIwQlAzNlI2OGcyUCtZL3lH?=
 =?utf-8?B?U05xbCtDU21rbmVoYnZTU1FQY3ZDbjYvSmNxTGIxd2xVMUtrS1gvTmFIbXpL?=
 =?utf-8?B?dlpaaVBNYytjb3JSblJyb25CQlAybGVUNG81VVp6SWo3SEVNWXU2b01lZXE3?=
 =?utf-8?B?Nk9XU0k2czFqR0RJVTJ3SGZDczIyVjBzQnI2ZzRSeHpGTDVUTWxjVXE0SHQz?=
 =?utf-8?B?ZE82RSthc3JmMmJDYU5NLzF1dHNNRDN0OWwwQ3V4NWd4dHFPMGgwMmRLdFI3?=
 =?utf-8?B?bVRjK2JRTlAva3l4TkhtNTVvYk90OG00TERkWDRJbGNlVkRyNlptaGZFYnM4?=
 =?utf-8?B?cXFJQmFQOEM1R2NKdHpXeW1JQjJFUHQ4TFV4amJxUDVwUWM1MU1ScVVwbklU?=
 =?utf-8?B?dnpUTHE4RktiazdtbWwwQTJ2SkNCVG9QMStaOFJGTHI4amsvTkxiMWxMTFBC?=
 =?utf-8?B?V3BMNGxlSndMSWExajRDZEViL3pUdmZvTlJDc3FTZ2p6YzM5OEg2N0gyb0FY?=
 =?utf-8?B?WVg1dEMwL0RHRS9BL2x6ZHRJcEgrUnA2WnFIN01hb0hCODdUa2lvOGVtOGpB?=
 =?utf-8?B?REMyTzZnWm4vLzI3aTIzTmlRZkRQRzZiaGlYdlZEeWtoMU4rc1M5dHRoenNr?=
 =?utf-8?B?RE5jSkMyd1FiWlRDS3h5MFlGR29RNUhTRkVMUk0zcnU5bTh3YmtxMjlhVzVj?=
 =?utf-8?Q?YCHkeG?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:45:41.8378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8951683-fce7-431b-12c3-08dda9af0a9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9884
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 12:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218518

T24gMTIgSnVuIDIwMjUsIGF0IDExOjMyLCBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21h
aWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIDYvMTIvMjUgMTI6MjksIFJvc3MgQnVydG9uIHdyb3Rl
Og0KPj4gT24gNiBKdW4gMjAyNSwgYXQgMTk6NTYsIEd5b3JneSBTYXJ2YXJpIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIDxza2FuZGlncmF1bj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+Pj4gK1BBQ0tBR0VDT05GSUdbdm5jXSA9ICItRGJhY2tlbmQtdm5jPXRy
dWUsLURiYWNrZW5kLXZuYz1mYWxzZSxuZWF0dm5jIGxpYnBhbSxsaWJwYW3igJ0NCj4+IFdoeSBk
b2VzIHRoaXMgbmVlZCBleHBsaWNpdCBSREVQRU5EUz8NCj4gDQo+IEkgYmVsaWV2ZWQgdGhlIGVy
cm9yIG1lc3NhZ2Ugd2hpY2ggY2xhaW1lZCB0aGF0IGl0IGlzICJSdW4tdGltZQ0KPiBkZXBlbmRl
bmN5IiwgYnV0IEkgZ290IHRvIGFkbWl0IHRoYXQgSSBoYXZlbid0IGNoZWNrZWQgdGhpcyBiZWhh
dmlvciBhdA0KPiBydW4tdGltZS4gU2hvdWxkIGl0IHN0YXkgYnVpbGQtdGltZSBkZXAgb25seT8N
Cg0KWWVzLCB0aGUgbGlua2FnZSBjYXVzZSBpdCB0byBiZSBpbiBSREVQRU5EUyBhdXRvbWF0aWNh
bGx5Lg0KDQpSb3Nz

