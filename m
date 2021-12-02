Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C29C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 17:00:02 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.41])
 by mx.groups.io with SMTP id smtpd.web12.11186.1638464401117914774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 09:00:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=T9+HV1Ts;
 spf=pass (domain: outlook.com, ip: 40.92.65.41,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbhZ1lsV6JGsUqf7DW1a0YEAsH3KyzTIZEpwOokoR1pzH433UC/Qf+PgxaN2Mrd58q2wAaSs3OzQOO4vqn3H4VPsv65CsVknH3wDx3shzjGAcgbrqdmfomc+cdfUT79pKn9GZ2fxPj1/a4onXZYxGYYX1hmkg5r+QHqnQZk6guCK7X6HxCifK/6Z489chQ5N5R9yMtcHd1QfuGPbntYIAxt/S7Mo8vBSggbMBnqQpYJMaqXmIdRQT/USqEOWJGRxFBDfgJtGnSAPYCyMmiMSd8nOAKIFVUG+JqaAV7l1XcxrEpSGU5sQ0aoMq3uBf1ZrUex+azOr2o7+GqgD3/gpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMp0aVx9JpSlivFa8uJs6ZBnerfFCwPgH1JjyxkQmWk=;
 b=UVxYpjRW4YaAqFlG72wwJ4qlWpCFcG9XONNdZSSZ/8FcxsrkrDhh1UMGPA3+s2pO7UeliV0qP/M0WhtOPmm4/l9ZZ2do22R9MKiXLRH4YeCyBEkBODOXLBG6SYtDvrxoEUhgAs1zMNDFFBKjKI9ZksY+IO02RlSwLTyvrX74Zc5tjI/R4xxCf8G2V6dtEfRQ9/3vEFVjA7syM/QDCxd/yHWKSDRfPj55HVcMesKNZB9hoqNW+MKkpoBrJ0Hw4epdgxcVLFYrvTCqc6zXDUEh50OjnJcUnph82NkYRMcCA1YAMCJczLi+15Y6RHJ6K5jtkjQcnaNtkVY30BSjoYjoDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMp0aVx9JpSlivFa8uJs6ZBnerfFCwPgH1JjyxkQmWk=;
 b=T9+HV1TshzYL6d+M94Y9ENbi51swo5S2kwehDzPs8b07XyM4f3djwRA6AVyTlAb4mVi6C2s9gg33g5zuE2oj5ANKThEL6zEqBxq3qSuTrZ1Bdtwfg1T8J61h19OqrB4cHwpaMmK4BvUbaXipHO6k3WEW5/N7EkgSOlYDFBuJrW1v2p/IWDXBtgzqJgUBCh9bUaFvpRAKgvztd0PRzHy81Saky5psIvoG5+dSVohq8FehQeG9nymX8DbrP0YwDLhyTKCa3WJ8dTf6nohCEF4Ib2+dT7LF4QP2qSIowbS8psMVbj2BZ1OHP8kDYpyZ1kh6cr5zNBPFT4tXGixrNdeHHQ==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2769.eurprd09.prod.outlook.com (2603:10a6:208:12b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Thu, 2 Dec
 2021 16:59:58 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::782f:9964:348b:b2fa%9]) with mapi id 15.20.4755.017; Thu, 2 Dec 2021
 16:59:58 +0000
Subject: Re: [OE-core] [PATCH] python: python3-idna: fix non-existent Unicode
 license
To: Khem Raj <raj.khem@gmail.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 Quentin Schulz <foss+yocto@0leil.net>
References: <20211201161335.3110181-1-quentin.schulz@theobroma-systems.com>
 <CAMKF1sobyDtHGikKGSdxgABdS1_qhRU1E2rrC7iDy66qpq1Y+A@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642C07FFFCFCDB1019A9B4DA8699@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 2 Dec 2021 17:59:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CAMKF1sobyDtHGikKGSdxgABdS1_qhRU1E2rrC7iDy66qpq1Y+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [kNQLxx8Qy/o0iIQf/Jn0RgXPPDBc8s8/+U/7MwRMTE9JIiniCV4OAG0JBk74RVN8]
X-ClientProxiedBy: AM0PR01CA0129.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::34) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <4f3b63bd-7ca3-bc62-6de2-c255281505c9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM0PR01CA0129.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Thu, 2 Dec 2021 16:59:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50b76c01-3853-42b4-f771-08d9b5b52c1a
X-MS-TrafficTypeDiagnostic: AM0PR09MB2769:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yANMqDnWIJNjdDK73XzEYtfWsxYO5KsezK6/QaHMcXGyRXfLdglDPtB5nraEbBFiPdQeNbpMnPq+CM59KRzBfkJsHxWLvXif/oqjZpyTS94cJte1cGWyjuTg7bmYtguGdwEGcyBkb32135XY/xs+nNj222dconqBxWyh90xp07vlDUbXyrU6Zfck2DJJkcgI7AKIwzARb5IehzxpNhel/lV/T2rA9HKQeqBGzuSJJD/vbJhEEti2nyYEbXC0ricOyi59W28QjqVhpwKcs9HjBAISF1wdqyeAWHO6jF0uGxY/E9SJ/sIP63Jchr2tobA/Y23zJ1HkrIlfuzD6+/QIlXl2mc400QkTQqPS3YU1ddq0L6U2+Z0XQZZNAk/S6kppQfDHTSonOcFOTEr9v/YUz9H9cYlSe1bOjVCtrJlxxRJZgD+2w47a6zEm2JNIEWI+Y17kDaf2Wxqv3om84K8KDO2drEY5v4WGXcok0Cp1zwNSFbUDfxxl5JW44lpBnXKEqo9I4c3oz5xLkwgNt1MOWMwz/FZbt6nv2Kp3jv+OI1qCDbI0YNsIl6rZHKJFRctxnoKGavFDfb5tfWTB2kNhmprLL40AA0AjqGzNiwICVIZsK7C4D5MhvOJGmC+mQvpL3391RhLnJm7S+rt8iadmaP8Up/B+Jf1Dwzw9rUfsxIg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MW02ZnV2dGJiRFJoWTV0dHk1OThMMzJmOGs4YVJoNnJhZDNGZS9YOW0vQzdR?=
 =?utf-8?B?S3BjOGFpOS8wbEJ4RndWdi9QbnVnV1RtUUJmYmtnTnRFYjA5NytXbEFmYU45?=
 =?utf-8?B?TXV2RXdRcElmRVpVcmFUYjErTWtrMDVHc3FoNXRFRTNHeE9LdlBOSGk2blZH?=
 =?utf-8?B?YmttVldMNndJajVkb1BYczAxcHJqalBPVStQMkM1N1hXdnZ6VFd2MnJsK3Uw?=
 =?utf-8?B?T3JyemVhNE9oUTh4aVQxUFJzckhCODdjc3A0aXJrT2ZOTVErdXJxa3Fva2pN?=
 =?utf-8?B?MHdxbXBIUGJBWWZGZ2daam51YWg5cDVxOE9leFkyS2NjSnRvV0psdFpRM1Mz?=
 =?utf-8?B?U2gyWkM0QkZhWEh2NlFwSUdLTjVwMEFBQTRmZ2krT0JuMTR1bVQ4bnN3U0JU?=
 =?utf-8?B?bys2YUc1OUh2TkZCMXM4UmhuTlloaVNUeWtzTnYvK2ZxR3RERWFKR3JUbXg1?=
 =?utf-8?B?T25XTFUyU1hvYmp1azdZU2pYUDhUekVJOURYWWdFWlRqeW53aDJmR01GNmta?=
 =?utf-8?B?emxuN25qSmJTNDRPRmo1Qk03ajNWQjBuQVArYmdhcXBHdUwyUEl1ZG1Hd0Jm?=
 =?utf-8?B?Q2ZwdE00bERHWU9FSmZCY3VxdFpSeWVnTmdLUFROdS9yN3FiYmVtUHl6bUM4?=
 =?utf-8?B?cVI4RUNoaHFwOEZaUnlkZW5sTTlJVW5CNEhjcCtBWEhNV1N1MURsMzltKzl5?=
 =?utf-8?B?NVMwK3pMQmJWTFNsSVpxTnExVk95Nm13ZGdMRUNod05NL1BkZ3EyUWNxc2Nw?=
 =?utf-8?B?b0xmbmpZalROTVFSLzFqM0ZkNmw2V0EyZXh6dUVJeE1ydEplZkM5SkVFOEkz?=
 =?utf-8?B?MUh2dU5nV2hFbWNSV3dXUGZRNkFoTU9QSlB1aUtDZkRLYkY5NkZGNVh0SkhY?=
 =?utf-8?B?cm0wNXlpdVJzOURjeTZObWRFZWhub3haeTZ6bnQxWTRVQ09OUlNSVjF2MTBE?=
 =?utf-8?B?c05ERnVRSjRwLzMvTkZySm9kalFIQW9vYWlsb1RjZS9wMm82L004ME5TR0lR?=
 =?utf-8?B?Sk1LYkJhdzZhZGJ5WnJuSkFwaVFOekRYNGJWOC8ydytrZ0FBNFIwM0hoL3p4?=
 =?utf-8?B?SFBQVFJYOGJKWi8wb3U3V21qUUs4RkhmQmJOTy9rYXNzd3FnSmozMWcrQXhF?=
 =?utf-8?B?T1RwY2xmUm5VbDNXakcvSWpxRmMxYm8wdURlMWV1WU9FK3l3dk52YXJaRWN2?=
 =?utf-8?B?KzFOTW4rNkNxajRWWHl0cnB5ZitWQVJXYXpIYjFzMnlYdlVuTlZ3NWYzNlhl?=
 =?utf-8?B?ZGlBem84TlZCeHFFWGlTYU84RUZ3a0pnekkrSU1tSVRKUjJNWjZGcTBPdkUv?=
 =?utf-8?B?TGwyVkpUd3IxaENpcXlydUQ3ZWd5azdLTS9rRWFUdTAxeUcvQmxSQTdQVzJs?=
 =?utf-8?B?ak5MU2JoUkFuRmc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50b76c01-3853-42b4-f771-08d9b5b52c1a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:59:58.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2769
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 17:00:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159094

I think the Unicode should be clear, as the tool (in)directly uses 
downloads from unicode, but kindly ignores the licensing part of that 
operation.

Looking into the history of that lib I found 
https://github.com/kjd/idna/commit/dd8841d50fd506a0b4986542c21fff32ba1779d1, 
which explains the Python-2.0 part. Not sure, but I think that one can 
be dropped now.

Maybe someone should raise a ticket upstream to tell them, that even 
though they convert the upstream unicode data, they still have to apply 
the unicode terms and conditions

On 02.12.21 17:37, Khem Raj wrote:
> On Wed, Dec 1, 2021 at 8:14 AM Quentin Schulz
> <quentin.schulz@theobroma-systems.com> wrote:
>>
>> In addition to not being an SPDX license, Unicode license also isn't
>> available in any of the LICENSE_PATH available in openembedded, meaning
>> the following warning is printed:
>>
>> python3-idna: No generic license file exists for: Unicode in any provider [license-exists]
>>
>> Unfortunately the license is not really explicit in the project. After
>> looking at the code, it seems that this license gets pulled by
>> idna/idnadata.py and idna/uts46data.py which are auto-generated by
>> tools/idna-data which downloads data from
>> http://www.unicode.org/Public/{version}/ucd/ and
>> http://www.unicode.org/Public/idna/ which are covered by
>> https://www.unicode.org/license.txt as mentioned in
>> https://www.unicode.org/copyright.html.
>>
>> Comparing https://www.unicode.org/license.txt to Unicode-DFS-2016
>> resulted in a match so let's point to that SPDX license instead.
>>
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>>   meta/recipes-devtools/python/python3-idna_3.3.bb | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
>> index a0e6b79a56..f3c53a8717 100644
>> --- a/meta/recipes-devtools/python/python3-idna_3.3.bb
>> +++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
>> @@ -1,6 +1,11 @@
>>   SUMMARY = "Internationalised Domain Names in Applications"
>>   HOMEPAGE = "https://github.com/kjd/idna"
>> -LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
>> +# Note: Unicode license is pulled in by idna/idnadata.py and idna/uts46data.py
>> +# files auto-generated by tools/idna-data which downloads data from
>> +# http://www.unicode.org/Public/{version}/ucd/ and http://www.unicode.org/Public/idna/
>> +# which are covered by https://www.unicode.org/license.txt as mentioned by
>> +# https://www.unicode.org/copyright.html
>> +LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-DFS-2016"
>>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
> 
> I looked at
> https://github.com/kjd/idna/blob/master/LICENSE.md
> https://pypi.org/project/idna/
> 
> and they seem to indicate that it is BSD-3-Clause so where do the
> other licenses come from ?
> 
>>
>>   SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
>> --
>> 2.33.1
>>
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#159093): https://lists.openembedded.org/g/openembedded-core/message/159093
>> Mute This Topic: https://lists.openembedded.org/mt/87431709/3647476
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

