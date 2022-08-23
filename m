Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC21C32774
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 07:05:50 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.72])
 by mx.groups.io with SMTP id smtpd.web08.28858.1661238346515798974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 00:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=Ji0WqZAx;
 spf=pass (domain: outlook.com, ip: 40.92.75.72,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FcpLFR0NF8ZoqdzEEtwc4N7L/ElK3/FmwmR/YUDWwZG53AJgjGNLfE+WFF0pwGV3/lo+A4jaFhHDQryysRc6LT1AOx1d6m2tTflDnKB5qE02t92vGtRej8kdZlN84eJrkTUOuqgrGOq3QtJ8jzmLwRQfoG8DP7SPdDx4hw47DjZHRfTdphGFKi2J1NvbiUwcjy/QnpaR8F2wLHxS+Ji/P4qB5q51mRuG1mUG+mLBojcIAPutte5XVOwfUFRUgIcwRbMrQoFgJCuHrqyMf1ZoTTiXTGfmv7StN8dDs/kFOy8xtcC15pr8rlfYLMweFhWQnXqpoOUwgTaRTf6egaupJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xh8fMFydI2gQ1B7mbPKwG0tP+oMBbkqrwqJzL6Pq18U=;
 b=Cv1QnVIilYm+JMqebmAdLi0ibuMO45qoPUG4rJYLfaehyvsiksWpIuUiCFc3ugDJsN+h0NW10NbKGvWLAPM9dLpdVFpHWotHhqiVselaHUzELi+9y5+xiFI8CIA3w6pgAIBRaqskdML8NFiEI59cdafQjme0V8S2kb93aOkQ8l7R2GPEUQHWuR+3meK68ETE1wrE/4yCCZwRZldo1+DThvHFHeaXV5ZuBpNYfh4CXvgE+5eRP1lLA5wQt6QXlIr8F2h/6W7geHExGfUitEirFbYWBkxHE+Ayf7DFY97sqrma4uLY66D0D4fZYochMWS93f+hEJXilNBS30CxHKoj3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xh8fMFydI2gQ1B7mbPKwG0tP+oMBbkqrwqJzL6Pq18U=;
 b=Ji0WqZAxWkpIHQp6GIpZw5V4dzkoj6II+yf/kIIvKTuE1MpxcG/Zy71RLR4flM6hs+yj1KRYjEFfbGhBCZ924Q4butetmchMNxRdmcK0oWG/f7YRqSpgCq8f2IwIGYvLzFqcjOMVX6WtFWy0XMsVeZdJHifE698RVz8BCQrYMr+ZdhTda7icAplNjwUx1GoUBHJtID/ZBDNpkvJdqN8CA0a0pExan9df2J/AoZk/o+ZSlabzYnkawbULLwEyJma0Xz7lejQv+Z8aNZsReOLlbYw4Tmc9swKegDQkmxk6RvSq1Z/VYR+IErRe+sIKlZfVScGXyyV8jghFefVlNCnozg==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by PA4PR09MB4559.eurprd09.prod.outlook.com (2603:10a6:102:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Tue, 23 Aug
 2022 07:05:43 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::59ac:4256:4338:1fb8%5]) with mapi id 15.20.5546.022; Tue, 23 Aug 2022
 07:05:43 +0000
Message-ID: 
 <PR2PR09MB3100E3D0D4461CF4E8480A6AA8709@PR2PR09MB3100.eurprd09.prod.outlook.com>
Date: Tue, 23 Aug 2022 09:05:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [OE-core] [PATCH 1/2] python3: add wrapper for native
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: 
 <PR2PR09MB310005D5AE7E68AD1153DBC2A8719@PR2PR09MB3100.eurprd09.prod.outlook.com>
 <CANNYZj-B1Hmgi+XwbbSRPmCyHg+R6ee_XjJpRS6Q2dYKVnXvWg@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CANNYZj-B1Hmgi+XwbbSRPmCyHg+R6ee_XjJpRS6Q2dYKVnXvWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [cfVPNS0eZTm8/vkt6RWVMKxKhbCH8+pD1PygVGaDB7jA9rNznUYInAR2t3jgyoR7]
X-ClientProxiedBy: AM6P192CA0009.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::22) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <29db0d66-42a5-2f89-6dc2-fd82b4160312@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 714e0f42-4aeb-4b09-111e-08da84d5e50a
X-MS-TrafficTypeDiagnostic: PA4PR09MB4559:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8TShfbDx8snXZknyiai9+oPEPS5rCLqODcdRlwmwHPFL0mAHtqiH/y7pUoBuFislDIlz2l7wt1kCuAasWxYjhKh9nU4FPPDM4OqxCKQsRoBRptlPZHwJbYp4nVZWrUf/RDbz0QdFsxzYiSrvE6xWVW7XlJDlrWC5w5aLwV8+amZqOxnzmoBNw6NdGECYUV+bQJElLQ7oOu80i/A6nqVboBH4ZgQQtKejDSPxsC4Q4uriMzIUKIJYHiZsWvn3RUFLd+ApL+LSIB17pMddO8ePNO0d3MtyGU6MyU3/d99KcHKrpB6kDfDLj+jpHm1y031Malaen4+v5afvHT+p1PD9iKLOqMWYqojdUhpgIo971a++gZEWWdANsuhTJikRRwep8Z0z83qPYe6+D2wMTZwEqTWPpGYAYAOWdOYxXg8Jz/gujDVD1PISfPqGRn82xBEDTHVSX3l8mkf7qZwEmcmX8d2fB/pFn+29MDsYDJlLj+LcWS8Y4xXCkS6DP83FrYRU8vhZTIMYsM+Sb7Pz4PT4vl6QDjyz1e5+/Eifggr/opQVv7OkS8xC30xa0Sao5UhoH66W88X9uNYMEL0Pe6u48jgoIj1KrplIRXhx2prhaD2nJQd7a5rOV0+yeknCrzrLmlH+q3Nq6dImHJ/X3vBHsXgzU+3vO11Rg6wPJaz8Sa/h0TVDUnw4q756r3AF/COe
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V1c0VjlJUjhNU3RyNDFiVGI5bEgvOC9yODNWODJOQVIxS2JkdTQ1U0JxYkZh?=
 =?utf-8?B?bWNpVjdWQ0dDcVJ6WDFmTVN3TkNOc2hXR1JNVThBMDFSRkZOWVMwY0k0aHlr?=
 =?utf-8?B?ZTRuTVFFY0UzTDN4YTR3K2xOOFJSakJyZkZqSE8vREhFRkJFaDZOazFxYUhQ?=
 =?utf-8?B?a2Nnd0g5Mzl6cnNQcmplV09DM1BHSFp0dHRSekZmYUNlTDNiSnNVZnpZWDdi?=
 =?utf-8?B?d2hoZjJFMERxSUZQOVpjWG1maHprZEV2QjdtMEVyNUswT2EzbUcwWEc2NE5P?=
 =?utf-8?B?Y3I3U01remtycldlVTl4MjFWVTErVGlJaHBSdUtVWWMvMFlQK255MERnTldW?=
 =?utf-8?B?MUdqUUlRZFliYi9KUWNUdDN5NkNtaTV3a0FQRHIwbG4wVnB4QkM4cnU4RnNZ?=
 =?utf-8?B?aVdNMjlZRzQxRHJ4ZUdIQXV0WGJGcENvY2dpMlJHdU1Bek5BTVZpLzJZRHJG?=
 =?utf-8?B?cmNWNEdVM053TERsOTZHdTl4S3poUnBtM2VwajRFaVdoVXBESEVSSUgvV3o4?=
 =?utf-8?B?bjVkMGZralU1clRWd3FoM2JhSFNHVmcyOVJvQU9xeU12OUE4cVk5VGVPc3pK?=
 =?utf-8?B?YUFJaUlEY0JYUWxUWXV3U0tjc1duL3o3S1BDVWlpckpsQUF5SW1BNlVXOVNp?=
 =?utf-8?B?RUs3d1B2aW5qMG1rUFRWSzBxanVFdGJwUTdRZGRMSjhvMGZLMDFyb0dIMnNH?=
 =?utf-8?B?SlNNYXlYRHVXNmF1aFEwS09vVXY4SnJGazZTL2lEMXBvUW8rVGJTOVhuTlZO?=
 =?utf-8?B?cXRScDZIekpiRktvb3VsY0lkdVdzWFlVcHorQ0dlS1JvdTg4K1hWTkZONGRu?=
 =?utf-8?B?N0dJNUdaR0ZYczhpeG5PaDRaaEFVWFZzc1V5Z3loSlJpSFBnQUtBbDYyZ2NW?=
 =?utf-8?B?a1B3c3U1V3lpSC95UVY5ZWdRclBFekg3RmRlVFFHUmgvRXJvcDlkbllJRW9l?=
 =?utf-8?B?YlFCWTJLL2tka1JDQ2RKN0JBRXFNWEdtdy94ZWNnbzByRzNjSFRwTHV4WTNw?=
 =?utf-8?B?ZXY0QXVldFRpWHdDaHc3eUg5Y3l5aHhVZkFVbENBWlhma0tzS2xTeWRaUVRi?=
 =?utf-8?B?c2NFNWlkcGhuUkdOYzVWMjR1T3BqNlcycHhWNVI5MURZWEIzMllHUmphS2d4?=
 =?utf-8?B?d0IvQjd3dXNaT3VLaXRBRUxTUUlVOEFXWjNKS05Rei9OOEc1RWJBaU1XUUh6?=
 =?utf-8?B?eW9EN3RscnY4SEZ6disxdjM3dENIUFF4RWNpd3VTbkVUMUQ4K2NIVk40NGk4?=
 =?utf-8?B?bndqUTJyeEViUFZVbmtDeWhhNUpvQXg2LzdHSXh3ODJzcm9EREVPdlo4anlJ?=
 =?utf-8?B?eEZhbURMcWJiUHRkbURaZlJ6L2tsZkNiajRhTzR4WmErRzB2eXZsWG5NeFlk?=
 =?utf-8?B?UWJ4dnBrbVFFa1VMdEhXRDdRZExqTjBOMjVROVYyOWhLWVJnc0hDKytHNkxT?=
 =?utf-8?B?K051QzB6Q0RObkRQUHdCTk9SWm1xTHBZSExKY1NlUzZEcStqSjlkSXZEQm84?=
 =?utf-8?B?eDNETFBSYWEreVFoRXV3UUdtei83YzRQd2JMZGZ5eGVqcWZoTGk3aEVZNTd6?=
 =?utf-8?B?RnJleDJmMXRBSkc1Z240bmRwTzJld3NEN1dLVHBLUjVRUHNZdE5PZG9hcWNy?=
 =?utf-8?B?eTkxS3liYUY0eUVkVkVaSHNGSDRSYWxQWERUMHB5ODR2MWFKM0w1MFcyUzZ6?=
 =?utf-8?B?dERpUkN6ZkNaMWh6eUVoeHorOThad0JVQTNET0hiZnVsNlpFLy9pcTRiQ2dW?=
 =?utf-8?B?dFlwREpPMkZWVzZNY2IwcDRNdFJOallJN0NkWGlXQzRXQWQzRmVDSU45OFY3?=
 =?utf-8?B?UGQ5c2tuMmZxOFliaGN3dz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 714e0f42-4aeb-4b09-111e-08da84d5e50a
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:05:43.4232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR09MB4559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 07:05:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169695

I read a more on this topic and found a less invasive way of disabling 
this feature globally for the native target.
Sadly there's no configure switch

Just send out a new patch, so this original series can be safely ignored

On 22.08.22 22:03, Alexander Kanavin wrote:
> This needs to be applied to python3-native/python3, not just to the
> nativepython3 link to it. You can use 'create_wrapper' helper that was
> written exactly for the purpose (see meta/ for examples).
> 
> Also, can the lookup in ~ be simply disabled at python3-native build time?
> 
> Alex
> 
> On Mon, 22 Aug 2022 at 21:57, Konrad Weihmann <kweihmann@outlook.com> wrote:
>>
>> which makes sure to set PYTHONNOUSERSITE to prevent
>> dynamically loading site packages from the host sided
>> package dirs.
>> In before when a module was using pluggy and/or
>> importlib_metadata the host sided path ~./local/... was still
>> part of the sys.path search tree and had priority over the
>> recipe-sysroot-native, leading to host/workspace contamination
>>
>> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
>> ---
>>   meta/recipes-devtools/python/python3/nativepython3 | 2 ++
>>   meta/recipes-devtools/python/python3_3.10.6.bb     | 9 ++++-----
>>   2 files changed, 6 insertions(+), 5 deletions(-)
>>   create mode 100644 meta/recipes-devtools/python/python3/nativepython3
>>
>> diff --git a/meta/recipes-devtools/python/python3/nativepython3 b/meta/recipes-devtools/python/python3/nativepython3
>> new file mode 100644
>> index 0000000000..0413e44e32
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3/nativepython3
>> @@ -0,0 +1,2 @@
>> +#!/bin/sh
>> +PYTHONNOUSERSITE=1 python3 $@
>> \ No newline at end of file
>> diff --git a/meta/recipes-devtools/python/python3_3.10.6.bb b/meta/recipes-devtools/python/python3_3.10.6.bb
>> index f19cd50273..1121c17887 100644
>> --- a/meta/recipes-devtools/python/python3_3.10.6.bb
>> +++ b/meta/recipes-devtools/python/python3_3.10.6.bb
>> @@ -43,6 +43,7 @@ SRC_URI:append:class-native = " \
>>              file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
>>              file://12-distutils-prefix-is-inside-staging-area.patch \
>>              file://0001-Don-t-search-system-for-headers-libraries.patch \
>> +           file://nativepython3 \
>>              "
>>   SRC_URI[sha256sum] = "f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3"
>>
>> @@ -153,11 +154,9 @@ do_install:append:class-native() {
>>           for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
>>                   sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
>>           done
>> -        # Add a symlink to the native Python so that scripts can just invoke
>> -        # "nativepython" and get the right one without needing absolute paths
>> -        # (these often end up too long for the #! parser in the kernel as the
>> -        # buffer is 128 bytes long).
>> -        ln -s python3-native/python3 ${D}${bindir}/nativepython3
>> +        # Create a wrapper for python3 in native environment
>> +        # make sure that no host sided modules are inherited
>> +        install -m 755 ${WORKDIR}/nativepython3 ${D}${bindir}/nativepython3
>>
>>           # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
>>           # and the overhead in each recipe-sysroot-native isn't worth it, particularly
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#169681): https://lists.openembedded.org/g/openembedded-core/message/169681
>> Mute This Topic: https://lists.openembedded.org/mt/93189857/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

