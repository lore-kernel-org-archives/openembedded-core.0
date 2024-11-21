Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E40D7878A
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 16:24:29 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.2520.1732206263116654096
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 08:24:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HaA363Os;
 spf=pass (domain: gmail.com, ip: 209.85.167.178, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e5fcf464ecso718389b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732206262; x=1732811062; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1b2ezehUwkaCbiE9R02dQ9oNQf+LpP3+U1RHMMS3dM=;
        b=HaA363Os0tUq7ZVGnG+DwZPWM/xrHNr6Jt1isdTt81iNsabwqKZL5oG6671ISvKNxI
         gTm5axRk6annIwCk9aa7mW25BThaTT5ba74sUv2MTQjds170cy41sE0oTT8mkekvIdL+
         WiJWQDeONNrhTyI6n9XTKppsQrpMP4zjApqCnntI6tNoKQ2c538km3eg/cGz68RN0is4
         F5pdqikgf5Yz//UVqr1uoyrx8L350Zqx09fz0B5SS/t3gaQZYuaipxf1+46v2Sep527c
         W3dzPYloSR9P201ZSKQgazBz3RT9CdkRBNXZ2/yAUcynFFQhlWhi0zuEYYzlhNHOmS4l
         Pu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732206262; x=1732811062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1b2ezehUwkaCbiE9R02dQ9oNQf+LpP3+U1RHMMS3dM=;
        b=YxuZC78ixbAXAyFW2TnPSf0Wg6nw0iIK/m22x8Oyo8DDV63r4EbltCrEOm599yn1FD
         TKngOp6TYd/94JRg7NRTK/kh9KDlIQN5Xp+maQ4DzYqiFjsDH+cfmz5ODswC5cqILP06
         jMo8Us0++rp1oQVK2Y4AOaW8b0UszMdJmBiXmZkLMgRrhtdbCfQadfwh7U1xBOLv5MIG
         rowd5UY1+kRbDLeR3B9v2irhniXCLN6BzUnJdx2nuie9MBVtlduFwaQJrCIqsaq8Mb7F
         UCaSovHRq6l3vImU6aicL8u+PVykWtcWW7NWVKdyxlmn8w8qLJ8mZ17I1dcZ6wn9YUgN
         JppA==
X-Gm-Message-State: AOJu0Yw99znXN3WlSlnymZJulmVkQEAvdxzoufzb24+JYVzOKGZ5+DdO
	6+69zcNRPpxMwpEjDMMSXmw5xhi3c7pXnMHnDZD8TJR0twMGdzZ9hco63HAafbMuBbV1QDOVTfk
	04iZuLRFOcdaTZQLswg8UiIJj/U/SSA==
X-Gm-Gg: ASbGncvLR8iEFdBK8AtYFjarc86hZa5fsXc7EXEgLVnNEPYLIyP4W2cXhlCqgZGhHHM
	pYqwPcMwHbeyomCL1+UOT1vUs4XavgBiJhHwhT9KMIXGKs4askh8VPcLfCZzloPBU
X-Google-Smtp-Source: AGHT+IFGyxU/zWWwIiXbSBt8C5N9j4IqZ+5hvfpLRwZZXTzDaYY3OdHd/0ihV9l2CmBomnb4WIIHXFhzo3+m/cMl9Ac=
X-Received: by 2002:a05:6808:14ca:b0:3e7:bd00:bac6 with SMTP id
 5614622812f47-3e7eb7ceb05mr8187255b6e.30.1732206262231; Thu, 21 Nov 2024
 08:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20241121153859.2133751-1-tgamblin@baylibre.com>
 <20241121153859.2133751-2-tgamblin@baylibre.com> <CAMKF1so2AvyYYFNVr6uV7FdTPHvu0yyLOBJTxjQN3=oMPT137g@mail.gmail.com>
 <e011f1f8-5f9c-4140-85b7-0a67a81319c1@baylibre.com>
In-Reply-To: <e011f1f8-5f9c-4140-85b7-0a67a81319c1@baylibre.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2024 08:23:56 -0800
Message-ID: <CAMKF1soqc3op=GZaNQC+HgBbf7V8bHPtGEtVA1_1RXBKiF-Szw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] python3-numpy: upgrade 1.26.4 -> 2.1.3
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 16:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207547

ah that makes sense.

On Thu, Nov 21, 2024 at 8:18=E2=80=AFAM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:
>
>
> On 2024-11-21 11:13, Khem Raj wrote:
> > On Thu, Nov 21, 2024 at 7:39=E2=80=AFAM Trevor Gamblin via
> > lists.openembedded.org <tgamblin=3Dbaylibre.com@lists.openembedded.org>
> > wrote:
> >> - This release contains numerous API changes and bug fixes.
> >>    Changelog: https://github.com/numpy/numpy/releases
> >>
> >> - Notably, the build backend has switched to mesonpy since 1.26.4.
> >>
> >> - Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be update=
d
> >>    to change the paths for the target files. It has now been merged
> >>    upstream, but isn't included in any release yet. PR for reference:
> >>
> >>    https://github.com/numpy/numpy/pull/17780
> >>
> >> - Builds OK and seems to be compatible with current piglit and pandas
> >>    (meta-python), which was not the case for the previous upgrade atte=
mpt
> >>    to numpy 2.0.1.
> >>
> >> - For numpy, add 'pkgconfig' to inherit to avoid errors like this at
> >>    do_compile:
> >>
> >>    | Found Pkg-config: NO
> >>    | Run-time dependency python found: YES 3.12
> >>    | Has header "Python.h" with dependency python: NO
> >>    |
> >>    | ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cann=
ot compile `Python.h`. Perhaps you need to install python-dev|python-devel
> >>    |
> >>    | A full log can be found at /home/tgamblin/workspace/yocto/poky/bu=
ild/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson=
-log.txt
> >>
> >> - Mmodify the FILES:${PN}-staticdev line to fix a QA issue.
> >>
> >> - This is now reproducible as of oe-core commit: 917df5ed022f
> >>
> >> License-Update: Change copyright year to 2024
> >>
> >> buildall-qemu log:
> >>
> >> BUILDALL-QEMU LOG FOR python3-numpy
> >> START TIME: 2024-11-20_14:02:08
> >> HOSTNAME: megalith
> >> HOST OS: Debian GNU/Linux 12 (bookworm)
> >> HOST KERNEL: 6.1.0-27-amd64
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> BUILD RESULTS:
> >> [glibc]
> >> FAIL: qemuloongarch64
> >> PASS: qemuriscv32
> >> PASS: qemuarmv5
> >> PASS: qemuppc
> >> PASS: qemumips64
> >> PASS: qemuriscv64
> >> PASS: qemuarm64
> >> PASS: qemuarm
> >> PASS: qemux86-64
> >> PASS: qemuppc64
> >> PASS: qemux86
> >> PASS: qemumips
> >> [musl]
> >> FAIL: qemuloongarch64
> >> FAIL: qemuriscv32
> >> PASS: qemuarmv5
> >> PASS: qemuppc
> >> PASS: qemumips64
> >> PASS: qemuriscv64
> >> PASS: qemuarm64
> >> PASS: qemuarm
> >> PASS: qemux86-64
> >> PASS: qemuppc64
> >> PASS: qemux86
> >> PASS: qemumips
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> PASSED: 21
> >> FAILED: 3
> > Testing on such a comprehensive matrix is amazing, thanks for doing
> > it. Can you share more details on qemuriscv32/musl failures ?
>
> This was the error I saw when I went and checked the build with
> TCLIBC=3Dmusl, MACHINE=3Dqemuriscv32:
>
> ERROR: Nothing PROVIDES 'virtual/libc' (but
> /home/tgamblin/workspace/yocto/poky/meta/recipes-devtools/python/python3-=
numpy_2.1.3.bb,
> /home/tgamblin/workspace/yocto/poky/meta/recipes-devtools/gcc/gcc-runtime=
_14.2.bb,
> /home/tgamblin/workspace/yocto/poky/m)
> picolibc PROVIDES virtual/libc but was skipped: incompatible with host
> riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
> nativesdk-glibc-y2038-tests PROVIDES virtual/libc but was skipped:
> glibc-testsuite requires that virtual/libc is glibc
> glibc-y2038-tests PROVIDES virtual/libc but was skipped: incompatible
> with host riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
> newlib PROVIDES virtual/libc but was skipped: incompatible with host
> riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
> glibc PROVIDES virtual/libc but was skipped: incompatible with host
> riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
> musl PROVIDES virtual/libc but was skipped: incompatible with host
> riscv32-poky-linux-musl (not in COMPATIBLE_HOST)
> ERROR: Required build target 'python3-numpy' has no buildable providers.
> Missing or unbuildable dependency chain was: ['python3-numpy',
> 'virtual/libc']
>
> >
> >> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> >> ---
> >>   ...1-numpy-core-Define-RISCV-32-support.patch | 52 +++++++++++------=
--
> >>   ...numpy_1.26.4.bb =3D> python3-numpy_2.1.3.bb} | 26 ++++++----
> >>   2 files changed, 46 insertions(+), 32 deletions(-)
> >>   rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb =3D> py=
thon3-numpy_2.1.3.bb} (68%)
> >>
> >> diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-cor=
e-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-nump=
y/0001-numpy-core-Define-RISCV-32-support.patch
> >> index 676bdbb3afd..6da9047ec57 100644
> >> --- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Defin=
e-RISCV-32-support.patch
> >> +++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Defin=
e-RISCV-32-support.patch
> >> @@ -1,42 +1,50 @@
> >> -From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 200=
1
> >> +From 0e2b652a0eff85798584116c905a2d6ad8f25d5f Mon Sep 17 00:00:00 200=
1
> >>   From: Khem Raj <raj.khem@gmail.com>
> >>   Date: Sun, 15 Nov 2020 15:32:39 -0800
> >>   Subject: [PATCH] numpy/core: Define RISCV-32 support
> >>
> >>   Helps compile on riscv32
> >>
> >> -Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780=
]
> >> +Upstream-Status: Backport
> >> +(https://github.com/numpy/numpy/pull/17780/commits/0e2b652a0eff857985=
84116c905a2d6ad8f25d5f)
> >> +
> >>   Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>   ---
> >> - numpy/core/include/numpy/npy_cpu.h    | 3 +++
> >> - numpy/core/include/numpy/npy_endian.h | 1 +
> >> - 2 files changed, 4 insertions(+)
> >> + numpy/_core/include/numpy/npy_cpu.h    | 9 +++++++--
> >> + numpy/_core/include/numpy/npy_endian.h | 1 +
> >> + 2 files changed, 8 insertions(+), 2 deletions(-)
> >>
> >> -diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/=
numpy/npy_cpu.h
> >> -index 78d229e..04be511 100644
> >> ---- a/numpy/core/include/numpy/npy_cpu.h
> >> -+++ b/numpy/core/include/numpy/npy_cpu.h
> >> -@@ -19,6 +19,7 @@
> >> +diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/includ=
e/numpy/npy_cpu.h
> >> +index a19f8e6bbd..15f9f12931 100644
> >> +--- a/numpy/_core/include/numpy/npy_cpu.h
> >> ++++ b/numpy/_core/include/numpy/npy_cpu.h
> >> +@@ -18,6 +18,7 @@
> >> +  *              NPY_CPU_ARCEL
> >>     *              NPY_CPU_ARCEB
> >>     *              NPY_CPU_RISCV64
> >> -  *              NPY_CPU_LOONGARCH
> >>   + *              NPY_CPU_RISCV32
> >> +  *              NPY_CPU_LOONGARCH
> >>     *              NPY_CPU_WASM
> >>     */
> >> - #ifndef NUMPY_CORE_INCLUDE_NUMPY_NPY_CPU_H_
> >> -@@ -104,6 +105,8 @@
> >> +@@ -102,8 +103,12 @@
> >> +     #define NPY_CPU_ARCEL
> >> + #elif defined(__arc__) && defined(__BIG_ENDIAN__)
> >>        #define NPY_CPU_ARCEB
> >> - #elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen =3D=
=3D 64
> >> -     #define NPY_CPU_RISCV64
> >> -+#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen =3D=
=3D 32
> >> -+    #define NPY_CPU_RISCV32
> >> +-#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen =3D=
=3D 64
> >> +-    #define NPY_CPU_RISCV64
> >> ++#elif defined(__riscv)
> >> ++    #if __riscv_xlen =3D=3D 64
> >> ++      #define NPY_CPU_RISCV64
> >> ++    #elif __riscv_xlen =3D=3D 32
> >> ++      #define NPY_CPU_RISCV32
> >> ++    #endif
> >>    #elif defined(__loongarch__)
> >>        #define NPY_CPU_LOONGARCH
> >>    #elif defined(__EMSCRIPTEN__)
> >> -diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/inclu=
de/numpy/npy_endian.h
> >> -index 5e58a7f..0926212 100644
> >> ---- a/numpy/core/include/numpy/npy_endian.h
> >> -+++ b/numpy/core/include/numpy/npy_endian.h
> >> +diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/inc=
lude/numpy/npy_endian.h
> >> +index 5e58a7f52c..09262120bf 100644
> >> +--- a/numpy/_core/include/numpy/npy_endian.h
> >> ++++ b/numpy/_core/include/numpy/npy_endian.h
> >>   @@ -49,6 +49,7 @@
> >>                || defined(NPY_CPU_PPC64LE)       \
> >>                || defined(NPY_CPU_ARCEL)         \
> >> @@ -46,5 +54,5 @@ index 5e58a7f..0926212 100644
> >>                || defined(NPY_CPU_WASM)
> >>            #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
> >>   --
> >> -2.20.1
> >> +2.39.5
> >>
> >> diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/me=
ta/recipes-devtools/python/python3-numpy_2.1.3.bb
> >> similarity index 68%
> >> rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> >> rename to meta/recipes-devtools/python/python3-numpy_2.1.3.bb
> >> index fa78b07f48b..da75dff1e04 100644
> >> --- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
> >> +++ b/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
> >> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://numpy.org/"
> >>   DESCRIPTION =3D "NumPy is the fundamental package needed for scienti=
fic computing with Python."
> >>   SECTION =3D "devel/python"
> >>   LICENSE =3D "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MI=
T"
> >> -LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da752eb20459cf74a9d84ee=
4825e8317c"
> >> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1de863c37a83e71b1e97b6=
4d036ea78b"
> >>
> >>   SRCNAME =3D "numpy"
> >>
> >> @@ -13,22 +13,31 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${=
SRCNAME}-${PV}.tar.gz \
> >>              file://fix_reproducibility.patch \
> >>              file://run-ptest \
> >>              "
> >> -SRC_URI[sha256sum] =3D "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830=
d74a9df87efa4912010"
> >> +SRC_URI[sha256sum] =3D "aa08e04e08aaf974d4458def539dece0d28146d866a39=
da5639596f4921fd761"
> >>
> >>   GITHUB_BASE_URI =3D "https://github.com/numpy/numpy/releases"
> >>   UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
> >>
> >> -inherit ptest setuptools3 github-releases cython
> >> +inherit ptest python_mesonpy github-releases cython
> >>
> >>   S =3D "${WORKDIR}/numpy-${PV}"
> >>
> >> -CLEANBROKEN =3D "1"
> >> +# Remove references to buildpaths from numpy's __config__.py
> >> +do_install:append() {
> >> +    sed -i \
> >> +        -e 's|${S}=3D||g' \
> >> +        -e 's|${B}=3D||g' \
> >> +        -e 's|${RECIPE_SYSROOT_NATIVE}=3D||g' \
> >> +        -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
> >> +        -e 's|${RECIPE_SYSROOT}=3D||g' \
> >> +        -e 's|${RECIPE_SYSROOT}||g' ${D}${PYTHON_SITEPACKAGES_DIR}/nu=
mpy/__config__.py
> >>
> >> -do_compile:prepend() {
> >> -    export NPY_DISABLE_SVML=3D1
> >> +    nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}=
/numpy/__config__.py
> >>   }
> >>
> >> -FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib=
/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
> >> +FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/li=
b/*.a \
> >> +                          ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib=
/*.a \
> >> +"
> >>
> >>   # install what is needed for numpy.test()
> >>   RDEPENDS:${PN} =3D "python3-unittest \
> >> @@ -59,7 +68,4 @@ RDEPENDS:${PN}-ptest +=3D "python3-pytest \
> >>                            ldd \
> >>   "
> >>
> >> -# Upstream has a pyproject.toml but as of 1.26.4 it's marked as exper=
imental
> >> -INSANE_SKIP =3D "pep517-backend"
> >> -
> >>   BBCLASSEXTEND =3D "native nativesdk"
> >> --
> >> 2.39.5
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#207543): https://lists.openembedded.org/g/openembe=
dded-core/message/207543
> >> Mute This Topic: https://lists.openembedded.org/mt/109705562/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

