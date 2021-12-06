Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E46C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 16:30:22 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.61])
 by mx.groups.io with SMTP id smtpd.web12.53923.1638808220057613662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 08:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=R1RrBZow;
 spf=pass (domain: outlook.com, ip: 40.92.89.61,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGPtI8zC5+tesYq+0GhosvwyF+kc5USPpfG4noKhMlfMEAwsPmTRJU+EdV99V/Xv6qxcT+Dxnj1Ijq7prKd5AQ9uowA1NNuyGu0+5rTusQiBi63cfpp05SHuZ5ZC4O6clpLrr6eBJTzJE1A5J+mw7QHo4/lAghmgKzOKI2g9SJCnrSGTliV4gJINC4zYwbzZbWN6zJwwu3NraaoDMGW0W7RSEd09WGay3aHmTci9IqbVj0MTGt9RYDMAfc1qoMFSttetnLmT6rTZ2A1KKCjKMPu0cWMQOc1CiHvG+RsxH1UN15ZIFovZKZT49l9LmAU+YasPBDTKQ9t7vWZiyl8GRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ek7dzfySJeFsENj//WE6ymuJ4ZPBDI0eWukIQM3s1f0=;
 b=Rt3syS7BEPXZEolNURC+y2v1vLJ2oUGHdMhpdGnsCJshZ1iymiH1VCs70ucJAMDUN3ZH3pMPep1GvfQ8Bdvo1anFmjYTjrf2lbZQWmkPNA4CiutAqslu4ZaGM+k/BRpm24+dVedkOrKfuHZ7u3gRPQ3SkwozwrHHKvcVKvyFTyrGomhI4sAltlLvJjOmNYc5UN917HRQHUznu3jdr7+jfgQiIJHzdLdlg61cnAIix1WepHMQvTXh+AgZUDUi7TFAqDFQKauIOc5HNVRBk/d86hy9cwIn/oxdSqviI1JwBsnK6lmTstlJJ+574glZIjCUWSs/Yr9aJrZLbmvrwzXTQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ek7dzfySJeFsENj//WE6ymuJ4ZPBDI0eWukIQM3s1f0=;
 b=R1RrBZowWzKXsj1Zj6581klAb5PnNnxVfiTnMATZkIAjqOwBiBdWAf+1gqLHsSZ2upFYCx79m5TM9Ju99On8aUN3amp44xLeL1P2CA1mgXbKHGk8nntuqT++HYz+jCiS70P2dvvm81iuOo4HKhBEeLqovRslaBAqeuxPkqKpdEVk0BF4Qfb3X1CzJ+PXAQSUglWZO0thB2kw5esAvpHFzCKzgNNMuYayglOdYcn7eyTnjH0QJEl8ybuLh26vI4AqcgEAOVR4ztb/hPKcBmEdCTCy3VtX+V/7qHJQ+IL9ud9doHr4+z8VSRp7kHPkKDpQYlaqfWw5SuNFwFlIIe++gQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2833.eurprd09.prod.outlook.com (2603:10a6:208:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Mon, 6 Dec
 2021 16:30:18 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 16:30:18 +0000
Subject: Re: [OE-core] [PATCH] minicom: Upgrade 2.7.1 -> 2.8
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20211206130634.500693-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8r-3BvcYnaiBbTGzBJ_iAPg6Sn83Dt4N4NLUh+vP-=yQ@mail.gmail.com>
 <f0d640e1911f8e9577ef7ee5ffef426b084861f4.camel@linuxfoundation.org>
 <CANNYZj82Y67WWDXi0FPHu1sEPCxkK4eUiA3_2km0t-sscr_Oig@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642256F4B7E31B20EE91061A86D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 6 Dec 2021 17:30:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CANNYZj82Y67WWDXi0FPHu1sEPCxkK4eUiA3_2km0t-sscr_Oig@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [M1jhiYrr9iD2OWHv1u2EKoBYNgr4z8MtPNE317wcrp5IVUYAy6kZmv3/h3p1XSBP]
X-ClientProxiedBy: AM0PR05CA0088.eurprd05.prod.outlook.com
 (2603:10a6:208:136::28) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <2bbc4aed-e53d-7018-d74f-af4a3f98afcf@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR05CA0088.eurprd05.prod.outlook.com (2603:10a6:208:136::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Mon, 6 Dec 2021 16:30:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2664f3e2-e3cd-463e-b0ea-08d9b8d5b033
X-MS-TrafficTypeDiagnostic: AM0PR09MB2833:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XrlF7ZP2v7uhwQj0751cdGR3cEQHMp2mpU7jbB2+GTWK7Zk1ct6Th/XWEurZ+LyjXoG9Tr4k2Rbys53Z9eLkTzV9Bki7KzgzexgXETzy/9lpxK+uJlZ/GN5njX9HzCVywiIF702bAdBoQCUX18hMvwy1MEm3ZfUeECj+CZwbL6ygKJZ9GOADHqN1K2ROQulK1Av9mDnMeEZrxv9/cw+ScGD5Q36gJ2a32+AXa4L0+JoIV5ewZ7SWr3NYxqoXm8lxiodaox90R+w+DkqUHrPOQSbLKWhxcCx3ma2v9Q5WcrkIPOXxDrt9i7utNa7pzo9JW58gpP9KiOrDyLL02QdXMenqD99FmWwlVxvqV/91fhsXvlGqumOtD2rcETFcbymsm54papexxgpP8e80pYecqJaxFUe2UgtPy2mFKzt/6Of7/mPEFkTTleG7neR8r5vm9zqXeHEJVP4Pqeu5TCjaz32S6i2754EwT3u+LwEzu7Hk/MGRLghmM2zMSjxtgzSCkI23LiXmGBWqND1DfGlvGHsNifQfqy7lyqUQDs4MXy0XZ/8cqOEDo2VC3bUdts6EM/m69gmhBBWdD2ECUkdkadvUCzYUcVq9VakwjVeYJ5BWXhmH/fVIk05fWZA46LjqY/Cwwv597UMW6FFR3WIIFIGD/4F3QelMv+6zrCXM5pc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cUhuS2kyZUdSeG05ZGFwRnc4YlRpNmNaUzBrM3Z6ZTVWbFNkeTE3YTA1clNF?=
 =?utf-8?B?ODlSZjd2UlNIMHF6V2UycTB3SU5mbnNEMW5iT3hhVGdvdk9Bcm95SjIvQ0tN?=
 =?utf-8?B?Sm1jK0ZyNGtqci9PK25LNTRwU3g0T0FKampUejY0VmhTcW5hakZiMUpaaUlr?=
 =?utf-8?B?c1QxcTdMTjA3Z2ZzUDlQRjl3YU51ZWdGaEQycW5UeldKcnlRQks5SENxTTlr?=
 =?utf-8?B?NGpkRDNqeUZ4b0RXZVV5ZWJTZHRSUStjU1RtRW9OVWs2aHcvWVdQbjFoWFV6?=
 =?utf-8?B?RjVNbEVxS3YvazRiYTlMemJBKzlTQStxUWlOc05uMmNOeVc3MDYzUmFsNDV3?=
 =?utf-8?B?eWxVdENSQmQ1QmdLUkp3Y3NzYmpLNEZyUTFuRlFKQkd5ZHQzMHYxK0VtQkJm?=
 =?utf-8?B?ZXRFVnNUR3BCWkNSamphVHpickNvRGJ1R1ZIVThGQVVaa29uRHFuWjhvQWhn?=
 =?utf-8?B?cWQzcjJuT3FwZUdRR2V6L1I3QnM5U1Q5Ymx2OWduSWZWSzg1SUc5dVc4YUk2?=
 =?utf-8?B?dVJIOHBGZVFTL3ZyU0duZkswSHNQSmtUWnJ2RE1rNWFLK01rejZlZ1ByL25C?=
 =?utf-8?B?SHVJY29nZkdwMk1UZ05wUUFJcnhyTWtHaWJmWGorUFc2eUd6aTAwQXI0eDYy?=
 =?utf-8?B?VmlheDJJT1dYL3ZQbkxOZy9FQ0FReEdKTTVoVEtsUlc3SGMwZGRwNUhSWXNo?=
 =?utf-8?B?UnIzL3VFWWxCMDNvd3JKcUpmaFdOejU2TzhXOUJVOG5OcnBraEVyWDBwNXNp?=
 =?utf-8?B?RVU0K3BUNnhFMXR1T1RXOEsraHFmUnlHbWZPYW8yMDFybkN2TGlFTmR6ZE1s?=
 =?utf-8?B?SFNWYWlBTDdvVWkzVmhaa3lwejNnQk5nTEYrai9mMVJLTGg4N1hVQ3E5bHBG?=
 =?utf-8?B?QkhJM3pnaHVkTDgyZUNoTGxuMTFRVS9IYk83MjFNYlpNb3J0Qzk4ZDQ3OFlm?=
 =?utf-8?B?UU1naXR0ZW16bGhzT0g4SjF0WDltMGxJWmdKWFMxN0RnYUZNV3psMkZPVGJr?=
 =?utf-8?B?aktvc0tFTmRqOWdjQlQ3Tk9CdXF6Zy9LR1Y5OFVwdmx5NjZxRmVPZjRNSkhn?=
 =?utf-8?B?MEJNbzBxZ0E0KzdZVmJ6MFJFR2NMbUlIZW5Hc2hlWk81bFJRVVlSS1J0U1dX?=
 =?utf-8?B?ck9YSkdYRjJuVkRNNmcySjJjczRWdVprY0VJU0hoQVhXbUIrRXp1TlNYczVW?=
 =?utf-8?B?Y3RIbEJWeTBMYkh1LyszRXlnbFp5OERySk5pRnhqSk9kMytvcjI5SUJkM0ZT?=
 =?utf-8?B?dksranZPOXdIOEZWb3gya1ZJbWdJMlgyU2ZWWkljTjJWKzB6TWhValJQbEpu?=
 =?utf-8?B?MlltZWw1S1pyeEZPMHNWeGFYeldVOXhCMU82MmEweVBkRXRjdHpxL3Jpd2lx?=
 =?utf-8?B?bmhobjhiZUR6bmc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2664f3e2-e3cd-463e-b0ea-08d9b8d5b033
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 16:30:18.0700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2833
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 16:30:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159255

I think the answer is that latest release is a bz2, while the older one 
are gzipped

http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.7.1.orig.tar.gz

vs.

http://ftp.debian.org/debian/pool/main/m/minicom/minicom_2.8.orig.tar.bz2

On 06.12.21 16:57, Alexander Kanavin wrote:
> This one is odd and it should be working. I'll cherry-pick your update 
> and get to the bottom of it. This may mean we are missing other updates 
> that are coming from debian tarballs.
> 
> Alex
> 
> On Mon, 6 Dec 2021 at 14:59, Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
> 
>     On Mon, 2021-12-06 at 14:43 +0100, Alexander Kanavin wrote:
>      > Since AUH didn't pick this up, can you run 'devtool
>     latest-version minicom'
>      > with this update, as it probably would report something that
>     needs fixing via
>      > regexp?
> 
>     That shows:
> 
>     WARNING: latest_versionstring: package minicom_2.8.orig.tar.bz2
>     don't match pattern
> 
>     Cheers,
> 
>     Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159251): https://lists.openembedded.org/g/openembedded-core/message/159251
> Mute This Topic: https://lists.openembedded.org/mt/87539156/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

