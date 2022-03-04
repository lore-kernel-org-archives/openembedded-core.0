Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB35C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 14:06:35 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.57])
 by mx.groups.io with SMTP id smtpd.web11.7320.1646402793162104055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 06:06:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=S3iZWG2q;
 spf=pass (domain: outlook.com, ip: 40.92.73.57,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ox94vVPpVMWd2X/G4OkRyjBFwXcgH9FK2c/r2PETsBfRvmvqz/BroFzw+8Wj/gSrnl4ZxAsqcyZ6cDG5GcEa4+hYI+Rx/bOYFQjj3A5a5idESVgaEjxSf5kW/9r7y7ws6VTIKrnxyKKQ7fAASO0R/V585rTcrnW9khiIilT3Jhbjc5RV9efdDj98kkLVKAPOpBI6dfwUpBT03/+CkhNVeZpqKmwXFUBVf0KJK2VuqEwG6n2mRo5gRgmtRPgtfE6JwcdPFyMoNFtHuqMVgc6JW2TXX8I1sUbrfEso0nhZ2clZSAUkhVtm5y+9SWOyG0lEW+6RmaLCUPe7qMg0aF20mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz0P6vQ09DT7kZlKRxzVA0mw24UhEtbwVCKQIl8w4aQ=;
 b=KdLRmeXB0qMkK4ea+xEnQet+tbcwrZiZLsNNyiNS8mYpzBhxZ9kv8fEsyqsLINxAu7RNNYczDAKH8XIikjeu365JmsWVqcPdoNOcvvMlO4755uTy/uLSYLxeMXSmmQzVm+fsJ1yYA/YKbfcjwDnEmLQaymBJjY4Uo7xXurmpNyqL8aCPTd4I6jIuimecYlG0uH56oX74j8RCeXs/rI5citsaZFIiqeNqcCUrG49cSGG0zS1DbcfdRu+kK+X68ZxmkicQoLm7DVeW57vdkOXVjtZ0vqbuKLu5eWKGGM35OuOqcS3PeBCv9oK7g4blnz3BfiH85a0M1UbjyOeO1h1wew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz0P6vQ09DT7kZlKRxzVA0mw24UhEtbwVCKQIl8w4aQ=;
 b=S3iZWG2q6QLQBS/wfwxvcjrw8W0/8MwE2c0KjqfZA/zXJTRpY93eQrFrqyKiUyeLwQvBFdjdBpqs4MUq8o5iqgN0oasDxv2HNEpHd+LTiL4wSNT5Ymox0xwaOc97NkJRFqyvPe86p+DmpLWvNhuZZaxKNJ1m0pQ43dujLAYizaLbNniyBIZktSIaKjL0eAr44MAZJ7Hkaj0PfFmgSgBVIRn6I51K7h0DnIowMOrcUEieFgAjDqMX1UKKhZ/Lxdf/xFRoVOW581p2Rx4IlhQ1QmvCmt+07PL3A5zlRkNbyZEh1J5OSrewdsJorPlzw3tzgew5Xj2VdrT3fuGAZaBRIg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM7PR09MB3832.eurprd09.prod.outlook.com (2603:10a6:20b:101::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 4 Mar
 2022 14:06:30 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 14:06:30 +0000
Message-ID: 
 <AM9PR09MB46429EC89803B44A66B82D44A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Fri, 4 Mar 2022 15:06:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] classes: add setuptools3_legacy
Content-Language: en-US
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
References: <20220304115525.2240283-1-ross.burton@arm.com>
 <AM9PR09MB4642E1F4D179551C41AB9217A8059@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAAnfSTugRrDfDxwEKXfbHRM5DznThMN3_jiiTLZ4Nr6J5o_M+Q@mail.gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <CAAnfSTugRrDfDxwEKXfbHRM5DznThMN3_jiiTLZ4Nr6J5o_M+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [fDc22AFwPkcY4jbWgw4NqqgKS9eVPjKbPktMkb/AfCmlwo+4/koqCUxuoT4OnpCU]
X-ClientProxiedBy: AM6PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::21) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <864aa350-ab1b-5065-3962-1f3112f2f8c2@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2f3a458-bd9c-4d65-735a-08d9fde82e46
X-MS-TrafficTypeDiagnostic: AM7PR09MB3832:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ixSEBK5Ag/Rf0soFbC0AZu4oPAxcqnBeSoMXUCnQPrF8H0mNN1B/1rN51wYj0NYA/lMGK5PiNwVTOWKbfngpPxfQwHHk6srN9UoIH2V5YI4DgbF2RTogSuFR98KclTKhieLBWYLWNEjXjn02tQdROt6BApb7eKqW3tUmjQ1M2zGwWRiIg8goss6UkL6Wiv13p/SBm1KB1hq825ZPIHOVU+ZSSplbzyNNPHptGI3/jVAzhVB++6gq7oPBVmAUwbGwonOq9fV4qELex1AjtnVvg0Im/l8i4cN2a51YkSA4IapnA1InUr+VTLxZSguaGyYGQ326TVjHfeiW0LBxu8kUGGACDnyfh7ybZMnZYVofGJZp0e+EuMi20pvpRTupIHAOV/8GcR4GGDLYz6LJ/cskDAuehc+qk6U7YAJdX6MWGy2aYRXOm8UAcBY8XDM+fPJYtnN2HCHx7uN8MpxF/5CF/YQht861kNkIq/MncTVkvfPW8TSfASQTq+euh6xg+MSVpuBCB6++9wOHpf/v+yqXyfsNFy4MTS38iYRFXs54GEwEex+VWwMVgdy5Mp/lqAG36s95FX7+gVWmLr+TuWshOQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGo4Z0tMU083THo1aDhhWFR5dTZQVkJCVE4rL1UyM2pXZG5GbXFqeVZOTDly?=
 =?utf-8?B?OFI3T2tKaHd3TnE4NkpiZjVCamh5ckF6aXZ1NnQvR2locjV1c0JwUVZ0N2NE?=
 =?utf-8?B?Rk1kREtocHFnbDh2dzhCbURPeHhtOUZLY1Eybys2elRhUWpVbFRmTjB5MGsv?=
 =?utf-8?B?WjZwU29XWS9Yb1NrUzk1TU5YNGlYd2doVGttaldvL2poKzRFaFFhY0FvUThh?=
 =?utf-8?B?cFdzdmg2eVVpQjNRckVsWlo3WncxR1lxWjJ2WUtWTXllRUVyOW81YVpCa1o0?=
 =?utf-8?B?djE1NGhldUhpQWU1ZkNOTUdNVnZlRGJFNHFyQ3FBdVVnbUlhaXpkT3lma2dP?=
 =?utf-8?B?dGRQd1lHOUlES1Roa0NYYXUyOE5hc1hGOHkzVWJaVTM4MHZxZmRqbXZJemhQ?=
 =?utf-8?B?TlQ3ZWtwSjFXNU51MUN6bXpWU01IKzRXVllEVzMydTVsZVlKa25uN0FCNlYy?=
 =?utf-8?B?M0FZQ0Irc0RTM2NMQTVNQ1FnaHlCcjk0amJaVHplbDgvTEZ5YkZsUDFRdjNJ?=
 =?utf-8?B?M0UvSkI1QjNpd0dWQ0FjUFVUMWVVVFowckNneGtwaGFZb3BvZTZxbWRkVmVh?=
 =?utf-8?B?WXVDdTBoMGlENjRBZlJJNCtNTjBnZkorbnJabEZtY0lZdDdJaXR2YjI5YkFh?=
 =?utf-8?B?Zm96bFd4L0syMlFIZzNMZ3dYTGxZYVBXaVJBcWRUS1YxcGVteElIQWl5Nk0x?=
 =?utf-8?B?YU9KUGJmZW83L0RmZ29vNkRPZGJCRXA0NTJpTXJyUmtXSDRxY0l3RmI2MTVK?=
 =?utf-8?B?TnF1Z1g0Rk5rRVFFYmV1OFlZOVp1dFU4ZnBsQUZsZ3JLaCsyNCtCYkF0cmY4?=
 =?utf-8?B?MWNOUzR0SEJTZ2kxTHgvOGlzK01Fdk91WG8yLy9KenFSRVE2VmxSOENnZldJ?=
 =?utf-8?B?eFBBMnhLWllkeG13MmhBc1lHODRkVTNGazNqcE5sSmFwaitiRWtQanM3RlFT?=
 =?utf-8?B?NXQrN0haUjBJUlFJZ0l4Y1owOUV5cWZ1NXovRkpZN1lUN1BDZEU0cFFJc2M2?=
 =?utf-8?B?S2hocHJLQ3hPZ3lCTHg0UUliSk8vVGFna0t6MzJBcmxleTBVbkVFZUVzbmpo?=
 =?utf-8?B?V1dXM2xzek5UYUdWbzRvM3p1bkJ4T3BHdkhwTDZMOXFlUkZ0V2piYnlycTVI?=
 =?utf-8?B?YmxIWEYrV3RDcUtSdkVZamNjNDBPaGJWNmtmalQzcjIwb2t1SHg3Mjh3NDNo?=
 =?utf-8?B?NktUN2pBMThqTEkvZFIwbEpmU2xjeDBmd1lHZCs4WW9seG1WYkI5a1FhNEty?=
 =?utf-8?B?YWh0RHJnNEcwbEhLVXJJbFdXMWJPK3RIMjFsd1FTL2tHS1EwSDVOQjlpWVhP?=
 =?utf-8?B?Nm9vcHFyTkpyMVBsdWY4eHJGaHJFMmY3VFdPMFlDWjQxaHdkZXlOUHJTcXRu?=
 =?utf-8?B?V2JsV2hCMzhhdnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c2f3a458-bd9c-4d65-735a-08d9fde82e46
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 14:06:30.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 14:06:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162718



On 04.03.22 14:13, Ross Burton wrote:
> On Fri, 4 Mar 2022 at 12:44, Konrad Weihmann <kweihmann@outlook.com> wrote:
>> For me that would be a candidate to be added to meta-python, or are
>> there any core recipes that currently break because of the new behavior?
> 
> This is restoring existing behaviour, so I believe it should be in
> core.  There's going to be enough recipes using this that it is
> justified in core. I expect we'll have deleted this by the time the
> next LTS comes around too.
> 
>> Furthermore the variables names are the same, so if people accidentally
>> (or due to complex injection trees/classes/distro settings/whatever have
>> new setuptools3 and this class here in the same recipe, things become
>> rather unpredictable - as of now there are the same but surely they will
>> start to diverge at one point.
> 
> That's intentional: if you have a recipe which needs the legacy
> behaviour, just change the import from setuptool3 to
> setuptools3_legacy.

Can you name any publicly available recipe that requires that?

For me this is the same situation as with the python2 > python3 
transition - there wasn't any fallback provided in core, but outside of 
core it was - so I would propose to do the same here.

If that legacy class will be part of core it's likely that it will 
remain till EOL of kirkstone which is somewhat in ~2025 (by current 
planning) - and meta-python2 showed that even then some recipes still 
haven't migrated (yes, chromium looking at you).
All in all I think core should just provide *one* way to do it while the 
legacy cases can easily live outside in a separate layer (meta-python 
for instance as the "old" distutils have been put there as well).

In additional everyone was worried so much about reputation lately that 
doing this long announced transition, while keeping the "old" way 
enabled (and creating more maintenance effort in the end), would 
definitely send the wrong signal to the community.

> 
>> While we are at it pypi class needs a fallback too, because for me this
>> is the standard way of packaging python recipes and new class points to
>> the new setuptools implementation - so if we want to have this here, we
>> might need a fallback for pypi class as well
> 
> My understanding is that almost anything on pypi is already a pure
> Python module and is mostly unaffected by the changes.
> 
> Ross

