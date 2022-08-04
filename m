Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F072C00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 06:57:53 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.2014.1659596263172722248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 23:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D4RzzCMA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id z16so24030467wrh.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 23:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc;
        bh=x6qGPIAOBuJsk2U+20nupdjoBWAYj+x/bxMnG+qtAXc=;
        b=D4RzzCMAtftcLmqzApcnfRaMlhGD0Gz1nLCZHErWa+CStoUmEtqLY4GFtu32Zs5t4i
         KcqP4/SXjoyNUsbiI9rTc0v33gfnisRML0pwotRwxZkEB9nWU2JxGuOzBoSyr4goezeR
         fgujY8b1WPz/MJnQWS9p0uFj/2cNGJO07ZeEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc;
        bh=x6qGPIAOBuJsk2U+20nupdjoBWAYj+x/bxMnG+qtAXc=;
        b=FaIcUvd8LLaadEYdfFEjqYGHch4HrNnzh9n3RF1MR9d+Lpedi+0j3Bi0I8IT+7rtMs
         C4D9w1MBkuAlof2vK5aoSWEYZSvzEfqmGX5s7aaZCwl/6t/5G5/5ywe1FtFjucpvmxVp
         ylgc5jZtoNN6kh1QngDPYXxeSTsIb70KKMc1yDQibj3xY6/ZtJgrp/yLnVcgLqn4UoEl
         sCcjsrjOFo9EnWd85ivuJVbjX4qSNZ5sidcpQMGvSu61UmnXKk9sgvR3IJEx7y3B+erd
         TR3J46nhWk1MKrA8uYzbLhKZ/w2Y0bzjkjzrBUSsPaktkNp7j/u7Uf0qiVO8L7A+WA4M
         PdLQ==
X-Gm-Message-State: ACgBeo0LNWrv/slA/u7XbCKP5g9afFNJ6VPHSe3FdH4NrJWLAt0AIfiP
	yPidbKv/iMc4eBBqtyvm+9ADxA==
X-Google-Smtp-Source: 
 AA6agR6+WlU9Oogf3ipladkhNwiJJCa7p6AqHyMirE4LeF2J3RINluyjPsyEyrYlsPQz02p1cqE7Sg==
X-Received: by 2002:a05:6000:1561:b0:220:591e:64af with SMTP id
 1-20020a056000156100b00220591e64afmr365360wrz.494.1659596261405;
        Wed, 03 Aug 2022 23:57:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3?
 ([2001:8b0:aba:5f3c:2b1e:c52b:bd77:b2e3])
        by smtp.gmail.com with ESMTPSA id
 r12-20020a05600c35cc00b003a319bd3278sm5488840wmq.40.2022.08.03.23.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 23:57:40 -0700 (PDT)
Message-ID: 
 <c59d2cf0d2be29be2f3084308b1edaaf878ad50f.camel@linuxfoundation.org>
Subject: Re: [OE-core] linux-yocto 5.15.48 reproducibility failure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Steve Sakoman <steve@sakoman.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Aug 2022 07:57:40 +0100
In-Reply-To: 
 <CADkTA4OEvF-MDtYRaMfT=1_FGS78XDtL+gJmO1Wn3m_6tKUyeQ@mail.gmail.com>
References: <YsWOLwlNxhAq7sKz@mail.local>
	 <570c56bce472ec4ba6a68f537dcb1f85f99a05ea.camel@linuxfoundation.org>
	 <CADkTA4N2gGHwG7OWGY32gqLzztsTcOsGXx=-wgpJrJhkfj=OKA@mail.gmail.com>
	 <CAOSpxdZPefjY=513h0vLb-W3dPqkUzBQXh00V6t68M+-9CDogQ@mail.gmail.com>
	 <830db8ea9f131bf577340c92a36cb5b7870f315f.camel@linuxfoundation.org>
	 <CADkTA4OEvF-MDtYRaMfT=1_FGS78XDtL+gJmO1Wn3m_6tKUyeQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 06:57:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168837

On Wed, 2022-08-03 at 22:33 -0400, Bruce Ashfield wrote:
> On Wed, Aug 3, 2022 at 6:46 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Wed, 2022-08-03 at 11:50 -1000, Steve Sakoman wrote:
> > > On Wed, Jul 6, 2022 at 4:05 AM Bruce Ashfield <bruce.ashfield@gmail.c=
om> wrote:
> > > >=20
> > > > On Wed, Jul 6, 2022 at 9:31 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >=20
> > > > > On Wed, 2022-07-06 at 15:29 +0200, Alexandre Belloni wrote:
> > > > > > Hello Bruce,
> > > > > >=20
> > > > > > I got the following reproducible build failures:
> > > > > >=20
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/117/bui=
lds/1116/steps/12/logs/stdio
> > > > > >=20
> > > > > > To me, it looks like the in-kernel config changed, did the comp=
ression
> > > > > > alg change?
> > > > > >=20
> > > > > > Are you able to look at that soon or should I file a bug?
> > > > >=20
> > > > > FWIW,
> > > > > http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-202207=
05-g8ltxczy/packages/diff-html/
> > > > >=20
> > > > > and CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=3Dy changed value...
> > > >=20
> > > > A quick look at the -stable queue to init/Kconfig does indeed show
> > > > that option arriving .. from my scan of the change, it looks like
> > > > there are different compilers on the hosts, and hence that check is
> > > > detecting a buggy gcc (or not) and changing the value.
> > > >=20
> > > > So one of the build hosts is failing the test, and another isn't.
> > > >=20
> > > > I'm not sure how to fix that, unless we revert the change. I'll pon=
der it more.
> > >=20
> > > Was this issue ever resolved?  I'm seeing it on kirkstone now too :-(
> >=20
> > No, it wasn't. I took a quick look and my best guess is that we now
> > have the kernel wanting to do $CC tests in kConfig and we don't set CC
> > properly for all our make config calls. I chucked this in master-next
> > as a quick guess at a possible fix:
> >=20
>=20
> That's what we've had to do with the linker in the past, so that is
> generally speaking the right place to force the compiler.
>=20
> > https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&id=3D944cc04d=
1ed316a5652f3d058b966d4cfb9a6b73
> >=20
> > but others might know better where we might be missing the CC settings.
> > I suspect we need to clean up our parameters a bit looking at the
> > different call site differences.
>=20
> That being said, merge_config uses the compiler like so:
>=20
> # Use the merged file as the starting point for:
> # alldefconfig: Fills in any missing symbols with Kconfig default
> # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> make HOSTCC=3D"$HOSTCC" HOSTLD=3D"$HOSTLD" CC=3D"$CC" LD=3D"$LD" \
>         KCONFIG_ALLCONFIG=3D$TMP_FILE $OUTPUT_ARG $ALLTARGET
>=20
> And we call it like this:
>=20
> CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"
> CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" ARCH=3D${ARCH} merge_config.sh -O
> ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
>=20
> So for the merging of fragments, we are already covered.
>=20
> and kernel_do_configure calls: KERNEL_CONFIG_COMMAND as the last thing
> it does, which is:
>=20
> KERNEL_CONFIG_COMMAND ?=3D "oe_runmake_call -C ${S} CC=3D"${KERNEL_CC}"
> LD=3D"${KERNEL_LD}" O=3D${B} olddefconfig || oe_runmake -C ${S} O=3D${B}
> CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" oldnoconfig"
>=20
> Which already does set CC to KERNEL_CC.
>=20
> So unless I'm missing how KCONFIG_CONFIG_COMMAND is sneaking in, I
> expect the behaviour will still be the same.
>=20
> I spent the day digging through 5.19 kernel issues, so only had a few
> minutes to look at this tonight .. and it is late, so I very easily
> could have missed something.

You're not missing anything, it didn't help.

We're seeing this on ubuntu1804 so I logged in there and experimented.
CC is set correctly. What isn't working well is the "echo". If I change
the command to use /bin/echo instead of plain "echo" (which is probably
a shell builtin), it works. Otherwise running manually I see:

<stdin>: In function 'foo':
<stdin>:1:29: warning: missing terminating " character
<stdin>:1:29: error: missing terminating " character
<stdin>:2:5: error: expected ':' before '+' token
<stdin>:2:7: warning: missing terminating " character
<stdin>:2:7: error: missing terminating " character
<stdin>:2:1: error: expected declaration or statement at end of input

It is looking like this is a dash vs. bash issue. Not sure how we fix
it yet but it points to where the issue may be.

Cheers,

Richard



