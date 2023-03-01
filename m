Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801B4C64EC7
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:06 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.18069.1677662761454006589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 01:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Wt7nS64g;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 337BA240012;
	Wed,  1 Mar 2023 09:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677662759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FFLTqdxmGk0B56UWThRsPl7B79AI+HYssr472OTFUS8=;
	b=Wt7nS64gMsDIYSpXe2qUfqohHfBeDqEw2WTNCm90BKBHoNAz72EZM1y0HvhF3JfEXrzN91
	gmL2AUMkcKEm2HjvujWkrdrTWgfXtFA4j3+x/QJ+vJuX2GQR+epk92byz7pioRdUgNv5D1
	YZlXVWTu1yyD3yvEeB56d4LTswTqCRmV0UQBqvRZNInZUQ1AULbU6sAN13FXjdBHrGNQPG
	To7nFdwRgNNE91WH4epR4wQyXbbAi/A8QtZW9OZM4B5335ejApTROafgnPi2mAnTPMWVX6
	8pwFKFs/SphKlDFKaf0ZdzSqyJZQ+EnqJV/gAH70fAphqXKEzR6aClEEMc5fqg==
Date: Wed, 1 Mar 2023 10:25:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
Message-ID: <Y/8aJqf2zOgp8pE7@mail.local>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
 <Y/4pZDsT0R9iSH+m@mail.local>
 <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
 <e5614f07a3ec48650b1bcea2a3df570e725234d2.camel@linuxfoundation.org>
 <Y/6D8FQZMWzf4TZq@mail.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/6D8FQZMWzf4TZq@mail.local>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 09:26:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177879

On 28/02/2023 23:45:05+0100, Alexandre Belloni wrote:
> On 28/02/2023 17:50:05+0000, Richard Purdie wrote:
> > On Tue, 2023-02-28 at 08:43 -0800, Khem Raj wrote:
> > > On Tue, Feb 28, 2023 at 8:18 AM Alexandre Belloni
> > > <alexandre.belloni@bootlin.com> wrote:
> > > > 
> > > > Hello Khem,
> > > > 
> > > > As discussed I gave it a go again and got this:
> > > > 
> > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_corefile_thread(thread_info*, linux_corefile_thread_data*)':
> > > > > linux-tdep.c:(.text+0x13ac): undefined reference to `gcore_elf_build_thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bfd*, int*)':
> > > > > linux-tdep.c:(.text+0x49d7): undefined reference to `gcore_elf_make_tdesc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > > > collect2: error: ld returned 1 exit status
> > > > > make[2]: *** [Makefile:2149: gdb] Error 1
> > > > > make[2]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi/gdb'
> > > > > make[1]: *** [Makefile:11122: all-gdb] Error 2
> > > > > make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi'
> > > > > make: *** [Makefile:1005: all] Error 2
> > > > > ERROR: oe_runmake failed
> > > 
> > > Is this host running updated buildtools tarball after the binutils ld
> > > search path fix ?
> > 
> > Yes, it should be.
> 
> Khem, you are probably right that this is host related, this failed
> again on ubuntu2004:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/6689/steps/14/logs/stdio
> 
> I'm wondering whether this reproduces on master and we have simply been
> lucky.

This doesn't reproduce on master on ubuntu2004 so I guess it is really
cause by the binutils upgrade.

The other issue is still repro:
https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2472/steps/12/logs/stdio
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230228-nmn0h352/packages/diff-html/


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

