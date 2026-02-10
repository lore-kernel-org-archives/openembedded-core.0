Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5E6EA8105
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 11:59:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17825.1770724779126078302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 03:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ATM9gn95;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ATM9gn95;
 spf=pass (domain: arm.com, ip: 40.107.162.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KP1maR71EtDhasObZWdQcbIjYqEen0LpEuyDPNWxuPAAUAqTCGWfYUYc4F9Y9pfIequ99O3OEuyxzcgt4F1/ilsK9AG8qIGPwU32KUGGJgl2PxZJdAp2uTVr7N0VNJD18ff3p9MOh90IhukUoYyATjK1zarWfyhAPyqkhHexvCEf+Wo/3VcmOCBU3O/066q5+c4dytyTrxv7C7hvCyjBTEh1Q2FTxHXnDXzw0y0GIplz47g2Dfnf4Ny1fXZkZirB5JozZF8gyu0EDZQiC9ictaAmGFQlTP368jWjpIUSyQXpHGiXudR4I+XadGE9H8TSz3gAJr+llRj47w+7ZV8Niw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1lEV1gLrE2IPwK4ZQSXFtiGGPeJ9ag+R3VVoPmny/8=;
 b=SjZLRpFfmK7BScFaklLA1XVViczFBobwgjjLZRHgTrQiLcNX7wBtMOojuHRnbVDda0q9Mt+dnBA0CoEQrRsUsdfXTxGEsV0J9tUG9R8jilZPVBruchoXfRJ5MMtI3mcOYq6ny9LAYy9CQkwKdKYSYa8mIvdmPsDb18BBIzgf/KJPj5OpMA1Xc5MHz6YZL975Eb8zoN2YP85A12txh4gRB6iww6pLKprUHaQhk6JTyHxTYXnx3p6Q83wQnPpLHnlS7w6K4lN19fQwpZ0PwyGLstKiCx5JQhA0Zr7JFj18nuyweg5M538CHGMzciOEr3b9IVV5KG1MmCH8/Va7CU+lIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1lEV1gLrE2IPwK4ZQSXFtiGGPeJ9ag+R3VVoPmny/8=;
 b=ATM9gn95/YjCLTBqUHg0EEfSVMUH+xfr603ZylitVtI80nrBr1e9njOWgJvSvKZDXzlfxOn4cW8kzw6J8M5j/AUIpOan1V0S0yoXQth1Vfehkw+LEKLnQs9nMCncAGJXBk2tGEoP8TyYbSJFn93cXoZzTff0fat4cz0dtzPRMAI=
Received: from DB7PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:10:36::44)
 by AS2PR08MB10109.eurprd08.prod.outlook.com (2603:10a6:20b:64c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 11:59:33 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::6f) by DB7PR05CA0031.outlook.office365.com
 (2603:10a6:10:36::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 11:59:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Tue, 10 Feb 2026 11:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0fh3pj5ZpeY7+XfXTJJgfL6F7KT4WWaaAJBaavm+y9IfadEj9HFuJ9Ydknyul2EtN/wb+8SHlnwNvN/a+2Q+ZQrUNpRuOTq/SLyXswswY0IhbFXJoUnIrTYvr9mx6ejK5ORDYPlhCtPcmqnGhNHzKvteT4BjvsKkqVZjf+GC3uQRJcGx3eJDWrXsOVCZjZMhBJgKMvZMoIqyxX7HHPXJnspznlyTyJ6OQBEkKM9YvAFRsqWjK0EjStc48sIvskMb5YD2aYS/+GyZvMamncDHMQtw01SVUs4nzJ6BJDgCf6kJ5l6oGTEN/Ma3obQdH7o78EZniY+ajKOhYTPNJRy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1lEV1gLrE2IPwK4ZQSXFtiGGPeJ9ag+R3VVoPmny/8=;
 b=Whd7uadKfUGk0MZuKYyno3Mdb7nz3mjQ5ddTDYBNpOP/0I2daJRodeN5NkeN+fW8ZRZxuGD5shzIZ+nV0/uTTZbdAnJFKIiDOuYSBxqws7rNfvF17JXd6pxbuQo0oDtG3uk5ex+Fj6ir2ksBI9Cv2SP3XI67sh3x8PmQv7dQ1JUodXZ4l+RNq5VpGSfGh8PzofKMoTIlBuvv4Q7yr6X7h0YEg4IeW3CU5D6vWEglh8B+yfq78ckiE8H70wAUEsjmn/YAADo6FemYy+0d3ijDJizeEJTOTOxDECCs3FE2ZnXOXbFBn35Pl4p0XFLWaITXdc/8ReziICtJJfqXexo5HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1lEV1gLrE2IPwK4ZQSXFtiGGPeJ9ag+R3VVoPmny/8=;
 b=ATM9gn95/YjCLTBqUHg0EEfSVMUH+xfr603ZylitVtI80nrBr1e9njOWgJvSvKZDXzlfxOn4cW8kzw6J8M5j/AUIpOan1V0S0yoXQth1Vfehkw+LEKLnQs9nMCncAGJXBk2tGEoP8TyYbSJFn93cXoZzTff0fat4cz0dtzPRMAI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6002.eurprd08.prod.outlook.com (2603:10a6:20b:2d6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 11:58:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 11:58:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Clement Faure <Clement.Faure@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] devtool: avoid recursion into nested git
 repos with submodules
Thread-Topic: [OE-core] [PATCH 1/2] devtool: avoid recursion into nested git
 repos with submodules
Thread-Index: AQHclePcvrbS/CYFQ0+Y2B0pTkag2rV73U2A
Date: Tue, 10 Feb 2026 11:58:27 +0000
Message-ID: <CF2BD347-8BC8-4985-862A-2CD3BCCB716E@arm.com>
References: <20260204143732.94832-1-clement.faure@arm.com>
 <20260204143732.94832-2-clement.faure@arm.com>
In-Reply-To: <20260204143732.94832-2-clement.faure@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6002:EE_|DB1PEPF000509F3:EE_|AS2PR08MB10109:EE_
X-MS-Office365-Filtering-Correlation-Id: 62ffc1a5-c425-409a-d222-08de689bda75
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OThjOHZHY0JONTZrekRNR3JmYll5clNBZXRYUklnSXE5dGdpSzdtRGEvbGpw?=
 =?utf-8?B?RldRTGVmMG5FSm56NTl3bDRQY3V6V2ZDaHl6N0hKalJGekF1MTBNUWhtaTJk?=
 =?utf-8?B?aS9RZGZicW40RG01YWRsVHVRR2lVQ3VieURnK1FHdUJqOVE1emNudXZNRHk3?=
 =?utf-8?B?OVd6R3N0R3V3SmpZQy9NWHdpbEtpSmhNOVh2R3FxOFVQUWhzN3hvVEd1YnRp?=
 =?utf-8?B?ZWdxaVBFWkh5V3JURVF1ZXJ6YTJlbWVVMENuckQzUnZpeEREUkc0TWxxN3Nz?=
 =?utf-8?B?cFVpTmVyTi9jQzNVY1hRZ3NSTjU2QlBUMEdwU0txb0VkL09UaGZKZkhzSCtT?=
 =?utf-8?B?YlFybFFGZVVMeXZnMzlLTmg1MmV1c0pFeDZZK2pETnJYcnQwUmdLZEZYWTNH?=
 =?utf-8?B?d1grZkx4MG5SN2MwWXE2SXNlenpMdHFzYXp4UGlKNXJjN3pEZng0emxXL051?=
 =?utf-8?B?bGkvdGI4NU5ZWUN0dVo5N2VBbFU0a2tEejRJbkMxZHg1K1NSYk1DZ25ieDJa?=
 =?utf-8?B?clBJN2N5b1VoK2VpVmpKcCtDOGFwc2ZYUzZVNEJnSjZyN0drelhuUE9ERVov?=
 =?utf-8?B?TUdQKzcweEV4MkhtOFVvSVdBUnY0UFYyUXFmRmlYOUdXc3FlRVBMY3RCalJ5?=
 =?utf-8?B?YWNkTE1ucm1MSkNGM2NFYlQwaUcvWlpJTUJONUh1aS9vZUxUL0kvamFZd2JU?=
 =?utf-8?B?Yll3QjFpODFEeksrMElnMjdmeHQ5K3BkZ0JUT3RYTUU2MGVEQ3B5bVRwOE1x?=
 =?utf-8?B?NDdBL0Y2V3NKQ0RLSW5DanFtTExlVGx5b3NOWWd3dWNlUEVPSVlKNlFQclJJ?=
 =?utf-8?B?M1MwbkFFMytwbGk3ckRYVldpR3hRRTBQZlNiTHJXQ3ladkFxVFJsVW5aMTRl?=
 =?utf-8?B?OEQyN0JVS3FER2xhdFE4V05BbFdBYk9JYjlyNXB1UmdkMnFLTW9BdzVVT0NW?=
 =?utf-8?B?SWV2aFIxaTFOT21ERGs3VWpEOFl2OVBZMmlveDRQemVPZDVIT21VTnorSlhB?=
 =?utf-8?B?SXNyTVduMkFoelZHelFHRlRndVVZdjJHdmpnN05GaEFzc2tGc2s5R1ZRYXJG?=
 =?utf-8?B?UGJLUlpHYytSN1BoY3Q0MnBCOFhEWWROOVBiZ0hzakI1YXA4a0t6Q2NsaDN5?=
 =?utf-8?B?N2NJQnN3emNwMCt5Mmd6d2F3TUtPNDZmcGpjR25CeHFlbXZwUXo1OStDM2cr?=
 =?utf-8?B?NTRiVFdiRFRReUtVSDM5TXZMeVZJU0dMSzRZUGYyYS9BTG1BMFNYT1RMdE10?=
 =?utf-8?B?andNT2EzWVVqVVJKSXhCWW5VazkxQVpSNGlrcUVvVU9pRXB6ellBQlBIdk5Y?=
 =?utf-8?B?YlZQYlZ2SXdIYmYxTDJ2V0Vxay8ySWY3RHdVeXhlUW1Zd0JzN05xSnYwR2t1?=
 =?utf-8?B?NVdsTEdtM2g2K2tuZGQrV2VTek93SkIzTFJzQzNucUJ1MjlVOWxEdmt5cExx?=
 =?utf-8?B?L1l6WmkrZ2hWSFAxay96UzNXelJ1b1VVa3lIaW04MjZYS0dpU3BvZ3pKTGZi?=
 =?utf-8?B?OTBDTFhxRWJkWFVSa0lVTGlRZTRiR0tjREhJWGZMV3EvWitld1R1bmxsRVR6?=
 =?utf-8?B?R2wxcW5HUytmUWh1MlJOWlF4TXUveHlGakZNWDk4ZlEvQmN3bWwyT2drWk0v?=
 =?utf-8?B?VkVRUmZCSnl2aGpBRGErbjRLaWl2VmRCZXRKWTZpNllIaHZnT0lUcXZIWHhD?=
 =?utf-8?B?NnFWRjAvR2dlaS94QllUSWlxdVBpZlViNk9ZVlhSRlkwQldqOVgrZU0zWmtl?=
 =?utf-8?B?dlN5dXhGbW5zczBhR2dlUXZxZFVDcElXOS9VSjNtLzRBTG52QzF5QXJQQURE?=
 =?utf-8?B?T3drTWx1SFlvUjBabTg3bFJQNnhpTGtieFlrbFZWeGJtYUE4bGZ6ZnBXK0l3?=
 =?utf-8?B?ejJjUnhNbWlYdStuQXlwRzY1YkY4eDltUk5ndHVFTXArcHVxdjZWd0ZPSVlP?=
 =?utf-8?B?MGpCeCthalhMdGRCWEJQNkVmN1ZvdVhFYlZ4SmJIZ0Q0ejIyWm1OdjRtK3RE?=
 =?utf-8?B?MTlrTkFNYlkybXlQUmM0SExFbEpHMFF2NC85RmhUZ1pEeFFZT0NOaFdEc2x0?=
 =?utf-8?B?dlZNc2Z1MjNvTjk3djh4ajV0VXV3YlJFRWp0enQ2QklUVGJzNGw2eFAwN0M4?=
 =?utf-8?B?R05rMWovNUZtMFdwQ0thV0VlMGdmb00wZ29aWU4zMlljOW9XYUlpWU5UQTkw?=
 =?utf-8?Q?CKrNViOkkkQoVyolesDxbDU=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <78420DDF20CDB24B908580640D2E6796@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6002
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7b37af50-5413-4d60-2054-08de689bb391
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SmQwYmNYTEdaUXVVWEJhblg0Nm04OHMxaEY5Wnh1OGpCdnlPREIxbUJnY2VT?=
 =?utf-8?B?bmhKdEh4QjNNanNuODN4WVlueTdIaUdxdU9Fc3JXMU1NS0h2WlVOZmNTVDR1?=
 =?utf-8?B?RHI5RVhTN0NoTWd1cnZrczlDM0pYNTZLNWdhTlZJUTBNMkQrOCtBM0VQTitU?=
 =?utf-8?B?VlpKUHRvWlRiT0pueTQxSmJzQVpOU2ZPQWR6aW5JeHhiU1V1ZUI5SXd0NFo3?=
 =?utf-8?B?R0NEZkppZStwQWxlb2RHVWIzQ3hjUmhYc1FXTDRoRXBaRVRsUHNra1BZTjBW?=
 =?utf-8?B?a1hwYnFaUXJOR1NpbFRtM1dQQnVwMVFTVCttYmpGOCtPRyt0Z0M1UHpuQnhV?=
 =?utf-8?B?ajBnQ3dxeVhVRTZxTVZ5NUYxRXRmOWxyS1ZRT0hseksvRisxREgvcENCemE0?=
 =?utf-8?B?WGNNSlV6a3oxbEJLLzRodWxrRGJlUjdCdld6cXRmNUFpWTFRUVFHTjYxRFMr?=
 =?utf-8?B?R0hjeVQ4QUZPWXlDcFN0SzBHVmRPdVFmMUM4SW4rM0ZoZWZpM3N5aVQzWWpN?=
 =?utf-8?B?MXhqU3RNSHpRdEkzYS9GeGt6c3c1dERibmR4R2VtaHFuNWJiVWZXaG5aWnpH?=
 =?utf-8?B?U1RSUjVaVGNMOURvNndPMWZjbVFJNDF3bWJQU2VGL0gvbm5samlKdTNqUFNV?=
 =?utf-8?B?akpJYXlIc09Mc1g5OEJOWGZPRFZRRnBDbzYrVnVKL1JYZWhaL21ZaUZTTzFl?=
 =?utf-8?B?L1Q0SStDUlJmSUlwdWEyVG5hOXU0WERKRldyUVRlMWtpWmNQTnVSTFBHdU11?=
 =?utf-8?B?KzR5ZlFmaHArZ0p5N1hrNC90WE41UlI4eHJ1ZVZSMGNBaFhvbDV6dEFXZ2Vr?=
 =?utf-8?B?RzJLS2swQ3dianZzRmJuRUZZODBrTFBxamJiNzduRGdJbWNFZUJYOFczaVZO?=
 =?utf-8?B?Ti95ZHhNZXM0d1ZybFZIc3FSV1poRk4rNUhYSTVFU1NaLzZJT0NKTGxzYWx6?=
 =?utf-8?B?eXJHeWgzc0hpWEhBdmRXSlBpaEpNb1cxZ3VRTUI4bzdyelhPNWx6eE05RWhO?=
 =?utf-8?B?eGNiQ0JLUDFwVXp2SUtqeWxwaVp4MWc4TXpISzlBV1FUQm5PTjJkUWVwT1VM?=
 =?utf-8?B?YTdUa0JoMVVnUDFZU0lHenBiVlhpS2RYM3o0MnF4ckQ3aVg3SVluUm01Z2Vp?=
 =?utf-8?B?SjJPTHBHWWl5bHlpWUczeVJkRUZwdnlCTTRBRnlPSE0rZkhSMGNUajNUVE5L?=
 =?utf-8?B?NUUvQ01EeVE3TlU0ZVZCa2laN3NjRjhMUm5CcXNnbEhZT0xnWE9Za0NncndC?=
 =?utf-8?B?YWVZSUN2cjZOZThmSUJEL3h4ekJDc1BialZIRUpVdmx2SDhYZTI3WGdGeVlw?=
 =?utf-8?B?WnYxNjFmUHNWV293enFaaER2MHd4MXdJTTJKdCtKRGk3WTV1L1VUZlpueVdo?=
 =?utf-8?B?SVIwWU42YTFSb1BmRXVuQVZxVTJLTVVWcG5FK0tiLzU1emV2S0RYSjJ0clAr?=
 =?utf-8?B?SmpnUUErK1N5Z2FEUWF6akdTOXNuT2tCaGRIVUN6V2paRkNYTmdqUVBjQms3?=
 =?utf-8?B?ZTkvanl0ek5KUmZITHV1RjVwbEc2ZWhwdEZHczJTaThqZ2tpamtsNHFuL1RD?=
 =?utf-8?B?NFB4UXk5Y3cxYmtTSXMzeUo1SmlCb3NKYWNmRXVMNTlYcEYvQWUxQ2pQdTNl?=
 =?utf-8?B?WEt2K0JqY0plVVdLWEJrTWRMc3NqZERydjluSnJzdlRIZ1dLemx1dk1lbjh0?=
 =?utf-8?B?WmUyS0czY3lVUC9HUFoyOTNFRnozck5DT2QrTEFtWlJrc3EyN0lta1ZpY1ZQ?=
 =?utf-8?B?SE9NbnpIQ0hGTUdHQnlNU1U3ckVJYzdubHBadzJDZndMQXhaZmRHQnFYSXpG?=
 =?utf-8?B?S3Z0NXJNd3BOenFpWld2Z0ZMRktTTjJsdjVFOXhoN3VKY25CaklHc3VXMkE4?=
 =?utf-8?B?c1grRE5hZEo0am84cFFKektTQ1VkSSthM1ViM3dpUStOY0JLMWxnL2RwMXlF?=
 =?utf-8?B?M0VORGwwTmdIeUk5aXRSbi83azlBV1YzbWxNbExjWE05MEZaLytjYXNtb3Mw?=
 =?utf-8?B?cUhVSGIwQzU4R1J4R05WTGZpS055ekZ4YWpoS3RWK1JvSGU3NVRQcjhUUDlF?=
 =?utf-8?B?c2NQZlR5K0dpdXdYdWRzQWZ6c095Vklwb0U3VG1Uc3I0R3owQ1FtMUZwTU4r?=
 =?utf-8?B?cnlISUdXVFVDTWhQZ0l5RDd3ZGZNallkTnNlUmxQZFlGQjRZZUM3VlIxdk1v?=
 =?utf-8?B?bnF4MFlXYWpBME9UNndBWm9oMmFBZjVKNFBRM0JyNG9WQ2Q0NVg2bXg2Wmln?=
 =?utf-8?B?YURjMWUzWTZZYlAzRkNsYjdvRnNnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TC2pRL41MoSTmUzzg9TGoxqoltjAj4ROxXWuFfOUmL3rt8dRwwK6n9kJ1foXHvoKiqBbnKyPBl3YGzF1qm73A5fHzbUOsAkyA45srCuh7KMV/aiF1zQEXNQKHxzX+80VMbEkLvZ0l35n8uZ97pMaRHbnmgzvEEAD8n0E0JlLEFJhc81VIQw4Yn3nE1RSl781/avZeC/FN/jtpPeYPVJArY8ezloWeLHO1S2/iDBveGiFWuYHUKzHyzA9GqQNR29S5vx0ySWxy6VQFAVCe04INgKsQxXUkBIqsA8fczEdnxRAVF9axJh4+Am28uGD18R5cQj82cTpjBSB6Bg+f/qmbHfYg3r1S+UdD5LNyMuY6D7FT73Z1CwuwZwOyu0x7srQaajyM4K25GGD2kgdPuO1Q0b/grDfWgfdY9+HCsrY28bNqE+6NOgFkfcD3LATFaoC
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 11:59:32.7155
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ffc1a5-c425-409a-d222-08de689bda75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 11:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230889

SGkgQ2xlbWVudCwNCg0KT24gNCBGZWIgMjAyNiwgYXQgMTQ6MzcsIENsZW1lbnQgRmF1cmUgdmlh
IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGNsZW1lbnQuZmF1cmU9YXJtLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gKyAgICAgICAgICAgICAgICAgICAgaWYgIi5naXRtb2R1
bGVzIiBpbiBkaXJzICsgZmlsZXM6DQoNCknigJltIGd1ZXNzaW5nIHRoaXMgd2FzIHRvIG1pcnJv
ciB0aGUgY29kZSBhYm92ZSwgYnV0IGFzIGZhciBhcyBJ4oCZbSBhd2FyZSAuZ2l0bW9kdWxlcyBp
cyBhbHdheXMgYSBmaWxlIGFuZCBub3QgYSBkaXJlY3RvcnksIHNvIHRoaXMgY2FuIGp1c3QgbG9v
ayBpbiBmaWxlcywgcmlnaHQ/DQoNCkNoZWVycywNClJvc3MNCg0K

