Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A80C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 16:05:46 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.45269.1738857945147810595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 08:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cgwkL3TB;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2b813e4b03bso515197fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738857944; x=1739462744; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOkAKZmdbqqKqVAK1hsEBPr9e9L0Y672VlmK0o1PBKk=;
        b=cgwkL3TBOwOxdpS0CG0EuXSl1uDMygm/0hGbxcw04+234sd2l4IJwbaFp7gbrTfw/A
         2M6oZSm4xrX8Ou1qO4thR+3+sr5OysR25GNq5ZjSGw6qK/ImkC4k33Vh235dSC+KCXjq
         3+gxfCQ/GmndGGGW4Gfu7crysLPCpvvOTD8JwBi1U4ti7ez1AEnnZGfw6rmF75NNumHv
         xSIQgl8sh7eaeUsXbED3f3QUWkGqfhefPE7n0mhPWFBt8WkAWzX93yGksJJtnekmUbyg
         kII8El+goR3C8KJE7S9c6xYlAafrpECzCwWq0Lgmf7cbOWrAApFNHyi2ynCi9KFsY2WG
         QHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857944; x=1739462744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOkAKZmdbqqKqVAK1hsEBPr9e9L0Y672VlmK0o1PBKk=;
        b=I5Kxww2t3SE1bEwhEAosql1dM2EYgcOSIJ1fW8NlukR3M8RGejSUInz02IBf0SZfjM
         R5lTOeN6S0kfOEr39xoURNyMEaO7YEMD31mBEFdeKHEmNzJ5gJjyD3owLUCgi94cigQ9
         hNttSoDJNsUyMcJiUPZyPr6JW3T420bvgVhVZ+RUgNNpZYxoyNxjnIH9Cw9MPX2niMJS
         hd1BQe6JgB9OINSBa4xqjRDg013iJkRt+qQl8DBsf9WYhwRNH62NfwrDah21Yq0BBfC5
         sFjOG4/+ls6klQhPIZuSET/GVWZQCq32KbLK4nVmMbSMwAYCI2sRVLkF0a0ldYEFt98J
         UZoQ==
X-Gm-Message-State: AOJu0YxmT+XJZbK3WclOJLC/4JmkhYhhwbexx7NQoC9IDjlA+PW5nu6o
	neGGL92rGychSWWWgDNPQefz+sXM+H3/N4DEX/KH0kFCDKwkrSc8RWM68iwpqF/77uiIZBrvvwb
	PUA9dq6HqW3LpJ0+QtBulR1LvkX+sg4+O
X-Gm-Gg: ASbGncunTO4RG3FBi8GBlSf5x1vV6TL/bCukYgo8R6jps6iS8C90CId9sK7hau8gGGO
	b5opeCYbRfUJf8wCNAac2iLahbXbLhkItAI5gRT7flAHOG68PuQurqQ6jV3uuyPA+FoItfBQI
X-Google-Smtp-Source: AGHT+IHrT1ctH2uPlqq+QZgSK7av/QhSwkxYlN4E4LEPedmk1SoqbrI2A1TloFetNMOOY2qDahRrm+sP35x7i/FmHyo=
X-Received: by 2002:a05:6870:9123:b0:29e:392d:afc8 with SMTP id
 586e51a60fabf-2b804f4f5femr4546573fac.15.1738857944053; Thu, 06 Feb 2025
 08:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20250206144911.3776785-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250206144911.3776785-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Feb 2025 08:05:17 -0800
X-Gm-Features: AWEUYZm3_b5x5gCt7ezdfBRirdR_ykOcYlXJXogOqHcqFahxK8VIOlx1YEVPbcE
Message-ID: <CAMKF1sq_TZLcFGNvk_82tg4xWfc=GEuUUY+COBs49tf3Xn9TRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipes: Drop ld-is-gold support
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 16:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210949

LGTM

On Thu, Feb 6, 2025 at 6:49=E2=80=AFAM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> Gold hasn't seen development in some time and is being dropped from binut=
ils
> releases. Drop the small number of special cases for it we were carrying.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc            |  6 +-----
>  meta/recipes-devtools/binutils/binutils.inc   | 20 +------------------
>  .../recipes-devtools/rust/libstd-rs_1.81.0.bb |  5 -----
>  meta/recipes-devtools/rust/rust_1.81.0.bb     |  5 -----
>  meta/recipes-extended/ltp/ltp_20240930.bb     |  9 ++++-----
>  meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb  |  4 ----
>  meta/recipes-sato/webkit/webkitgtk_2.46.5.bb  |  9 +++------
>  .../libunwind/libunwind_1.6.2.bb              |  2 +-
>  8 files changed, 10 insertions(+), 50 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index 3270c22e8d4..9464736b841 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -10,7 +10,7 @@ inherit uboot-config uboot-extlinux-config uboot-sign d=
eploy python3native kerne
>  DEPENDS +=3D "swig-native"
>
>  EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} V=3D1'
> -EXTRA_OEMAKE +=3D 'CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${@bb.=
utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}=
 ${DEBUG_PREFIX_MAP}"'
> +EXTRA_OEMAKE +=3D 'CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBU=
G_PREFIX_MAP}"'
>  EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS=
}"'
>  EXTRA_OEMAKE +=3D 'STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} STAGING_LIB=
DIR=3D${STAGING_LIBDIR_NATIVE}'
>
> @@ -35,10 +35,6 @@ require u-boot-configure.inc
>
>  UBOOT_ARCH_DIR =3D "${@'arm' if d.getVar('UBOOT_ARCH').startswith('arm')=
 else d.getVar('UBOOT_ARCH')}"
>  do_compile () {
> -    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; th=
en
> -        sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/con=
fig.mk
> -    fi
> -
>      unset LDFLAGS
>      unset CFLAGS
>      unset CPPFLAGS
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 81443105f69..00b13012585 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -56,12 +56,6 @@ GPROFNG_ALTS:x86 =3D "${GPROFNGS}"
>  GPROFNG_ALTS:x86-64 =3D "${GPROFNGS}"
>  GPROFNG_ALTS:aarch64 =3D "${GPROFNGS}"
>
> -LDGOLD_ALTS ?=3D "ld.gold dwp"
> -LDGOLD_ALTS:riscv64 =3D ""
> -LDGOLD_ALTS:riscv32 =3D ""
> -LDGOLD_ALTS:loongarch64 =3D ""
> -LDGOLD_ALTS:libc-glibc:mipsarch =3D ""
> -
>  USE_ALTERNATIVES_FOR =3D " \
>         addr2line \
>         ar \
> @@ -72,7 +66,6 @@ USE_ALTERNATIVES_FOR =3D " \
>         ${GPROFNG_ALTS} \
>         ld \
>         ld.bfd \
> -       ${LDGOLD_ALTS} \
>         nm \
>         objcopy \
>         objdump \
> @@ -104,7 +97,7 @@ EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} =
\
>                  --disable-libdecnumber \
>                  --disable-readline \
>                  --disable-sim \
> -                ${LDGOLD} \
> +                --disable-gold \
>                  ${EXTRA_TARGETS} \
>                  ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch', '--=
enable-64-bit-bfd', '', d)}"
>
> @@ -112,12 +105,6 @@ EXTRA_TARGETS =3D ""
>  EXTRA_TARGETS:x86-64 =3D " --enable-targets=3Dx86_64-pe,x86_64-pep "
>  EXTRA_TARGETS:class-native =3D ""
>
> -LDGOLD:class-native =3D ""
> -LDGOLD:class-crosssdk =3D ""
> -LDGOLD:libc-glibc:mipsarch =3D ""
> -LDGOLD ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--en=
able-gold=3Ddefault --enable-threads', '--enable-gold --enable-ld=3Ddefault=
 --enable-threads', d)}"
> -
> -
>  # This is necessary due to a bug in the binutils Makefiles
>  # EXTRA_OEMAKE =3D "configure-build-libiberty all"
>
> @@ -204,8 +191,3 @@ inherit update-alternatives
>  ALTERNATIVE_PRIORITY =3D "100"
>
>  ALTERNATIVE:${PN}:class-target =3D "${USE_ALTERNATIVES_FOR}"
> -
> -python () {
> -    if bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', True, False, d=
) and bb.utils.contains_any('TARGET_ARCH', 'riscv32 riscv64 loongarch64', T=
rue, False, d):
> -        bb.fatal("Gold linker does not _yet_ support RISC-V and LoongArc=
h architecture please remove ld-is-gold from DISTRO_FEATURES")
> -}
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.81.0.bb
> index 14161714f2b..06a2889b92c 100644
> --- a/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb
> +++ b/meta/recipes-devtools/rust/libstd-rs_1.81.0.bb
> @@ -48,8 +48,3 @@ do_install () {
>  }
>
>  BBCLASSEXTEND =3D "nativesdk"
> -
> -# Since 1.70.0 upgrade this fails to build with gold:
> -# http://errors.yoctoproject.org/Errors/Details/708194/
> -# ld: error: version script assignment of  to symbol __rust_alloc_error_=
handler_should_panic failed: symbol not defined
> -LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fu=
se-ld=3Dbfd', '', d)}"
> diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-dev=
tools/rust/rust_1.81.0.bb
> index 1038c275f6d..c4f8ee7108f 100644
> --- a/meta/recipes-devtools/rust/rust_1.81.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
> @@ -377,8 +377,3 @@ RUSTLIB_DEP:class-nativesdk =3D ""
>  INSANE_SKIP:${PN} =3D "staticdev"
>
>  BBCLASSEXTEND =3D "native nativesdk"
> -
> -# Since 1.70.0 upgrade this fails to build with gold:
> -# http://errors.yoctoproject.org/Errors/Details/708196/
> -# ld: error: version script assignment of  to symbol __rust_alloc_error_=
handler_should_panic failed: symbol not defined
> -LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fu=
se-ld=3Dbfd', '', d)}"
> diff --git a/meta/recipes-extended/ltp/ltp_20240930.bb b/meta/recipes-ext=
ended/ltp/ltp_20240930.bb
> index 3fe8772ea71..0760170c7b0 100644
> --- a/meta/recipes-extended/ltp/ltp_20240930.bb
> +++ b/meta/recipes-extended/ltp/ltp_20240930.bb
> @@ -36,19 +36,18 @@ S =3D "${WORKDIR}/git"
>
>  inherit autotools-brokensep pkgconfig
>
> -# Version 20220527 added KVM test infrastructure which currently fails t=
o build with gold due to
> +# Version 20220527 added KVM test infrastructure which currently fails t=
o build with lld due to
>  # SORT_NONE in linker script which isn't supported by gold:
>  # https://sourceware.org/bugzilla/show_bug.cgi?id=3D18097
>  # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085=
aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6=
b0f5a8785c0dd6R36
> -LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '-fu=
se-ld=3Dbfd', '', d)}"
>  LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '-fus=
e-ld=3Dbfd', '', d)}"
>
>  # After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
>  # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f8863847=
03ef9019aaf2f2dfebb
> -# it fails with gold also a bit later when trying to use *-payload.bin
> +# it fails with lld also a bit later when trying to use *-payload.bin
>  # http://errors.yoctoproject.org/Errors/Details/663094/
> -# work around this by forcing .bfd linked in LD when ld-is-gold is in DI=
STRO_FEATURES
> -KVM_LD =3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-gold ld-i=
s-lld', '${HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}'=
, d)}"
> +# work around this by forcing .bfd linked in LD when ld-is-lld is in DIS=
TRO_FEATURES
> +KVM_LD =3D "${@bb.utils.contains_any('DISTRO_FEATURES', 'ld-is-lld', '${=
HOST_PREFIX}ld.bfd${TOOLCHAIN_OPTIONS} ${HOST_LD_ARCH}', '${LD}', d)}"
>
>  TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb b/meta/recipes-=
multimedia/ffmpeg/ffmpeg_7.1.bb
> index 1c72d503d3c..c8f226ff3ae 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.bb
> @@ -142,10 +142,6 @@ EXTRA_OECONF:append:powerpc =3D " --extra-libs=3D-la=
tomic"
>  EXTRA_OECONF:append:armv7a =3D "${@bb.utils.contains('TUNE_FEATURES','ne=
on','',' --disable-neon',d)}"
>  EXTRA_OECONF:append:armv7ve =3D "${@bb.utils.contains('TUNE_FEATURES','n=
eon','',' --disable-neon',d)}"
>
> -# gold crashes on x86, another solution is to --disable-asm but thats mo=
re hacky
> -# ld.gold: internal error in relocate_section, at ../../gold/i386.cc:368=
4
> -
> -LDFLAGS:append:x86 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', ' -fuse-ld=3Dbfd ', '', d)}"
>  LDFLAGS:append:x86 =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-l=
ld', ' -fuse-ld=3Dbfd ', '', d)}"
>
>  EXTRA_OEMAKE =3D "V=3D1"
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.46.5.bb
> index d8b91d66c71..8c6ffdc8a73 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.46.5.bb
> @@ -118,12 +118,9 @@ EXTRA_OECMAKE:append:armv4 =3D " -DENABLE_JIT=3DOFF =
"
>  EXTRA_OECMAKE:append:armv5 =3D " -DENABLE_JIT=3DOFF "
>  EXTRA_OECMAKE:append:armv6 =3D " -DENABLE_JIT=3DOFF "
>
> -EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
> -EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
> -
> -# JIT and gold linker does not work on RISCV
> -EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
> -EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
> +# JIT does not work on RISCV
> +EXTRA_OECMAKE:append:riscv32 =3D " -DENABLE_JIT=3DOFF"
> +EXTRA_OECMAKE:append:riscv64 =3D " -DENABLE_JIT=3DOFF"
>
>  # JIT not supported on MIPS either
>  EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=
=3DON "
> diff --git a/meta/recipes-support/libunwind/libunwind_1.6.2.bb b/meta/rec=
ipes-support/libunwind/libunwind_1.6.2.bb
> index c7b1604b611..b2e7ec77190 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.6.2.bb
> @@ -30,7 +30,7 @@ EXTRA_OECONF =3D "--enable-static"
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
>  ARM_INSTRUCTION_SET:armv5 =3D "arm"
>
> -LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
> +LDFLAGS +=3D "-Wl,-z,relro,-z,now"
>
>  SECURITY_LDFLAGS:append:libc-musl =3D " -lssp_nonshared"
>  CACHED_CONFIGUREVARS:append:libc-musl =3D " LDFLAGS=3D'${LDFLAGS} -lucon=
text'"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210940): https://lists.openembedded.org/g/openembedde=
d-core/message/210940
> Mute This Topic: https://lists.openembedded.org/mt/111032724/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

