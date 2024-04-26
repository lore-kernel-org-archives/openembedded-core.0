Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7A5C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 16:58:47 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.74])
 by mx.groups.io with SMTP id smtpd.web10.1192.1714150718303415459
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 09:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=p5hqhoEt;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=p5hqhoEt;
 spf=pass (domain: arm.com, ip: 40.107.6.74, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eeJUjV39H0KWg2yyPvxm200/INIEkHOuMtYTjANjRKnTu+gHCUwuIifuy/c3N9cb+5oMONj44U+xwR5fWuzsWA8GzJyR0y2GZ+mORbQC94EwlvCWGlW87x2Hpjf3GreiCUHdDu+awIwn/+SNXX5ZLEFiQ8eGufNsHBt8XfiH4DRuhTHEtrlDMbV1A+rrxhq4nAhw/9d1zWVVeP8zvDQkMk2CQXp1fVNKbIEEuYlXsIQLmkwYedPyaoRLtGIFLBMshZOetQoVnKZOjSRHTIpgWu+VyFRGrghBiPQXhng8sO1QqxbWo0DUED1+WEqwULmD3tmRc75LWChVLecucjPOcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwYkeh/v2yrCHhCAtdswUFnWvZ2aXBPzWn5Wy/GFUE8=;
 b=WIU6lBSA/zzGje8chXBOIDJj4AIOQrvC/HPBF8ofL7K27kd6KF/RsBC86/WOKcD8iX+lZFEPG7OIiuuPtGPqCmLZHwSXJfsIPB2Clf0OZgWOnH0yXh1BnX8k2RDy9OhXEaI9mPByTfEUBs764mUSWZaaKYuCcWnvad/VAYoROoJ9FnHHedquL9N/HyDvKIlkO7Pe++t/tmmcUGosU5p9yjpTXCLowRKZkSoxtn7ZkQk+4FXFu6omzHBSHq/sWQa39NlMYfMv8dNYFq8yYgdML3+x7Meu/jeA/K7pAqptGTdvkk/OTUU/x2o2HC/o8/F+cpTBsnJSm2MIrgwAlf6zqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwYkeh/v2yrCHhCAtdswUFnWvZ2aXBPzWn5Wy/GFUE8=;
 b=p5hqhoEtJ2o9HIf6BxR43pZ5ax8Zg8/urkJ9OR0tRlLG0PC2j5KJ+2t0r4CQk5nxbj5iUtGSGHdmSnsCALlite5VnPVrxY1eGBMSjeWc+HVFIy6XbQ6mnBi8TkVYDGxDRXcbQTwrDmryNTGzsG2Kbtf0QcgITuKHcSCMM8JqyFQ=
Received: from AS4P250CA0001.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::6)
 by AM8PR08MB6611.eurprd08.prod.outlook.com (2603:10a6:20b:36b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:58:35 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:20b:5df:cafe::19) by AS4P250CA0001.outlook.office365.com
 (2603:10a6:20b:5df::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Fri, 26 Apr 2024 16:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Fri, 26 Apr 2024 16:58:34 +0000
Received: ("Tessian outbound 082664cc04c1:v315"); Fri, 26 Apr 2024 16:58:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d9b9a1fa37dc5cd
X-CR-MTA-TID: 64aa7808
Received: from dfc35e8c44fa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 41F996A9-6307-408D-8257-E241FEAC6485.1;
	Fri, 26 Apr 2024 16:58:27 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dfc35e8c44fa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Apr 2024 16:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn4g0FMXYFgFEU2ae+SGSGkTNETL+4EHEt6pI/LeBR/MlaEld3GoHSSgdlflW+knyYgsUNXN/rg//mKxwREWPHcX9x0/Lnwd79R768qKPVwQU/UEY2DqjLf7esuZU7f+N/4g+yOvpLwg4lC+/Dg977rwazmUUatQErnQ3YM8fC4iqe4XHAMg00+awIfDJ6ZmnFyw3oooULAgkyjGYXeZPTPS9KBk3jLL7hXJgDtlAsI17EslmYFnlwxoQmr0dxS3kKZjABG1gq6r4URNvIf7b7skqfiGrQqzPNR/m3dR7vl/RpoY0/e9/kpFM6owaNUfb7yCs6Atf0aE/HNvdO3MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwYkeh/v2yrCHhCAtdswUFnWvZ2aXBPzWn5Wy/GFUE8=;
 b=MKUq5FeA5hAl8hOIivMX6xyoTCLn0E4PKpBOLjAFpxUvfHU6Dhq6O3Jr2/Ln/G4+93tALs+SojD5pncRvGPRNK86bVoaoiDTOOT1iBEXAUwU2OeqW1vKQBpmZMDz7ltmJwnYBsUnTS3pKmw7drkn5k7cUUHmxPQcQ6YVx+99XWzkRqsuMCyUnQcDFyjbPyV9+rI7W3uNW5tPwMS/7pp24IqPOC+QK+VTsl/9+K7kWqDK+QPpE0CCz8h25ZWMhuIKhJO4XCTX6CJ6kNv60w4GWhp2dGgVpsCyB7sm9Gt+4QR5YMHDen4ouhYzL8GGaKTOMg/OHe2umZ8KDZIYBsVang==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwYkeh/v2yrCHhCAtdswUFnWvZ2aXBPzWn5Wy/GFUE8=;
 b=p5hqhoEtJ2o9HIf6BxR43pZ5ax8Zg8/urkJ9OR0tRlLG0PC2j5KJ+2t0r4CQk5nxbj5iUtGSGHdmSnsCALlite5VnPVrxY1eGBMSjeWc+HVFIy6XbQ6mnBi8TkVYDGxDRXcbQTwrDmryNTGzsG2Kbtf0QcgITuKHcSCMM8JqyFQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5894.eurprd08.prod.outlook.com (2603:10a6:20b:23d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 16:58:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Fri, 26 Apr 2024
 16:58:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: OE-core <openembedded-core@lists.openembedded.org>
CC: nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH][master scarthgap] procps: fix build with new
 glibc but old kernel headers
Thread-Topic: [OE-core] [PATCH][master scarthgap] procps: fix build with new
 glibc but old kernel headers
Thread-Index: AQHal8YocV7FjFQyzEK245qCjC1KIbF6xk+A
Date: Fri, 26 Apr 2024 16:58:25 +0000
Message-ID: <4D9C9398-9B33-4205-BF45-0E7A0D0CB192@arm.com>
References: <20240426104001.3076365-1-ross.burton@arm.com>
In-Reply-To: <20240426104001.3076365-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5894:EE_|AM3PEPF00009BA2:EE_|AM8PR08MB6611:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e808302-65dd-448a-f154-08dc66121beb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aU9MdUg4RlNZU2lqaklzWGdOQmVZazFEYW1qTUV5R0VNc3ZFaGVPaDN5SDlV?=
 =?utf-8?B?WU92cWlBUGh5dzNnSWxDZDRwM0N1WGJOR3dKcmF2OWswZk1NeGVvaTlFUmxX?=
 =?utf-8?B?MFAyVElGMXRaeVpRSzRTZXNJd2ZwS3dnd3hWcm11WG1vMVFiUG9qNEZmbWpy?=
 =?utf-8?B?bGwrUFdRSnFzUExSdDNoM3lTREZDRDdOSTBhbzE3bVhEb1NQZHpQeHNuTU5y?=
 =?utf-8?B?RjF2MXhYdlU5dThlcWM1TTE3SzFubmt6Q0RZQk9vSnliUm84d1lSd29vcEcz?=
 =?utf-8?B?VEdjYkd6NjVZQnBjdW11cEM3azRTbktpbjZkU083ZCtnQjJWRkdMU1VaSTlP?=
 =?utf-8?B?VzZCR1QzMEEvZVBGL29wQmNDbGo2eHl6aDdEb2pkbjlzRTVZMC9mSy9NQVI2?=
 =?utf-8?B?T3NvZ0N5TnNXYmVlYm0vTmRPRGY0clZvNDBRSWdiZHJ6M3EvUUR6TWJScmVS?=
 =?utf-8?B?U3FOOGxucU10MkUzaG5wUWZoUVhydU9ndnNYMUZXeDVPeE1sTlA1QXNmOUR4?=
 =?utf-8?B?OHZpRkM1bVkvNFoxL3dodDdQMXMrSXhtZGZxZm0zQ2xBZzc4NjIvTjF3blIz?=
 =?utf-8?B?RnVkbVJMMng2WXNRMW5sRHV4UElpcWk0V1dZSzE3WVk4UmdteitnVnlUZlgw?=
 =?utf-8?B?UndDRXZTUTg1aXNNbXY1RjVVM2ZzMUtEUWt4enI4b05NaTJJRzVqRGtCOXI5?=
 =?utf-8?B?T3hCSGFrWElQYmk2K1ZKczU3TjFjb0tqang3bHpubkxCa0Zwa3N1TjVQMWNh?=
 =?utf-8?B?K0F3VG12QngxK2YyMVFCUWNPQ2ZPUUl5Q1h5QU8rOGpBb2lZeXNoWkwycTg1?=
 =?utf-8?B?ZXZGeUVYUmE4blJoM3hyNXAyZFh1Rk1ya1dIUW5QNXU0K3NsM0lYSC9vSSsx?=
 =?utf-8?B?TjZDcElKVjN6cVpFK1hXMDBSTW1NTDNGSnN1WCtJMWpRd04vU2dyUk9OUzZQ?=
 =?utf-8?B?YjlaSHgrOGdYUXFUNlpPUUw4WG9ocnhzYlNic0dlQzZOaWs1TSsrOFVYdk9t?=
 =?utf-8?B?ZDlEdU5DWGFtUVNhREVIMU14aTlxRXQrNGNzTnErR0xiTU9JWUFYdkhLeXY0?=
 =?utf-8?B?N2JudWZ1MmdsQjJ0MndUREsrZElkNEJIYmdxdmxUZFJ0RjdHZ1BhYzNGOHJk?=
 =?utf-8?B?U0xMWGY4c08yYzJFdDZvL0d0Sm82T2tidk5qZ0R0cDhmN1BPdVV2Vll1YjRD?=
 =?utf-8?B?TU9nUTVsdXVGVjRkemRkN1hPM09EZlJiTWh0M0cyL3BJUWdXQnMwNEt5R0hi?=
 =?utf-8?B?T0JybmFkdXgvYTJMcFpLUnV2Y3VpR3VLZFRaZWZTeFNEZGJKOTVWc1VRd3Zw?=
 =?utf-8?B?dVJ0bkhhejhnTkx6dzRqazJiQWYrR2kwOHQ1WFhvUThoTzN1bWZxbDl6MGs2?=
 =?utf-8?B?T1JLT3BvU0JxVW9FVHJ0cUp3TDBTaFpGd3VyWmdZK0p2MEdCNFRkWWNIL0hJ?=
 =?utf-8?B?clo0aUVBNEMzcHV5TmVVeXJsazRDdkJPZjN3SUtrUkxMZHpqTERiUU9LSHNG?=
 =?utf-8?B?cWFsd2RlTXdqeXExRVl5U0VXMk1DeEl0T1Z2L0NCdTZvSE9FSHlPZ1BnUGUr?=
 =?utf-8?B?UWszVHA0bUpUR0R3bUkvR0FtZ002NVl2QnZ1MDI2bWZTWHhQM0twVUhBNXM1?=
 =?utf-8?B?VEJtck1HMDhLRzVxSmRBd0xKTkZnOUQ1Ny9HWHNDa0tQcisyMHBHOW5rcGhi?=
 =?utf-8?B?dS9ZNWZ3ZG5vamNlSUhlVGw0OXMwZ0dlbGI4MzNFSW1tM1JPdFBXc3F3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0B39ED212F1DF49A1069A2337D2127B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5894
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b783389a-1f51-413b-124e-08dc661216db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UzBFTGtjME9DUURqdGRBYmRWWmJFTnVHeElvYTJ3S1dCNjFsVS9iMnVkbDdO?=
 =?utf-8?B?S0RjRDVVWDVHNWw4Ny9BQzZDUUU2a0pxWk9lU1RaTWt5aXRtQ25sbFZrNmtO?=
 =?utf-8?B?aVo3azlXVDFLUnByUjlRT2dOQ2t5TDd1M2RxV2F4dDcrYi9PNFJmRVYvR0kz?=
 =?utf-8?B?M1lmZGYxQWVrS1kvOUNzVnpRSXdwT0drck9LdUNHRHk4MjdHZW5JcGZ1OFg4?=
 =?utf-8?B?dCtzejlaWHdueXFFOFdtYTQ5SjhWSWx5NUVqVjQ5VnV0YU1WMkhuUExWOXlX?=
 =?utf-8?B?QUJkaVppMjBGbkRQaCt4cnByU2dGenl2YjB0WHNSZDNwckh0Y1gwRkZHRlhO?=
 =?utf-8?B?Ym9OeGdjb2hlSVB2ZkcrNXpjMDY0R1UzbXdBSDFEZ295NElsYTIyZ2pjWGcv?=
 =?utf-8?B?d2dEZlJ4dlV1dWtQTGJsWUZ2dWRZWiswcGdhTTlVQ3Y3RVhNOXpGVVRvb2ky?=
 =?utf-8?B?Z2IzdjNBSlhQRjhDWlR6VTczbnpZUGlPOTA0SHdBUkxSZmptYVBaSlVGd3Zt?=
 =?utf-8?B?bGs3MmNuY1M3RmtMdStuMzdZU250SjhRMTU5VWxHbHVwSEZYYUJlMEJoZ3g5?=
 =?utf-8?B?ZmRuVXY4cFVZc0NBaW5qSUYxQmMzOWVRa1NoZjJHMy9MV0tGZnhzYjhqZmVP?=
 =?utf-8?B?M0dPVEVYV1QxVTcvZXFGU3k1MW1VelFubkxHaE8xeDU1dDAwVkNsQ2xOdm9z?=
 =?utf-8?B?b0lML0hBdXVVb2VpWHY5YzladjBQVVVMZ2tHT0YzWDdBM2E4YUVKcVFWR0dF?=
 =?utf-8?B?ZHZ6aGJGTFNoWHVxS3lHYk5DcEFhVmxLRUE2dnlBUkl3Vy84QjA0c2RMS05N?=
 =?utf-8?B?N245VHVCcE5lVlpSVUxTU21MaWp5ZXZHOXordjEza3VBMWs2UU8vY0JIdjNk?=
 =?utf-8?B?aFN5anlUbjN4ZVZNUXhPWGhEK2sxWXFRMlVkSGh0Mm5JYzZhSm4wMkFGSzhQ?=
 =?utf-8?B?VWo5MDFtUURmTFJRYVBlSHZZVkRNRlRTZWNsRWt5UnB3Um9pL3gwZ3ZZMEJi?=
 =?utf-8?B?aEd6TDd0b254OU5xRlU3ZitGWDBXTFBGbjhtK1o2QlBxQTBMRUNFTk5ZWnJI?=
 =?utf-8?B?cUNYQjhSNzNLbk10V1Y1V1VEc2JQYzFPN3B1QytwdlhtS0I4Vmx1SDhlalFZ?=
 =?utf-8?B?T051cHJNL2RpZGhTMW9wYmJ3OWdLM1dnbGgrY0lsMFBhVXFROExubGhGZ2E2?=
 =?utf-8?B?eitiWkhVU0hkaVg0MjNyeG1EaUsybHFPb213bVk0cWJ2QjJrU1hCYUp3dVEz?=
 =?utf-8?B?dEFxNFlRL0hqQ3duVEFScWtoNjMxMWh4dXhDOGRBMVRhTWhQWjhyVXVIczEr?=
 =?utf-8?B?MVBqWkMzQkhLejNrcmJHVkl3NGx5RW14ajhNL2RQdUxQTWJ1WjVXdnZIRStp?=
 =?utf-8?B?VWdiNVNZQlJ5VWVlQ1RuTW9aZkhGNFBLSGRWRWdMbTBkVHpkZ3p0VXpLbzF0?=
 =?utf-8?B?UVA4NVNENWJtcUU0Vm9VUVBCVUdYVkwrY2N1aFRNTndMd2JzNHYyN0tKVkpU?=
 =?utf-8?B?NWZGaHNydzIzUWUzNHBHdGdTSmlCTG9tcDRZNjdpWVoxekFQS2lMdCtmcDh1?=
 =?utf-8?B?bks5blp1ejJIdkNadlVCNHZvU2xWdERDbExuOXplNGIzQkRKbkJIOVd6Z1FB?=
 =?utf-8?B?dWlVc3AzRkk3di90ZVVCK1RJT1Q3M2JHZXF6TW1ycUI0U01TMncvOG5INTdn?=
 =?utf-8?B?NFJ0MTV5UmxLZm9veWtOdG5pdkNFRVJtVk1yaFBIajJqYzg4RHEzR1hTRGZR?=
 =?utf-8?Q?KuVpX+eojaE953IYznrBa/8sUCxBNTGaq0IuuQp?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699010)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 16:58:34.3034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e808302-65dd-448a-f154-08dc66121beb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 16:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198723

SG9sZCB0aGlzLCB2MiBpbmNvbWluZy4gIEl0IGJyZWFrcyBvbiBjbGFuZyB3aGljaCBleHBvc2Vz
IGFub3RoZXIgcHJvYmxlbSB3aXRoIHRoZSBjdXJyZW50IGNvZGXigKYNCg0KUm9zcw0KDQo+IE9u
IDI2IEFwciAyMDI0LCBhdCAxMTo0MCwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPHJvc3MuYnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiBJZiB5b3UncmUgYnVpbGRpbmcgcHJvY3BzIHdpdGggYSBuZXdlciBnbGliYyAod2l0
aCBwaWRmZF9vcGVuKCkpIGJ1dA0KPiBvbGRlciBrZXJuZWwgaGVhZGVycyAoc2F5IDQueCwgYmVm
b3JlIF9fTlJfcGlkZmRfb3BlbikgdGhlbiBwcm9jcHMgd2lsbA0KPiBmYWlsIHRvIGJ1aWxkIGJl
Y2F1c2Ugb2YgYSB0eXBvIGluIGNvbmZpZ3VyZS5hYy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJv
c3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiAtLS0NCj4gLi4uL3Byb2Nwcy9wcm9j
cHMvcGlkZmQucGF0Y2ggICAgICAgICAgICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKw0K
PiBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHJvY3BzL3Byb2Nwc180LjAuNC5iYiAgfCAgMSArDQo+
IDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9kZSAxMDA2NDQg
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHMvcGlkZmQucGF0Y2gNCj4gDQo+IGRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcHJvY3BzL3Byb2Nwcy9waWRmZC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wcm9jcHMvcHJvY3BzL3BpZGZkLnBhdGNoDQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwLi40YzE5MDQzNDk2Yg0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wcm9jcHMvcHJvY3Bz
L3BpZGZkLnBhdGNoDQo+IEBAIC0wLDAgKzEsMjUgQEANCj4gK0Zyb20gYzhmNjI1ZTA4NWI4MjQ5
Y2MwMDllOGIxOWMzYTE5MTAwMjE3ZWIzNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zy
b206IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiArRGF0ZTogVGh1LCAyNSBB
cHIgMjAyNCAxMzozMzoxNSArMDAwMA0KPiArU3ViamVjdDogW1BBVENIXSBGaXggcGlkZmRfb3Bl
biBkZXRlY3Rpb24NCj4gKw0KPiArVGhpcyBjaGVjayBmb3IgcGlkZmRfb3BlbiB1c2VzIEFDX0NI
RUNLX0ZVTkMgd2hpY2gganVzdCBydW5zIHRoZSBzcGVjaWZpZWQgY29kZSwgYnV0IA0KPiArc3Jj
L3BncmVwLmMgY2hlY2tzIEhBVkVfUElERkRfT1BFTiB3aGljaCB3aWxsIG9ubHkgYmUgZGVmaW5l
ZCBieSBBQ19DSEVDS19GVU5DUy4NCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nDQo+
ICtTaWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gKy0t
LQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjDQo+ICtp
bmRleCBmZWMyN2UzZi4uMDI0NzMxYzcgMTAwNjQ0DQo+ICstLS0gYS9jb25maWd1cmUuYWMNCj4g
KysrKyBiL2NvbmZpZ3VyZS5hYw0KPiArQEAgLTE3MCw3ICsxNzAsNyBAQCBBQ19UUllfQ09NUElM
RShbI2luY2x1ZGUgPGVycm5vLmg+XSwNCj4gKyBBQ19NU0dfUkVTVUxUKHllcyksDQo+ICsgQUNf
TVNHX1JFU1VMVChubykpDQo+ICsgDQo+ICstQUNfQ0hFQ0tfRlVOQyhbcGlkZmRfb3Blbl0sIFtl
bmFibGVfcGlkd2FpdD15ZXNdLCBbDQo+ICsrQUNfQ0hFQ0tfRlVOQ1MoW3BpZGZkX29wZW5dLCBb
ZW5hYmxlX3BpZHdhaXQ9eWVzXSwgWw0KPiArICAgQUNfTVNHX0NIRUNLSU5HKFtmb3IgX19OUl9w
aWRmZF9vcGVuXSkNCj4gKyAgIEFDX0NPTVBJTEVfSUZFTFNFKFtBQ19MQU5HX1NPVVJDRShbDQo+
ICsgI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+DQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvcHJvY3BzL3Byb2Nwc180LjAuNC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9w
cm9jcHMvcHJvY3BzXzQuMC40LmJiDQo+IGluZGV4IDgwMDM4NGYyMmY3Li5lYzhjNGIwMjYxYiAx
MDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjQu
YmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3Byb2Nwcy9wcm9jcHNfNC4wLjQuYmIN
Cj4gQEAgLTE0LDYgKzE0LDcgQEAgaW5oZXJpdCBhdXRvdG9vbHMgZ2V0dGV4dCBwa2djb25maWcg
dXBkYXRlLWFsdGVybmF0aXZlcw0KPiANCj4gU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuY29tL3By
b2Nwcy1uZy9wcm9jcHMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIgXA0KPiAgICAg
ICAgICAgIGZpbGU6Ly9zeXNjdGwuY29uZiBcDQo+ICsgICAgICAgICAgIGZpbGU6Ly9waWRmZC5w
YXRjaCBcDQo+ICAgICAgICAgICAgIg0KPiBTUkNSRVYgPSAiNGRkY2VmMmZkODQzMTcwYzhlMmQ1
OWE4MzA0Mjk3OGY0MTAzN2EyYiINCj4gDQo+IC0tIA0KPiAyLjM0LjENCj4gDQo+IA0KPiAtPS09
LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNl
bnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMxOTg3MjEpOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE5ODcy
MQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8x
MDU3NDc3MjIvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5j
b21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

