Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D65E64AB8
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 14:42:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.63])
 by mx.groups.io with SMTP id smtpd.web11.21642.1733236946054912493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 06:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BSzWEL6m;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BSzWEL6m;
 spf=pass (domain: arm.com, ip: 40.107.20.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rBzRs1xIXXCbqDy/Bm1Zca/dGix2NSAKFXm+oI0CAKA9xDKpOyvuwZ/3xeut2GUPxrbiFr/qaAoXZairuaWyCOGmr8aC49Fn9F7FwBNcuSeYq5RSLERs781LhEvMeyPts7h07nUM2nitAJeWEWGjb+wCR9T+ErZw5sLj8POPmbapcylE8uzbxStiqb7jdTW4HsyF0xwlGS4wvSwJ0+4fU6RDdAfXVh4tgC3aInyPK/SN727XCCZScsaCgL/40KY2ydXkMMns+vVXey1OStBbT1hpbH3gSso66PWc84GlSPXJ0kKnje56zN0Mt7Rq7D9s9JRXqVCNRfXEFRYyHw/Tzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3aoIzjLJ/tY4q0pM6+Z6HmYvQjP2vGOUyA4S+5IQ78=;
 b=HZ3L6pbhIb7wvenedSeRNkdrijfIOClGdi7mCZyjb2CW6KnteAqDSADpR/PrC9ow1qqyfuQdlORT1ZyanXvcBBgTHcJzeNMKTropYOQgCzgwOlUQTe8c46ALt3RoZ9YWXbA+bxc9KOtmZgcH9WlcrPsP6mz6GGLGkzpW83/lZtObTYC1/QfPhVaQLCENApc/KScSpDKUEHiSyHZJTNO2pGBTc98NqZIQ0Vl5kRe7uuwxKDYvmeXMHiwOjzKBgh5lF3M+LxabQY/ta6tV3LHXqedsziR+oOqcQ9CQQhoesN1Yl2Du9AgJoYFFsJA5zZU8PxkGBpd5nTIczK64quBs6g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3aoIzjLJ/tY4q0pM6+Z6HmYvQjP2vGOUyA4S+5IQ78=;
 b=BSzWEL6m5AiJ8rxouWWFSvPlzg97Ri1MdDQg8Dru19SPnfhRg3kAjccT+palvcQpB9fmmN2oALSyRnT1hRfkprWx6h3BXV7xq/DxsFVt7wDOI11V57pl+gmrD+sGqJIsoPjRP/F01JnOym1q6MG9zi36Msv1URjGOcB7bXd47Pk=
Received: from AS9PR06CA0130.eurprd06.prod.outlook.com (2603:10a6:20b:467::17)
 by AM9PR08MB6164.eurprd08.prod.outlook.com (2603:10a6:20b:287::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 14:42:22 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:467:cafe::b) by AS9PR06CA0130.outlook.office365.com
 (2603:10a6:20b:467::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 3 Dec 2024 14:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 14:42:21 +0000
Received: ("Tessian outbound 02553984e049:v514"); Tue, 03 Dec 2024 14:42:21 +0000
X-TessianGatewayMetadata: KEXeg7LeW1+gOhfrL8+5UXB52eDdAYapbHBxV6ToJMZap516glg7jR6v+l5P75gjdrWqj7MMIXJ0TCyogpCl8eBHSH79OMw2kvaX8HIKwF4jnNO7BdAZuZjkCZMdaFb7+3M4J4uvEKzpYVxo3kXHRg5srYEZBrwQcqh5rzBcIBY=
X-CR-MTA-TID: 64aa7808
Received: from Lacf90b600c98.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1710BC24-1D22-478F-A03E-BD6E328DEF7B.1;
	Tue, 03 Dec 2024 14:41:56 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lacf90b600c98.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 03 Dec 2024 14:41:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSoRMQ91R+yzGpxg70sDLD00FxKw9Vkvr1YMkf3zQsF43I5prUoce2P4P1K+FEbN5eKhM4nI0Ei//IOuJdl1llowGWb4U8DAjTK1UqVC1jKrwGrrpCM1oD8PtiL6fhfg8HbAoYKnA+2w2DKunsjaxTrvZeUliuwUb/wbyqbOEdqaBFmBoxDJI5FA7Zp0gtYDzxbzuYFzm9BRFzfmsz0dPgEXIj8ZfxMsGz1DUjMjCRrDbNDCaz6bavTLFoX7jH1sgqMXj6Ri3e+c/Q3oWe95oUXk2V8yE4sJKNoUuTvLF3glWgdAugMwapjcoQBpiQHL3cKN3WCYLY5ug0E+fSURow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3aoIzjLJ/tY4q0pM6+Z6HmYvQjP2vGOUyA4S+5IQ78=;
 b=so7iG/CzRUCo245iRi7l1YxKw3KV9MaMjcJj0gPmZITs0gks35+Hf0Dv7+v3h18XqGmrscnDPkNSlA/kCzp1cv1mUYnamLxg3pFGqcgsDqb6w0fTAAV21ctrytcApsxLMB/9mL0LBLxOExoEKE4VnaKrc9+GP0p3MDyBCcvr5iDYxNEV5Is8wjkQdU70ljGZ8WNtCB3Pzrn4mHtiywkhkhHbh7H+dGodQVV3ggiDv9LX8mF5OiNAJ3ud01/WnbxOB/i/hz3W/hS0FesmQLy8OcvARpX35MU94ngFsiiqP/kT4/c+xCQH3Mm9btXMG7J3HA5eLSF5lNpn+cCVyg7lng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3aoIzjLJ/tY4q0pM6+Z6HmYvQjP2vGOUyA4S+5IQ78=;
 b=BSzWEL6m5AiJ8rxouWWFSvPlzg97Ri1MdDQg8Dru19SPnfhRg3kAjccT+palvcQpB9fmmN2oALSyRnT1hRfkprWx6h3BXV7xq/DxsFVt7wDOI11V57pl+gmrD+sGqJIsoPjRP/F01JnOym1q6MG9zi36Msv1URjGOcB7bXd47Pk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8562.eurprd08.prod.outlook.com (2603:10a6:10:405::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 14:41:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 14:41:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "denis.osterland@diehl.com" <denis.osterland@diehl.com>
CC: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
Thread-Topic: [OE-core] [PATCH 2/3] spdx: add support for WITH operator
Thread-Index: AQHbQJ7lz0f5lF9A9Eu/LFhqtjuHo7LUobKA
Date: Tue, 3 Dec 2024 14:41:53 +0000
Message-ID: <CD8C6D1D-AEC7-4AB9-9748-E8DAC1854476@arm.com>
References: <9d9eb049a3bf4709bedd274ed0d97fff@diehl.com>
In-Reply-To: <9d9eb049a3bf4709bedd274ed0d97fff@diehl.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8562:EE_|AMS0EPF000001A6:EE_|AM9PR08MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c4b825-4f12-4f98-27ba-08dd13a8b1fa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?OXZZNjRSMVN5c0xVM3FKdThlSXlyY21DbVI4d0NTODk3anB0TlE3cWFDRXdq?=
 =?utf-8?B?UTBCT2dWc3NVLzZzVmsvZzZSVzkyd3BxNnZSS2pQR2VUQ05SQ2NZMzF3aDV2?=
 =?utf-8?B?TnZPNXU1U1o1c0RiVDIyWlkrM0hOcHVxNDIxcmpFQ3Q1TXFsNDRIVkZnUWpl?=
 =?utf-8?B?TTFyYXVYV3RnQ3QyS2g4dGcvVmlJYVhQMXZRUmRpZnoyT0NVNS9RZ08weTA0?=
 =?utf-8?B?NVRhL1M5bk5OUmFnNDdUOW5ycmZjRHRTVlUzM0VVYm5hbWxjK0VJbFdoNkZD?=
 =?utf-8?B?dTR5ZzdwUmlXTlMrcC94YzdEdDhLazlpeVBoSzVBNG5ob2NZZ2VnMEd2MGpz?=
 =?utf-8?B?NEQxc0dmcW9hbGc1YXBFbFZIMDZ1MXhPRm4xeCs3TXIxdnFnQzE4blRWb1RU?=
 =?utf-8?B?MzJ4L3JuNjVrNjFTMThibGhhWGlQdjlvOXVBajVuQWs2dUhaTHV0V1IzbHJY?=
 =?utf-8?B?NG8rNWJiNEozRFRwYXlWdCtMd0hXSjc3Zm1tbjdIcWczSUV2Q0xqUFlpZmdQ?=
 =?utf-8?B?NnpMZUpHMzdNVGhMMmxhN2l4Zk44cFZDL2xoOEhjNUFnQzFwME1seE5naTRS?=
 =?utf-8?B?VjRGVTd1dzRTNm5RbGJ2cERGWWMwbkZ4TXpqc1NCSFJvZ3hJZ1lmMlhsYm13?=
 =?utf-8?B?SUtHTmduM1ROL3lSNm9SbGJnS01ycDcvTnhKNnpWVTZXaVdrcE9yLzZIQkdw?=
 =?utf-8?B?OCtrdHVFTm1PeHRiTG9YZW9zajBLZnl0dVAyQk8zN012ZTFHQ3JOay9wUVY2?=
 =?utf-8?B?VEFGbnRxdDBFZ1lTYWQ1YXNxTlJhUTZkc3FMaVIzOUlEQ2dzN3FVYzVWQXRX?=
 =?utf-8?B?UnYvV0VmVk9NeUhkdkdDeCt3eUQwME5ZK3o0VkppdmpySEUzN2Y2TmVIQ1ll?=
 =?utf-8?B?Y0ZDamFPNjErUnJSNlBJVVRiNmkyZW9SdGRDVFl4QWp6VXlBZGkyT296UU1D?=
 =?utf-8?B?a2NBajQvYnQvamNUVFhYeDFmMDhrN2hwN280eGlVUDU0RmRCYUIrOXVTLzJI?=
 =?utf-8?B?ZVFDUGVyZUVvRDI0emlOT3E3NHRlMVNPYkxEanNhYTRDL2g0Q1FXVHlyeXcr?=
 =?utf-8?B?V3dDMm1kRnFhN09YaXNvaGdCY3NUa0p6K1JxZTU5ZExwemJHM0tya2Zrdm96?=
 =?utf-8?B?aFo3TlFOcyt3RlZsUVp6UWhVVHlXTmVEZ1VXNDhrYk96QXFmQnVmQlppNEtl?=
 =?utf-8?B?RjBuYzNXSTBBcXYzUFhWelJIUW5iM2gyTGhWVno4UnN5N3lqL1ljU3JvK2pp?=
 =?utf-8?B?ak44cEMwWjZSRkkxb3E5ME9TT3ovQTUxTmxDSVZnbDZ0dDRzMUZGUGx0d2w3?=
 =?utf-8?B?SnpkUWhLa0dNZG1ZM0pSbnNzbjdZVWZOKzU1dWpiZmZLVXdDdE5HbktjZTVU?=
 =?utf-8?B?VSt3cGtPRkJIcUU4L3c3bEc3Z1ZBWTc0YW5SanUyZ3ZpekFLWUpPT09iREIv?=
 =?utf-8?B?ek9GS3pNZGJ2TUlEdGdGQVVMTW1RaGh0UzFzZmYxa2FPb2Q5TTRDVk5sRXJC?=
 =?utf-8?B?Y2doQ2NLbEJvcUJFaXVacm5GRFdkalRpU1pDR1hsa0xNSGFaalBrZGtXN2s2?=
 =?utf-8?B?MEZaSVcxNHJ4YWZRZi9yVTNwcHhtQ1NmTWFUb3BTSmw0NStnNXZZRFpUYk53?=
 =?utf-8?B?MFR2M21wUVFDVGpiM1lsUjVEbFFvMDIwL0hsZ09idHYrMER4WktPRjIwNGJN?=
 =?utf-8?B?VWJhYzhmRWRSTkhxajVWZjc4cFRFa1dRdkl1aGF6L0gxemIwYW5EM3RsUWZq?=
 =?utf-8?B?OFRnSjVnK2dpS1d6RjNzNHFIakM0Y0sraTVCSHV0eE9XanQ5anVoQ1JLSjFn?=
 =?utf-8?Q?kLopx4MHGzKUdrbjirkhnLLnVoQSeA5S6Pmew=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F7016E19EEF0C4C9A539F6D2B606221@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8562
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	57e87a9b-fb91-42c3-17c4-08dd13a8a11d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MFFwdzlDUEN3NlNPcys1c2dWUkYxUGFJL2tZL1dEZjFDNnZPRXpnVWZ5MnVQ?=
 =?utf-8?B?MTRrTnRkRVJ2dVNmSG5aMDR5S0ZRNTE0MVpXNzZ5UU1QSCtWZFVOZTBEZ1FG?=
 =?utf-8?B?YkltZ0tGUldqN2ovSndRUGVLUklKbUpqcWM2VFRNOE9zUnBHQm14Y2tEcVU0?=
 =?utf-8?B?ZlFsOGV2eDR3WVZWOCtTY3k5Yk8vYVFFd2tvZWZQQm5RZjZ3MzdPS3V1ZzNt?=
 =?utf-8?B?VjNxd2dUS2V1U0lscnFKWng0VTFoZjY2RXdub2hka2lDZU5LSmFRY0NjN3Yx?=
 =?utf-8?B?QUQvVEZNNHhGMEk4ZTVUR2xmNGNaQ2VaZGtYOFhsYjcyZU5ORDNscHMwQUFO?=
 =?utf-8?B?VUQ0TjNQYXA0eVhqVDIyZjdRNlQ3emRyaHFreVpKdGhyeVhad0xnRzREREFx?=
 =?utf-8?B?L0VKWDVNbUNPSndSeDEzdUl4VW9IWEdiamgzMzhxbCtmekhBeWJ6TU93NDha?=
 =?utf-8?B?ZS8xZHlvVkNTNTBEeEJTUWhCNmZHZ3ovd1FOZ2QxZFk5dy9WWFJzbitTc0hF?=
 =?utf-8?B?UGRyV1ZPdFNxK2hpWkJpYXVSVWEzdjcrTFltZUp5RHNVWms3SGhzMnlyQURn?=
 =?utf-8?B?WnQwUXZFM3c4U05mVFRWc3FMSkxHNEhTbUQ5S3ZMNC9PdlBKNElQbG8wRjUx?=
 =?utf-8?B?RXNTOVdXM1dzRndPdVBTRVVvWFM3TTAreDlESWcwc1dxTElyMENRN0Q0bWNq?=
 =?utf-8?B?YUwyMHdwdVM3UVhNRkxxbFJQZi9aczNtL0oxNUVBNlFmYyt1c0I5SnhCQk5n?=
 =?utf-8?B?d2RieThsRS9mL0NkU0E2TXJUbjFaclppam5YeS9iRzhNNmUxNUJsWVhwWTIz?=
 =?utf-8?B?azFWcDIzNm5mUGNtSTEzTzd4dUJjWmtMQ1pYbkpRWmNSRVZwd3hXUThIamJB?=
 =?utf-8?B?QUs3VjlvYjhsdFcyNWVoZjNGdzBQT3BMdUh0ODRDOUpKNjZ1OGpmTDJscEps?=
 =?utf-8?B?dFdoQy92dGU0MXFsUnh6bkVOcFg1endVRy84QnZQWlRTTmRTNjBiYWVuNWpa?=
 =?utf-8?B?cHI1WUQxZ0l1UTcwYmJlc1pYNGh6YzRSbzl5MXcxV29WSmpBRzZ4M0dCMENP?=
 =?utf-8?B?YTU1MThXbkE0dnVRVnlJcFBURVNHUVZ3M2xMV3ZsdlIxTkZNV29LREtHdk9T?=
 =?utf-8?B?Vmd1cU1LclZzU2ptOW9lR1FydUd5eGZISVY2c1M3ZG1ybnVYWGZlNG53MHRn?=
 =?utf-8?B?ai9LOE9Pak1qcEFSckhTYXdLUTlGVnJRamxvTkRzVCszZUo0VWNIU2dhZkt4?=
 =?utf-8?B?QUI1S1pHY3JtMy9ORk1KZUs3YTRTb2VOK1ROU21mZCtVNVl1UGVpTW5kdUxv?=
 =?utf-8?B?c25ybVErZUI1eXl4MlBlN1AyNXBZc0YrS01Jalc3dlAwMHJDbkZkbGpEckNW?=
 =?utf-8?B?Q1diQlU5WE5SemV1b2daWTNMRHc0UnJ5MEx1NURib3d0Ykh5SGU4Z0d3VmhZ?=
 =?utf-8?B?WVFIN3N5ald2eDFpM2JJODE0V1UzUENrTDljMkRHNHpxVkQvdkI4UUFMTVJm?=
 =?utf-8?B?M1ErQ1F0YzZCSFN0WW1uMzUwZzFBdW1jbGRtb2I4YXNvN0JtMDhNaHhseG1P?=
 =?utf-8?B?S3d4c0thQXUyUDVKUHdaaDB6RzhBeW5PWGduZ3FIejhiNzcxVnpmREhVdEls?=
 =?utf-8?B?OTZlNXFxMDBEYTBXUFNyeGc3ekcyNDIwc2N1eUVCU2o5VDlNV3MvLzUvcENM?=
 =?utf-8?B?bWRkS3ovTlkzN3FocVVlVTJ5TGVML2VmQ1V0RTlISVZJejlEQzVHNUZ1Mi9z?=
 =?utf-8?B?SDBLZ1VwbTVhTkdhL0tLYWMwTVkzczhtNmhOTFFKMkdLZ1ZKWVppaWVESWdH?=
 =?utf-8?B?TlVENkZHM25nQ0tRT1g1dEk1bzFkSjdWR0RhVEc2OFVxdHYrQXdNU0paMFZz?=
 =?utf-8?B?Njk4TGM5TE1SMDNqN1lkZkdUUDlvVmliSWFWWGNCWkw0UlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 14:42:21.7404
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c4b825-4f12-4f98-27ba-08dd13a8b1fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6164
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 14:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208217

T24gMjcgTm92IDIwMjQsIGF0IDA3OjM0LCBEZW5pcyBPU1RFUkxBTkQtSEVJTSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8ZGVuaXMub3N0ZXJsYW5kPWRpZWhsLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gUmlnaHQuDQo+IEFwYWNoZS0yLjAtd2l0aC1MTFZNLWV4Y2Vw
dGlvbiBhbmQgR1BMLTIuMC13aXRoLU9wZW5TU0wtZXhjZXB0aW9uIGFyZSBub3QgbGlzdGVkIG9u
IHNwZHgub3JnL2xpY2Vuc2VzDQo+IGFuZCB0aGUgb3RoZXJzIGFyZSBsaXN0ZWQgd2l0aCB0aGUg
Imluc2VydCA8bGljZW5zZT4gaGVyZSIuDQo+IFRoZSBjbGVhbiB3YXkgd291bGQgYmUgdG8gaW1w
bGVtZW50IHRoZSBXSVRIIG9wZXJhdG9yLg0KPiBUbyBhdm9pZCB0aGUgZWZmb3J0IGFuZCBpbXBy
b3ZlIHRoZSBzaXR1YXRpb24sIG1heWJlIGl0IHdvdWxkIGJlIGFuIGlkZWEgdG8gY29weQ0KPiBH
UEwtMi4wLW9ubHkgdG9nZXRoZXIgd2l0aCBHUEwtMi4wLXdpdGgtR0NDLWV4Y2VwdGlvbiBpbnRv
IEdQTC0yLjAtb25seS13aXRoLUdDQy1leGNlcHRpb24uDQoNCkkgYWdyZWUgd2l0aCBQZXRlciAt
IGluIHRoZSBzaG9ydCB0ZXJtIGFkZCBhIEdQTC13aXRoLXN5c2NhbGwtZXhjZXB0aW9uIGxpY2Vu
c2UgYmVjYXVzZSB0aGUgZmFsbG91dCBmb3IganVzdCBhZGRpbmcgKyB0byB0aGUgTElDRU5TRSBw
YXJzZXIgaXMgZ3JlYXRlciB0aGFuIGp1c3QgbWFwcGluZyBpdCB0byBXSVRIIGluIHRoZSBTUERY
IGNvZGUsIHRoZXJl4oCZcyBhbGwgdGhlIGxpY2Vuc2UgaGFuZGxpbmcgbG9naWMgYW5kIG1pc3Np
bmcgdGVzdCBjYXNlcyB0aGF0IG5lZWQgdG8gZXh0ZW5kZWQgdG9vLiAgV2UgZG9u4oCZdCB3YW50
IHRvIG1lcmdlIGp1c3QgdGhlIHJlbWFwcGluZyB3aXRob3V0IHRlc3QgY2FzZXMgdG8gdmVyaWZ5
IHRoYXQgbm90aGluZyBlbHNlIGJyZWFrcywgYXQgbGVhc3QuDQoNCk9mIGNvdXJzZSBpZiB3ZSBl
eHRlbmQgdGhlIGxpY2Vuc2UgbG9naWMgZnVydGhlciB0byBzdXBwb3J0ICsgcHJvcGVybHksIGF0
IHRoYXQgcG9pbnQgd2XigJlyZSBiYXNpY2FsbHkgcmVpbXBsZW1lbnRpbmcgU1BEWCBsaWNlbnNl
IHNlbWFudGljcyBidXQgd2l0aCBhIG5ldyBzeW50YXggc28gSeKAmWQgcGVyc29uYWxseSBiZSBp
biBmYXZvdXIgb2YgbW92aW5nIG91ciBMSUNFTlNFIGZpZWxkIHRvIGp1c3QgYmVpbmcgYSBTUERY
IGxpY2Vuc2Ugc3RyaW5nIChwb3RlbnRpYWxseSB3aXRoIGJhY2t3YXJkIGNvbXBhdGlibGUgcGFy
c2luZyBmb3IgYSBjeWNsZSBvciBzbykuICBUaGlzIG1lYW5zIHdlIGNhbiByZXVzZSBleGlzdGlu
ZyBjb2RlLCBhbmQgdGhlIHNlbWFudGljcyBvZiB0aGUgZmllbGQgaXMgd2VsbCBkZWZpbmVkLg0K
DQpSb3Nz

