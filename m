Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74E8D5D690
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 21:40:32 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.72])
 by mx.groups.io with SMTP id smtpd.web11.4229.1731015631764098814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 13:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F0bFS70T;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=F0bFS70T;
 spf=pass (domain: arm.com, ip: 40.107.20.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sjMzki5Yhen1eCRZB387S2ZRO0Izs8NtKepN4wR2JMJhwoZdTO7CnVrK7sZMNZJvA5xQtQj5Yg/aPqsGZx1VUtAe0jGphOn86ne/G9kejvQ9+VgduRBUzyughNOJYCSN0/h+uQFdEFSndC/MVQ+aVUzvPlBwniTbyY8yg6/yy+9FU6KbVrDVoB7rwTsrprZXgHT+EWYCs1UVK9eMxZz4UDoFx6YeDBVVUnZIhRh1Xaq5deRZLCT7OA9lWdJMcPAatmYMKD+ZQEx93xsiUxEkM53qsLV6N+XwXXOiE4wpqqsVj+bIbOyLvW/+LFibePEGMXo3igwv/TVt6ayepsLuUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1LWYt4AcbE2IZUvdbeXXAYqSQOmmNiplx7mPodZQvM=;
 b=we8pAqyEFwJXpBiEOOH+uifi8Xrp1ZnC5h9t8PjMx03BDzqWsOq4bsSWMdQS2zrs4MWDuc9NnHnx0YxiCXdRA+k9JisIxrlatE5vykcTC8FynVjTN9YVehGCssTsOVIwDwG1TA470IqLPIGhiD5mFFB7t4/Ni+76NO9Ig8jMEIq6Qk4EqzUu0cXBhIB1OoE4F8whNQ2+/afFg5UDBDL6uJfk4/agHrNzR7qTyo3ydnyLoygbqwVf2ovdM8Z1iFQ12i1tbCXcWMYUyrj2alesPnb3R7MJIhzq4q/wklRpEbDxqB8cghknQV/ILIA+Juj9EPcKBUEQq9rpUSWN5mziFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1LWYt4AcbE2IZUvdbeXXAYqSQOmmNiplx7mPodZQvM=;
 b=F0bFS70TvCfm8q6BzFmd1ljS2dO8s8bIfPo0TTElGik5DlybYo1YtE/txcRKrFq8xpVmqMZ/xCRb1PMLhA3iDQ2aVuYYFbx4v8HZmrvi+K5GTCY82c6ECDmvB1M9b64yz6Bi/ijvtOnnI3pkWumIef2heqSN5H4DFmeKmVosOBA=
Received: from AM6PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:6e::19)
 by AM0PR08MB5457.eurprd08.prod.outlook.com (2603:10a6:208:180::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Thu, 7 Nov
 2024 21:40:27 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:6e:cafe::de) by AM6PR02CA0006.outlook.office365.com
 (2603:10a6:20b:6e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 21:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Thu, 7 Nov 2024 21:40:27 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490"); Thu, 07 Nov 2024 21:40:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a79f6cc74339c25
X-TessianGatewayMetadata: FoXOeAvC2RV6bDvHHVkWW2ahkxf5AXAhovtdGjjChxd0B7bz/QwQNJbHHCg9OiV++/GuUw+h5/bRrou421rYYh6Dx9AdX/U/2OQC2SGEtzSbpFq2groiGPoeumDsBHl87zC7BFPgWPC4sV+9bwZhaY9aCPHvVDWiqYNAyXs+kIY=
X-CR-MTA-TID: 64aa7808
Received: from Lfb827ddb8cf8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 39AB6E30-4AF8-4152-8892-B9D7341EFBDA.1;
	Thu, 07 Nov 2024 21:40:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lfb827ddb8cf8.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 07 Nov 2024 21:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqLbPoOAsLvlUa+cGFACtfdOyYDHmcN04Fy+29pMlnvVxukmM/gogawpb78OQ033EcEA+T3X4zxo66mPBjO8Zy78zty63vTHlpMaEjiYCbyQAGUr75639GnFKEKNtLbkbK9m8PLcNBdfzC9veQU7sqJoy0qeXxSUp+X7xN1UP6AVZdJpZ8EvkQ3PRgAhENtf4jQL0CJ+CNrLU6vA3+aRu45U1FziSi1PGWlEq2vteJO5qtfe+OGudxb3vpYsuiOClxQFTHGaLvuiUcx2beToa9MSt69+RmiPsczrWUVatT7hvx5GuEv2moU5tA1v+T735VLM7R2CdCFfrrsKbKwCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1LWYt4AcbE2IZUvdbeXXAYqSQOmmNiplx7mPodZQvM=;
 b=rbEGHIKDaxGN9DxHrU6bXC4S2AE1xm6o7UWz8ZAjdMxNawhZ0nS3iyGYuHD7b8TZsOyJIHIO9eTe77Vq9Y4xg6kipNEmNDtAq0UrD5gSmgB4u607vvrzA9/eJD4jSKf0Sm+2cuLygMpTV/U9fzBVgpXLAy6TdVELTo8OdxkFbdJGJ3HjqzeT8DmC/SpnKZJu3qDJvK5qkLkq6S+SkfMdAYw8rUffRZw58dooeuFuJD4TrMwBuL02H75Slauke5BEwD1Il59LKVBZgK/S3eE9eOs5wej6LwAlTqnvmLrwaLnmGVuOZlABmy/aarVybQxn9Xh/dMydUoi+MdPb7wxXkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1LWYt4AcbE2IZUvdbeXXAYqSQOmmNiplx7mPodZQvM=;
 b=F0bFS70TvCfm8q6BzFmd1ljS2dO8s8bIfPo0TTElGik5DlybYo1YtE/txcRKrFq8xpVmqMZ/xCRb1PMLhA3iDQ2aVuYYFbx4v8HZmrvi+K5GTCY82c6ECDmvB1M9b64yz6Bi/ijvtOnnI3pkWumIef2heqSN5H4DFmeKmVosOBA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10114.eurprd08.prod.outlook.com (2603:10a6:10:4a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 21:40:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 21:40:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Konrad Weihmann <kweihmann@outlook.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptols: do parallel builds
Thread-Topic: [OE-core] [PATCH 2/2] python3-setuptols: do parallel builds
Thread-Index: AQHbL82s/3yzYmVrJkmbCh3HcGHojrKqlG0AgAHHMAA=
Date: Thu, 7 Nov 2024 21:40:17 +0000
Message-ID: <1E0CAD7C-8E6F-49AA-A7D9-42C9A645C1D4@arm.com>
References: <20241105215644.1884070-2-ross.burton@arm.com>
 <2650.1730917856955683740@lists.openembedded.org>
In-Reply-To: <2650.1730917856955683740@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10114:EE_|AM2PEPF0001C711:EE_|AM0PR08MB5457:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3ee694-8e6e-4692-4315-08dcff74cb58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cXFzUVZudWwxMFBsaERFUGpGL0owQXBvem9CSmxvV3Q0NkduTGdlbWYxN2lR?=
 =?utf-8?B?RWpqcUNLMkdtYk1QMzhNdkNCVjhYTjRhcDE3Rk95UTM3Kyt0VktJR0U2K1JC?=
 =?utf-8?B?eTVRQzJPODkwRTRRdG01Y2tCSEtpc1AwUkhqZHpmTllnL1REajJMeXZpMGJN?=
 =?utf-8?B?UWNQaEZaRkJhQXhBZWJNdTlWcGxtRUtlbk1iSlpkcG5pczE3bEF3WFdqM2RG?=
 =?utf-8?B?SEFRWVkrRkhWWk1DaG1vcDhMdmdzOWVVdUFlK25keDhuS1A0dVp5U0RNTkpi?=
 =?utf-8?B?RU5Yd3JsaHdQTGs2dW5vMThVUlFWTDYrL3Q4V3VKMlkwQXBkaDRLWFliSVNY?=
 =?utf-8?B?WDU2Q0dOV1VDVXI1TW5Ha3VkLy9hcm1xTXh6bU5VRUkwY1N2OVR3eFJiL0VT?=
 =?utf-8?B?ZjhpeDIrTlNNYjNmUDh6Ny9hSlU5TmZFOVo5VE1SLy9GRWhYYkdsVTVlNHhz?=
 =?utf-8?B?cU5RQ09ZRmRPQzI5d1U4elRXTVFiamdVQi9FYi9iR29vSmNrcmYxYmxxRTVG?=
 =?utf-8?B?WmVzYXpxYkVOUDNXUDdOV0pQS0sxdUxkN29PczVWV3l4NTNmOWFNSkJ6ZHNC?=
 =?utf-8?B?eDVZRHV5dU42dDdERzRiOG4rdEVzUVhSQXdwQWcyV1ZEWlNqbWpob01LRFhF?=
 =?utf-8?B?YVg0bkVzQkE3U29QVUJQaHRRaDRCUm1ZYnRxQ0NWWGRscWpYeXRtVC9uaDFP?=
 =?utf-8?B?MVdHU2k5S29qeUtOSHhKSmZHSHdEMHI0V1l0RDFDWUM4MUZWcGdmY0ZWTmti?=
 =?utf-8?B?Y2VmbHJhY0VNdTBRTjB3MStZK2VrTzFQMEkrL01ZVlorMEJFaXVGRmdObzhv?=
 =?utf-8?B?N0V4NTdwNEpWMktmanRscURhN1BweUFXNG5Ka293N0JhOFVYZzFxVlk2MEh3?=
 =?utf-8?B?RDUrMHQvUStzUW5wUGhuekgyRFVJV0daUDJqdlcyZGI1a0JzMHFUYTlEMnM0?=
 =?utf-8?B?cDhWeDJaZzFrU1JydFJWUSt4MnZSM2UxdHV0ZEFMRlZpT2J5Wml0NWZsV0lj?=
 =?utf-8?B?QXNKQjJ4RFNiaG5pSDhSNnVPZG5vM1N6b0xEZ2hhalpyNm01SFBFODNiOEtL?=
 =?utf-8?B?OWt2OWVKMDc2T2ZnN2dLMVZ5R2hldTVmUjNmdjhvWWluUEJTNFNwek80WGkw?=
 =?utf-8?B?U3MvNlA3eEJXRWJDZmVZNUtiUm9SSklkaklvM0Vrc2NYOCs2SzN5M0JKNkU1?=
 =?utf-8?B?azc0dzZIakJsL2xrZ3VobGM5ZkhwT1pMNGxZbE1CNGpIUWFOSmpJK3FSWDND?=
 =?utf-8?B?SjJtM0ZxdFBrbmxQOCtqTllpYldIR2p3aW9MNm4zRTJOZHJFN1MzUmptNWc4?=
 =?utf-8?B?Zis2bDlZYnlKNnN6UjQ1czlLdWtocWNLdTNMWS9UeWV3UURwVVZyL2NUUU9z?=
 =?utf-8?B?WHEvRzkrSUQ3LzhyQ1BoL0dJOURRMFYxdG11K0R2V1hoR0czdGMvRFFoVjdm?=
 =?utf-8?B?U2J3T3lzTk16ZHZrblRSY2J6Uis0TGFwdkdwTndnN1ZWV29ITWxyYzVOSzNp?=
 =?utf-8?B?VTJQMmVsYnJrTE5YQ1dBT2JXZG8waVcyNk1vdzdRNFVmSThUWWJpQi9SajFQ?=
 =?utf-8?B?WFV4dU5WWk9ub3NVck45Nlk4aWFMRndBL1dsNENoTWo0NXZWbnY4dnlGK0xa?=
 =?utf-8?B?L3FLdUtSZ1dleGYvL3c1K2s5MkU4QjB0MDlxK3IzTTNLbld5VTFML0I2SEN6?=
 =?utf-8?B?eFplTEdrOHJyNllTTTFuaElpbktJcVhHWkI2enAvVWs3N0Q5dUhPTWpDQ2gz?=
 =?utf-8?B?ZUVtWjVuY2dLbldWZmoyYzBSYTR2Y1o4ZW04b1EwZ2xZblpGOGoydGxtRDJ5?=
 =?utf-8?Q?IQVqWEajEwam/SENgymEyHcFFGlb6D+glazUs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <40F849DF12E49145BA73D77F9BDED731@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10114
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5276075d-989f-4f5e-b0f9-08dcff74c573
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|14060799003|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NzE4dXdVL0J2eE80OEVOSVJ3Mmx2bVpENDdDWlJncFhVWlp3UEZwUWQwR2Vq?=
 =?utf-8?B?bU5LQnUzMVRLOUNQN21aSWFDbUk3SXVCeE4wbUJIVjloU251ZFdYYk5xRWhl?=
 =?utf-8?B?a0ZmVXhySlY0bWJYMWJ5MjFROWJBQVpualpmejF5OHg3OUN0czJEcC94ZjlV?=
 =?utf-8?B?emxOS3Z2TytIU2FibytOTmFtNGZNWm1ZdW9Kem84Ym83cGtBTVhacko2blBJ?=
 =?utf-8?B?RVdPVjFUVEp6VGo2eWg3b3gwSTBjSjFRSHV3Qjh5ZS82VENIL3JHc1FTTm4y?=
 =?utf-8?B?eHJ1SDVvdTZqaGFQWnc0NVBucTFDSFJ5cjVUdlk3NkJPY0xrRm5udVFsaEZr?=
 =?utf-8?B?Rnc2V2lORDRxaFF0L1JSRVVML3o1b0RzeUM0U3d0ODlvVFd4S05rRkIrcVZK?=
 =?utf-8?B?VmJUOHVjQTc0U3NZZ25DdG1lUjhRM3pYRHVtdHl0MzJsNi9IZUl4cGQ4TUZ1?=
 =?utf-8?B?T3RIaGQwbEdKRWdUYVBsM0JJZE5SWWxWbE1nZzVZTHVyTCt5cnp1ckZFVGw1?=
 =?utf-8?B?WFpOSzBtbDI2OHJxanhKaVBnTmZCNFBSeHpPZ3lpTnUwNVZwUWc4SXhzUGVI?=
 =?utf-8?B?YXFHL1BLMGlMVmdkSjUxZEF0aU5YekszT3U0QU1ETHlLVVZXbEdodXhKQ21B?=
 =?utf-8?B?bHVFSmVXbGhKbkphNGFpNE40dURJbE5Kamd1NFdpa0E5QXhFRmdweU9Namp1?=
 =?utf-8?B?Sk1kMWgvQjJWZllkWEhkanRqOXpIUUUyT1pXcWNaa21kdHcrWDVqblVZbGEw?=
 =?utf-8?B?OWwxQ2RkRFdMSVQ3ZWhDeFhvMXM3M0Jzc05aUzNUejUxbzJmTHhrZ1BDZTdw?=
 =?utf-8?B?QzB5elBJbituWmtDWWFWRTZnSzg5MGc1cERxYkdpMytkMDFLem1SQ1Q3UlBX?=
 =?utf-8?B?RSsrL2cwM2pvbTM3S1BRVzJaLzcraVgwalNiK2gxZjd4NjExT2xBWTJNd3k5?=
 =?utf-8?B?UHdtaFB1ajRMS1NidUE5cnBKb3pHNjVoYjkvbUh2RktZTXpROCs2Y1dkOEtx?=
 =?utf-8?B?c2txYzZ6RWNYR1VZM3FhbWxYOHFFR3EvTnMwckM1Um1qcm5mcW1JSS9sQ2ZL?=
 =?utf-8?B?VG5BcmFBclkrWGllZlovR3RkZnBMVFlLc29WWFlsMGEzNjdKNUh1dXFJV1VE?=
 =?utf-8?B?TEZoUFZmUk5IWXM5S09BaWRRU2wzUlIrT0VYWEg4Ry9hekY2N2piSGM2SEhQ?=
 =?utf-8?B?cDZnTVZCU1VzRnJGSHRHNmZXVURyclBvaTNJYjMrbW9RM3UzVlZpOElqRnRN?=
 =?utf-8?B?RFE0QWd3dTY1UlFpUjQyR3prTmJOTkpDeW9qQTBodGlxbFE2L0wvWHlCWXdz?=
 =?utf-8?B?TlY2Q0tFS2xlNis2UURUNlc2Y3VyZUhGZTJzeUhJNnIyQXF6L1Nwa2pqbUEr?=
 =?utf-8?B?NVVWSnRlNkdBenB4R1lqR3RjZGtkNUZVNmZXUDcxc2swL3Zxb3gxYWJyQmg1?=
 =?utf-8?B?R3UzZktXSTlQcWxxWkxUTGlUNzl1cFowYjVQazY4dnRpUFp6SmZ0RFQ1Sjd1?=
 =?utf-8?B?dW91eThsckh0UzJBeDZEV2k5S0JRVzE3OU45bFF6VWpGN2E0ejJxZlRuZGln?=
 =?utf-8?B?Qy8rVUVaSlFnRjRwd3VvaE1GdUgvbUljUmZxaE1La1NrNEE5UnFwdTVSbEFx?=
 =?utf-8?B?Nm1laVZVNy92TGFRSlNFcUtLMWJ5OVdBQk1QaVByYTlhdFlzUC9QL1RyRnFC?=
 =?utf-8?B?QmFyWmdMTW9RMHhzeW5oVlU2WFVqdGNuV3FKM29sa0p1alpkWTh5eE5mekN4?=
 =?utf-8?B?Ky9Ed20zdDZwS0Jla2hJb2c3VlBnUjdFbDBmTW5aVFhhTXRFanJvZTJtTXVn?=
 =?utf-8?B?OUxTK1JwczkxWWZQZWppOUVkd3J4dFRBVGRNcnlIb2JpalFSTUdHOExDeVp3?=
 =?utf-8?B?MzNUZmgwemE3VnlHQTh5ZklhQmRBQ2FmZFk4ZlR4WFR6cUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(1800799024)(35042699022)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 21:40:27.1991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3ee694-8e6e-4692-4315-08dcff74cb58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 21:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206852

T24gNiBOb3YgMjAyNCwgYXQgMTg6MzAsIEtvbnJhZCBXZWlobWFubiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8a3dlaWhtYW5uPW91dGxvb2suY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gT24gVHVlLCBOb3YgNSwgMjAyNCBhdCAwMTo1NiBQTSwgUm9zcyBCdXJ0
b24gd3JvdGU6DQo+IA0KPiBJIGZpbmQgdGhhdCBwYXRjaCBpbmNyZWRpYmx5IHJpc2t5LCBhcyB0
aGVyZSBpcyBubyByZWFsbHkgb3B0LW91dC4NCj4gQXMgdGhlIG1haW4gYmVuZWZpY2lhcnkgaXMg
cGFuZGFzICh3aGljaCBpcyBub3QgaW4gY29yZSksIHdoaWNoIG5vdCBhZGQgaXQgdGhlcmUgYXMg
YSBwYXRjaD8gDQoNCllvdSBjYW4gb3B0IG91dCBieSBzZXR0aW5nIFBBUkFMTEVMX01BS0UgdG8g
LWoxLiAgUGFuZGFzIGlzIHdoZXJlIEkgbm90aWNlZCwgYnV0IEkgZXhwZWN0IGl0IHdpbGwgbWFr
ZSBhIGRpZmZlcmVuY2UgZm9yIGFueSBwYWNrYWdlIHRoYXQgYnVpbGRzIGV4dGVuc2lvbnMgd2l0
aCBzZXR1cHRvb2xzLg0KDQo+IEFsc28gb3RoZXIgc3VnZ2VzdCB0aGF0IGFsbCB0aGF0IGNhbiBi
ZSBhY2hpZXZlZCB3aXRoICAtLWdsb2JhbC1vcHRpb249ImJ1aWxkX2V4dCIgLS1nbG9iYWwtb3B0
aW9uPSItajUiDQo+IHNldCBieSBQRVA1MTdfQlVJTERfT1BUUywgd2hpY2ggd291bGQgZmluZCB0
aGUgbXVjaCBiZXR0ZXIgb3B0aW9ucyBoZXJlLg0KPiANCj4gU29tZXRoaW5nIGxpa2UNCj4gDQo+
IFBBUkFMTEVMX1BFUDUxN19CVUlMRCA/PSAiIC0tZ2xvYmFsLW9wdGlvbj0iYnVpbGRfZXh0IiAt
LWdsb2JhbC1vcHRpb249Ii1qPGpvYiBjb3VudD4iIg0KPiBQRVA1MTdfQlVJTERfT1BUUzphcHBl
bmQgPSAiICR7UEFSQUxMRUxfUEVQNTE3X0JVSUxEfeKAnQ0KDQpUaGF04oCZcyBwb3NzaWJseSBh
IG5lYXRlciBzb2x1dGlvbiwgeWVzLiBJIHRyaWVkIHVzaW5nIGdsb2JhbC1vcHRpb24gYnV0IGNv
dWxkbuKAmXQgZ2V0IGl0IHRvIHdvcmsgcmlnaHQuDQoNClJvc3MNCg0K

