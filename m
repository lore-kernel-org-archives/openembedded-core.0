Return-Path: <martin.beeger@online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE76C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Feb 2022 16:32:33 +0000 (UTC)
Received: from mail.indurad.com (mail.indurad.com [194.8.217.179])
 by mx.groups.io with SMTP id smtpd.web08.36782.1644856352249408120
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Feb 2022 08:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=softfail (domain: online.de, ip: 194.8.217.179, mailfrom: martin.beeger@online.de)
X-Virus-Scanned: Debian amavisd-new at mail.indurad.com
Received: from [10.144.1.55] (perlenbacher.bvd.indurad.x [10.144.1.55])
	by mail-rc1.bvd.indurad.x (Postfix) with ESMTPSA id 98BED16F6;
	Mon, 14 Feb 2022 17:32:28 +0100 (CET)
Message-ID: <61e8c8ee-5ddc-b3b7-44c2-30eb7546e3d0@online.de>
Date: Mon, 14 Feb 2022 17:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH] cmake: read asm flags correctly from
 environment in toolchain file
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220214153807.21216-1-martin.beeger@online.de>
 <ba611eefa813d1edeccea304b96937943113270e.camel@linuxfoundation.org>
From: Martin Beeger <martin.beeger@online.de>
In-Reply-To: 
 <ba611eefa813d1edeccea304b96937943113270e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Feb 2022 16:32:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161725


> I'm a little more puzzled on this one since whilst we set CFLAGS and CXXFLAGS in
> bitbake.conf, we don't set ASMFLAGS and it wouldn't be present in our
> environment.
>
> Perhaps this should be $ENV{CFLAGS} instead of ${CMAKE_C_FLAGS}? There are flags
> in our CFLAGS which like need to be passed to the assembler too?

I am a bit unsure now about this.
As far as I understand the environment-setup will not set ASMFLAGS, that 
is correct. For all non-cmake recipes, the compiler will not pick up 
CFLAGS instead. It will simply still use no extra parameters for the 
inline assembly.
In cmake it will use the CFLAGS for the ASM too, yielding inconsistent 
behaviour over build systems. Is that really a good thing?

Also the CFLAGS are usually "-O2 -g". At least the -g parameter will 
have limited effect for the assembly, and optimizations for inline 
assembly are also extremely limited.
So the practical difference between both modes and whether the flags 
propagate through is minimal, if at all existent.

All critical compiler parameters like the --sysroot and others are not 
stored in CFLAGS, but are instead directly appended to the compiler 
executable path for CC, CXX and so on. These are always applied and 
cmake does understand these, parses them out, forces them to always be 
there etc.
This code has nothing to do with that, it only impacts the optimization 
and debugging flags.

This patch makes this behaviour consistent between cmake and non-cmake 
recipes in that is never applies ASM flags, instead of inconsistently 
applying them.


