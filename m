Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E84C3DA5D
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 05:51:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.35])
 by mx.groups.io with SMTP id smtpd.web10.20418.1721541096302061194
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 22:51:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=czb0WDu3;
 spf=pass (domain: outlook.com, ip: 40.92.91.35, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODmRkFF+1ZypADEVrI0mMMg0uwjKnPheM7hCdNIGxBLUCNxZC5LnFFZJijLtwtRCvY64sEaFtfvTUS9H48cQ7UQ/DD1hRTpuEs5fShU6JuMJdbFHpgl98s8P2ztNlA4LJnqyeauJuwdX5i56amwmxrZZ4M6pGkE/FILxjcuo1zMioiD9vRoq9evRcfzODooPf2RgOOEARQ17AktpCLDTPIX1Vr5HMfgE4xJFfvahbflaFIK283XxK6IAX6qxmKg79NMIcoSMrCQ5KFUSjhPosMv1ETX6GDXi4SJ5l4QKNydzwvAl66Cu3Q3218vjQl+vy+uSqAZjUGYG3m0gUBCqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1obqkevjcD97nUryRp1WscvLSFkL5h3U/kQ5FmwCO5I=;
 b=DiUgZbzqRCkqogpDD56LLjJ6xFo1fuUaAaTyk11sin+3aJ/mLM/wxF1qXVAeU5eoMfChFzGBCweYwn4OcaWuiDqmjxpzwUlEOqE5bjwcp+wNsRg0mPUtxc1QnAf4R3qeii0kqHfeZwu1mx2BCG0qpJbqVlKY2Z0VUGJTTLbunnhJc1giqbbbgYPzbHVFSlMdpdzcsAxcwYKb3UNRLAIpFBNGqmfCmIL50uNf4BZAhWPGkC3v10qoFguR/E+TvSyBDo0TdeUMlWXCOOwyfDjcrPHkGLJajZZgJftDWV8q7ZalpA2FNwgH+cF7yrrqbLd/LqOIWC7cN6OQ3iqgGY/rvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1obqkevjcD97nUryRp1WscvLSFkL5h3U/kQ5FmwCO5I=;
 b=czb0WDu3O4KZfa3tdwR/4GvCp8VeT4Xys1cufyJMbMqDOw7KVr4po7RKrKLiq25wUSj28ymg9PzCsb084C/gd8V835qc4FIXfkxJ3I3pB6akpjCHN4lzbKVVlqpKfF4VvQggA2MaYunBW6eGQsRDo0IZN6sn1ripAJZfTTTzrNOxcClu0mlfHHZlwDEqRFzyR19dPt/hHiYQHO/bRUiLvkc4aE/XuaQaKSggs0hvxwX6BYm3nQ8+CkIDpy0HgUE2G79BlUfQTvegw+iLfSQ0dD+E5Trarx8WAOo8QZRjr+dBmWY2t2gW0t943JjdJhliBd0KG5fo9GjFhGb1+KDSuA==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by VI1PR0701MB6864.eurprd07.prod.outlook.com (2603:10a6:800:198::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Sun, 21 Jul
 2024 05:51:32 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7784.013; Sun, 21 Jul 2024
 05:51:32 +0000
Message-ID: 
 <GV1PR07MB91209FEC429521E9A565F7EEA8AF2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Date: Sun, 21 Jul 2024 07:51:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes/flit-core: fix dependency loop
From: Konrad Weihmann <kweihmann@outlook.com>
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: Ross Burton <Ross.Burton@arm.com>
References: <GV1PR07MB91206A63390D43C3F32D7118A8A12@GV1PR07MB9120.eurprd07.prod.outlook.com>
 <3D92F9FB-177D-4E13-B21E-2CC9BF2BEC9A@arm.com>
 <aa1a368e-175d-4fff-830b-b94b1ef78142@outlook.com>
Content-Language: en-US
In-Reply-To: <aa1a368e-175d-4fff-830b-b94b1ef78142@outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [jUPIREni3rB/huYq2XGg6p1nZol0mqiUxPuVJzj2ytGz3ndVAzPSkfb5xOsLOCVp]
X-ClientProxiedBy: BE1P281CA0394.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::29) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: 
 <215f93e2-3b28-4b3f-a89e-3e555a0e4ffd@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|VI1PR0701MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: ed64b86a-0165-4e4b-105a-08dca9492b66
X-MS-Exchange-SLBlob-MailProps: 
	AZnQBsB9Xmqyyf+cGoeQ3Ulm4AiLwQwdsvW9z2WZv7aFDy4qHqvPVgK8ab2DyzXfm1Fy0LXFD8EeUA4QFQOVG6vloIN3Ak6yOFIyUr6wjJuKmiZAnCM50B9a88i6P8eDiDa1ZJxzNbY2LhT4lRDI2chGQVmi6Y24jKHi5V5UbJAmiIuSXR1wtHZKhGacknVzqJw+Ocdy701/5nsB3YwgqgEpX/87okwkXf1Oqtf+ZLcw22iyDGn0KkX/GblVx6hIPfU6c4MXU+y4rsrJeBEkjERfvKYpJygRN34BH0OgKYS+PYoZDkRVywiUK0sW8wX3+4ts+NcPfb3N+L1C+iJ3DpBcZaZ28yfvvjJsRf5lkjZ4S+/D8L5UhaQUnVstdveHfHllr8tUdXYQSOVtYR167sDoV3qMTOFZ9vJAdY2HPNfMVSmJzg/OUMCQ369GWv++xYktD+via9h+xMmrcnLCNwQJRPiEOWxIjmntGUHABbcHI7sgrLULmLkca/FoZ4THJe+bxfUAU+ePPjZCk/D6asz6J3Hqnz3XDi2ZVXLrXl92tzPsBxn59osf6q5slxKYMhogFqYd+/oOOYtSg4kGnn6Hie9urkO8+TU027twwVzi2meCiW4r9lVu5sfHQHCBUqildccU7sjxhsnR9NjcOqjdxIpPC/7o10SZPEo1W8rAMZJkHKzq9B4asl/9urXRfZSARPfFjY4WaYXhXF2KgtS7E5wV3Wu5t8I9LV44SXl/WpgoLaoXqPcOcwaCOlBPDaI5sPRdEQk=
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|19110799003|461199028|8060799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	isGqadLb12yrbnUogpdY3vQkHv28hbMVC09ZMxa4AlO5mHFk9QLioKQRnf0m1srsWCC+hXyt+aeK2wvb4eBTCAJWptm6YRCcvklk5ByfbXsBRFJm7VEjijvUTjnArC+RDMHzfI+rvE6d0fNRuPZz1SJuLAxYlt8TnuanBdJ82YFYa59wwd0NtGJNpMi0U8YwpFnT6aOcx665O6KGgj+NXb6VrQgC7CTc+FBTqcnVo2tQHIbBoKOUbWoQhB3gJCKydTPGGGt5GgY0MFEyb/Cd+7MTfuXHTUbPWSj6Up1Bza3pFPGAAJAB8BJ4Ck/NyRY3mQHw0UCHPBewpQ8RawApkOehpRmx6TmVoNQ/dGKYFUYdVT7eusgYaEpX71Lmrh3celGIYn4P0YmaNo4rKR5onqNZUHzqU5M0vHVzxKjCcvZZAgEhwkk3owmCzfK70slUwY7jUimcP75cUG5MVritdFJBZznw0LQiJBOGAUA0VQ9aUaT58FtDY4khRlDQ3IinedksH0PZlXjanx3/uNoCnZI1cjqve31UQVt9gSFS/JQ+snaIM1dFIyF8Mb5UJCpdqAyb2GR2eCutVKEv9S9pukozojT6I8HXbq10XQLpsodW7eWjHHD4iUa+smQNsPL4qt/TCb+hUen/gMm2uXeRlA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzZlYUlFdkp3d0w4YVBCNS82WHh4QUk2OHdsU3h4S2xLbUkvaSs1Tm10NGxC?=
 =?utf-8?B?TDVMOE9rYWNCNWVOMFh2WGhTUkd5UUlXZitwaXRKSGM1TFdmV0s2K1hhZUJn?=
 =?utf-8?B?QnV1MEhsQWcwWjRoTzl4TFNZcDJoUk1IOEp0dWRLd1NLUndCeGJEWmF3R3FS?=
 =?utf-8?B?SVdBSmx4SFk3NE1odzQ2anNCMTRNdHVzTWROaU1QTFhNbVZaVWljWldEczhs?=
 =?utf-8?B?QUQxZFNoR09NQ05uUGFvZElGS2dzck5xQnhGZlpBWHhhLytGbHduK1NTVDRX?=
 =?utf-8?B?QkdDZEpBMDRxOXJXTmJrL21MdURod0c1RVZvMm9TMlQyWFZzZ0xrcVg4akVQ?=
 =?utf-8?B?S3I3Z1creDJPU3h6b0dEeURBYlo5QkxhZUp4OENlSHFnWkZsVlNRVFN0OXcx?=
 =?utf-8?B?bzBiM0xhZnQ2Y1FYbHZ1VU1GaHlPUXlVYUlpV0VjRExrczhWL3daZUQvdXM2?=
 =?utf-8?B?dGI3VnJndktWQTNGTmtLdEJiSlhRSUZxNW4wUjNCaHRBNitpdXF4S3pCQTdj?=
 =?utf-8?B?K092WlhGYzNUbkQ3WDFjOHhLMVUyNkNudzB5Rk9CKy91OWJxbXpTeEdua2ls?=
 =?utf-8?B?Y2ZqK1JIajU1cUtkV2RuOThBUGE0cU5abHBWM21Ic2VJaElGaXJxd2dHcG1y?=
 =?utf-8?B?aGwvbzJJdWpJUU41WGNMVlVXd1dIK1hvUXc0UEduZUF6eW5oTE9nQjlJY2Fx?=
 =?utf-8?B?S0FCRU1aNG5UY284OHlQa1ZtKzZmdXBXZCtacUhHSTVaY1ZaN1dSdzdrL1JI?=
 =?utf-8?B?Zjl5UmZUZTIwcStzTm5PWjlBWFd5d1hvcXJsR2VmQStnQUprbkpBOUQ2K0pY?=
 =?utf-8?B?azFZdWR4T3BOQXVBVHZNTnNQUVNqK2p3alBSWkszM2VqV1RndC9nVVo5Uzdi?=
 =?utf-8?B?dGRSVk93elZzazdJS1JVZmFGM1FnL2xvTS9JWk0rOVovNnQ3VnM5ZEx4ZjNO?=
 =?utf-8?B?TzI2V0UvMGFkM1Z6eUcvbDlJY2NrekxKcHVjZzdrZkpLMlNEeml3ZGNBbkNu?=
 =?utf-8?B?b2VkS3ZnbUUrd2I3dnBXZUhzUmh6VmU5N3M1dy84Tktnb3pRSHB2TmxnQ0oy?=
 =?utf-8?B?a29xSVNPZDY5cWg5Y0QzbVM4VHpYWkxPdU8yblF2STB5OVBnZDRySFV0eU1w?=
 =?utf-8?B?K2VucXRqeUVwRU0vUTA2WWRLZ0lmeCtBcGVYdUV1UnAvMitKb1YxckhLOEQ5?=
 =?utf-8?B?WS80NWs3T3dMUHJkN0FNWUVhVzJQbWg0V1kwMitHSDdVQ1NnMUQ2UGlwWktw?=
 =?utf-8?B?NHlvQ1M0Um5ZOTk0eTdyOUI2U01LemxkSVc4NldxS0l5dW9iMFJqUWFlMTdC?=
 =?utf-8?B?MUdiVGdOM0hBM2pUQWtzRndsTmZGdFFLam0yNHZ0bjZ3Rm1JYzNQSDFPYmkv?=
 =?utf-8?B?MWg0MElMSVdubEpubE9sLzZ1SElEQkI3ckw2Z0MxaExwbldBWWhNUGxXd1Aw?=
 =?utf-8?B?OStwb2I2YmV6VERyMFJqQ0ZaZEtVczhUa2NRL3B4ZnhMdE5TTVIzMDh1N21K?=
 =?utf-8?B?eDdRMGR4c0hFZFVHa0YzUXA4cm1MWTRkbndDaFVZR3lJTFBjMzBkbVdOczlR?=
 =?utf-8?B?YlhsUTdiSDJ3NWxWbkozWFVxcGlORWxYZmp3L2wrY1YrSW1Lc2htbGZLR2VU?=
 =?utf-8?B?OHB4dGVYMkZJeDFnN1RsTTR6bVQ2VkQvVVdTUWMrZDg1dTMwam15QU11WTVj?=
 =?utf-8?B?UW4xZnlkOG9BbTJmV082QjlBVTVkUmMrYmlKRXZMNVo3bUIrWkRxcWJzYkF3?=
 =?utf-8?Q?I2QbKIE8sjkWEfya7M=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed64b86a-0165-4e4b-105a-08dca9492b66
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2024 05:51:30.7169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB6864
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 05:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202293

Anything preventing this patch from being picked?

There wasn't any feedback after the last reply.

An alternative would be to drop the python3 depends, as it is set by 
setuptools-base class correctly already

On 16.07.24 12:54, Konrad Weihmann wrote:
> It isn't that obvious, for the loop to show up you would need a global 
> class that DEPENDS on a native only python-flit-core built recipe.
> 
> Test to reproduce
> 
> python3-test-native.bb
> 
> LICENSE = "CLOSED"
> 
> inherit pypi
> inherit python_flit_core
> inherit_defer native
> 
> PYPI_PACKAGE = "test"
> 
> test.bbclass
> 
> DEPENDS:append:class-target = " python3-test-native"
> 
> local.conf
> 
> INHERIT += "test"
> 
> now run
> 
> bitbake busybox
> 
> e voila a dependency loop.
> With the applied patch it's gone.
> 
> Fun fact if the python3-test-native.bb recipe would use BBCLASSEXTEND = 
> "native" everything works well, it just affects recipes that use 
> inherit[_defer] native/nativesdk explicitly.
> 
> Nonetheless the target python3 dependency should be fixed regardless.
> 
> 
> Konrad
> 
> 
> 
> On 16.07.24 12:12, Ross Burton wrote:
>> On 15 Jul 2024, at 13:18, Konrad Weihmann via lists.openembedded.org 
>> <kweihmann=outlook.com@lists.openembedded.org> wrote:
>>>
>>> when using python_flit_core on a native recipe
>>> it was creating a dependency loop, as tasks for
>>> python3 requires tasks for python3-native,
>>> which is essential for building any native python recipes.
>>
>> We build native recipes in oe-core with flit, can you give an example 
>> of how this breaks?
>>
>> Ross

