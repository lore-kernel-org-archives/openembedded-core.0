Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7DFC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 20:06:38 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.68])
 by mx.groups.io with SMTP id smtpd.web10.39.1646683596965451515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 12:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=tOvY9eIx;
 spf=pass (domain: outlook.com, ip: 40.92.90.68,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lR8qwbeJ8Tr0OSC9lA3LX0qHiISkZpnGSIHWI/xAXUxaCasAnzcsFBbms1H6FlmY39tzMcchr6MWtOdyDcPBlFmWOTkFLu8Ht8VqWK1sMNoYIjwCxLUAOPDp+E5Uz4VKVRGpnFWAQq2Kyb86TfqTP43gn0lVqHTcygQQp1GTizxEhEVSP5riEWLJgu809/TZUbRuDId2iqpRlPA1vf2mj7Iq2Tvr75c6oB8xb/WdrJ5PEVLPS9Wwa310RRtsq4xfNUXPspuTCU94bI8NRTd8+yMJUVZs0y0NX97GP8QEuxjMLjMUs26Y2WioUv3s+LfFd4I+Kr/hMQGi5XdEvemRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RktCfGdZ79rL4G21AXMC3BXyFQDiKXtsNNrKkqBO5xE=;
 b=HaKqwsPvHuhQfNxVfVLS40f/NpBOk/IptAkumEc7Ncm1nDKmDRLBJUTBH5mDZA7HaM/XEzpfQ/1wfAngJK1E+f6DVdm48oclXnG7PK6HUCXgkBN/+OvTZCh0SYVZUL4EuoH7GmfZnfuIkLCOanXW23BPGdfPhQOdhNMxSPZIxze9I02VZIXISI4e+FfGuSVBbewgViLso0QuOyeXyBPYARwQsDbV8CXghTnKEVHI2F7rVLOiERqtfQumiEdNEmx/x1Wa+BpXRvvapDZa4m8ruJCpHG++2ZsYVXE7y13znHEM2f+kYojjaqbyKHuW6TU76VaEHglwSm7D2xcwaX1x3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RktCfGdZ79rL4G21AXMC3BXyFQDiKXtsNNrKkqBO5xE=;
 b=tOvY9eIxhFIyRveMBPqs0euOnJ09X54sqYJTqefphrU57z1MnrfrgRMLumI4spiGtzx1Zow+DQgwdXrXQ6itwoZEELcpQlxATotVT23JJ+9UPK92qQ/SOa30K6odd38tLJm0GLfG2L24buCAsWlnO65BSDm57SUGxskG+P8S11wjzVEJMMStrnYXPzUl7WGGmUm4rOXweVymkE8df7Rk989U4+NuukckXjyu9gtqrdrpv9e+970OeN15SW2lF99pBnTSpwmtcTuHJX23G7/rJd420kAoPcSD7c6HLOp6SO1qTKMSUcKSSTxW6pKcEM5pl12DhKa0HlzAhP4hn3TVpg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM6PR09MB2728.eurprd09.prod.outlook.com (2603:10a6:20b:a1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Mon, 7 Mar
 2022 20:06:34 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.027; Mon, 7 Mar 2022
 20:06:34 +0000
Message-ID: 
 <AM9PR09MB4642242FEC1B96DD9711A1C8A8089@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 7 Mar 2022 21:06:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/4] pip_install_wheel: don't lazy assign
 PIPINSTALLARGS
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20220307194236.3837684-1-ross.burton@arm.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220307194236.3837684-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [lyfNm13feAbdSg9FomR82yH+Yls6QFPHg5dYOT7kVkwnzw3avvHwN96lFTR8krad]
X-ClientProxiedBy: AS9PR04CA0036.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a::29) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <0b232561-68d4-39c7-7962-02bfe9a3b9a1@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e9a57a5-d1d1-4910-a0e4-08da0075fa44
X-MS-TrafficTypeDiagnostic: AM6PR09MB2728:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XkQJiSAHqUgMNTqBOR/LcmxNDQzh+m09CiUCTo7haVu6eQ904CS3A3UgAxgVIJpeCsfO86b/45Yih5JHSRan6eggkA7X2yPa7cK1kmYUdq3FfDEbEr9pnVPgA5cdrgzIKzjaWjq2QN8fbs0CV6Wqdq2QrBZqmdaYM1SKjN9ULj65kioZLYnSU3YhqUQnoDPjHwwUXxV8FwCQeVxBi+6AfPV4CCXq4jrqY9XQDzpjzZ7dZq9z8VQl9hwzVsdt5uhAjVulEaxMw1j674jFook048EMUGxbz/VEpwpl6/b5xR8A6zSsaJaggliYXMZVP3ifg/PJXIb8L0QwEZbUWQ+a7HCEL2draDSo5SAgP8Z1HURzclnDDuQ2aO0xyZk64FL0NpH16Y+dtaVkqvLdUYqBgqsn2Oe0ahnql53x6BohYI0C9FEPxk1nRaK5HuQMJFgbd06LEFYeq5CAluNqwpEhXeJAFUyKRsm2U6SG9xYmFXVMAbuxpvo1QY85oz2HxoZ78hB5M3jD1JpWhaFnCPSm/WfMSJTEwbMbZfB+LOmXPi4naQJR1r92y//QfBQfwfm2pJuDdyVysf8fxfIxrwiOHCT/w1Rloa4Wxgv12/wd29N7CSi2YDCSMPm3U4MjsOvcToqf5dQ4Sn7M8lZiRkm/HsYgT9lGUWzCPnAbGZLU74E=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U080WHVzZHFLdkdlOThNMjdFRXNmc2FHTXpscU9hNGlEQUF4eDlTc2E1dEp5?=
 =?utf-8?B?V3hLR2VtamVuWGpENWRGY1FiMzRLaVRvUjhqQ1FGQml3U21XbVZ3ZnFkcDJM?=
 =?utf-8?B?T3BzZWcxYzF6NzlsSXNhejN5Rk9tOE5iVlcvM3hLcVZVMmF0V3BoazJFNWdM?=
 =?utf-8?B?cllJbWswWDlBQVdwMXFleWRObjFreEpCWVM5aXVrK3p6WlRseWYxK0I2bkV2?=
 =?utf-8?B?cXpxSkhGckp3dXhVemdDcVFpVDZKaitQczRZUzdyeCtQNVJIdkowdnY3SWdy?=
 =?utf-8?B?T3RTdUhmb2xEa2YvdnJXT3NFRnQwTjdPd2JpSkVJc1MrSkEvZXZCUDFTQVlt?=
 =?utf-8?B?bkRMcUZOK0J3UG0wRVdRcVNMZ25nSHpJOTNHY0VXMUw1K1g1Nld5eHUxa1JW?=
 =?utf-8?B?R2k2V05heEZBNGZZZGoyZi9vNlBvWGV6aTBpaHlLbEdmWUthT0RneEJIVWly?=
 =?utf-8?B?YTNQZEt2Tm5UQXdyZ2p4TnFzY0tpd0liYmRVM29QVGxObFM3bWEvOHVjd3h0?=
 =?utf-8?B?MTFEQUNZZlZhY25Hd2wrOXVkSno5alc4d3kxNXhVcGdkUUpuYzJrQkdPZ1RO?=
 =?utf-8?B?eGxUU3lDOXFkWkF1SDhQTHBGZ2FFdDgwR2hnUUg2NVZmYzZxMFhiS0NqSk1o?=
 =?utf-8?B?bEV3Z1hBR0xjYUVFUGxUM0lOZGRpanR4Q2pEVERYR2h5WVJFK0hubXJJUUpl?=
 =?utf-8?B?end3QXV4dFpNVTJvVmdrZkVDZVFuY0Z3WGF5LzhrSWpmbUdDY3F3eWFaejNI?=
 =?utf-8?B?aVNlOVN4NDBOMHFhRjh5VEg4VWFYdnJPa0lTamUzRmxaWHgxUmlIV1RNYjg2?=
 =?utf-8?B?QzN0cFBHVHBtbWxqM2JLLzFlVm1OVE9JRVFFYWZ6WTVLK1B4U3pjREJtR0h6?=
 =?utf-8?B?MVk5VGhQUUJ3NkNsK09rWFVjV09xRHFPUDdTaFphMTZlTU9NaXlhdVgzY1R3?=
 =?utf-8?B?UzBISk4wN0R6YmgvenZHdnYzdlMyeU9aajU3Qk16ajRGaTNUd2grSUd4WUxF?=
 =?utf-8?B?ZnlaajNyaUNhalVUYWhEYlB6ZjFJSVFXUnEvTFR4TDBzS0ZTekl5L3k5MlRp?=
 =?utf-8?B?d2NGajdudTljRkNBSFNYM0tWZFdDOG1pKzVkUWUxRkVCZkpFcGVyQVpVNWlx?=
 =?utf-8?B?MElNK1lNWmovNitOejd1V01JQjVuaUhrNzJ0M3IycGFEUStsYnVFUzNBZk1u?=
 =?utf-8?B?cmpUdTJnK0VSMCs2WEsyWFdHVThGTmRVVDRkd1pVZjNLZmZsODNqV0hUKys3?=
 =?utf-8?B?SlhPeThOK1ZwR0lLTXVmRkZoNWU3UlNubmQ1WWc5T0YvTUdnL245NHdyYXJt?=
 =?utf-8?B?VUl6QzM4elJXcThZU2JZMTJMcnVEZVZUOFp4R0dCczg1VUtZdE1DSDdpNUJl?=
 =?utf-8?B?RExORndyTVBKQWc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8e9a57a5-d1d1-4910-a0e4-08da0075fa44
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 20:06:33.9758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB2728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 20:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162864


On 07.03.22 20:42, Ross Burton wrote:
> If we expect users to extend this we should use =, as otherwise a recipe
> that does += will replace the default value.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/pip_install_wheel.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
> index c1680a24ed..febcc8e445 100644
> --- a/meta/classes/pip_install_wheel.bbclass
> +++ b/meta/classes/pip_install_wheel.bbclass
> @@ -10,7 +10,7 @@ PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
>   PIP_INSTALL_DIST_PATH ?= "${@d.getVar('SETUPTOOLS_SETUP_PATH') or d.getVar('B')}/dist"
>   PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.whl"
>   
> -PIP_INSTALL_ARGS ?= "\
> +PIP_INSTALL_ARGS = "\
>       -vvvv \
>       --ignore-installed \
>       --no-cache \
> 
> 

Hmm all of the classes use ?= and I think for a reason - this isn't the 
fault of the bbclass but of the recipe in the end, as += is known to 
cause this depending on where the additions have been added (before the 
inherit or after it) - I think the better way would be to use 
PIP_INSTALL_ARGS:append in the actual recipe - guess the fallout would 
be way less than the one I expect from this change.

The big question is if that should changeable by the user or not - I 
personally think it should be

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162860): https://lists.openembedded.org/g/openembedded-core/message/162860
> Mute This Topic: https://lists.openembedded.org/mt/89621292/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

