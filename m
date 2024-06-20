Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC9A4C2BA18
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 09:57:49 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.43])
 by mx.groups.io with SMTP id smtpd.web10.44083.1718877461661601692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 02:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=en6Q/6u8;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=en6Q/6u8;
 spf=pass (domain: arm.com, ip: 40.107.15.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JI1FqCKikyq9hKPC3nAczEK/GfyoP9pT1/uL0OpXeHkX/dmuJNPFFipDfS1tZr89ZkfzBysnBW2sogB0+onuhpiyGor4WnTXBj3kw8NbMRUai7lkBVgo2fCXfXS1xnftEYF2rA+984nRqas2njFbM6F9ZA3ite5WABc4QKg9e7Wg1QJerD15Cb+dnW9DMTGfFG+L5+fE1X+8JxHfRO/gU5Q9TufIPMmB1ksKUpYPwixJL8Cu94V1ZnjJGvfo1w16Rxui0YhiClYTJQ93J7/dYJaKWsR3Ikmd6YqB8F6F/C4vwobk/8CPAM417+VKDNO4DZ7VHftstDsPU/IYHf7qKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKN32hbwBlkkJCTGKj8pPLUZHfAk6j/CuMC1y9rcn7M=;
 b=bn04V2fWrRjoNp7mAkWHSWb5TB+2/PHrNiuaVE6VESdUeuIDUmVYazl4Y5h2OIVHcdM9BB48tDc8flt2JOGVciV3AfU5u9tDHe/Lrn9ZwCZqWXlTiXN1eSuJ6PrYnegVXIwnBtoUD0Uu++QZw1DI9lTvFbd5E7gUZzOtvdAuVTtwD33h5N7Bv0v9p6kM39jh9oDYeawFzutS5sFYpPGftB5Bu+CaYzE6cTcaNgLnSqrjTQasz+KCLaq+kSapevOrgQok3ZqCtjZypTergzoacapwHMLiBDNKuwcDS8tCWhsfTXPf0MkpDRMrZ7vJOSaJx+Xe0ED59QS3rE4RpltADw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKN32hbwBlkkJCTGKj8pPLUZHfAk6j/CuMC1y9rcn7M=;
 b=en6Q/6u8Npsu85D6elt2bvtdgBBqWdTIUQwqJel+rPUR+IULY/9M4jwmt8xA6uZ8Lox5gtmBJSbwAZQhB4oTPlfI4xchoxibNx1RUUwsf9NrRsVeh0UusBY/1fFbunxJaA6t19vaHvyhr66sM+Bd9Ds8ElzW9VnedWPlxqNDUcA=
Received: from AM6PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:20b:f0::25)
 by AM9PR08MB6690.eurprd08.prod.outlook.com (2603:10a6:20b:301::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 09:57:38 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0:cafe::25) by AM6PR04CA0048.outlook.office365.com
 (2603:10a6:20b:f0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.32 via Frontend
 Transport; Thu, 20 Jun 2024 09:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 20 Jun 2024 09:57:37 +0000
Received: ("Tessian outbound 01519d7ebfdb:v339"); Thu, 20 Jun 2024 09:57:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3e2e308dc35166ae
X-CR-MTA-TID: 64aa7808
Received: from 8469dc0384d2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1E2BE4B4-D3C2-4CB3-8E02-8AAD22B3C764.1;
	Thu, 20 Jun 2024 09:57:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8469dc0384d2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Jun 2024 09:57:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YYCS8JsFcy1dFnctylPJ5ueVRh+kHxP82jYjqG91jega0zsJSS7eLupzxmvsdJkZhtv1oJt/qLuMBQyzmilI0KUzMQcKt5eM1zrpuWYNC3iyZKHx6gcd2j/ZoMb3z7/lI7kREuUsiQdhNaEskma7fdFl6l7UM1v2g40DoAemai/+rkEKAkjVMntAG2ZZZRIgGE6zSi5VMH2izEi4qciwdWs7vJsSYLYKhHZvAASb0OtM9UEY/GLeOsE5Mvw4JwtI9bsyckoGNegqHqhPjybqHt9dAmz5qw0kpcZ7YIu7MOq4lXwN9GP6vHyk4wbPbHLynJnRb0pDpRMzD3LssRW/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKN32hbwBlkkJCTGKj8pPLUZHfAk6j/CuMC1y9rcn7M=;
 b=Zv0S9zkKw07DKOgj5bg81E7L2KjayOjdHEW+toh+3p0QjrPwfiCaAFXoZg4bXPOS+HkNBvfvJLT3Tc3ynTWuxH7aZQYNDt7OGQRbFrJRVy67WlLtApT3QAE18ZZf0zT0ZdwmYDNDky4db/mb0miB83oxN40srKtGLUI+8KXfJKOuh3E8775UJ4jPFUm4pWiYWH2i5Q23P1eEPo6618f0ZmuWjE5K171buxTJONUul9F02D0Sr020CnIV4WKoyRBJjdhgKH4XHaG7Xty6eweWSPO4GBYMY+a42u5bfrGI/nGc00R4f2gugnn8yGfnGyGii72USfcaUjPnVtA9Tu26Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKN32hbwBlkkJCTGKj8pPLUZHfAk6j/CuMC1y9rcn7M=;
 b=en6Q/6u8Npsu85D6elt2bvtdgBBqWdTIUQwqJel+rPUR+IULY/9M4jwmt8xA6uZ8Lox5gtmBJSbwAZQhB4oTPlfI4xchoxibNx1RUUwsf9NrRsVeh0UusBY/1fFbunxJaA6t19vaHvyhr66sM+Bd9Ds8ElzW9VnedWPlxqNDUcA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8194.eurprd08.prod.outlook.com (2603:10a6:150:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.35; Thu, 20 Jun
 2024 09:57:25 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 09:57:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "gudnimar@noxmedical.com" <gudnimar@noxmedical.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from
 RDEPENDS
Thread-Topic: [OE-core] [PATCH] python3-setuptools: drop python3-2to3 from
 RDEPENDS
Thread-Index: AQHawmqoWjRk5aOEm0iOHXoU6/dsYLHPUU4AgAEaUYA=
Date: Thu, 20 Jun 2024 09:57:25 +0000
Message-ID: <B2D135A1-D55A-43D2-8830-3DA7393D44C5@arm.com>
References: <20240619170307.4351-1-gudni.m.g@gmail.com>
 <6942.1718816808373956647@lists.openembedded.org>
In-Reply-To: <6942.1718816808373956647@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8194:EE_|AM3PEPF0000A790:EE_|AM9PR08MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 7adeb547-0427-4559-9965-08dc910f6a9f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a2FXL3RQSkYxZElBU1QzbHd6STVUdStreWZLNnVkMmVET2VDR0lCL2hPYkJn?=
 =?utf-8?B?UDBVWmV2RGRHV2NFVGhTNzA0c1c4MXczK3lwWXJtVGV0a3p4eUZyWnNPNTZz?=
 =?utf-8?B?THM3WFRhUnE0NmRIVVpwTFc0VURIU2hoZGMvZXhXbHc0QTl3QVlQdHVqeC8w?=
 =?utf-8?B?eHFRRmcyQWx3RGhtNTEvVSt4NHJiR2k3WGdJbkF1ZmkrOUxoMUJTc0JRbXFJ?=
 =?utf-8?B?dHRmT0RQcktIdUF0VjcyalB4cDBLUHZTOFQyRnBxanAwQU83TEV0SUFWdWVW?=
 =?utf-8?B?bUYvZ0hyRzRTVHdpVUxiL2N5alAwUEZvL0pTakpVVTY1Yk9nNll3QU5WZjlk?=
 =?utf-8?B?WGZaVkxzU1RrWXI2N1Y0NUNPQkVNOUo4MWNnOHI4QU04c0J2bDEwblpSVkxY?=
 =?utf-8?B?Znh1S0EvYXo1a0MxODYzOElKcnFSdHoxeXBWQzlzWnNhSE1pMVROTE9JZ1Ix?=
 =?utf-8?B?aE1HZUpwb3VRVUM0a29Fc0svQ01salc2NHV2MmliUlpIeTFoR3lqM2VNVWJV?=
 =?utf-8?B?T0h5ajlDMUg0dnpSa0VNcHY3SURoTnptWEYvdzhGeTRBdXBBLzBRaHdwcGds?=
 =?utf-8?B?NWRVbjgwL3VSczZDUWxxUjZSaHFHOEVGM21EeDAvKzYrNUswTGF1OHEwd1dm?=
 =?utf-8?B?QVJOSkRDdHhQcjd6VzhhZTBVRlF2RGRJVkxmMURWWGlXYkw4dk5ZdWQvd05X?=
 =?utf-8?B?NEVWZ0lzZTJOMVd2Q1FRY1NpS3UwL3R1bEc3Q3JhUVRLNWxzUXgwZHRJK2xo?=
 =?utf-8?B?RmZrQ3F3cEtsb1d4Vit4WkhFTUFhSTZBSm9sOStrVmpDeUdrQkN0bkJIVlBw?=
 =?utf-8?B?ZzNyUlpaUGdGTHl5Qy9NRnBNVlg2Y3pIYjN5Uk0zNG5wSWRtd3pxU3ZhN21i?=
 =?utf-8?B?ZXJEeENYTzRkNXBFS1F3NGREK1JJbER3Rms4M0ovWndocWkrR3Jxb3loZGxw?=
 =?utf-8?B?aFFiUkx0SGJDZ3BQOERMZUtKN1RWMU5KMTlHOHpDNFRaVkYrWkg1NnkzUkFV?=
 =?utf-8?B?ZnlhRlh0QXFYY0RXdEtpbS9Mdkh6dkU1ZDZGWW5XTHljcGVmZHh3cGlJRDhh?=
 =?utf-8?B?SjIrTDkvM2oyLzF2eTRoanB0YnM3OFBwcVR1b1lTTitTWmtlTnFZZmliektO?=
 =?utf-8?B?SW1KRVdPaW9hUlVqbXF3WkxaNEovNVN5VHRXSnh3dFJxYnRDM25xN0JnY3ZC?=
 =?utf-8?B?ZzEvcWExZklua0xSZUZrV1IrNThzWFBRVE5ZZEJBbkFmR3VMTS9DZXRtZlFj?=
 =?utf-8?B?dm9TeVQ1QlBHQTJBYkxiWC9OQ0JjZEF0MGpiMm1lclIrL2M0R2RsM1U2dEtY?=
 =?utf-8?B?SFZETzR4YklyYnZxNVIwRkVXQndOYVN2WHdvU2ZzUEdsZ1FNS3hkdkJuOXJr?=
 =?utf-8?B?NGNhSVR5dERMMitETk5rRmZzWDV5TTRhNkNWbVZITHFLc2hvc1RnWWlQS3R2?=
 =?utf-8?B?N0lVM1htdnBOaURTQlQ4T2M0TFkwYUlpUDNIWDhibTRPNStqU1U1S1J0QUk4?=
 =?utf-8?B?Q1I1Zk5JY3ZWc0cyd1RwWnZVS04xWHNxeG5yaUhONnNvRWJhZS9iZ2F5aGU1?=
 =?utf-8?B?SWUvaTlLeml5Q0thZEllS3RLL3NEcXhMa3FTWkY5M0hBeXBMa2k2OHM1UHpa?=
 =?utf-8?B?WnR5LzlPL3FSdHNYdk1mN3hLY1RaeVpXSkx0WkJOZ0ZBaENUOWRJd2RWTk5p?=
 =?utf-8?B?WTFDTUVvSTNJL3lRMS9SV2VJVG9rSEs3WHdzNXNaaGdIL1VValBZbWtTYVAr?=
 =?utf-8?B?SnBsWWt1cTQ2eUlsNFMvSXJnQ0pzNlo4MjVvM1M4T0dVd2N0OW4xbGo0NE9O?=
 =?utf-8?Q?EByEEP+eBs4nBQjbW6Wme4zQnBN6IoWqDulCA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAFD6494F856014A965B7ABAAA87253D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8194
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	30b45574-3a23-4e34-d717-08dc910f6332
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|376011|34020700013|36860700010|35042699019|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cVdyYnMzdm9xbldMRnl2MDFESW44Mzl6MlNkMHRTaG4xcEdDeUsxclpsWmNJ?=
 =?utf-8?B?YXcxWUZqVmlNNVg3YVBFTWVoajhVUnpLdlN6VURhcjY2RXhkQXptYmJnSkZ3?=
 =?utf-8?B?M0VxNllIT0RXNTZINmkyMGphNU1WQUM2aVBXRWxrbXZFVFRMNm1oOEpwdldE?=
 =?utf-8?B?eGIrdGZBdGNvNytaNm1jdHBQN1krTklXR3lTNVdwdUxYZE9jMVlIc29tUDdG?=
 =?utf-8?B?QnZIUzdyM1MwdnZmQ2MvUTFzZlhvQzhxbUl6QVlrN3dHZUM4THU0K2E3TzBz?=
 =?utf-8?B?dFdDZUx4YWhUNVFETkpXWG9TVzE0VkFKYmFSNTVkeHJVeTd2YjdRNXF5N2Jh?=
 =?utf-8?B?VWJWWTFMcHM3aXVHVFgxM2xFV0lFMjF3LzcwcGpxamZsMmZWeE9nekdKTm1S?=
 =?utf-8?B?Q3NhSGdzU21OOEFobG1XRUFtZUdBWUhGbnMwUW9RUk93WGlEMWhpUk56RTl4?=
 =?utf-8?B?RVEvRXIrUkJUNU5jN2F2aEFTVmNzNGc1Y245SGo5aWVoNHZBU09WL0ppcjkz?=
 =?utf-8?B?dVdWQ2s3cHhKZ0hMSTNnSXoxS3k0TU5KK1FhamNqMStHT214QmtqbnJsMmdl?=
 =?utf-8?B?WDJINjhrVGkxMjlBdDZhZCtCUzJCbGQxSmNjWmltL1IzNUZ5c1U4c21BMnc1?=
 =?utf-8?B?UFVTeU14SHR2Q2ZEU21uRlZWVkhKMmNGc1RvMVIzQTI4UUNIVDNsMTZNZTFv?=
 =?utf-8?B?NklPdmF6QWlTRFBMVXJlL2liRXZYdzBhdnQ3dlBvZjBDNkNybU9CYWJjNFA1?=
 =?utf-8?B?Q3dSNHdRd0dIeThEbzZzdU9YSHpQOGtEY3VRVWZ5N2Z3SkE0Rm0zaWJVeEhm?=
 =?utf-8?B?dDhvV1BacEM2azVscUROUGI0ZXF1d3NLYndaSkhoNVI2d09MTUZNYklya2p0?=
 =?utf-8?B?cUUxbW9IN1dQbEtSbk1HaUxLR2g4NHE2WG52MHZvcTl3UXpzRXZqT1FSaUxW?=
 =?utf-8?B?YWpkc0krbUplVWpEOEY1Z0FHZU85YWVrek90YTNadEIrYkdyY0VITldTWVlk?=
 =?utf-8?B?dkNtT0Jlc1kwa1F5cFlhbm1pV3RmVXVySTBLbCtha1AyVlJ4dDBndG4zWjhM?=
 =?utf-8?B?TWkrUGh6QlBMSnNuVzVaMnZ1VG9pS3YwemJ5MU94bCs0RVZnTk4yWnlGRzFL?=
 =?utf-8?B?UTcxcW5XaUZiY0EzRC9kY09LYmhQb2J6TzJRN2xGcnFSU253cmJtTnRLVWZk?=
 =?utf-8?B?WVZOUjB5aTcxK3QzVlBjMU13SVFmcDRnTGhpUjNTdm1aT080N2pSWXBVdm5y?=
 =?utf-8?B?VTJXb0RUYmxLQ016ejYzWG9VbVdFSFF2dEZEOTJ5K0hSRm5zVFQ3UW1tUHNM?=
 =?utf-8?B?TklWRXNKY3FmUWRPYUxWMnNLQ1hSdnAwcWNKSHhxMXl4eEt4QWxZaUlWcGFF?=
 =?utf-8?B?NUwzMzZ4ZzFyTHluYWhURUxscmVveFdNRS9DNXJCSnBoTEd4dk9ySjUzTEFo?=
 =?utf-8?B?WXlGT0ZFeWFmdkczS2MwbFJ2RTJRVTFFb0ZtNDJCZXVaUHB4aEF0RnJCTktQ?=
 =?utf-8?B?eEVzRmNMTEZmTzhmNGZ5bC9FckdGeE9LWFc5VWhiYm5OVWlyV2V5dTdoRXA3?=
 =?utf-8?B?WElaR3RsQTNtb0F6SWhIRlZUNWhOYS9QYldEMHhSQjdpN3NIQktNS1U1T3pi?=
 =?utf-8?B?bUZ6aGZ0MXVYaVdSZTJ4b1U0bjA4dS94NlJzaGdUaWt0NnowN3lBYTVGZDlm?=
 =?utf-8?B?QmdyTjdnOWQ0SFVscGNOVkdKckEyOVo5NWlTSDR3N1RWWjE4MjR3RnVlSi9L?=
 =?utf-8?B?ZWUzWmk4WUNZQ2lTYnk1REl3dXJjUHZUTkljMWUyZm5lNzNzSjBndEhGVVF1?=
 =?utf-8?B?RnZxRDZSTDlqTGJqRExBV0lCUzdYaGcrcjBRVE8rVE5mMzVHY0FDUWMwVVhH?=
 =?utf-8?B?c0hlZy9MU3UwbjRmQWlMM0ptQkw1bDJScmdSS09mckJ4TUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(376011)(34020700013)(36860700010)(35042699019)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 09:57:37.8524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7adeb547-0427-4559-9965-08dc910f6a9f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 09:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200943

DQoNCj4gT24gMTkgSnVuIDIwMjQsIGF0IDE4OjA2LCBHdcOwbmkgTcOhciBHaWxiZXJ0IHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxndWRuaW1hcj1ub3htZWRpY2FsLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IE5vdGljZWQgdGhpcyB3aGVuIHRyeWluZyB0byBv
cHRpbWl6ZSBteSBtaW5pbWFsIGltYWdlLiBJIHdvdWxkIGxvdmUgdG8gc2VlIHRoaXMgaW4gU2Nh
cnRoZ2FwIGFzIHdlbGwgaWYgdGhlIHBhdGNoIGlzIGFjY2VwdGVkLg0KPiANCj4gVGhpcyBjaGFu
Z2Ugc2F2ZXMgfjYwMEtpQiBhY2NvcmRpbmcgdG8gYnVpbGRoaXN0b3J5IG91dHB1dCAoZ2l2ZW4g
bm8gb3RoZXIgcmVjaXBlIGlzIGFza2luZyBmb3IgcHl0aG9uMy0ydG8zKS4NCg0KVGhhdCBkb2Vz
IGJlZyB0aGUgcXVlc3Rpb24gb2Ygd2h5IHNldHVwdG9vbHMgd2FzIHBhcnQgb2YgYSBtaW5pbWFs
IGltYWdlIGluIHRoZSBmaXJzdCBwbGFjZT8gV2FzIHRoYXQgYSByZXF1aXJlbWVudCBvZiB5b3Vy
cywgb3IgaXMgc29tZXRoaW5nIHB1bGxpbmcgc2V0dXB0b29scyBpbnRvIGFsbCBpbWFnZXM/DQoN
ClJvc3MNCg0K

