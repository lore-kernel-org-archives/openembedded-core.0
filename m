Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00511C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 15:07:01 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.web10.21257.1738336020977624961
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 07:07:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LE0X/BOp;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=LE0X/BOp;
 spf=pass (domain: arm.com, ip: 52.101.70.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Vw0yH+vT2GZgSDcq87W9NAb7Xq7Ux9ptcqmefq5nvzQKUF/hVgiPgZdm0a/rSbo0ol41l1iB235pXkXKGMm1ejLK6HpmwYnmSwQ34dsmZrcqIafUO6WbC2WBU91w1ERSnvH7OdRwiLgmnafT187knk4K2cG5H8Zgeq40bWoI3qzQoC7uIUvKFw2zeuyOe4nvQ1nsBm3buAGmbEuV4oBL2d8kt8RowXAG8Q1nMVRbyESbWwilgPSRV8J345flHFofAayRfBoniCVWGzy8qM4LDyvHyy1X0w83c4ElBPTa3Frs4gw5SYmCGa3/RvgkfXHJome1MWueK50C3mTJQdpJrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6JZKW7mxBcCb4VPdXHeCG4qYnVkWEnGgFxHDeU7P4U=;
 b=Lr09GLwh2H0aVC3CZc9pxBp/3SfAs0hqJV8ZqIAXACBENdxEqEmtOsy2x26hjTnres2Eip4U2kGJoup/ZlY1MNlhM6p8OqZzx13ujinTeMn/7U33IuUpOrH5L8hImmBsE36etzYlwyRM1CTqfPbX2LgH0w5yYhk5H0CnP+hNvhj8/dka7TDz7ii2d3pvBVmM8C2lGyA8LwVBRBLYkIhF+9gAb2/+ADsmAjLKvxW9hwbgJmjhHmr8sMF8ogCj+xY20pJ0MZcjZG1Tg82SGknW16Ob4/CD1SPAbDwdk71Pgzlo9sqf7Ck9UKmKr48g1y/ISD9IqkvNUAHhMWrSft6SEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6JZKW7mxBcCb4VPdXHeCG4qYnVkWEnGgFxHDeU7P4U=;
 b=LE0X/BOp04t2gwZ8OXJ+GCxHzhMZSiG7SdoHrK0DnKb9vDdBPYDkZ+B6bScNJzM7360ZsUorcZumq1gcLnT25luRdr0XxHAsl6AseEETQOQ1RLvP7jeP2Zu1YtoAnoWfy5XkiNiynu/Bt+bFPo3lOSPnQb1cvffjqkShkbVwXM4=
Received: from DB9PR05CA0026.eurprd05.prod.outlook.com (2603:10a6:10:1da::31)
 by AS2PR08MB9787.eurprd08.prod.outlook.com (2603:10a6:20b:604::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 15:06:52 +0000
Received: from DB5PEPF00014B99.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::b2) by DB9PR05CA0026.outlook.office365.com
 (2603:10a6:10:1da::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.20 via Frontend Transport; Fri,
 31 Jan 2025 15:06:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B99.mail.protection.outlook.com (10.167.8.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Fri, 31 Jan 2025 15:06:52 +0000
Received: ("Tessian outbound ca1ab514ff10:v560"); Fri, 31 Jan 2025 15:06:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 637b838b24125e30
X-TessianGatewayMetadata: ie8rNTttgjemM2DHqnMq0zcVVThwM+rNqkF8xtrtmyY5JKzjYhQRzeiX5+maRz/PTCGm6vSEq03vbNxiMVgJX+i0l4BAEWbNeDXXUjHhne++ZEjt6aMsKizKF7Ox4v1bAqNNAbqnSAUAvhmc9BvOOJurLaMn9TYDBjW0LRLNzzo=
X-CR-MTA-TID: 64aa7808
Received: from Lb9c50a4cf7d4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2C2F5EC6-2043-44DF-88F5-548A27C8762C.1;
	Fri, 31 Jan 2025 15:06:45 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb9c50a4cf7d4.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 31 Jan 2025 15:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u86pjt9hsI5yFMVYShMAz+01Y3ya9BkWcyG1EILE9SrsECye82f9B7hyr3btAPZW1AkUMjElYGxOSu7wPNXlupzN6pM2iv+5jYLEvDNyJuYk/YFrtS6MGUykSf/ZiAetvZTlViCHMkm3FokOXSwg7NiOIHQdgV9IFz9Rh2xxZr4K8MiniOIoDh8IoMHDjYw6Ttcfg0pcwWrk+cOWVK/wYjHInZ8b7gN078HrDK4JUho7IO0CWJR5q1Wdp6iKzuDIA0IrDR9xY2U1MHf6wB0z8owULNYXviYR2onVYcPx6uu6qsu7dzRKQpkbEfDlDiPKMAMpDFMZHO354/ofxwnUgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6JZKW7mxBcCb4VPdXHeCG4qYnVkWEnGgFxHDeU7P4U=;
 b=xXQW7JcpyfmoqhakenRKyXp7K66jOSP8toyrWMggDGvd85lO7+6o2SNRDNx7IupMXwityoG1kwnKBhwMAiHnS+GhUqd5BMAMbyjPpHtd8rB7ZAs+nik8spIBlkZY+NNNy16CLpE9LYjSliIsGOK48XMEJZ2bWQUIPCGNRSiqVVvujyPvuJGQnMdsF76AG0+Az44Z3yGu8OlBUoiUNTD3hrNOhAgeUhwV6lNdSzdzHTaQAGPsCm9QyMbWJjFL+YXbtPC2AiWpUpz1rezuo1o/RJ67SXC1JoAFIQY0vi3mSsW9u6xGRfBFfes3XEuVUaIBbfd6tCyLscLc2SpdvCIWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6JZKW7mxBcCb4VPdXHeCG4qYnVkWEnGgFxHDeU7P4U=;
 b=LE0X/BOp04t2gwZ8OXJ+GCxHzhMZSiG7SdoHrK0DnKb9vDdBPYDkZ+B6bScNJzM7360ZsUorcZumq1gcLnT25luRdr0XxHAsl6AseEETQOQ1RLvP7jeP2Zu1YtoAnoWfy5XkiNiynu/Bt+bFPo3lOSPnQb1cvffjqkShkbVwXM4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9867.eurprd08.prod.outlook.com (2603:10a6:20b:5ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 15:06:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 15:06:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd-serialgetty: add comments
 explaining use
Thread-Topic: [OE-core] [PATCH 1/2] systemd-serialgetty: add comments
 explaining use
Thread-Index: AQHbc0C3lCyLx4iuCEyWK10ahwwpi7Mw7vuAgAAN7oA=
Date: Fri, 31 Jan 2025 15:06:42 +0000
Message-ID: <49C5B6B7-5A18-402E-9FA3-41BF3065DDD7@arm.com>
References: <20250130175901.938043-1-ross.burton@arm.com>
 <D7GBMBCF2JEQ.3TH1BIIDJTQ09@bootlin.com>
In-Reply-To: <D7GBMBCF2JEQ.3TH1BIIDJTQ09@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9867:EE_|DB5PEPF00014B99:EE_|AS2PR08MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: c52aff9d-fb8b-4777-0a0b-08dd4208e4ee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MkpQMitwZndvZU50b0xSMk16Um9LWWRUUXR2WENZRnhXQmdmU00vRjlxRTI5?=
 =?utf-8?B?VHVQaWs4ZDdyREdHTTJhLzJxYUpGU1h3THhaYW1ocWxaM2djMDJEblJXS1J5?=
 =?utf-8?B?MUdaUlRpOVNiM3RmVDd1V05zR1F2WGJnUUcxTWJ2SWorQXp6c3REZFhCQmhB?=
 =?utf-8?B?TmJxN3Mxa1NDWDZOTUJ5eDVZam10YUUwR3dvc1hTUWo3K0NTblVTWE1COFVz?=
 =?utf-8?B?NTA4eWFZQ1VFSTJDTUdiTFBaWUQ1a0VjbTFqSDZTRngvSjArSGJOTzNWU0Fp?=
 =?utf-8?B?M0xNVGt5MXNzd3hkbFJsck1KMHpuekJGOU01NGF1OURZRmxHSEJpVFJXSS9W?=
 =?utf-8?B?cnliOG1ZZFdVajNPNks3L0xVNVdGSFZtTUtYL0N3eWVYandFQ0hVK0tSblZr?=
 =?utf-8?B?YTFMMS9MaGtST2lLSkMzNjBrOVo3OHF3WEhGRUxydERJcFljbmY1NENOdXlx?=
 =?utf-8?B?eDFLSEdYMFdmU05ndDQ3UEFhZGppVHJrV2dEeFo3U1FBNEUvSHlHZU9IKzhO?=
 =?utf-8?B?Zzc1RC9UQTl0MlJFWTZZdWprenZuQUNtVnk3QnBYMUt3UjJDeGVsVlAvRCt6?=
 =?utf-8?B?Z3hVZUtLanZiVnNCZGxZejM0NFpUL0hXNGJNTGg0bENMQmVzTitPczBoM3V1?=
 =?utf-8?B?SjhkMzA0MWpUK1haZFprd0lZcmc5VXFhZkE0R2xUcWRocnFxUEFReXAyZlZ6?=
 =?utf-8?B?WGNzNmtscWkvek1GYlRzZDNYa09HOWNDeExlVlRlRjl6Rk1JVXBRejNZYlJ3?=
 =?utf-8?B?emdWZmE2OHZ2MXRXNytXSWZxVWtuMnJpTmNaUjFKemg4QkdZV0ZtUWFJVG9C?=
 =?utf-8?B?eFNwZXY4eXNoZWJIZGRBOEUwNnZPSzIwYkVZVEhPYWp2NzFHUEtpOHFJZjZh?=
 =?utf-8?B?U3JoVmJJZndERHZOOFVUN082cXQvaTNsZWxrUmhRYVR2MnQzd09zeFQ0OXIr?=
 =?utf-8?B?N1pZMXV6Unp1aGdyN29zTldtVHhza05jcEZ4N0VoUkhIWklvWnFEVkZsZVJF?=
 =?utf-8?B?eHhXenQ5eDFOeFBrWjFtckRtUDJNaGdQSnF0enJJakF1dDhOdVIzNHFxaWxX?=
 =?utf-8?B?S2pmT3hzbExjaytGeHkyc2wyWkVqRUJHVmVQS0s1TmV4bGZyeE9HUkQvOHU4?=
 =?utf-8?B?cVVGV01uOVlTNGt4b01FS1ZqL0IwNkRFUzNsR21aaVI2OWVueDZWYmQrdy9J?=
 =?utf-8?B?Rkpnd2Q1b01hNDZ0Rnl6YU9NRTVIQlRod0psOFovazRxb3NMT0tEZWlTOGRO?=
 =?utf-8?B?SWNKZklieDRpU1BCZ3dkNFV4dEVEVXJUT2thazJQNlVra2NEQUhhTVc0REtY?=
 =?utf-8?B?VlM4SkM2a0lPamJyaVA2Y2VaY01iSW1UaHJISTZnQzZvQk9XeVVXYktIdjB0?=
 =?utf-8?B?bEJFWUhjanVtY3BHVU56ckRCS3psSE5Sb0dLQkRWQkxSQmM2YnE5V3I3QTY1?=
 =?utf-8?B?d29rRkxUZDI1Zzk2eUtja3p4a3pudktqS3RKS09oWnZIOFRYMzRkSEhoMkNL?=
 =?utf-8?B?UXRaRVU1bFNnMkZpamN3YjlMVVkvUDYwbTB2U3BHdTl3cG5wTFoyN2JFSXkv?=
 =?utf-8?B?T3QvMmYxaDBpd1dyV21pNjNPNk9ad2ZXejFkaDlzZmZTOTU3WHNET203cmJo?=
 =?utf-8?B?bG1Sc1JRVUxLSmpkU3UxK0ZPblNKNzRyRVJqOXdURWpMVnJWZ054Wml3Mnd0?=
 =?utf-8?B?cStkRHBaRGNpS2JFenNnaFk0WjE4cTJ5bmRYVy9FVW14MlRQRGZmZDluMzZw?=
 =?utf-8?B?eW9EcnFPWE1lTUVZVHZJeFFRZlVuRFgrNmJOaVcvWjM1ZTBvVkVxM05XRVRY?=
 =?utf-8?B?WFpFYk0rcmU2ME9IREZZVmJzSG9RU25KZk55OXRsVmd4OWZMeDJ6UWtER29B?=
 =?utf-8?Q?c2ammh9KWON7t?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA74DF598F53764C9B68BCF236CB3F82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9867
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1ac38bb8-e421-4642-c301-08dd4208dec7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|35042699022|1800799024|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c3d6WG40eDVwVWwra21pU2NtYkp5TmJ4TXJqUThQK1gzMzlyTWtlT1F1YjhV?=
 =?utf-8?B?OUpBd2N0S2hhTy9KMWdxZUR3OUU3YXBBdzFMOVY1MXE0eDFMNmJPVDVLcDFu?=
 =?utf-8?B?dzdqQnBzV2VGWDhoeVRhQUFTM2RIZGxGcnpkTnQ3Y3V0OURla0xYRE1TR1px?=
 =?utf-8?B?Zll5Z0pMTnhYb3VYNWNVQStPMllhdXpKcEFhZEs4c3BieGFIN3FIUmZUOENT?=
 =?utf-8?B?T1FlZTJoQVhHMGJBcVR1alpkM2VnNzhreVBZUUZHOWlvcWNvRlZlbFd4NW5w?=
 =?utf-8?B?YncrRTl4b1NvaHBzT3N6Q0FwUDBBbjRTMmhaT0tPMHpoZ05GU0xTbzNQbHlk?=
 =?utf-8?B?cGNwZkdoRjR2ZzlnYWZCV2tESUFSWm5MR1pHOS9rQTAvNEUwYnNqZmJ3SkVz?=
 =?utf-8?B?MitMVXdwYmJuQ3dPOFRBNFFRTnQ1SDFuS2lvVFNwS1M2Y0ZJMk54MEJNNUtZ?=
 =?utf-8?B?RzVjdFY5RURGc0hGNjJnZGRvSkNzNjFRQXlQUnBHRnp4bmo3Z3QxYTFtRXJz?=
 =?utf-8?B?Rko0c3VBQ3lwM1VCT2padVgzNTljdzJqbjY1WVJWejY4RWlOME1SMWlEOVBL?=
 =?utf-8?B?blRoTkFBTUJRMmpXc1hObWZFQlc4bWdMeEJmUFF2LzJqei9rWkpFOHkxYTRj?=
 =?utf-8?B?a3pjKytlVVpVTlpmTHJiUGlmZ1hxWlBleFBjZ0luMzRrWGJ3bk0yUFR3b0Zo?=
 =?utf-8?B?Y3lGck5pRkc5a0xuTjNUTU9HVElKYjByT0Z2TE1CYS83dHdpSE5GaHZXZmN4?=
 =?utf-8?B?SEtkbDZzUkNzUHBKT3QrZ1FyWHJ5Vk5MeWt3Z0NuU09JUTdlakR3eWZVS2Jv?=
 =?utf-8?B?MDJTVGhDcjdnSnJ0NEtDOVk1Q2lIQkpyeDQ2ZXdLb2gzTFRTUGtGSzd0NENT?=
 =?utf-8?B?aWZLbkl0OWV1MnMwczV2Z0preGI5N3VKRkhXWEVTaW1aNy9UcmpGKzFpaFcr?=
 =?utf-8?B?cm9leWZ0amNUNFhXQ3N3ZUhYK213YXJ0Vkt4NEVyZWZMR2JJcnVUVUxKMWE5?=
 =?utf-8?B?K0pGdUNRNXZtMFZ2K3RsSHRRTFdIUGdYVEw1OW5VQk44VWRVdGZNbDJ4NEx3?=
 =?utf-8?B?SWk4QlI5cW0wclZaUndzWTZnbFQ2Vi96aGtiZ3Yza2FDckZTbm5STWt3cjAx?=
 =?utf-8?B?dlVvNHRPWkxGbFVzVGJRQmNqMnF2ZTBzUk53N3ZvMXA2dFc0bDk4U0Rad0lX?=
 =?utf-8?B?WkR3TzduQ3VsQmwwcWxOa3dockVBNjhXMm94dWdZekZZTXh2dlBPSUFoOVFS?=
 =?utf-8?B?ei9ycWpKVXZFelFhcDFxc2h2SWpxZS9NejdjckVTUSsvNzd4M2lMMDFOd3ZI?=
 =?utf-8?B?Wk0wU0JIblQrTFV2d0ZzSEp5dDJ4bEdDUlZKT21ET04veko2cUNMbVROd09Z?=
 =?utf-8?B?bWhFYzBjaEx1TUZRVEhveU5OQjdWVklZMDV0NmI2UDhsUXQvYjlpQ0IwSU9p?=
 =?utf-8?B?UlpFc3pxL1NPY3phSkMvdzF5ci9DSnNqNm9kbi8vWjE3Q2RWVGg5Z1JQVE9R?=
 =?utf-8?B?bVpWOStzeTA0VVppVlgwZkRlaWNNSzBqSklJMmtGcWx0NnRTeXNEcVFkOE1i?=
 =?utf-8?B?ejlsd2x5MUd2SS9uME9tY0ZlcmpWV0xJVXlnbnREb1JSQ28yWGJQODRWU3dC?=
 =?utf-8?B?UDdwcGlHKzNXSTVNRG9PbW1ISlN3a202aGFZUzgyWDd6U3pBakRwTzNMeGd0?=
 =?utf-8?B?aXFNb0JESDdWU0VHRStoSXcvZ1VjbVliSXVjN2gzckp2MlhBWmZDMmtUVjcx?=
 =?utf-8?B?SFV3bE5USEVZdVRBUHl2R3VmaE1LMndVaUFabUpOQUgzSXJPUUJIVWR1d3Zw?=
 =?utf-8?B?bCtLcGdvSUdhYnNuY0pmZ2pMam1oK0lYRUE3WU8rVm12V2syRHlUVDhKOVJR?=
 =?utf-8?B?Yk13cTBaaDBCclcvb1dNbFdsajdxWmxBSUZoRGFkVVQxcm1rWEc5cXRNVGtp?=
 =?utf-8?Q?CTPfd7H57qk=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(35042699022)(1800799024)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:06:52.4455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c52aff9d-fb8b-4777-0a0b-08dd4208e4ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B99.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 15:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210488

T24gMzEgSmFuIDIwMjUsIGF0IDE0OjE2LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUgSmFuIDMwLCAy
MDI1IGF0IDY6NTkgUE0gQ0VULCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyB3cm90ZToNCj4+IEFkZCBzb21lIGNvbW1lbnRzIHRvIGNsYXJpZnkgZXhhY3RseSB3aGF0IHRo
aXMgcmVjaXBlIGlzIGZvci4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJv
c3MuYnVydG9uQGFybS5jb20+DQo+PiAtLS0NCj4gDQo+IEhpIFJvc3MsDQo+IA0KPiBTb3JyeSwg
SSBiZWxpZXZlIHRoaXMgaXMgYnJlYWtpbmcgdGhlIGF1dG9idWlsZGVyIGJ1aWxkcyB1c2luZyBR
RU1VOg0KPiBtYXliZSBzb21ldGhpbmcgd2l0aCB0aGUgZGV0ZWN0aW9uIG9mIGZpbmlzaGVkIGJv
b3QgPw0KPiANCj4gRmluYWwgc3ltcHRvbSBpczoNCj4gDQo+IFJ1bnRpbWVFcnJvcjogY29yZS1p
bWFnZS1taW5pbWFsIC0gRkFJTEVEIHRvIHN0YXJ0IHFlbXUgLSBjaGVjayB0aGUgdGFzayBsb2cg
YW5kIHRoZSBib290IGxvZw0KPiANCj4gU29tZSBleGFtcGxlIGxvZ3M6DQo+IA0KPiBodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy80OC9idWls
ZHMvODMzL3N0ZXBzLzE0L2xvZ3Mvc3RkaW8NCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3By
b2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzUvYnVpbGRzLzg4Mi9zdGVwcy8xNC9sb2dz
L3N0ZGlvDQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8j
L2J1aWxkZXJzLzI2L2J1aWxkcy85MDQvc3RlcHMvMjMvbG9ncy9zdGRpbw0KPiANCj4gQ2FuIHlv
dSBoYXZlIGEgbG9vayBhdCB0aGlzIHBsZWFzZSA/DQoNCkRyYXRzLCBJIGV2ZW4gcmFuIHNlbGZ0
ZXN0IGxvY2FsbHkgYW5kIHZlcmlmaWVkIGl0IHdvcmtlZOKApi4gSeKAmWxsIGRpZy4NCg0KVGhh
bmtzLA0KUm9zcw==

