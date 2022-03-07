Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFFEC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 07:36:46 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.40])
 by mx.groups.io with SMTP id smtpd.web11.23782.1646638604383431664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 23:36:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=uuzAjfna;
 spf=pass (domain: outlook.com, ip: 40.92.90.40,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqbAAFnV6S70w6cjFYsfX+OUefNeWDakw61l8QYudWXHL/lLTbRN0mdQrPokk/fevRC/d2QD/45jNmUjY+yXdLpBhbj8lv9Z6E8HymYniWr68BFjT90L5NoF6Qb+nZSjR1fgfdCGyo4O4XYMD/WSR80L1FhPbbCrGUFTqRYDavoibse5B8pkqO7xE3yjT6UpAJ2bVIw6GLE0b560XQNSzAbFDo16EXo85BsuSmJGxzZjSpOsD7H76A6e76afi8aRPQGej05yljLMhECLbPXq91AyzLHnPUiafIhEEfPpgmFN2YJBMGLjkwd4W5sXtglQSauTD7A6/VJiiarlY+8j4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvuyQndgE0XNBtbnsc09ors7o/dWV67wOQ0hh0IW8eM=;
 b=N7vtXTvp3CawpxWRcV3hULcygdma50Obx/5jIsDU27xS70KxsrNzzGXcnkU9efXyOo4fKAqK6whtuwyXWKpsCR2cevdLWSo4Qr6tJkovpQ6vx/xsYCX959aaR6lsv8Lbb0Dxfbbtaf/a0grOLlUc/3SY/Rig/Z4W8Z8+WaR4wdAPX0N84lyP7PPUNxSqrWsBPQzT888d10f6pbelyuWC02IG7qFAfAmIOZCZWqQR1g1xkTM0wNhGsjKj3CtCr9vZy4kKGsWji6Eb8KJhSdPJ0NDp2OkorlC2p+7kdIHBzj1zcj4gmYE2srWv+VAzpmkh+KL3Fsl5VqzH9FaSOM6nwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvuyQndgE0XNBtbnsc09ors7o/dWV67wOQ0hh0IW8eM=;
 b=uuzAjfnai5vwdi576p7JiTF/SsfPlrGpOmrO7YeCQ3hbMrqr/nVDwMC7V+M8T+r/yn90/q5klPfkwzERcK4KZxT6YDqMNyBG2iw3vM2ka7BvOTYK8dPMnTpfcXyloAg9rqA5mAgDt6NCrnORCRd11PMupWvqoRpOQS1DEJ35RDuKF17OCzWgzt9sl1lUc3enIvr64lpzt4RIUtyd/63mAncBjyfBPGMGojeghO9ayOABI1dPYAdtdGaCA8gZr2NtGhTJ64u2e/WdCuckk2B0L/JE1JM7wgVCyuRt4vVCj/oYvSrpMUUH6vguGbsiIYTp3frFKY0sQtXC85xt5mgyVA==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AM0PR09MB4355.eurprd09.prod.outlook.com (2603:10a6:20b:149::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Mon, 7 Mar
 2022 07:36:41 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::296b:6866:9ac3:65e0%3]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 07:36:41 +0000
Message-ID: 
 <AS8PR09MB4645D5427DCEE1D6F488EF73A8089@AS8PR09MB4645.eurprd09.prod.outlook.com>
Date: Mon, 7 Mar 2022 08:36:39 +0100
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
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <d4f51c5770e4ffa626acffe9042aadd9d6e6ba92.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [efBfYFwTDe1X91yGFeebJ0HF8LuNs3nop+r6azAXrpcQ4ZUyvmrRUUD5EapClK0k]
X-ClientProxiedBy: AS8P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::14) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <ddf91aaa-6c1d-859d-6cb3-ae865c6e08e9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d191810-a8bf-473b-566d-08da000d3882
X-MS-TrafficTypeDiagnostic: AM0PR09MB4355:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	H1oYJLr13gTTogVDhGMiI39wimjLLbsLmblH+IL9IYnCzU5xBtgx1szukpabiGsuU9C776c1OJPaFpmXS+QIh4SaHXoAkmh5RUswQeHaGBI9qzzRMekTpPexjxfp1qy8Dj9CoXO+ZAmcYjA5zOb7uEZ/lKT1gGV9bB/Op3foiWlJOHzpEN5tEMZuogO3OsiuRoCsffoaOKAYtQAifgaH9B4tdhzjSHEAlWiGRD4FQsQ37PF63f23nyvnD9KdvlpUgQx0Kq5HmXZUj8vJnF93SHjPAQx+War8T1oNqdn8oO7d3PfY1xb5MbybhlJCh7zn3CxRx2sVjcvlU9hjZxtgRZGLoS1XsFMOF878DOPvwPeARdENGKng1/CmwtQLUPrP7Pb6EQU2a7KzR2tKu9KLJkE30WznVkB7yIRST26qDv8jTVlUR0qqI+NN7qkNd45MLRx2PWRZ6gClweXzFJ+Saehxc/57iZ8Wc3kB5OW9UciJ9wj1K57+2Rq4E2S5624kxQF7mEQR7HCcLM4O/nQKK1i1fIYT7HR6I/NIBKrzyVX6zGIqENgs5hWIGZwWbkJwgONBZT5PwmQ+3Q19yNIvY5c1djXXXo0ihgOIvEUa7myIGNYwEJxarDkk0ywnpGT+Co2Tjct/PCaFJ8Ly9L4waZWpjgAR7QnTy1tvdYdyaF4=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bFA4aXRZTFFzbjFoNHR5RDg3SWlHcGkrR1lkR3M0Y1g4RGdIYzJEaEFQcGJH?=
 =?utf-8?B?U1RXSHBRNzE1c2llRGNUU0ZIZ0xjekRJU2VhT24wQXFHcXlLWjdXOEhEMGZP?=
 =?utf-8?B?YnZPeVlwZ0VpSDNubDhFNzluYUg5VEF1TkYxN25ybHBnOW9lY1pLY2pHeVhk?=
 =?utf-8?B?WkpXTVB6eXgrdSs3OUdZVjRlUHgxUDlGdklKVW5IU3BjYWlwQkNwTmJxeFpK?=
 =?utf-8?B?bVZSb090MnVFUExQYjFibjdDbjYveTRKZW1mRjViS2VhbFNoRm9pVFA1S1Z4?=
 =?utf-8?B?b2ppRTJwWlBhZXdBbTNUeUlRZ25WaFpNYzkya2tQaktOb3BmRlFPYWdHak80?=
 =?utf-8?B?a2RkMnEvRndrMnJiNXd2QVo1SUpXUTA5eU5HWHJOODdZd2I2K1V1LzJkbm1N?=
 =?utf-8?B?bnp4N3dVZWlMMS9OcU80K01DcjJYd2VTcWR0Sy9KVzEzTUZGNlpoRzFRSXE3?=
 =?utf-8?B?Y0Q4dmZSZGNNazNPdkxBbzNoRkpLMzRqbHA2d0wrKzFjZE9oODVKcUVJd2lw?=
 =?utf-8?B?eVhnUGVaNDlwUnNPM0duZjhPSGlEaDQ1Z0s2K2xIeGpPL1BrWU51TFlYMTZG?=
 =?utf-8?B?VHVaMWNVcElMNThYNjBiM2M5c3FxYjlzd2xWT1RnWnpheU01Z2dqSGtPdlFD?=
 =?utf-8?B?YnJmNFdIc2REVnpwVXN1VFZ2akY3Yjl0UWdWSndHT2g0UjhuYUxxenhiVWc4?=
 =?utf-8?B?ZzdJZm5iTXFEbCtVNVdiamxoQjhPTU0xUjhLbEFocEtmZm5SM2hYWjBQemN3?=
 =?utf-8?B?M21tSUZDRy9nb29yamlMZktQWVVDaHMwdHNqNGRhbUZMbUQ2NDNESzlkd0Ez?=
 =?utf-8?B?NUhXR3dpS0Z5SVY5ckJzVExjb204UjEzZzVjbXBjblNYK2FHWWErQmF6eDhF?=
 =?utf-8?B?bnVZTWFDVVF1dHZVOFhxazlYeUEySmQ4cENSdnlaUTA5b1J4U3luZWNOUnFr?=
 =?utf-8?B?Z3ArR3hvTDkwRnp6amVtUWFjQXhjYVRub0xZclZUNkxZeEFqK0lESURWUWJj?=
 =?utf-8?B?WUJZQ1pwOEpmdDQwOFZReHBvMEdHL3JZR3MvMWJnWEt5bjJrSU9ZZHVieFlZ?=
 =?utf-8?B?S1o0dmR4SEpjQ3NycGVDU3h4VFJJSjY2UHhGc1lnb3NzR2MxMDJGSDBkK01Z?=
 =?utf-8?B?K3gyNHlFRlI5VWtJQWlkRmJ1R1hyenF5SHRqT3NML2kxbWxEREF0ZzBNTytN?=
 =?utf-8?B?RU0ybzR4T1J2ek80dVNVdDBETVJQbm9LTU5Cb0VYSXlCemtqU1dWUUNZUGg1?=
 =?utf-8?B?eUd2V1BZd1BKbDUxQTRrdjJOT0ttWDRKNWJ6bFRUZE1aeExPdnRWNUdMVTRZ?=
 =?utf-8?B?TGhDQUJTckNjZGdjVUVxMjNrSWxVaUZ6bGdDOThYdU9nMGxqK3NZeFhzaHBt?=
 =?utf-8?B?dWhBUk93UFZtamc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1d191810-a8bf-473b-566d-08da000d3882
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 07:36:41.2892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4355
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 07:36:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162797



On 04.03.22 00:46, Richard Purdie wrote:
> On Thu, 2022-03-03 at 15:28 -0800, Tim Orling wrote:
>>
>>
>> On Thu, Mar 3, 2022 at 9:16 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Thu, 2022-03-03 at 17:14 +0000, Ross Burton wrote:
>>>> On Thu, 3 Mar 2022 at 16:34, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> This removes a further 1600 files from sstate handling and lets python
>>>>> create the ones it wants at runtime which is likely much better overall
>>>>> for performance.
>>>>
>>>> Playing devil's advocate: doesn't having them in sstate mean they're
>>>> generated once and hardlinked, instead of needing to be generated for
>>>> every recipe which runs pythonnative?
>>>>
>>>> Whilst I can't disagree that 1600 files being dropped from sstate is
>>>> good, we're just punting the recompile step to every recipe when it
>>>> runs python code.
>>>>
>>>> I guess the question here is how long does the Python library take to
>>> recompile.
>>>
>>
>>
>> At runtime it should only generate pyc for modules actually used?
> 
> Yes.
> 
>>> Another consideration is that there are many sysroots pulling in python3-
>>> native
>>> which don't run python and they're only there as there are python scripts
>>> being
>>> added which means python has to come too.
>>>
>>> I suspect for that reason it could be a net win but it is a tough call.
>>>
>>
>> I tend to be in favor of the reduced number of files moving around. I suppose
>> we could do some timing comparisons if we really care. It will be a trade-off
>> of network/io vs compute/io, correct?
> 
> Yes. I suspect the compile cost is tiny compared to the io/network cost of
> chucking so many small files around when I suspect they're not used that often.
> 
> Cheers,
> 
> Richard

Now as this is in master and works reasonably well, could we extent the 
removal of pyc for native recipes to *all* python packages.
I'm still seeing occasional staging issues on random native python 
recipes as described in 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13868.
And as the common understanding here seems to be that the additional 
compile costs are negligible compared to the staging costs of additional 
files, I would propose to add

do_install:append:class-native() {
	find ${D} -name *.pyc -delete
}

to setuptools3.bbclass (as this looks like the one piece of code that 
almost all python packages have in common)

Any thoughts?

> 
> 
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162706): https://lists.openembedded.org/g/openembedded-core/message/162706
> Mute This Topic: https://lists.openembedded.org/mt/89528765/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

