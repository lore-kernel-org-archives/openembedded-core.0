Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE923C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:46:50 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.40])
 by mx.groups.io with SMTP id smtpd.web10.25451.1673448405238701192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:46:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=N8+VKPT2;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.13.40, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElgR4f1QkMt+m92PX9t0G6OzuKXf2EzjS/kU5idXQeSA+CBPC6CbOhYjObJ+pe/xpt3N1BN6p19DW3w7Gl2y/9ht5UcLBw7/ttWlsEMXViBo9XhXHXYpa/5LEJPNO6JHcvhIIKDSQCnmB/vFppSoocBqe5oQssfD3Lgz0WYJ4UK/I1WYBMY/yIobyas3yJxOyYbuYcGzkPA3CUvYDR+8854jQZ71hAHimz6VvutvVtZe4y5f1h4Phn7P3kcvkbi42VcfYJJPRdeY7GxWOF9PNvlgY8meaFm2ImQ+jTeHT3sRqYQ7rBOUxVEZcyDiCdhQScT7pDReJqPf/xjUTQP8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lO9frcimHkhuVvzrdx4RHnRPBSOK2Y0KxIHBtbAvZQ=;
 b=WK0IiqRc7REXG4WkMkGstgGsJKhxAzjahKWpd/qomgabtMUSa+XV/pOzRj/TT9Agwp4mmTxKCr8Saq3DWAv4zoJwkNylDm8xpK85GC0UV8QKtFOsdAkNaDTa6UkUT1dpvao01Gxm/yL0jyuX4/XcPeAK8d0PdTW3kxXGQVANbv6GVhvRs0IQ9IIOnh3LyoZwcOFnWlB/FVl7u9IPwUcHsLAL80Jfn67AJB+29whQMyjvGE6A74F4a+knpyfnPflk2E4G99JIbR1GfGVU7DMll83aIqVxyBwiPMzjFNQDkEsbI0GJcmqDAMPMOwUrrzJzpxINh1ojFmx324CSvD/OWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lO9frcimHkhuVvzrdx4RHnRPBSOK2Y0KxIHBtbAvZQ=;
 b=N8+VKPT2VzUjvdwdv1j0paTcIzqkRdIGBhmW1J3CRPOCdlYz0VT2np4oamZJWGPhqir1VK9inp56Q/lJ1kkvWzRRhq2ktcdhgg37INpkA8sXWl7YmBagUz1hHq+lq2qbSGK+U+SJZQHTFhoLZBTyYqFm2V0rMqGg6u9CMEiiWVEuv0qIEfb26TeclmoPoG4hgbXdxu9D86da1Nups5mrdpBWXIGiSMTu/t3JjeRn7VS/122yoRVl77fdNEs51YsCt2AJqDhNYv7s5rh6jWYX8Gdy1o4M/mjiN2Vo4k5j3e3G0Sm9MAD4qYFvbu739oHGuxlSF0BFLSUIP4aYc6jTTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB8PR04MB7035.eurprd04.prod.outlook.com (2603:10a6:10:127::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:46:41 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%5]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 14:46:40 +0000
Message-ID: <81eb17da-946c-2f81-4176-d4202b6357e0@theobroma-systems.com>
Date: Wed, 11 Jan 2023 15:46:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] [PATCH] curl: don't enable debug builds
Content-Language: en-US
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20230111141753.1249071-1-ross.burton@arm.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20230111141753.1249071-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0032.eurprd09.prod.outlook.com
 (2603:10a6:802:1::21) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB8PR04MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 36516ce1-1414-4706-52a9-08daf3e2a668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	i3hJ6819I4/JQLk+T7kMSqxt82f+D7UMy3fkoReRJNPu7O71+XB3Vq52eHVcfjlERCDD9J2KGdejKb0QOudL8Ur8jXROC5y6wjBYrMusgChGoPt8W4C9ZmSjTRp9cBr433E1/7V3nvjV1JeQeWPpEPdquojiAOrcQoiKaBQDn+qxfWboWggP5HrrxttAL7Wgu1IEitJGvk3EJ7xHSYxttOhWW0B7GHRJWfjtx3kOJ8YODJYSyeykLyqHt/lL3mcVECVsPjNfZx20sVcUY1fjLn8pneIPBZspzFbY1mdccYm8PXogjSE33+D/Ju82aFmAkjrPnStXG+I792v/t3Lgq7gm2j1gMNSq0yaPWKWjEdVM6fpkKgZhTrGLu4tPN+045a+aUlL8lGwrJmpQ1wJqfCpXOO7Jx4FOg2DG5FvFxfKYNhGypp4GM/6h79vA/8QTNWHQZTCyILYVckzSjnTrIFTsVXQiaFwG7oFZSVMkRw+qYtCmKRaXQuQsQaU9ZIA52K+nMluOVxdHk2xRclgQ8I/ypUZJWQ3cHr7oJMceHlpz/CalH6UXBUm8uXgJxo7bfeKpPktHoL0eG71lq6GcFc8gMrxWcVdlZNtB15BzTYDM8RSs32s+NjL8V3l2CbuPwZCjwX1vPFBaJkzICdFHXU5OKtLqTO1Hs+9exgM+ntSVb6JU1Di6aq+1iPfhBpajs1SHH3HDhh3E3MfEN1VeGo4jdyIQhBSKXizQi3BKikyzt3T4i9sOeZ+7ZOKQCW01
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(136003)(376002)(346002)(396003)(451199015)(316002)(5660300002)(186003)(44832011)(6512007)(6486002)(966005)(478600001)(2616005)(31696002)(41300700001)(66556008)(66946007)(66476007)(4326008)(8676002)(8936002)(83380400001)(86362001)(36756003)(53546011)(31686004)(6506007)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b3J6bWVMSUMwSHZkRHhJdXpHOGYwWEV5ZVh1Qi9VM0tzT0hyNFZkSnZwMmg2?=
 =?utf-8?B?SmpkRk45NU9TdUFFb2NZZEN2U2dDMlRvSTVROFZ2UXpUb2FGMFFQRUwvTjYy?=
 =?utf-8?B?cGVXb3dYUkMxanpUK2VzRStRRUtoemgrNlpYY1RoYlZqRXN1M0xYUTZpM2R3?=
 =?utf-8?B?QmpMWDQxcDZzWXJQM1dIdEJLSmFRUUo3SmVlU09HSVRGaTMybThpdi8veFBt?=
 =?utf-8?B?aWE1OW12QTRvR2kzZnE5MC9kUnhxbWlIajQyd2o0bUV1YWplWXd6bnNQbkZl?=
 =?utf-8?B?WnV0a1VYVElpM21KRUpBZVlTVkJZTDJjRU0veGhldnFLWU5HQzRad3BWcFgr?=
 =?utf-8?B?TU1GVkpYWnB6d25hbm9BWnBOUXgybHBYZVNnYUFrZ3MxVlFqTitERjg3YzFj?=
 =?utf-8?B?ak5jZUxNejJuaGYxYjQvdCtKV3hhUE9UYzJSQ1ZtaG1vcGNGVWQraGdBbHht?=
 =?utf-8?B?OGtjVGlnbHJmZTBvSmQ5dXd6UXQ5QTJMQTAwaklxeGV5VXYxZzAzY0I1cTVm?=
 =?utf-8?B?TkpZdVNEUzBXd1NiUUdvKzVEelZxZEQ1c256ZmhTUGIwZ1RBTmwwWGFHNjhr?=
 =?utf-8?B?ZkRSSmxpaUkrdDJXak5MbmE4ZnlvZzBETVROajRKbnI5OGZEclhMOVkvZkZV?=
 =?utf-8?B?bm9YM09wQXVIa3B1ZVgwL0IxamNEQXZFSnhoMVJZSmZsSGpyOEdoUzF0OUlt?=
 =?utf-8?B?Nlo3U2grSHozMFVyTFZRT0dHeXZzdzNFcUJUU09GbURkU3o4TmdFUWdtaVZq?=
 =?utf-8?B?ZnFBTDZNVmhJYytUajVvRE05cERWNGxHdTk5K2dDMXFxK0swSHh1dVhNL21H?=
 =?utf-8?B?eVRiRC91TG5hdnVaRG8yaGJ1REhYK1lKVDNmSjNTY1Fra0Izc3NVMUJKWW5v?=
 =?utf-8?B?SHdDeUZIMDdmdXVQMkc2UU5vT0xJREladC9FVU4xd09HT1lJL0lWRTJXc2lM?=
 =?utf-8?B?VjkwZjBxU2JtcUhDdlR1U29Rb3JOYVZsek4rOUxaVFI1N1V0MWduYzR4eGsv?=
 =?utf-8?B?MWppTkNEY1ViRkpPYmdaaEg5OFhQaVlXN0lOdmhIV1FUeGsxa0loOXN1MHN4?=
 =?utf-8?B?UzE0OHl3Si9jR1FUL21ER0ZaQ3BuRzU5WFFKZHZYaTdLVkFPMXJZVmNCTHBN?=
 =?utf-8?B?TmtCRUk0dm1Rb09tZXlxczZxb3VBMVpicXVJd296bzJMUHBpL1hxaVhIb3lh?=
 =?utf-8?B?VGhvcU1RREpISDJhVVlvWHpqMlIrZ2FHSlRXTFBCeU05S2ZtOTFxeFd3SkVQ?=
 =?utf-8?B?dVZVQS9veUZyNXJ1ejMzTTI4TzdkdEVEMFhnUlpZNVpyaGh1akxWdXVXaFV2?=
 =?utf-8?B?UXBPSFlRa2ZpTG0vbEN5ekdjekhWZGZySzFOL0dBQ3h2Wk5EU1NVK0d0Uk5a?=
 =?utf-8?B?K0pFVktUMkQvTzc0aWh6MEVHNkdkbUREMjQvK0ZhR25QOStUSEwzZEpHSisw?=
 =?utf-8?B?YW9LeHVwenhXSExMd2c0RER1USszYzczUWxsQlJkRDBnUHdYYVRJSURFTTdj?=
 =?utf-8?B?ZGFHODdmZ3RTU3NBcCtYaDkzUW50TXJ2ODlsSFlxTE9FTndrLzFQeU5Vcy93?=
 =?utf-8?B?Z1JIRlZpVXl4V1RtdVhjZEVvM0laam9jWHoxczhtS2I5WGIyL1FSdDE2Vyt2?=
 =?utf-8?B?ejlGTGRRK1NZZmdoSnpRN3REb2JoK3FWQzZhQlNaSzRNN2JsYm4xUmtHS0NI?=
 =?utf-8?B?OEtXY2ptNVpDU2RqTmZYQkp0UnJSSzJOcXZ0LzhEcG9GMWtIK0V2TmVPRWNL?=
 =?utf-8?B?YVUxMngzV1VIZFBVdUNBMHNZREVpTTAxcEUvdC9XdTk4R09mUjNDWjlSTGU1?=
 =?utf-8?B?SHFFcUpwZW1zVTcxQWNpV3JDdzVVR1FHcVUxUGUySk5iU01qK2Nqdjg2SWYx?=
 =?utf-8?B?S3lyeUhQdS9jWU5hVE9YSmw4YzZqUGIxeklGck9GYlI5QTRRSGlZM2xWdmNW?=
 =?utf-8?B?emFyMTdIWjg1QzZvZThHdlYrbEJJOGwxNFFJVEJCam5pNWk3Z1hSQ1Y3RGJJ?=
 =?utf-8?B?d3BUWEMyVEtwelFnWmVXQ3BTNDZUUmFsSlYyZzVTMEQwaXFBY2R0eDlBV0lX?=
 =?utf-8?B?VmpZSmFmd2pSRWRHYzdWakthYkZ3ZGFHZjNkbVlmVmFUaHNEb3N3Tkc1L081?=
 =?utf-8?B?NlpRRk1weTVobWhvQ3Y2ci9NSmpLRlJ0SEJqTFFkb01Sdm9uZzBicUcybDEz?=
 =?utf-8?B?czJEamw2ZjlWTVB5TUxJS0xwd0k3ZDVVZ292MWtzRC9QOC9CN0UvcjVYdUFt?=
 =?utf-8?B?RTZPVzB6WTR1ZmtlRFdPeng5cUp3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36516ce1-1414-4706-52a9-08daf3e2a668
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:46:40.8546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PptmRHTJgF9qqnPJfDo4atEyghJovhUV5gX//5/TekNpqWjk7HgZFvnPZCt/u+Gv5XJxnpVQoFUR1gOB/uNDQrF4UrqIQVMl86O9QhP9K3RZCafGzi2j8gCzHojlrVMS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:46:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175750

Hi Ross,

On 1/11/23 15:17, Ross Burton wrote:
> In oe-core 27824261 --enable-debug was added to the configure arguments
> to turn on debugging symbols.  However, enabling debug mode does more
> than turn on debugging symbols and introduces some codepaths that can be
> controlled with environment variables.  Bluntly, the curl maintainer
> says that --enable-debug should not be used in production:
> 
> https://urldefense.com/v3/__https://curl.se/mail/lib-2023-01/0039.html__;!!OOPJP91ZZw!jMBUWN09d9qh5ERXzeSectyn9T7uX0vl50AFyD3lmFEPTECVwbRqWi6LWeV2NdnKZMWF2rZtDMtAe08Lsb_e3phBQgWpikZIzA$
> 
> I did a build and verified that the curl-dbg package doesn't massively
> shrink, so the debug symbols are still being built.
> 
> Remove the debug options and hide them behind a PACKAGECONFIG, with a
> comment that it should not be used in production.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-support/curl/curl_7.87.0.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-support/curl/curl_7.87.0.bb b/meta/recipes-support/curl/curl_7.87.0.bb
> index a3ad66f1aa3..9956a284228 100644
> --- a/meta/recipes-support/curl/curl_7.87.0.bb
> +++ b/meta/recipes-support/curl/curl_7.87.0.bb
> @@ -32,6 +32,8 @@ PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver ver
>   PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
>   PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
>   PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
> +# Don't use this in production
> +PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"

Should we have --disable-curldebug in the enable path here? I see you 
remove it further down but it's not here.

Cheers,
Quentin

