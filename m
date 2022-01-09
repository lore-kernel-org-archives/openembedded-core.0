Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE07C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 09:24:00 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.105])
 by mx.groups.io with SMTP id smtpd.web09.16413.1641720237966167119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 01:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=SeHnwNtD;
 spf=pass (domain: outlook.com, ip: 40.92.75.105,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNAj4rlwSPoIfNkyIylRkMXJv7CtBnOZHElZpqPlR/GIjxlVoWSN+vVKPeep4HCZFe+naFgU4ppP497cBMov8twFGE8g2K4mODZAv/+LLxCVe5Z1C2OEhIbtU0TbMBSmnKyxoyFdj35YQQdgGz1hny26xrfEwj35zuNF0hehGkdRme+pKu8+FBGaJl1YHNM09PeOjZRm+KeiF9SaE8FIoZokOzI9ZFm3M/cLvObbgqjaonRizZZwIQLhF/azsRVjG/bubPyOkJ1ym73H00JIeaIE4NByC/vkfo+2V8X/Iz+f1xJ7ZvGfioJ7VgGaz1KdUXbcCAsuXPFQ8c6TNcZeyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtbmDigeIsCtwO94gxbOTRYufIbXc7iD2+R8DtaWiYM=;
 b=j9+ypripmunkt1yWtH+CipZAXfqjAtMNuWxWv1C3rz+wygA8/B4Wmm0RJAnOeJM/4RDuzpMSxguZXa88wekUDmWhSdtNT0uw2VZUERSEOVvgdv9eEEX75ZTpflzY7s5IKB1/5Y+5Kq1pD4SBfAIyEU5q/zLbqg4wOLMTFodqTyRXIhVIjj4177x9xZzZm5WA6dF0emuaWSCTgfCjvzAf0oKvMGsq7xyD9hfYrJPRvAQyqj9XO4yQ+4gGn8dAlOAbv4J+FYp978nYfEoVtUHctS1VkWbVWk44r5X0PP+6pZmWgRO16qvOfAph4+nhRqlfKtlYejqBc4VmkNpbWW1TNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtbmDigeIsCtwO94gxbOTRYufIbXc7iD2+R8DtaWiYM=;
 b=SeHnwNtDtRYkVyZWi6yZggqgA3Tq2FZD/9q64EXLU+VzXCJaucuN7dSYzlyBHPpEFID2KbRRS5pXTHkUtI7CRuvdPlJvqzuBizGQbvxsN6B7ABEfUv+0vv5zzxKgdBghuEuAjh8TqQYIgv2f+jwUeR6zHPndprbIgs5DIdXgeRZliY23uxsTeNfiaaXFJMVI9EsSyDFAvMET64j3NcenGsEF0ITQFmGJq5t+WM5y78TRV6r0Y247ofQO5PZro3lKkTDVW8PGddu+NA+7eOzVXASdpm70s43j6zfCEfN0qal65fQYL3somCw4qR7j5j8zdgfrWS7cmOjAd4wdJtOK1g==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB2259.eurprd09.prod.outlook.com (2603:10a6:208:e4::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Sun, 9 Jan
 2022 09:23:55 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401%3]) with mapi id 15.20.4867.011; Sun, 9 Jan 2022
 09:23:55 +0000
Subject: Re: [OE-core][PATCH] qemu.bbclass: drop OLDEST_KERNEL reference
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211215201615.536707-1-matt@madison.systems>
 <8d74dd73e03223215a4799df4f7a17bc4b9706eb.camel@linuxfoundation.org>
 <CAGgRHJoyzifLStq3KQfPcHR9HYcQPR+vP=754K5K=3zrBaseqA@mail.gmail.com>
 <16C7FE06BC92B547.9201@lists.openembedded.org>
 <b6e67f9d1c5bff66c5c4ebb792ddf70f6ab3d12a.camel@linuxfoundation.org>
 <CAGgRHJr1UGOL1-p+242MvitOLaCBZKok2S+xDrCL74vndnZUag@mail.gmail.com>
 <93794e98cf7d13b438a1c51e0bd810df130e89e4.camel@linuxfoundation.org>
 <CAGgRHJpHEyuwCs1Hbu7QpZWvN6qrDXebL0iFJ8iryWpiYhNFMw@mail.gmail.com>
 <325a814a0aa94ddd4d0ef0d44a62a8e2b62e8e3e.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642D4D6332DB31362B0B538A84F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Sun, 9 Jan 2022 10:23:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <325a814a0aa94ddd4d0ef0d44a62a8e2b62e8e3e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [jKdLdyDt7EKGpG7CUCKXSJB0DgXGsLJeFfKfmb+tKC37LdGDmTThexiP0l17Fc+f]
X-ClientProxiedBy: AM9P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::19) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <c9da69e7-e05b-26b4-9c84-5c9054511c94@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99ac0ccb-59dd-4599-cf67-08d9d351c1ea
X-MS-TrafficTypeDiagnostic: AM0PR09MB2259:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6aDlEcXK1gewpL9rpn5Uxej6mYaQ/p2fggh7Y8X6VxjkNguiV4D2o0Q2J7WqQF7odZ5ybBD9aH/BwulSM29Cz0CIUu9V/XuCDVzJiuZi6x91pcs0/2d90uophAD1DV5G3Nibn9v3WkeW/LDl9+6opm7wlBxTe9/X+voCA9c3yc/edtszTKFfN/kaQDEoyeE5PUi9b6NZsTthdPvNgkPHjIwTfdLuX9up3hEPZZINlquSjRi5QAvv+GWxaE17spIzH81S1D80YI8UPc8WVe66jaWHt/vuj+5eKIYYdC0ZmbmHZKpuIA8QbFPj1woHLN7QdafvFBUiBy3gGYMqyJaEzk6VJO2JItcxylHpZiKuhpnASr1WBHWZLF5Se/pqLCCLKBOZZGv044mhOXg9nUe/rFxuFMGxOdZxQqBTZK5reDPhCwuHZSbgWsBA9J/vZQM39GYWq6aeBfUraH64YqkAGbccjq7cQwOU0qAr4ehoqdPMgNRJxMzQx65r2IXZ/VoY8UfBWYS5oCCOko0JvusAUi8nU9uzge4bJJyU7YoGzU7lU5g2jGAdFWaUf4tDTG4v8wPInaGYT7hBGHuLiAAVoNARUgVkFaH5+mRig+HQ4tugIy2O0TyUaoxTYov9WPxOiuRnhCaETTOpvw7KFhnt8mzhiobmD/2mE80DlWiC2jo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDVMVjFYby9EUUY2S2laSmdqYzZwdFBQckplajlQcWpwQmxsZG8yTERVZ3Na?=
 =?utf-8?B?QXFGK0RwZFpHdDVRRk5WMUw1b1pERWVNKzRMY2xYYkhvakpRM0tMcmlTQklO?=
 =?utf-8?B?UGtsZWEveGFDckNuVW1MUHB2bHFqNTY3NzQwUTU2K1MvTWRRZEJNYys2eTBD?=
 =?utf-8?B?VWxKQjdEVjVtYjdlcElZdDJWTzE2MXVjZEZIenptM0pJcFNVZTVtaW01ZGpN?=
 =?utf-8?B?ZFNHK0NBc3dRTnJqeURTdS9qS0V1czNNcmhyanU1NmdiSUg2cnBCSlYvVkVQ?=
 =?utf-8?B?dU9ObmVGR0pJNkRkbE1ZUWtmQThIZE1QVG9GZ2VIQXBBMHhNV2ZMZ09DLzRJ?=
 =?utf-8?B?RlpHTjVtSE96K2JiY3FXZXBOaERWaVFaZW5KVDhGek9MZ2xCN2tiaXg5aU4w?=
 =?utf-8?B?UTAyNWdjV1FSOEUyTFdzVFNDT0lxbFBLMUtpUGVObTJnMlFUMTM0MDFMK05z?=
 =?utf-8?B?UG52aXR5VTVGUzFHREg0Z3h2UE9rM3NodkZ0SzVRV2JiUEhnMGJncjVBLzEr?=
 =?utf-8?B?NWV5Y3JvdzJBNld1ejBOeVIrZjZrVTQ0ZGV5YWFtbkRvZE8wY3ZDTkJSdFNy?=
 =?utf-8?B?Y2sxaVovd24xWVZMeklQQ0g4OWNlL2wwNWpzNWFWRnRrRUExQ0xmMCthUzFz?=
 =?utf-8?B?Rk1iUDYwZStJeEorZlczekxIWTNtTnVDdngrQy9jRDA4bEwwRmw1S1p2Q1BJ?=
 =?utf-8?B?dzJlYU11QW9ka1hGeVBIYVc4WmV5SjFmdTlnRDRNNm10RUNOYXF4dTZnMkxU?=
 =?utf-8?B?dHVhSURNQytjaXkvY0k3S0dHTExOVU9WQVVINzNoYlFNR2FQaFR0d2pVRDNa?=
 =?utf-8?B?b3lZQk9QUGgxLzVtMXU1WWsrWEdXMElCcmIwbHNGZWw4c25xN1h2RmJRSVV5?=
 =?utf-8?B?ZTJ5Wi8rWGVKZVNQczg4a2p3dWNicXhmTUN5Zm1JQ0JIazFicXRNeXF3SS8r?=
 =?utf-8?B?bWViK21HQ3pOSytrdkhUVVM2WTJydnk0YjhRNEVad2dnbVQzWS9SWHpEVzM1?=
 =?utf-8?B?MzhaMGlkbGRFeklQSlVueG5EbTIzY2RTTzQxTDVGVkVibzAyVWx4eE44VVpp?=
 =?utf-8?B?bTkrclRINGQ5TTlSNzMyeVBCMkRnOGF6eEREWEdmVmd2aXh1ek9tSE1SR0Vu?=
 =?utf-8?B?bFZZUE5scGNFQTJZelZyMGFodkIvV2czMExsYXJUUElkSTFmU1JUM3Nybk11?=
 =?utf-8?B?MHd3NU5YOXliK2oycUl5ZGhkZkdYdHJDbzlCQ3VUdXhlQTRab2hnSTRwSHdC?=
 =?utf-8?B?OFB4YnVldHozQlpTWXN1Q0tEN053dWpRK0lyc1FlL29GLzZvMVNSbXRtMVdU?=
 =?utf-8?B?c0J1Y0kxWFJSM3EwbmlDOEdPZUVqRXdBRy9xbTJmcFZwQlJycHM1bXZqNEJm?=
 =?utf-8?B?enhoTC9wVnp5WkE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99ac0ccb-59dd-4599-cf67-08d9d351c1ea
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2022 09:23:55.2432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB2259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 09:24:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160279



On 08.01.22 16:13, Richard Purdie wrote:
> On Sat, 2022-01-08 at 07:10 -0800, Matt Madison wrote:
>> On Sat, Jan 8, 2022 at 6:34 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>
>>> On Fri, 2022-01-07 at 06:44 -0800, Matt Madison wrote:
>>>> On Fri, Jan 7, 2022 at 4:56 AM Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>
>>>>> On Fri, 2022-01-07 at 12:51 +0000, Richard Purdie via lists.openembedded.org
>>>>> wrote:
>>>>>> On Fri, 2022-01-07 at 04:36 -0800, Matt Madison wrote:
>>>>>>> On Fri, Jan 7, 2022 at 3:19 AM Richard Purdie
>>>>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>>>>>
>>>>>>>> On Wed, 2021-12-15 at 12:16 -0800, Matt Madison wrote:
>>>>>>>>> which is introducing task hash changes for some
>>>>>>>>> allarch package builds, and should no longer
>>>>>>>>> be needed with recent versions of qemu.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Matt Madison <matt@madison.systems>
>>>>>>>>> ---
>>>>>>>>>   meta/classes/qemu.bbclass | 2 +-
>>>>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
>>>>>>>>> index 01a7b86ae1..333202b7c4 100644
>>>>>>>>> --- a/meta/classes/qemu.bbclass
>>>>>>>>> +++ b/meta/classes/qemu.bbclass
>>>>>>>>> @@ -54,7 +54,7 @@ def qemu_run_binary(data, rootfs_path, binary):
>>>>>>>>>   # this dance). For others (e.g. arm) a -cpu option is not necessary, since the
>>>>>>>>>   # qemu-arm default CPU supports all required architecture levels.
>>>>>>>>>
>>>>>>>>> -QEMU_OPTIONS = "-r ${OLDEST_KERNEL} ${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
>>>>>>>>> +QEMU_OPTIONS = "${@d.getVar("QEMU_EXTRAOPTIONS_%s" % d.getVar('PACKAGE_ARCH')) or ""}"
>>>>>>>>>   QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>>>>>>>>>
>>>>>>>>>   QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
>>>>>>>>
>>>>>>>> I've sent a revert for this since the commit message isn't true, this is causing
>>>>>>>> autobuilder failures and there was also a user report of issues with it.
>>>>>>>
>>>>>>> Bummer.  I think this is because our OLDEST_KERNEL setting for aarch64
>>>>>>> (3.14.0) is
>>>>>>> higher than the UNAME_MINIMUM_RELEASE definition in QEMU (3.8.0).
>>>>>>>
>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/4559/steps/13/logs/stdio
>>>>>>>> (centos7 aarch64 build)
>>>>>>>>
>>>>>>>> We'll have to find a different way to fix the allarch issue (more details
>>>>>>>> welcome on which package shows the issue).
>>>>>>>
>>>>>>> I ran into the issue with cantarell-fonts and wayland-protocols, but
>>>>>>> any recipe that inherits both allarch and meson should trigger it.
>>>>>>>
>>>>>>> In my case, I have a layer check job for meta-tegra that runs
>>>>>>> yocto-check-layer with the --machines option specifying qemux86 and
>>>>>>> one of the (aarch64) machines in my layer, and that was reporting the
>>>>>>> signature changes between the two architectures.
>>>>>>
>>>>>> I wonder why we don't detect that with our standard tests? :/
>>>>>>
>>>>>> There may be another fix:
>>>>>>
>>>>>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
>>>>>> index 5bd5c44a276..0aadf7bfba6 100644
>>>>>> --- a/meta/classes/allarch.bbclass
>>>>>> +++ b/meta/classes/allarch.bbclass
>>>>>> @@ -43,6 +43,9 @@ python () {
>>>>>>           d.setVar("TARGET_LDFLAGS", "none")
>>>>>>           d.setVar("POPULATESYSROOTDEPS", "")
>>>>>>
>>>>>> +        if bb.data.inherits_class("meson", d):
>>>>>> +            d.setVar("do_write_config", ":")
>>>>>> +
>>>>>>           # Avoid this being unnecessarily different due to nuances of
>>>>>>           # the target machine that aren't important for "all" arch
>>>>>>           # packages.
>>>>>>
>>>>>>
>>>>>
>>>>> Sorry, that isn't quite right. We want to just remove the append to write_config
>>>>> which generates the qemu wrapper which will probably need a little more invasive
>>>>> juggling of the code to make it easier...
>>>>
>>>> Your patch to disable the qemu wrapper for allarch looks like a good solution.
>>>> Hopefully, that will work OK across the board.
>>>
>>> It seemed to be so I've merged it. Am hoping this resolves things!
>>
>> Drat. Unfortunately, it only works if allarch is inherited after meson
>> (which inherits qemu).  So cantarell-fonts checks out OK,
>> but wayland-protocols doesn't, since it inherits allarch first.
> 
> Probably easy to fix but hard to spot new problems :/

would an insane check similar to native-last be of help here?

> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160277): https://lists.openembedded.org/g/openembedded-core/message/160277
> Mute This Topic: https://lists.openembedded.org/mt/87752526/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

