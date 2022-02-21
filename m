Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE22DC433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 14:17:18 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.92.71.41])
 by mx.groups.io with SMTP id smtpd.web09.11039.1645453037518385072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 06:17:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=hGXH8BKA;
 spf=pass (domain: outlook.com, ip: 40.92.71.41,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WrYmDUQuccI7pQh7eF7G/2d8BRlXUzrJIeu2fGFcJj5RaiO/eXIxnbs/nYDpoXhjKdU/C7zZI2UwoqAusXoPUy8q91ZNFHx5uk3hL5R+LNNFKUFNMid7KqfPE36Kg6TsO1Q8GnslqwjFRAyPGWySRl7gHbqFY1b3g01uf8i2ysjctnieHf9qjUb/iy9NGl6SGzcHKGWkR5pyM1+rQnUOGCxQN3XvYiyR7taZa3FraoW8iKWp3C/oRmVAFGFS7KRd2SGUCLr2wILRy2gjv07ge9vAJTlDQ8h0e5jAbk1r9DuQ6CfG+6mZt86GGHfjIty9fbEdDKR+VzIkQOYLK7aSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8jyasHZq3tGayVgEKDrCq6IxMNSH3SW9yLZKYJJYEA=;
 b=N8cLyqjOQ1HvPJU/PvA+eDjVodF6LXTHdY8XfPXpUvQqEZGGIt0igOsIkwWMUFhkopcU8RRFKAZ1LItbJCsfbGc1TsuiGQAZBpPjEDfeWAM9X9Z7yjGcFcr8rnUdFtOeDjOuYhSsF6eI+EbF+T83zq4FX7jtdt/KRfXhWJyYqJ4He861k7Whcr0Ihu9jUAhJo9mOGQU9cHLkzeblMGMOxySeICkugB6wukRClTccQS+HxvaIorWXhGmTWJURR1ggDOJqbn1MJFPz9wi5DHXgMTuyDwe7sHb5z4B/Io4K+nQ1DeBeegCNdqF0EVljni2F0seztmZhegp1ky4lBqcwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8jyasHZq3tGayVgEKDrCq6IxMNSH3SW9yLZKYJJYEA=;
 b=hGXH8BKA6TH/yHyrNwe6Kb8GVaGcMF0najWOL0oxbXzir0XCHkLOKzqHoohjWl2cF4TBhKiF/Q5hS5yYPUtxgNLwr2cyusNG2/E5oIDy4hMa6JrcccGsfAoeIqEfsHipiUjq3b/qNU3VwG7yrUMA37j9iCIjhKg3I/V8BqWHb19UvX5I1DHMaFqTx+3m4O4tN9gDn4MZLYzjhdfe/eBF3H3bvlzrh3x7d5FaqJigl6PGI6RD+gNoaWS5PqlmOxG1Uz6aJwsR4kEDwi2G5d3r6mCCJtXYpcHBziTtvfokHOQ3Lxc4Ov/liIrh8abW1/Sx8Ghf55mDDI1leslIpzkVIw==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM6PR09MB2695.eurprd09.prod.outlook.com (2603:10a6:20b:4d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 14:17:15 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::144f:4014:8d4c:5702%9]) with mapi id 15.20.4995.027; Mon, 21 Feb 2022
 14:17:14 +0000
Message-ID: 
 <AM9PR09MB464250E2C2F58B2AC22BF7C2A83A9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 21 Feb 2022 15:17:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core][dunfell 20/20] ruby: correctly set native/target
 dependencies
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org
References: <cover.1645452535.git.steve@sakoman.com>
 <b9d88fa46bad2987bd045b0fa98ecde7b42dbb1c.1645452535.git.steve@sakoman.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <b9d88fa46bad2987bd045b0fa98ecde7b42dbb1c.1645452535.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [imXOnYXGPf7JHOcPdKCXLmRzhca+Ey7q1rvS3jbHe9v8RwZxMbDUtGk1YBqWREPy]
X-ClientProxiedBy: AS9PR06CA0279.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::11) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <6d25bb68-b6ed-b8f1-f75d-09608471c88f@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d951efb7-cb81-44b7-80aa-08d9f544dbef
X-MS-TrafficTypeDiagnostic: AM6PR09MB2695:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MGH7MpWoPGrRalYOjmc1ZqG2yjwWMGRGKylm/SXMnhdWnOTcrDBfK25L0xSPzOKRI5znUZH8H6Ws02kfOw3FK11JZfSRcfQVCUlvGtRQsXraZ2TBlC+nMnJJ3m8Y0eAbdPFxrKK74yZmI0jksLnLqvum285bep2TM0OEPJcl7M/vyBERnUPl7DHdz4btUc5eNfRf3Sia02TTNfSqTMBH8McA9qGcS9ec5TQYsj9cQVF6WlORsqRL/yTOVBQubdwmpDwJ7AIkwQJmT3hVN1cnk/TWcBrNBZ60ORd68VCSUNAh0+30SF+W7RaJE404ej48nGd+0hX0OZyTu1KfKUdUYNeDT+kG1AlOySrFuoxRML2X/zX2TPMi0ZMQTL6aj6cLxccnxaSvgYJFok/Xr3EZy5gpJGQ3Y2zh/QsPKrAVbdIWkqXS8QP9I8QDwSMyNYVVPNWlNI/DTdQK03z4UdOWFpVRlPRieqDgga7twyTM7Fq0r5RDXUxH82MVac6DJeF2a3DJJNHZn/1Zr65hBB75S9TNYTsbV47/bbY0yNRdulsJ2y6FqgoXQFIgtE4RTW6RlN5daU55BUzERhON8xMRCRD2infj5MDLsDRz1BQ7OGXdiIBGz30jCBDyLWT7+aEw/NsB/5yS0RkHXqgHrADFcdQSFkcdKZ1qWK2K1xIZEuc=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OFVVbWdBbEFGQ05VejhNeG02dytoaTdVeFJUQmZPMzg1SW5yQmMyQTQ1dVNL?=
 =?utf-8?B?Q201NVZKS0RPUXhSVTFINmdUK0x0OEVFOFVhS09ZS2gyU2ljdFFneEVaN05l?=
 =?utf-8?B?dFJjOTZvV0FFUmh5TXBSUDhwTDRweDNmN1oxckFnZE9kSFFlSEZpcnUxUytO?=
 =?utf-8?B?MldPNzArdVdjR3BZWGVlbkVTNVN3QW1xZVhFSnJyV0E4ZXdvdHR2RGpiTkFY?=
 =?utf-8?B?MDRoQjYzck5iT202QkxqUmpNY2taTTA3c3dwcUYvbnVxRksrS2FaMEFybjFn?=
 =?utf-8?B?RTRJYUJ6LzhEdHNHNTUrTGZLUlhCdVVOT05CKy9KU0ZTR0hXRGtGY1lsa1or?=
 =?utf-8?B?bWxMRjhVVHplclYvdEpGRFFlYVptVlNvMHJDODJRWFBrTWtXOHN1amgyb1I1?=
 =?utf-8?B?NktTaFNGRk9Wei8yYjZ2YUw0S3FySVJvU0kwNU96c0xqbUlDSDFhNHBSajhT?=
 =?utf-8?B?RDJLanRmdlpKWlVnZDRUZDc4aU1HQXNGenc4V0xsMjY4R09qa2lBQklkR1ZY?=
 =?utf-8?B?Qmp6NG5qVElKYTlLSzcxb1lXQXFOcHNsdW4zMDVYVU1iQjJnQlA5SmtRZ3BW?=
 =?utf-8?B?bEFYeXdMd1lRYzZTL3hwRkhQR1pkZm8rdzZrRVQ3Ty93UkJ1Q1V3QUczNHM0?=
 =?utf-8?B?WXVCbWZTbVYybjdZamdVS3BLTkdHVUwwSyszNGVVb0o2N2hrdmQyMjYxQTY2?=
 =?utf-8?B?QUpMbW0yamFJbEF2c2l1Z3JNN0syV0NyUEx5Q1NDUklCNGkzZkNpa2o5TlJa?=
 =?utf-8?B?K0dTdURuRlNnNGlmQzhiQ2xYd3JEcFZDYmNGSjF2enlrNVR6dUFReUdnUGVn?=
 =?utf-8?B?WWtIbmlGU2lSOVNPejA2K1RDRlh1MjdPUk0wdlp4T29pR1dEVkFuZEhyYi8z?=
 =?utf-8?B?Nkd1SGdCTTg3MTV5dDhkSnNiK3UvbXRueXlYSVFIQXRKNzhPSkl1aW01Q1U2?=
 =?utf-8?B?bW01c2owN3JLUVpMazMwS0VON3A3SmFYSThDL2FjQ0M1aU9QTjcyUXFBZW10?=
 =?utf-8?B?dW9QYkZTTS82RXVnMEVtd1JZU3RMYUJiSG5hNWdUT2U4MzBCZmpXUTRDdDdQ?=
 =?utf-8?B?T2hmK3ltU3MxMVYwZHprNHdubEgxUVk3d1JNdHlQOU9vR3hsb3RYbVMyYklu?=
 =?utf-8?B?TzFxZWo3dXJLL0hnK3AxS0J5RU9TRnR2Wllwdm5uOUJGK2VYY0QycUx6TUZm?=
 =?utf-8?B?ODBVK1lFVTd4NEJjQTRFc2U2R2QvM1FlUmhDY2hURFBoZzdGdXNPTFJ0Z0RZ?=
 =?utf-8?B?a3k2YkUxelJNTVVUeTRCWlhYR01tUlZRU3ZIOVZKTWNucldReVU3eVZ0ZTBQ?=
 =?utf-8?B?UEhzUWQ0T0wwdmx5d3UwUFZObVBNY2VnbmM4VHl0MWhRQXVpekRlcjBacXNu?=
 =?utf-8?B?alQ2c2x1UFpyd1E9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d951efb7-cb81-44b7-80aa-08d9f544dbef
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2022 14:17:14.8947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB2695
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 14:17:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162050

This patch should be merged without this fix 
https://git.yoctoproject.org/poky/commit/?id=89004bc2480808576582001460e37d98143bf9a3

On 21.02.22 15:14, Steve Sakoman wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> In particular libffi was missing from native, which
> led to linking with host libffi instead.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 293c9f879252a814107579542e8fca9af9dde599)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   meta/recipes-devtools/ruby/ruby.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/ruby/ruby.inc b/meta/recipes-devtools/ruby/ruby.inc
> index 7b6d4edc61..367cd98d09 100644
> --- a/meta/recipes-devtools/ruby/ruby.inc
> +++ b/meta/recipes-devtools/ruby/ruby.inc
> @@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "\
>       file://LEGAL;md5=2b6d62dc0d608f34d510ca3f428110ec \
>   "
>   
> -DEPENDS = "ruby-native zlib openssl libyaml gdbm readline libffi"
> -DEPENDS_class-native = "openssl-native libyaml-native readline-native zlib-native"
> +DEPENDS = "zlib openssl libyaml gdbm readline libffi"
> +DEPENDS_class-target:append = " ruby-native"
>   
>   SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>   SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162048): https://lists.openembedded.org/g/openembedded-core/message/162048
> Mute This Topic: https://lists.openembedded.org/mt/89294107/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

