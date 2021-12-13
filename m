Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFF5C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 06:55:24 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.8138.1639378522309362736
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 22:55:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y585azJE;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id z9so14282475qtj.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 22:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BOiSB9Y6yvUjVfuH+k5EI+Oe4Cf/itE+qj771G4w84E=;
        b=Y585azJESoErOK52FoiYtw1PTNfrrW9tyfxqhC0CFwbgRn/uvHshlc8mN4o91lQ5kM
         n3JMMhSlsxjPPcw+Fk04QlGtq1QVHbF6ACE8sBB5gOU/TXX2wW7bNgJQFu8qk/Lq3Unt
         yIPoWPWbJGz98nIjHfqJDv+7tO5O7QSgn1eSg3zlKlrTvGDo24gTB89KtM9jb6hb4OYe
         VCLJLHBGLf4onP23UtLEq2R4huke9/wyGPG2fD5dO/JFrHyaXtgX+tKU4uSfShrooeBx
         mR/log32Z0aecDd6GtQ2ZdA1VE2N9zfpj751YSyKdBaYIu+0Tpwrjt9rGK29qxPRGwku
         r7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BOiSB9Y6yvUjVfuH+k5EI+Oe4Cf/itE+qj771G4w84E=;
        b=SbjKwVRKRVH/VrIOFKLXIiFwxQETFf4mhasDda26H2kNjHs/Zcy2VzOOYTabDM6Fp8
         0YBP1k2G21tjL00NO3Pt7hFnXebQcsfZR4bmf5H5Zp5yGQCVIAafnkPpmVzBo5sV+vh2
         MfueWTr9MGnx+tZ+QZZX0O9pfdguG59La0QdbkErw1PleyeFu5npBE60IcBnmuIJx1ev
         FNwLkxBNTKFib4VFF/jaZ9qa+eA+uXlziq+J4ddm5lqWViTwqEuqec0TA4zlf+mFDHB+
         2qR1w+bBPMBgn7+dqVt8+jYJp5V+0uJXeHFbbU8lDGh1L2b2y0wIbqSarkZb2iuC8xU2
         A2yg==
X-Gm-Message-State: AOAM532sKlEokvLZvE05tzLKm8imaWQPEFYuevflpkHfUeLIAHg9x5JX
	EsX1Vt+6YpEjT5EkryGgZ8SHwFGFzt+54CyCWPg=
X-Google-Smtp-Source: 
 ABdhPJyxr9w5gWBa3J1u31vgcwtMttRyGn3al9qfFm/C1aAbW8JTPAr/xR2OhYGYDeKoR/JS0xeLCxZZqxPTddZ87OI=
X-Received: by 2002:ac8:7f4d:: with SMTP id
 g13mr43502748qtk.215.1639378521319;
 Sun, 12 Dec 2021 22:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20211210142242.2698587-1-ross.burton@arm.com>
 <879c61e857e71c586000da4dea39f3351c2bbd88.camel@linuxfoundation.org>
In-Reply-To: 
 <879c61e857e71c586000da4dea39f3351c2bbd88.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Dec 2021 22:54:55 -0800
Message-ID: 
 <CAMKF1sp5u_=0MiWFU3SWEdLyA4sn=AWdOt+XgKP=aTJWh2BngA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 01/10] libtool: don't prefix the installed
 binary
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross@burtonini.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 06:55:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159612

On Sun, Dec 12, 2021 at 11:03 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2021-12-10 at 14:22 +0000, Ross Burton wrote:
> > Typically libtool installs the binary to 'libtool' in the source tree,
> > but we've got patches to rename this to ${host_sys}-libtool. As this
> > isn't standard any upstream that don't respect the LIBTOOL variable need
> > to be told explicitly where libtool is, which is a long-term maintenance
> > burden for us on top of the initial libtool patches.
> >
> > The reasoning for this renaming appears to stem from the design to be
> > sure that we're using our new/patched libtool and not the host's binary.
> > However, now that we have HOSTTOOLS, there's no way to run the host
> > libtool so this argument is moot.
> >
> > This patch removes the libtool renaming, follow-up patches remove the
> > required modifications from the rest of the recipes.
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  .../libtool/libtool-cross_2.4.6.bb            | 11 ++-
> >  .../libtool/libtool-native_2.4.6.bb           |  4 +-
> >  .../libtool/libtool/prefix.patch              | 98 -------------------
> >  .../libtool/nativesdk-libtool_2.4.6.bb        |  6 +-
> >  4 files changed, 11 insertions(+), 108 deletions(-)
> >  delete mode 100644 meta/recipes-devtools/libtool/libtool/prefix.patch
>
> Whilst this was an RFC I've gone ahead and merged this as I think it is time to
> clean this up, the reasons for having it are mostly historical at this point.
>
> I did remove the commented lines this patch left too.

I think there still are some regressions to look into e.g. when
building with clang

https://errors.yoctoproject.org/Errors/Details/619251/
This is  because libtool-cross stages a version of libtool (
recipe-sysroot/usr/bin/crossscripts/libtool )
 which now has build time paths coded into it e.g. some paths seen I
have listed below. Some packages e.g. srecord picks them up verbatim (
via postdeps) and fails to find the compiler rt.
since its now looking for this into libtool-cross'es build dir instead
of looking into its own.

compiler_lib_search_dirs="/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/bin/../lib/riscv32-yoe-linux
/mnt/b/yoe/master/build/tmp/work/
riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot/usr/lib/riscv32-yoe-linux/11.2.0
/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot//usr/lib/r
iscv32-yoe-linux
/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot//lib
/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/rec
ipe-sysroot//usr/lib"

# Dependencies to place before and after the objects being linked to
# create a shared library.
predep_objects=""
postdep_objects=""
predeps=""
postdeps="-lc++ -lm
/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot/usr/lib/clang/13.0.1/lib/linux/libclang_rt.builtins-riscv32.a
-l:libunwind.so -
lc /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot/usr/lib/clang/13.0.1/lib/linux/libclang_rt.builtins-riscv32.a
-l:libunwind.so"

# The library search path used internally by the compiler when linking
# a shared library.
compiler_lib_search_path="-L/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot-native/usr/bin/../lib/riscv32-yoe-linux
-L/mnt/b/yoe/master/build/tmp/w
ork/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot/usr/lib/riscv32-yoe-linux/11.2.0
-L/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot//usr
/lib/riscv32-yoe-linux
-L/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.4.6-r0/recipe-sysroot//lib
-L/mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/libtool-cross/2.
4.6-r0/recipe-sysroot//usr/lib"


>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159588): https://lists.openembedded.org/g/openembedded-core/message/159588
> Mute This Topic: https://lists.openembedded.org/mt/87636630/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

