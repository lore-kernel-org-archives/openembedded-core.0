Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3615BC19F2D
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 13:39:05 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web10.4807.1659620336638286768
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 06:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=khRwdrFD;
 spf=pass (domain: gmail.com, ip: 209.85.167.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id q184so4287426oif.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 06:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wwn2/mGuWcRRxyJMYPBi5VcpUoVa8sukmo/D4zx0pcQ=;
        b=khRwdrFDYogI6D3c+PjvCEIXqtnzQjrT9bOEplJCQu/YNAHmI5ydziKCIi+5Tr57m7
         79NHvObwtuh2Nk7kSDsU8vuUF40cOywWzOsXp2S15bHanyXPhgZ6nrtGomeIJRpT9zpm
         CDEnogwfiGXhXiZDevmjLA+L05+J65v1FE6CbjVua0GNHcgtMankBmanTMV2KfW5t2Li
         tdV9JhF1rIAw9kkzHmqfn6AuHBrysmpiJqEWQNEv0X5sR/DfFTCh0wXGlZ4TOVYp0jSw
         nKkESxNoarSN9H6L4raI8zr2jsoEtyRQQFJRoY011UI6BF5fHtQSVVN+w0XHxTNw71wn
         INFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wwn2/mGuWcRRxyJMYPBi5VcpUoVa8sukmo/D4zx0pcQ=;
        b=p3Bmx5eDCusYayH7/knUky+0jvQNqmvXoOJjtb+DzM3qecQYvlJNJm3qCY2hiAlWBA
         nmANFWD0CamJ66dzBq314amQkRhUnbybyJyf8tZdboeau+Q7ssxygEGy19HjygQ7pYcP
         vV8hyCawIFQASqBVIC9slx/gD6DysW/VPDLYDTzFzUtKCAPhIXjYvvGNvSKNA3lZKxS5
         1WnaAeWab7Xi9zDwM2ubf6Coq9DKaBpCZZwEPSRoS9U107cqGvsRWbiyqcIWKXfFUzh2
         ruYfGODZqSNnQyVxuzx3jl3cbyKx+DW7SrCPC0GTBdOzrCWcZ0miCoNgYIdrM6FDnr/7
         HMKQ==
X-Gm-Message-State: ACgBeo08kRbT0djalLjc/pNgj7JESKNyZV91EkGUg5/q5RmnB4I+1mUF
	5kW1eFj4QpcYPaopcR6FjhHiErVZXtbqUjREuao=
X-Google-Smtp-Source: 
 AA6agR4qqVmC2eIqFKBD52lrV2RGBxT/STplc1GqxcTauGRcDu2dvo92jpoH3Si0szI70MIVuBMSBLEDONoT8n9Taug=
X-Received: by 2002:a05:6808:1312:b0:341:cbcd:5387 with SMTP id
 y18-20020a056808131200b00341cbcd5387mr3804774oiv.175.1659620335867; Thu, 04
 Aug 2022 06:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <YsWOLwlNxhAq7sKz@mail.local>
 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
 <830db8ea9f131bf577340c92a36cb5b7870f315f.camel@linuxfoundation.org>
 <CADkTA4OEvF-MDtYRaMfT=1_FGS78XDtL+gJmO1Wn3m_6tKUyeQ@mail.gmail.com>
 <170812024C9E55A6.12743@lists.openembedded.org>
 <ffef70ec3c7139d4be3fc234c7df1362c21930a5.camel@linuxfoundation.org>
In-Reply-To: 
 <ffef70ec3c7139d4be3fc234c7df1362c21930a5.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Aug 2022 09:38:44 -0400
Message-ID: 
 <CADkTA4M55pivv=8QCW8DO3je1QsZsB8nJX7w_+QC1zqm2YKNyw@mail.gmail.com>
Subject: Re: [OE-core] linux-yocto 5.15.48 reproducibility failure
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 13:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168847

On Thu, Aug 4, 2022 at 3:27 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2022-08-04 at 07:57 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2022-08-03 at 22:33 -0400, Bruce Ashfield wrote:
> > > On Wed, Aug 3, 2022 at 6:46 PM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, 2022-08-03 at 11:50 -1000, Steve Sakoman wrote:
> > > > > On Wed, Jul 6, 2022 at 4:05 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > > >
> > > > > > On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
> > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > >
> > > > > > > On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > > > > > > > Hello Bruce,
> > > > > > > >
> > > > > > > > I got the following reproducible build failures:
> > > > > > > >
> > > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/steps/12/logs/stdio
> > > > > > > >
> > > > > > > > To me, it looks like the in-kernel config changed, did the compression
> > > > > > > > alg change?
> > > > > > > >
> > > > > > > > Are you able to look at that soon or should I file a bug?
> > > > > > >
> > > > > > > FWIW,
> > > > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220705-g8ltxczy/packages/diff-html/
> > > > > > >
> > > > > > > and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y changed value...
> > > > > >
> > > > > > A quick look at the -stable queue to init/Kconfig does indeed show
> > > > > > that option arriving .. from my scan of the change, it looks like
> > > > > > there are different compilers on the hosts, and hence that check is
> > > > > > detecting a buggy gcc (or not) and changing the value.
> > > > > >
> > > > > > So one of the build hosts is failing the test, and another isn't.
> > > > > >
> > > > > > I'm not sure how to fix that, unless we revert the change. I'll ponder it more.
> > > > >
> > > > > Was this issue ever resolved?  I'm seeing it on kirkstone now too :-(
> > > >
> > > > No, it wasn't. I took a quick look and my best guess is that we now
> > > > have the kernel wanting to do $CC tests in kConfig and we don't set CC
> > > > properly for all our make config calls. I chucked this in master-next
> > > > as a quick guess at a possible fix:
> > > >
> > >
> > > That's what we've had to do with the linker in the past, so that is
> > > generally speaking the right place to force the compiler.
> > >
> > > > https://git.yoctoproject.org/poky/commit/?h=master-next&id=944cc04d1ed316a5652f3d058b966d4cfb9a6b73
> > > >
> > > > but others might know better where we might be missing the CC settings.
> > > > I suspect we need to clean up our parameters a bit looking at the
> > > > different call site differences.
> > >
> > > That being said, merge_config uses the compiler like so:
> > >
> > > # Use the merged file as the starting point for:
> > > # alldefconfig: Fills in any missing symbols with Kconfig default
> > > # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> > > make HOSTCC="$HOSTCC" HOSTLD="$HOSTLD" CC="$CC" LD="$LD" \
> > >         KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> > >
> > > And we call it like this:
> > >
> > > CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
> > > ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"
> > > CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O
> > > ${B} ${config_flags} ${configs} >
> > > ${meta_dir}/cfg/merge_config_build.log 2>&1
> > >
> > > So for the merging of fragments, we are already covered.
> > >
> > > and kernel_do_configure calls: KERNEL_CONFIG_COMMAND as the last thing
> > > it does, which is:
> > >
> > > KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}"
> > > LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B}
> > > CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"
> > >
> > > Which already does set CC to KERNEL_CC.
> > >
> > > So unless I'm missing how KCONFIG_CONFIG_COMMAND is sneaking in, I
> > > expect the behaviour will still be the same.
> > >
> > > I spent the day digging through 5.19 kernel issues, so only had a few
> > > minutes to look at this tonight .. and it is late, so I very easily
> > > could have missed something.
> >
> > You're not missing anything, it didn't help.
> >
> > We're seeing this on ubuntu1804 so I logged in there and experimented.
> > CC is set correctly. What isn't working well is the "echo". If I change
> > the command to use /bin/echo instead of plain "echo" (which is probably
> > a shell builtin), it works. Otherwise running manually I see:
> >
> > <stdin>: In function 'foo':
> > <stdin>:1:29: warning: missing terminating " character
> > <stdin>:1:29: error: missing terminating " character
> > <stdin>:2:5: error: expected ':' before '+' token
> > <stdin>:2:7: warning: missing terminating " character
> > <stdin>:2:7: error: missing terminating " character
> > <stdin>:2:1: error: expected declaration or statement at end of input
> >
> > It is looking like this is a dash vs. bash issue. Not sure how we fix
> > it yet but it points to where the issue may be.
>
> pokybuild@ubuntu1804-ty-3:~$ /bin/dash
> $ echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }' | x86_64-poky-linux-gcc -x c - -c -o /dev/null; echo $?
> <stdin>: In function 'foo':
> <stdin>:1:29: warning: missing terminating " character
> <stdin>:1:29: error: missing terminating " character
> <stdin>:2:5: error: expected ':' before '+' token
> <stdin>:2:7: warning: missing terminating " character
> <stdin>:2:7: error: missing terminating " character
> <stdin>:2:1: error: expected declaration or statement at end of input
> 1
> $ exit
> pokybuild@ubuntu1804-ty-3:~$ bash
> pokybuild@ubuntu1804-ty-3:~$ echo 'int foo(int *x) { asm goto (".long (%l[bar]) - .\n": "+m"(*x) ::: bar); return *x; bar: return 0; }' | x86_64-poky-linux-gcc -x c - -c -o /dev/null; echo $?
> 0
>
> I think the command gets executed by the code in
> scripts/kconfig/preprocess.c:do_shell() which passes it to popen()
> which uses /bin/sh. Since this command has characters with interesting
> quoting requirements, I suspect our easiest solution is to submit a
> patch upstream which moves the content to a file which we reference in
> the command instead of using echo. cc-can-link.sh and similar kind of
> give some prior art for it.
>

Interesting. Since you can change the shell for Make, I could have
sworn we could change the shell in that environment as well.

Either way, it looks like this is another kernel build bash host side
requirement. Which is ok, since the kernel  build has never claimed
multi-shell support.

We can obviously test against linux-yocto. Once I get a few more 5.19
builds passing, I can have a go at it (unless you've already tried
something on that front).

Bruce

> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

