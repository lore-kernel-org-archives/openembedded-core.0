Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D49CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:49:34 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8537.1790938172828250408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:49:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=uvnA+cof;
 spf=pass (domain: est.tech, ip: 52.101.70.40, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVgWq/gEK4i2ONpGYM4faWOjHL9hhxHBwvsZ9Ihn4HQqJOtiAsBwBmg1g7Fe7GB7YUJBU+FEEi94dfRYMJh6F7B/492Au3akDgl3AhT9F7e5di0GK86Lvfp0euu5IBpRT7q6tN0K6ZycwbOdoaqBcCjvDgxkxPB52N3Y6Xvg9uy3eUyvXal9VoCS0va7qM5OKc3W/SPJCxXU2aTheMdqB6U8qtr0LOYYZZXpcgvUR2Yng8uSz+eSE1fiTQ95IWZu8Cf1jOzRI+vOLAtSWf0PJPcajuQREmRgPh4yrNAGbNbga9uT3f/VaArarqQNM36YcM5dG3cYh3v8Sxl0iDN/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51SLO9JP/ZkpA+8TxYmqpxBri6Gur4UMKbm0LgYamqA=;
 b=sHgcpy700TmXGUvhtzRg48vBhEQflYgqHE1CWCSz77o3rr79zKTGqQoBgdS/g1n6Bm0FST8N+z8y2Gs8tKfF58pgJpocLBMkx9h0g5Ba7pcEoEVkuxugas25yWNscaqQuujJl49NakHHPGPugRr7TB01mRg8WMy/ytKaeno9RaSM2/d+lbf7w7myci7SaATJOhatdKwRywPmkkoYeHdCgtbAaj16eantgrgvgTEwDn+NLqAYMLFVD6NXzdup7jsUUeQiDLQcEPLBu77huJuP5PNIdAdxSWPn3JVinMDuWNyDTDfeBU23ln9Q5a2I7qKgJCFSuf47M944JuhfNZl//w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51SLO9JP/ZkpA+8TxYmqpxBri6Gur4UMKbm0LgYamqA=;
 b=uvnA+cof0x0+KOcDDej6RAwuJrGZh2kKg87z6507GXcqELGW00o54ZsReQEjGI1V3TdoaFU3s+uwWNjYTDyg8hnyvKtB3tPmgPLpeSNRPVMhupyOgZtEEwCV65xlFVxpAGoTWQcv+cFntjgAy4AJUlo4HGAGxwzI7JEyLu8Y0qi6wgoFnDrUlMDzAeM2mq9Q7/n1VForjmMoglGjJN4LRyyxooENfXTudsxbsywzC+5G8BqyU0jB0pIJUM9Ynjv5s4wNSEJEQ3VsBtjTbXBemTOFm8BFeEyAOhMoozT3mb/uhVXsEENhvSXR/XEku1i2Xh3R6RdOcancN2blxJPSTg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by FRWP189MB3350.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:188::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 10:49:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 10:49:28 +0000
Message-ID: <19fc64c3-1746-4c84-b1a1-35ef33aea1ee@est.tech>
Date: Fri, 2 Oct 2026 12:49:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] shadow: upgrade 4.20.2 -> 4.20.3
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261002071557.74249-1-jaipaul.cheernam@est.tech>
 <20261002071557.74249-4-jaipaul.cheernam@est.tech>
 <DLU7J55HJ9YV.14WKSNSKCXDSM@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLU7J55HJ9YV.14WKSNSKCXDSM@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|FRWP189MB3350:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b14b10-3217-454e-951b-08df2072d54c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|10067099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	rDyswUToQ+jnarlWPv5eAoloqePNwNqLOa/f6qFxogQg60why5l79c4P4S1HNTVMLyXLbj76RED/aFdMS0FP3lYAwfQIAbSMV+GBUPOMIZMyF483w50+e6WO4Iy4GG3iM2mxLGJpMSyK5F0CKK1436wlYjhFSohjLbWS2fDG4HwgdOm2sbvi/tXijs9oHDGW3jgvcey6LIbeB1NZptRV+kO9mgn+fej/f/p2b6f41RsrXPBp7fqLKPtG+2Ucob86efgEu3Vq7EmPyBaOMyXveW6psK6nP60Y3u5rwC+B9+zONGUzaGILIuOMXQ5dcpk6GlfyZ//Xwfnifu4USyTPxr42TIRA+jDnCm59YRvrKR8tZqp5d1Jyu94sHUv/rid2qogosMsEJ3ebn/NoICWBeclqvo/TjkCOEVCeeHp/8z2JfW0+8dsLulv8REbUb2w3cMq9G8JL3v58cyGZdh/aurmsw8h2RAPykL86Asx3nSW0yuiBjuhhgsb9QHuGsDRBFyVWJO0PzRffDmLNqmryCrAtUU0clFoDOtAjZf2xWx8v1akgxjjskUouZVH8X+i2XD4WAdT3EJ+YQ6U5qid4rZfdnwDFE2DX3YVgc5HQSAM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RF7hDE48JyLQ7kT4gWeCHZ3/ncBHWLTSfPJzBQZ4jwbxoOulbvGu3dSEXOhH?=
 =?us-ascii?Q?tLR5SDPtYDXX3a2OyCKvxmiwrc+7Pz6xRuZ935qXJbX+ccZZcl33g3v7NSyp?=
 =?us-ascii?Q?e/Lj73Mse9H6zEfBUZvJ2r6W4SJxmoIyT97lWQZ0Lvt2BFjcGFc6ruusQPRg?=
 =?us-ascii?Q?GCW5llACop6wuTAUE8fZRsFXiIvs4XHyor1hRwrxCsn88+xgm3qj0bNrKW4v?=
 =?us-ascii?Q?43MCOkOspgMYrplX1XgAmBSl6V5Xj6PahwSv97bv09OmzHceI2A0RFdGuBtz?=
 =?us-ascii?Q?sBmworTS7yGf/wHl/JUi2i1QJa/bQNo5F0YiARw+QATEYb2rLVjZhT7zZYF3?=
 =?us-ascii?Q?e7vwvmR9Lym30kCVYDDeYFqEYBm0swvD533LsbzsoMCy+ypKrB16ZmpMpTAH?=
 =?us-ascii?Q?xpp+3wvDcIbwNtiVdMTrQIm0eWDEzZWng159HPzFmHeRGT0JFxWTns6UPOVB?=
 =?us-ascii?Q?L95fB5aI29SHPrA2YGDUlMcQngkhz9CD47Bv6DNBNrOU0nAF7G773t8XQDsH?=
 =?us-ascii?Q?pR7px9IPmBkGmrDOzqXvz2Vfzpf1949OCl4+/nGN0Izf1toxEwxquUcl6bTD?=
 =?us-ascii?Q?Ssq58RQ4dG8Ovrfw3XvvLd0SHz7ddGXRLllmNZ8BKWLTc028XJ6Wc6q1M9uw?=
 =?us-ascii?Q?gGGcdjyuVr5SNdWdAdq4pn/hvBSRHFH7aTu36bhkzqvWU6/YV4n79OqvxXEt?=
 =?us-ascii?Q?4/ouNtivbZ16986kf/NzP4djZcbVe7HMn5a+/xAkEntSgDydnOMeQb/fi4a+?=
 =?us-ascii?Q?igqQD5HQrtLStX92VB/CGbp1WPSVakMYwodbcQMDZNy+SE2syfr6JbsnlPE+?=
 =?us-ascii?Q?MuvG8N7ttJIHodLqURXTwp8Jv1/ivjQesEVi/zTWnfPW59lqyFpXLhpydPrQ?=
 =?us-ascii?Q?xDAfHS+s3rzfo78euXVvtw0D8BBqGm1t4u74eJ3rGIsUlq/UIgHIjBQjbzQD?=
 =?us-ascii?Q?1BNd9cwBC1CDzqL2IM1mKmff7GAOVwm45SlYF0HnfqlrfaZl+7lp8GKQErWq?=
 =?us-ascii?Q?gXaLgFO6xa6zg8dmUSskPlqMUXuFtZ57ASBytBEMX14k/YIFg6jll0Mta3h6?=
 =?us-ascii?Q?9JFkV2lMT1aDBQoA2yHLRGJSBNi6sv+xH7AyV5HD/BSNlLyzEyfF0EQOEqrQ?=
 =?us-ascii?Q?25QVhrCEjzD+DD0xdJ8wKA/p1zmy1kyTJalWbGxJ7cxNkxRR6YtIdSx21fQK?=
 =?us-ascii?Q?iu6aTtWOoF09WT2zr8fZSTldrK0VNt9BnwwC9JGId0OV/hrglmBOQDU3Dr2U?=
 =?us-ascii?Q?tbt0gNOyxp5RwHQ0DEzlZACCVCEIS+ru406OyQW4SlKLp1J7U//TWyexBuwi?=
 =?us-ascii?Q?cwXhNwGDlsn0azBGpKIdg9bikI75O9NWjN0Av9S31v3hPmpt+MocGBsZfDqj?=
 =?us-ascii?Q?qz2Lu3INqD2bt41PZ8vR0bHPwRQSuGlZoka5FJZi6a2HXJmRP6SCXCK55mLk?=
 =?us-ascii?Q?6nrXTJezYyXg802MRUB+rCewugRkkI+Ay27uDsCdIP2iV8cnkyyoLVSsMG2O?=
 =?us-ascii?Q?mwtoAZB6F49VsueRHuvbohjd6WEbqie3dk9xU7VPalCa4ddaeMO82XT1Vy1Q?=
 =?us-ascii?Q?q0CRt1pWgE3B4qXIlO5kNNjrRFsHSbqQbIs+66TvsnQuEog7mZBKj38i3Dwy?=
 =?us-ascii?Q?Ss5fW5xM6qB5ZrLhRvclLnDr6UaVGsUkdlq6kPUoQVRY/hAUnooe3MhSP6Ks?=
 =?us-ascii?Q?kN5fiv0AJV1tIPLSU9hPkG9A9jEfKVt62pCVYwxZvAvoXuE2Km4zrynP7HAI?=
 =?us-ascii?Q?Rx906Ltr4A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b14b10-3217-454e-951b-08df2072d54c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 10:49:28.7816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oKiUnRMesyTfqM6m5tteJEmGmx1X8Iwr2Y1rn/cXPIjVigrHlJ/9kg2i9s9ZTQk8m9iOAQd36PbCvFviMXNVGvVzgubb65e957VOcOlmfp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3350
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247102


On 2026-10-02 10:25, Mathieu Dubois-Briand wrote:
> Does it build on your side? Here I get this error:
>
> | ../../sources/shadow-4.20.3/lib/commonio.c: In function =E2=80=98dec_lo=
ck_count=E2=80=99:
> | ../../sources/shadow-4.20.3/lib/commonio.c:425:51: error: passing argum=
ent 1 of =E2=80=98nscd_flush_cache=E2=80=99 makes integer from pointer with=
out a cast [-Wint-conversion]
> |   425 |                                 nscd_flush_cache ("passwd");
> |       |                                                   ^~~~~~~~
> |       |                                                   |
> |       |                                                   char *
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/4753


Hi Mathieu,

This is my favorite musl build failure :(

Based on AUH logs,=C2=A0poky-tiny builds against musl=20
(arm-poky-linux-musleabi in the log), and the shadow recipe only turns=20
on NSCD for glibc (NSCDOPT:libc-glibc =3D "--with-nscd").

So on musl it builds without NSCD and compiles the broken nscd.h=20
fallback stub, which fails on GCC 14.

My local build was glibc, so NSCD was enabled and the broken stub was=20
never compiled.


I will send V2 with upstream fix which was merged yesterday .

https://github.com/shadow-maint/shadow/commit/b8d3549a49acfe967f45aebaf06d4=
74c82c46d2=20



Regards,

Jaipaul


