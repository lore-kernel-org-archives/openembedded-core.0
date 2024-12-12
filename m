Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2884AE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 13:45:41 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.68])
 by mx.groups.io with SMTP id smtpd.web11.19870.1734011130700056837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 05:45:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DYV7+Psr;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DYV7+Psr;
 spf=pass (domain: arm.com, ip: 40.107.249.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a5pNIDdsy3k6QgJLu+3yQgEsafpDExS7KiyygokRJrTqIU5oQ7ViW2X3hhwp8cbxVI9/mHG4IZiUNXsr4DmEVBItsbulAZK6OSg4dHnrZu1YAYI0MwE8Yzk5ubTmf+qlK4nAWdxpgYrcf9d54YD7Sr1tFuRcyO0pzgfjUgoIO9OXAfq2YdbYnaidffxbPisSR5tuXnSpbJ1yiVGLep7f+TxnpZVc2Z7AMmxq8QVHMe77QCjSA7yXcxJQdZFyQYqLwlzvY60rkVR3N/PfnG1H0F20bJ0bmxx7FVIj0eoSXFRVchRlFYs9/ez5Lz4OkTWtDpVSUV9V4cjhzr6ho02LGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDotjKoNHxMSLxAxAXAS0DaiSzPBgN5LYEnpjy5lv3k=;
 b=WLPN315p/vZY8D3iQMq9VF31PeKrNeqBgTgMDBEjxqyDtNkLM5gZd8Hx1T/WLaSZnEG+KaCR47Jk4WxmlyziLr7u0f0kfrTBRK43mNW2/7EoQCQTnj0x9KFgSXBqJsFK58FXTH72sQt565VZGresaj40f/76wek5rv7v9kFR5TfRNq0sY7lz1ajn4dBoCWXHzG//LoEc48FzoOykXgCJnWKx50DvhvzAYijFijspGZZbwdMzTUL544kUlRr0pw6Ok95/yJkQKwAk9WYvnzMS0ZNpE9HzyufO+rSub2VWCTHDn79Key97A9mnAJzgf0ZU7a0SA4mfuvowOm7B8f9aAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDotjKoNHxMSLxAxAXAS0DaiSzPBgN5LYEnpjy5lv3k=;
 b=DYV7+Psrt2WPVE61QxTuGTiHcow7ySDI6IeDdz9NIRHDjjgu7EUpLa/ItTJFTUkqPTF+r85gmbVSNScEPPncr2+Mykoe/z+VqSa0Y4lAtCKprYOELT+mjl9UJn/JYCgk0MXu7K2DlX31uMoLERXe984E8E65VhTRy8Gjr+OMNNc=
Received: from DU2PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:3b::20)
 by AS2PR08MB8949.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 13:45:24 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::60) by DU2PR04CA0015.outlook.office365.com
 (2603:10a6:10:3b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Thu,
 12 Dec 2024 13:45:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 12 Dec 2024 13:45:23 +0000
Received: ("Tessian outbound 2d228e31de9a:v524"); Thu, 12 Dec 2024 13:45:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 28c1fa363cba4600
X-TessianGatewayMetadata: Cj+hCqliJ47xktq+DV6ei0Wq6cIezJaLaYpYv+Fg/ll5MJGTviue42nUglDKBvvu5doxMccdI31Rf5ze2JRK8WhrKEWehXnk+Aq9hDJiR6bUt3g0xCwSSEXUojcs7SXSw87K3ZpMOLUy0dzHmJrQa0g68ZW5KGo0LlCPqkv3NuY=
X-CR-MTA-TID: 64aa7808
Received: from L705898d22646.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1FCAFCBF-D57F-4F15-94B8-B8A7241C6FE7.1;
	Thu, 12 Dec 2024 13:45:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L705898d22646.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 12 Dec 2024 13:45:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIQ/DSl+G3mFqSIjVKDQi1358mX7TCY9gvveMsurC19DD4YnbKimC4z4gSfVXwhQvI0tnG9OBI9umtEdFwHydznlX1wC2AxCdfgBXJr6deipPNu/uiz0enVy5gabs/smzJWH610nxPYYdh6Px7mHBrnuyd2vmiZktYxX6M+K0rAp1XBVKTusf/paVvIqKcZsgQeGuYMSnEMmrH61rfWzx48BFfZiWykV6zJ1JZsNi9BjdfWzO6u8rDZlpu3S17TcyTFz3hG+VdnEpiCFeqOFia1FHXMMR7vxzHefFXpXuAxM0Pa90d7w4ka72zmxASaMg7WA9+uQZMXMnKKUB9eoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDotjKoNHxMSLxAxAXAS0DaiSzPBgN5LYEnpjy5lv3k=;
 b=ERD5L1mq5VgtkxmPMW1J7twYktHmqVyF6EbGMsCSrte1QMx2UzVecY6lJkJtXIGD0/dfCOsYZRbq4dUWFUxtC+cCwHjuGTMAiOd9Z/4kT7Z3k2rqK4d74si/UKvUP7zP76LniyYRbb2fstGORjGNGi/j0N/l4peejKSo+S3aEAJtZaPRD4rbzGWS3oFPHBwScH7GLORC0tLKQtYKGV8nuRKXdEUy/CXvKQt/+xTOI9ugXcOjVKfBU086dIyOrQKs5O5Aw/5VjjDFz/rMLSO8k/1tzLyz4ggeVxyi3OutPUBRQlcWogrVDtUxafdpgh+pVV8R/6eMaorRRIGdUZQ91w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iDotjKoNHxMSLxAxAXAS0DaiSzPBgN5LYEnpjy5lv3k=;
 b=DYV7+Psrt2WPVE61QxTuGTiHcow7ySDI6IeDdz9NIRHDjjgu7EUpLa/ItTJFTUkqPTF+r85gmbVSNScEPPncr2+Mykoe/z+VqSa0Y4lAtCKprYOELT+mjl9UJn/JYCgk0MXu7K2DlX31uMoLERXe984E8E65VhTRy8Gjr+OMNNc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9464.eurprd08.prod.outlook.com (2603:10a6:10:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 13:45:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 13:45:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] librsvg: update 2.58.2 -> 2.59.2
Thread-Topic: [OE-core] [PATCH] librsvg: update 2.58.2 -> 2.59.2
Thread-Index: AQHbRkVSWvj9rzXh5UGVelEUbGSvN7Liq40A
Date: Thu, 12 Dec 2024 13:45:14 +0000
Message-ID: <509DAE26-9961-4082-96EB-E6F2F8411D2F@arm.com>
References: <20241204120838.141829-1-alex.kanavin@gmail.com>
In-Reply-To: <20241204120838.141829-1-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9464:EE_|DB1PEPF000509E5:EE_|AS2PR08MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: c202a255-e151-4eb9-b3ef-08dd1ab33a86
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YTV2YWdZVm1yVmE4TXVZQUhPY2lvRTVlYVZKb0Q1K2ZWVjh3UVJTbXk5M2ox?=
 =?utf-8?B?MVhuNzRpSXk0dzFKdFR1K29DUTdpSTV3cEJxMjhlbnFUbFFjTi9CUFZsUlZY?=
 =?utf-8?B?dEhOd3FzTnFtZ2hMTHcxclo0cURqMG5TaTdmTVk3b3g1eVl6WW42RGovS3ZO?=
 =?utf-8?B?aDJWZWxxVDMwUFUvYXZEMlZsOHhNRWVjM3dTdTVxbytSUVZJZHlkY2trWXpZ?=
 =?utf-8?B?NTJyT3ZCQ1dTVzJ1dTREZTNyanFkenR0MEdjOUlqcXk3Wm95WkpabnBYcE5p?=
 =?utf-8?B?MDM4MVVvMU5OT1hsQXpuTkJQOEd0YVhOZ01CZkdGSnhrV1c2aXFwaVRTZy9w?=
 =?utf-8?B?YlBjaERwekl0VmRtZDBJSTBSVEQxM0NtS3VFdG1VQXdYVExqVmdka2V3K2Q2?=
 =?utf-8?B?UnR0K29scElNWGZGV3dHUnNsdW96TEZNMkRZYnpkbkdFTUtnVmNpSjV4UlQv?=
 =?utf-8?B?ckJJK1R4ZWJGcDJQVTIwRmNOeVlIbnk3cUE2QVQzVlVHN1FuUTk3UkpvOHpR?=
 =?utf-8?B?SU4zR0V1enJnS0luRVVtM3lKTzQvc0s4WDJxL01hWmdsNnNVeFYzSWpvaEI1?=
 =?utf-8?B?NkcvZmVPMDhMdXMvdU5rWWptNk1RcndXVzhxNkYyOVA1dWc2YVdISmROcDdM?=
 =?utf-8?B?QlNVdTRTenkyMWdYUVQxKy81VmJteXhQTVJZM1VKQVQ3V2ppZ251dFhBMitm?=
 =?utf-8?B?SUp6REtxMW9xV01MaVFnREJYMnk5ZXFQaEZIekJ6cE55NGt6ZHd2QWpIUlZt?=
 =?utf-8?B?dVBvdHc5NUxyY2ZEVUtLM3drV2p3UjRnUHRaV2E1NzVsRDZIWTVSbmRjTU5R?=
 =?utf-8?B?aDBIS3YycHE2WWpDYjNXRDk4VjZRWmNZbHVPRFNkR29ScXprcXBlK0laQTN4?=
 =?utf-8?B?RXZVS2sxZHJGMG9MdTdpMGdUY2lKWWU2UnRMTjBrc1VNLzVYZkpITW9XVjhx?=
 =?utf-8?B?WCtiWXpyWHQ0U1VNV1BBYU8zczNEeUVscGtNVmUvRHQyVmpIMGpwendkVklT?=
 =?utf-8?B?SHMyZlE1bHlISlJjb09JYlRwNWpQZjEwOSs5dzdqRExHdnp5dkFoSzUrVmh3?=
 =?utf-8?B?enRGRkNONnhpOE9QZEh4UVorMnpJUG1BTzcrMkF4Ly9UcjRvenBkSDYxU0U2?=
 =?utf-8?B?QTAzWEZxUWpxRGFrQnRiOWMxMldVeHRFYmdmOVVYdFNOdWo3UTUza2o2cDho?=
 =?utf-8?B?aDhkUmdvUU0xU2xyeHFiWnIvRk4xemx5Vkh0cURoLzdjeko3TUVFUlFNb3k0?=
 =?utf-8?B?WkI5UUdyclhFcTVjdmRtQUx4Z1Q2NFl2cS9VaHlmOGRtVlhzMmpCY2ZoNFV5?=
 =?utf-8?B?b1pya1hYV09IWkNhcnhoYW8zY09LN01nRjRkMFJFTU1aTjdtdGN1MkFwUzJy?=
 =?utf-8?B?em9reHNDOS9Pa0tBRTNtOUZnNWZoMkVIcVdYUlZyZEk4Q2hJbnJNQ0VncnVN?=
 =?utf-8?B?T3Ezdzc1ZmwwanFiaFFlSHJiUEtLODhQRWtQb3oyVGl1NVlxY0hqSnlXQjEr?=
 =?utf-8?B?aG1qSEpVNzlPNXRGOE5INjJnT2h6Y3R4WVdBVm00Sm9FbGRncEtneXdPUUEx?=
 =?utf-8?B?THJCUE4yRnZ0Qit1ZXgySU5YN0YrWEUvaWFQZXV0RGxqeUY3YWdqVWVnVmVC?=
 =?utf-8?B?LzR3NW5sYW9nTXRMdE9ERHNFNFF2SjNaV3JFcEJvc01vQmtsNUdKUm5iV3pu?=
 =?utf-8?B?cFVic01SUm9DOHE1eWxtb0VFTWhOVmsyNnpTUnVod3NRNkphclVWUXlhclpF?=
 =?utf-8?B?OUlYbU9TMVdnc1ZteTNIamJLOUFORWNUbWVxbmxJcFBKOCtWd1N0d2dsdkE3?=
 =?utf-8?B?Z0dKREZWMVQxdmVTY2wxMmJKZ2RxY1dwbVMwWmo1SzN2a1JVYjc2RjZXdmNx?=
 =?utf-8?B?dHZIbHBEVmVvOHhuT2E0N1ZDOUcrVC9rUVF0OTlLVUZJNlE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <60348E52AD17524B84D091519DDF09AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9464
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	94b0efd0-838a-4a29-29e5-08dd1ab3352d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlJ3U2pRUkdEVm1Ldld4RXNGMm1VVS9GM24zUzVIUjI1aURSandaQjNQaVU3?=
 =?utf-8?B?YUk3K3ZWMWRXNlE3M0c4Z0Rid0djL3RuUXY5akVQMC8zYmFCTGZnYzhEcGU5?=
 =?utf-8?B?YTJoMklKeWlrY0l2UTJDNzF6RTAyNEVpbFppZFNudGNVUllyb25sTkcvSjZ5?=
 =?utf-8?B?eXN0TzIwMnNlbGROd1JCbkptbDJoSk9HTnpLdGV4Z0JrekdOdERMdFJDY1JB?=
 =?utf-8?B?amFld1pYNGZGVVQrbEsrN1p4bkJmalg5a2d3TzNhY1pSVklXSEZNS2N2TTFo?=
 =?utf-8?B?UVF0MFR6Qk1RRUMvczFoMk5NZzlpRWoydERLVUhsb1dJT29jdVNoYllXMmRY?=
 =?utf-8?B?UzdUb3hzNUxPR2UzU1Q2RXFBQVBJeDQvancxZ2cydUlEdzhPMDNFVDIyTGpk?=
 =?utf-8?B?bUw1WnB2OEtManVsRVhxVXhKeEEvQjY3eSs5OHhKZmpKdTNFRldyTllUWE5w?=
 =?utf-8?B?MGU5QktHYUNvdE44VE1YTWpOVm5odnNYVnp0dm9qK21ic0pDcmtnOEpRcUh4?=
 =?utf-8?B?YUJWV1FrR3NJWDdBK0RkdmVhZlpMcDF0cWlpblVnU0pIMXJoWEFwR2doTThi?=
 =?utf-8?B?UHdNc1NmdFFlV2k5c0FJcGgzUldhc3JtQmthalE0Znc4S0RpZ1llY0t4OTN6?=
 =?utf-8?B?Wmw3WTM2K1pDNExpc0doMWl0bnpxSThFbjJkOHBWbVNyNXQrMGl0RzJHbGxj?=
 =?utf-8?B?RjQ1cEFrLy9Ed3FSMmlya2NxRHBKblVPZ2g1RWVPczdwYzlrbDBCSmpLaGk3?=
 =?utf-8?B?UnYwL0k0VS9oejFxZy9KbmVQSEtpdUc4eGNkOE5oVGJzSUtiRlljeEJEZ09B?=
 =?utf-8?B?dTJXTlpuenNWMzluOW44OGU2R1RTS3Z4WGtzUWNZeVBnSjFHaGlscDd1cjZ4?=
 =?utf-8?B?QzIwZVVKNzMydFNVL0xTbmF1UEhkZEptVVd3YzRwNXZzL1U2RlJQcjhHVlN3?=
 =?utf-8?B?a2JDbitERlZvdTkwLzFIMTJGbVZ0Nlp4MlRqS3NMeW5iejV6aDBhcUZOU0pv?=
 =?utf-8?B?cGN3UlowYTFrcWNPSTRoQ3hjdHB0TWlUSTR6U0tYMkZRZlhDWHhON0tNdFZP?=
 =?utf-8?B?WkhZWTUzeHhxQSsyam1NMTVkTVljRUVkdzM0QVowcDJudWZuWVppV0U0eXhF?=
 =?utf-8?B?Z1NEYWNMenhSVUN3L1ZIQnRXYTZxSEJrbmhGc2xlR0hINm5nTlJlUkg2OGpL?=
 =?utf-8?B?Zk5vcXQ3OXNjeU0xMFlvbkpHam9MTGJ4MFh4MWt5NUMySWI0UWZvL1l2dEZN?=
 =?utf-8?B?cGNlV0h0MGh2NHBLOGpFSUU0TFVTaXNGWEsxT0ZtTzBNMGZGRUFPbSs4VS9h?=
 =?utf-8?B?Mk9GeFQrRi93STlIdmxURU9WZVNwNFlqNlF0aDA3TjNQR3k3VVdTU0ZmeVNw?=
 =?utf-8?B?TzBTV3RxcUdGZk1IV0YzV3NacFYyYTRwekVXcHpiQnE0YmpmaDhFWVBmK25V?=
 =?utf-8?B?ME5CZUtZTEgyaFBaOXZJTlgrcENGRDZ0UkorT3hKKzN3eEtabms1ZkhxUWty?=
 =?utf-8?B?UUNTOUVTOU1BQmkveGVCWW11QXZnQnhpb21RZFhrOEpoa3hSUUg0V0NzQ1Rj?=
 =?utf-8?B?c2EzSGNOSCtaK2IyUTQwbURuQk8yUHoxUVcvdEQ2VVdHRUNaamhBUE42dHBS?=
 =?utf-8?B?a09tN2R3NUpYeEFNa1ZSM2wxYWM0REFYdUowR0ZtcjI2U2tNRlJaMXdLMnN0?=
 =?utf-8?B?ellZYmtLVURwK09XY1cyUFF2ZStuYkpYN1ZYMHR1bWtuR1I0ZkhtaFlnSzQx?=
 =?utf-8?B?c1ZiR0lnaWFRdGxqTFJtQVFDUHQzN2tEU3E3ZVd3dUE4eklWVWFYeERJMVdk?=
 =?utf-8?B?aTdxc1o0eUNFVll6d2R3ZG5vWlFXVG4zU3R4ck44a3MzaGpXNnFRT2tsVWd5?=
 =?utf-8?B?eWY2dk5ORnJwRGhVdnhEQjYzWTZzekllWlBJdTAxUU1iY1RSbHFkSFZEVmNG?=
 =?utf-8?B?QXFFT0k0UHVNVW54em53TDlqOXVtQWZ0QVNhWWppeHFHcVlDMllZOXdFS2NE?=
 =?utf-8?B?KzRLVnlEU2FRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 13:45:23.9540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c202a255-e151-4eb9-b3ef-08dd1ab33a86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 13:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208632

T24gNCBEZWMgMjAyNCwgYXQgMTI6MDgsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArZXhwb3J0IEVYVFJBX05BVElWRV9QS0dDT05GSUdfUEFUSCA9ICIke0J9
L21lc29uLXVuaW5zdGFsbGVkOiINCj4gK0xERkxBR1MgKz0gIiAtTCR7Qn0vcnN2ZyINCj4gKyMg
bmVlZGVkIG9uIHVidW50dSAyMC4wNC9kZWJpYW4gMTEgdG8gYXZvaWQgJ3VuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGRsc3ltJycgZXJyb3JzDQo+ICtCVUlMRF9MREZMQUdTICs9ICIgLWxkbCINCg0K
VGhhdOKAmXMgYSBiaWcgcGlsZSBvZiB5dWNrLCBzb21lIG9mIHdoaWNoIGZlZWxzIGxpa2Ug4oCc
aG93IGRvZXMgdGhpcyB3b3JrIHVwc3RyZWFtP+KAnSBsZXZlbHMgb2YgYnJlYWthZ2UuICBBcmUg
d2UgZXhwb3NpbmcgZmxhd3MgaW4gdGhlIGxpYnJzdmcgYnVpbGQsIG9yIG91ciBtZXNvbiBpbnRl
Z3JhdGlvbiwgb3Igc29tZXRoaW5nIGVsc2U/DQoNCj4gK1NZU1JPT1RfUFJFUFJPQ0VTU19GVU5D
UzphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBwa2djb25maWdfc3lzcm9vdF9wcmVwcm9jZXNzIg0K
PiArDQo+ICsjIGluc3RhbGxlZCAucGMgZmlsZSBjb250YWlucw0KPiArIyBwcmVmaXg9JHtwY2Zp
bGVkaXJ9Ly4uLy4uDQo+ICsjIHdoaWNoIGlzIGV4cGFuZGVkIHRvIGFuIGFic29sdXRlIHBhdGgs
IGFuZCB0aHVzIGRvZXNuJ3Qgd29yayB3aGVuIGFkZGl0aW9uYWxseSBwcmVmaXhlZCB3aXRoIGEg
c3lzcm9vdCBkaXJlY3RvcnkNCj4gK3BrZ2NvbmZpZ19zeXNyb290X3ByZXByb2Nlc3MoKSB7DQo+
ICsgICAgICAgIHNlZCAtaSAtZSAiczpecHJlZml4PS4qOnByZWZpeD0ke3ByZWZpeH06ZyIgJHtT
WVNST09UX0RFU1RESVJ9JHtsaWJkaXJ9L3BrZ2NvbmZpZy9saWJyc3ZnLTIuMC5wYw0KPiArfQ0K
DQpTdXJlbHkgYSBiZXR0ZXIgZml4IGlzIHRvIHVwc3RyZWFtIGEgY2hhbmdlIHRvIHNldCB0aGUg
cHJlZml4IHRvIHRoZSBwcmVmaXg/DQoNClJvc3M=

