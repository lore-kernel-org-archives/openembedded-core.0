Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3FBCFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 15:51:58 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21588.1764258717638851441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 07:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 5ARFpu0O3157115;
	Thu, 27 Nov 2025 09:51:56 -0600
Received: from [192.168.2.169] ([192.168.2.169])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 5ARFpudl028067;
	Thu, 27 Nov 2025 09:51:56 -0600
Message-ID: <e57cb67b-f83f-45bb-a345-b11f49b3ca6b@kernel.crashing.org>
Date: Thu, 27 Nov 2025 09:51:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and
 raise an error on unknown architecture
Content-Language: en-US
To: peter.marko@siemens.com, Steve Sakoman <steve@sakoman.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1763849517.git.steve@sakoman.com>
 <e6de433ccb2784581d6c775cce97f414ef9334b1.1763849517.git.steve@sakoman.com>
 <187BB63A9D5CD718.192695@lists.openembedded.org>
 <bc058d00-62fa-4c96-ba4d-7b9357f48651@kernel.crashing.org>
 <AS1PR10MB5697C9581D88FF708572830CFDDFA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <AS1PR10MB5697C9581D88FF708572830CFDDFA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 15:51:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226845



On 11/27/25 1:00 AM, Peter Marko via lists.openembedded.org wrote:
> 
> 
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Mark Hatle
>> Sent: Thursday, November 27, 2025 2:02
>> To: Steve Sakoman <steve@sakoman.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core][scarthgap 14/21] lib/oe/go: document map_arch, and raise
>> an error on unknown architecture
>>
>> I have a possible workaround, for microblaze, for this.
>>
>> Basically it's to force include a class that does:
>>
>> python __anonymous() {
>>       if bb.data.inherits_class('goarch', d):
>>           if d.getVar('TARGET_ARCH') in ['microblaze', 'microblazeel',
>> 'microblazeeb']:
>>               raise bb.parse.SkipRecipe("Go does not support microblaze.")
>> }
>>
>> On 11/26/25 6:40 PM, Mark Hatle wrote:
>>> This patch breaks Microblaze for me.
>>>
>>> Microblazeel is not in the list of course, but go doesn't support this architecture.
>>>
>>> During parsing of various things, instead of the component not being available I
>>> now get many many lines similar to:
>>>
>>> WARNING: <recipe>: Exception during build_dependencies for GOARCH
>>> WARNING: <recipe>: Error during finalize of <multiconfig>
>>> ERROR: ExpansionError during parsing <recipe>
>>> bb.data_smart.ExceptionError: Failure expanding TARGET_GOARCH,
>> expression was
>>> ${go_map_arch(d.getVar('TARGET_ARCH'), d)} which triggered exception
>> KeyError:
>>> 'Cannot map architecture microblazeel'
>>> The variable dependency chain for the failure is: TARGET_GOARCH -> GOARCH
>>>
>>> (at which point parsing stops)
>>>
>>> I see no obvious way here to add an architecture that OE/Poky does not
>> support,
>>> which now makes this a hard error for any architecture not supported by the core
>>> of OE and/or go.  (in the case of microblaze, rust and go are likely to never be
>>> supported.  So there has to be a way for me to avoid the parse error in these
>>> cases.)
> 
> OK, that's unfortunate.
> 
> However this is something that needed a review when pushed to master branch half a year ago.
> This backport then just means you see it half a year ahead of migrating to new LTS release.
> 
> Possibly submit a revert or other adaptation to master branch and we can backport it then to scarthgap .

I do NOT believe this should be reverted in master.  Master is different then 
scarthgap, and per my other reply to Peter Kjellerstedt I think it should be 
adjusted.  I'm willing to try to suggest the adjustments to master.

It's scarthgap that I think this should be reverted.  It's a change in behavior 
from prior scarthgap and absolutely broke my existing (functional) layer.  With 
that said, I have a 'workaround' for it, but it's going to take me time to QA 
everything and get it in for my scarthgap users.

My objection is to changing system behavior in the LTS, nothing more in this case.

--Mark

> Peter
> 
>>>
>>> On 11/22/25 4:14 PM, Steve Sakoman wrote:
>>>> From: Ross Burton <ross.burton@arm.com>
>>>>
>>>> Add a comment explaining what this function does and where the values
>>>> come from.
>>>>
>>>> If the architecture isn't know, instead of returning an empty string
>>>> which could fail mysteriously, raise a KeyError so it fails quickly.
>>>>
>>>> (From OE-Core rev: 025414c16319b068df1cd757ad9a3c987a6b871d)
>>>>
>>>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>>> ---
>>>>     meta/lib/oe/go.py | 6 +++++-
>>>>     1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
>>>> index dfd957d157..4559dc63b2 100644
>>>> --- a/meta/lib/oe/go.py
>>>> +++ b/meta/lib/oe/go.py
>>>> @@ -7,6 +7,10 @@
>>>>     import re
>>>>
>>>>     def map_arch(a):
>>>> +    """
>>>> +    Map our architecture names to Go's GOARCH names.
>>>> +    See https://github.com/golang/go/blob/master/src/internal/syslist/syslist.go
>> for the complete list.
>>>> +    """
>>>>         if re.match('i.86', a):
>>>>             return '386'
>>>>         elif a == 'x86_64':
>>>> @@ -31,4 +35,4 @@ def map_arch(a):
>>>>             return 'riscv64'
>>>>         elif a == 'loongarch64':
>>>>             return 'loong64'
>>>> -    return ''
>>>> +    raise KeyError(f"Cannot map architecture {a}")
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#226827): https://lists.openembedded.org/g/openembedded-core/message/226827
>>>> Mute This Topic: https://lists.openembedded.org/mt/116430143/3616948
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>

