Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E2ACAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 09:56:18 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.37])
 by mx.groups.io with SMTP id smtpd.web11.7609.1758794177422615941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 02:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qYtOEYd0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=qYtOEYd0;
 spf=pass (domain: arm.com, ip: 52.101.84.37, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jOAnRjG6wGIsAz44uQj062jw+ETG/gJA8HiUYdR495IwqyFFoEzJE0gnC2cnWvvFKzB+wwlBUCfHagCIo4UTdj1sBPMXywrPfu0pVDXd35m40MqpU9aiKSwCILnMmxxMbM1yZZYZ7qb9NUeVWZKEEUAFD77BDix9zWemYPEfbl35JYXWP1dhQabON5TCmSDazP8xcuBZ+Eym+eYjdLYq5+sormFkWE/UTNun5Zdye1WySN8RcTaF3GKhUulQPesypKv0Fc019/QDA195MDFQhVFlrn6q01F+z2uHPzUQzVOU3NUg95ceIDPDyrkFa5LyiPQF/hRutJQge7wHv+7AHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uit8i6yh9S7FEhMEK0eA9jh62mAFaSQJZwoIfFFMPmg=;
 b=WmqeVZfHI8atCzxoN4X2DdVGWrH/fqboEzh2MnALGMyqHBthGZ5ogbh9thLd/ti3+lp3rfIJDEwvJhJTRq9kmaGKVyuyGfBdPLORE4yMoRqxgnffi/AtHh2VS/IYABhJQLj7vxFZlgrXbfknNLOEyIZxIishhvWeRSXciXkfTKrffgh+7RuOL3bEq4ayqEkIYOJRo+t3wxlNIZBL1KtTCMFF/iEIqw4pgyeFvd9RLoPr4S9PUA5KOpeS9vLZ04LpA9MIUpWlbR/zWONM4fgLxwKN8gY4rarcUjSXvVwXlS1bnn06vDtA3OJb/8jUhef5f8XDj6iTRU1KehVMNos0Kw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uit8i6yh9S7FEhMEK0eA9jh62mAFaSQJZwoIfFFMPmg=;
 b=qYtOEYd0OIQx4gUFdflrHLsd/Dr1AwKYkPgGORRUjIQ948AStFaz5IUBu9n3BmQN9w3W6XZ8Xv9Lv5TEtI9bVJpKDQrvEpX5myprKdRcsvftebLLT7EGSOuloe+Lh7eE9hD03UsC5vtKAdCPCJnjNgz+jZU9R35ACPCrpg9WnO8=
Received: from AM9P195CA0020.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::25)
 by DU5PR08MB10494.eurprd08.prod.outlook.com (2603:10a6:10:516::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 09:56:13 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::c8) by AM9P195CA0020.outlook.office365.com
 (2603:10a6:20b:21f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.21 via Frontend Transport; Thu,
 25 Sep 2025 09:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 09:56:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovP0Zg/ash2Gz5CUMtsDLjRWoqek+HZoSSW0sE0TFv72aBZxTdZJtCKNFgFVWjlN4Ff4zDcHKnxoy4ym0vbKGyTvNcq+wH75UdW0eZUm3OEPvt1nZZ+mlQ7QIMmz3edbUWTDTsj+VxC268HwCnusVVucNf2UTkzBX6ZpCo7zdtp9RvbbskznDqoG80oSx56H3ylT9TVjiERqptMvI2UBi4bl+YWb/Pt+bD39aMJ7DW1I72Cp4LVvvl6pPXsSa9i4dRUVtyikVafA4n63JA4ZY1U8Qp5WKAlU9Gk9sGhUsisvYB3T5r4jiQRTlTLu84F3AGXpRdquUmIzIVvD22V/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uit8i6yh9S7FEhMEK0eA9jh62mAFaSQJZwoIfFFMPmg=;
 b=VzksmJzbwSbAKGDhJ2CvwcxVSruuteNd1jhKytYoOjhzWCJwBlpSVVo3eWTwGlB8bYsqnyp1vnSoASAAwO/C6++7iCZXuoEC1zhmM9ENCKVjwoLGrlF3zvmq8F1v9BvZmCj0FV10AdXvH7Ogda0rshwFRCnz/eGWF9YUN0xJJCrEEJ5Xj1kMmfwptyWWkiq+pPLGIpnv3N82JUyPhpsLGLCWXaD5dAIN9LnY5/J2odZ+t+OimjU9CGhhZ2qiI4p1rK6fnqHAy++KHuBqjSWrSr/iljFvnR79/Y6z9Xo3OFl1+sOSx+bM1eMttvw1SFmvnxRXvWbrixhWdAc7SkFGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uit8i6yh9S7FEhMEK0eA9jh62mAFaSQJZwoIfFFMPmg=;
 b=qYtOEYd0OIQx4gUFdflrHLsd/Dr1AwKYkPgGORRUjIQ948AStFaz5IUBu9n3BmQN9w3W6XZ8Xv9Lv5TEtI9bVJpKDQrvEpX5myprKdRcsvftebLLT7EGSOuloe+Lh7eE9hD03UsC5vtKAdCPCJnjNgz+jZU9R35ACPCrpg9WnO8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10350.eurprd08.prod.outlook.com (2603:10a6:20b:57a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 09:55:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:55:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] apt: fix reproducibility issue occasionally
Thread-Topic: [OE-core] [PATCH] apt: fix reproducibility issue occasionally
Thread-Index: AQHcLSb54gEMqPJUEEahSoSIcwQ+NLSjqroA
Date: Thu, 25 Sep 2025 09:55:36 +0000
Message-ID: <F4ED507B-EA45-4492-BD5C-6552514752E8@arm.com>
References: <20250924074343.1611960-1-hongxu.jia@windriver.com>
In-Reply-To: <20250924074343.1611960-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10350:EE_|AMS1EPF0000004D:EE_|DU5PR08MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: df0d3633-8685-4718-fb6f-08ddfc19c26f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?T09sUlJkZkRDUVBrSGNZZ01HL05QZkM4eTVoV283R3BBQ3F5aHZEdG5JS0Fn?=
 =?utf-8?B?WUtTZVAza3k2TmVmb01UVFBHa1czMHNwOVBkOC8yQjlTL3RXS3RISXhUUkJW?=
 =?utf-8?B?NmdlUWVxUU5xWitMdnFwQlF2Y2R6TEpTYmpJdjNsbzRUMjJCdEVHbTI3ejZK?=
 =?utf-8?B?WXEyNklrbkhFRENJM3dhMXJrdml6d2gzMXRWUGRRVWZEbHRISkNGcnRMcy91?=
 =?utf-8?B?V25EWmNCNmdRQUlpZ0xFeWR2a0ViMmlEZkV1S3ZTTm9FMlRuY3B4V0lZYmdi?=
 =?utf-8?B?OUl2c3NpbWgvWm0vYVdPOTVTMXJGWHBlaFNiV3FRa1REaDVPUjc5c3NCRFBO?=
 =?utf-8?B?ZjdxaFplTHpDUzZNYVJZOFBZbFJVbjA0TlZVRzM4TVNleWR3cE9GRnNrK29j?=
 =?utf-8?B?anhQVE5UblpQYUtwWU85bmw1akpld0tIeXdsZDhJTU1SUEgzSkFZVkJleFlC?=
 =?utf-8?B?RXlxSzFRVXNCTTJxUGU5dTVhYk5weWt0dXlOQWM5S0lyMmhRMXlSS1JMQkUw?=
 =?utf-8?B?UlhCV1BQZkdLUGtSQTBkSE1RSWtwdUpVYXhpMFZ1ZFpKQUxtVU93WkQ0dmVV?=
 =?utf-8?B?bjJQZXdBTnNiQVRJdHk3dnJYTTdSeGRYUjQ1QkRXblRMYUVZbytPV3AzTmw3?=
 =?utf-8?B?WmdBb3IveEU4YVpHY0VyK1FBbm9FaGluc3RRV3NrNDFYbm10aFM2eHF0UXFL?=
 =?utf-8?B?bUZJOVMveDRrSWk2ZVo1MUVGMEMvVnowZTIxM2w0NGdWUDdXWXhmZURpMEtU?=
 =?utf-8?B?ajU2SGRacGVObDBtWDVZTUtKemJLNng2RXdaTFZTZE9uVURCWWRaalg0aGpw?=
 =?utf-8?B?NzhiSHFUZ054ZUJ6Ly9wVWVCblRrS3QvUE1nWHBzWjhXZUkwc0t6L2Z4ZFh0?=
 =?utf-8?B?MXJGWkl5K3BmTFRvWjhVU2VMck84NTR1SDBpWWhUeS9Qd1J1NytsNHhlZG9Q?=
 =?utf-8?B?a2RETGNQbEF4QnFWZmZKcG9GME5UYWFkcFdoN3hLNTRQTFkzNkNhY1VzeGRw?=
 =?utf-8?B?Z1pUb01MZEZURHdLanB1YzA3V1RDQWhFSElyV1hTN01nYkJ5YVVuV1VKQkcz?=
 =?utf-8?B?TlJkTHNrSm44WHdSOW9zUm90WHA2YnBDemNkRnEraWtzcjNtTll0ck5PZU5k?=
 =?utf-8?B?RGY4WnVjNi92VVNpVjZjWlovQ3plN1l2d2wwV2lPZWlMM0Y5c1RyZFl2Vno3?=
 =?utf-8?B?NVl1SEFkYTBUY0E2V0xUalFrNjhsU1BTOHp3OU9TM1FXcVVRajZxSWVsSkcv?=
 =?utf-8?B?eFJqazNhZWluQzZ2a1c3NjlYZVNYc0c1VDcrQkxBOXJDWmdtYkZ2TGtqS1JX?=
 =?utf-8?B?OEh1SnVxZkZjbmNBOXZ4bWl5SXdnOEdRbUNWRmlKMTdSRzFNTzhZMnU1bjJq?=
 =?utf-8?B?Zm90cmtRTkhYa1RzYzZUcnNQUEFtTHNpeG9EbG9yTXlRQVZiN1dwUzgxeTEw?=
 =?utf-8?B?by8yWnNjUndjM0xEZnNSaHZSTGs3UXJWL2NNYUQvZGtYWXV3dGc3YW9YMkVn?=
 =?utf-8?B?R3dpY240NzlWYXVRaXdFK21KTC9RVUE5Nnducm5ZYlNxMWxQNit1dTF6YzIr?=
 =?utf-8?B?Y2krVkdFclNraUI4NFNtRDU4aFJ2ekI3bDRsUGRiZUdCQ29OV2g0S2pQZUdV?=
 =?utf-8?B?VWRJV1hBVGtpSlJ3RFpvVFFQN2pUNkxPNmk5Nzd0a1lnOFhONFVvZkxmTFJu?=
 =?utf-8?B?WFRhbm42QWJHU2NSeWxnNDQvZEczSjl0cWdtMmdwbGRXbytkQWlYZThhUW1x?=
 =?utf-8?B?MlVieTIvUkk0ekw2YXNGK0E4RUo3VzkrRW13Nis1cWg3Y05vUWJXZFVPNCtl?=
 =?utf-8?B?SUlnOTZoQ2s5djlESW1qOXBhOGtmNXU3SlRRZW9neWlER1hmS3A3T1czeDNk?=
 =?utf-8?B?YnRVVDl1cWkwY2VNQ01LS0pOZzVibFJPUWd3Z3FSanUvNVRGdkRZSll0bnlV?=
 =?utf-8?B?Mk0vMDNWMVZSUE4wTjQ5aGFyV2l3RFB3RXlLMW5FR1gwTjBjMWVqRTRvQkhq?=
 =?utf-8?Q?CwESdyi5OSQsdo/jjy2TtkuTNPXZLE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <84B07C6B4F8C5A469B8E68B3FDD6C73B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10350
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	28f1c7bf-aec7-46ef-f6ea-08ddfc19ad6b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2dTWWNTRVlZZjE5ayt5NjFjT3ppbXNGNCtaeHEvQ3dCRTE5Y3NHUGJKRTd5?=
 =?utf-8?B?VFRaOHorcEJLVjdkem1mVC82SGZ0aXJCcEtWSW9ickRxejZEWWg1emM4bEtY?=
 =?utf-8?B?L2dxUk5xNG5tK0k5dGoxRWxIelRCazZRWkgwdXFWKzA0RGd5dXlwbi96NUN1?=
 =?utf-8?B?dEJmNlUwYlB1UCtWQXNQZW52TVhXRU9zMm1KSzJrMTZsQko0Z1ZXOHhiamRW?=
 =?utf-8?B?cXJPWGwzOURUQVB5bi8vL0FhOVBhelZaVGM1TzBiRHcrc3oxVmpXWkNUYldT?=
 =?utf-8?B?emNxd250dWkvMVhnN0kxU3hnYnVCOGFYL0RMVXpXZ2RHNndtVlJWVmtnSE9n?=
 =?utf-8?B?MFN5RzRjNGh6RzQrMUlOQnFMejJEdG9tMm14cDJpSnFCQ2Zmd2o0WUtTUUlC?=
 =?utf-8?B?QmJoREZ1ZW5PUUh6VUFIcVZqQUtwRXZGUU0reTVGR2l6V3VHMW5Cb0NuR0l6?=
 =?utf-8?B?Mk5ML2JzQ3dxZm9VVGVqMEJ4L1ZrU1BGK1RQL0I5QjV1azMwZWdvSk9yZktG?=
 =?utf-8?B?UC9HSDl0L0VXK0cyNkIxL3pYdEVaVVZTUzFJQ21yRzZ6Z3AvZUErcEoyajlS?=
 =?utf-8?B?b3BhV1JzTFlWSVVtdHF6dXhWcGNNVXJiQm94ZG91aUFxRjk1YzMzWTMwUDdT?=
 =?utf-8?B?c2Nnd0g1WGt4VjUrek4vWmIwV0syK0xhamtjazVxMGlEK0hQcGxKUS82L1cy?=
 =?utf-8?B?MFkrRGpWMjFmMVFIMklOOExkRERtdkIxSXlJVzB2N25vUzRLc0R4MTVFRjU2?=
 =?utf-8?B?VGlLSnRKTGdUZFhpbit3dkZUbENjTDJkMHJGTWdiN2h2UnhMVUxNNDhQMU1v?=
 =?utf-8?B?VjljcGZxcGZsVjc1Y1o3UW9CODFLNlVFZTdlcDJ5ZDlBNnFPSmFJdGcyOWc4?=
 =?utf-8?B?SnFKSGQza1N0UTBOYzFUenZRenpOcG9odEVMR3VIRUpRUGkvZ1lSSGpJSjdW?=
 =?utf-8?B?MStZVzFHUGFlUk5GZU56VlFOZTdhemtyaUlNeHc0K3ZSZWZOMWExU3oyN21P?=
 =?utf-8?B?ZWFuVEJKOHU4TEhDWUJUQXZmSFdGcytQQitoeTR6bkZ5UnFTT2FwQzJrSmpL?=
 =?utf-8?B?c3YvNmRJbTl2U3EwVFZScDhYZ1lQSGsxcUgzVGova2NqZUVYa3lOb25TeVpD?=
 =?utf-8?B?MXFCK25KRTByREh2Z2dyTnE4RTkxcHk4aG9ENnM2RVZKOTljRjRmN09Uc25Z?=
 =?utf-8?B?SWR2VVZLWkV6RVhzWGhwbUl3MWNMaVRPV2ZVbGQ0RkVSNHA0bDA2V21MTnFw?=
 =?utf-8?B?ajErQ3B1emJHT1YvMFEydkFsWVBha2x6bGxLSkFYMks2YkYvc042YzNiTTdD?=
 =?utf-8?B?Y1FodzNJcDBJcklBQmV2QkY1VGhGMHpEcGdWbmxSUXpzeWxUS2hLWVAxSlgy?=
 =?utf-8?B?dUJHa3YxV3NITzh0UlEwalV1aXJ0N2E5eXBvNDFqRHBBZndZN3RIZjUwVXY3?=
 =?utf-8?B?ZXlzZEtjNFpqYXJPdTNHdzcwZzlaOHpmQ29tMlpEdDhVTFZVT2RyQTEvMVY4?=
 =?utf-8?B?ZmJWdlA3VmJhOVVsNWJUZzM3OFlCU3dMUjFFV1M2WUViQVBjWTZHbnpUZDdK?=
 =?utf-8?B?Tk9FdVVFK3Y1bDlOMHJqbzV4aWo1SjZVNTJRak02eE5VaDRTSWxRS1A4UUpi?=
 =?utf-8?B?T1R5WU1ONVZiY0tTaU04akZsQlk3SUdZODBWZVRXUVNFVFNrc2R4dVZCSDBH?=
 =?utf-8?B?cUM2UnR6ZFdROXRpeCs3eUJlaWxrN3NiUzFib3l1dHpZTkNwWnlzR2IrODRN?=
 =?utf-8?B?S2JaN2VNTVpaOHo3WHpvcG5ZaDlCU2tDRndpb0dULzM1SEpzdVFrYTRSb0dw?=
 =?utf-8?B?c2IvM1h6YXJPUXBFcG93U2dSaTBjT1gwNjFmYTNoajNuMGkrY05EV0dESG9k?=
 =?utf-8?B?Q0lGN3pvd1FCWE5NOGZMaTEwS3dTR2Q0SEs0SUd3em1zTEZ3UnNiWnRoSCsx?=
 =?utf-8?B?MExWS1BhLzM4M3dza01MaTNvVjh5SmRrTDU2Qm5PRytWa05XZWZkWWhKcGlT?=
 =?utf-8?B?TlQ3TGkrbENoVmhJTDlQUXNUVTFyckdXSXdrSkowOTNGTEFBdlJ5UnBsVFQ2?=
 =?utf-8?Q?WfzSI6?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(376014)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 09:56:12.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df0d3633-8685-4718-fb6f-08ddfc19c26f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 09:56:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224010

SGkgSG9uZ3h1LA0KDQo+IE9uIDI0IFNlcCAyMDI1LCBhdCAwODo0MywgaG9uZ3h1IHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxob25neHUuamlhPWVuZy53aW5kcml2ZXIuY29tQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiBEdWUgdG8gdXBzdHJlYW0gYXB0IGNvbW1pdCBbMV0s
IGl0IGNhbGxzIGBpZCAtZ24gcm9vdCcgaW4gY21ha2UNCj4gdG8gc2V0IFJPT1RfR1JPVVAgaWYg
bm90IGRlZmluZS4gVGhlIG91dHB1dCBvZiBgaWQgLWduIHJvb3QnIG1heQ0KPiBkaWZmZXIgaW4g
dGhlIGNvbXBhcmVkIGJ1aWxkcyB3aGljaCBjYXVzZWQgcmVwcm9kdWNpYmlsaXR5IGlzc3VlDQo+
IC4uLg0KPiB8YnVpbGQtc3QvcmVwcm9kdWNpYmxlQi1leHRlbmRlZC90bXAvd29yay94ODYtNjQt
djMtb2UtbGludXgvYXB0Lw0KPiAzLjAuMy90ZW1wL2xvZy5kb19jb25maWd1cmU6MTI0Oi0tIEZv
dW5kIHJvb3QgZ3JvdXA6IHdoZWVsDQo+IC4uLg0KPiB8YnVpbGQtc3QvcmVwcm9kdWNpYmxlQS90
bXAvd29yay94ODYtNjQtdjMtb2UtbGludXgvYXB0LzMuMC4zLw0KPiB0ZW1wL2xvZy5kb19jb25m
aWd1cmU6MTI0Oi0tIEZvdW5kIHJvb3QgZ3JvdXA6IHJvb3QNCg0KV2hhdCBob3N0IGRpc3RyaWJ1
dGlvbiBoYXMgd2hlZWwgYXMgdGhlIHJvb3QgZ3JvdXA/ICBXZeKAmXJlIG5vdCBzZWVpbmcgdGhp
cyBvbiB0aGUgQUIgc28gaXQgbXVzdCBiZSBvbmUgdGhhdCB3ZeKAmXJlIG5vdCB0ZXN0aW5nIG9u
IHRoZXJlLg0KDQpSb3Nz

