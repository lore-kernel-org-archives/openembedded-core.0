Return-Path: <lw@hqv.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5495C369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:19:06 +0000 (UTC)
Received: from amphora.sui-inter.net (amphora.sui-inter.net [80.74.147.33])
 by mx.groups.io with SMTP id smtpd.web11.4628.1744881543715793545
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 02:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: hqv.ch, ip: 80.74.147.33, mailfrom: lw@hqv.ch)
Received: from [10.20.1.252] (localhost [127.0.0.1]) by amphora.sui-inter.net (Postfix) with ESMTPSA id 5E914968226A
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 11:19:01 +0200 (CEST)
Authentication-Results: amphora.sui-inter.net;
        spf=pass (sender IP is 85.195.220.82) smtp.mailfrom=lw@hqv.ch smtp.helo=[10.20.1.252]
Received-SPF: pass (amphora.sui-inter.net: connection is authenticated)
Message-ID: <fca110ec-3292-4074-9b80-57ebb6e358b6@hqv.ch>
Date: Thu, 17 Apr 2025 11:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] python3: Allow to specify which pyc files to keep
To: openembedded-core@lists.openembedded.org
References: <CANNYZj9r9D7PzkGm-5tPQVTyU_MkyQngS+RbZii6+4YToGNLVg@mail.gmail.com>
 <31851.1744290321098835072@lists.openembedded.org>
 <CANNYZj8JQf8tzC2g7k__TM0B967-szdV=4gt_-tBcNjXL65mXw@mail.gmail.com>
 <73578c4c-6107-4fac-ab34-9f065db39d81@topic.nl>
Content-Language: en-US
From: Lukas Woodtli <lw@hqv.ch>
In-Reply-To: <73578c4c-6107-4fac-ab34-9f065db39d81@topic.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 09:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215045

The hardware you describe closely resembles our latest Linux-based 
product. Unfortunately, we need to work with such outdated and 
constrained technology.

Regarding the compilation and optimization of Python files:

We need the files to be pre-compiled at build-time. Otherwise, the 
initial startup of the device takes too long due to the compilation 
process and saving the compiled files to the flash. This slows the 
system down to the point where our services are killed by the watchdog.

Asserts should not be active in the production build. They are not a 
replacement for proper error handling. Disabling asserts in release 
builds is considered best practice, regardless of the programming 
environment. In my experience, this approach works also well with Python 
projects.

Removing docstrings is more critical. Some packages require docstrings 
to be available at runtime in the native Python interpreter on the build 
hose. However, we have not encountered any issues removing them on the 
target device. This results in a small saving in storage space, but we 
take every bit.

We will also consider removing all .py files and relying solely on 
optimized .pyc files.

I have implemented the necessary optimizations internally, as there does 
not seem to be sufficient interest in supporting them upstream.

One could argue that Python is not the ideal technology for such a 
limited device, but that's another story...

Regards,
Lukas



On 11.04.25 10:55, Mike Looijmans via lists.openembedded.org wrote:
> On 10-04-2025 16:31, Alexander Kanavin via lists.openembedded.org wrote:
>> On Thu, 10 Apr 2025 at 15:05, Lukas Woodtli via lists.openembedded.org
>> <lw=hqv.ch@lists.openembedded.org> wrote:
>>> The reason to use these features of the Python interpreter is that 
>>> we develop for
>>> resource restricted devices. The target device should not need to 
>>> compile the Python
>>> files to byte-code at runtime (which happens regardless of the 
>>> optimization level).
>>> We can do this work at build time. Moreover, Embedded devices usually
>>> have restricted storage size. So using the optimization level 2 for 
>>> pyc files is sensible.
>>> Most embedded devices don't need the docstrings in the Python files 
>>> (simmilar to
>>> not needing the man pages). So we can get rid of them (that is what 
>>> optimization
>>> level 2 does, apart from disabling asserts).
>> Most embedded devices also need to be robust. Lest you forget, python
>> and its extensions are written in C, and asserts prevent what is
>> over-generously termed 'undefined behavior', with a loud crash. Which
>> is a feature some people find useful. Can you demonstrate speedups?
>>
>> Docstrings argument as well needs to be substantiated with numbers.
>> How much space is actually being saved?
>>
>> Is there anything else to these optimizations? Is it documented
>> anywhere? How can we know if it changes over time, with new python
>> releases? I feel like this needs to be considered far more carefully
>> than you have so far.
>
> Getting a deja-vu feel here... We've used a similar approach in the 
> past for OpenPLi, as we had to cram the full DVB settop box GUI 
> firmware into 32MB NAND flash for some boxes.
>
> The impact of the "optimization" on runtime performance was 
> negligible, and we're talking about 200-400 MHz MIPS CPU systems in 
> those days.
>
> Python's optimization level 2 is sure to break things. Quite a large 
> software base uses asserts and docstrings for their internal purposes. 
> One might argue that that is "broken", but that's not something that 
> can be fixed from this side...
>
> We didn't experience any ill effects from optimization level 1, so the 
> we just patched the Python stuff to just always use that, regardless 
> of the file extension being pyc.
>
> As for space savings, the best thing was to omit the "py" files. That 
> results in more than halving the space required. To accomplish that, 
> we split the packages and put all "py" source files into a "-src" 
> package. So on the end product, only the pyc files got installed and 
> developers could optionally install some -src packages if they wanted 
> to hack on the box itself (the major advantage of using Python).
>
> M.
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214720): https://lists.openembedded.org/g/openembedded-core/message/214720
> Mute This Topic: https://lists.openembedded.org/mt/112186823/9160547
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [lw@hqv.ch]
> -=-=-=-=-=-=-=-=-=-=-=-
>

