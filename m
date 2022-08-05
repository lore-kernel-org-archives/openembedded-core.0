Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7D4C00140
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:08:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.6537.1659704914208090319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=f0iwHTeF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BF31EFF80B;
	Fri,  5 Aug 2022 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659704912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5RURScSncnHUYdDkT/U9Ufp0z5Xvjfdfkf2PymNNoS4=;
	b=f0iwHTeFmmGHgmn0dUXLFeXWEsSoYF7cAYdHbmRXAA05jrCGKQYZvDV4Syb1xl0gVp0xS6
	zdGYACR4u1lPRxC79N2sM9BXmjn8KdDUF+2jCm72uIaMnATQQL4tWpgT2rMqZztCjdyUzI
	u+nzWwL6FK/ZD+MWpLy2I0oqoE02rdekYgLn6KYExohzhRWASMxM5FjmXyNj9EHdz6EHzQ
	Ee2cenAAex7RKxhgnUsFA9nxgFTdE2efIiVQS/mouZ9IdXLI3PRGTT4sEbvLl5NGkjbvOD
	ZH098irrwlA9KQ1Ct8/gdRYham6pv0KoOWzRR+gtP/7qT+YFcUwj5KGEsFqR5w==
Date: Fri, 5 Aug 2022 15:08:31 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] linux-yocto 5.15.48 reproducibility failure
Message-ID: <Yu0WTzQadL7sYBas@mail.local>
References: <YsWOLwlNxhAq7sKz@mail.local>
 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
 <830db8ea9f131bf577340c92a36cb5b7870f315f.camel@linuxfoundation.org>
 <CADkTA4OEvF-MDtYRaMfT=1_FGS78XDtL+gJmO1Wn3m_6tKUyeQ@mail.gmail.com>
 <170812024C9E55A6.12743@lists.openembedded.org>
 <ffef70ec3c7139d4be3fc234c7df1362c21930a5.camel@linuxfoundation.org>
 <CADkTA4M55pivv=8QCW8DO3je1QsZsB8nJX7w_+QC1zqm2YKNyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CADkTA4M55pivv=8QCW8DO3je1QsZsB8nJX7w_+QC1zqm2YKNyw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:08:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168934

On 04/08/2022 09:38:44-0400, Bruce Ashfield wrote:
> On Thu, Aug 4, 2022 at 3:27 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Thu, 2022-08-04 at 07:57 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2022-08-03 at 22:33 -0400, Bruce Ashfield wrote:
> > > > On Wed, Aug 3, 2022 at 6:46 PM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Wed, 2022-08-03 at 11:50 -1000, Steve Sakoman wrote:
> > > > > > On Wed, Jul 6, 2022 at 4:05 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
> > > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > > >
> > > > > > > > On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > > > > > > > > Hello Bruce,
> > > > > > > > >
> > > > > > > > > I got the following reproducible build failures:
> > > > > > > > >
> > > > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/steps/12/logs/stdio
> > > > > > > > >
> > > > > > > > > To me, it looks like the in-kernel config changed, did the compression
> > > > > > > > > alg change?
> > > > > > > > >
> > > > > > > > > Are you able to look at that soon or should I file a bug?
> > > > > > > >
> > > > > > > > FWIW,
> > > > > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220705-g8ltxczy/packages/diff-html/
> > > > > > > >
> > > > > > > > and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y changed value...
> > > > > > >
> > > > > > > A quick look at the -stable queue to init/Kconfig does indeed show
> > > > > > > that option arriving .. from my scan of the change, it looks like
> > > > > > > there are different compilers on the hosts, and hence that check is
> > > > > > > detecting a buggy gcc (or not) and changing the value.
> > > > > > >
> > > > > > > So one of the build hosts is failing the test, and another isn't.
> > > > > > >
> > > > > > > I'm not sure how to fix that, unless we revert the change. I'll ponder it more.
> > > > > >
> > > > > > Was this issue ever resolved?  I'm seeing it on kirkstone now too :-(
> > > > >
> > > > > No, it wasn't. I took a quick look and my best guess is that we now
> > > > > have the kernel wanting to do $CC tests in kConfig and we don't set CC
> > > > > properly for all our make config calls. I chucked this in master-next
> > > > > as a quick guess at a possible fix:
> > > > >
> > > >
> > > > That's what we've had to do with the linker in the past, so that is
> > > > generally speaking the right place to force the compiler.
> > > >
> > > > > https://git.yoctoproject.org/poky/commit/?h=master-next&id=944cc04d1ed316a5652f3d058b966d4cfb9a6b73
> > > > >
> > > > > but others might know better where we might be missing the CC settings.
> > > > > I suspect we need to clean up our parameters a bit looking at the
> > > > > different call site differences.
> > > >
> > > > That being said, merge_config uses the compiler like so:
> > > >
> > > > # Use the merged file as the starting point for:
> > > > # alldefconfig: Fills in any missing symbols with Kconfig default
> > > > # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> > > > make HOSTCC="$HOSTCC" HOSTLD="$HOSTLD" CC="$CC" LD="$LD" \
> > > >         KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> > > >
> > > > And we call it like this:
> > > >
> > > > CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> > > > ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"
> > > > CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O
> > > > ${B} ${config_flags} ${configs} >
> > > > ${meta_dir}/cfg/merge_config_build.log 2>&1
> > > >
> > > > So for the merging of fragments, we are already covered.
> > > >
> > > > and kernel_do_configure calls: KERNEL_CONFIG_COMMAND as the last thing
> > > > it does, which is:
> > > >
> > > > KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}"
> > > > LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B}
> > > > CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"
> > > >
> > > > Which already does set CC to KERNEL_CC.
> > > >
> > > > So unless I'm missing how KCONFIG_CONFIG_COMMAND is sneaking in, I
> > > > expect the behaviour will still be the same.
> > > >
> > > > I spent the day digging through 5.19 kernel issues, so only had a few
> > > > minutes to look at this tonight .. and it is late, so I very easily
> > > > could have missed something.
> > >
> > > You're not missing anything, it didn't help.
> > >
> > > We're seeing this on ubuntu1804 so I logged in there and experimented.
> > > CC is set correctly. What isn't working well is the "echo". If I change
> > > the command to use /bin/echo instead of plain "echo" (which is probably
> > > a shell builtin), it works. Otherwise running manually I see:
> > >
> > > <stdin>: In function 'foo':
> > > <stdin>:1:29: warning: missing terminating " character
> > > <stdin>:1:29: error: missing terminating " character
> > > <stdin>:2:5: error: expected ':' before '+' token
> > > <stdin>:2:7: warning: missing terminating " character
> > > <stdin>:2:7: error: missing terminating " character
> > > <stdin>:2:1: error: expected declaration or statement at end of input
> > >
> > > It is looking like this is a dash vs. bash issue. Not sure how we fix
> > > it yet but it points to where the issue may be.
> >
> > pokybuild@ubuntu1804-ty-3:~$ /bin/dash
> > $ echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }' | x86_64-poky-linux-gcc -x c - -c -o /dev/null; echo $?
> > <stdin>: In function 'foo':
> > <stdin>:1:29: warning: missing terminating " character
> > <stdin>:1:29: error: missing terminating " character
> > <stdin>:2:5: error: expected ':' before '+' token
> > <stdin>:2:7: warning: missing terminating " character
> > <stdin>:2:7: error: missing terminating " character
> > <stdin>:2:1: error: expected declaration or statement at end of input
> > 1
> > $ exit
> > pokybuild@ubuntu1804-ty-3:~$ bash
> > pokybuild@ubuntu1804-ty-3:~$ echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }' | x86_64-poky-linux-gcc -x c - -c -o /dev/null; echo $?
> > 0
> >
> > I think the command gets executed by the code in
> > scripts/kconfig/preprocess.c:do_shell() which passes it to popen()
> > which uses /bin/sh. Since this command has characters with interesting
> > quoting requirements, I suspect our easiest solution is to submit a
> > patch upstream which moves the content to a file which we reference in
> > the command instead of using echo. cc-can-link.sh and similar kind of
> > give some prior art for it.
> >
> 
> Interesting. Since you can change the shell for Make, I could have
> sworn we could change the shell in that environment as well.
> 
> Either way, it looks like this is another kernel build bash host side
> requirement. Which is ok, since the kernel  build has never claimed
> multi-shell support.
> 
> We can obviously test against linux-yocto. Once I get a few more 5.19
> builds passing, I can have a go at it (unless you've already tried
> something on that front).
> 

I submitted a patch yesterday, I didn't get any reply yet but we are in
the middle of the merge window:
https://lore.kernel.org/all/20220804190320.262510-1-alexandre.belloni@bootlin.com/

I also sent that to the AB.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

