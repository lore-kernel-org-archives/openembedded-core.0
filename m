Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719EBC19F29
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 02:34:02 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.373.1659580438979273833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 19:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pjaAEapI;
 spf=pass (domain: gmail.com, ip: 209.85.160.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-10ea30a098bso17973851fac.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 19:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sAIRQ2IGtpsfmXer6QFKqU+FqU9LE+LqqiCTbm0OuPM=;
        b=pjaAEapI1sjMADWoZ67D3T0OwFduw7RqMI3TjgRyoLxNSUrTAnnpkJfQOAQclRTOSb
         2/75gLirQRVU6922nk5b2m9Gy6UWPs4Z4OqIn0mNLueq6DNF11BKbNVwG5ehdchhNIyr
         e/Wul8gsLrQMxBEKoWmvRSVp9wIGjl+gdIEvkb7Ie6gcoGi3h3b6Nax4cEuxPAlJGLkN
         2qcQdScju1hFgSxfxcShO55/z4nalgH49Z7YT4Tm1H7jngHxXSlEvYfHYTKY2PV7WWzN
         kC4i4wylrnThz8yVcy/Fx954tikmWOjqXinuYGwOmTOyw3ZggMqocPtMfjh3hpRWP7xD
         +LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAIRQ2IGtpsfmXer6QFKqU+FqU9LE+LqqiCTbm0OuPM=;
        b=WYzh08tWdZkKGudHEGxhnwlzPCI4hMm2//SJly2iVFzj8X7ug4+fuMElFfVDm+Lvg3
         dlKkl6Xc1TKk+1reVKeGaoRFVxIkjefO7iJvTdclnltIAgD7rhObQfRZo89SfV58qJly
         yXWu0s8kMe2viquTY7kKhAeqd7KzricVIqL4z01iy2vcKMmiekPabi8wJ8XW8b9CF835
         +6gh84TeUFUlNtLT7Vde4D2Ky20l/GHHTHQW0QrRmn/o81u64/GmxcjhL1ZxRZtSSzmP
         b9VNILwuqxvY4t0T+cC+HYeso5ZyoHNmGBQKegBlJjwr4hsasu5LyzwMTRUqU+UFoGvj
         xvhg==
X-Gm-Message-State: ACgBeo3RRrODisRCi+rJGHFGsmXdx28pA+x8JtBgYgFDA5RJ6yvJqSm5
	U0ly3IP5Z1bBEnwHVAXcUUt7MC6gRAM6BJ72LaYixlypZnxeFQ==
X-Google-Smtp-Source: 
 AA6agR6BX1fXfo0+W3zQf5etV8mEwsQHlRmNmV2O577Q0lV2sXYm4x2mPf47GaZ3ot2CnoZwffaA5Ti3nK3khzrppbg=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr3217193oae.6.1659580438194; Wed, 03 Aug
 2022 19:33:58 -0700 (PDT)
MIME-Version: 1.0
References: <YsWOLwlNxhAq7sKz@mail.local>
 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
 <830db8ea9f131bf577340c92a36cb5b7870f315f.camel@linuxfoundation.org>
In-Reply-To: 
 <830db8ea9f131bf577340c92a36cb5b7870f315f.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Aug 2022 22:33:46 -0400
Message-ID: 
 <CADkTA4OEvF-MDtYRaMfT=1_FGS78XDtL+gJmO1Wn3m_6tKUyeQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 02:34:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168833

On Wed, Aug 3, 2022 at 6:46 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2022-08-03 at 11:50 -1000, Steve Sakoman wrote:
> > On Wed, Jul 6, 2022 at 4:05 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > > > > Hello Bruce,
> > > > >
> > > > > I got the following reproducible build failures:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/1116/steps/12/logs/stdio
> > > > >
> > > > > To me, it looks like the in-kernel config changed, did the compression
> > > > > alg change?
> > > > >
> > > > > Are you able to look at that soon or should I file a bug?
> > > >
> > > > FWIW,
> > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20220705-g8ltxczy/packages/diff-html/
> > > >
> > > > and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y changed value...
> > >
> > > A quick look at the -stable queue to init/Kconfig does indeed show
> > > that option arriving .. from my scan of the change, it looks like
> > > there are different compilers on the hosts, and hence that check is
> > > detecting a buggy gcc (or not) and changing the value.
> > >
> > > So one of the build hosts is failing the test, and another isn't.
> > >
> > > I'm not sure how to fix that, unless we revert the change. I'll ponder it more.
> >
> > Was this issue ever resolved?  I'm seeing it on kirkstone now too :-(
>
> No, it wasn't. I took a quick look and my best guess is that we now
> have the kernel wanting to do $CC tests in kConfig and we don't set CC
> properly for all our make config calls. I chucked this in master-next
> as a quick guess at a possible fix:
>

That's what we've had to do with the linker in the past, so that is
generally speaking the right place to force the compiler.

> https://git.yoctoproject.org/poky/commit/?h=master-next&id=944cc04d1ed316a5652f3d058b966d4cfb9a6b73
>
> but others might know better where we might be missing the CC settings.
> I suspect we need to clean up our parameters a bit looking at the
> different call site differences.

That being said, merge_config uses the compiler like so:

# Use the merged file as the starting point for:
# alldefconfig: Fills in any missing symbols with Kconfig default
# allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
make HOSTCC="$HOSTCC" HOSTLD="$HOSTLD" CC="$CC" LD="$LD" \
        KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET

And we call it like this:

CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC}
${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}"
CC="${KERNEL_CC}" LD="${KERNEL_LD}" ARCH=${ARCH} merge_config.sh -O
${B} ${config_flags} ${configs} >
${meta_dir}/cfg/merge_config_build.log 2>&1

So for the merging of fragments, we are already covered.

and kernel_do_configure calls: KERNEL_CONFIG_COMMAND as the last thing
it does, which is:

KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}"
LD="${KERNEL_LD}" O=${B} olddefconfig || oe_runmake -C ${S} O=${B}
CC="${KERNEL_CC}" LD="${KERNEL_LD}" oldnoconfig"

Which already does set CC to KERNEL_CC.

So unless I'm missing how KCONFIG_CONFIG_COMMAND is sneaking in, I
expect the behaviour will still be the same.

I spent the day digging through 5.19 kernel issues, so only had a few
minutes to look at this tonight .. and it is late, so I very easily
could have missed something.

Bruce

>
> Cheers,
>
> Richard
>
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

