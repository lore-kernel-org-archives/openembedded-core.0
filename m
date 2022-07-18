Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37B3C43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 22:10:14 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.33715.1658182209120058755
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 15:10:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=wclxsuVc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.49,
 mailfrom: jdmason@kudzu.us)
Received: by mail-lf1-f49.google.com with SMTP id y11so21748762lfs.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 15:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mcr6Y1l11R0QuQk6YUyHhLrC2bpewjrS+akIteCichU=;
        b=wclxsuVcoO1NQasBD5fK6vZkYLcKb/MlWEVByK3hRmSpjC/bEMjad+OQyoBW1iiS8b
         Q3/NoVE15Hd5Ml0klAJHEQKaU8WbpTiiM+mau79hUDDmZbwVCMZ9OaflFoC5KWsIj0oj
         VwNIL06dXssKBqYxcPcLNXYItocWtVGz3YiX1o3xeqj2bSG6IAi02KbQ2wO06t0Yl0WD
         boRrK7MLVaxiNUlcehBFW1aCiDtlcnfJLN7SPMsTm7jTZsD4D1cqCIbDDKgli63sLvQ1
         hbQIxkjwCL4ixSxzsfTQKiPMxgmucuoDG4JEd/Zt3e83l9yJC01b+Z1W3czeRJQOftft
         n6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mcr6Y1l11R0QuQk6YUyHhLrC2bpewjrS+akIteCichU=;
        b=WIKfC3WYBpi+I6VaNZAsctEhvvFBez4yyS7OC/9Yqa2rcHVywgVLkiRMC+bJh4SYUg
         URD1u0oDl9YLwQDul+LVcB71J61AW6N390fyklpHsNHtDGk+qmtVKbgfV9v/2VoO+8gl
         6/ViCFCg7kG3YXKqxAY+T62YCu5tABJG0j9Wd9ZfWFkv1K1UAm3pmm0C/9hPJjo+FaAx
         yRyiwe+3jOFGknHyTNFthDgIhgfExtYrDVAwLaupDGx/+LdSET2tVfB8LMrIRh0uufg0
         JegqPoJZzOue9lfYWxWb+qsYrncoMl/zB3XFbJW3dNNyI8wP4fF6dnmQfvbQVrXsDqw8
         CF3w==
X-Gm-Message-State: AJIora9DOgTGTvrHJUmFQP7fpIlowdDEK1Sf8KqNzkZCy5Zl96C5qi9a
	ZqgjBqYZ3IPhqwE0mOO0b1CsEtAhORTzdo2F7E1BHw==
X-Google-Smtp-Source: 
 AGRyM1uL8q0+uCUBN7Qjvq9QSZb9UTOlLN3lqd6CLZXW/IYyj/LasvgxeWHCcxeixYwPfJ+s6RO8qx5gH5wmpAxXvSU=
X-Received: by 2002:a19:6408:0:b0:48a:139e:67b7 with SMTP id
 y8-20020a196408000000b0048a139e67b7mr12212595lfb.203.1658182207119; Mon, 18
 Jul 2022 15:10:07 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
 <YtWrKcR6y1jWSFtC@kudzu.us>
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqZh=fPoYHqh-uuJL6oftkmGoDHHcZkTgivoKapFFerAQ@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Mon, 18 Jul 2022 18:09:55 -0400
Message-ID: 
 <CAPoiz9zRWPGLSUNaeTQDO=E60cGD4zRVmnZmHFkSdVLrkx_WmA@mail.gmail.com>
Subject: Re: [oe] [meta-zephyr] build broken with current oe-core master
To: Khem Raj <raj.khem@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
 Jon Mason <jon.mason@arm.com>,
	=?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <elizabeth.flanagan@huawei.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 22:10:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168261

On Mon, Jul 18, 2022 at 4:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Can you try something like this
>
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc
> b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index 5d74e4494d..61d5bf6058 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -68,8 +68,7 @@ do_configure () {
>     # libstdc++ isn't built yet so CXX would error not able to find it
> which breaks stdc++'s configure
>     # tests. Create a dummy empty lib for the purposes of configure.
>     mkdir -p ${WORKDIR}/dummylib
> -   touch ${WORKDIR}/dummylib/dummylib.c
> -   ${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o
> ${WORKDIR}/dummylib/libstdc++.so
> +   ${CC} -nostartfiles -shared -x c /dev/null -o
> ${WORKDIR}/dummylib/libstdc++.so
>     for d in libgcc ${RUNTIMETARGET}; do
>         echo "Configuring $d"
>         rm -rf ${B}/${TARGET_SYS}/$d/
>
>
> and see if it helps ?

That appears to work for the 2 zephyr machines in meta-arm

>
> On Mon, Jul 18, 2022 at 2:49 PM Jon Mason <jdmason@kudzu.us> wrote:
> >
> > On Mon, Jul 18, 2022 at 08:31:39PM +0200, Bartosz Golaszewski wrote:
> > > Hi!
> > >
> > > It seems that the zephyr build is currently broken with master (and
> > > master-next) for meta-zephyr samples:
> > >
> > > Build Configuration:
> > > BB_VERSION           = "2.0.1"
> > > BUILD_SYS            = "x86_64-linux"
> > > NATIVELSBSTRING      = "universal"
> > > TARGET_SYS           = "arm-yocto-eabi"
> > > MACHINE              = "arduino-nano-33-ble"
> > > DISTRO               = "zephyr"
> > > DISTRO_VERSION       = "1.0"
> > > TUNE_FEATURES        = "armv7m cortexm4"
> > > TARGET_FPU           = "soft"
> > > meta
> > > meta-poky            = "HEAD:67b9303d72c14d2aedb3f0313cb7b27dfb1499d3"
> > > meta-zephyr-core
> > > meta-zephyr-bsp      = "master:6d184ce6b66349a87dc114c7ab59d0dd3bf92785"
> > > meta-oe
> > > meta-python          = "master:cb7d3afba838f159a5df4ef5091dba8e770159a8"
> > >
> > > Initialising tasks: 100%
> > > |#########################################################################################################|
> > > Time: 0:00:01
> > > Sstate summary: Wanted 101 Local 66 Mirrors 0 Missed 35 Current 98
> > > (65% match, 82% complete)
> > > NOTE: Executing Tasks
> > > ERROR: gcc-runtime-12.1.0-r0 do_configure:
> > > ExecutionError('/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/run.do_configure.2702410',
> > > 1, None, None)
> > > ERROR: Logfile of failure stored in:
> > > /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/log.do_configure.2702410
> > > Log data follows:
> > > | DEBUG: Executing python function extend_recipe_sysroot
> > > | NOTE: Direct dependencies are
> > > ['/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-core/newlib/newlib_4.2.0.bb:do_populate_sysroot',
> > > '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot',
> > > '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot',
> > > '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot',
> > > '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot',
> > > '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot',
> > > '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/libmpc/libmpc_1.2.1.bb:do_populate_sysroot',
> > > 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/mpfr/mpfr_4.1.0.bb:do_populate_sysroot']
> > > | NOTE: Installed into sysroot: []
> > > | NOTE: Skipping as already exists in sysroot: ['newlib',
> > > 'binutils-cross-arm', 'gcc-cross-arm', 'libgcc', 'libtool-native',
> > > 'quilt-native', 'texinfo-dummy-native', 'zlib-native',
> > > 'autoconf-native', 'automake-native', 'flex-native',
> > > 'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native',
> > > 'zstd-native', 'gmp-native', 'libmpc-native', 'mpfr-native',
> > > 'attr-native', 'gettext-minimal-native', 'm4-native']
> > > | DEBUG: Python function extend_recipe_sysroot finished
> > > | DEBUG: Executing shell function autotools_preconfigure
> > > | DEBUG: Shell function autotools_preconfigure finished
> > > | DEBUG: Executing python function autotools_aclocals
> > > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> > > 'arm-32', 'arm-eabi', 'common']
> > > | DEBUG: Python function autotools_aclocals finished
> > > | DEBUG: Executing python function gcc_multilib_setup
> > > | DEBUG: Python function gcc_multilib_setup finished
> > > | DEBUG: Executing python function extract_stashed_builddir
> > > | DEBUG: sed -e
> > > 's:^[^/]*/:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/:g'
> > > /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/gcc-stashed-builddir-arm-yocto-eabi/fixmepath
> > > | xargs sed -i -e
> > > 's:FIXMESTAGINGDIRTARGET:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot:g;
> > > s:FIXMESTAGINGDIRHOST:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native:g'
> > > -e 's:FIXME_PSEUDO_SYSROOT:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/pseudo-native:g'
> > > -e 's:FIXME_HOSTTOOLS_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/hosttools:g'
> > > -e 's:FIXME_PKGDATA_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/pkgdata/arduino-nano-33-ble:g'
> > > -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/pseudo/:g'
> > > -e 's:FIXME_LOGFIFO:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/fifo.2702410:g'
> > > | DEBUG: Python function extract_stashed_builddir finished
> > > | DEBUG: Executing shell function do_configure
> > > | /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-yocto-eabi/../../libexec/arm-yocto-eabi/gcc/arm-yocto-eabi/12.1.0/ld:
> > > cannot find crt0.o: No such file or directory
> > > | collect2: error: ld returned 1 exit status
> > > | WARNING: exit code 1 from a shell command.
> > > ERROR: Task (/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure)
> > > failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 765 tasks of which 746 didn't need to
> > > be rerun and 1 failed.
> > >
> > > Summary: 1 task failed:
> > >   /home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure
> > > Summary: There was 1 ERROR message, returning a non-zero exit code.
> > >
> > > I don't have any ideas but it looks like something related to the machine tune?
> >
> > I haven't had time to bottom out on the issue, but I was able to
> > confirm that the patch in OE core that breaks meta-zephyr is
> >
> > commit 028ecb0c265fa495071cbcca10587c0ba60cf538
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Wed Jul 13 23:12:06 2022 +0100
> >
> >     gcc-runtime: Fix build when using gold
> >
> >     If gold is enabled as the default linker, it errors trying to link
> >     to our dummy library empty file and this turns off things which should
> >     be present in libstdc++.
> >
> >     For example, _GLIBCXX_HAVE_S_ISREG isn't defined and HAVE_S_ISREG in
> >     libstdc++-v3/config.h isn't set properly.
> >
> >     Instead of just creating an empty file, create an empty elf binary
> >     instead which addresses the issue.
> >
> >     (From OE-Core rev: 2070bcd10aa3a05c96c8501c6a8c1e129fb1d440)
> >
> >     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >
> > If you revert that, everything is happy.
> >
> > Thanks,
> > Jon
> >
> >
> > >
> > > Bart
> > >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#97883): https://lists.openembedded.org/g/openembedded-devel/message/97883
> > Mute This Topic: https://lists.openembedded.org/mt/92465636/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

