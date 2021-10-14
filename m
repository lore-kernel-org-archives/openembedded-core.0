Return-Path: <andrey.z@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F065AC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 09:21:41 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.7056.1634203300497131287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 02:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fn1cP8nx;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id z11so23289269lfj.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ILfLxGqv33LMd9L0wW/WhFxp99mX/VgkgzjgMoAuDYU=;
        b=fn1cP8nxzefAeEhrq9m1lw4XL/jmxJR67e8H0KnqpXJGR40nVG3uk7GH6jE2qeHBYq
         7ByZCG4gZo5rJBEWkhcI2kgoQNjxhUzk6gype88Ts7XX7Nd3knpkZdagkInvf2/WIChN
         J4R1NWbICUAqRcQvFzruu3YMVLzKsINCVkT0/L+rhyHixbiAEWOKJ49nsv3fOkbp+2Hy
         yiDIbrntU2Qe7d+/bdvSAZ2fZiV/zzhZMJNnf8gf7v5yZn8KDXEnzxoFje2MoHs+Hk71
         og5E3Vrl7WujmtYjbfA9DVozVDpfBKOmjok15OhvVgA4uPS/KvG9bPr9vx2zjrOkhUKp
         62Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ILfLxGqv33LMd9L0wW/WhFxp99mX/VgkgzjgMoAuDYU=;
        b=pq2q9io8nlI7zHiPSeAZhc+K5lHReEfg2SDSrkxHcKOatnE7toJoTLhyAzFi4qGl//
         3UB1StAvyTFUG6hNKKDVdUWP1daOzAcBlk+yV5JXAdpuRp/iCJUxDai2HJcUE8atEFTU
         b+RtBn2fcCEvHQ4bZpEyM5vJEssyv/u0JRdA2TSCc193A03xl5FskB4S7k+/xCyucLzR
         lAahQQhHHqHOq8TTIbjRDisgjMZwjv+KdB5FFUYy/cwXsxa9sWH0VQksqMSR65rZcN7C
         cGNo+2DttlbZxA78+hBsk+82E+9o2BZlVAF4qPTtkya05NNXHe8xV5FLsbXeR4/vhMIx
         aN3A==
X-Gm-Message-State: AOAM533gp6C7aTiVNdxKp3niwDwa7BZkB4iqkziWJsrWfr4AL/ZATTFg
	T5Ot73TNMs8vljr3Fd6taHDLu6M7ibZq0pWgp1s=
X-Google-Smtp-Source: 
 ABdhPJyAFNJt2y6AJXCgGb1lJobaAoRHb2g4I/ee1XYR004zqq7qQQwxuM+LG87wZogqTBj5U3gGxgXOb1+i/p2haRs=
X-Received: by 2002:a19:c14e:: with SMTP id r75mr4078615lff.275.1634203297946;
 Thu, 14 Oct 2021 02:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
 <CAAnfSTuMd+8YfuwcmTsU5+W30bPXHJrqcuHRM=Axo+=evv5z_A@mail.gmail.com>
 <CAAnfSTsLvK-Hm47UNQ7M6iB34P73t3cb11PM3qRGVUGfSuJfRA@mail.gmail.com>
 <CADkTA4N-dCkAOe1=soaHUgBfoS8r=FEsCaYiki0WP_SsK4EWfg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4N-dCkAOe1=soaHUgBfoS8r=FEsCaYiki0WP_SsK4EWfg@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Thu, 14 Oct 2021 11:21:26 +0200
Message-ID: 
 <CAHtQpK6d2xNpen4nGd9mbd4QfYVJ7re0V=cEWUnadsM3480Rmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 09:21:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156931

Hello all,

On Wed, Oct 6, 2021 at 1:20 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Wed, Oct 6, 2021 at 7:42 AM Ross Burton <ross@burtonini.com> wrote:
> >
> > I should have put this in the commit message, but here's the failure
> > when using an external toolchain:
> >
> > 2021-10-05 12:52:14 - INFO - | HOSTCXX
> > scripts/gcc-plugins/arm_ssp_per_task_plugin.so
> > 2021-10-05 12:52:14 - INFO - | In file included from
> > /builds/engineering/yocto/meta-arm/work/build/tmp/work-shared/fvp-base-arm32/kernel-source/scripts/gcc-plugins/gcc-common.h:103,
> > 2021-10-05 12:52:14 - INFO - | from
> > /builds/engineering/yocto/meta-arm/work/build/tmp/work-shared/fvp-base-arm32/kernel-source/scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
> > 02021-10-05 12:52:14 - INFO - |
> > /builds/persist/toolchains/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf/bin/../lib/gcc/arm-none-linux-gnueabihf/10.3.1/plugin/include/builtins.h:23:10:
> > fatal error: mpc.h: No such file or directory
> > 2021-10-05 12:52:14 - INFO - | #include <mpc.h>
> > 2021-10-05 12:52:14 - INFO - | ^~~~~~~
> > 2021-10-05 12:52:14 - INFO - | compilation terminated.
>
> Aha. Yes, that does tell the story. I knew it had to be a compilation
> failure, since that is how I picked up the other DEPENDS.

Sorry for jumping in here, I guess there is one additional issue that
would be unraveled after libmpc will be included.

What I saw long time ago (starting from v5.13.y) is that even when
both gmp and libmpc are added, following build errors are produced
from ARM32 builds when defconfig is used:
----
cc1: error: cannot load plugin
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so:
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
_ZN8opt_pass14set_pass_paramEjb
cc1: error: cannot load plugin
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so:
./scripts/gcc-plugins/arm_ssp_per_task_plugin.so: undefined symbol:
_ZN8opt_pass14set_pass_paramEjb
----

It seems that GCC plugins are somehow disabled in SDK GCC, but Kernel
build system checks them on the host, which does provide them. This
leads to a false identification that plugins are enabled and leads to
further build failures.

This behavior came with commit 1e860048c53e ("gcc-plugins: simplify
GCC plugin-dev capability test"), where previously build system ran an
internal script to verify if plugins are present by running compile
tests, but after this commit - it checks only if the folder containing
plugins is there. This leads to the issue that when host GCC has the
folder - plugins are enabled, but when later the compile pass is taken
- it fails since the .so is not present in the SDK sysroot.

I'd have to point out that this error only occurs for ARM32 builds,
aarch64 builds are not affected.

This has also been discussed here on the list, but I can't seem to
find a reference to it anymore.

>
> Did we want to tweak the commit message and add linux-yocto-dev to the
> patch ? I can have go at that if you want.
>
> Bruce
>
> >
> > On Wed, 6 Oct 2021 at 11:12, Ross Burton <ross@burtonini.com> wrote:
> > >
> > > On Wed, 6 Oct 2021 at 11:10, Ross Burton <ross@burtonini.com> wrote:
> > > > This depends on CONFIG_GCC_PLUGINS which I don't believe is enabled in
> > > > any of the default configurations.  meta-arm builds a few kernels with
> > > > defconfig, which does.
> > >
> > > Sorry, brain still not warmed up yet.
> > >
> > > CONFIG_GCC_PLUGINS needs to be enabled, but the real difference is
> > > that using the normal GCC pulls libmpc into the sysroot via implicit
> > > dependencies.  If you use an external toolchain (like
> > > meta-arm-toolchain) this doesn't happen, and the dependency needs to
> > > be explicit.
> > >
> > > Ross
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156690): https://lists.openembedded.org/g/openembedded-core/message/156690
> Mute This Topic: https://lists.openembedded.org/mt/86092630/3617192
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrey.z@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


--
Regards,
Andrey.

