Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B233FCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 16:00:14 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.3])
 by mx.groups.io with SMTP id smtpd.web10.18490.1758211211450294893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 09:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cZ/UIa2N;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cZ/UIa2N;
 spf=pass (domain: arm.com, ip: 52.101.69.3, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gx+rCuvDeFi8C/aB3G6QrLb91Db9anmskOo9ALGIU/N1vqNRt6reT55nU8tFzLVCruQxefdRLN7pdNXmbrnsLHUuw6I++OP4UOOxFiQbFUSj/zM8Jri3M2++xZrWP5PiQIOR0gwxayICgFMDjdHpex5xTINjKZ6yQUYfROj9AI5s287aA9krIeZtBzQRG6ijFxnyN548WOV07XiYQM7MuZXsboaBXTIGkilly/pVu+lWK509rT0dC0pKf2jz5fC6bt691NKEu/iNl+dMA4kz2Y7iDbKGb3dN++HGcaHoDPbU3E8SIT81h68Y8Vw4LL28QxlV2H+audk9vQAB54wJDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIumLO8EEasBPO1zGoLBBdyNssOfdOB5QWpAqwlM3Jo=;
 b=pMHFH2gvbPErqypUEc7oqEzFs4LBLUq8QlBxhDqyK5RrqDV6UR8iAiQshpXn06v8SbF/tq4OLRmh/ZCi2bHNU4DAB53vdQ/eA6+zWcRqsaIpZpbn0G5sjtjIsl09T1LcgMjCTEbkhThn1ZvqDfivl7LU5gUvk0X+E/dKg1J2PHMMLUj+NuOIuIeBbFrazVP8d3491aSx/FxsbKwli3NNDuq+tK0DMhbRXaxZgVTM1McUQD6uAnmanrd6ww2LHQlgocv/LXkQmg3GE7yuL1NloYPVDfCcZIQZpp3c4Ck7tpFfnchW//2n17ysgEL/z6NVlwLNqls/HKEEzxQKy2lO4w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIumLO8EEasBPO1zGoLBBdyNssOfdOB5QWpAqwlM3Jo=;
 b=cZ/UIa2NlmG4/P9S3Cd1THxlUeOmRb/In1XwRb+7cwTX0p/00tf50M1UTfgagjXhCsbIHyxJJGPLkGznwK+/kudjvBtpH/jfNJ89w7QhQQ19YxY2+lOAW4zi2mNH7/zaD0kcKWk4sp3sHs1krBKIv38y9AvOw0SoCYAdxGRknsk=
Received: from DU2PR04CA0213.eurprd04.prod.outlook.com (2603:10a6:10:2b1::8)
 by AS2PR08MB10226.eurprd08.prod.outlook.com (2603:10a6:20b:62f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 16:00:07 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::3f) by DU2PR04CA0213.outlook.office365.com
 (2603:10a6:10:2b1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 16:00:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12 via
 Frontend Transport; Thu, 18 Sep 2025 16:00:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFb1gJwzdZqg4LWp3NQpGwtm0dJN2xjoM9F25Y1MZ4apokTzMF0MEicgjbHb/gqjqsavfqxZl3uDvAdInVAFXXCn+iMYxpYalUTgxhBkaCYLwrR0UuW2WnPAxbXeEwxFPj8wOAerQ1gM2gTi3t7sw0VD8mlWpnKV4NrdW1CfjncOYvU94j9GIgv+xfdOTKQN9FMN6O9LtKGaLpcZtWX4KLfjcRFAWzQUBhqtiiK1kjxMw9L0WLWuqidHycsjGINN/vMPflkbZiTH5nifGpM4C94ciKlEXZAv9PWlIhRMU+wLcYTQ7rbfE+jgfZE6/7Tal4OJppnhh8E0vUq+0p6tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIumLO8EEasBPO1zGoLBBdyNssOfdOB5QWpAqwlM3Jo=;
 b=WVkr3/ojTNqDdXD+JcnWMQ+V4X3hMcfSKCkXO0C8kDrtSjkrIDWZgQ+x4K8+boo8zCf/+xjeHBF2yZsk+ZAGoEbts74B9cDJB6OU9Qu9AXP0VHJAPtH62PGH9Pqp9jyl/xeeOw6WcS4plmZ98kPQS027ZbPbi62uOExDzL8IT2a6l55qt51J6CUnLovHgWl0Tf/hfCJAMKS2Mg6VOeh0b8kqiXzut5LVd8weIuaTOmWR25jBgJLn0nO6mpKrLtr2/xwccI1anBlApeXLc2Vpy2hYcrzyst8Nzcd8jHguzY43m0S7n8Rw+RQNmQqvDRjFviVvv6NjszI5zNj4GElSGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIumLO8EEasBPO1zGoLBBdyNssOfdOB5QWpAqwlM3Jo=;
 b=cZ/UIa2NlmG4/P9S3Cd1THxlUeOmRb/In1XwRb+7cwTX0p/00tf50M1UTfgagjXhCsbIHyxJJGPLkGznwK+/kudjvBtpH/jfNJ89w7QhQQ19YxY2+lOAW4zi2mNH7/zaD0kcKWk4sp3sHs1krBKIv38y9AvOw0SoCYAdxGRknsk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8073.eurprd08.prod.outlook.com (2603:10a6:150:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 15:59:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 15:59:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Harish.Sadineni@windriver.com" <Harish.Sadineni@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, "MacLeod, Randy"
	<randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH v2 2/5] toolchain-scripts.bbclass: Support
 target-specific environment setup scripts
Thread-Topic: [OE-core] [PATCH v2 2/5] toolchain-scripts.bbclass: Support
 target-specific environment setup scripts
Thread-Index: AQHcJiuHmh/waKAzQUyO81AGk+Qf7rSZHg+A
Date: Thu, 18 Sep 2025 15:59:34 +0000
Message-ID: <515EC6BC-D6C8-4B16-B99B-A3DF3FAB66A3@arm.com>
References: <20250915102750.3298492-1-Harish.Sadineni@windriver.com>
 <20250915102750.3298492-2-Harish.Sadineni@windriver.com>
In-Reply-To: <20250915102750.3298492-2-Harish.Sadineni@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8073:EE_|DU6PEPF00009524:EE_|AS2PR08MB10226:EE_
X-MS-Office365-Filtering-Correlation-Id: 8de3ac23-78f7-4eab-2606-08ddf6cc6ffd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NTlsUjJmNkUwSndwRFRBakJ1Ny93TkdzVm9KN0kzVVdSaWlKMk9VaGRGZi9F?=
 =?utf-8?B?MHQ3aUZ6VWlsb01mZWRPWWJhTkQ0aGpjdStaRUVQVGtid0g0SkRkS1pablZK?=
 =?utf-8?B?MWhqVnJlV2xIYk1GR1lGY0RYN0d6VnQvNEtMenM5SlZZTVBWUVNYSERWb05o?=
 =?utf-8?B?Sk1FMGVWQVM1b2FGQWNOcFJ6MVlJb2hsZURiSS9XMUdxY1RFVCtodW1yalkx?=
 =?utf-8?B?d3B2WjFJUUFXL2U4cFF1UWRvRkZSWllJTmYrcDFVQmlLMmRmeUVTOWJGQ2s0?=
 =?utf-8?B?bjBabEpRTHlldERFbGFlWUF0TTVOUmYwaW5rYTMxL1krQTJwaTBWbjZaTHZw?=
 =?utf-8?B?b3dyTEJLNGFDcUd1bnMxOFI3S3B4cXhFNzh5WmJXVy83U3c4d3pTcFBDaU9r?=
 =?utf-8?B?di90THB4RE90eXJMM09FZzZjd3FKSEg3Mk1lcDZjeHNaTDA4ZHh1YUZkT3h3?=
 =?utf-8?B?UXhJUGVFZVpHME1xS1hua3hXOWZ4UlRTS0V4ZjBVc241MHIyWE9UVDA0YjVs?=
 =?utf-8?B?M2lzNzV5bFpWWVlBVFllbXMzeVgrU2ZxUklXMThpalhSSmtxRjdaM1JRQllI?=
 =?utf-8?B?WHhSZ1I0eWpzdUtNeVpvN21rQk1OMHJ1U0l3UXVQMHg3R25OSU9uTGJWQjRG?=
 =?utf-8?B?U0syOGJ5Qnp5SkE1YWFmRmdDeXJmYzVyeU9TcTZYSjV4eEtqekhtbUhpRGEz?=
 =?utf-8?B?S0x6TXNMUzBIZ3crNkpiZ2JTc0FncVJVSmcrWm1uNVZTT0dNRnNLTk0wb0dS?=
 =?utf-8?B?N2Z1aTZMU3BqS0RJenRPWWwralE2TXk0VUsxcUxpNndzcHc5MHlIbkFWcUhC?=
 =?utf-8?B?aXQ0WWUrNjNFMzZ4UWo5TTl1YnAvLzIrRnJ6aUY0SnUxaS9jSGpQNGRYSGk1?=
 =?utf-8?B?TDFrK3JBN2tQSG9oaXM0a01OVFI2SmdCWnBaSHpKczBQc1lFZ3NFQWZVUmQx?=
 =?utf-8?B?bW0xZ2wwaGs5V2I1YTE0aG1DTnJNT21KVjgzd0U0SjBWbGQrdjBxWk1JTExp?=
 =?utf-8?B?SXE4WTRKeWRNRUdMTktPWm5KZmYxOFJuRHg2RFpUaDhSbHVDSlVyd3krYVc2?=
 =?utf-8?B?dEdsZjgxVzFCYlhmc3lHd0pvVWVBL2JtNzJJMDU4eUpybHcwa0NzWjNHWmpw?=
 =?utf-8?B?MTZ1OG1HSHlWV09id0VXSWFTcXFUOUZRU3E0UzlYbUhuNjRZdkJTbjQxNE1x?=
 =?utf-8?B?RnZNSzV2YjdFK3dXbWhnM1FaWlkxVEU0Q0pIT2xQM25GcVhic0c0RW5QOWg1?=
 =?utf-8?B?UkR4UXV2eDQ4SFRueVNhU3JZcnU3RjNnNzlNa2hmaGFrajB0Mm5OWU1nR3B4?=
 =?utf-8?B?ajYvR0FldEZRY2lUUTRsMlN3SDJPdjg4aFVROFVqRVJ3WWRoTG12UFZGTHZP?=
 =?utf-8?B?YWtveHlTZmF2WHBZYkh5Nm1NelQ0bTEyK05NSCtXaVMvR0tnRUNDNy9YblZX?=
 =?utf-8?B?a3ZLQVNLdzE1NnZGWUs0a0hlWG0yTDhydEdiNnRadHk4YzNMZ0hTUWkzYUdM?=
 =?utf-8?B?L0VHLzdlMUEreHJOOHB3eUFXdkIvSVQ3SGs4RlpBN01sTk5leVVSYXFwZE8y?=
 =?utf-8?B?UUhVcTdIaUd5aVpxaHNDd00wWGdlMTYxQmltbklEYXZCeUE2eXQraFg4MVBL?=
 =?utf-8?B?eDg2QlYxOXJJZ09FRnFxT3VHVFZBTUpXYStPdTUvK0hqTEo0UWpyNXovem5Z?=
 =?utf-8?B?Rk5FWFIxeVpKWHhONldBdFY3cUd0NXhNU3M1RmgwMHhYN29YK0dzTHlQOUZw?=
 =?utf-8?B?c3AzSnF1MkNQVy94ZjJvTUcwWlhrelFPRTVIMEY2UWludW9uN0MxS3NKUlZW?=
 =?utf-8?B?Nkd4Sk4rbGh2d3B6NVdpT2NRbGlZbWQwY0ZwS2Z4S1diVDRTMUovazNWNzM3?=
 =?utf-8?B?dkk5Y1hIREt2SHBXbCswbGI4Y0Jzak9mU0wwS2xwQThwS1IyWDhsZmN5dERu?=
 =?utf-8?Q?dC96zdhemSo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7B83A2CC4FAD6041AA61513DF3DC53D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8073
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	692b4581-140b-4924-a52c-08ddf6cc5c87
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|376014|36860700013|14060799003|14125299003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WW9TTHhnL0k4TzRIZHNvaUs0K29lNGczMDN2Qm93c08rb0NqbndybC9XZ2h5?=
 =?utf-8?B?OEc2cWpCNUdhNGpNNVkrWmJRcCtNTVo2Ti9wSnQrZXV3VjF4ZGRLZ005RHEx?=
 =?utf-8?B?dEhDWmRMME93MU5EQ0JMSzkzWFEzT0hTWm5wVDRHSUM3enNHWW1RRTloU21s?=
 =?utf-8?B?SXJJSDROUldXTzNwOTErc213UFNwM280ZG52bmxubWlJMzZkZVJJVzdBM0g4?=
 =?utf-8?B?aERvK3FJMUJGZzJaY1llUmVsYUU5QVArcFA5ZjJFWjdyQzNnd0FhRUdxNzFU?=
 =?utf-8?B?YjU2MUhOKzVON21Cb2pDeUVzaG1QVjJsYTFkVEpTem04dHYzSHQ3M0VYRHlo?=
 =?utf-8?B?Sm5kalRwam9NUDh1ampqb2hhT1hiWjdWRnNKQXZFSmEwd1RJL2MxalJWZGQ0?=
 =?utf-8?B?NlJKbW04ZTQvL2hWVjk0OFd2cXZYM3FOQ254V0xxTlMrOERjQUJ3akZXUHpl?=
 =?utf-8?B?MG9iVG54RUhSVHFFc2FyR2h5VkdLcUlDc1FBTzRGUllYdmxyNGNoWnlkbktz?=
 =?utf-8?B?K0lmd0xVa08yVmh3WUlhY3NyR2pHZTVrbnI3YkNxa3I3NmZUWHViUk5mcFcw?=
 =?utf-8?B?NmxQSk5vTWdib21HbTd3SlFwV3Q0UlZmbi90anhqNXBrbTgwOFhpc1E3c21R?=
 =?utf-8?B?WVBKSkU5Ylk4bDNXeG5aZnAxMllrL2JSWlVpdXh1NktUOVJyOUlLb0l3NUhX?=
 =?utf-8?B?alJhSGtPZktkNi9YazI1cjR1S09NZkFPMlAzbkpuSTUxbEVuYWN4SzdLazgv?=
 =?utf-8?B?UGE5cjEzOUZsc2xNZWRNZGtzMmw2NzFzNWxNU3I3VS9DVzVIOEwrSW1naHhW?=
 =?utf-8?B?bWdxS0NBSUhGQ1NqWGdlOHlHM0VFTlBEOE5RRzFuTmNTUElMMUJZd3FsdTRS?=
 =?utf-8?B?SFJnZXlPbHRaODZKeWptZkIxRVRMUlZsTDhUNUw0SFlicUliQ2JjU1cwRDdF?=
 =?utf-8?B?WnpQYnlBVmdKVENHOEJNcTVxTXNuQlRzMFRLRG5rSjNpRFFSdEdtMEFVVlRp?=
 =?utf-8?B?OXpjV0NmWExwbGx5RnFkN0hJWEFTSGlTVGFmbHRoNEtOc3lnRmhuM3A5SFc5?=
 =?utf-8?B?RStmeS9UTzZxMlFVL05TVHgycWdadlQwTkt2NWd2Sm9XbWdrSzhlZ0Z5WHdE?=
 =?utf-8?B?S0pvRi9iK3lUcjA1VXByZmJMejBnNnlvZnZsVzdySklwY3BUTmNoN24rZGwv?=
 =?utf-8?B?U3RrTi9qelVRcGk5czE3aXkyVjVpMGxtQlBJRGZjNE1HNXd0U1Y0YjcyRmFL?=
 =?utf-8?B?SDVwMXo5R05FaU43d25LWWZxOGJiUmNRQ1pNalR1OWlRdmtzY0RhWkRCZUho?=
 =?utf-8?B?QUFVelVERFoxL2ZLV0RTZmFSVjF3LzdhWU9EcURPVUI5bVFSdVJtWXFtVG1u?=
 =?utf-8?B?RXVCU1JiejNqYVR3Q3EzN3NQa3VpaUVGWlpBL0lPaUNkS3VYb1lTNlozNkFN?=
 =?utf-8?B?Wlp2QW9WY3ZPazlOLzlRekJjeUY3RTk3akZsTGNjQ21DaXJ6WFg2MGIrL1lW?=
 =?utf-8?B?RVp0cGpFdTRwSGNUNTdBdGIvdStObVRHbVQzdWRraUQzK0p0clhQbkptTWhC?=
 =?utf-8?B?TGtUaUY5cUtDZEwyVlJNeW1IeVo1eGpCUGM0S3VoMFpyclBIRGU3VnV2Wk0z?=
 =?utf-8?B?MDJUQWs5a05RWlhGanB0OTFyUkVxbndzVnRVN3dTZUNzUnJDLzZNTGV3cG5U?=
 =?utf-8?B?WnZKQmo2eDVma21RWHdnSmx1bkFxdnpmRE1rNEdXdldpZ2lac0tta1NKb3k1?=
 =?utf-8?B?N0VCb2dKM2xmNjZUWG5jVkExc0QrQ0RRek9YZzUyMGZrOE45TXNNNVpoaWxz?=
 =?utf-8?B?eEkwclpnKzdhbmtTNDJVRzludVoxS29QV0pEOGZxQXRFRlpDTE1UNzZWdytS?=
 =?utf-8?B?Q3BrUFdvRnJVZExsNWZiQnpDeEh0WGJSTlIzSUtodlNzdmdKd0tjZWdsRldj?=
 =?utf-8?B?SnpNUUxTd3hXSDZzYVZDclNBOFV1NUVpTVVPeTZBYnpESVhxMllzck53NEwy?=
 =?utf-8?Q?Tzp+SvoMKUbnP82gy3YWAJuIxaJcHQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(376014)(36860700013)(14060799003)(14125299003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 16:00:06.8073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8de3ac23-78f7-4eab-2606-08ddf6cc6ffd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10226
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 16:00:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223649

T24gMTUgU2VwIDIwMjUsIGF0IDExOjI3LCBTYWRpbmVuaSwgSGFyaXNoIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxIYXJpc2guU2FkaW5lbmk9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb206IEhhcmlzaCBTYWRpbmVuaSA8SGFyaXNoLlNh
ZGluZW5pQHdpbmRyaXZlci5jb20+DQo+IA0KPiBZT0NUTyBbIzE1MDYxXQ0KPiBFeHRlbmRpbmcg
dGhlIFNESyBlbnZpcm9ubWVudCBzZXR1cCBsb2dpYyB0byBhbHNvIHNvdXJjZSBzY3JpcHRzIGZy
b20gYQ0KPiB0YXJnZXQtc3BlY2lmaWMgZGlyZWN0b3J5IGAke1RBUkdFVF9TWVN9X2Vudmlyb25t
ZW50LXNldHVwLmRgLCBpZiBpdCBleGlzdHMuDQoNCj4gK2lmIFsgLWQgIlwkT0VDT1JFX05BVElW
RV9TWVNST09ULyR7VEFSR0VUX1NZU31fZW52aXJvbm1lbnQtc2V0dXAuZCIgXTsgdGhlbg0KDQpX
ZSBhbHJlYWR5IGhhdmUgYSB0YXJnZXQtc3BlY2lmaWMgZGlyZWN0b3J5IGFscmVhZHk6IHBvcHVs
YXRlZCBieSB0aGUgdGFyZ2V0IHJlY2lwZXMuDQoNClRoZSBTREtzIGFyZSBjb25zdHJ1Y3RlZCBp
biB0d28gcGFydHM6DQoNCi0gVGhlIHRhcmdldCByZWNpcGVzIChlZyBsaWJ4bWwyKSBhcmUgdXNl
ZCB0byBidWlsZCB0aGUgdGFyZ2V0IHN5c3Jvb3QuIEluIHRoaXMgY2FzZSwgdGhlIHNhbWUgcGFj
a2FnZSB0aGF0IHByb3ZpZGVzIC91c3IvbGliL2xpYnhtbDIuc28gPGh0dHA6Ly9saWJ4bWwyLnNv
Lz4gb24gdGhlIHRhcmdldCB3aWxsIGJlIHVzZWQgaW4gdGhlIHRhcmdldCBzeXNyb290IHRvIGxp
bmsgYWdhaW5zdC4NCg0KLSBUaGUgbmF0aXZlc2RrIHJlY2lwZXMgKGVnIG5hdGl2ZXNkay1saWJ4
bWwyKSBhcmUgdXNlZCB0byBidWlsZCB0aGUgbmF0aXZlIHN5c3Jvb3QgKHRodXMgdGhlIG5hbWUs
IG5hdGl2ZSBmb3IgdGhlIFNESykuICBTbyBpbiB0aGlzIGNhc2UsIG5hdGl2ZXNkay1saWJ4bWwy
IHdpbGwgcHJvdmlkZSB0aGUgeG1sbGludCBiaW5hcnkgaW4gdGhlIFNESy4NCg0KVGhlcmUgc2hv
dWxkIGJlIF9ub18gY29ubmVjdGlvbiBiZXR3ZWVuIHRoZSB0YXJnZXQgTUFDSElORSBhbmQgdGhl
IG5hdGl2ZXNkayByZWNpcGVzLCBqdXN0IGxpa2UgdGhlcmUgaXMgbm8gY29ubmVjdGlvbiBiZXR3
ZWVuIHRhcmdldCBhbmQgbmF0aXZlLiBBcyB0aGUgbmF0aXZlIHN5c3Jvb3QgaXMgcG9wdWxhdGVk
IGZyb20gbmF0aXZlc2RrIHJlY2lwZXMsIHRoZXkgc2hvdWxkbuKAmXQgYmUgYWJsZSB0byBrbm93
IHdoYXQgdGhlIGZpbmFsIHRhcmdldCBhY3R1YWxseSBpcy4NCg0KV2hlcmUgeW91IGhhdmUgY3Jv
c3NvdmVyIHRoZXJlIGN1cnJlbnRseSBuZWVkcyB0byBiZSBhIGxpdHRsZSBtYWdpYywgZm9yIGV4
YW1wbGUgdGhlIG5hdGl2ZXNkay1jbWFrZSByZWNpcGUgaGFzIGFuIGVudmlyb25tZW50LmQgc2Ny
aXB0IHRoYXQgdGFrZXMgdGhlIHRhcmdldCBjb25maWd1cmF0aW9uIGZyb20gdGhlIGVudmlyb25t
ZW50IHZhcmlhYmxlcyBhbmQgZ2VuZXJhdGVzIENNYWtlIGNvbmZpZ3VyYXRpb24uDQoNClJvc3M=

