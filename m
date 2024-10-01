Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D4CCEACC5
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 14:00:10 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.75])
 by mx.groups.io with SMTP id smtpd.web11.82486.1727791208335375922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 07:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q/+7jHjv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=q/+7jHjv;
 spf=pass (domain: arm.com, ip: 40.107.241.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pIpCGgElfHPusoB635jQoGf5zDwDONerjc8BWKQiKrY1SPG5fZtA42o4yC2ld30KQT1QkAU507/CZIOv+XGRa7b3uFSc63eurd34lENNpo/vCoSKjdcp9f/aiEjii9skoVeUqz39NasvijiLN9XCwQ3OMk6E7YISZ0V73tqhddzuzVoK/g+Neyh3RDZr17rkACLET2JEEVSmhjmVPH9icfDZd7v0g/fRhrW03GOM1MHvXfMMCXyC6mCi42LHGGI6GMZkn5x/Lcqb+S0nmSe3u7RVl0KmPIm7+KSvHam7JGpamKtDUATfYAS1mzyWhaQSOa4ffOm2m+pOAo2k5qINDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG5j4Pkc4z3sP0SiA3nyRxEBh2NrBENbB9Un0gB9GLg=;
 b=a7CDKtcgi5RV/LQ+Xiin8DRGLiaxCpzqSqblGzSLgHZW33vZOjDzcEDyfLSRJiznije30aHpLLX6SdXwnlZ5cciFAzxZpU/hIFYUEV/AQRnG8GWtbx0Iq9V8P2wJF3G1mB3S4era8L+8cMkz924S+bWusfWWb/OmkXKT2kt34bsyspOI9WJythISYVznoXSiz8lu81xmf3JWMASi1Eb7hn82y+zkeW5E86/VKVIskzOzaOWPxa1eBwBTh/axi2lJBAm0nd+ZLCQo1rwwuPyJrQsQKNCt7UVQiakNfEeop9QvvLS/r8ctmWp5UiC8uqO/M3+281Nh7kgNWyNfvfPAhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG5j4Pkc4z3sP0SiA3nyRxEBh2NrBENbB9Un0gB9GLg=;
 b=q/+7jHjv0lqQJ4yThFRPnPIKoHx063LJH4VbOJnM5W09pwwMTC4PlAWzhWR5i9stcdbRJtyVj3kfqDrfxJuA18K8EwuzXu1BqijkXWEPNRWhMRQq3XL55n2O6tE5EUyHqhopb47Ba3WUICHlIOj6Cer5UB2XrnjbHWfVkILeB0Q=
Received: from AS9PR05CA0035.eurprd05.prod.outlook.com (2603:10a6:20b:489::17)
 by DU0PR08MB8833.eurprd08.prod.outlook.com (2603:10a6:10:478::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13; Tue, 1 Oct
 2024 14:00:02 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:489:cafe::12) by AS9PR05CA0035.outlook.office365.com
 (2603:10a6:20b:489::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Tue, 1 Oct 2024 14:00:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 1 Oct 2024 14:00:01 +0000
Received: ("Tessian outbound 6c9d48238f96:v473"); Tue, 01 Oct 2024 14:00:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a621a787862a43a
X-TessianGatewayMetadata: Ir1xduDPPaez/zaWo09piGACzxWj+123LXT8S3zm9qhYzBmkBCYRagqreq61Y/teX8YUr8bwXTfo3N8dIwfMlxJSvDNQ4SCcc5dfLWfc47DAaTWljtAKIOrmFaAdN8MDaVVbhTjQ3qXiaqSALG6IxEk88yk8vGMedv1Jp1+XxG0=
X-CR-MTA-TID: 64aa7808
Received: from Lf80c09a91138.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42C3DBC2-6EFE-473C-91A5-474191A40FC9.1;
	Tue, 01 Oct 2024 13:59:55 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf80c09a91138.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Oct 2024 13:59:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yweL2ZBRI5wOsulO2TiwknVyGJe4foznb/soqtqwGxkeKFl/jUDsgmCzxZCrD1/QkPMhBzOhNVCqmKb3evxCMw6o+25InPKwilgE5HPfOmkbUzCNfQ3Du5ym13YvSlasVugfJe/WPFsgN6k5iXqZICRalldYSg9BPN2qCOrAEeoxy0kA6TCtD02YjLbhpp95MKZ8CIScwkev5DCQKSRzRifmROk5aqyG42Fb4lFCyetDF+gJknpT+cYpf/BNeG+2qZ1HFYjaWtzbJ9cxFfhUVM40N5c1xVtxwJ1M8S3j7AQeFKK+FF86B+RjrWGRlhvlQXsVHHtjdJJv+0ot0mPZlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG5j4Pkc4z3sP0SiA3nyRxEBh2NrBENbB9Un0gB9GLg=;
 b=P9We/yk7QiDM3qbokMSJdNAE1X1/AU4AlOAeKxSa0GHzw7iSR2VDPRICbP59zS9Gnlj6NM4WzisT5gH8jZCd6gMevvNcJ95Bf3AIijbjB/5YrXXKyIYdxBdlEF418d9B+cewEqdRJLtbZNo2QV+VjeeWe4/opBH7iauFwM/YfLXiOT3aV8yEAGHZOx5wHeLAuSoVTcuyRaz3dlSPh9JsqwD8zD80YjfCD1tlEBmXtbEyVCsEtGt+rAbowl6iViLMrEUm0URIt21hTk2rn5cGuVSi9fT1IELsWjD2YkPt0yC0tDO6qNZpZX6obv0FCfICqdkwzIJgMMjbRgmwL4hTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LG5j4Pkc4z3sP0SiA3nyRxEBh2NrBENbB9Un0gB9GLg=;
 b=q/+7jHjv0lqQJ4yThFRPnPIKoHx063LJH4VbOJnM5W09pwwMTC4PlAWzhWR5i9stcdbRJtyVj3kfqDrfxJuA18K8EwuzXu1BqijkXWEPNRWhMRQq3XL55n2O6tE5EUyHqhopb47Ba3WUICHlIOj6Cer5UB2XrnjbHWfVkILeB0Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9828.eurprd08.prod.outlook.com (2603:10a6:10:45f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 13:59:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 13:59:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "david.reyna@windriver.com"
	<david.reyna@windriver.com>
Subject: Re: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
Thread-Topic: [OE-core] [PATCH 0/2] proposal: Append VENDOR_REVISION to PR for
 CVE scanners
Thread-Index: AQHbCzqU0+6pdSpC5UeaecdprVr3dbJx/diA
Date: Tue, 1 Oct 2024 13:59:48 +0000
Message-ID: <0323D68F-8425-4A29-AE58-7219C46DFD94@arm.com>
References: <cover.1726821150.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1726821150.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9828:EE_|AMS0EPF000001A9:EE_|DU0PR08MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: abf95bff-bb7a-4d2b-e728-08dce2215816
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|3613699012;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VmpMUUczc3FtRkV0bW1NMU5aOExNTDY3alIvTWxqS2l3TEFHRjlOVldIcXVh?=
 =?utf-8?B?NFVQQ3h1N1JDVGsrYUhEZDhHNU5IWmswYjhRcWdUUlkxeTV5UFk0MGpseXhn?=
 =?utf-8?B?a2VoWXJnMXRaWGthYkJ0Wk9sQmpIUnR2eDMzQ2xhSnB5UTk2VzJUN0dQQllT?=
 =?utf-8?B?Q1BoQS9nRTVYeW9wVnRzeGkrS0xPNUdFVVRKQ3FCbk0xeGxKUk8ycUJxb0tR?=
 =?utf-8?B?NDlYYWZIWG92K2tzZ0hNZU93cTFCb29DZXNwb01Hb3R2Njh3OFZqb29iYzRv?=
 =?utf-8?B?cTc0ZWFYdGt3N2tiNWNEcUIySmxoNzFXclRRMHBPWXNkSU1tckViVk9NT1dx?=
 =?utf-8?B?M3NDTlQrY0FBSFp5aXZjTzd2OFBkcHM4SXcxeGdGNDBJM3MwMklSOFZTNktk?=
 =?utf-8?B?SU5MUmJRN3ZZRFRJV2lRT1phbkt0MUI4dyt1ME1CMWl2TzFxdTVmSnl0Sncr?=
 =?utf-8?B?UFB1am1lOXpRVCt4TFUyZ0NCa3hqNDNSczA0QzExb04vTVk2cjIyZHNRWWVJ?=
 =?utf-8?B?V3B2YTRTTXd6dUNzUGdhWmRSMG9TSjlQelYrcU1sMW9RRDNhV0RxdkM5ajl4?=
 =?utf-8?B?YWRYWk9MTkF1bVg1eHJsbTlLUmg1TW90dmhSd1MvVGhVVTdiSmVvUERYYk1y?=
 =?utf-8?B?SEdPbkZZTzgvQnNOTncvbmliZmdFMytac3dXRnVvekp6ODdJT1VldkVTQjRh?=
 =?utf-8?B?ZGhIdVAxZkJhYUF3YVUwTzRNb1htOVp2YmtuWkFERUFLa3F5YWpiQ3E3aU9N?=
 =?utf-8?B?alAwYnZMQUhaUEtFQmswdWNxeURIY3BrRVBiZC9PRncxaDd3b1pqNEZPSGFH?=
 =?utf-8?B?UlhDbjlyK2FzQ2hjY1RGN3Znb0ZYWHFoMENhYjFhZWFWVjhzeENJMmdDam1Z?=
 =?utf-8?B?YllpaFcvaWcwM1BNdGt2RHNURXRacUhmeFpmV2l0eWpiZDBDLzdDMnVGQUhQ?=
 =?utf-8?B?RGgzUmJtM0tUT09ZRHhXWEtuVzdBcFl4QjNTbzRZWGM4T0M5azR4UFMvMkRv?=
 =?utf-8?B?cys3UmZJbzhkeG9YcHpUV28rZlJXMmlRM2hwWTdScHRMT0x3dis3d3ROZU42?=
 =?utf-8?B?RHNTakhhcm9ISGdoZy8zVHpIcTNPc0o2Vk9XejFwME10RXViRTEvdmZldDZ0?=
 =?utf-8?B?cS92UmwvYXl3K3Y1L1pBV2xoNDAyYWpVOXgyMXNjekdzOGhYZUptZStPMHZ5?=
 =?utf-8?B?VmE4TVNUMHJzdWUzY1ViQjFmTnVhWnZVd01mcUZJemJxTWUzOUZzcnpRN0Ex?=
 =?utf-8?B?b3J2Znl4d0tJK3BQTndVMzFkNEdVVXJrR0Vjd1ZaeUdPbTBnUUgra0xYcHZs?=
 =?utf-8?B?TXVNYjNwbyt1VTdzZXEyZDcvUU5ybGtRR2RGOEtkUGtVRlRvZVhpN205c3pz?=
 =?utf-8?B?RXNrcGNxRVI2c0M5dGVXUDdTS3Y2ZWE1emY5YjMxSXdmc2dtajBXR0JWOUxW?=
 =?utf-8?B?MXNDR3BOR0Y3dUsyejdZOWRYOGc2TTZ6aFM3WVpwU0l5ZEtPZVhBcElDUzJP?=
 =?utf-8?B?YjRYR09JTTNDcXBCTS84eU5La3lkcjByVGpJQXhMRFhYZ2dRS2Y4b1VsWUxh?=
 =?utf-8?B?azZRV0FTU3NZKzM0SkRjWWtOYXZrQmZoalBrNDFodnBKcTlMS0ttOS9pNU1D?=
 =?utf-8?B?YkthTWRUVmNZZFpWZ2FtRlZPMEJwcVNnanR0eEZySHJNMm9zWFIxTS9UQlhP?=
 =?utf-8?B?Y1YwQTZDN3VrbzIxNWNUR0lGU0RrN1J4V2hSaWRmZ3NRUkRwOXNHQkR4NC9Z?=
 =?utf-8?B?RVR1RnRRdXFKZEJUMFRoVEpSczRiYyszdGV1Q1VjRjJhYmx0ZlU4NnlwME1y?=
 =?utf-8?Q?sVwA5Gsd9DU7u/lcCWnMxQKwrH/thP5ta+G5I=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(3613699012);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA040627AB441544BE765282B1BF6DDF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9828
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0e3a3527-6016-4b2e-3a18-08dce2214fe3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|35042699022|3613699012;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1ZkK3J1ZEpwR0Z3QUJIZWcweXJCR3RjczllbklENFZMdkVJTGtVZUdtbUZt?=
 =?utf-8?B?U2NiUlpOOXRxaGdWSzR1SUtLdXFEOCtyWC85Tk1UNFRGRDJTSk5uZHdEOFli?=
 =?utf-8?B?bnJ2dVB2NXk0TGJlN1NCbXErK1duWXI2TktBVzFIVmNuVnJhNlNuQ3lLK2xE?=
 =?utf-8?B?NEh0OE5XV251bFhVenBTRXZVRVVlblBiN3duMVRyTjZURnNqdHA4dkpvNHdw?=
 =?utf-8?B?azZpWnc4OU5VNUNrZnc5YlQ1NHRjZ2VkVjZ1WXhZS2xHY1hZcm9uYjg4MzJD?=
 =?utf-8?B?S3hVbVRwWDZKTDhkb3RPTlV3RWhackNBLzNTSS9pV2dnTzdTb3ZzOVQ4Y3Nx?=
 =?utf-8?B?d3NJSUlwemRzcmx4QjRRTWg3bCtnc1VJa1dNZ3FQSmNNdXVLZDZ1ZXQ4Y2ZR?=
 =?utf-8?B?S3FKVGZlQUJBNXp1TFd2b3FnbzZYbnhrS3dFOHFEM2VRU1FhTElSajE5T3pi?=
 =?utf-8?B?MkVCUFU3bVlxVGx3enUyNDFVTmhDZ1ZhcXJnNWs5WUkzb0dtaWdUL05hZGZE?=
 =?utf-8?B?bWtGZnlER0ZTd1lSZ2t0LzZhTENSaS9XMWZQMXROekVOTXFPbDFrbDhCNlgy?=
 =?utf-8?B?eUdFQURic0wwSU03SENoV2JmbEcvVERTMk9ac21jNnp6YnNtV1hKYlVKbkhU?=
 =?utf-8?B?VXVmbnBPMWxKbmRidE9IYmdzTTJheGZqMStqamp6WUdzbHpscGlEVWZPcXBa?=
 =?utf-8?B?YnV2UkZBTG9MNThiQnJJK3lTZ2x3eTN6RlhhL1BwcVJPUi9NK3pqSFg5K1g4?=
 =?utf-8?B?eVNTYmZjUU1mQTlDaHJyQis0NTY4eU1RWDNDM3ZnUE1iUk1GSS9xUURXMCth?=
 =?utf-8?B?dFFOZjNtaWV0R2p6bnhPbmptbFF4b0NDcldKc3FFSzZtY0VUOHdGQ1M3T01W?=
 =?utf-8?B?VkNIcHYzSkRsZWR3NkE4cytmRk1uNlVpQWdlR1RCcFJVZDJIdldkYVgwSi91?=
 =?utf-8?B?WksvY0lRaWtlRG5YQjdOUW9HVGN0eWNGaGhKaXRoNE5Qb2pJdkpWeTFIOXRw?=
 =?utf-8?B?M3hwcDFhd1pmMzJYcDdqMzlIdkZPZVliQWRoYTFaNTdaamxFY2ptbVg4M2d2?=
 =?utf-8?B?ZG1HN01aeU9IUkdpQ3ovbmtmenFUbHhWSnBhVVpRcVlzcjJxSFdvcXphVzFC?=
 =?utf-8?B?USt0bWwvanF0SlY3TzdvQ2JYZUQwaCtINGdrd1h0dytEQ2JjVmEvUVpQWXMr?=
 =?utf-8?B?cGRORnhaOERaRWppMmRENWRYbGdXQ1pGdW9tTVBJcVk0SnFWMFZkaU5LOXNp?=
 =?utf-8?B?ZEcwWk5ZQk9JTzROMVp5QlZnRE02Z1VrYzBuZ3pSSVRwdmlxREtPbGF0VFVZ?=
 =?utf-8?B?R09WZ21LaStGbWVzS1dBejNXdDdDN0FueVBoNVNuUWN4cFI0ODdyNkZmSnBD?=
 =?utf-8?B?SysramVCOG96ZGV6Z3ZneGNKZkpNanAvWG5RT3NnMEcxRURLdXZOSVJ4ZEE1?=
 =?utf-8?B?Mk52eE5OeldrQVhVYS91V0lBRThxSjBBY1lYd3ZMcEVSV2pOQ2RCR3JNa1V0?=
 =?utf-8?B?eWp6ZWp0MnltRFBhcUJsL09OSXJtQU55NTJGOXg5bnB2QUpZdmlicndvWWFX?=
 =?utf-8?B?c1ltM0EwaU1nbUdIVVEvb1VYb2xEeHVIajN1L3JUTDNyenB5bkdyZUdiN3hr?=
 =?utf-8?B?RXRGbUx2SlVYS3lsbk9jeUVDWGpkY2lON3JDMmdwM2kwb2lBa0lHbFRwaHpx?=
 =?utf-8?B?a1lMaDk2TitaK2hmbGxWQWdNNXIxN3NMUmM1a05qUHhzaHdIYnRHL3ZWR01r?=
 =?utf-8?B?dXhDazJyK3lzUDZmMm5TeTJCVXNKZkN1T1hUU2Z5UUs3MEo5QmxtcTg3YWxT?=
 =?utf-8?B?MjVBeXpVQWR0UjNBeURDU3NBR3ZLWG5VbmpnNm1wL0VMMHlvQlEya3dZSHky?=
 =?utf-8?B?d0RrL2h4UVRzUU5ndGsydmxKN20xdkl0TDhXOGpUblhFeGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(35042699022)(3613699012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 14:00:01.8836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abf95bff-bb7a-4d2b-e728-08dce2215816
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 14:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205169

T24gMjAgU2VwIDIwMjQsIGF0IDA5OjUzLCBSb2JlcnQgWWFuZyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bGllemhpLnlhbmc9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gVGhlIFZFTkRPUl9SRVZJU0lPTiBpcyBmb3IgY3ZlIHNjYW5uZXJzIHRvIGtu
b3cgdGhlIENWRXMgaGF2ZSBiZWVuIGZpeGVkIGluIGENCj4gbG93ZXIgdmVyc2lvbiwgQ1ZFIHNj
YW5uZXJzIHN1Y2ggYXMgVHJpdnkgY2FuIGtub3cgdGhlIENWRXMgaGF2ZSBiZWVuIGZpeGVkIGlu
DQo+IGEgaGlnaGVyIHZlcnNpb24sIGJ1dCBpdCBjYW4ndCBrbm93IHRoZSBDVkUgaXMgZml4ZWQg
aW4gYSBsb3dlciB2ZXJzaW9uIHdpdGhvdXQNCj4gYSBoZWxwZXIsIHdlIGhhdmUgdGhlIGZvbGxv
d2luZyB3YXlzIHRvIHNldCB0aGUgaGVscGVyOg0KDQpJIHVuZGVyc3RhbmQgd2hhdCB5b3UncmUg
dHJ5aW5nIHRvIGRvIGhlcmUsIGJ1dCB0aGUgY2xhc3MgZG9lc27igJl0IGp1c3Qgd29yayBvbiBp
dHMgb3duIG91dCBvZiB0aGUgYm94LCBhcyB0aGVyZSBuZWVkcyB0byBiZSBmdXJ0aGVyIGNvbmZp
Z3VyYXRpb24gYW5kIHdvcmtmbG93IHRvIG1ha2UgaXQgYWN0dWFsbHkgdXNlZnVsLCBhbmQgdGhl
IG9ubHkgdXNlcnMgaXQgaXMgdXNlZnVsIGZvciBhcmUgcGVvcGxlIHdobyBhcmUgbWFpbnRhaW5p
bmcgYSBiaW5hcnkgZGlzdHJpYnV0aW9uIGFuZCBoYXZlIHN1ZmZpY2llbnQgY2xvdXQgdG8gdXBk
YXRlIHRoZSBDVkUgdG9vbGluZy4NCg0KSSBzdWdnZXN0IHRoYXQgeW91IGtlZXAgdGhpcyBjbGFz
cyBpbiB5b3VyIFdpbmQgUml2ZXIgTGludXggbGF5ZXIuDQoNCkNoZWVycywNClJvc3M=

