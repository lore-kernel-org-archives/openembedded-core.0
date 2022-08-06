Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2EEC19F2D
	for <webhook@archiver.kernel.org>; Sat,  6 Aug 2022 15:54:25 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web12.4605.1659801261018668502
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Aug 2022 08:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57,
 mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.236] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 276FqHgu014313;
	Sat, 6 Aug 2022 10:52:17 -0500
Message-ID: <f888c905-6f65-550a-4503-781be2a66f5f@kernel.crashing.org>
Date: Sat, 6 Aug 2022 10:52:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [OE-core] pseudo deadlock in rust via malloc backtrace
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <f870b8169472e6737c99c74779e5680b935d57ed.camel@linuxfoundation.org>
 <CAMKF1spReLumv7Hc_683PRMgYSBSdh4oYW+YEtuiGEWof0kv2w@mail.gmail.com>
 <5cde45cec9a5aa114efce822f506502fa193c7f9.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: 
 <5cde45cec9a5aa114efce822f506502fa193c7f9.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Aug 2022 15:54:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168976



On 8/4/22 11:27 AM, Richard Purdie wrote:
> On Thu, 2022-08-04 at 12:36 +0100, Khem Raj wrote:
>>
>>
>> On Thu, Aug 4, 2022 at 10:05 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> Just to note that where we've been seeing pseudo hangs in rust, it
>>> seems jemalloc calls obtain_malloc_conf() which calls readlink()
>>> which
>>> pseudo intercepts and then calls malloc() which loops back to
>>> jemalloc
>>> which deadlocks. What fun.
>>>

(Going way back) the way this was avoided in the distant past was having a 
static variable of whatever the 'max size' was already allocated in a few key 
locations and using that variable instead of a malloc.  (Of course due to it 
having a fixed length a size check and such needed to be done.)

I don't really know the context at this point for this item, but it's an 
alternative way to solve this problem, but will require memory to be allocated 
at compile time, either in a function or a small global pool for usage.

It does make me wonder if there are other function in the system that use malloc 
and if so could they use an alternative, if not the 'is_init' might be the only 
way to handle it.

--Mark

>>
>> I guess pseudo is doing this extra malloc right ?
> 
> Yes
> 
>>   Maybe disable instrumentation in jemalloc when building non target
>> packages. This might avoid the issue at least
>>
> 
> Sadly it doesn't help as it wants to load it isn't configuration and
> the system setup from /proc too.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168861): https://lists.openembedded.org/g/openembedded-core/message/168861
> Mute This Topic: https://lists.openembedded.org/mt/92809824/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

