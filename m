Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90121CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 19:25:43 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.63])
 by mx.groups.io with SMTP id smtpd.web10.4298.1727205939453818400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 12:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WWgfdahT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=WWgfdahT;
 spf=pass (domain: arm.com, ip: 40.107.104.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DAMXxBE3/8cRCC7/hISBUCX2tINnMgcxFbFJWgMo6fB6mlaBqzleA3monIOs6YPImR1cP7rCaRkz/XIW33HO1a0lxYxVGbZIgaCskjh0mjXaTyY6m1Xhxgiw+d3BDVqQftcUFMAYk2xbyibdAAjH1c6x0cA7WK5QvpSkTQGHY1m6sjCIEqNjnhO5q7xTzoEStRPBmTl8/U14Ka+N5DsbZwouiqV8s8CtDxfuhNGfuJjdHaSs+buO03ea97iqZyC7Z8p+tuLu6zsX/LJsnuUx0zb5ptHuSOUQjwqt70MLLwuPfenfqKsQIQiNbi8ILvPkbZqeDI+4ljuF0SBqqWP5nQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKlOUVikANHQ0jpS2W16VcJuvqDqYeQEJ885KUgkXbM=;
 b=k1v0bvhzF1mq+QMxd12m9e1Kr7oGunnAByxKtdYlArCz8MDRKbg+wqaW4ta6tJVFVxqvQfkdttOPHAWcFnw0erGEZHRupfyVDCfpMn87uOnOuPRz07rS1fpFvVtZxFLR1aAhFUs1qMSaBQ+h5/1b9GOwAOkolu9SnmLQZfbU+Nopzdn6TwoooapJbRCZuMY/zx0kkbnEVsUVbNY4qXrDGC1RdVLj5vwMiDJD5dmZD3Cxgpv+KKZcFNZ3IMViRzXJUOM0b5bzxQMPlhvwemeStS0O/aB77MI6PYlvsrrw6DBaEoW63imXuLh4bYYvkS4ztQ1R5EdnNXc1fxtR47OWRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKlOUVikANHQ0jpS2W16VcJuvqDqYeQEJ885KUgkXbM=;
 b=WWgfdahTy6Z4lgGZvkUtXw9XrRo7ucqR14Po9XuVQgBnyLURymSkhLpquBLeGhFN8TNnZc/UBz6dHicLnrQU9bial2f57eTeCllFb+CgWUKVATlOWjwawwyYNTfGhtj6nyL9AR1Dro87WpaLGfQASG8LrVLuxo2CAx/ZZ4hXV40=
Received: from DU2PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:3b::16)
 by AS8PR08MB8945.eurprd08.prod.outlook.com (2603:10a6:20b:5b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 19:25:30 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::3d) by DU2PR04CA0011.outlook.office365.com
 (2603:10a6:10:3b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.17 via Frontend
 Transport; Tue, 24 Sep 2024 19:25:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8005.15
 via Frontend Transport; Tue, 24 Sep 2024 19:25:29 +0000
Received: ("Tessian outbound 3e266b55d80f:v465"); Tue, 24 Sep 2024 19:25:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca0d808de6d84ce6
X-TessianGatewayMetadata: 8J9TzOTcYkhC023XRHpv+L8PHEtqyexoH+t6paG72nMX4p5bOESZcIE27gqpWcv4LggNfz2odyYl/qS1CllhYwCeRXJptWFq5Qzz/Ti+hp9SGwU2QgRNMw8fthNUNcH0IJMEq3Cjq0PYsRvQrRHiLjLJbUn9HZFpZ1+PCr0VTaE=
X-CR-MTA-TID: 64aa7808
Received: from Laf1e722afeee.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B0BFB56E-C392-496D-8CD9-540177999979.1;
	Tue, 24 Sep 2024 19:25:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Laf1e722afeee.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 24 Sep 2024 19:25:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG+Ul7u/WHm1c7Yxn5Rc1vqH03kzxdZNgepShs0dwj4+IBTFF3TTUmPT3Vi+rHHUVkdbilwYi6Rq2WB0AIn4purIKx+ugmWFxi2Zc7p7U2gE0PUsOiB5Mu4+/CPVedFfjfalEy4hjTUsJ1WAKlFB16Xem82o99vgXqMP+7uOVp+ihTJrDHlUWrBGa2Gfo6GSrqGVeC7rm5w1ZApr7Q0pUXHqsoj62VB/hQtR636Ps9FE1PxgqLUhDWZeayXoTShdi8NetozbWXqMv/MhEYNzO+Sg1tpDAAlx4cC+8ANU1M5CU0F9xm/6iCJtnNDfauHLpUDIBLUT3zGJrY2qkOIaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKlOUVikANHQ0jpS2W16VcJuvqDqYeQEJ885KUgkXbM=;
 b=TypmYTgnTyNNkMFBFG3ppMgG/Gv1ihEbLci3j7pNahUNJLnvJMxoQt4ctAA959h8FomXZ5MBCpOwnXgKW5ZDwHjOM0QcnKbqn+MCN4Xiu+OVTeI3cVwltAjSHoio5j6H92GeA8Zul75FkdbH/ofS340YC4Uh7eLTGtIhzrOOlQVdF+cdsZxuibHSr+TdiGSicx0Aj5nwKhI66CzxMZtup9LyrPFO5SNugNHMs9TKsegIojmxUi15NxBOBZQcbixVUwx9NfrfWzOx0OtoYLFpSGB7a7fa1jcfcBRH9Gn3tgWuO5eCfLenNy5s7xMX7dGSK/pyvStO9WO+mlg1xnYEzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKlOUVikANHQ0jpS2W16VcJuvqDqYeQEJ885KUgkXbM=;
 b=WWgfdahTy6Z4lgGZvkUtXw9XrRo7ucqR14Po9XuVQgBnyLURymSkhLpquBLeGhFN8TNnZc/UBz6dHicLnrQU9bial2f57eTeCllFb+CgWUKVATlOWjwawwyYNTfGhtj6nyL9AR1Dro87WpaLGfQASG8LrVLuxo2CAx/ZZ4hXV40=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10822.eurprd08.prod.outlook.com (2603:10a6:10:529::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 19:25:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8005.010; Tue, 24 Sep 2024
 19:25:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?U2ltb25lIFdlacOf?= <simone.p.weiss@posteo.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] gnutls: upgrading to 3.8.7.1 FAILED
Thread-Topic: [OE-core] [AUH] gnutls: upgrading to 3.8.7.1 FAILED
Thread-Index: AQHbB35vTsSlShsACEaDyOojllo5eLJnLPLjgAAy+gA=
Date: Tue, 24 Sep 2024 19:25:15 +0000
Message-ID: <12E0CBB5-4092-4940-AAD7-CF40C776F364@arm.com>
References: 
 <01010191f61ade2d-97c5199c-2106-43da-9e43-90c50a8a408f-000000@us-west-2.amazonses.com>
 <17F5D6D545773F97.13829@lists.openembedded.org>
 <8e16c978721bd5b62ccd385e918e3675e6e4418e.camel@posteo.net>
In-Reply-To: <8e16c978721bd5b62ccd385e918e3675e6e4418e.camel@posteo.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10822:EE_|DB5PEPF00014B9B:EE_|AS8PR08MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: e21ca90e-cbec-417a-fdbf-08dcdccea691
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?c1I1cDhLZk9DcktLbDF4QmpTbkFZL2pvSU5OaktvSjBRVFFXSksxdWFXZzhv?=
 =?utf-8?B?KzRNZU5UR0M3bFFQZG9HU2FYTzMxY3Z5eUljOG1zWC9TRFM0TEVDbkMvL1NU?=
 =?utf-8?B?QXp5YTRZeVlVNXN2SUtKRGdteGNHcWFUSFVyY0JpRytUOTk1N01vS29wWW9r?=
 =?utf-8?B?L1lGSWd6MkUwNWZzTnYyc2V1aEszV2phUlVXSEV1dEViWHZadzhuWUxkTUFp?=
 =?utf-8?B?N3RYT3ErUWNlS1BiZUdZYjNQMzAyTWRLYXhHa0JENDRWckVyL05oejdyQStP?=
 =?utf-8?B?bjdtcTFTajlVNmtKT0wxTXpTbWRVVlFhNFJscGpDVFNhVXBsN2J5cTQ0cjFK?=
 =?utf-8?B?dFl5TTNHUUhYbjZPU2Z3SWk0YlJTOHVTclVaVTR3V0s5ZVM0a2d0NnJKZGZo?=
 =?utf-8?B?SWxNZHVlMVpoNXdsQnFnaVVYYUIxMWkwNTlyckRTc01ZSzNTVVBFa1lHTFZm?=
 =?utf-8?B?UVozZ2taZHQxNWFEL1h2WGVkUXlCVnp4bXczeFppYzl2dFZtNnBmR3A4YVdI?=
 =?utf-8?B?ZHVtM0J5MllmUC9YZWtpZmhvRzUvS0NvZm1wNmRHZGU1Qk4vUlU1L0V4K0x3?=
 =?utf-8?B?OEdFampQbEtkTXR3TEtJU2FBYVNiQ0hpNTJaYUpDaFFFdWRaS3VPQnJuZjgy?=
 =?utf-8?B?TlBScVVoemhWcmMxUVRub3pCMUhybHJlSElPTEdMMEV2Y2VWOHV6VGgreFAr?=
 =?utf-8?B?cmNBNDkrM044dGJzUy9JbGdwSU5CSXR0NC84Q3JBblA5R29iTEM3dHQ2ZEdz?=
 =?utf-8?B?djhQTEFLcVdNY20xZ0hQMU1ndGJIakgvdGNKK0NQN214RmsrNG1kTDdoSFZQ?=
 =?utf-8?B?R1JnZnBsaDNLVUdESnNibVhBQ25aV2RzUTBGUHp3a2xYSTdOSlZuSjhoY05F?=
 =?utf-8?B?eDh6N0NKajg2OEVScHBERDEyWHZnaTVSempvY3A2dndhT2JOTDdGdHcvMzQ5?=
 =?utf-8?B?UEptU1VYemh3M29PWTU0WDZSQVBMbVVsZHBaT245RnFTbVdwb0theGdDc1Zm?=
 =?utf-8?B?WDBGTTZLSHF2ODZEQ0NGQkd5eS9YZGJyTGM1VzlTTC9hTU8yZkZZbVJoZERl?=
 =?utf-8?B?VnJFYkV4UDk0REg5b3ZrcCtURC9PdHFYZDcwM3k2ZHJQSVZpamlWcUFHODlu?=
 =?utf-8?B?eSt1bkV5ak1MUXoySGtDUHRsSUkydDVnMEJQRFozLzRESjlhWkU2MXo3anhC?=
 =?utf-8?B?M2pxZDBmYnZEUmNzZjVPSDU4YW1UNFdWMmtvcEFGeWxoOWN3ZFhtbVJORmkw?=
 =?utf-8?B?cytTbjNMN0Z4aHZKVGQ4L0VkWEhGWkpzTjdHTUpubUVNbXNMaVlwcitCK01s?=
 =?utf-8?B?ZUJUMjhBRzFIYkJVRlNiNnFqUmhadENDWGtDaHVpNkw5R1JrekxrU1dUNXB4?=
 =?utf-8?B?Tm5GdkFsWE5iaWRzcjVBaGVkOERQbnlCRU9weUdjTDRRdFYzSUJQOUJoOWtq?=
 =?utf-8?B?N0N3SC9VbWFRSkIrZWNNeXE1T1dRUWFpYmM3WkdUVCtJMnJCdWxqTy9PdENX?=
 =?utf-8?B?K3pNam5rdFJza1dLa2QrWVlhb05KdkpiTzAvS2h3cFhVY3REVzhDejVLRUQr?=
 =?utf-8?B?S1Z2ZzBDMy85UlRJM1EwWE94WEFsMWg0cUNYZ25Ib0lxeFgrWWV6M2ZYanJ6?=
 =?utf-8?B?aE1HZGRwWFRRUUh4L3dUUVFqd1FMNWwxak42VlJHdHdPWlhUS1FWeE44L2F3?=
 =?utf-8?B?M0hwMUErQ05KZXR0RXRTRHRJZlBzNkZNU24vSWtkNG80SlFtKzl0ekUvWUkv?=
 =?utf-8?Q?xCLXcyYHUBYML2AErw=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5040C8A4213F044FB9F31EF05EAB39E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10822
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6409a55e-1ebe-4749-fc57-08dcdcce9e19
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGVxNVlwZ01ndGVoRVduY3JHbnJMZ1pnUGpBQUZGQVZxdjhlY3oydU5xM2t4?=
 =?utf-8?B?aW1ZMDVSeTdrYTdLa0hkMUtzQnhyTHM2L2c3ZWhadFVLZzN5R2lWaW94RlZY?=
 =?utf-8?B?YXh3OG5jcnVpUWh2bnh6TkJkU0s2Y3FCN002cHJZTHp1VkxqRDM4MTNEeGJT?=
 =?utf-8?B?elIvV21vTFRIWWJPclBrWUtpdDRNTmpOTlJDWnJRQk9INkF0UGx4V1VGd1V4?=
 =?utf-8?B?RGFwYXk5ZGFNek16aTRGTVRiVjdhdjFpU1BKSk9rMEkvbVRHUEJ4dkRzV2JK?=
 =?utf-8?B?bXRuRVZNaTVJTFRrUm1nQXNESHRsaFNmNXNwczd6QWxwTytOUmYvU1dpMFll?=
 =?utf-8?B?YXJBNVJiSnhaaktGcXMzSnRkRWg5WkN6dGlpMjBJUERUa0JGczRYVjhtSHdp?=
 =?utf-8?B?VXJ1cVIwNC9LMFZ4Tlc0Qi85aUxiV29uOUd0K3lWMlBoaHFLb3plL0E3Q25a?=
 =?utf-8?B?cVpJeU5CbXcyMkRCaTdzQTVzbTNYQ2ZWd2c0NEtOdkY2dHViNTlMTFg3Zjd6?=
 =?utf-8?B?TzM2VmtPemZjN0VaQndUcElmVzNIalZLK2cxRHNzbTROMmVBVWkrZWZOM29I?=
 =?utf-8?B?ZHJtMjBGSWZJT1J2ZDY4djJlSlBZOGkvTktrZlJuSUJaL0NYOC9PekRkNk9v?=
 =?utf-8?B?TnNoUnJkRGpreHVycUp6aDVYRWNmL3JTeWxneC85aUhyRW55RUZaRUMwNjVF?=
 =?utf-8?B?RTlGUDZtSkRnWXhrSVpYQ3I4aEdtcWFiWEtTeDFUYW04d0dMZGY2Zm11UHlW?=
 =?utf-8?B?MDZJRzJINTh0WFBtZ1FyYW00dnFDUVRMTXk4TFlMWW84TVJFOEF6QXZFTVpz?=
 =?utf-8?B?VTl1eGFrblBLd1FSZ0ZxN2lycHJJM3NZS0c0QU1JTkVIVGU4TVRVZkZuUVds?=
 =?utf-8?B?aStVYTFkN290WllCL0dWak5aWGR2bkFFRjEzY1ladjY1ZGJNc0x2SjBoYTh3?=
 =?utf-8?B?dnhrNXF5RDdIVUdXY1dVUitpekFON1FUN014anhhVDY4NW1SaFVEMVlzUVEy?=
 =?utf-8?B?UEpYNVpZVXZ4eHlVL2JnbXpJTkp2Q2d2SXNaRlhCcEJIWHRlT3BmbC8xRGU2?=
 =?utf-8?B?ejdoY1h1c3o3dU5NbXVBODloZU5URS8yb2hPQ0pCdjBTYjlFNWF2d21sUEEv?=
 =?utf-8?B?RlZnVFdKSUdST0ZnTVpHZXMrOWludjV1UC9xTlFlclp4bmlKci9hM3hUQjFn?=
 =?utf-8?B?bkl5Q1lqYmhPRyt5WXdMTmJWUXA4VVd1aC9iTzZieTFKR09SNzgzMmhJVjVY?=
 =?utf-8?B?TmhPVXcxTTg3enlIdnhwUkhOYzc3TWM4UzMwT3I1K0VsbXpveFFSN1oxOGxW?=
 =?utf-8?B?Z0U0dnpEeGlKelYrYkY4Tk9LZW9uc0cvY213RUVPNGIxZXpkdXRvb0xuUFJC?=
 =?utf-8?B?Q3RzWlVkOTNwZHZjelJ0cTgraG1LTFUyM2FSQ3dRUFdJQVFXMitMdUdiVmlB?=
 =?utf-8?B?d1g0TExPM014U1RRNG1GYmhUQUFUQndtZ3dkK3I5clZaa29GKzVyYWUzd2s5?=
 =?utf-8?B?T3M0bmRTaWo2dXIzY0ZndVJlSkpzUDlIT3h5VXVwYlhSZzU1Q3lkY01jVFla?=
 =?utf-8?B?aEJoNWl4NEJMTGJ1Z0xMUzBIQWJwVVhGRVFqeUI3bnZvVThzK1pDR25qeThN?=
 =?utf-8?B?QUw2OUEzWTlFOU1VOE1ZV216b3NpOE9JMmZILzc5ZEVjQVdsUTVLZW5PUmp5?=
 =?utf-8?B?cUVpSkk0ZWFWblJTbElzQUhSelM2TUQrRlIwUVlzRUJGcC9xcUhtWWkrdHc0?=
 =?utf-8?B?MEl6dGV4UUhTeTFndzVyUzVVMmtUVnV2TTVld0I3RkFJb0tFNHRKcUxVOXcy?=
 =?utf-8?B?bXhnbW53Sm9JSDNOd3FEZz09?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 19:25:29.5258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e21ca90e-cbec-417a-fdbf-08dcdccea691
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8945
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 19:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204878

T24gMjQgU2VwIDIwMjQsIGF0IDE3OjIyLCBTaW1vbmUgV2Vpw58gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHNpbW9uZS5wLndlaXNzPXBvc3Rlby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBPbiBNb24sIDIwMjQtMDktMTYgYXQgMjE6MzAgKzAwMDAsIFNpbW9u
ZSBXZWnDnyB3cm90ZToNCj4+IE9uIFN1biwgMjAyNC0wOS0xNSBhdCAxNDozNCArMDAwMCwgQXV0
byBVcGdyYWRlIEhlbHBlciB3cm90ZToNCj4+PiBIZWxsbywNCj4+PiANCj4+PiB0aGlzIGVtYWls
IGlzIGEgbm90aWZpY2F0aW9uIGZyb20gdGhlIEF1dG8gVXBncmFkZSBIZWxwZXINCj4+PiB0aGF0
IHRoZSBhdXRvbWF0aWMgYXR0ZW1wdCB0byB1cGdyYWRlIHRoZSByZWNpcGUocykgKmdudXRscyog
dG8NCj4+PiAqMy44LjcuMSogaGFzIEZhaWxlZChkb19jb21waWxlKS4NCj4+PiANCj4+PiBEZXRh
aWxlZCBlcnJvciBpbmZvcm1hdGlvbjoNCj4+PiANCj4+PiBkb19jb21waWxlIGZhaWxlZA0KPj4g
DQo+PiBJc3N1ZSBpcyBjYXVzZWQgYnkgdGhpcw0KPj4gY29tbWl0Og0KPj4gaHR0cHM6Ly9naXRs
YWIuY29tL2dudXRscy9nbnV0bHMvLS9jb21taXQvM2U1YmUxMzE1YTE1YWM2ZTFlMzNlMDhmMjgw
MzBiDQo+PiA4MjE1YjZkMjM0DQo+PiANCj4+IFdpbGwgbG9vayBmb3IgYSBzb2x1dGlvbg0KPj4g
DQo+IEkgd2FzIGFibGUgdG8gYnVpbGQgZ251dGxzIGFnYWluIGJ5IGFkZGluZyBhIHJlY2lwZSBm
b3IgZGx3cmFwLiBCdXQgdGhhdA0KPiBpbiB0dXJuIGRlcGVuZGVkIG9uIGEgYWRkaW5nIGNsYW5n
LiBTZWUgYWxzbyBoZXJlDQo+IGh0dHBzOi8vZ2l0aHViLmNvbS91ZW5vL2Rsd3JhcC9ibG9iL21h
aW4vLmdpdGh1Yi93b3JrZmxvd3MvcnVzdC55bWwjTDMwQzE1LUwzMEM4NA0KPiANCj4gQW55IHN1
Z2dlc3Rpb25zIG9yIHVzdWFsIGFwcHJvYWNoZXMgaW4gc3VjaCBhIGNhc2U/DQoNCjxydWJzIGV5
ZXMsIG1hc3NhZ2VzIHRlbXBsZXMsIHNpZ2hzPg0KDQpXZWxsIHRoYXTigJlzIGdvaW5nIHRvIGJl
IGFubm95aW5nLiAgSSBkbyBlbmpveSB0aGF0IHRoaXMgaXNu4oCZdCBtZW50aW9uZWQgaW4gdGhl
IE5FV1MgZWl0aGVyLCBmb3Igc3VjaCBhIGRlZXAgYW5kIGludmFzaXZlIGNoYW5nZSB0byB0aGUg
YnVpbGQgYW5kIGV4ZWN1dGlvbi4NCg0KV2UgcGxhbiBvbiBpbnRlZ3JhdGluZyBjbGFuZyBpbnRv
IG1hc3RlciBiZWZvcmUgNS4yLCBidXQgZnJvbSB0aGUgb3JpZ2luYWwgY29tbWl0IGl0IGxvb2tl
ZCBhcyBpZiBkbHdyYXAgaXMgb3B0aW9uYWwgYW5kIGNhbiBiZSBkaXNhYmxlZCB3aXRoIERJU0FC
TEVfRExPUEVOIGNvbmRpdGlvbmFsLiBZb3XigJlsbCBuZWVkIHRvIHNob2Vob3JuIHRoYXQgaW4g
YnkgY29udmludmluZyBnbnV0bHMgdGhhdCBkbG9wZW4gZG9lc27igJl0IHdvcmsgd2hpY2ggbm8g
ZG91YnQgd2lsbCBjYXVzZSBvdGhlciB0aGluZ3MgdG8gYnJlYWssIHNvIHRoYXTigJlzIHByb2Jh
Ymx5IGEgdGVycmlibGUgaWRlYS4NCg0KVGhlIGRvY3VtZW50YXRpb24gb2YgbGR3cmFwIHN1Z2dl
c3RzIHRoYXQgaXQgbXVzdCBiZSBwb3NzaWJsZSB0byBvcHQtb3V0IChzZWUgZWcgWlNURFdSQVBf
RU5BQkxFX0RMT1BFTiBpbiB0aGUgcmVhZG1lKSwgc28gd2UgbWlnaHQgbmVlZCB0byBkbyBzb21l
IGNyZWF0aXZlIHBhdGNoaW5nIHRvIGdudXRscyB0byByZXZlcnQgYmFjayB0byBkeW5hbWljIGxp
bmtpbmcuDQoNClJvc3M=

