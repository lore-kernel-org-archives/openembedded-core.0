Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A100C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 11:41:09 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.13228.1677757267379768319
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 03:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D17UnEw9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AF94724000B;
	Thu,  2 Mar 2023 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677757265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XZFpydivFYVJGu4MB8vph7YtW7y0zB5Dsduwklj2vmA=;
	b=D17UnEw9GdKmesrsER+/r1bPrdcFzEBxhIlkIg7PCQmj6sCqoTxx3D3KxjX4SIVbRUd5tI
	G25Imj4vQRHjVTs7Pj85pxlkbPjGoIN/FmU6Xzio0OZ6bs7dzlfwk+kzt9afJ1/sv2cNhn
	cy1oAnDFSwrvH/ZDfO1g5R7ZB1FO6JiF1TrUKZHHeEnKD5KxCk21rjWy3qWSeBiU4PZHbM
	ZN3N7/0RI8b3H63UfUTGS3Qyz+LXWR1++tR/K7stQjL8TM6ehvjhv5tgs8+Xo64VJ7TD0W
	Nrlj0O82A9UO3j0hK89N81cwHFGu+KvGhbIxczKNWNjYvGo9WTk0g4KLjVewWg==
Date: Thu, 2 Mar 2023 12:41:04 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] binutils: Enable --enable-new-dtags
Message-ID: <ZACLUF3CCWTAerRu@mail.local>
References: <20230223065816.3151823-1-raj.khem@gmail.com>
 <Y/4pZDsT0R9iSH+m@mail.local>
 <CAMKF1sqGofMPYDJXC55N3Cy+H2q7N__KNHw6NWn8YkfD8ePkPA@mail.gmail.com>
 <e5614f07a3ec48650b1bcea2a3df570e725234d2.camel@linuxfoundation.org>
 <Y/6D8FQZMWzf4TZq@mail.local>
 <17484164C4F9625C.21178@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17484164C4F9625C.21178@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 11:41:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177961

On 01/03/2023 10:25:58+0100, Alexandre Belloni via lists.openembedded.org wrote:
> On 28/02/2023 23:45:05+0100, Alexandre Belloni wrote:
> > On 28/02/2023 17:50:05+0000, Richard Purdie wrote:
> > > On Tue, 2023-02-28 at 08:43 -0800, Khem Raj wrote:
> > > > On Tue, Feb 28, 2023 at 8:18 AM Alexandre Belloni
> > > > <alexandre.belloni@bootlin.com> wrote:
> > > > > 
> > > > > Hello Khem,
> > > > > 
> > > > > As discussed I gave it a go again and got this:
> > > > > 
> > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_corefile_thread(thread_info*, linux_corefile_thread_data*)':
> > > > > > linux-tdep.c:(.text+0x13ac): undefined reference to `gcore_elf_build_thread_register_notes(gdbarch*, thread_info*, gdb_signal, bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > > > > /home/pokybuild/yocto-worker/qemuarm/build/build/tmp/hosttools/ld: linux-tdep.o: in function `linux_make_corefile_notes(gdbarch*, bfd*, int*)':
> > > > > > linux-tdep.c:(.text+0x49d7): undefined reference to `gcore_elf_make_tdesc_note(bfd*, std::unique_ptr<char, gdb::xfree_deleter<char> >*, int*)'
> > > > > > collect2: error: ld returned 1 exit status
> > > > > > make[2]: *** [Makefile:2149: gdb] Error 1
> > > > > > make[2]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi/gdb'
> > > > > > make[1]: *** [Makefile:11122: all-gdb] Error 2
> > > > > > make[1]: Leaving directory '/home/pokybuild/yocto-worker/qemuarm/build/build/tmp/work/x86_64-linux/gdb-cross-arm/13.1-r0/build-arm-poky-linux-gnueabi'
> > > > > > make: *** [Makefile:1005: all] Error 2
> > > > > > ERROR: oe_runmake failed
> > > > 
> > > > Is this host running updated buildtools tarball after the binutils ld
> > > > search path fix ?
> > > 
> > > Yes, it should be.
> > 
> > Khem, you are probably right that this is host related, this failed
> > again on ubuntu2004:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/6689/steps/14/logs/stdio
> > 
> > I'm wondering whether this reproduces on master and we have simply been
> > lucky.
> 
> This doesn't reproduce on master on ubuntu2004 so I guess it is really
> cause by the binutils upgrade.

I was wrong, it just reproduced on master, debian11-ty-3:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/6730/steps/15/logs/stdio

> 
> The other issue is still repro:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2472/steps/12/logs/stdio
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230228-nmn0h352/packages/diff-html/
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177879): https://lists.openembedded.org/g/openembedded-core/message/177879
> Mute This Topic: https://lists.openembedded.org/mt/97178429/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

