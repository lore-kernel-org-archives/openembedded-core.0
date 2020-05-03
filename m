Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by mx.groups.io with SMTP id smtpd.web11.20348.1588503303958399383
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 03:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: zonque.org, ip: 46.23.86.59, mailfrom: daniel@zonque.org)
Received: from [192.168.178.106] (pD95EFBD9.dip0.t-ipconnect.de [217.94.251.217])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 31326403776
	for <openembedded-core@lists.openembedded.org>; Sun,  3 May 2020 10:52:25 +0000 (UTC)
Subject: Re: [OE-core] [PATCH] Add -fcommon to BUILD_CFLAGS to a number of recipes
To: openembedded-core@lists.openembedded.org
References: <20200503082640.3686916-1-daniel@zonque.org>
 <e9f18f5d8df6e34e0cf7a81f2860b62a795623f4.camel@linuxfoundation.org>
From: "Daniel Mack" <daniel@zonque.org>
Message-ID: <527b9801-2d77-e337-b799-4f2a14e6aa62@zonque.org>
Date: Sun, 3 May 2020 12:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e9f18f5d8df6e34e0cf7a81f2860b62a795623f4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

Thanks a lot for checking!


On 5/3/20 12:04 PM, Richard Purdie wrote:
> On Sun, 2020-05-03 at 10:26 +0200, Daniel Mack wrote:
>> When building on a gcc 10 enabled host distribution (such as Fedora
>> 32),
>> a number of recipies need explicit treatment to enable '-fcommon' in
>> BUILD_CFLAGS. There might be more of those fixes needed.
>>
>> Commit 46827b8616 ("recipes: Use -fcommon explicitly") already
>> addressed
>> that for some places, but tweaking CFLAGS doesn't seem to suffice.
> 
> Thanks for this, its definitely something we need to fid.
> 
> The work in the previous patch was fixing gcc 10 target builds, not
> host. Your patch changes CFLAGS to BUILD_CFLAGS in places which means
> when we upgrade to gcc 10 things will break.

Ah, I wasn't aware that cross-compilation is ready for gcc 10 yet. Okay,
that makes sense.

> Basically:
> 
> CFLAGS should cover build and target
> TARGET_CFLAGS should cover target builds (gcc cross as gcc 10)
> BUILD_CFLAGS should cover host tools (gcc 10 on the host)
> 
> so the correct place should be CFLAGS which should cover target and
> build (host).

I assumed that, yes, but at least for the recipes I addressed in my
patch, that doesn't cut it.

That said, there is also another patch needed for syslinux that doesn't
seem to allow injecting CFLAGS externally.

> Its possible that some recipes build native and target components in
> which case they might use CFLAGS and BUILD_CFLAGS. Based on what you
> say in the commit message, there might be a bug and we might be missing
> injecting CFLAGS into BUILD_CFLAGS.
> 
> I think this is going to need a little more investigation to get it
> right.

Alright. I'm happy to respin my patch or test alternative approaches.
After all, gcc 10 will have more exposure very soon with more
distributions are picking it up as default compiler.


Thanks,
Daniel
