Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3215CD4F25
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 16:24:24 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38813.1778862260157874164
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 09:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GFs542Hp;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-95d0476492bso5225811241.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 09:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778862259; cv=none;
        d=google.com; s=arc-20240605;
        b=MUp5YBHVIUaM9r3Erb6CwoyrjjhCA7pe+4muwgWASCI0PiI7xHA/oibOt4TqHhc6Df
         rWeENBv/JhfQDD91n3FsE0BhzfYunRKolWL/Eoi0d/wqAlg5sLzui3zLz/2oMsR3puyq
         19tDpdVyuwpNm+fc1ne9cMf0GI6j9uuGDj1Ag5Sn2dVrXL2muco5SSeSHpAaK+dsauWC
         XwW26phfJJaqff7vlUx+Ja43faGiKeq7K6/KoheMI/AqDInVe1tn5h9EnX44gRiNvwVh
         RnJ5FNoOvO7zzz1M+R6qajxaUknzH0diQK4bkIb2ldme8YrOTvhcHFh41s+H4HY8jOAt
         /wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W113TrDArWxYb11TWKyELKSyIDdSEukQNb4VIUlMUNQ=;
        fh=SZlaEGZ7YYupt88/Sw339uqnvSy+bxY8nibKjhKqbGU=;
        b=gh9S/bmLfjUHTz8aRU520BO01nSLCr6yWpNCMvdllA+RHxx4ja7ay4e/G3EcCnyysb
         wVbBMvmRYWce5wAH1uKhY5ARJ5ONnjdhuOLIH5PuCObeLdcNBKfPSJNxpfVnqTYV3s2Q
         sOFN53hwG8+Nd3NoFQFn6Jkdqz6RuN0gPHGzYUuUO/WURTTeMw6SoDKirZV7YjKH7ey4
         mj12WJC91hLKJmWiwlKjav0KlX/Hh4cwbyvj/aomFBtQR1EH227KETwTnZSza7nHoNXw
         gtUckUcZTAhrcg10pXAdaqwQd0QIhFzYJTrVboYTV7YDpztVsFjnUPb9/tDgfU3tVyW8
         PEog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778862259; x=1779467059; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W113TrDArWxYb11TWKyELKSyIDdSEukQNb4VIUlMUNQ=;
        b=GFs542HpLlcHyn4Ob4wwE4YPI2crDcyPi7nBQ4NkxEVk+Bvqcl8/EOZif9mHSHx3iA
         +Ncn+8U6EqC45+geKjn0HzEjHL5Uu0UgCIuOK8cKsXbwY3Y8txUH7jAZa1gHVytRdnJ9
         /Whd9oytDLIKwdpluzfHIh7Fy4nl7xzLUVi2j5Q7X9kR/NmQwPcdIsM+qfT0Vua04DWK
         xGPf5KQPIyAjaREpzvTpXOxYI7sKIBwrkFdRMmAR6eJDLOhMXv2kYlsA9rFTtyZ1LWqU
         +cr5gfVtCSsZXEEj8IpLwNgG7LdRM7GLoSqKvINRoQo9ab6K33FkhDgam/g+bnb4cZb+
         BddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862259; x=1779467059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W113TrDArWxYb11TWKyELKSyIDdSEukQNb4VIUlMUNQ=;
        b=ozmos/9OOI9jcB0UEq5jnPDSjU2tGFEfb1LRLwPEEELDpsvjxWWiMYkJTDCapOgP/L
         3xz+5LUZBZ2J5P2KPBq6FunXGDBPQLOROe4r61B2gr80PG1f87Rhw6erU0U/FPIw6RhF
         3nAQYQ5v5szfMDF3VZMSZt03FrFQCFN3zTVa0cRI2tqFEt82H0n3ovrVL1g1ZCij347p
         x5WFWsFHjmSX5xr9vPgtnyitBqQ7KKPVrb2qBkLASAtb1f6t+j0GuRF+9dhHcKiXO4dn
         sr/NJKCqai2ryQdpjvILTWuDu+RFdxVzpv8849p3Nf8hb6lwwbDHbJ0k3IJLdz9yr924
         jD0Q==
X-Gm-Message-State: AOJu0Yy3EpzSYNSTleM3+bNbxVqxI920LYsS2ffUecXC0eJJ9b0xnCIn
	1bqtn7m41aC5uhf5Z8K0M8Ciw/dBtCybjbbCCkOW6UwZAHg901MDFgtFBlaSbTM2+rGOqXuQCb6
	xjg9r2XPjk8RkonJlEHNMW6XgVaEoFJY=
X-Gm-Gg: Acq92OH7aBupga7ohCRIMS1tUnAtcRKiC1KFInKFpWUoho//6MBtK5vRlTX3lZOV7vF
	jVwW64AU5bnTQ62qhGDYDrSFcu77Juhla9x4w94k8wMAA4ra87lGJZf4VKDl46djc7KeKL1tQdu
	9yutaHJsahkPHwdAjedBTkzufax379bVU7tF4m7U1E0uqQEhdTaQsH/E9zCUSx07Qn41/K3zU+b
	qOfEhb3QWvWTWk5E6QwRePR4nracIuQJXa7Yi2EOS0HeroDt0oViplWJVTg0zUdOY/kMN58sEKj
	33qs8cxVijLRDvN7C76uHUXjqPB105MLIPD8+N4bDEg4rIiwO4KT
X-Received: by 2002:a05:6102:946:b0:631:b834:e051 with SMTP id
 ada2fe7eead31-63a3d73706emr3108258137.12.1778862258790; Fri, 15 May 2026
 09:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260515154841.242278-1-Quan.Sun@windriver.com>
In-Reply-To: <20260515154841.242278-1-Quan.Sun@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 May 2026 18:24:07 +0200
X-Gm-Features: AVHnY4K8R3MqYjXMGZh4w-T7NbUPAyqv3UYR-pIgRePTcXiL3wNClDwVECNtC04
Message-ID: <CANNYZj_bwXTshNJ+6GamP=x-1Qxv65iStpQ8HW19dUKJC_nYvg@mail.gmail.com>
Subject: Re: [OE-core][PATCH] qemu: upgrade 10.2.0 -> 11.0.0
To: Quan.Sun@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 16:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237181

On Fri, 15 May 2026 at 17:49, Quan Sun via lists.openembedded.org
<Quan.Sun=3Dwindriver.com@lists.openembedded.org> wrote:
> - Add python3-qemu-qmp recipe (0.0.6) as a separate package. The QMP
>   Python library was removed from the QEMU source tree in 11.0.0 and
>   split into its own upstream project. This is needed by
>   qemu-system-native for testimage integration.
> +++ b/meta/recipes-devtools/qemu/python3-qemu-qmp_0.0.6.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "QEMU Monitor Protocol Python library"
> +DESCRIPTION =3D "An asyncio library for communicating with QEMU Monitor =
Protocol (QMP). \
> +This library was split out of the QEMU source tree to provide a referenc=
e QMP \
> +implementation usable both within and outside of the QEMU source tree."
> +HOMEPAGE =3D "https://gitlab.com/qemu-project/python-qemu-qmp"
> +LICENSE =3D "LGPL-2.0-only & GPL-2.0-only"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D4cf66a4984120007c9881cc871cf4=
9db"
> +
> +SRC_URI =3D "git://gitlab.com/qemu-project/python-qemu-qmp.git;protocol=
=3Dhttps;branch=3Dmain"
> +SRCREV =3D "82006cb788d27b090a8b84fc7831feb9c528bcdc"

Thanks!

This is available on pypi:
https://pypi.org/project/qemu.qmp/
so the recipe should use the pypi bbclass to download the appropriate
package (there's lots of examples in oe-core).

Also newly added recipes need a maintainers.inc entry:
https://git.openembedded.org/openembedded-core/tree/meta/conf/distro/includ=
e/maintainers.inc

Alex


> +
> +inherit python_setuptools_build_meta
> +
> +DEPENDS +=3D "python3-setuptools-scm-native"
> +
> +# setuptools_scm needs this when building from git without tags in the c=
lone
> +SETUPTOOLS_SCM_PRETEND_VERSION =3D "0.0.6"
> +
> +RDEPENDS:${PN} +=3D "python3-core python3-asyncio"
> +
> +# Install to the custom path expected by oeqa/utils/qemurunner.py
> +# which imports "qmp.legacy" from ${libdir}/qemu-python/
> +do_install:append:class-native() {
> +    install -d ${D}${libdir}/qemu-python/qmp/
> +    cp -R --no-dereference --preserve=3Dmode,links ${S}/qemu/qmp/* ${D}$=
{libdir}/qemu-python/qmp/
> +}
> +
> +FILES:${PN}:append:class-native =3D " ${libdir}/qemu-python"
> +
> +BBCLASSEXTEND =3D "native nativesdk"
> diff --git a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb b/meta/reci=
pes-devtools/qemu/qemu-native_11.0.0.bb
> similarity index 99%
> rename from meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
> rename to meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
> index 26fa84c180..a77953529b 100644
> --- a/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-native_11.0.0.bb
> @@ -7,4 +7,3 @@ require qemu-native.inc
>  EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_usermode_target_li=
st(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
>
>  PACKAGECONFIG ??=3D "pie"
> -
> diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb b/me=
ta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
> similarity index 85%
> rename from meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
> rename to meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
> index 2e4f7328ad..7947499c5f 100644
> --- a/meta/recipes-devtools/qemu/qemu-system-native_10.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu-system-native_11.0.0.bb
> @@ -5,7 +5,7 @@ require qemu-native.inc
>  # As some of the files installed by qemu-native and qemu-system-native
>  # are the same, we depend on qemu-native to get the full installation se=
t
>  # and avoid file clashes
> -DEPENDS +=3D "glib-2.0-native zlib-native pixman-native qemu-native"
> +DEPENDS +=3D "glib-2.0-native zlib-native pixman-native qemu-native pyth=
on3-qemu-qmp-native"
>
>  EXTRA_OECONF:append =3D " --target-list=3D${@get_qemu_system_target_list=
(d)}"
>
> @@ -25,9 +25,4 @@ do_install:append() {
>      rm -rf ${D}${datadir}/qemu/dtb
>      rm -rf ${D}${datadir}/icons/
>      rm -rf ${D}${includedir}/qemu-plugin.h
> -
> -    # Install qmp.py to be used with testimage
> -    install -d ${D}${libdir}/qemu-python/qmp/
> -    install -D ${S}/python/qemu/qmp/* ${D}${libdir}/qemu-python/qmp/
>  }
> -
> diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-d=
evtools/qemu/qemu-targets.inc
> index 50e5eb6796..937ef1a911 100644
> --- a/meta/recipes-devtools/qemu/qemu-targets.inc
> +++ b/meta/recipes-devtools/qemu/qemu-targets.inc
> @@ -25,6 +25,10 @@ def get_qemu_target_list(d):
>              archs.remove(arch)
>      if 'linux' not in tos:
>          return softmmuonly + ''.join([arch + "-softmmu" + "," for arch i=
n archs]).rstrip(',')
> +    # QEMU 11.0.0+ only supports linux-user on 64-bit host architectures
> +    linux_user_hosts =3D ['aarch64', 'loongarch64', 'mips64', 'ppc64', '=
riscv64', 's390x', 'sparc64', 'x86_64']
> +    if tarch not in linux_user_hosts:
> +        return softmmuonly + ''.join([arch + "-softmmu" + "," for arch i=
n archs]).rstrip(',')
>      return softmmuonly + linuxuseronly + ''.join([arch + "-linux-user" +=
 "," + arch + "-softmmu" + "," for arch in archs]).rstrip(',')
>
>  def get_qemu_usermode_target_list(d):
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 5f30416a48..1e5890f15a 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -4,6 +4,7 @@ machine's processor through dynamic binary translation an=
d provides a set \
>  of different hardware and device models for the machine, enabling it to =
run \
>  a variety of guest operating systems"
>  HOMEPAGE =3D "http://qemu.org"
> +BUGTRACKER =3D "https://gitlab.com/qemu-project/qemu/-/issues"
>  LICENSE =3D "GPL-2.0-only & LGPL-2.1-only"
>
>  DEPENDS +=3D "bison-native meson-native ninja-native"
> @@ -22,7 +23,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da3b50d8b88dc=
c0eb3d7d39b760b9e821 \
>  SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://powerpc_rom.bin \
>             file://run-ptest \
> -           file://fix-strerrorname_np.patch \
>             file://0001-qemu-Add-addition-environment-space-to-boot-loade=
r-q.patch \
>             file://0002-apic-fixup-fallthrough-to-PIC.patch \
>             file://0004-qemu-Do-not-include-file-if-not-exists.patch \
> @@ -32,8 +32,6 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed=
-li.patch \
>             file://0010-configure-lookup-meson-exutable-from-PATH.patch \
>             file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-f=
or-.patch \
> -           file://0001-linux-user-elfload.c-Correction-to-HWCAP2-accesso=
r.patch \
> -           file://0001-accel-tcg-Fix-iotlb_to_section-for-different-Addr=
ess.patch \
>             file://qemu-guest-agent.init \
>             file://qemu-guest-agent.udev \
>             "
> @@ -41,7 +39,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>  UPSTREAM_CHECK_URI =3D "https://www.qemu.org"
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> -SRC_URI[sha256sum] =3D "9e30ad1b8b9f7b4463001582d1ab297f39cfccea5d08540c=
0ca6d6672785883a"
> +SRC_URI[sha256sum] =3D "c04ca36012653f32d11c674d370cf52a710e7d3f18c2d8b6=
3e4932052a4854d6"
>
>  CVE_STATUS[CVE-2007-0998] =3D "not-applicable-config: The VNC server can=
 expose host files uder some circumstances. We don't enable it by default."
>
> @@ -61,6 +59,9 @@ COMPATIBLE_HOST:mipsarchn32 =3D "null"
>  COMPATIBLE_HOST:mipsarchn64 =3D "null"
>  COMPATIBLE_HOST:riscv32 =3D "null"
>
> +# QEMU 11.0.0+ requires a 64-bit host architecture for emulator builds
> +COMPATIBLE_HOST:class-target =3D "(aarch64|x86_64|ppc64|riscv64|loongarc=
h64|mips64|s390x|sparc64).*-linux"
> +
>  # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.=
html
>  # upstream states qemu doesn't work without optimization
>  DEBUG_BUILD =3D "0"
> @@ -75,7 +76,7 @@ do_install_ptest() {
>         find ${D}${PTEST_PATH}/tests -type f -name "*.[Sshcodp]" | xargs =
-i rm -rf {}
>
>         # Don't check the file genreated by configure
> -       sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST=
_PATH}/tests/data/acpi/disassemle-aml.sh
> +       sed -i -e "1s,#!/usr/bin/bash,#!${base_bindir}/bash," ${D}${PTEST=
_PATH}/tests/data/acpi/disassemble-aml.sh
>
>         # Strip the paths from the QEMU variable, we can use PATH
>         makfiles=3D$(find ${D}${PTEST_PATH} -name "*.mak")
> @@ -119,8 +120,8 @@ EXTRA_OECONF =3D " \
>      ${PACKAGECONFIG_CONFARGS} \
>      "
>
> -EXTRA_OECONF:append:class-target =3D " --cross-prefix=3D${HOST_PREFIX}"
> -EXTRA_OECONF:append:class-nativesdk =3D " --cross-prefix=3D${HOST_PREFIX=
}"
> +EXTRA_OECONF:append:class-target =3D " --cross-prefix=3D${HOST_PREFIX} -=
-cpu=3D${TUNE_ARCH}"
> +EXTRA_OECONF:append:class-nativesdk =3D " --cross-prefix=3D${HOST_PREFIX=
} --cpu=3D${SDK_ARCH}"
>
>  B =3D "${WORKDIR}/build"
>
> @@ -130,7 +131,7 @@ do_configure:prepend:class-native() {
>         # Append build host pkg-config paths for native target since the =
host may provide sdl
>         BHOST_PKGCONFIG_PATH=3D$(PATH=3D/usr/bin:/bin pkg-config --variab=
le pc_path pkg-config || echo "")
>         if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
> -               export PKG_CONFIG_LIBDIR=3D$PKG_CONFIG_LIBDIR:$BHOST_PKGC=
ONFIG_PATH
> +               export PKG_CONFIG_PATH=3D$PKG_CONFIG_PATH:$BHOST_PKGCONFI=
G_PATH
>         fi
>  }
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_=
section-for-different-Address.patch b/meta/recipes-devtools/qemu/qemu/0001-=
accel-tcg-Fix-iotlb_to_section-for-different-Address.patch
> deleted file mode 100644
> index d19f872fc3..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-accel-tcg-Fix-iotlb_to_section=
-for-different-Address.patch
> +++ /dev/null
> @@ -1,274 +0,0 @@
> -From 858e6bb252e075e09cca6e78299151d3af0bf5fb Mon Sep 17 00:00:00 2001
> -From: Quan Sun <Quan.Sun@windriver.com>
> -Date: Tue, 28 Apr 2026 14:56:36 -0400
> -Subject: [PATCH] accel/tcg: Fix iotlb_to_section() for different Address=
Space
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -'CPUTLBEntryFull.xlat_section' stores section_index in last 12 bits to
> -find the correct section when CPU access the IO region over the IOTLB.
> -However, section_index is only unique inside single AddressSpace. If
> -address space translation is over IOMMUMemoryRegion, it could return
> -section from other AddressSpace. 'iotlb_to_section()' API only finds the
> -sections from CPU's AddressSpace so that it couldn't find section in
> -other AddressSpace. Thus, using 'iotlb_to_section()' API will find the
> -wrong section and QEMU will have wrong load/store access.
> -
> -To fix this bug of iotlb_to_section(), store complete MemoryRegionSectio=
n
> -pointer in CPUTLBEntryFull to replace the section_index in xlat_section.
> -Rename 'xlat_section' to 'xlat_offset' as we remove last 12 bits
> -section_index inside. Also, since we directly use section pointer in the
> -CPUTLBEntryFull (full->section), we can remove the unused functions:
> -iotlb_to_section(), memory_region_section_get_iotlb().
> -
> -This bug occurs only when
> -(1) IOMMUMemoryRegion is in the path of CPU access.
> -(2) IOMMUMemoryRegion returns different target_as and the section is in
> -the IO region.
> -
> -This patch incorporates prerequisite changes from upstream commit
> -94c6e9cf0440 ("accel/tcg: Send the CPUTLBEntryFull struct into
> -io_prepare()") needed for the fix to apply cleanly.
> -
> -Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/854cd16e318eed12de2995014b28d9f374c64bf7]
> -
> -Signed-off-by: Jim Shu <jim.shu@sifive.com>
> -Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> -Tested-by: Mark Burton <mburton@qti.qualcomm.com>
> -Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> -Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> -Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
> ----
> - accel/tcg/cputlb.c        | 32 +++++++++++++++-----------------
> - include/accel/tcg/iommu.h | 15 ---------------
> - include/exec/cputlb.h     |  4 ++--
> - include/hw/core/cpu.h     | 17 +++++++++--------
> - system/physmem.c          | 25 -------------------------
> - 5 files changed, 26 insertions(+), 67 deletions(-)
> -
> -diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> -index fd1606c85..fa0f4d8b3 100644
> ---- a/accel/tcg/cputlb.c
> -+++ b/accel/tcg/cputlb.c
> -@@ -1089,7 +1089,7 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
> -         }
> -     } else {
> -         /* I/O or ROMD */
> --        iotlb =3D memory_region_section_get_iotlb(cpu, section) + xlat;
> -+        iotlb =3D xlat;
> -         /*
> -          * Writes to romd devices must go through MMIO to enable write.
> -          * Reads to romd devices go through the ram_ptr found above,
> -@@ -1140,10 +1140,9 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx=
,
> -     /*
> -      * When memory region is ram, iotlb contains a TARGET_PAGE_BITS
> -      * aligned ram_addr_t of the page base of the target RAM.
> --     * Otherwise, iotlb contains
> --     *  - a physical section number in the lower TARGET_PAGE_BITS
> --     *  - the offset within section->mr of the page base (I/O, ROMD) wi=
th the
> --     *    TARGET_PAGE_BITS masked off.
> -+     * Otherwise, iotlb contains a TARGET_PAGE_BITS aligned
> -+     * offset within section->mr of the page base (I/O, ROMD)
> -+     *
> -      * We subtract addr_page (which is page aligned and thus won't
> -      * disturb the low bits) to give an offset which can be added to th=
e
> -      * (non-page-aligned) vaddr of the eventual memory access to get
> -@@ -1153,7 +1152,8 @@ void tlb_set_page_full(CPUState *cpu, int mmu_idx,
> -      */
> -     desc->fulltlb[index] =3D *full;
> -     full =3D &desc->fulltlb[index];
> --    full->xlat_section =3D iotlb - addr_page;
> -+    full->xlat_offset =3D iotlb - addr_page;
> -+    full->section =3D section;
> -     full->phys_addr =3D paddr_page;
> -
> -     /* Now calculate the new entry */
> -@@ -1269,14 +1269,14 @@ static inline void cpu_unaligned_access(CPUState=
 *cpu, vaddr addr,
> - }
> -
> - static MemoryRegionSection *
> --io_prepare(hwaddr *out_offset, CPUState *cpu, hwaddr xlat,
> -+io_prepare(hwaddr *out_offset, CPUState *cpu, CPUTLBEntryFull *full,
> -            MemTxAttrs attrs, vaddr addr, uintptr_t retaddr)
> - {
> -     MemoryRegionSection *section;
> -     hwaddr mr_offset;
> -
> --    section =3D iotlb_to_section(cpu, xlat, attrs);
> --    mr_offset =3D (xlat & TARGET_PAGE_MASK) + addr;
> -+    section =3D full->section;
> -+    mr_offset =3D full->xlat_offset + addr;
> -     cpu->mem_io_pc =3D retaddr;
> -     if (!cpu->neg.can_do_io) {
> -         cpu_io_recompile(cpu, retaddr);
> -@@ -1335,7 +1335,7 @@ static bool victim_tlb_hit(CPUState *cpu, size_t m=
mu_idx, size_t index,
> - static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned siz=
e,
> -                            CPUTLBEntryFull *full, uintptr_t retaddr)
> - {
> --    ram_addr_t ram_addr =3D mem_vaddr + full->xlat_section;
> -+    ram_addr_t ram_addr =3D mem_vaddr + full->xlat_offset;
> -
> -     trace_memory_notdirty_write_access(mem_vaddr, ram_addr, size);
> -
> -@@ -1592,9 +1592,7 @@ bool tlb_plugin_lookup(CPUState *cpu, vaddr addr, =
int mmu_idx,
> -
> -     /* We must have an iotlb entry for MMIO */
> -     if (tlb_addr & TLB_MMIO) {
> --        MemoryRegionSection *section =3D
> --            iotlb_to_section(cpu, full->xlat_section & ~TARGET_PAGE_MAS=
K,
> --                             full->attrs);
> -+        MemoryRegionSection *section =3D full->section;
> -         data->is_io =3D true;
> -         data->mr =3D section->mr;
> -     } else {
> -@@ -1980,7 +1978,7 @@ static uint64_t do_ld_mmio_beN(CPUState *cpu, CPUT=
LBEntryFull *full,
> -     tcg_debug_assert(size > 0 && size <=3D 8);
> -
> -     attrs =3D full->attrs;
> --    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
> -+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
> -     mr =3D section->mr;
> -
> -     BQL_LOCK_GUARD();
> -@@ -2001,7 +1999,7 @@ static Int128 do_ld16_mmio_beN(CPUState *cpu, CPUT=
LBEntryFull *full,
> -     tcg_debug_assert(size > 8 && size <=3D 16);
> -
> -     attrs =3D full->attrs;
> --    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
> -+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
> -     mr =3D section->mr;
> -
> -     BQL_LOCK_GUARD();
> -@@ -2521,7 +2519,7 @@ static uint64_t do_st_mmio_leN(CPUState *cpu, CPUT=
LBEntryFull *full,
> -     tcg_debug_assert(size > 0 && size <=3D 8);
> -
> -     attrs =3D full->attrs;
> --    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
> -+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
> -     mr =3D section->mr;
> -
> -     BQL_LOCK_GUARD();
> -@@ -2541,7 +2539,7 @@ static uint64_t do_st16_mmio_leN(CPUState *cpu, CP=
UTLBEntryFull *full,
> -     tcg_debug_assert(size > 8 && size <=3D 16);
> -
> -     attrs =3D full->attrs;
> --    section =3D io_prepare(&mr_offset, cpu, full->xlat_section, attrs, =
addr, ra);
> -+    section =3D io_prepare(&mr_offset, cpu, full, attrs, addr, ra);
> -     mr =3D section->mr;
> -
> -     BQL_LOCK_GUARD();
> -diff --git a/include/accel/tcg/iommu.h b/include/accel/tcg/iommu.h
> -index 90cfd6c0e..547f8ea0e 100644
> ---- a/include/accel/tcg/iommu.h
> -+++ b/include/accel/tcg/iommu.h
> -@@ -14,18 +14,6 @@
> - #include "exec/hwaddr.h"
> - #include "exec/memattrs.h"
> -
> --/**
> -- * iotlb_to_section:
> -- * @cpu: CPU performing the access
> -- * @index: TCG CPU IOTLB entry
> -- *
> -- * Given a TCG CPU IOTLB entry, return the MemoryRegionSection that
> -- * it refers to. @index will have been initially created and returned
> -- * by memory_region_section_get_iotlb().
> -- */
> --MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> --                                      hwaddr index, MemTxAttrs attrs);
> --
> - MemoryRegionSection *address_space_translate_for_iotlb(CPUState *cpu,
> -                                                        int asidx,
> -                                                        hwaddr addr,
> -@@ -34,8 +22,5 @@ MemoryRegionSection *address_space_translate_for_iotlb=
(CPUState *cpu,
> -                                                        MemTxAttrs attrs=
,
> -                                                        int *prot);
> -
> --hwaddr memory_region_section_get_iotlb(CPUState *cpu,
> --                                       MemoryRegionSection *section);
> --
> - #endif
> -
> -diff --git a/include/exec/cputlb.h b/include/exec/cputlb.h
> -index 9bec0e789..16f866990 100644
> ---- a/include/exec/cputlb.h
> -+++ b/include/exec/cputlb.h
> -@@ -43,8 +43,8 @@ void tlb_reset_dirty_range_all(ram_addr_t start, ram_a=
ddr_t length);
> -  * @full: the details of the tlb entry
> -  *
> -  * Add an entry to @cpu tlb index @mmu_idx.  All of the fields of
> -- * @full must be filled, except for xlat_section, and constitute
> -- * the complete description of the translated page.
> -+ * @full must be filled, except for xlat_offset & section, and
> -+ * constitute the complete description of the translated page.
> -  *
> -  * This is generally called by the target tlb_fill function after
> -  * having performed a successful page table walk to find the physical
> -diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> -index 961505177..a3db3f66f 100644
> ---- a/include/hw/core/cpu.h
> -+++ b/include/hw/core/cpu.h
> -@@ -214,15 +214,16 @@ typedef uint32_t MMUIdxMap;
> -  */
> - struct CPUTLBEntryFull {
> -     /*
> --     * @xlat_section contains:
> --     *  - in the lower TARGET_PAGE_BITS, a physical section number
> --     *  - with the lower TARGET_PAGE_BITS masked off, an offset which
> --     *    must be added to the virtual address to obtain:
> --     *     + the ram_addr_t of the target RAM (if the physical section
> --     *       number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
> --     *     + the offset within the target MemoryRegion (otherwise)
> -+     * @xlat_offset: TARGET_PAGE_BITS aligned offset which must be adde=
d to
> -+     * the virtual address to obtain:
> -+     *   + the ram_addr_t of the target RAM (if the physical section
> -+     *     number is PHYS_SECTION_NOTDIRTY or PHYS_SECTION_ROM)
> -+     *   + the offset within the target MemoryRegion (otherwise)
> -      */
> --    hwaddr xlat_section;
> -+    hwaddr xlat_offset;
> -+
> -+    /* @section contains physical section. */
> -+    MemoryRegionSection *section;
> -
> -     /*
> -      * @phys_addr contains the physical address in the address space
> -diff --git a/system/physmem.c b/system/physmem.c
> -index c9869e404..a21e7ca64 100644
> ---- a/system/physmem.c
> -+++ b/system/physmem.c
> -@@ -748,31 +748,6 @@ translate_fail:
> -     return &d->map.sections[PHYS_SECTION_UNASSIGNED];
> - }
> -
> --MemoryRegionSection *iotlb_to_section(CPUState *cpu,
> --                                      hwaddr index, MemTxAttrs attrs)
> --{
> --    int asidx =3D cpu_asidx_from_attrs(cpu, attrs);
> --    CPUAddressSpace *cpuas =3D &cpu->cpu_ases[asidx];
> --    AddressSpaceDispatch *d =3D address_space_to_dispatch(cpuas->as);
> --    int section_index =3D index & ~TARGET_PAGE_MASK;
> --    MemoryRegionSection *ret;
> --
> --    assert(section_index < d->map.sections_nb);
> --    ret =3D d->map.sections + section_index;
> --    assert(ret->mr);
> --    assert(ret->mr->ops);
> --
> --    return ret;
> --}
> --
> --/* Called from RCU critical section */
> --hwaddr memory_region_section_get_iotlb(CPUState *cpu,
> --                                       MemoryRegionSection *section)
> --{
> --    AddressSpaceDispatch *d =3D flatview_to_dispatch(section->fv);
> --    return section - d->map.sections;
> --}
> --
> - #endif /* CONFIG_TCG */
> -
> - void cpu_address_space_init(CPUState *cpu, int asidx,
> ---
> -2.43.0
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Co=
rrection-to-HWCAP2-accessor.patch b/meta/recipes-devtools/qemu/qemu/0001-li=
nux-user-elfload.c-Correction-to-HWCAP2-accessor.patch
> deleted file mode 100644
> index 47d6f41385..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-elfload.c-Correctio=
n-to-HWCAP2-accessor.patch
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -From c333f9c4ee212297f3b9a8a6ef62396a63c48e61 Mon Sep 17 00:00:00 2001
> -From: Jim MacArthur <jim.macarthur@linaro.org>
> -Date: Tue, 6 Jan 2026 15:40:48 +0000
> -Subject: [PATCH] linux-user/elfload.c: Correction to HWCAP2 accessor
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -get_elf_hwcap was used when get_elf_hwcap2 should have been.
> -
> -Cc: qemu-stable@nongnu.org
> -Fixes: fcac98d0ba8b ("linux-user: Remove ELF_HWCAP2")
> -Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3259
> -Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> -Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> -Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> -Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> -Message-ID: <20260106-fix-hwcap2-sve2-v1-1-1d70dff63370@linaro.org>
> -
> -Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/c333f9c4ee212297f3b9a8a6ef62396a63c48e61]
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - linux-user/elfload.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> -index 0002d5be2f..35471c0c9a 100644
> ---- a/linux-user/elfload.c
> -+++ b/linux-user/elfload.c
> -@@ -708,7 +708,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int =
argc, int envc,
> -     NEW_AUX_ENT(AT_EXECFN, info->file_string);
> -
> -     if (HAVE_ELF_HWCAP2) {
> --        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap(thread_cpu));
> -+        NEW_AUX_ENT(AT_HWCAP2, get_elf_hwcap2(thread_cpu));
> -     }
> -     if (u_base_platform) {
> -         NEW_AUX_ENT(AT_BASE_PLATFORM, u_base_platform);
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-envir=
onment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-=
qemu-Add-addition-environment-space-to-boot-loader-q.patch
> index bc8dace013..40b08cd247 100644
> --- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
> @@ -1,10 +1,10 @@
> -From f2d9bc614f7edf66412209aba78aa086e65dc75e Mon Sep 17 00:00:00 2001
> +From a84184c98cf296954e0c757604e969b8565eb474 Mon Sep 17 00:00:00 2001
>  From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Fri, 28 Mar 2014 17:42:43 +0800
>  Subject: [PATCH] qemu: Add addition environment space to boot loader
>   qemu-system-mips
>
> -Upstream-Status: Inappropriate - OE uses deep paths
> +Upstream-Status: Inappropriate [OE uses deep paths]
>
>  If you create a project with very long directory names like 128 characte=
rs
>  deep and use NFS, the kernel arguments will be truncated. The kernel wil=
l
> @@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> -index cbdbb2105..62681fdae 100644
> +index 812ff64d8..daf929943 100644
>  --- a/hw/mips/malta.c
>  +++ b/hw/mips/malta.c
> -@@ -65,7 +65,7 @@
> +@@ -66,7 +66,7 @@
>   #define ENVP_PADDR          0x2000
>   #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
>   #define ENVP_NB_ENTRIES     16
> diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-=
to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-=
to-PIC.patch
> index bfc85f4842..ad00f24482 100644
> --- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
> +++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.=
patch
> @@ -1,4 +1,4 @@
> -From 945af9ecc80653955cbdbb7d3e28dce61795b251 Mon Sep 17 00:00:00 2001
> +From 0a688e763d91c2e0e11cbe960f405442a9f35417 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Tue, 26 Feb 2013 11:43:28 -0500
>  Subject: [PATCH] apic: fixup fallthrough to PIC
> @@ -33,10 +33,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> -index aad253a..212b01f 100644
> +index 8766ed00b..581fc6deb 100644
>  --- a/hw/intc/apic.c
>  +++ b/hw/intc/apic.c
> -@@ -740,7 +740,7 @@ int apic_accept_pic_intr(APICCommonState *s)
> +@@ -741,7 +741,7 @@ int apic_accept_pic_intr(APICCommonState *s)
>   {
>       uint32_t lvt0;
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-fil=
e-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-in=
clude-file-if-not-exists.patch
> index 2e738abaa3..4b6ac54445 100644
> --- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-no=
t-exists.patch
> @@ -1,4 +1,4 @@
> -From f8c1614b204c1d64af906dc70dbf4a1534eb6b38 Mon Sep 17 00:00:00 2001
> +From b38315a5a6f9fc033c72bb94ff258bb4b1ac8dd3 Mon Sep 17 00:00:00 2001
>  From: Oleksiy Obitotskyy <oobitots@cisco.com>
>  Date: Wed, 25 Mar 2020 21:21:35 +0200
>  Subject: [PATCH] qemu: Do not include file if not exists
> @@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com=
>
>   1 file changed, 2 insertions(+)
>
>  diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> -index c236b2834..2a3527a87 100644
> +index f4b74ad35..3da51ea83 100644
>  --- a/linux-user/syscall.c
>  +++ b/linux-user/syscall.c
> -@@ -119,7 +119,9 @@
> +@@ -117,7 +117,9 @@
>   #include <linux/blkpg.h>
>   #include <netpacket/packet.h>
>   #include <linux/netlink.h>
> diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-spac=
e-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-=
qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
> index ffbbb1ab32..59236999f9 100644
> --- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-=
tweaks-to-address-musl.patch
> @@ -1,4 +1,4 @@
> -From 3621615790270449bf9c8a0777e8ef28eb762bf9 Mon Sep 17 00:00:00 2001
> +From e4abb937ba5a6a476d31886e71e67006df22a664 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Fri, 8 Jan 2021 17:27:06 +0000
>  Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 3=
2 bit
> @@ -16,32 +16,24 @@ A better return value for the other cases of invalid =
addresses is EINVAL
>  rather than ENOMEM so adjust the other part of the test to this.
>
>  Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-deve=
l/2021-01/msg01355.html]
> -Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>  ---
> - linux-user/mmap.c | 10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> + linux-user/mmap.c | 5 +++++
> + 1 file changed, 5 insertions(+)
>
>  diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> -index 002e1e668..912839dec 100644
> +index b635b6a21..a5a617516 100644
>  --- a/linux-user/mmap.c
>  +++ b/linux-user/mmap.c
> -@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_u=
long old_size,
> +@@ -1113,6 +1113,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ul=
ong old_size,
>       int prot;
>       void *host_addr;
>
> --    if (!guest_range_valid_untagged(old_addr, old_size) ||
> --        ((flags & MREMAP_FIXED) &&
>  +    if (!guest_range_valid_untagged(old_addr, old_size)) {
>  +        errno =3D EFAULT;
>  +        return -1;
>  +    }
> -+
> -+    if (((flags & MREMAP_FIXED) &&
> ++
> +     if (((flags & MREMAP_FIXED) &&
>            !guest_range_valid_untagged(new_addr, new_size)) ||
>           ((flags & MREMAP_MAYMOVE) =3D=3D 0 &&
> -          !guest_range_valid_untagged(old_addr, new_size))) {
> --        errno =3D ENOMEM;
> -+        errno =3D EINVAL;
> -         return -1;
> -     }
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.=
patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
> index 5b24c18916..0d7974fcdc 100644
> --- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
> @@ -1,4 +1,4 @@
> -From 8b28a9376074067bc2d84d4f77d5c7a42433b31b Mon Sep 17 00:00:00 2001
> +From e891928d2248e186c65979cf5a2ba0cff9d00824 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Mon, 1 Mar 2021 13:00:47 +0000
>  Subject: [PATCH] qemu: Determinism fixes
> @@ -11,6 +11,8 @@ meson to pass relative paths but we can fix that in the=
 script.
>
>  Upstream-Status: Pending [some version of all/part of this may be accept=
ed]
>  RP 2021/3/1
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>  ---
>   scripts/decodetree.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-r=
elative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-=
tests-meson.build-use-relative-path-to-refer-to-file.patch
> index a58c936d06..275c500894 100644
> --- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative=
-path-to-refer-to-file.patch
> @@ -1,4 +1,4 @@
> -From 097b75ad8310143decab92f6d1744144e7a4809f Mon Sep 17 00:00:00 2001
> +From ac9a866ac807cb1542f26df07b4aad3a06342a99 Mon Sep 17 00:00:00 2001
>  From: Changqing Li <changqing.li@windriver.com>
>  Date: Thu, 14 Jan 2021 06:33:04 +0000
>  Subject: [PATCH] tests/meson.build: use relative path to refer to files
> @@ -17,10 +17,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.c=
om>
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
>  diff --git a/tests/unit/meson.build b/tests/unit/meson.build
> -index d5248ae51..2c581f055 100644
> +index 41e8b06c3..ce5df4957 100644
>  --- a/tests/unit/meson.build
>  +++ b/tests/unit/meson.build
> -@@ -127,17 +127,17 @@ endif
> +@@ -124,17 +124,17 @@ endif
>
>   if have_system
>     tests +=3D {
> diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP=
_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-=
Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
> index af0eafb65f..f6e563ad80 100644
> --- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED=
_VALIDATE-on-needed-li.patch
> @@ -1,4 +1,4 @@
> -From 9d5deb767523ea0d1aeecb9960244c702530acad Mon Sep 17 00:00:00 2001
> +From c0bfd2c5556afcf4413c81b3fda54a62f2bdd8c8 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Mon, 21 Mar 2022 10:09:38 -0700
>  Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
> diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-=
exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-l=
ookup-meson-exutable-from-PATH.patch
> index db88766cf6..430b1aa509 100644
> --- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutabl=
e-from-PATH.patch
> @@ -1,4 +1,4 @@
> -From aaec67c133dddda7204d23964732b4b788cbc9ce Mon Sep 17 00:00:00 2001
> +From e357ac91b04f733148defe8c133ae8b2085a9a23 Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?Martin=3D20Hundeb=3DC3=3DB8ll?=3D <martin@geanix.com>
>  Date: Wed, 22 May 2024 14:02:55 +0200
>  Subject: [PATCH] configure: lookup meson exutable from PATH
> @@ -13,10 +13,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
>  diff --git a/configure b/configure
> -index 82cace1..83bbda9 100755
> +index eea903067..217af781f 100755
>  --- a/configure
>  +++ b/configure
> -@@ -993,10 +993,7 @@ get_pwd() {
> +@@ -981,10 +981,7 @@ get_pwd() {
>       fi
>   }
>
> @@ -26,5 +26,5 @@ index 82cace1..83bbda9 100755
>  -fi
>  +meson=3D`which meson`
>
> - # Conditionally ensure Sphinx is installed.
> -
> + # On Haiku, meson might show up in a "non-packaged" subfolder instead, =
see
> + # https://github.com/haiku/haiku/blob/r1beta5/docs/user/storage/storage=
intro.dox
> diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the=
-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-=
qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
> index d04596d313..040931a941 100644
> --- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python=
-venv-aren-t-used-for-.patch
> @@ -1,4 +1,4 @@
> -From c9f174b2f7b43e59e91f88c75c8b3e2ee30bfcdd Mon Sep 17 00:00:00 2001
> +From 70fa360e5bf72b28960747da47d9b85e650ad312 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 22 May 2024 13:58:23 +0200
>  Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for me=
son
> @@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure b/configure
> -index 84e429409..1a9585e8e 100755
> +index 217af781f..cf8666337 100755
>  --- a/configure
>  +++ b/configure
> -@@ -981,14 +981,14 @@ python=3D"$(command -v "$python")"
> +@@ -951,14 +951,14 @@ python=3D"$(command -v "$python")"
>   echo "python determined to be '$python'"
>   echo "python version: $($python --version)"
>
> @@ -47,5 +47,5 @@ index 84e429409..1a9585e8e 100755
>  -mkvenv=3D"$python ${source_path}/python/scripts/mkvenv.py"
>  +mkvenv=3Dtrue
>
> - # Finish preparing the virtual environment using vendored .whl files
> -
> + # Finish preparing the virtual environment using vendored .whl files.
> + # Even if PyPI is allowed, we disallow it here to force installation
> diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/=
meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
> deleted file mode 100644
> index 524e20a3dd..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 475dbdbee7ff878d113f45a1a623e9abbf0e55f3 Mon Sep 17 00:00:00 2001
> -From: Natanael Copa <ncopa@alpinelinux.org>
> -Date: Wed, 18 Sep 2024 16:19:37 -0700
> -Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_=
np()
> -
> -strerrorname_np is non-portable and breaks building with musl libc.
> -
> -Use strerror(errno) instead, like we do other places.
> -
> -Upstream-Status: Submitted [https://mail.gnu.org/archive/html/qemu-stabl=
e/2023-12/msg00069.html]
> -
> -Cc: qemu-stable@nongnu.org
> -Fixes: commit 082e9e4a58ba (target/riscv/kvm: improve 'init_multiext_cfg=
' error
> -msg)
> -Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2041
> -Buglink: https://gitlab.alpinelinux.org/alpine/aports/-/issues/15541
> -Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
> ----
> - target/riscv/kvm/kvm-cpu.c | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> -index e06d2126b..e1cc02fba 100644
> ---- a/target/riscv/kvm/kvm-cpu.c
> -+++ b/target/riscv/kvm/kvm-cpu.c
> -@@ -1994,8 +1994,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **=
errp)
> -     if (riscv_has_ext(&cpu->env, RVV)) {
> -         ret =3D prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON=
);
> -         if (ret) {
> --            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, co=
de: %s",
> --                       strerrorname_np(errno));
> -+            error_setg(errp, "Error in prctl PR_RISCV_V_SET_CONTROL, er=
ror %d", errno);
> -             return false;
> -         }
> -     }
> diff --git a/meta/recipes-devtools/qemu/qemu_10.2.0.bb b/meta/recipes-dev=
tools/qemu/qemu_11.0.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu_10.2.0.bb
> rename to meta/recipes-devtools/qemu/qemu_11.0.0.bb
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#237180): https://lists.openembedded.org/g/openembedde=
d-core/message/237180
> Mute This Topic: https://lists.openembedded.org/mt/119331918/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

