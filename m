Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB434C5B559
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 10:44:59 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.21])
 by mx.groups.io with SMTP id smtpd.web11.30716.1749206692922394776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 03:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dR+V4iKb;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dR+V4iKb;
 spf=pass (domain: arm.com, ip: 52.101.70.21, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BV/R4kwRwjbzfpE/Kor7upNfM0EkjHAYmCDxYEv4+FDvdXlgNrax0ub79kzad5C+QyiD9zh7Tm8uQVY5rgyCSbUtBE/pZyFXpm1vcDPqEHNqY+YrFz7XgEpBG4PIrr5iTdG9zrVcPnPB1xTocHaUstU9j0K2zE2l//ugLJC+9NMqcfXb1tK1XypMmDaku6Z1iuw1/HB0kxIYcABECNXBjs/G/F9qDHXuNwYwW/kIEGrp0BwsIqSzS1PbOxhj0j3GkLimZY2Gbey/6P4yysoqwvN5LiJEgJn5BuTOHteoi48G3c62E18x6GSM9SG+ks/uEG6qgOH3+JBwr6cu2lZRfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxJ+MPcymyBHPYc2AA6NeNLDG/aR8Mw3Jq636pD+nVo=;
 b=aOQTs7W+Nd6Sbql2NM39vgb3hXtTsg4VaFLmRP29JDVNjWp/gh2v2gIP577414iay+dw/iEorhC25Nwa3qlIW7VV1o2nSmxXW5mX8rxNWa3Lq3bisY68HpebLwqeuqU++hEuVfGSJAS4tqQNzMyzKaqTKUWVKfU80zUb5fLfNGDgscvvz7KFiXSeczntid6RzvnR3sd6sanYZvmnWmp+4vjUT/8V7vu+aSVSEtFiAHkMjBA1gnI8X46iPnpnoevjZmmEXzbQ4Ci72oTXhfJKHIThyjqwBAnUitxFfMNy9YZYyJ5PTgIaff/kFIimpIMblqMDo5NQdHR/4A9zx6nI6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxJ+MPcymyBHPYc2AA6NeNLDG/aR8Mw3Jq636pD+nVo=;
 b=dR+V4iKb9rDhYFsDzQemTp1rm9D8yYdETvqJcnEpFZD5Mcf9Xy2whBUn6cG+6ccYHjz5vxlZ/GOlLQFRNu2oq8yzh+I95RpsIGrUGtZ046sdc2rvhRsOCa6nb8ASrZPwnvy2fadoqwqJfhRg0RiN86ScyJAIBfq+BxteEssRHds=
Received: from CWLP265CA0480.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::15)
 by AS8PR08MB5927.eurprd08.prod.outlook.com (2603:10a6:20b:292::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 10:44:49 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:400:18a:cafe::ef) by CWLP265CA0480.outlook.office365.com
 (2603:10a6:400:18a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 6 Jun 2025 10:44:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 10:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jweG8+8DGiodcQlbG0NIEPSb0lDeilDsumaGXVQsZsCK1/KGdITWC8XTyl4BUCb9DW3JfyZ3xaiXoTxvpMje2D4ktfDc3SJbkyoyOod+8xdvW30UdM1cme6mMJMYZZSjmmY99WKEwBgUqPX9bZL+PXxinuRDr5Y3FJmIVnBvL28xJKCmZs7hXiqG5REqZtyKCCttHo6UM1I2Ct2Bb5XHRf5fo7HoXv+fsNOehdYk7TE3gmFnxgj/mJem8umNaRT/x3YLhtyf2kPLGykXRUXQUET79s2rwRBG9w5bKRfPIOiDzU443uZRVDXzrgpDa/9D9Ogb2rZ7CIMQQMb+LLt1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxJ+MPcymyBHPYc2AA6NeNLDG/aR8Mw3Jq636pD+nVo=;
 b=ZEwTZLep/uAb9rjWSS3ZB2d7Hr/XOyjXaM6GOH43lT8Iw49YzPTRanIeZw839URPRDnQliZ+wJYp0X4SmGgqEvS7t8ijWQqciuJznZzjzgaWJxoeq47xyOHdklu0GTHxmsSYO8UAJxgrbzFGJaUHXdOLuFbb/xCIy9JavxIbzVlFGpRHYmCxycoNZ88alY4KDRZBwmTquAsFEGYVoB9H0CenVf7q49Pi8HLhGKwyMGVS2AICdflnBed2al6R38MgpZ5wju0naNJ3F3s0jF+kdvfUCubAlCETXBCVk3UQryOk3VkFAI+hmpe2opUQx3eeXLqp08fq9yfdSL7gn9WGvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxJ+MPcymyBHPYc2AA6NeNLDG/aR8Mw3Jq636pD+nVo=;
 b=dR+V4iKb9rDhYFsDzQemTp1rm9D8yYdETvqJcnEpFZD5Mcf9Xy2whBUn6cG+6ccYHjz5vxlZ/GOlLQFRNu2oq8yzh+I95RpsIGrUGtZ046sdc2rvhRsOCa6nb8ASrZPwnvy2fadoqwqJfhRg0RiN86ScyJAIBfq+BxteEssRHds=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DB4PR08MB9262.eurprd08.prod.outlook.com (2603:10a6:10:3f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Fri, 6 Jun
 2025 10:44:15 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 10:44:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liezhi.yang@windriver.com" <liezhi.yang@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] automake: 1.17 -> 1.18
Thread-Topic: [OE-core] [PATCH 1/2] automake: 1.17 -> 1.18
Thread-Index: AQHb1cZU2lMxdZtWXUmdqP5eX80s6LP19EoA
Date: Fri, 6 Jun 2025 10:44:15 +0000
Message-ID: <A67DE477-993A-48E4-9469-76D413B2BB12@arm.com>
References: <cover.1749092509.git.liezhi.yang@windriver.com>
 <186484bc29ea5b9bbefd86532a9a403050f46a50.1749092509.git.liezhi.yang@windriver.com>
In-Reply-To: 
 <186484bc29ea5b9bbefd86532a9a403050f46a50.1749092509.git.liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DB4PR08MB9262:EE_|AM2PEPF0001C716:EE_|AS8PR08MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fcd0f8e-778d-4147-4de1-08dda4e728bc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SVRKcTVzOUxndG1idk1XRXpxajNjTXJrWXE3aks4ZzV3c2h6aTZGa3QvTDVV?=
 =?utf-8?B?dzZVdThLM3BRSzhLNFN2MHorR2gyUW1yeCtPQXpYRDFpV25paW5sbDR0WGNS?=
 =?utf-8?B?WE84Slp6SXZ0aURYcDhCR1VoZE00bmN3T3ppU0JSWWRmR1p2RW1RM1lncVBm?=
 =?utf-8?B?Tk9wR25leEE5MXBPT2FQckpackoycUNWWTdyYTM5cWFzakNsWG91L3RlZkxx?=
 =?utf-8?B?Z1ZrZFRvVmI4RURNSmVOV05POTZDbnRETC9NMyt1WFNHSGs4Ym81S0dzUGlK?=
 =?utf-8?B?akFONmljSFBnQVlTSWEvQzQ5ajZWZjVmbzNmMjdBZ0VCYUthSkFuKzYvWEk1?=
 =?utf-8?B?dXNMbUFvZlZwdmh1ZldZbFAyTmZZZFhodnlZQXV3UkxPWSt3bUJyOEN3UGZG?=
 =?utf-8?B?dWE0dUxaT2VrVFZOT29iQWxUUGNjbEF4ZitZVFRBTXJvc2tqUE1ybDhqQ01y?=
 =?utf-8?B?Z1FaWVcwN2FvWWE5SE9MWThPS0trMjFRNmQrUUJGamkrMTRaVkc2eFFGTVdo?=
 =?utf-8?B?TVd0ejk2dldyWWdEdXMrVzJqOWMwYUVseXpoR3Y1YmFHN0ltdkZTTG40RlV4?=
 =?utf-8?B?bGxpVGNVdG1vYlJFWkE5N3pxNEU1Z2R4MGFib1pmUU5RZzNtOTRUdkxIWUIr?=
 =?utf-8?B?ZWVTOWxINlVoZlJYZEVMVWwxNi9ocUlIbWtkZmJvR011WFRBUTRRRVN4dGI4?=
 =?utf-8?B?MGY0b1ZyOWNCbUpSNjQzekV2dVlTZm1uZFhjY0lMY2xUbU0xYXhWVUF1YlZN?=
 =?utf-8?B?dVRIOWJ3V256MVdGbjU0b0FLdDRUamFVL3NKZENQUFh1eWtYdkR4UVdOdFVj?=
 =?utf-8?B?bkJwMDBGcU5Tb3I3TmhJZ1lqTitzeVNKUTNTL1JsaXMxeGxEUHRJVTlBNHpZ?=
 =?utf-8?B?MkcyVklwYThVK0p2cWxhTTdJcThObmFsZE0ySmR4b2pLelFnZEtlUFo3N2VQ?=
 =?utf-8?B?ME53dnNrMi84OFZucWRMaTV4WklCTi8zdHJ1MlRrSmgvYVQ2d2srZXA2TnBh?=
 =?utf-8?B?SHM1SUI2K09kTEV3MDRWU2o2a1ZOSXFXRktqNHp5OTc0ZlpMUTFQNUVabFlI?=
 =?utf-8?B?YXdTQ1dxNEc2NWE4V0V0bFpXcUhOTEtNLzkrZ2YrQnUxazAzZ0ZyTUVJMlNx?=
 =?utf-8?B?SFh1emt0U0Zyajdpc3ZUN1ZIVGxXMjQ3TUIvaHBDeVIrUGROcXZ3MHZHbU4x?=
 =?utf-8?B?amJBS3QxVno1bFR0VUNHVWpuQmRWMFJ4U2FYNVUwUXNaNjZsamxtSFAybWly?=
 =?utf-8?B?VUNweko2L2ZzckM1MGRpWjRRS01jaG80ZzhKOWNWMWtBOEJwdEEvNVBjTTh6?=
 =?utf-8?B?cDF0WFFBdnBsMEpzVDFZZFFHSDJBbXJnSisyNEFmbUViNitWdHNTLyt5SlVI?=
 =?utf-8?B?Wnpxc2grWXJvbjZTMlIrSWExeHJRSHpsY2FFcU9adGR0MlZkNGMwNU1SWElh?=
 =?utf-8?B?MkFYNWE5Vkl0R1loeXk1WmJId3dvZ1hhVG1MN3pRR3ZSblhsWFVUUjJISE80?=
 =?utf-8?B?a21GeUt2d0FacE5LWU16bnJQSlU3eURqYUh2U1I2dU8zUExPcmNjVitiYUNO?=
 =?utf-8?B?Y2RMMXFYM3BrU0dDeitUWjJ4SEx1aVlwQ003UmI3bHR6bEhFQXBGb1lvNjlo?=
 =?utf-8?B?cHE2aktxVWZaREN2TGRYRWNHSG1PVURwUnQrdEdTbUd2bUxGK3pISXlDdlM5?=
 =?utf-8?B?ZGl3MmhCSXZGeVE1RHhZa3JpZUZaRTM1cm9HSklOTWZZZnltYkI5ZVhVZ1NU?=
 =?utf-8?B?M2RjeEgrNmZhTUludGw5bVJJNmY1QiszaWl0c3RHVDNVKzV5dGF4cVVNdkhM?=
 =?utf-8?B?MzZSQTlyY1VoZXBhZ0VFWC9sdzJQWi92dGtGUmFRMUpGeGtzK0JjbE1HWGRv?=
 =?utf-8?B?VzAyUTI3b0hqd0FnSVBLR0M3MldXcFN5OUlUbWJZVEh5Y0RHWi9rZWFFK3Fy?=
 =?utf-8?B?dDZXbUpGQzAzTktSM2oyVlUxQWpNQVgrcExrRWxvRHZIOGJMd0owdEs2T0R5?=
 =?utf-8?Q?RSwJzPtp5zBotzbXCG2S42+y+eRPJw=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF653BC1C4EE6441855D8815B2E1BA97@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9262
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	932e4f34-4bd5-404d-cea1-08dda4e714d7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|1800799024|82310400026|35042699022|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nkt1YjJoSlU4YitYTHlXQnRBVFFUODY4Uml1RDJFSWtyMTlVdGJiM2hVTlJt?=
 =?utf-8?B?VmZOSnlMV2hjR0xmTEZSWjZxRmhhSytLdHNObzlrdGNFT2ZxVklVM1h6MVBC?=
 =?utf-8?B?Uk4xRGgxV29xQzFPVlJVcG5ESHhzcHIvblpUKzVBYWNLMmRHdjVIRmozVERa?=
 =?utf-8?B?MmhRME1iN0Z3ZkZXS1BZRkxieE8wRmhzcEh2R3dHQ2YwSXlZVGREZjROQVQr?=
 =?utf-8?B?MUdqYy9RTnc4Zkh2c2NYWFFGbGUxVXpXRk5iOGNKUEhOVUdzR2hiWXFLR1dv?=
 =?utf-8?B?RzBFSVp3R0FPRFJuV2RWSS9XVnk2dDZSaDhxMGZNK1hGYmkrRWY5VkpCeE9I?=
 =?utf-8?B?QzBsdkRFdDdVc2dDZGlrZExiZVhBM211YktldWFRZHJSK2xaZitzUnNJcGFV?=
 =?utf-8?B?QmhJUEJNUm9kWFdMK09nRWhyWjZPWFg5eWsrUnBOeHJUd1U4NU9pN3VvVlMr?=
 =?utf-8?B?SzhhdTJrNTNQcWMzeHBzMkJiaEhvRXdJL3NrZlZMWm41TjI4M0ppazRxdVdS?=
 =?utf-8?B?eElEWEEyN1Jhbm5SS0Z4U0ppdm9jbmNjalNhTmJuL1Z6b0haQURaaHlJcnFm?=
 =?utf-8?B?VlA5UVk5ancrYjhla1pQYlJmSzJldEZtbGQ0NGhLOG5GTkRXeWI4SGoxZE9q?=
 =?utf-8?B?QzlQeDFPaFBuZUV3NjM2NHhWN1pzVG85MzJ5Y1FHdk9hMEpQcjViUjFmbTJJ?=
 =?utf-8?B?T3BIL2lkb0JWNk03NmhlcW96RU95aWhWT1NIcW13d3M3TERKYVZsWnhCaXdn?=
 =?utf-8?B?cWJ3K3N6SXlTNW8yRUJYTytXenhPYzZ2STk1aXNrK2JVamk3djd1TzJiZFRT?=
 =?utf-8?B?OG9WY2VOU3pxOHJyRUw5ZVBpNlNBeDQyTzRzL2ZVOHFsWWhkSEFVREMrbTZm?=
 =?utf-8?B?ZndSOXpQVm9mWldMdlFQc2FPcHVqVUVNTlhpTy95cmpRUnJuZHc0TzBTWjN5?=
 =?utf-8?B?ZlhWMlk0UUIvWXVNM0xrL3RDRWZxWitycWozQ09ZK2N6WUVpT3NNK1hPUHlW?=
 =?utf-8?B?NE51WndlR1QyRWVSemFnd05XbFZucTN0ZFdoT2JvYTVXOGY2dE1mbjVRWGQ2?=
 =?utf-8?B?YUFxRU13UG9USFJhNDBGSGx1aUZBUVc0cjlzS3NPOFhSWHRwaHRsa3NJNnVP?=
 =?utf-8?B?MTJtbDBtdHNwM2VqRURhODhUbHRHTmpOZ043T2xpbDErYVovek1oWENNQnpT?=
 =?utf-8?B?N3puaWtTeVBMbzJpeU1aMDRBRnlwZk9GL3FUcThoQXAzbWw5V2R6Nk9qb09J?=
 =?utf-8?B?bFpvTEJUNFdBK3FCT1lIZXozMmF2RGgzZFFVNHB0b2ZHUi9CSzBSQnkxbkd6?=
 =?utf-8?B?SW1ySEJBUUo2VVBxRXNCU3BwM2VkdVpEOFRBQ2g3c3l5WVFQRzNLMjByV0ZN?=
 =?utf-8?B?eXBJblVuNnJReTdRRTFNTTNBVW9TNk9TLzBzNHdTSjUzeU5KUURka0dkRXBL?=
 =?utf-8?B?Y05INVpWNTNrZXZIMnp4UVErTXdlellySmlGVkc0ZzZIN2ZYbDl1N3UrZ290?=
 =?utf-8?B?a3NNSVY2OFY3SVJmT1h1WGpVbDFoakJLV2tkRDkvYk5CcjNTK0pJT1FKallC?=
 =?utf-8?B?cXBxYzhWd0xpM04weWdRYm80bDh3NmU3VUgwOW8vaVk4T3dkQm16OGwxZ2FN?=
 =?utf-8?B?TUU1WkFIMGVHQ0N2M0NxdnMrNGRYYnhIL1FTZWY5Mk5MTWhjeDYxdUdJcFVN?=
 =?utf-8?B?V1pxejJIbW5oRVdBRm1tbFZvNXF1Wmx4SWludHpjZWlhZURUWWpCZXlLMm56?=
 =?utf-8?B?Y0JXZVl6WDlodUp5S3hmL0ExdzlsK21hL0ZIUWxaSTE3amNQZFBCMEs5R3Yz?=
 =?utf-8?B?L1FmSStWbjRRTzEyRElXbjQxTk1xS2JTZ3c3N2tmVlVKUkdDWDBXN2RLNDI5?=
 =?utf-8?B?N0RISmphUHo2bW1adjk3dUIyU2hIVzJ0TmF0SzhkZVBIU0dTM2UxM0RpNFRG?=
 =?utf-8?B?ZGxta3FXVFpJa0pDTWY4QU9uYmRlQ1JremFLOXFvSEl0b3lYaUcrOHlDUXlC?=
 =?utf-8?B?dUFndCtuemZkazgzaEdYMUZKcjhvSGtQbkQ3a25UQXBFdEQyOTE0aFc2eVJt?=
 =?utf-8?Q?KWdYkm?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(82310400026)(35042699022)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:44:48.3879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fcd0f8e-778d-4147-4de1-08dda4e728bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5927
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218130

T24gNSBKdW4gMjAyNSwgYXQgMDQ6MDIsIFJvYmVydCBZYW5nIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxsaWV6aGkueWFuZz13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gRnJvbTogUm9iZXJ0IFlhbmcgPGxpZXpoaS55YW5nQHdpbmRyaXZlci5j
b20+DQo+IA0KPiAqIFJlYmFzZWQgMDAwMS1jb25maWd1cmUtZG9uLXQtcmVwb3J0LWVycm9yLXdo
ZW4tdGhlLXBhdGgtb2YtUGVybC1jLnBhdGNoDQo+ICBUaGUgcHJldmlvdXMgcGF0Y2ggYWRkZWQg
YSAnOicgYmVmb3JlIHRoZSBsaW5lIHRvIG1ha2UgaXQgbm90IHJ1biwgYnV0IG5vdw0KPiAgdGhl
cmUgYXJlIG11bHRpcGxlIGxpbmVzLCBzbyBqdXN0IHJlbW92ZSB0aGVtLg0KPiANCg0KVGhpcyBw
YXRjaCBjYW4gYmUgZHJvcHBlZC4NCg0KQWxzbyB0aGlzIGludHJvZHVjZXMgYSBjaGFuZ2Ugd2hp
Y2ggYnJlYWtzIGxpYmNoZWNrLg0KDQpJ4oCZbSBzdGlsbCBzbGlnaHRseSBkdWJpb3VzIHRoYXQg
dGhpcyB1cGdyYWRlIGlzIGJlaGF2aW5nIGNvcnJlY3RseSBvbiByZWJ1aWxkcyBvZiBleGlzdGlu
ZyBzb3VyY2UgdHJlZXMgKHNlZSBteSBsb25nIGRpc2N1c3Npb24gb24gdGhlIGF1dG9tYWtlIGxp
c3QpLCB3aGljaCBpcyB3aHkgSSBwb3N0ZWQgZWFybGllciB0aGF0IEkgaGF2ZSBwYXRjaGVzIGJ1
dCBhbSB0ZXN0aW5nIHN0aWxsLiAgQXMgdGhlIGZhaWx1cmVzIGFyZSBvbiByZWJ1aWxkcyB0aGUg
YXV0b2J1aWxkZXIgd2lsbCBuZXZlciBzZWUgdGhlbS4NCg0KUm9zcw==

