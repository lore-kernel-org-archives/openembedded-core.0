Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D46DC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 13:25:59 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.44])
 by mx.groups.io with SMTP id smtpd.web11.26009.1646659557840122368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=l/KFumSU;
 spf=pass (domain: outlook.com, ip: 40.92.90.44,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es0JdSiIW75MhV0DToXJiiA7H7uELKFLz2FCzngCQpf2/UuIaHV4TDK5YyhDwSd3Zz3BRzidNhsdTlrSgJzMMpYmHbpTtnZXlRM8RZELN6aO8pbxMXC0EQS7/TyFLyl5Oi+P2G8Aa/RSqnYZBiYv2WxQ2DlIf29IH8KjBCubYZTYjbPgpc35KqXbeZgIR2TUz6lIpbSx0p7IPsJI1xjr50twCN9faf+gGLHmt0+dCg8CCutjSCk0fQfBkj+Dzgwi1WnP8S6PUw+sR5JsueQIDPCU2QCPvSSfwUSdHqdTLJjKAcPwUH90rr9d++RYf7ZlCvGS/rjlA4LGNLV6AIfdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0AkUsvtXoNVFbQSxYkuaGLjkaFiKwFlBZS8rPmzXvA=;
 b=lmqgH+2wAmP9J8g/JSFDAIU9TqoWMU3Guottg/maXV3qvsXA8zLnv04dmBl+YZoIu6DxEBh93eZsFLpZ3ZPr1oeES4HTmloHgsUkTPdiW9PI6tBqlWaIYnlQbMhyL0avdsBoqdtdTcmDjLOhXhFilDUGDlPS/0notoR2bozY2yPDN/CwmINTjXdh/xBoCEEWoVp0cQGKWtjlghs815DIbDVQxqbqKOVpM+XU20Ysvd1uzKLbAf8XPWBcNE3tcHNjG+xgs/iH/dXHar00Re0OAVfYUJnDaXLKgEXwUIx8cAkLN5g55m1766Bis3XQxUOy+SWtEsAVjDzwXleQfkpHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0AkUsvtXoNVFbQSxYkuaGLjkaFiKwFlBZS8rPmzXvA=;
 b=l/KFumSUFL3OA0KfZ7NMZJhvYN1YTDQYXp4Gekp9BjLe6jvGtRt6pMwfGYLidXya8F2T/a6bjhcy0r72JP8FkJeDLEsRtn2tWf79EPCdK6+UntiC2d7Db50VUTgvmz24g7pIkpkwPVBBZCFD+MC9zsmu2CoESb1iBRlyMZ7O/3fD3Q3h7FO0bq8N51d8Sbefxtofj5iNR/+Qk3kPqGpIgFXPttrA0wiRFotKqazhRs46BEcAmvUlstKWbJXuKfPbLgAaMbW62alsihCwEHapj22d4xwH7SLSU0QCVlyOtRdjH9jB64D+TrDmqjfctvEKotfYilKEThTMP8uJSQTNdw==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AS8PR09MB4760.eurprd09.prod.outlook.com (2603:10a6:20b:291::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Mon, 7 Mar
 2022 13:25:54 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 13:25:54 +0000
Message-ID: 
 <AS8PR09MB464524E685C4A6F585C89F24A8089@AS8PR09MB4645.eurprd09.prod.outlook.com>
Date: Mon, 7 Mar 2022 14:25:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
 <CAAnfSTu78H+UG34pykED6G8M939LLmupEghxaUaz8_mToAwwFg@mail.gmail.com>
 <6d880923351fe7e16d4c44d25dd8f43d1de390c6.camel@linuxfoundation.org>
 <CANx9H-Cn8e6-5q-6YJurv0TkTDvFnVd=9Kd5qFs5geP7i8YXGQ@mail.gmail.com>
 <d4f51c5770e4ffa626acffe9042aadd9d6e6ba92.camel@linuxfoundation.org>
 <AS8PR09MB4645D5427DCEE1D6F488EF73A8089@AS8PR09MB4645.eurprd09.prod.outlook.com>
 <1a74878218e1d5273b2da707664d1d5fce38c360.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <1a74878218e1d5273b2da707664d1d5fce38c360.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [wWb66fOKZ6ij8GLl62mtzaRNmAheu0oIJuP2k/H79WYz6FKT42aZP7BiwuUfVD22]
X-ClientProxiedBy: AM6P195CA0031.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::44) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <4e8fa808-f351-a92a-721d-48cd4797bf34@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da263218-9444-4c2e-68bb-08da003e0182
X-MS-TrafficTypeDiagnostic: AS8PR09MB4760:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	olL3urI6gbiCCbDfInD16dwjaQRysjxDg5CcM51xRdHYFfvD2Ba4BEMdO3aOJvQbB+qKEwE/bCszjTiJGKAOXwdvrL3FWfyCZfcV+OrwwWXiGCzOP2aSfwJ1EpKUD4ktpJEJr/2ulI6yfdsv+MdW4ZxXqIA58njFrZRdTy6AUN8YpeR3FcP6gWyN8DCtqIghHJ8xzVQhrMhE5di5H9Q5L3oYGjweccjChvlemYveDQPoUxnNJthGthjP8s5i8QeU7+GiSxppQRYhb0cNg8RT/nJzIODc4OlwXV2/UQbZpA125vMO2OE1JhYgSiYU9b+cyCLtN7/y8h0dsutxxtRXI+NlEtsQlP3b/KUzv6xOSuIwfod1RxTkhLL8PlI+UeRv7CtIWvjRtf31D9FwKtsm/Ton4W/rSlt8jp+Hpc4ARdMMmvVG4ZPz8+0hZqz5slD83Pq1d/YetLDn1rlMTlmdTzbSYIf15klcE5KlKHCDUnjpnPQp6mCzamKjurqupXwsD5Ma2ZY+mSiNLN8JwUTjXFlqa3AVK5EzGMmWduGAaQZAZlHOJP45o9CKyZb4xyvsHi84x+2w0a9woac1v3POXlhr8sCS4Qo4R4LdtgN7J2zhS4C4mO2ITn2+Futd7fx4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OEV0b25xOU9YajhyV3ZkSnMyaU9mYlAveGJaUW10L1ZPWUZjaWRwVEg5blE3?=
 =?utf-8?B?aFRvbUJ1SlRoVi9aQmJwT3FNU0d0SDA2UEZybCtxTGljTk1EYmljYTVRQWlG?=
 =?utf-8?B?eGZ5c3BtNnVBSnJPNlBGVU9WSjJROUttd3QzSXhETFZ4WGRvQWpTeXFJQmpP?=
 =?utf-8?B?a2UrMk05dUVZbU1mcVpMNE1mRzc4UlBINkRNeGl2aXF3eGZSYm1IUFltaDNE?=
 =?utf-8?B?SEFnR0R6ZWtsTVpDVDVVYjNiNmJudmVPZlFlZG5UMXAxZ3BuSytKM0I3dFBu?=
 =?utf-8?B?L0xNTkY2SkZsOHBON3VMS014Wk11VnNYTzQ0eEVrYk5qWXhFUDJ1ZUdnd3U3?=
 =?utf-8?B?Nk9vVTRlSkpkNVd3WHVJT1pDcTJ0NHRMWGp3QWZsWGhHeGxVQ1Bac1NiNEdR?=
 =?utf-8?B?UHZyYU9oQWt4QXNSNmNiL1pORDNiQ21TR2xaenZIK3ZrSGZFT21NbkJYTW43?=
 =?utf-8?B?QmxvbXlMMnVadklrQktOMmJ4NzN2VHA1VXVtbGhyRzNjSThtc2d6Z25MbmJh?=
 =?utf-8?B?NkdXbkljNFdzSDMxVUFTWGpuWE5maGsrTm1SeVpQVUNpWER3VXFxbkQ1aEJY?=
 =?utf-8?B?b01uS0xXRmU5UkZQM3ZzS0p3RkczaldzbitkZ3ovaGRJWWh3b04zcTUvR3ZF?=
 =?utf-8?B?Z3FtRy8xVnIyanR3UkszTHJHMzdMRVpsTDB5VTM2YU9lRHhkT3VIWU1paU11?=
 =?utf-8?B?bGVzSjQ5TEN1d2ZqK1Nsend1SGZ1VjVYWjl4TWViQVZBdHV4ZEZmYlRhSE9N?=
 =?utf-8?B?SUlRMzVTUTFZZ3VKb0dSL1RxZHFEKy85bjd2Z1N2dXY2ODBNVml3ZWhtd3Ev?=
 =?utf-8?B?RTBzMkNCK1BFNGFlNWhIbjYySEpwbm9pN3dPNDdCckFCMG1WRTkwdEJpeTds?=
 =?utf-8?B?THRCRm9DamY5aGNncDVDQUhKeTNxcVVXdjlOWlJzd25IQWNVRDJlWUxQdExQ?=
 =?utf-8?B?b0VIN3l3elRMNS82N2RiWEd2STdzMnJVVGRHN0NkZ3ZZMzJhdVpjVWZWdUl6?=
 =?utf-8?B?VmVQRi8wN2xRVnBkY0dIVGV1WmU5RlRidzkyT2JBdVVmVGNkTWY1UGFVTXEz?=
 =?utf-8?B?THFjc0RrSFhmdEdpTlJHdVRaOEk0WEVIUHZZV3R4anBrQmk3akVqZEZtK3Vl?=
 =?utf-8?B?em9UMUVWV0R6SkRqTjdBQVVvN0ZwT0R2WXJWd2svU3gwSGNHYW4zY2ljYVJx?=
 =?utf-8?B?a3YyQ2t1YjVqall0b0w3LzBNd3JUMW1BS2hYVHhzeUoxd2lCSjJVL1VHbmlQ?=
 =?utf-8?B?d3Z0WXRhM0djMFlpSlZ2WUxsYWtycGJFZUhhcTVMTDRDb0IzVUttUTlBak1r?=
 =?utf-8?B?VncxNXdhWDd2c0ExeWtYekd0emc0SGtFWE1yQWtvUUZReVVnK0toOXlWSDFk?=
 =?utf-8?B?SXpTYlhBTXBSMUE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da263218-9444-4c2e-68bb-08da003e0182
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:25:54.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR09MB4760
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 13:25:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162818



On 07.03.22 10:45, Richard Purdie wrote:
> On Mon, 2022-03-07 at 08:36 +0100, Konrad Weihmann wrote:
>>
>> On 04.03.22 00:46, Richard Purdie wrote:
>>> On Thu, 2022-03-03 at 15:28 -0800, Tim Orling wrote:
>>>>
>>>>
>>>> On Thu, Mar 3, 2022 at 9:16 AM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Thu, 2022-03-03 at 17:14 +0000, Ross Burton wrote:
>>>>>> On Thu, 3 Mar 2022 at 16:34, Richard Purdie
>>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>> This removes a further 1600 files from sstate handling and lets python
>>>>>>> create the ones it wants at runtime which is likely much better overall
>>>>>>> for performance.
>>>>>>
>>>>>> Playing devil's advocate: doesn't having them in sstate mean they're
>>>>>> generated once and hardlinked, instead of needing to be generated for
>>>>>> every recipe which runs pythonnative?
>>>>>>
>>>>>> Whilst I can't disagree that 1600 files being dropped from sstate is
>>>>>> good, we're just punting the recompile step to every recipe when it
>>>>>> runs python code.
>>>>>>
>>>>>> I guess the question here is how long does the Python library take to
>>>>> recompile.
>>>>>
>>>>
>>>>
>>>> At runtime it should only generate pyc for modules actually used?
>>>
>>> Yes.
>>>
>>>>> Another consideration is that there are many sysroots pulling in python3-
>>>>> native
>>>>> which don't run python and they're only there as there are python scripts
>>>>> being
>>>>> added which means python has to come too.
>>>>>
>>>>> I suspect for that reason it could be a net win but it is a tough call.
>>>>>
>>>>
>>>> I tend to be in favor of the reduced number of files moving around. I suppose
>>>> we could do some timing comparisons if we really care. It will be a trade-off
>>>> of network/io vs compute/io, correct?
>>>
>>> Yes. I suspect the compile cost is tiny compared to the io/network cost of
>>> chucking so many small files around when I suspect they're not used that often.
>>>
>>> Cheers,
>>>
>>> Richard
>>
>> Now as this is in master and works reasonably well, could we extent the
>> removal of pyc for native recipes to *all* python packages.
>> I'm still seeing occasional staging issues on random native python
>> recipes as described in
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13868.
>> And as the common understanding here seems to be that the additional
>> compile costs are negligible compared to the staging costs of additional
>> files, I would propose to add
>>
>> do_install:append:class-native() {
>> 	find ${D} -name *.pyc -delete
>> }
>>
>> to setuptools3.bbclass (as this looks like the one piece of code that
>> almost all python packages have in common)
>>
>> Any thoughts?
> 
> I don't really like working around errors like the above bug where we haven't
> understood the underlying issue :/
> 
> I suspect those pyc files are nowhere near as large an issue as the ones in the
> python recipe itself either, there are likely only small numbers of them.

I can come up with a setup that has ~21k pyc files of different native 
python site packages - and due to the nature of python's import system I 
guess only a very very small chunk of these will be actually needed to 
be recompiled.

I know that bug is hard to reproduce - I can only manage that (but there 
with a quite good percentage) in a GitHub actions pipeline (2vCPUs, 7GB 
RAM, ~12GB HDD) - and I had it once that could reproduce it locally. And 
the pyc files, even though they should have been there, disappeared 
while hardlinking the files from the components dir to the workspace.

So like with the other issue I reported last week, my question is what 
information do you need to look at these things? - a browseable 
workspace is likely out of scope, but certain files and system infos 
could be gathered I guess.

> 
> Cheers,
> 
> Richard
> 

