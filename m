Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7AFCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 11:23:33 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.web10.10599.1757417008343182458
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 04:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iumoF/XV;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=iumoF/XV;
 spf=pass (domain: arm.com, ip: 52.101.72.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vuToFJ9N3wPvZGF/lBROwMLWkOHWRB5FGfHQfj8oNQPY1T/HlxBXWAAjYQZxeuZAcc+bPbW9QIw39HPBjFtco2mKwka8Izr/mMY+SYLhibR3+OV+G+6P8Q13h5cgeEKDVctUOu4eAf85NY0kPbJNmyB3v8R7il4mgrYcR2nzLIkAEpiBi7QDYrdpy7yNH8RTFzIWQaDXCTXO4ds1WY15yjZOSzyxtBjgwh+vS0OCd91OxPdGRbeyylcgwXzNz71ClSmSSL6nE/7MyJrdpHczV4SYJnnO2PE7t9FlljH+OyBHX67ytHUMPN3UUobwWHWYkzy6C5sNt+2EUpA2Be8shQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPrX7Ihk89o9sgBNgHLWdjccMK0NRZJ7reOejYRREJ4=;
 b=Wsmn1bvni4XVX37/0uxrvECTy0A0fjHYuJBk9MIEcF4yw3dUkHcR5hX1InRf25YiNf57o3eG+RAOZaqpt4uPGGKedSSeApRJeTUmwEPnRpJeMaBKlaAJijV8fXzrUY0jhWnrdIjsFPCKRo2LfQsBSDQosYiu9oUW0k5/na/6jYBsihnVjmT3cibl6cN4M/KhXS6Cd7kEfT64cbhpa0PSrx+GVXV2F3b5yNwxmfH/GLPNz+8V8LzpOAtAwls9rUMnY1g9IOYTvvZof96SGzp+0I5x65c1RoOLcfLI+Dzp9YdSGtey8jkmBhcslgS61pU/mY2TaoY+7OMBHgZEfCOOJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPrX7Ihk89o9sgBNgHLWdjccMK0NRZJ7reOejYRREJ4=;
 b=iumoF/XVoCjIk5xsKlUJh/nqZMMZA8vZhSvSrYDaGXrfIKtqyIOcQRlXf4lGv6biO60M/CcvdRgUsNU1SZRHx7V/UrXMUPaJTAkJ3rTRix/5SkctJnuKLvYCPaKxfnE6ng1ahP7nL3ZmlmrVXfBMbBOhnQ9czP9jq/IpfiDCUF0=
Received: from AS4P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::15)
 by DU0PR08MB7859.eurprd08.prod.outlook.com (2603:10a6:10:3b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:23:23 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::14) by AS4P189CA0012.outlook.office365.com
 (2603:10a6:20b:5d7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Tue,
 9 Sep 2025 11:23:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Tue, 9 Sep 2025 11:23:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTxWrCbLaNUx3gVUblHMC1bK9zeiodD99/sGVh8pzFxyXUmSHvP89UD+ieJFUUzIF0jnso2WVw4RCWM2dY9fhXrDq3m90Ddq8/GJT2UCDuErK1+uAjEx/81UkPYHqAjvuYtCpRYAHyfihGxM38llA9+lWX5y4cfffXv9EqvmxFaHfs5lcmj947PAE4JnpIJh2GBcaMZefvPafvkQJLuxKqoS1ucnJt+6+g3sp+FavhkU5cCdagTytuvQ0f8uFPzZXQhmpgyIAYzwVl1SRsofmawgwAuCj47ZpcARu/Q7mgWb1iSW/hoFcUNYoLeXUs1JibI+bkNOYFwHd9CZ11qB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPrX7Ihk89o9sgBNgHLWdjccMK0NRZJ7reOejYRREJ4=;
 b=L97J+iDHzWYSqBuHm5VPP5AWbpqysiAiGSqEcfJAwQFz7xifKrqhRtfiGV41U7vjH2Kvc/Xvs0os/p/jrj4rby6uFPOthhrscRVDP3Wnwuvw3pk/GT+IdlY6eZVsw8TZtU624DkLIcyJZQFpd4EopOsLPdim+1WE8eJI61VbI8I0KXjbEBXUQe2PYP12CZz5MG+LkLJfp2ASG46CF1yOu4HNc3YoVrqwj8uB/ScIgcoAqWV6czJXLDm1RSJ0Ex3OlhIu9ocrnApVNIWpU1k5IaXIGfujnFYOd9TGuc7UcgGlD6nMU0fBpGAJnW4IYE96yVzZc8eLUrYcmrrluA34Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPrX7Ihk89o9sgBNgHLWdjccMK0NRZJ7reOejYRREJ4=;
 b=iumoF/XVoCjIk5xsKlUJh/nqZMMZA8vZhSvSrYDaGXrfIKtqyIOcQRlXf4lGv6biO60M/CcvdRgUsNU1SZRHx7V/UrXMUPaJTAkJ3rTRix/5SkctJnuKLvYCPaKxfnE6ng1ahP7nL3ZmlmrVXfBMbBOhnQ9czP9jq/IpfiDCUF0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9551.eurprd08.prod.outlook.com (2603:10a6:20b:61c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:22:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 11:22:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Topic: [OE-core][PATCH] sqlite3: upgrade 3.48.0 -> 3.50.4
Thread-Index: AQHcHSH/d/EzehD7/06lS9AorWA98LSKvdCA
Date: Tue, 9 Sep 2025 11:22:46 +0000
Message-ID: <DE61F3AA-CA08-41FC-8F66-04910F2AA132@arm.com>
References: <20250903222658.3929743-1-peter.marko@siemens.com>
In-Reply-To: <20250903222658.3929743-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9551:EE_|AM3PEPF00009B9D:EE_|DU0PR08MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 0902a077-38c5-4828-54e5-08ddef93493c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NGRUL2htQW1pdTB4VFpmTERwRGZDVTNNNTN0cUFLSk5oZUR5aE16alFNblJP?=
 =?utf-8?B?MnE2Tm4wTXFhZEI3THZqTWxncFBYVGpCRy9iaTMwclFjaUNJdWNKMll4RkNL?=
 =?utf-8?B?cjNiVUhTR2R5WFovYnRzaWRPd2JSOE83UkpVR1ZQaktoMWNEN2VweEp1dmJ3?=
 =?utf-8?B?OUlFdzg4RFNYbnJyY2tJZE5NdTF1ZDRpemZSVHJ5KzJKeDlUWUkwSFl1U0lx?=
 =?utf-8?B?bW9KNTNaREROSld4R2VCbmxxZzA4UnRvK3h2YU9nNk9mTkt2Tk9Oa3JPMzdM?=
 =?utf-8?B?QW5QUGczbVdXL2NCTUdKRk9jcDJNd0lQRXVWa1QwbFV3Rno4a0psRWFiQnp6?=
 =?utf-8?B?N2JnZHdTU1UvVFFhWUlFQUZOUVEyZkFOTTRTWW0zdVRQQS8vYTBiSXBuaTVO?=
 =?utf-8?B?bWdkSnRsdGdNUE4wWUpWb05HSWhsUmFYK1loL2pZcUY4OHFKbTRMT1hSYzhq?=
 =?utf-8?B?MW9RUkZITXlRYzZBcjFlM0NReTZMVDNJVDZ0Tk5GMTdYU3p3RVJtMEZ3NG5y?=
 =?utf-8?B?TE5jclNiOCtyaGtueTlXT1FhTTYrVm9KV3NCcC9uTHFITEhZWDhGdy9QWkQv?=
 =?utf-8?B?a28xdTdSQlRUeWZuU2hRSGNJL3FTdHBYajhZSUVQYjVZZlZub0VHMUFiRHhY?=
 =?utf-8?B?WXNIRmFqU0t4S0NiU1VwQUZCaVRvTjJsaU80SHEzUERXaXNMYWtIS0VLb1NX?=
 =?utf-8?B?NEtta25TWUxaRVMrcUdSUDJETzdBMUxmT1dhV04vY05uY1hQUnNjRVhUODJR?=
 =?utf-8?B?TjRoR1lTeFlhOUZQTDVHS2NSc0xiSzE1UGtMQnpHd1F1bmUxK1pnZ0hQeDZY?=
 =?utf-8?B?cUVsc2M3Y2l5UUVpZkI0N3dvYkk1WXJVTGF0Q0hwWm00VGEwR3RSQkpCekNO?=
 =?utf-8?B?bGF3d29WU1ZVMjU2MEpjU0xDMXNCSDlKRUlEQnVEbHNUN0VUa0thTXk2OUpD?=
 =?utf-8?B?dTc0VnJiR3FMTTVRcktOMUJ6ZE4yNGZqczUySG1LUFJkM3paeUdaSG1zdWwx?=
 =?utf-8?B?SWtPN2FHK0VPTVdlSUNGVFNYTFhPbVJ3OXpBOUtKd0lhaXYrYjFFblIvRXNK?=
 =?utf-8?B?V2FKQUh2SzFWc2QzN1ZjSDVsNGhHSzhHUXFnM28vdXZBdm9sSURJTXBEQjcr?=
 =?utf-8?B?THNyN1RwNmc0aWlpYklZd2c3ck9XdCtwR0NaR0g4SzdZb1p0NnpuazdMbkxy?=
 =?utf-8?B?NEMyK3BjZlZNa2ZrcGdxQzRJQmV5blRVQnBJRzl5NTN4NGtlRkFLaGVzZjlI?=
 =?utf-8?B?dFhtWGQrV0NyM1FyRldxbnRpdFJoblZFdGRWN2pUZFYvblNmWGVsdE5wSGRS?=
 =?utf-8?B?eW1NNExlU0Q2dmdVQ0wydE5lSlhqQk1icW1hVHU2ak9HeWd3bHg1bXdJd2xw?=
 =?utf-8?B?eTRtS0lXNHdpVmZjTk82RVRudGMwRjZKZGJzWDAzNUFDRmplY1o1Nzc1Q2kz?=
 =?utf-8?B?ZVA1cW5sZjJhdkxBY2lYdW16bHpLa2dnTHRyUTBmVG5PRS9LZWZ6WmJJSEdy?=
 =?utf-8?B?aEJESzd2a1R0QU9vYTBPOXBPNWEwMHhEclVjbjhsNm9iL1dEeHpEeWtNNlJW?=
 =?utf-8?B?QisrUmpNMDlSNnRudzU5a0pKR2hqWGFsY0tmbTBKZDI2dlNUSHhNeGFUR3gr?=
 =?utf-8?B?Zy9hdjl5UUIxNUtwOUgrSFJSNEhLREhybnRGWjFtQkk1ODQxcU5tSkZXYity?=
 =?utf-8?B?Q1dMSDdBRGVjMWU1VDU0NGd1WCtHb1ZPbnFGZllHRGxFdG5pQzcrWjNsendy?=
 =?utf-8?B?aWdpNzMvR1VERjJVWEJSSndqQ2xkb2UwbXZoMEVFY3Ryb2Yxa2pzVzM1QW40?=
 =?utf-8?B?a05WZ2FGL0V3Z3dsaFFXTnhmZUJNbm5KQW1wK0ZPbGpqZFEwa2hFTjdKK2Rv?=
 =?utf-8?B?Q0plZDNOekNDZ3RtclgwZUNqd21lQldLa2Y3N01SRmh0amlkdHVMNUwxSzI3?=
 =?utf-8?B?Z1J2SUlDZG1XRTdnc2R3c3F3dStmcmVaNWw5TUQyYzdqbnNwRVUwS3ZvSE9R?=
 =?utf-8?Q?kNG17H4a2BsR/hkyH/qGhR2/vEQ1mk=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9664D76B07B0F9419CDFBC998C1DA7CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9551
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e488c37c-e6a3-4b52-c62a-08ddef933396
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dytGWE9aczhWSzVMc3hST0VML2IrWXZsV0N6RWVYZFdabFdJU09ZSUQvQ28x?=
 =?utf-8?B?YmVaZzRGU0YwNkxobGNpc3FvRW9ueWMwSFc5bTYrVS9kbTRWRDRBVUpCTklY?=
 =?utf-8?B?eXJNN0tQMnBlcm1zNFAxZnJtSWU2cWI5Qmp4MVZOWGt6bDRNUkJJVEdOTStH?=
 =?utf-8?B?ZmJobEZucVFGTS93N1oyQkpaZHNRUlZDWFRsWit4eGVuNjlmYWxhQ2JpT0tM?=
 =?utf-8?B?bVpjaGs4LzFYSUhPU1d6NThVeTNUcDFsbGY5SWxibkhudnF6YVgzbFZWa2Jk?=
 =?utf-8?B?VzJuSUxVa3RwcjM0eTl2NXMvSE9rS01aTmF0VnFIczVUWnlPZm5OTDg4TjVt?=
 =?utf-8?B?R3JQM1lzTmZRVFdqNUNKbExkNnBleGhxNkdGcnZxZ2VKQ2VCVUR1dWJsaUZ6?=
 =?utf-8?B?UXdySjAyd1VONWp2K1pKR0hMd2xlZFQ2eER1SStId1k5MXdNSWthazN2dWtU?=
 =?utf-8?B?S2pQeDFMclUwaWZXK1dCM0xYeTV3Q3U0Nk4xbXdrd2Q3MngvYURUbCthamtt?=
 =?utf-8?B?ZTJLU3RNZ3dPL3RZUGJtNm5DMzgwbzBYcmFCNUdGL2plYjBQUExUWHMxL21O?=
 =?utf-8?B?OTNxMDB4K0IrczloQ2QxSkxlcXJROVVKVC9raWxrT1JrUmluS0o5N3hrd25C?=
 =?utf-8?B?aFh4dC9BT3pjSmhSeE9EaTlUbWI2K2lUQVRzTzZVQ3Zjb2lIdFZCWTZRcm1P?=
 =?utf-8?B?VkdzWUlkd2YxWDEyNEFtdkVqMEhJdkhxd05MS0M1V0VJNDAvT2lNYTBCVGlR?=
 =?utf-8?B?UDNXVW9rWEk0RFhjcDlXdHR6MDRQRUxLWmNjeXZXTFltSmR3a1djcGpnSnQx?=
 =?utf-8?B?U3FIK216eVNaY3l4d2lRUHlJNWZGbmllS2NBSTFwWk5ESkZXRllGbjk4R2x5?=
 =?utf-8?B?VW95MW1UNEZRWStETHpxVXo2dGVhRXhKUkV2ZkR4ZlBIUU4zSVNYSmUvZXJy?=
 =?utf-8?B?bHZVNG5ZeEV1RzBKU2VrQmMyY091SnVaQkpOZWdYSG1YM1lRSCtMMXYyYXp1?=
 =?utf-8?B?MDJZTjFUK2hBZ3ZPY28zUURTcFpiajZianBJYVFxNGpoM2JoN00rY0g5UFdK?=
 =?utf-8?B?cDFhTUNxMGZBTUNrTFh2TEsrTDh6VUZoZzA0aDdqNDZDeXpVaGdBeXpUUEhi?=
 =?utf-8?B?Y2Q1OWlyeWp5SnlYYXQ1Z091TWxyUGRQYnhEQnZOV0V6alU1Y1JYK01aYWVa?=
 =?utf-8?B?aWZ2MmQ4YU9SYWVETzYxeVV5Z2ZDWlBrTGJhb3AxTUgvZFNsa3lWMGMvWGhF?=
 =?utf-8?B?NUVQOFpPZ1Rsb0Flai9TbnN6ZitGWXFsNFVEaitBcS9xL2pUVTFCWldaNkFm?=
 =?utf-8?B?SXNVQlcyWlhscG9jYnk1alN3T0ZZWTNPUkpSTlBvZzA2d2hKY04wQXZWVW9U?=
 =?utf-8?B?TVhhbEJ1dzJMK2hQWU5vWXVNSFlJWjc1NHQ3cklZQ21ZQkxEWWdxZW9ZQk8y?=
 =?utf-8?B?QkhoeHRSRzMzL1ExSnV0UGlwN1NZaE8xNWxJM25WR2hudk1IUHJCMlQ1KzIw?=
 =?utf-8?B?TDFaOHJTZEk5MUVXNGdobnJpUjVhdmFoT0lFTzFnd28zSDQyU3k1WVhqZTJz?=
 =?utf-8?B?RFVPbUVPVXo0TnVoekFRSWVXbjJhRnV5QWtOV0ZzTlkwTzVvZDlzZGNzcDVL?=
 =?utf-8?B?VlhGMTlBaDFESzhyK3J1aldET09rTkQ0MGJKSlNNdmRIdHgwKzRaVXplL1By?=
 =?utf-8?B?SzY1UHhHQjlSQVV3OTBqQ2diSUI5TEJldFB5VmpKdEhmMmthUGFleXgzVis3?=
 =?utf-8?B?aVFCMHNJckNHSWZQSERtUUMvNy9zbitmQS9yRjVqUVd6MW85VzkxVDNDb0dY?=
 =?utf-8?B?dlpQd1pDOGNyNnZXRFRtcWRWUlh5RDdjN1k0aHQxcUhzaVhDT2lJNVNaNXYz?=
 =?utf-8?B?aEJWOTh6ZTVZdkhBdUlrL2laMHM0eVpTS2hwbGExSlNFZlNDVFcwN3ZpRmcw?=
 =?utf-8?B?UUw0Tzg3ODgyOFloMkt2MGxBbkNZb0cvUFlaR1VlUG51VGRyVkVZaktmZysw?=
 =?utf-8?B?QUtZeG1BM041b0tNRzUrUmRSbFphWVA1a0RMeFJudnpTUkFqME5FRTI5UTZY?=
 =?utf-8?Q?dld5Bn?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 11:23:22.4019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0902a077-38c5-4828-54e5-08ddef93493c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 11:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223104

T24gMyBTZXAgMjAyNSwgYXQgMjM6MjYsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gKiBkZXBlbmQgb24gemxpYiB1bmNvbmRpdGlvbmFsbHksIGF1dG9jb25mIGNhbm5v
dCBiZSBwcmVjb25maWd1cmVkIGluDQo+ICBzaW1pbGFyIHdheSBhcyBhdXRvdG9vbHMNCg0KV2Ug
ZGlzY3Vzc2VkIHRoaXMgaW4gdGhlIHBhdGNoIHJldmlldyBjYWxsIHllc3RlcmRheSwgYW5kIHRo
ZXJl4oCZcyBhcHByZWhlbnNpb24gYWJvdXQgaGF2aW5nIHpsaWIgYXMgYW4gaW5kaXJlY3QgZGVw
ZW5kZW5jeSBvbiBwc2V1ZG86IG1vcmUgZWFybHkgYnVpbGQgZGVwZW5kZW5jaWVzLCBtb3JlIG1v
dmluZyBwaWVjZXMuICBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBhZGQgYW4gb3B0aW9uIHRvIG1h
a2UgdGhpcyBjb25maWd1cmFibGU/DQoNCj4gKiBkZWZpbmUgc29uYW1lIHRvIGF2b2lkIGZpbGUt
cmRlcHMgUUEgZXJyb3IgZHVlIHRvIHdyb25nIGxpYnJhcnkgbmFtZQ0KDQpUaGlzIGlzIGEgYnVn
IHVwc3RyZWFtLCByaWdodD8NCg0KPiAqIGFkZCBoYWNrIHRvIHJld3JpdGUgbmF0aXZlIGJpbmFy
aWVzIGFzIG5hdGl2ZSBpbnN0YWxsYXRpb24gd2lsbCBzdHJpcA0KPiAgdGhlbSB1bmNvbmRpdGlv
bmFsbHkNCg0KVGhhdOKAmXMgZGVmaW5pdGVseSBhIGJ1ZyBpbiBlaXRoZXIgdXBzdHJlYW0gYXV0
b3NldHVwIG9yIHNxbGl0ZS4gIEhhdmUgeW91IGxvb2tlZCBhdCBhdXRvc2V0dXAgdG8ga25vdyBp
ZiBpdHMgYSBidWcgdGhlcmUsIG9yIGluIHRoZSB1c2Ugb2YgaXQgYnkgc3FsaXRlPw0KDQpUaGFu
a3MsDQpSb3Nz

