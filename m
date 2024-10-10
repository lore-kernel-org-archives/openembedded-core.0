Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A201AD2444E
	for <webhook@archiver.kernel.org>; Thu, 10 Oct 2024 20:17:54 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.67])
 by mx.groups.io with SMTP id smtpd.web11.54519.1728591473801243433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 13:17:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kScDWqKO;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kScDWqKO;
 spf=pass (domain: arm.com, ip: 40.107.103.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qdea6M0KOeJxtCrAifsoVvTZhtUvmp8NQxYUYnrh/+/JdgsqqfFKd85rZ6Jj2lhFDUlitgYm9yyzsgAnZUhGXo/vaOYtteEADhPcxhCaqlXXeOIxI1uEuCkUaUaq2/q20xHDgJ5mq5whQyO8e5UKXw42s81XDSsfNIS+ITzt1Y3B5zQbc/3sioYb/Brc6BElcde/7thUdU/hsxvVsB+dVcyabIzbgjbJLRbg5xbm+EBeSwDG6KHHaL20n1nAhFRp67uJ0L9VzhI+t2e3R0hsh43DJfSuDU85DT7j0smvZvimWT5aVavZswinyXvjXDRQ7ZYKAMBDtRQI9MI7XGk5+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQWVW8AbwmWJcBrf+tpho2WfdaCAJNmowNbvaz8f1HQ=;
 b=qoPIcjMPcs5Vp9Ca0YndvG9ZNbO6x7vHvCfR9No3irGJ2UF2+yjmwuwqCdBsAFeIpuwGxm/IunHvZjPQSqlefJ/TlO/EbJD0PEqlg/I2P9Rg7ycQFjeuPIBgxJUn9y+gTD1w3fTviP/D0bN4QitHwKiyp6FMzwvJhhr3gvTHiDW/ePxNNTrVf9Q4Sc8+OXkRoeXTqyKX9uJSBSju7QsRvb8+q4BOQ2ORr6x/lUUqFCLfQcn6LDYxl0uMKo7zqwsb+qsZLyS+jZbNDJkjfFZwdaKnryOKq18VvgbswYKGIiXSHsp0SXKDqP55vl3C2pW2YrkatTrf4wmL7pDt5TBNng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQWVW8AbwmWJcBrf+tpho2WfdaCAJNmowNbvaz8f1HQ=;
 b=kScDWqKOSHo0jvYIQquiE7k6P/5Zd1zyYN/3/SgOJmyzF4GyblXgHpvGq2kplmn8SSTxcjP8vKC+O4Rs64rFHmUbe0oqNCe0Du5VUPiQiOv8Fy+tDkOMfstFtdZASUD2DHSJYa4KvyVsHwNamLHvF48HlIF7ChuqOI+JkNHgRp0=
Received: from DU7P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::30)
 by AS2PR08MB8974.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 20:17:48 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::42) by DU7P194CA0007.outlook.office365.com
 (2603:10a6:10:553::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Thu, 10 Oct 2024 20:17:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Thu, 10 Oct 2024 20:17:48 +0000
Received: ("Tessian outbound 0658930cd478:v473"); Thu, 10 Oct 2024 20:17:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 00cec9c4a0433f64
X-TessianGatewayMetadata: 4MpGwnVJfAQn1ZbOHF0KBvkQBPOyP+PBgQxJuEogLH1KVKa1CtAPpONYd3Q9EImJyd43YfsqDSOVHB/rnbKBWn0d+tF0TBYehUHluruBPN6oGaYvlOVcO/gWcMmH2uiMMH2jBmCusJRdDhDbwSiqJDLcT44qbEjfNSid7YNhOnk=
X-CR-MTA-TID: 64aa7808
Received: from Lb27980498a1c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E9185370-EFA9-4648-B1FF-EA449AF70579.1;
	Thu, 10 Oct 2024 20:17:41 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb27980498a1c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Oct 2024 20:17:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLoRLRF3zR1EsMZvN+NSUkdRRMeALB5KVoHjGDSoQRQqTnEC/MAIi+wy4Ah1ogBEPih4ODQQR6q3x5+A1fudkf3DyYAVnjwiYc1HKBGyjECGm+U4cxVDt1g73TJqUifmHChNq4leEuGpGO551/uD7X6DsbSmDiVwWdroF7qL3LVW4cY48thIP0bJAEz74NiQtnTK1PZjyzsnV8Py9oE59lAQJKyl8rV7VJHS+SQaJ7BHj8Kz944wtEV7AG+MobTgLgt1owQwrMpOSGsBLWhVmTZ2CBzmDYpnjv7UM0RI4jU2fyQt7hQJzMkrlfFTyzNzD3uc1CGwYQD1CaANKNcT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQWVW8AbwmWJcBrf+tpho2WfdaCAJNmowNbvaz8f1HQ=;
 b=PY7sAVnlLpnwNGzpSRvD+PLiYZk90Cth2zKKgtmR9yrErKk4b3aX1XUXn/APHKsWFYcZaDrKTtB8SbZ8AXdW5Ek8Pe5Sjbgr8qobgBlUhafD26ZoaTJenn+PskAi6ub4Svrjl3EOYZQGwngbNh0ikCy4/Q2TpHGi0Yp6DHaT6P88gp/7jtY8HZUf1F5Vjg3t/P2eyzV7nohMwSmAb+gixaChLB59BVJzhNZP0KPRx4tTsRdDmZ7IUonzlJn1WGkqdtTxz0MVwkwKRDAKsvCyT2WheUaDub9R3xyZfp6yAJedmIGvKB+vVsNHYSiTOLFy6SJGFysX7Ip/JXbJFiIUrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQWVW8AbwmWJcBrf+tpho2WfdaCAJNmowNbvaz8f1HQ=;
 b=kScDWqKOSHo0jvYIQquiE7k6P/5Zd1zyYN/3/SgOJmyzF4GyblXgHpvGq2kplmn8SSTxcjP8vKC+O4Rs64rFHmUbe0oqNCe0Du5VUPiQiOv8Fy+tDkOMfstFtdZASUD2DHSJYa4KvyVsHwNamLHvF48HlIF7ChuqOI+JkNHgRp0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9553.eurprd08.prod.outlook.com (2603:10a6:102:314::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 20:17:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 20:17:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 4/8] oeqa selftest uki.py: add tests for
 uki.bbclass
Thread-Topic: [OE-core] [PATCH v7 4/8] oeqa selftest uki.py: add tests for
 uki.bbclass
Thread-Index: AQHbGvKG4w6784/3iUGsqOLwmg2hZbKAbPSA
Date: Thu, 10 Oct 2024 20:17:38 +0000
Message-ID: <569C7B3F-87BC-4916-BC1B-429DF573CFDD@arm.com>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
 <20241010085647.439990-5-mikko.rapeli@linaro.org>
In-Reply-To: <20241010085647.439990-5-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9553:EE_|DU6PEPF0000B61B:EE_|AS2PR08MB8974:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de35a7c-086a-42ab-92c9-08dce9689bfd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UzlVd2Q4Z1RUMkh1QlB5MUpvak9lKytGdVpGdndwMVMrSTJFdFRyYzRFemZU?=
 =?utf-8?B?eGJoODZPMXlMMVBodFpNU1kvcGRXZWx1cGl2TlU1b2Y0U2Y2SGU2dXJZU3Jp?=
 =?utf-8?B?SlB1QzJHdmlTT25SdWdzNWFad29DZ2pmZDF6QXlyeGdPNFBYcCt3M1BhNmgv?=
 =?utf-8?B?V3pkSGpGcXBvR3R5TlpLZzVTWTZRY2NDWTBPc0tBWDhMV2VwZEdtbW5EM0sr?=
 =?utf-8?B?NFlRbTJIdWUySUQzdjJsQUJhR2wrSlBqMUFkU3RWa2dMOCtpUVR5TjhPN2VI?=
 =?utf-8?B?b0N5VlFnTnY0R0UzYXp4K3VhVExOWk5DTTlmYnhXdmZvQzU3cVdVMDZVaHZN?=
 =?utf-8?B?UUppTU9PTnh5TkljbFhrdDYxTWhjODhPdUhodmlXdkZwaEZJT21uN2pLRWFW?=
 =?utf-8?B?Wi95REN3bHh1SWlyV1QvMU5VT3QwQXk3QlFtNHhpdlVOVjR1MUsyKzRwZnFu?=
 =?utf-8?B?R3F1ZExRcGxMOGRDdHNzeXRSd2t0MkpkQ2ZSOUNnaERWSDRlWkxhd21HQ1Bq?=
 =?utf-8?B?akF0R1dTSk96K2ViK3Zzc3JRQnQ5REI5R1ErSmMwYWl1QUl5b3FWVEJqNHIr?=
 =?utf-8?B?eDRmMGhaL3JEMEluOGgvY0tlb29penJmVm16SzNiRnBCY0Q3OXhCdXI1Ym4y?=
 =?utf-8?B?U3BwYVB5Mkx4WnRxNzVUeFcxWDlkc2MyN3J0dWIwOTZIQ0tDdllJWDBMd3RM?=
 =?utf-8?B?TkZwWWF5RU9BUTJtbnRUQ0hnN0tjWEZWWWFRYitSem9zdk91TE1tclcyS3cx?=
 =?utf-8?B?djZqY3FTSkJ6ODIxWHk5Zm1pVlFKTCtPTEExOXlxaWJqdzNMWTVuYXF6YUpi?=
 =?utf-8?B?OXZRNjVnMDV2eUxxdEkzS0l0WlJlbE5NSVV2Z3l6VGU5cUlKNlhBd0JFNkg5?=
 =?utf-8?B?TFEyejYyVDk5Qk1BcUx5TS9UQ1pxeFUwdjdLQmdnWVl1Z0hNUFkvWFNXUXhY?=
 =?utf-8?B?SlBMU0VweTdjVm1XcUF1MEtXTjlCWS9nbU5LdmY3S1JzZ0RKVmNOZzBZNnph?=
 =?utf-8?B?OEk0Y096VlFXYU1xL2xTaGpmY1VNYVUzcVFWMDQvUFl2TFRmM2hNV21ERW9m?=
 =?utf-8?B?OG5iUHF2MzZNczVOSmI5OUYwRFNGWWs1eGs0eU9BOUMxdEZSMkFtYUh4cTJo?=
 =?utf-8?B?TEpOcHVDdnZpUHo0d2FRdHRudEIxdU1zaEd5amdGQ3lqcWpnbk9DVTFWejNS?=
 =?utf-8?B?bmJSODllRE1ZRk9PdkNTOUo3NXhRWkhFNzkwSGkzUTZmRE5aYThEdFI0Wita?=
 =?utf-8?B?VGl0WmoxYnZYelVCeFpjUmJiS1M2ZU5wTndSY1hneWgyOHVEQU5YaW9BODZZ?=
 =?utf-8?B?YmRmcTFFZTQ1Q2ZFUFVTN2UyaDhMbHNqeWlwWVRMT0tCOFdOYUNYZTcxWXBN?=
 =?utf-8?B?OEtOUlJLTG1UZmk2bWVxVjFEWXEvS2Z1UEtpODh0R3dMdERPa0c4M3o5M1d0?=
 =?utf-8?B?c3ZvUmFEcERDYm1CTWxGajJyRFUwY2IrREFleGhWMjhza1FIQ05VRnYxbk5n?=
 =?utf-8?B?NEk0RHZqNDN3NW82OTh6Z011Y3FKZ2tRU2paSml1bmRTb0VRK0tsTmg3VmFa?=
 =?utf-8?B?TXFYU0pTZzRkek1Hd1NwaW1oMEo5cDNXdi9oeTBnV0hnSDVVU09yWncrMWVw?=
 =?utf-8?B?L3VoVElBQ1ZDZC93SU1kZ3prNVM5YjU1Y2k1N2M0anlVbXZRdGR5MndLTU5y?=
 =?utf-8?B?b2pRYXJxa3U0UENMdnpmT05iaEhUVVMvanRyeGRoMEUzdjI4TFNrVzBTNFF2?=
 =?utf-8?B?amp6NTVlRzM3RVlsZHJRVVBReDZWMkVoSWt0bk40WFIydzg4NTFTUUNmWkdX?=
 =?utf-8?B?VHJHL1VYWC93VU01YlhvQT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DDE45A14AB91454E94B33E0035131236@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9553
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1d20963b-6fe4-4d50-aee2-08dce96895f5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VU5jcnY0dXREZFR6R2FvVFhnWmxvK1c3ZFNza2oyWU5ncmV2UldEbzU3UGNk?=
 =?utf-8?B?V0tvVFlCQUZDU2ZmUnhzVnhIUSszUkF2b2tFNzgxdVBSMlI1NlgxTVFsVGpj?=
 =?utf-8?B?a1RuNDhMUXptdUNPVE9oM09yUG9qbjhwSm1FVHlUUTEvYlN1VU9ibnZtdURu?=
 =?utf-8?B?Rk11MWZyYTNPNk83Zk93YlQ1MWdPZ2tpTDVBTVNNNGk5d1Vhd0ZwZWNPZjBm?=
 =?utf-8?B?ZDlYdkVpOEt6a0FmUURaOWREVVQwNUlGUkM5STB0NzZZQ0ExY0VyZGtxZUhR?=
 =?utf-8?B?ZU1MbldrTW94ck1RQXRSZ1drUUJ2MU83UmptSjhZRnUzdWVHa1N6dUcrS0pF?=
 =?utf-8?B?UDlIbm1Ea1NNaGtyNXZxMUE5RENXWFdnVWd1TnNhWjAyT3NlUXNaSTRSRW53?=
 =?utf-8?B?VUNlbFhncWxrV1FvbksySHpvRW5UQXdoY01rLyt0Uzl4UkFjYjF0aTgxSXAy?=
 =?utf-8?B?aVhIbGhSeWJNTEVmUW5DYTkxWUNrbytWSklCTU43ajZ4UFhhMHNVcWFvWGtB?=
 =?utf-8?B?aFBwaS9SbTk0TUtvUkZQMXJoZ3FFKzd5Mk1nYVhKcmlQakVVcVpEOXl4STFv?=
 =?utf-8?B?blZxL3RvVlAzQzVUSVMwY0RrQ01RUUJxdDdYZ0tkVk9KSmdQbjVyYUhCUzhY?=
 =?utf-8?B?TkNFQmZ0UlVlVDlzU08rWDdLUStJMGVTZDU1cXlqVytSZ0FHckJlOTFPOWUw?=
 =?utf-8?B?Z05BeDVwV0VIWVJwQ3BmY3FxQUc3SlJMS0JoKzJyVUVJZk8wNkJjWHVvVHlJ?=
 =?utf-8?B?OExGR0ZSMnNWSlF5cEhDbDRUM2dmQ0hYM1hoQndWWFRXSkQ0bVVlalQybHRY?=
 =?utf-8?B?bnViaWcxVytEYlQ3MTUrdDlVS3E2QUhvTkx5TVBMK0liRWUrOGlDaUtMM0lS?=
 =?utf-8?B?VTN2czZJOXA3Rm8xcFhSY1RwcGhienJOaGhESkJNaml1SkYybWhvUFVjdzEy?=
 =?utf-8?B?L1VwZ2FIcUZSdDBqYUVEY2Y1R2JMWlM4RUhkeXBXSytvaHdERU1DSHozbVlJ?=
 =?utf-8?B?MDVPM2V0NUlXS0ZFSG9JYVpybVBzajA0c3dkdTJveTlON3ZDbXdUbDFDUXZq?=
 =?utf-8?B?MXgwMmI2eDVrN2pIa3laeHR6NVBoZHB4RVBFbnh5cm5oSjZBYnlGZzBnWFNC?=
 =?utf-8?B?eGRpSXFZc2Npcy91MUR2cWVicjlwRkRyS0YvY3UzbkdSeFRZNytiUDI3WExz?=
 =?utf-8?B?MFh3Rkp4dlNhaEUrVi9qeUVZZFpUSzhxSFJHdkFNTUoyU05wamQvVDlFUUFn?=
 =?utf-8?B?V0gxRFZWUTZMYzlZdFRkQm9SZWJvK1BPaXRoZDF1a1NDTlVuS2JCQ3lWdDVr?=
 =?utf-8?B?TzRxRDluQWVycFhSQ25MSHczZlZBVnJaV1NKWFJ1RGgrMHp4LzlmcGhjOW9u?=
 =?utf-8?B?QVVSNDFaeVN0amc1SVp0ZWxtUjAyUXRnT2VONkw1c2RpQjNBbmg0Nzduc05y?=
 =?utf-8?B?S2czUis1ZldISldoYWgySlFVeElkNU1pSEV4SjJQNE5QUnZVS29YMytwaE16?=
 =?utf-8?B?bldBQ1Qvc20wVWo1RGFwcXVtWFRNWlpWM3Q3dXVXdHY5bTh2TW5ZZFlDK3N1?=
 =?utf-8?B?NStWbjVZM2F2aUwrT1NlTGtyY1FrQWR0UkhsU3FBeGgwK3d2a29FeW9CUm5l?=
 =?utf-8?B?aVdXclAwd0xhblZveHRXZVlySjI0V2tvQ2twbmxScWlFMS8wcHZtWGpPMG5G?=
 =?utf-8?B?d1RIVHd1THpwN0N4QlUwRFYvVUFlUFNYMk1wNEhhU1ZubzZSRlQ5WEtpVnB3?=
 =?utf-8?B?N0d5b1E2bHVxRzIzRG1FT2lhTzkyVTZ6ajlIelJncXk2MUg4N1Z2SndEdFVH?=
 =?utf-8?B?WmFHNk03UmNCS0ZIeExNQVBNdFFFSkl5a0RiQ0hyaHBjUGdvNG53dGVXeEZL?=
 =?utf-8?Q?94DOYvhoplZ7z?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 20:17:48.2725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de35a7c-086a-42ab-92c9-08dce9689bfd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8974
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 20:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205644

T24gMTAgT2N0IDIwMjQsIGF0IDA5OjU2LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArIyBlZmksIHVraSBhbmQgc3lzdGVtZCBmZWF0dXJlcyBtdXN0IGJlIGVuYWJs
ZWQNCj4gK0lOSVRfTUFOQUdFUiA9ICJzeXN0ZW1kIg0KDQpZZXMNCg0KPiArTUFDSElORV9GRUFU
VVJFUzphcHBlbmQgPSAiIGVmaSINCg0KTWF5YmUgd2Ugc2hvdWxkIGFkZCB0aGlzIHRvIHRoZSBx
ZW11IG1hY2hpbmVzLCBhcyB0aGV5IGNhbiBkbyBFRkkuDQoNCj4gK0RJU1RST19GRUFUVVJFUzph
cHBlbmQgPSAiIHVraSINCg0KRmluZQ0KDQo+ICtESVNUUk9fRkVBVFVSRVM6YXBwZW5kID0gIiBz
eXN0ZW1kIg0KPiArRElTVFJPX0ZFQVRVUkVTX05BVElWRTphcHBlbmQgPSAiIHN5c3RlbWTigJ0N
Cg0KVGhlc2UgYXJlIG5vdCBuZWVkZWQgYXMgSU5JVF9NQU5BR0VSIGNhdXNlcyBtb3JlIHRoYW4g
YSB2YXJpYWJsZSBhc3NpZ25tZW50LCBpdCBtYW5pcHVsYXRlcyBESVNUUk9fRkVBVFVSRVMuDQoN
Cj4gKyAgICAgICAgICAgICMgVmVyaWZ5IGZyb20gZWZpdmFycyB0aGF0IGZpcm13YXJlIHdhczoN
Cj4gKyAgICAgICAgICAgICMgeDg2XzY0LCBxZW11eDg2XzY0ID0gZWRrMg0KPiArICAgICAgICAg
ICAgIyBhcm0sICA9IHUtYm9vdA0KPiArICAgICAgICAgICAgY21kID0gImVjaG8gJCggY2F0IC9z
eXMvZmlybXdhcmUvZWZpL2VmaXZhcnMvTG9hZGVyRmlybXdhcmVJbmZvLTRhNjdiMDgyLTBhNGMt
NDFjZi1iNmM3LTQ0MGIyOWJiOGM0ZiApIHwgZ3JlcCAnRURLIElJJyINCj4gKyAgICAgICAgICAg
IHN0YXR1cywgb3V0cHV0ID0gcWVtdS5ydW5fc2VyaWFsKGNtZCkNCj4gKyAgICAgICAgICAgIHNl
bGYuYXNzZXJ0RXF1YWwoMSwgc3RhdHVzLCAnRmFpbGVkIHRvIHJ1biBjb21tYW5kICIlcyI6ICVz
JyAlIChjbWQsIG91dHB1dCkpDQoNCkxvb2tzIGxpa2UgdGhlIGNvbW1lbnRzIGFyZSBhaGVhZCBv
ZiB0aGUgdGVzdCBoZXJlIC0gdGhpcyBpcyBhc3N1bWluZyB0aGUgTUFDSElORSBpcyBxZW11eDg2
LTY0Lg0KDQpSb3NzDQoNCg==

