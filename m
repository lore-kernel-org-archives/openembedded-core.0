Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA78CCE7CF9
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 09:21:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web10.76832.1727774494802952405
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 02:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pb/Q+rCa;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pb/Q+rCa;
 spf=pass (domain: arm.com, ip: 40.107.20.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xDByy3gvswLC9oq3chAcMh3QlPQTVCiuU+leM3BXStSGAMu/MB+RXBpiMqf4h1Hkp8bTJs5kwYXPr/WsxBHluZbiqmUFbLN3mLiaGrcG/Q+GbsuEGwOV9r+p5DlJO5cMIXxajFNOPwDJuu0TGE2bs7c2CfIwfqqe7bQLA+9JPQeWF+yu8G21rVhQeYqO5a5AjGjY3M1QAVX8d0hdLrnPCESpWlwotFwh0m+YmNvHtKCWG/Abb6SfYUxRlUb6E6I51zjcZqu6yi0dblbfydtNX4A6NRLq/yOOCC7+FLvZf1NNdFrQqM8o16ng3/tetR/yE1H+Jg3Br2h8wcWfA99G0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4JMIZR2yIGVMqgheQ2GtqsJgD8osw55fweq+huBZUA=;
 b=BymRIhcFKY8X7Rmqa05PcLpAKxKyfYwKdkCPhUB+4cP/S1RToq0Tu8KnCZqY8LiSYYXcOFHy5JlBJAWY0feetzN0z4D5r3LP2lefaUX8U0+LsebP0t+hKOaDgLpbI+gaUonmka7h0y6KmV8rMB8Y2Km7Wdj0KoPi11s1hcbzFoT8SeuEwLlBsWPNtGJsYt997qYadWXdyUjenIF6Uqui06AjAy8rSDAkVsrEry27Sroz96ev3CostXC1I19MmyiJa3egete/RcgxmPaGeY5pvGQMhN/2Rul6tC7yvQaOHrsln74Y7ymLQcIXaDDVi5dSk7NUcH/4HQkzSmUrQh/2Yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4JMIZR2yIGVMqgheQ2GtqsJgD8osw55fweq+huBZUA=;
 b=pb/Q+rCa8Rn7kRGPNRyb/QnTBK0kxAq/ECNppf8D4C81hCiZJmI6u9Wr/VomIAGNNsaUdEyRYt5RoIIH7XwyDxSDRaAV96HVwWXy/3p1HvXigVHYKsarlouOi8Za6Ggkm55CHBfMkY56+w64Iy8R5yrNW7uj1sASB5xUGDjw3H4=
Received: from DB8PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:10:be::40)
 by PAXPR08MB7335.eurprd08.prod.outlook.com (2603:10a6:102:220::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 09:21:29 +0000
Received: from DU2PEPF00028D0C.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::ab) by DB8PR03CA0027.outlook.office365.com
 (2603:10a6:10:be::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27 via Frontend
 Transport; Tue, 1 Oct 2024 09:21:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0C.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8026.11
 via Frontend Transport; Tue, 1 Oct 2024 09:21:28 +0000
Received: ("Tessian outbound 966580577d9e:v471"); Tue, 01 Oct 2024 09:21:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d86457c3aaf30b5
X-TessianGatewayMetadata: sqgqidjbVZpbyi9l7eMOzCbKo5mHlEBfg7WKjFusAJKwPgejs7BYLCUetV6kYMXZzXoLbe0tgmPmArA11RAeswcZfe0dcX59zr3HU4nFK5ce3t9pMvEqzt7+neJiNI9FbzhMjrGDz1d3aRwENdnAKeUe8qqsu1lKOxFkQ/csfXQ=
X-CR-MTA-TID: 64aa7808
Received: from L9fb803ddc68e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 890AD5D5-90AF-4A80-A7DF-D59D96FA6221.1;
	Tue, 01 Oct 2024 09:21:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L9fb803ddc68e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Oct 2024 09:21:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WB+sWaPnREYwVYKPlb9US4EqOpfKa7v32GzKXiGgvIyAnI/NDKR57MxLQ03qcSlhcllpQiZKhWTIgkxcChseHOug/rjx9jD2zVtOk7stBMP2ydrDYKB4b9GkuidGoaAMfb29Kz3yYPeTf2/yoW2Tu+wkXC1Auy5SMv+TuWyzZXAy30xTgcWC2G3jiQvo/wSniTLgc6lN7M3oDsbebuzReC7hfLKhZGqJ21TR3Vqvjmp7TWF7kpQa23QuQoQIZ7EX+wQrasGF6lU6pf+/6e5U8ayqQDgRTMfUr1wg3S2QXeZFVOGkKfLFogF4x9XSrZGEeeqHztxCfBwo4RM6L8EldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4JMIZR2yIGVMqgheQ2GtqsJgD8osw55fweq+huBZUA=;
 b=i5dVBGd9XcdCXerp+VQ2Shggi6Q4sYxEg8l8dcdnK/ajMd7RkKzg4r2YrUL6W2BMTKdXm2uHdLWSBKSuAwpft7uGK/eowWYthIk1xhqFJUS788UGY95HRnJfA9BYb5wxPU/aTbCcgPWWDXTjNsHPdtlCuogT7XKWs0XlbcTuJRhb9WuJ+Kbc65C7eKeEh+mxL9uTRPDMAKye/8/oUDQEx1baoRiMbIVn/CyfHZGixXes5A1NXysr8/VUqE7soFaBp13Z8Z+IYR6EOzldO4TvnFqqXTRawONOCXIqTS6Td7/c86bWJJSIzD7U/4X3flKttBrNGMTpouQoeD2mz2XUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4JMIZR2yIGVMqgheQ2GtqsJgD8osw55fweq+huBZUA=;
 b=pb/Q+rCa8Rn7kRGPNRyb/QnTBK0kxAq/ECNppf8D4C81hCiZJmI6u9Wr/VomIAGNNsaUdEyRYt5RoIIH7XwyDxSDRaAV96HVwWXy/3p1HvXigVHYKsarlouOi8Za6Ggkm55CHBfMkY56+w64Iy8R5yrNW7uj1sASB5xUGDjw3H4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10654.eurprd08.prod.outlook.com (2603:10a6:800:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Tue, 1 Oct
 2024 09:21:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.013; Tue, 1 Oct 2024
 09:21:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][scarthgap][PATCH v2] lib/oe/package-manager:
 return early in install_complementary with empty globs
Thread-Topic: [OE-core] [master][scarthgap][PATCH v2] lib/oe/package-manager:
 return early in install_complementary with empty globs
Thread-Index: AQHbEFRODvsZXYUGKUynjr6fmy8YErJwSVEAgAFDpQCAABjVgA==
Date: Tue, 1 Oct 2024 09:21:09 +0000
Message-ID: <B2022D2B-92A2-4F5B-87AD-8050522E768D@arm.com>
References: <20240926204001.2245184-1-claus.stovgaard@gmail.com>
 <409E410E-1DE7-4294-898A-AF1841D6C3A4@arm.com>
 <e71402304dc8ca3e5e6fca4ad0e3a554b3a58438.camel@gmail.com>
In-Reply-To: <e71402304dc8ca3e5e6fca4ad0e3a554b3a58438.camel@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10654:EE_|DU2PEPF00028D0C:EE_|PAXPR08MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: a5095c05-a362-4e83-cc02-08dce1fa6dd0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YlQ3NWtOUWdweEZJbjBzbkxLY2NkTVlyNlo0bzRjbUh3aW93ZmtJUkdBV0ZT?=
 =?utf-8?B?WlZWc2VrZXZWN212VFNXV0JXT21ON2h2Uis3NDhPRThsdEZzMGxlTjkyVmJ2?=
 =?utf-8?B?dXZvUGVvQVBrNmQ3c2R4YTFzcS9uT2Y2SU1UMzhOMDMwUTg5ZkgwWXRuenE3?=
 =?utf-8?B?QUlnb0twYW14dFpqMmg4a1lBSWhROCtRVWRFMEJFVHVyT3cvaVVnNVROTU00?=
 =?utf-8?B?a3VtTG1ia3dOZ2xOUUV4UTAvZkR1a2VBTGVsWW9ZMXFHaVV0MjY5a2QralBo?=
 =?utf-8?B?M2FiRHVGOW1TbzB2UTgvbkhBdldTWHdPMmVKY0poZm1COVpkOEZ2RUJLMVE0?=
 =?utf-8?B?V3BubmdLeW1uSXEzLyswalNpQUJFRm1mTXY0eXByaWRZSFBqcS9IM2tVLzY0?=
 =?utf-8?B?QVhDd3VVMXNjbnFpK0huVyt1L0JUQTJUK21DRGkzUmVhWE53Yk16NkhMVmwy?=
 =?utf-8?B?NGVnRThUdjZLYnNDMVoxTk9wR0tlTlpXdUFsTkZlVmE1SFlKVVFYc1pmYitC?=
 =?utf-8?B?SkU0RVFGaXp5T2ZHaTNUSWc4OXg3Uy9pT0xkNTNLMGY3U05CQzI0UW9YSDhO?=
 =?utf-8?B?VStkdERLeUNITGFNMUt2TUZGMlJXelFneElZWG0rU1lBTHhTU1J0Y0laRHll?=
 =?utf-8?B?Tmg0bjN4dDFuMEdwb2w5OUZtZVF0d0N6TW1xQXdDdURURmNMZEVLNC82NFpR?=
 =?utf-8?B?RGg2aDV6U00ySXJyWS80VVZ6S0pFdzIvYmo1clZXNFY2eU1vcDR0OFQybklJ?=
 =?utf-8?B?TkFBTVVtY2JZTG1UdmpFVzJNSTNQaGlFc0ZXODV3ejJGTzFqM2cyV1FzV0h5?=
 =?utf-8?B?RExWbGtBeDY5UVFJSGVlNkdBZzcvNWNSbmh3QWgxYkhVc214VDNUckdjSmlN?=
 =?utf-8?B?TXNPNzU0eGN5Z2dlYnp2UmhmaGplTmJ6eTkxc0Vydm5KQXVYMmJuWmhaQXFH?=
 =?utf-8?B?dFAzeXd1c3REcWJQWGdTK1Z2S1ltbEpHTU5uZC9PZW9YQzhqbTlrNGJxaDJT?=
 =?utf-8?B?Z2JJR3ZjZnRZUkFVU3Y1YjgxWTlJK1ZXK21FUitQaXQyeWx6a0FEcS93cFlZ?=
 =?utf-8?B?RzcvaWZZalhDdTNnN0ZsamhydWd1UUZSMEVMTndMWkt4a2ZWek5iVG04aWVU?=
 =?utf-8?B?SzM5SytjTnhYcTFlNU1wNGYzSFNlK0xHVkN6UWhKOVVCK0o1OHFCNExUbFcw?=
 =?utf-8?B?UmdxMlVCMko3b0M2dXBQVlUremlOOVAzLys0ajJxelQ0ZkdzQWdUdzFLTE5n?=
 =?utf-8?B?UzkrSmNoNjVUOXBFNWdKMjF1TFpmeVRlbzZWaG1tcWVYRWdLcmNmV1F6eUhX?=
 =?utf-8?B?bVZSajRtNzRXWHdFOWhxSk9Eai93QzZuRzFDS3pGaW5BamxnV2I5amx0N3NE?=
 =?utf-8?B?S2puRk5BL21nZ0hzbXllQnV1eUJlME9sV0Y2d2N1SEx2V1pMdGhuQXlFQTBR?=
 =?utf-8?B?VXhKTnBnN0w0N0hscjF3ZnRsUXFoS0x3UTJzdW1QVk5xMklZbVg0MEZJSDdM?=
 =?utf-8?B?OTFNK3M1cjF6aUVoVzgvQ1ducm83cnQzWXRnRnlZbjlKY2g0MHZqSy91Ykh3?=
 =?utf-8?B?Q0VEMlpkRlBHdkF6TS9SQkl3V0ZOVTJDRG9HendEZlBucFlJVGpVNEtCblVj?=
 =?utf-8?B?aXIxZ2RPQTg5QTcvcThzdkJkSUpoYjhyc0lVcG9LRVljY0hPVzl4QTdoWHI0?=
 =?utf-8?B?NlhNTUsxWTBaVllHNDBqdnVhakZPeTB0cHdtSXA4SWwrbkpxdERmVUh0Rzlw?=
 =?utf-8?B?YzJDOWh2SEszNjk3QlkvdXZvUXZoVGRDT1BKNVZYNjFGSGR2OVJXQ0tsS2VO?=
 =?utf-8?B?U1V5dWRTTWJjUG53R0JSUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <409B56BA6727F243BB93A9A98F8AA6E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10654
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0f1cbdf0-2c05-46f1-0065-08dce1fa62e9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUpjK3BtemtXNlRDS3hSSk91VVhpUUp6Z0hVbkdqQXNCc3pHTXZnMUh0clVN?=
 =?utf-8?B?ZTFWejRqVTVuVEl2MFRLaTRkWEJXQlJLdHpxVkg0ODhrTmhJeGVMeFh4SVhq?=
 =?utf-8?B?VTlTdGkxOFQ5RWlKTXRVWnpHV0JDS1htZS94K0EyVXFlejZLVEJSL2VDNFFF?=
 =?utf-8?B?bGJjT0hlUkhpb1dkUEUwWWdBUlpLWG11UXJOL0RTbkFlSWRhY2lMcENKYWZW?=
 =?utf-8?B?UVU1K215cUVjajEwTmxJbnZiWFF0cm5tVjVMc1E5S21ja2ZvK1p3VSttVzI4?=
 =?utf-8?B?NEpNbFZEdVVNbGJTRjVMajRJVGJoY1JLMVBQSnkyRGxmd0M1SzVpZERwV2Rs?=
 =?utf-8?B?L2wxWGtqUEF0dHAxS2pwN3BuQy95OVppN3F5Z0ExRnJ6eDBxdzlxNCsybTJr?=
 =?utf-8?B?NWhnOENkazZIMXpza1dIWWg2VTlYUkZwbnJtam1MUUE0TzFEdERtcW51d2pt?=
 =?utf-8?B?Vlh6RklRUVllZzV4em1FejUreHZJTmllVndHZHAzdHg0TktNaGNyRlYxbVhO?=
 =?utf-8?B?V3gxTFErRCtrYUFiNUlwdm9BQUF6SWFXaEYzcWRIOWxCQWxTMGs3WFhBWk15?=
 =?utf-8?B?aG4xVHBhcG5MYWNjWnNQVjFKc1NpZEV6WWVmY0h1eGNpNjhyandpaWEzM2Yr?=
 =?utf-8?B?b0Fpczhpb3AzWnBBUDhXK3c5N25SQ2VaTDV6VXQ5R0R6ckV4RkVoVFZPaVZO?=
 =?utf-8?B?MmpPQUlCVzl1UlR3ZFo4OGp5TWxQZWZqRGJ4QmlOOGNMTGtOOWhVVUtOejJQ?=
 =?utf-8?B?bloxeHNvVkNXMGZhZERWeFEzaUQxWEgzeHFIdHNUaFpKaWxidlRuTTFUY29K?=
 =?utf-8?B?MDdRMDJEeXQ1TE5ZUnAyN0FHck9VZW53MGJPMHdTRjBnRVo5TG50c0FxNUNS?=
 =?utf-8?B?L0o2WmFVaE5WTnRzMFNRdk1JZmpVempYcXBPZXRCM0hldGgxY2p4WWd5ZFI5?=
 =?utf-8?B?bU91MWdCdjNXYlVHcENKeUdIR3Bvc2xzL2VTUURnaGJOTlU4VXIrZ3J1K2tz?=
 =?utf-8?B?d0hPTis5TFBOUXo3V3pya2RmckRLck5DblFEQWhEa1Z2R3BNa2dGZnBGanRE?=
 =?utf-8?B?aW55VUJiczc4VXhyZHpndVNTd1dPS1F6d1JlUmtnZXJBWllmLzhkU0loWnNC?=
 =?utf-8?B?bTRDNG84QjU0UGROaVBtbVVYMms2ek1YUkV6MDk2U2tGc0ZobExyZlN6Qnc3?=
 =?utf-8?B?S2Vod05CQ2p1R2V1bksxZlhRRVlGenNkcVZlbHVvaWRYaUNEVVg2ay9UTHla?=
 =?utf-8?B?V1ZzektkNmlrbG83VW5mTktDZjh6Q3g0bHlOaW9NYTE0djU5b25TZlhVbGwz?=
 =?utf-8?B?NVI1RTgxTmliN2pYODBlTlU2MXhTa1VvMlNZbllicUJzTVJYTDZ5NFlqNUVR?=
 =?utf-8?B?ZnpjTzJYOG5SaTZPUlhFVGlibG0vTlpsMi9GYVh0V3pST1p2R1p1VHB3eVRr?=
 =?utf-8?B?a0VqOENvMkt1dy9PUTBEaElFTGswYkNrK2grR0dTZTMrYkJuRTR3aXNCVG85?=
 =?utf-8?B?NmhPeTZHNWdmYWtDMkw5ejZvaG5hTWJmZUwxdHp4N0ZtSlljOS9ZYUJMSG45?=
 =?utf-8?B?S2tLSzF4Yi9uTlp4cTFYTzRiL3BOVmZSaEtwS2dlbUhhOG9LaUhubE9sSTNZ?=
 =?utf-8?B?YkRpSU5UK2x1bWhvV2hOYTRINWt0UXFxak1BSkE0bnROT0h2N3h3UWhLbCtF?=
 =?utf-8?B?RWZtS0srQ0VQMFlNOUsveXNSY01HSE1LZzRnaWRxZnpJN3paRExOSUpFSStF?=
 =?utf-8?B?NlpKZ0RZWkRaVGVmaFZ0ck5Yb0taZjdIalQyT1dUTEYrRDRtRUQzTGhZV1RO?=
 =?utf-8?B?U0tZMDBYelRJTzBwTHo0UlQ4bGprQnhvK09iYjRVeWIxc1pWU3U2THp2ZFhM?=
 =?utf-8?Q?BivC8YkGSaoCb?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 09:21:28.0085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5095c05-a362-4e83-cc02-08dce1fa6dd0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0C.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:21:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205147

T24gMSBPY3QgMjAyNCwgYXQgMDg6NTIsIGNsYXVzLnN0b3ZnYWFyZEBnbWFpbC5jb20gd3JvdGU6
DQo+IA0KPiBPbiBNb24sIDIwMjQtMDktMzAgYXQgMTI6MzMgKzAwMDAsIFJvc3MgQnVydG9uIHdy
b3RlOg0KPj4gT24gMjYgU2VwIDIwMjQsIGF0IDIxOjQwLCBDbGF1cyBTdG92Z2FhcmQgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4+IDxjbGF1cy5zdG92Z2FhcmQ9Z21haWwuY29tQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IFJldHVybiBlYXJseSB3aGVuIGds
b2JzIGlzIGVpdGhlciBOb25lIG9yIGFuIGVtcHR5IHN0cmluZy4gSWYgZ2xvYnMNCj4+PiBpcw0K
Pj4+IGFuIGVtcHR5IHN0cmluZyBmcm9tIHRoZSBzZWxmLmQuZ2V0VmFyLCB3ZSBzaG91bGQgc2tp
cCB0aGUgcmVzZXQgb2YNCj4+PiBpbnN0YWxsX2NvbXBsZW1lbnRhcnksIGFzIHRoZSByZXN1bHQg
ZnJvbSBwcm9jZXNzaW5nIHdpdGggZW1wdHkNCj4+PiBnbG9iIGluDQo+Pj4gb2UtcGtnZGF0YS11
dGlsIHdpbGwgYWx3YXlzIGJlIDAgcGFja2FnZXMgdG8gaW5zdGFsbC4NCj4+IA0KPj4gVGhpcyBp
c27igJl0IHJpZ2h0OiBpZiB0aGUgZ2xvYnMgYXJlIGVtcHR5IHRoZW4gd2UgY2FuIHNraXAgdGhl
DQo+PiBwcm9jZXNzaW5nIG9mIHRoZSBnbG9icywgYnV0IHRoaXMgZnVuY3Rpb24gYWxzbyBjb250
YWlucyB0aGUgbG9jYWxlDQo+PiBhcmNoaXZlIGdlbmVyYXRpb24gd2hpY2ggaXMgdGhlbiBza2lw
cGVkLg0KPj4gDQo+IA0KPiBPaCB5ZXMgLSB5b3UgYXJlIGNvcnJlY3QuIEkgZm9jdXNlZCB0byBt
dWNoIG9uIHRoZSB0b3AgcGFydCwgYW5kIHRoZQ0KPiB3aXRoIGxvb3AsIHNvIHNvbWVob3cgaXQg
c2xpcHBlZC4gTmljZWx5IGNhdGNoLg0KPiANCj4gSSBzZWUgMyBvcHRpb25zLg0KPiANCj4gMSkg
ZHJvcCB0aGlzIHBhdGNoLCBhbmQga2VlcCBkb2luZyB0aGUgZXh0cmEgd29yay4NCj4gDQo+IDIp
IGludmVydCB0aGUgY29uZGl0aW9uIGFuZCBtb3ZlIHRoZSB3aXRoIGxvb3AgaW4gdW5kZXIgdGhp
cyBjb25kaXRpb24NCj4gDQo+IDMpIHNwbGl0IHRoZSBhcmNoaXZpbmcgb3V0IGluIHNlcGVyYXRl
IG1ldGhvZCwgYW5kIHRoZW4gY2FsbCBpdCBhZnRlcg0KPiBpbnN0YWxsX2NvbXBsZW1lbnRhcnkg
dGhlIHBsYWNlcyB3aGVyZSBpbnN0YWxsX2NvbXBsZW1lbnRhcnkgaXMgY2FsbGVkDQo+IGZyb20u
IFRoaXMgb3B0aW9uIGlzIHdoYXQgSSBiZWxpdmUgeW91IHJlZmVyaW5nIHRvIGJlbG93Lg0KPiAN
Cj4gV2hhdCBkbyB5b3UgdGhpbmsgaXMgdGhlIGJlc3Qgb3B0aW9ucz8NCg0KKDMpIGJ1dCBtb3Zp
bmcgdGhlIGxvZ2ljIHNvbWV3aGVyZSBzbyBjYWxsZXJzIGRvbuKAmXQgbmVlZCB0byBiZSB1cGRh
dGVkIHdvdWxkIGJlIGlkZWFsLCBpZiBwb3NzaWJsZS4gICgyKSBpZiBub3QuDQoNClJvc3M=

