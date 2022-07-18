Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BAFC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 18:49:23 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.31211.1658170156987724901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=s8E1H18Q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id c24so3937610qkm.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dd/BAR/8TsE9w889ZzObQpp/dOKOwGYOiEaImBo3Vw0=;
        b=s8E1H18Qe4ljAZLLWG6oOOlezeZwwCgeZgBPbTF9Bk0RvBJuoKJGPRw3KIfHxpensV
         RirU0YaCJTh30rD+KaBoH5449gDDYvUOFUYRMHg5iwr1xOaVF5kME/8Ql37zZHhCBnkn
         BugjED1DRaHLr3nhq0VlbRUU9ImByvJJED+5W0ZH3VuAlorw7+vmor39ELAZeRbjDAM5
         cVrj0juZuehHuCWvTKF3liQyjZc0d9/9JSE2dn8xgTG89fAYOY1j749rjwzLV2afT7EL
         APpi7JpkjaycMxD5oaeCr8f0O+1zdWZAJVrIuHEjjsqDjcVTTlVDYdRvqdRVkCK4pgun
         vXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dd/BAR/8TsE9w889ZzObQpp/dOKOwGYOiEaImBo3Vw0=;
        b=dhGpq+/3p/En0eNJHMAKRgLhC0qoj1LYHByYSEp7HlwXCt3kCslY/Y8gcrnClSlVf/
         JbOhYCQ9r5Qlz8ba+ivHft+U9YRs5ZdVY9JWTRwSEuFpxgwOD23TQ726IM/yi8J7xyOt
         QxgCaDuKlRs00TO2A2vHMsoWGLchTzB8LZtuqJR5/SAq8Ve4xusAxmU4Xyw4OUSCVn66
         yyUcxhzv4EDzyS6hSAWQZtAY8s0aepmCUOay3gXbL6Vpv+rChIlIfq4a/SBKcAMRCvR6
         tAHobA6GdhMndYwDHNOEKl7OOWh13WNMbN42BkYvl1YT4VJHW/K8gfKiP4RtRtNZdHo1
         y3vQ==
X-Gm-Message-State: AJIora+PXbrnK9lt5nDbKK9Bay1GBeXE6p6T2c+spSMxPU+mwkJIPsCn
	tHZfbs60hlca1i1bAG0KoMm/6A==
X-Google-Smtp-Source: 
 AGRyM1ud4dmPgxqF9bRulYLLkL5r4lbAuVmXgGqWFe5UTXuoB/36Uk7VZwUPAOJ+BgbezxNjw8EU0w==
X-Received: by 2002:a05:620a:40cf:b0:6b1:41dd:9710 with SMTP id
 g15-20020a05620a40cf00b006b141dd9710mr17976802qko.727.1658170155989;
        Mon, 18 Jul 2022 11:49:15 -0700 (PDT)
Received: from kudzu.us ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 e25-20020ac86719000000b0031ec38da567sm9848247qtp.0.2022.07.18.11.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:49:15 -0700 (PDT)
Date: Mon, 18 Jul 2022 14:49:13 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Jon Mason <jon.mason@arm.com>,
	=?iso-8859-1?Q?Eil=EDs_N=ED_Fhlannag=E1in?= <elizabeth.flanagan@huawei.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>
Subject: Re: [meta-zephyr] build broken with current oe-core master
Message-ID: <YtWrKcR6y1jWSFtC@kudzu.us>
References: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 18:49:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168252

On Mon, Jul 18, 2022 at 08:31:39PM +0200, Bartosz Golaszewski wrote:
> Hi!
> 
> It seems that the zephyr build is currently broken with master (and
> master-next) for meta-zephyr samples:
> 
> Build Configuration:
> BB_VERSION           = "2.0.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-yocto-eabi"
> MACHINE              = "arduino-nano-33-ble"
> DISTRO               = "zephyr"
> DISTRO_VERSION       = "1.0"
> TUNE_FEATURES        = "armv7m cortexm4"
> TARGET_FPU           = "soft"
> meta
> meta-poky            = "HEAD:67b9303d72c14d2aedb3f0313cb7b27dfb1499d3"
> meta-zephyr-core
> meta-zephyr-bsp      = "master:6d184ce6b66349a87dc114c7ab59d0dd3bf92785"
> meta-oe
> meta-python          = "master:cb7d3afba838f159a5df4ef5091dba8e770159a8"
> 
> Initialising tasks: 100%
> |#########################################################################################################|
> Time: 0:00:01
> Sstate summary: Wanted 101 Local 66 Mirrors 0 Missed 35 Current 98
> (65% match, 82% complete)
> NOTE: Executing Tasks
> ERROR: gcc-runtime-12.1.0-r0 do_configure:
> ExecutionError('/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/run.do_configure.2702410',
> 1, None, None)
> ERROR: Logfile of failure stored in:
> /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/log.do_configure.2702410
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are
> ['/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-core/newlib/newlib_4.2.0.bb:do_populate_sysroot',
> '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot',
> '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot',
> '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot',
> '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot',
> '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot',
> '/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/libmpc/libmpc_1.2.1.bb:do_populate_sysroot',
> 'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/mpfr/mpfr_4.1.0.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['newlib',
> 'binutils-cross-arm', 'gcc-cross-arm', 'libgcc', 'libtool-native',
> 'quilt-native', 'texinfo-dummy-native', 'zlib-native',
> 'autoconf-native', 'automake-native', 'flex-native',
> 'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native',
> 'zstd-native', 'gmp-native', 'libmpc-native', 'mpfr-native',
> 'attr-native', 'gettext-minimal-native', 'm4-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_aclocals
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'arm-32', 'arm-eabi', 'common']
> | DEBUG: Python function autotools_aclocals finished
> | DEBUG: Executing python function gcc_multilib_setup
> | DEBUG: Python function gcc_multilib_setup finished
> | DEBUG: Executing python function extract_stashed_builddir
> | DEBUG: sed -e
> 's:^[^/]*/:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/:g'
> /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/gcc-stashed-builddir-arm-yocto-eabi/fixmepath
> | xargs sed -i -e
> 's:FIXMESTAGINGDIRTARGET:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot:g;
> s:FIXMESTAGINGDIRHOST:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native:g'
> -e 's:FIXME_PSEUDO_SYSROOT:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/pseudo-native:g'
> -e 's:FIXME_HOSTTOOLS_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/hosttools:g'
> -e 's:FIXME_PKGDATA_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/pkgdata/arduino-nano-33-ble:g'
> -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/pseudo/:g'
> -e 's:FIXME_LOGFIFO:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/fifo.2702410:g'
> | DEBUG: Python function extract_stashed_builddir finished
> | DEBUG: Executing shell function do_configure
> | /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-yocto-eabi/../../libexec/arm-yocto-eabi/gcc/arm-yocto-eabi/12.1.0/ld:
> cannot find crt0.o: No such file or directory
> | collect2: error: ld returned 1 exit status
> | WARNING: exit code 1 from a shell command.
> ERROR: Task (/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 765 tasks of which 746 didn't need to
> be rerun and 1 failed.
> 
> Summary: 1 task failed:
>   /home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure
> Summary: There was 1 ERROR message, returning a non-zero exit code.
> 
> I don't have any ideas but it looks like something related to the machine tune?

I haven't had time to bottom out on the issue, but I was able to
confirm that the patch in OE core that breaks meta-zephyr is

commit 028ecb0c265fa495071cbcca10587c0ba60cf538
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Wed Jul 13 23:12:06 2022 +0100

    gcc-runtime: Fix build when using gold

    If gold is enabled as the default linker, it errors trying to link
    to our dummy library empty file and this turns off things which should
    be present in libstdc++.

    For example, _GLIBCXX_HAVE_S_ISREG isn't defined and HAVE_S_ISREG in
    libstdc++-v3/config.h isn't set properly.

    Instead of just creating an empty file, create an empty elf binary
    instead which addresses the issue.

    (From OE-Core rev: 2070bcd10aa3a05c96c8501c6a8c1e129fb1d440)

    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

If you revert that, everything is happy.

Thanks,
Jon


> 
> Bart
> 

