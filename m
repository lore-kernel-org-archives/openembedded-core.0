Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C4DC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 18:31:53 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.31157.1658169112202350645
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=7sgnU2sE;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.49,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f49.google.com with SMTP id ez10so22831087ejc.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 11:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=S9dIquvuWYlAaeD2N62wGTtBvKlG/yIDyCXD815oxwg=;
        b=7sgnU2sEVCdtdVHg6XYPhmzVrEC2RfTzUkK1Y9qp09XCMSkKIxcL5DuBQmhUR/esxe
         IUWem7OMeopJxvpb7kJvwGFKdAGXd1ol1jEcT4dPK7AaCKsoYx5wUix/DYANA2SKLXpi
         cjGM8B1He/SHsleGkBVA2sNwIYwmn63GDrjchDe6CMXSjzLAf1dgxVw7Ows1sl3aM7jN
         GdNJJiSSg5EnYjQsfbvhwHx+V0QJFt3GYbhI6ea2nCULu8vrIKlVwQENtm7nSqQvjzyn
         ShUMnro7cpbB2oWw3eRboRqvxQOZO32ES95qZci29oSw2Ebffm3HZWjMz+i6BXdO4wXQ
         ehLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=S9dIquvuWYlAaeD2N62wGTtBvKlG/yIDyCXD815oxwg=;
        b=C7TWz7tpJkDJyIAyWoQHRtGrTXxbQ8frU/bbOJpgms8q6Qm7KjZM22ua2t/2VWRp8o
         CRGSoEmry618vAXBFKVwi3aumyQdiN//sw3SsVsXWQPgmbcY6s00zJEqT7QJx8wUY6BD
         Zi0xPs3QZzg60minYDlpDJT/yUgKea7BHVg34YwTxAr53gxQuwqgqooWCnR+EIdSuVhE
         B52uKD7kJUP3RNbRXgnGwlyD3FRFcmQZVu63e15x9IKYx90/+xz5CRTwykmtfB1HPXKu
         8rg4u6hxuq/RskYqiiVaPGqdzNENtUNLn0BGcjnCDchAF4IYcdr0WRr17EK1wFppkckO
         OstA==
X-Gm-Message-State: AJIora+z05GaUF5r0jj/9K6Pfh3TiOUfBlJphd515CTBqyEzT5n2akEm
	OULvo5/MN1TRZYXLx3SD3/mqmbsfkaF8LdrKduUdeqb/uhWW7Q==
X-Google-Smtp-Source: 
 AGRyM1t7SZf3sClWPriNk9kUkl9VYq8RnBZW34KVv0jggvGEXKxRGWrSCfHS0MyoJYrqJL4SopJwEgxftdVbTjCOGOM=
X-Received: by 2002:a17:907:7d8a:b0:72b:86ef:acf6 with SMTP id
 oz10-20020a1709077d8a00b0072b86efacf6mr27078155ejc.101.1658169110129; Mon, 18
 Jul 2022 11:31:50 -0700 (PDT)
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 18 Jul 2022 20:31:39 +0200
Message-ID: 
 <CAMRc=McXfAzcUrdTLWsHHEo8DyUwU1gUuFTBALwXpJCuA0CoEA@mail.gmail.com>
Subject: [meta-zephyr] build broken with current oe-core master
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Jon Mason <jon.mason@arm.com>,
	=?UTF-8?B?RWlsw61zIE7DrSBGaGxhbm5hZ8OhaW4=?= <elizabeth.flanagan@huawei.com>,
	Naveen Saini <naveen.kumar.saini@intel.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 18:31:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168250

Hi!

It seems that the zephyr build is currently broken with master (and
master-next) for meta-zephyr samples:

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-yocto-eabi"
MACHINE              = "arduino-nano-33-ble"
DISTRO               = "zephyr"
DISTRO_VERSION       = "1.0"
TUNE_FEATURES        = "armv7m cortexm4"
TARGET_FPU           = "soft"
meta
meta-poky            = "HEAD:67b9303d72c14d2aedb3f0313cb7b27dfb1499d3"
meta-zephyr-core
meta-zephyr-bsp      = "master:6d184ce6b66349a87dc114c7ab59d0dd3bf92785"
meta-oe
meta-python          = "master:cb7d3afba838f159a5df4ef5091dba8e770159a8"

Initialising tasks: 100%
|#########################################################################################################|
Time: 0:00:01
Sstate summary: Wanted 101 Local 66 Mirrors 0 Missed 35 Current 98
(65% match, 82% complete)
NOTE: Executing Tasks
ERROR: gcc-runtime-12.1.0-r0 do_configure:
ExecutionError('/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/run.do_configure.2702410',
1, None, None)
ERROR: Logfile of failure stored in:
/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/log.do_configure.2702410
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are
['/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-core/newlib/newlib_4.2.0.bb:do_populate_sysroot',
'/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot',
'/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot',
'/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot',
'/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/libtool/libtool-native_2.4.7.bb:do_populate_sysroot',
'/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot',
'/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy-native.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/autoconf/autoconf_2.71.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/automake/automake_1.16.5.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gnu-config/gnu-config_git.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/libmpc/libmpc_1.2.1.bb:do_populate_sysroot',
'virtual:native:/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-support/mpfr/mpfr_4.1.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['newlib',
'binutils-cross-arm', 'gcc-cross-arm', 'libgcc', 'libtool-native',
'quilt-native', 'texinfo-dummy-native', 'zlib-native',
'autoconf-native', 'automake-native', 'flex-native',
'gnu-config-native', 'patch-native', 'pseudo-native', 'xz-native',
'zstd-native', 'gmp-native', 'libmpc-native', 'mpfr-native',
'attr-native', 'gettext-minimal-native', 'm4-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'arm-32', 'arm-eabi', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing python function gcc_multilib_setup
| DEBUG: Python function gcc_multilib_setup finished
| DEBUG: Executing python function extract_stashed_builddir
| DEBUG: sed -e
's:^[^/]*/:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/gcc-12.1.0/build.arm-yocto-eabi.arm-yocto-eabi/:g'
/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/gcc-stashed-builddir-arm-yocto-eabi/fixmepath
| xargs sed -i -e
's:FIXMESTAGINGDIRTARGET:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot:g;
s:FIXMESTAGINGDIRHOST:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native:g'
-e 's:FIXME_PSEUDO_SYSROOT:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/sysroots-components/x86_64/pseudo-native:g'
-e 's:FIXME_HOSTTOOLS_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/hosttools:g'
-e 's:FIXME_PKGDATA_DIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/pkgdata/arduino-nano-33-ble:g'
-e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/pseudo/:g'
-e 's:FIXME_LOGFIFO:/home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/temp/fifo.2702410:g'
| DEBUG: Python function extract_stashed_builddir finished
| DEBUG: Executing shell function do_configure
| /home/brgl/workspace/zephyr-yocto/build/tmp-newlib/work/armv7m-yocto-eabi/gcc-runtime/12.1.0-r0/recipe-sysroot-native/usr/bin/arm-yocto-eabi/../../libexec/arm-yocto-eabi/gcc/arm-yocto-eabi/12.1.0/ld:
cannot find crt0.o: No such file or directory
| collect2: error: ld returned 1 exit status
| WARNING: exit code 1 from a shell command.
ERROR: Task (/home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 765 tasks of which 746 didn't need to
be rerun and 1 failed.

Summary: 1 task failed:
  /home/brgl/workspace/zephyr-yocto/sources/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_configure
Summary: There was 1 ERROR message, returning a non-zero exit code.

I don't have any ideas but it looks like something related to the machine tune?

Bart

