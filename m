Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C42C369DC
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 13:38:02 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web11.12328.1746106680151684341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 06:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QJlhmu3O;
 spf=pass (domain: gmail.com, ip: 209.85.161.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6049acb776bso484872eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746106679; x=1746711479; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4gHNjH3FjXgwhKd4UDfwjuN5HudzUEa2GrlvBYJ3jQM=;
        b=QJlhmu3Oh8FI+OVP49sFgnfoL0SwCxfsUc+2Yc1RVQbGFCU8QfY011xRET/kMja/to
         E3pDlpUTiAYP7e2FtUcArQ7r7+NAV99Syc0QlGVnQ40RyS0pW7IGxSkSocAoOLrvZvt2
         fGmL+g6FD8iHgj2SB/vx9ZUqyBH1Y5nl9D2RmCpLrfurk4+FcWqrnj/b3iDH1orcTvGW
         tPp2R8E4cfJoQv4Sag5lwLuxABjfr1bXNJWc7whK0mRGrvzamqc7mP5Y6uLK3ubtAXWF
         4rlH469/3Pi+E7RkFAnskBHCCNHBrefCfu5Hip//Sav7UWodUHVXevcYEYA7yMXmUBWj
         1qnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746106679; x=1746711479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gHNjH3FjXgwhKd4UDfwjuN5HudzUEa2GrlvBYJ3jQM=;
        b=YjnBDk9zFS+lyfKeEad+9csrXqSRrmPGggxhg+y+jzkWyxRFgUUdtUSBzxm6utnybV
         p+rc2ew5J6LxH71e64ASPgAzwVisf7e4StHZfhHlE4LuFUGLFyEYFlGgyyBLHzcgeTAJ
         xTpCvGeHdyCWJqlW1vFAwBROjR8ix1+SrZIy1Do+JD3FJHA0qpa5Cylv8FtSvdf58GA/
         J53H89bB3ulvJtcFIOE5QLYiS8oFmHO3oDQz+KzGAtGBU/JeREWSGEHrwc/I1+nmmpix
         EJ/lsaEbDZ00mSFn9Izdsgu/UOFHntT3mZrM1Y4OnKLJ2NOLXDWhA82UBtU0iQjQFF5v
         zw+A==
X-Gm-Message-State: AOJu0YzC+DN0H3lXbjwjBfHmCF136Ck7btE6EvvFOCI2H/pjTrjTDIW6
	7wTqwY9wPSV+Rft6sqolGSdzeKYgPDAzHElYT0DXatk2GdKmxFyTR75R5ppR5HFWi86Z8WMRM/x
	r5RsEAeISDdWMAasN7hlhCwhKC70=
X-Gm-Gg: ASbGncv17nKx+CG/CYyKLvg5vTbAqqKMICgQHbOWGtTN6g+eBOlnlwpMXOxDgRoJdYk
	Y43qcI/UhWIb/sNdW5A7J6xkz2rZjdcAgoFaFvwVKd3X4Q1GWoBIWv4WCZ9yoVE0vwX+6F2ZIzS
	VYGpRDBs2uXPI+xVgo7AB4quqHRix3LXEdauIi787qVNKZw1MuIMSQuXg=
X-Google-Smtp-Source: AGHT+IGq+ZMeypiJOsBao1Rump8Kx+K6rQ8w+3slQ6bCvztDXtR/E7y22wOHWJSJkbt5mkLhadMas3SQDdlp87fWS/Y=
X-Received: by 2002:a05:6820:3105:b0:606:8986:55a9 with SMTP id
 006d021491bc7-607e196ac55mr1468236eaf.5.1746106678650; Thu, 01 May 2025
 06:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
 <20250426-clang-merge-v4-6-42d205904261@gmail.com> <FA9792E4-EC70-4EAB-9979-6179C72A9999@arm.com>
In-Reply-To: <FA9792E4-EC70-4EAB-9979-6179C72A9999@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 May 2025 06:37:47 -0700
X-Gm-Features: ATxdqUF9qXUNHAFojyFRZdBsWzWmhJS2pUA-gpu9x6If-QDyKCWAhshWU2bWqqE
Message-ID: <CAMKF1soWGotae5NaC9nWG3ieKhsCPCmmg=MkAC1xozxXvvphYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 06/10] clang: Merge llvm/clang family recipes
 from meta-clang
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Liu Yiding <liuyd.fnst@fujitsu.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000522bf40634132488"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 13:38:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215772

--000000000000522bf40634132488
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 6:12=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:

> These recipes still set TOOLCHAIN, should these be left in bbappends in
> meta-clang for now?


I thought about it but I kept it because with this set I can completely
delete the recipes from meta-clang it will be simpler to maintain secondly
we are already setting it for other recipes in core

>
>
> Ross
>
> > On 27 Apr 2025, at 04:16, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > This can ensure that meta-clang does not carry them and can rely on cor=
e
> layer
> > while mesa can use them too.
> >
> > Fix llvm-config.h to be multilib safe
> >
> > Omit time stamps in openmp from generated files to improve
> > reproducibility
> >
> > fix the issue that:
> > | file /usr/include/llvm/Config/llvm-config.h conflicts between
> attempted installs of lib32-llvm-dev-20.1.2-r0.core2_32 and
> llvm-dev-20.1.2-r0.core2_64
> >
> > Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > .../clang/clang-cross-canadian_git.bb              |  36 ++
> > meta/recipes-devtools/clang/clang-cross_git.bb     |  39 ++
> > meta/recipes-devtools/clang/clang-crosssdk_git.bb  |  33 ++
> > ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
> > ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++++
> > ...-Simplify-cross-compilation.-Don-t-use-na.patch |  44 ++
> > ...LibraryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
> > ...allow-env-override-of-exe-and-libdir-path.patch |  71 +++
> > ...-clang-driver-Check-sysroot-for-ldso-path.patch |  78 ++++
> > ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
> > .../0008-clang-Prepend-trailing-to-sysroot.patch   |  39 ++
> > ...inside-the-target-sysroot-for-compiler-ru.patch |  41 ++
> > ...ang-Define-releative-gcc-installation-dir.patch | 123 +++++
> > ...pthread-and-ldl-along-with-lunwind-for-st.patch |  35 ++
> > ..._EXECUTABLE-when-cross-compiling-for-nati.patch |  24 +
> > .../0013-Check-for-atomic-double-intrinsics.patch  |  34 ++
> > ...configure-for-packages-using-find_package.patch |   2 +-
> > ...esource-dir-location-for-cross-toolchains.patch |  50 +++
> > ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |  79 ++++
> > .../0017-clang-Use-python3-in-python-scripts.patch |  35 ++
> > ...Insert-anchor-for-adding-OE-distro-vendor.patch | 167 +++++++
> > ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
> > ...86-triple-for-non-debian-multiarch-linux-.patch |  28 ++
> > ...0021-libunwind-Added-unw_backtrace-method.patch |  56 +++
> > .../0022-lldb-Link-with-libatomic-on-x86.patch     |  33 ++
> > ...023-compiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
> > ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |  62 +++
> > ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |  46 ++
> > ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
> > ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |  81 ++++
> > ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |  78 ++++
> > ...d-libunwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
> > ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
> > ...r-rt-Do-not-pass-target-to-clang-compiler.patch |  29 ++
> > .../clang/clang/0032-Fix-build-on-ppc64-musl.patch |  97 ++++
> > ...d-a-build-option-to-disable-building-dexp.patch |  85 ++++
> > ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |   4 +-
> > ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |  12 +-
> > ...ot-emit-date-and-time-into-generate-files.patch |  37 ++
> > .../clang}/spirv-internal-build.patch              |   0
> > .../clang}/spirv-shared-library.patch              |   0
> > meta/recipes-devtools/clang/clang_git.bb           | 496
> +++++++++++++++++++++
> > meta/recipes-devtools/clang/common-clang.inc       |  24 +
> > meta/recipes-devtools/clang/common-source.inc      |  17 +
> > meta/recipes-devtools/clang/common.inc             |  83 ++++
> > .../clang/compiler-rt-sanitizers_git.bb            | 139 ++++++
> > meta/recipes-devtools/clang/compiler-rt_git.bb     | 125 ++++++
> > meta/recipes-devtools/clang/libcxx_git.bb          | 119 +++++
> > meta/recipes-devtools/clang/llvm-project-source.bb |  12 +
> > .../recipes-devtools/clang/llvm-project-source.inc |  99 ++++
> > .../recipes-devtools/clang/nativesdk-clang-glue.bb |  36 ++
> > meta/recipes-devtools/clang/openmp_git.bb          |  67 +++
> > .../0007-llvm-allow-env-override-of-exe-path.patch |  36 --
> > meta/recipes-devtools/llvm/llvm/llvm-config        |  54 ---
> > meta/recipes-devtools/llvm/llvm_20.1.2.bb          | 233 ----------
> > 55 files changed, 3642 insertions(+), 333 deletions(-)
> >
> > diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..456c0d61bc560ee131e06fd37eb434a=
b366b1861
> > --- /dev/null
> > +++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
> > @@ -0,0 +1,36 @@
> > +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +SUMMARY =3D "Clang/LLVM based C/C++ compiler (cross-canadian for
> ${TARGET_ARCH} target)"
> > +HOMEPAGE =3D "http://clang.llvm.org/"
> > +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd48=
c3bdfef0c9d9fd17726e4b7dab"
> > +SECTION =3D "devel"
> > +
> > +PN =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> > +
> > +require common-clang.inc
> > +require common-source.inc
> > +inherit cross-canadian
> > +
> > +DEPENDS +=3D "nativesdk-clang
> binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}
> virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
> > +# We have to point gcc at a sysroot but we don't need to rebuild if
> this changes
> > +# e.g. we switch between different machines with different tunes.
> > +EXTRA_OECONF_PATHS[vardepsexclude] =3D "TUNE_PKGARCH"
> > +TARGET_ARCH[vardepsexclude] =3D "TUNE_ARCH"
> > +
> > +do_install() {
> > + install -d ${D}${bindir}
> > + for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
> > + llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy
> llvm-objdump llvm-readelf \
> > + llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> > + do
> > + ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> > + done
> > +}
> > +SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-llvm-ar \
> > +                      *-llvm-ranlib *-llvm-nm *-lld *-ld.lld *-llvm-as
> *-llvm-strip \
> > +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf
> *-llvm-addr2line \
> > +                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov=
"
> > +do_install:append() {
> > + cross_canadian_bindirlinks
> > +}
> > diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb
> b/meta/recipes-devtools/clang/clang-cross_git.bb
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..9b9b120a3d793f6dd989b566b373693=
4f1c0ff8d
> > --- /dev/null
> > +++ b/meta/recipes-devtools/clang/clang-cross_git.bb
> > @@ -0,0 +1,39 @@
> > +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +SUMMARY =3D "Cross compiler wrappers for LLVM based C/C++ compiler"
> > +HOMEPAGE =3D "http://clang.llvm.org/"
> > +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd48=
c3bdfef0c9d9fd17726e4b7dab"
> > +SECTION =3D "devel"
> > +
> > +PN =3D "clang-cross-${TARGET_ARCH}"
> > +
> > +require common-clang.inc
> > +require common-source.inc
> > +inherit cross
> > +DEPENDS +=3D "clang-native virtual/cross-binutils"
> > +
> > +#INHIBIT_PACKAGE_STRIP =3D "1"
> > +INHIBIT_SYSROOT_STRIP =3D "1"
> > +do_install() {
> > +        install -d ${D}${bindir}
> > + for tool in clang-tidy lld ld.lld llvm-profdata \
> > +            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcop=
y
> llvm-objdump llvm-readelf \
> > +            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> > + do
> > + ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> > + done
> > + install -m 0755 ${STAGING_BINDIR_NATIVE}/clang
> ${D}${bindir}/${TARGET_PREFIX}clang
> > + install -m 0755 ${STAGING_BINDIR_NATIVE}/clang
> ${D}${bindir}/${TARGET_PREFIX}clang++
> > +}
> > +SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-lld *-ld.l=
ld \
> > +                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib
> *-llvm-strip \
> > +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf
> *-llvm-addr2line \
> > +                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov=
"
> > +
> > +SYSROOT_PREPROCESS_FUNCS +=3D "clangcross_sysroot_preprocess"
> > +
> > +clangcross_sysroot_preprocess () {
> > +        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
> > +}
> > +PACKAGES =3D ""
> > diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..47ac96f4f93688b216adc95f4473b8c=
2dc3ec98b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
> > @@ -0,0 +1,33 @@
> > +# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
> > +# Released under the MIT license (see COPYING.MIT for the terms)
> > +
> > +SUMMARY =3D "SDK Cross compiler wrappers for LLVM based C/C++ compiler=
"
> > +HOMEPAGE =3D "http://clang.llvm.org/"
> > +LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=3D0bcd48=
c3bdfef0c9d9fd17726e4b7dab"
> > +SECTION =3D "devel"
> > +
> > +PN =3D "clang-crosssdk-${SDK_SYS}"
> > +
> > +require common-clang.inc
> > +require common-source.inc
> > +inherit crosssdk
> > +DEPENDS +=3D "clang-native nativesdk-clang-glue
> virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
> > +
> > +do_install() {
> > +    install -d ${D}${bindir}
> > + for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
> > + llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy
> llvm-objdump llvm-readelf \
> > + llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
> > + do
> > + ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
> > + done
> > +}
> > +SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-lld *-ld.l=
ld \
> > +                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib
> *-llvm-strip \
> > +                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf
> *-llvm-addr2line \
> > +                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov=
"
> > +sysroot_stage_all () {
> > + sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
> > +}
> > +
> > +PACKAGES =3D ""
> > diff --git
> a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-when-LIBCXXABI_LIBU.patch
> b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-when-LIBCXXABI_LIBU.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..21b033b498e5d66322493b84da6814d=
5712c0a8a
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-headers=
-when-LIBCXXABI_LIBU.patch
> > @@ -0,0 +1,60 @@
> > +From ec9babfa91931042e7aa771915e2f1d4dc8d15e0 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sun, 27 Aug 2017 10:37:49 -0700
> > +Subject: [PATCH] libcxxabi: Find libunwind headers when
> > + LIBCXXABI_LIBUNWIND_INCLUDES is set
> > +
> > +Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake argument=
s
> > +then it ends up not searching the specified dir and unwind.h is not
> found
> > +especially for ARM targets
> > +
> > +This patch makes the searching synthesized directories and then set
> > +LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + libcxxabi/CMakeLists.txt | 15 ++++++++++-----
> > + 1 file changed, 10 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
> > +index 6dcfc51e5532..32478a62a058 100644
> > +--- a/libcxxabi/CMakeLists.txt
> > ++++ b/libcxxabi/CMakeLists.txt
> > +@@ -465,7 +465,7 @@ set(LIBCXXABI_LIBUNWIND_PATH
> "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
> > +     "Specify path to libunwind source." FORCE)
> > +
> > + if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
> > +-  find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h
> > ++  find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h
> > +     PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
> > +           ${LIBCXXABI_LIBUNWIND_PATH}/include
> > +           ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
> > +@@ -476,18 +476,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR
> LLVM_NATIVE_ARCH MATCHES ARM)
> > +     NO_CMAKE_FIND_ROOT_PATH
> > +   )
> > +
> > +-  if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL
> "LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND")
> > +-    set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL "")
> > ++  if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL
> "LIBCXXABI_LIBUNWIND_INCLUDES-NOTFOUND")
> > ++    set(LIBCXXABI_LIBUNWIND_INCLUDES "")
> > +   endif()
> > + endif()
> > +
> > +-if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}" STREQUAL "")
> > +-  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}")
> > ++if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES}" STREQUAL "")
> > ++  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES}")
> > + endif()
> > +
> > + add_custom_target(cxxabi-test-depends
> > +   COMMENT "Build dependencies required to run the libc++abi test
> suite.")
> > +
> > ++set(LIBCXXABI_LIBUNWIND_INCLUDES "${LIBCXXABI_LIBUNWIND_INCLUDES}"
> CACHE PATH
> > ++    "Specify path to libunwind includes." FORCE)
> > ++set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
> > ++    "Specify path to libunwind source." FORCE)
> > ++
> > + # Add source code. This also contains all of the logic for deciding
> linker flags
> > + # soname, etc...
> > + add_subdirectory(include)
> > diff --git
> a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedd=
ed-linux-target.patch
> b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedd=
ed-linux-target.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..88cef402daad0b0470f8057e55b2a71=
558c428d2
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embedd=
ed-linux-target.patch
> > @@ -0,0 +1,309 @@
> > +From 8cdfcfb9102c4008758bb844856e553d4fe4ae79 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sun, 19 Apr 2015 15:16:23 -0700
> > +Subject: [PATCH] compiler-rt: support a new embedded linux target
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + .../make/platform/clang_linux_embedded.mk     | 286 +++++++++++++++++=
+
> > + .../clang_linux_embedded_test_input.c         |   0
> > + 2 files changed, 286 insertions(+)
> > + create mode 100644 compiler-rt/make/platform/clang_linux_embedded.mk
> > + create mode 100644
> compiler-rt/make/platform/clang_linux_embedded_test_input.c
> > +
> > +diff --git a/compiler-rt/make/platform/clang_linux_embedded.mk
> b/compiler-rt/make/platform/clang_linux_embedded.mk
> > +new file mode 100644
> > +index 000000000000..d0a890075a1c
> > +--- /dev/null
> > ++++ b/compiler-rt/make/platform/clang_linux_embedded.mk
> > +@@ -0,0 +1,286 @@
> > ++# These are the functions which clang needs when it is targeting a
> previous
> > ++# version of the OS. The issue is that the backend may use functions
> which were
> > ++# not present in the libgcc that shipped on the platform. In such
> cases, we link
> > ++# with a version of the library which contains private_extern
> definitions of all
> > ++# the extra functions which might be referenced.
> > ++
> > ++Description :=3D Static runtime libraries for embedded clang/Linux
> > ++
> > ++# A function that ensures we don't try to build for architectures tha=
t
> we
> > ++# don't have working toolchains for.
> > ++CheckArches =3D \
> > ++  $(shell \
> > ++    result=3D""; \
> > ++    for arch in $(1); do \
> > ++      if $(CC) -arch $$arch -c \
> > ++  -integrated-as \
> > ++  $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.c \
> > ++  -o /dev/null > /dev/null 2> /dev/null; then \
> > ++        result=3D"$$result$$arch "; \
> > ++      else \
> > ++ printf 1>&2 \
> > ++  "warning: clang_linux_embedded.mk: dropping arch '$$arch' from lib
> '$(2)'\n"; \
> > ++      fi; \
> > ++    done; \
> > ++    echo $$result)
> > ++
> > ++XCRun =3D \
> > ++  $(shell \
> > ++    result=3D`xcrun -find $(1) 2> /dev/null`; \
> > ++    if [ "$$?" !=3D "0" ]; then result=3D$(1); fi; \
> > ++    echo $$result)
> > ++
> > ++###
> > ++
> > ++CC       :=3D $(call XCRun,clang)
> > ++AR       :=3D $(call XCRun,ar)
> > ++RANLIB   :=3D $(call XCRun,ranlib)
> > ++STRIP    :=3D $(call XCRun,strip)
> > ++LIPO     :=3D $(call XCRun,lipo)
> > ++DSYMUTIL :=3D $(call XCRun,dsymutil)
> > ++Configs :=3D
> > ++UniversalArchs :=3D
> > ++
> > ++# Soft-float version of the runtime. No floating-point instructions
> will be used
> > ++# and the ABI (out of necessity) passes floating values in normal
> registers:
> > ++# non-VFP variant of the AAPCS.
> > ++UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7em
> armv7,soft_static)
> > ++Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)
> > ++
> > ++# Hard-float version of the runtime. On ARM VFP instructions and
> registers are
> > ++# allowed, and floating point values get passed in them. VFP variant
> of the
> > ++# AAPCS.
> > ++UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i386
> x86_64,hard_static)
> > ++Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)
> > ++
> > ++UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7em
> armv7,soft_pic)
> > ++Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)
> > ++
> > ++UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386
> x86_64,hard_pic)
> > ++Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)
> > ++
> > ++CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding
> > ++
> > ++PIC_CFLAGS :=3D -fPIC
> > ++STATIC_CFLAGS :=3D -static
> > ++
> > ++CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft
> > ++CFLAGS_HARD :=3D -mfloat-abi=3Dhard
> > ++
> > ++CFLAGS_I386  :=3D -march=3Dpentium
> > ++
> > ++CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)
> > ++CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)
> > ++CFLAGS.soft_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)
> > ++CFLAGS.hard_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)
> > ++
> > ++CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)
> > ++CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)
> > ++CFLAGS.soft_pic.armv7    :=3D $(CFLAGS.soft_pic) $(CFLAGS_ARMV7)
> > ++CFLAGS.hard_pic.armv7    :=3D $(CFLAGS.hard_pic) $(CFLAGS_ARMV7)
> > ++
> > ++# x86 platforms ignore -mfloat-abi options and complain about doing
> so. Despite
> > ++# this they're hard-float.
> > ++CFLAGS.hard_static.i386   :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_I3=
86)
> > ++CFLAGS.hard_pic.i386      :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_I386)
> > ++CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)
> > ++CFLAGS.hard_pic.x86_64    :=3D $(CFLAGS) $(PIC_CFLAGS)
> > ++
> > ++# Functions not wanted:
> > ++#   + eprintf is obsolete anyway
> > ++#   + *vfp: designed for Thumb1 CPUs with VFPv2
> > ++
> > ++COMMON_FUNCTIONS :=3D \
> > ++ absvdi2 \
> > ++ absvsi2 \
> > ++ addvdi3 \
> > ++ addvsi3 \
> > ++ ashldi3 \
> > ++ ashrdi3 \
> > ++ bswapdi2 \
> > ++ bswapsi2 \
> > ++ clzdi2 \
> > ++ clzsi2 \
> > ++ cmpdi2 \
> > ++ ctzdi2 \
> > ++ ctzsi2 \
> > ++ divdc3 \
> > ++ divdi3 \
> > ++ divsc3 \
> > ++ divmodsi4 \
> > ++ udivmodsi4 \
> > ++ do_global_dtors \
> > ++ ffsdi2 \
> > ++ fixdfdi \
> > ++ fixsfdi \
> > ++ fixunsdfdi \
> > ++ fixunsdfsi \
> > ++ fixunssfdi \
> > ++ fixunssfsi \
> > ++ floatdidf \
> > ++ floatdisf \
> > ++ floatundidf \
> > ++ floatundisf \
> > ++ gcc_bcmp \
> > ++ lshrdi3 \
> > ++ moddi3 \
> > ++ muldc3 \
> > ++ muldi3 \
> > ++ mulsc3 \
> > ++ mulvdi3 \
> > ++ mulvsi3 \
> > ++ negdi2 \
> > ++ negvdi2 \
> > ++ negvsi2 \
> > ++ paritydi2 \
> > ++ paritysi2 \
> > ++ popcountdi2 \
> > ++ popcountsi2 \
> > ++ powidf2 \
> > ++ powisf2 \
> > ++ subvdi3 \
> > ++ subvsi3 \
> > ++ ucmpdi2 \
> > ++ udiv_w_sdiv \
> > ++ udivdi3 \
> > ++ udivmoddi4 \
> > ++ umoddi3 \
> > ++ adddf3 \
> > ++ addsf3 \
> > ++ cmpdf2 \
> > ++ cmpsf2 \
> > ++ div0 \
> > ++ divdf3 \
> > ++ divsf3 \
> > ++ divsi3 \
> > ++ extendsfdf2 \
> > ++ ffssi2 \
> > ++ fixdfsi \
> > ++ fixsfsi \
> > ++ floatsidf \
> > ++ floatsisf \
> > ++ floatunsidf \
> > ++ floatunsisf \
> > ++ comparedf2 \
> > ++ comparesf2 \
> > ++ modsi3 \
> > ++ muldf3 \
> > ++ mulsf3 \
> > ++ negdf2 \
> > ++ negsf2 \
> > ++ subdf3 \
> > ++ subsf3 \
> > ++ truncdfsf2 \
> > ++ udivsi3 \
> > ++ umodsi3 \
> > ++ unorddf2 \
> > ++ unordsf2
> > ++
> > ++ARM_FUNCTIONS :=3D \
> > ++ aeabi_cdcmpeq \
> > ++ aeabi_cdrcmple \
> > ++ aeabi_cfcmpeq \
> > ++ aeabi_cfrcmple \
> > ++ aeabi_dcmpeq \
> > ++ aeabi_dcmpge \
> > ++ aeabi_dcmpgt \
> > ++ aeabi_dcmple \
> > ++ aeabi_dcmplt \
> > ++ aeabi_drsub \
> > ++ aeabi_fcmpeq \
> > ++ aeabi_fcmpge \
> > ++ aeabi_fcmpgt \
> > ++ aeabi_fcmple \
> > ++ aeabi_fcmplt \
> > ++ aeabi_frsub \
> > ++ aeabi_idivmod \
> > ++ aeabi_uidivmod \
> > ++
> > ++# ARM Assembly implementation which requires Thumb2 (i.e. won't work
> on v6M).
> > ++THUMB2_FUNCTIONS :=3D \
> > ++ switch16 \
> > ++ switch32 \
> > ++ switch8 \
> > ++ switchu8 \
> > ++ sync_fetch_and_add_4 \
> > ++ sync_fetch_and_sub_4 \
> > ++ sync_fetch_and_and_4 \
> > ++ sync_fetch_and_or_4 \
> > ++ sync_fetch_and_xor_4 \
> > ++ sync_fetch_and_nand_4 \
> > ++ sync_fetch_and_max_4 \
> > ++ sync_fetch_and_umax_4 \
> > ++ sync_fetch_and_min_4 \
> > ++ sync_fetch_and_umin_4 \
> > ++ sync_fetch_and_add_8 \
> > ++ sync_fetch_and_sub_8 \
> > ++ sync_fetch_and_and_8 \
> > ++ sync_fetch_and_or_8 \
> > ++ sync_fetch_and_xor_8 \
> > ++ sync_fetch_and_nand_8 \
> > ++ sync_fetch_and_max_8 \
> > ++ sync_fetch_and_umax_8 \
> > ++ sync_fetch_and_min_8 \
> > ++ sync_fetch_and_umin_8
> > ++
> > ++I386_FUNCTIONS :=3D  \
> > ++ i686.get_pc_thunk.eax \
> > ++ i686.get_pc_thunk.ebp \
> > ++ i686.get_pc_thunk.ebx \
> > ++ i686.get_pc_thunk.ecx \
> > ++ i686.get_pc_thunk.edi \
> > ++ i686.get_pc_thunk.edx \
> > ++ i686.get_pc_thunk.esi
> > ++
> > ++# FIXME: Currently, compiler-rt is missing implementations for a
> number of the
> > ++# functions. Filter them out for now.
> > ++MISSING_FUNCTIONS :=3D \
> > ++ cmpdf2 cmpsf2 div0 \
> > ++ ffssi2 \
> > ++ udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \
> > ++ bswapsi2 \
> > ++ gcc_bcmp \
> > ++ do_global_dtors \
> > ++ i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx \
> > ++ i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx \
> > ++ i686.get_pc_thunk.esi \
> > ++ aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple
> aeabi_dcmpeq \
> > ++ aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \
> > ++ aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmplt \
> > ++ aeabi_frsub aeabi_idivmod aeabi_uidivmod
> > ++
> > ++FUNCTIONS_ARMV6M  :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
> > ++FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
> $(THUMB2_FUNCTIONS)
> > ++FUNCTIONS_I386    :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)
> > ++FUNCTIONS_X86_64  :=3D $(COMMON_FUNCTIONS)
> > ++
> > ++FUNCTIONS_ARMV6M :=3D \
> > ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))
> > ++FUNCTIONS_ARM_ALL :=3D \
> > ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))
> > ++FUNCTIONS_I386 :=3D \
> > ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))
> > ++FUNCTIONS_X86_64 :=3D \
> > ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))
> > ++
> > ++FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)
> > ++FUNCTIONS.soft_pic.armv6m    :=3D $(FUNCTIONS_ARMV6M)
> > ++
> > ++FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)
> > ++FUNCTIONS.soft_pic.armv7m    :=3D $(FUNCTIONS_ARM_ALL)
> > ++
> > ++FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
> > ++FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
> > ++FUNCTIONS.soft_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
> > ++FUNCTIONS.hard_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
> > ++
> > ++FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
> > ++FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
> > ++FUNCTIONS.soft_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
> > ++FUNCTIONS.hard_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
> > ++
> > ++FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)
> > ++FUNCTIONS.hard_pic.i386    :=3D $(FUNCTIONS_I386)
> > ++
> > ++FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)
> > ++FUNCTIONS.hard_pic.x86_64    :=3D $(FUNCTIONS_X86_64)
> > +diff --git
> a/compiler-rt/make/platform/clang_linux_embedded_test_input.c
> b/compiler-rt/make/platform/clang_linux_embedded_test_input.c
> > +new file mode 100644
> > +index 000000000000..e69de29bb2d1
> > diff --git
> a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lation.-Don-t-use-na.patch
> b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lation.-Don-t-use-na.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..a153624860873d0740bd71cc1ae3574=
4a530b44f
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-compi=
lation.-Don-t-use-na.patch
> > @@ -0,0 +1,44 @@
> > +From c105a2efab08776d1f4df6b9b8d26d0f89d14b41 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 19 May 2016 23:11:45 -0700
> > +Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
> > + native-compiled llvm-config.
> > +
> > +    Note: AddLLVM.cmake does not expose the LLVM source directory.
> > +    So if you want to run the test suite, you need to either:
> > +
> > +    1) set LLVM_MAIN_SRC_DIR explicitly (to find lit.py)
> > +    2) change AddLLVM.cmake to point to an installed 'lit'.
> > +    3) add_subdirectory(compiler-rt/test) from clang instead of
> compiler-rt.
> > +
> > +
> https://us.codeaurora.org/patches/quic/llvm/50683/compiler-rt-cross-compi=
lation.patch
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Greg Fitzgerald <gregf@codeaurora.org>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + compiler-rt/CMakeLists.txt | 11 ++++++++++-
> > + 1 file changed, 10 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
> > +index 2c52788de56a..fe409704acc3 100644
> > +--- a/compiler-rt/CMakeLists.txt
> > ++++ b/compiler-rt/CMakeLists.txt
> > +@@ -107,7 +107,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
> > +   set(CMAKE_CXX_EXTENSIONS NO)
> > +
> > +   if (NOT LLVM_RUNTIMES_BUILD)
> > +-    load_llvm_config()
> > ++    find_package(LLVM REQUIRED)
> > ++    list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
> > ++
> > ++    # Variables that AddLLVM.cmake depends on (included by
> AddCompilerRT)
> > ++    set(LLVM_TOOLS_BINARY_DIR "${LLVM_INSTALL_PREFIX}/bin")
> > ++    set(LLVM_LIBRARY_DIR "${LLVM_INSTALL_PREFIX}/lib")
> > ++
> > ++    set(LLVM_LIBRARY_OUTPUT_INTDIR
> > ++      ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib${LLVM_LIBDIR_SUFFIX=
})
> > ++
> > +   endif()
> > +   if (TARGET intrinsics_gen)
> > +     # Loading the llvm config causes this target to be imported so
> place it
> > diff --git
> a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-=
libc-functions-if-th.patch
> b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-=
libc-functions-if-th.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..c70f740222f4d3282c469139f18f3cb=
fdab932b8
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefine-=
libc-functions-if-th.patch
> > @@ -0,0 +1,90 @@
> > +From 388a70b4a8f828b7c58a0fb7bc3ee18001bc5f9b Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 21 May 2016 00:33:20 +0000
> > +Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if
> they are
> > + macros
> > +
> > +musl defines some functions as macros and not inline functions
> > +if this is the case then make sure to undefine them
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + .../llvm/Analysis/TargetLibraryInfo.def       | 22 ++++++++++++++++++=
-
> > + 1 file changed, 21 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> > +index db566b8ee610..578161f9c978 100644
> > +--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> > ++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
> > +@@ -1467,6 +1467,9 @@ TLI_DEFINE_STRING_INTERNAL("fopen")
> > + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
> > +
> > + /// FILE *fopen64(const char *filename, const char *opentype)
> > ++#ifdef fopen64
> > ++#undef fopen64
> > ++#endif
> > + TLI_DEFINE_ENUM_INTERNAL(fopen64)
> > + TLI_DEFINE_STRING_INTERNAL("fopen64")
> > + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
> > +@@ -1545,7 +1548,9 @@ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Long, Int)
> > + TLI_DEFINE_ENUM_INTERNAL(fseeko)
> > + TLI_DEFINE_STRING_INTERNAL("fseeko")
> > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, IntX, Int)
> > +-
> > ++#ifdef fseeko64
> > ++#undef fseeko64
> > ++#endif
> > + /// int fseeko64(FILE *stream, off64_t offset, int whence)
> > + TLI_DEFINE_ENUM_INTERNAL(fseeko64)
> > + TLI_DEFINE_STRING_INTERNAL("fseeko64")
> > +@@ -1562,6 +1567,9 @@ TLI_DEFINE_STRING_INTERNAL("fstat")
> > + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
> > +
> > + /// int fstat64(int filedes, struct stat64 *buf)
> > ++#ifdef fstat64
> > ++#undef fstat64
> > ++#endif
> > + TLI_DEFINE_ENUM_INTERNAL(fstat64)
> > + TLI_DEFINE_STRING_INTERNAL("fstat64")
> > + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
> > +@@ -1587,6 +1595,9 @@ TLI_DEFINE_STRING_INTERNAL("ftello")
> > + TLI_DEFINE_SIG_INTERNAL(IntPlus, Ptr)
> > +
> > + /// off64_t ftello64(FILE *stream)
> > ++#ifdef ftello64
> > ++#undef ftello64
> > ++#endif
> > + TLI_DEFINE_ENUM_INTERNAL(ftello64)
> > + TLI_DEFINE_STRING_INTERNAL("ftello64")
> > + TLI_DEFINE_SIG_INTERNAL(Int64, Ptr)
> > +@@ -1827,6 +1838,9 @@ TLI_DEFINE_STRING_INTERNAL("lstat")
> > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > +
> > + /// int lstat64(const char *path, struct stat64 *buf);
> > ++#ifdef lstat64
> > ++#undef lstat64
> > ++#endif
> > + TLI_DEFINE_ENUM_INTERNAL(lstat64)
> > + TLI_DEFINE_STRING_INTERNAL("lstat64")
> > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > +@@ -2334,6 +2348,9 @@ TLI_DEFINE_STRING_INTERNAL("stat")
> > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > +
> > + /// int stat64(const char *path, struct stat64 *buf);
> > ++#ifdef stat64
> > ++#undef stat64
> > ++#endif
> > + TLI_DEFINE_ENUM_INTERNAL(stat64)
> > + TLI_DEFINE_STRING_INTERNAL("stat64")
> > + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
> > +@@ -2559,6 +2576,9 @@ TLI_DEFINE_STRING_INTERNAL("tmpfile")
> > + TLI_DEFINE_SIG_INTERNAL(Ptr)
> > +
> > + /// FILE *tmpfile64(void)
> > ++#ifdef tmpfile64
> > ++#undef tmpfile64
> > ++#endif
> > + TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
> > + TLI_DEFINE_STRING_INTERNAL("tmpfile64")
> > + TLI_DEFINE_SIG_INTERNAL(Ptr)
> > diff --git
> a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-a=
nd-libdir-path.patch
> b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-a=
nd-libdir-path.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..6d3f5293aab84056e9693b5d2282166=
fd72b1ede
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe-a=
nd-libdir-path.patch
> > @@ -0,0 +1,71 @@
> > +From 0b344231c49d8c145bc3ad882d259d36fb19e827 Mon Sep 17 00:00:00 2001
> > +From: Martin Kelly <mkelly@xevo.com>
> > +Date: Fri, 19 May 2017 00:22:57 -0700
> > +Subject: [PATCH] llvm: allow env override of exe and libdir path
> > +
> > +When using a native llvm-config from inside a sysroot, we need
> llvm-config to
> > +return the libraries, include directories, etc. from inside the sysroo=
t
> rather
> > +than from the native sysroot. Thus provide an env override for calling
> > +llvm-config from a target sysroot.
> > +
> > +Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables
> > +
> > +Upstream-Status: Inappropriate [OE-specific]
> > +
> > +Signed-off-by: Martin Kelly <mkelly@xevo.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
> > + 1 file changed, 19 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/llvm/tools/llvm-config/llvm-config.cpp
> b/llvm/tools/llvm-config/llvm-config.cpp
> > +index d5b76b1bb6c1..a739f0d8dbea 100644
> > +--- a/llvm/tools/llvm-config/llvm-config.cpp
> > ++++ b/llvm/tools/llvm-config/llvm-config.cpp
> > +@@ -246,6 +246,13 @@ Typical components:\n\
> > +
> > + /// Compute the path to the main executable.
> > + std::string GetExecutablePath(const char *Argv0) {
> > ++  // Hack for Yocto: we need to override the root path when we are
> using
> > ++  // llvm-config from within a target sysroot.
> > ++  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
> > ++  if (Sysroot !=3D nullptr) {
> > ++    return Sysroot;
> > ++  }
> > ++
> > +   // This just needs to be some symbol in the binary; C++ doesn't
> > +   // allow taking the address of ::main however.
> > +   void *P =3D (void *)(intptr_t)GetExecutablePath;
> > +@@ -325,7 +332,7 @@ int main(int argc, char **argv) {
> > +   // Compute various directory locations based on the derived locatio=
n
> > +   // information.
> > +   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir,
> ActiveLibDir,
> > +-              ActiveCMakeDir;
> > ++              ActiveCMakeDir, BaseLibDir;
> > +   std::string ActiveIncludeOption;
> > +   if (IsInDevelopmentTree) {
> > +     ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include";
> > +@@ -366,12 +373,18 @@ int main(int argc, char **argv) {
> > +       sys::fs::make_absolute(ActivePrefix, Path);
> > +       ActiveBinDir =3D std::string(Path);
> > +     }
> > +-    ActiveLibDir =3D ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
> > +-    {
> > +-      SmallString<256> Path(LLVM_INSTALL_PACKAGE_DIR);
> > +-      sys::fs::make_absolute(ActivePrefix, Path);
> > +-      ActiveCMakeDir =3D std::string(Path);
> > ++    // Hack for Yocto: we need to override the lib path when we are
> using
> > ++    // llvm-config from within a target sysroot since
> LLVM_LIBDIR_SUFFIX
> > ++    // maybe different for host llvm vs target e.g. ppc64 Libdir=3Dli=
b64
> but
> > ++    // x86_64 Libdir =3D lib
> > ++    const char *YoctoLibDir =3D std::getenv("YOCTO_ALTERNATE_LIBDIR")=
;
> > ++    if (YoctoLibDir !=3D nullptr) {
> > ++      BaseLibDir =3D std::string(YoctoLibDir);
> > ++    } else {
> > ++      BaseLibDir =3D std::string("/lib") + LLVM_LIBDIR_SUFFIX;
> > +     }
> > ++    ActiveLibDir =3D ActivePrefix + BaseLibDir;
> > ++    ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
> > +     ActiveIncludeOption =3D "-I" + ActiveIncludeDir;
> > +   }
> > +
> > diff --git
> a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-l=
dso-path.patch
> b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-l=
dso-path.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..02586878207cbc7393239d710822993=
08d426d6e
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for-l=
dso-path.patch
> > @@ -0,0 +1,78 @@
> > +From 80cacc04e4c0d34f79ee2f112b302c4fbb797d72 Mon Sep 17 00:00:00 2001
> > +From: Dan McGregor <dan.mcgregor@usask.ca>
> > +Date: Wed, 26 Apr 2017 20:29:41 -0600
> > +Subject: [PATCH] clang: driver: Check sysroot for ldso path
> > +
> > +when we build multilib the ldso has different paths than clangs
> defaults,
> > +every distro kind of does that so OE is not the only one,
> > +it happens especially on ppc64, where OE does not necessarily follow t=
he
> > +default path for the dynamic linker, therefore adjust it for OE. Check
> > +for the default path, and if it isn't there, check /lib.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/ToolChains/Linux.cpp | 22 +++++++++++++++++++++-
> > + 1 file changed, 21 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> > +index 0767fe6c5879..e5a696f63fd0 100644
> > +--- a/clang/lib/Driver/ToolChains/Linux.cpp
> > ++++ b/clang/lib/Driver/ToolChains/Linux.cpp
> > +@@ -523,8 +523,12 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +         Triple.getEnvironment() =3D=3D llvm::Triple::GNUEABIHFT64 ||
> > +         tools::arm::getARMFloatABI(*this, Args) =3D=3D
> tools::arm::FloatABI::Hard;
> > +
> > +-    LibDir =3D "lib";
> > +     Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
> > ++    LibDir =3D "lib32";
> > ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++        LibDir =3D "lib";
> > ++    }
> > +     break;
> > +   }
> > +   case llvm::Triple::loongarch32: {
> > +@@ -578,11 +582,19 @@ std::string Linux::getDynamicLinker(const ArgLis=
t
> &Args) const {
> > +     LibDir =3D "lib64";
> > +     Loader =3D
> > +         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" :
> "ld64.so.1";
> > ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++        LibDir =3D "lib";
> > ++    }
> > +     break;
> > +   case llvm::Triple::ppc64le:
> > +     LibDir =3D "lib64";
> > +     Loader =3D
> > +         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" :
> "ld64.so.2";
> > ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++        LibDir =3D "lib";
> > ++    }
> > +     break;
> > +   case llvm::Triple::riscv32:
> > +   case llvm::Triple::riscv64: {
> > +@@ -600,6 +612,10 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +   case llvm::Triple::sparcv9:
> > +     LibDir =3D "lib64";
> > +     Loader =3D "ld-linux.so.2";
> > ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++        LibDir =3D "lib";
> > ++    }
> > +     break;
> > +   case llvm::Triple::systemz:
> > +     LibDir =3D "lib";
> > +@@ -614,6 +630,10 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +
> > +     LibDir =3D X32 ? "libx32" : "lib64";
> > +     Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
> > ++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++        LibDir =3D "lib";
> > ++    }
> > +     break;
> > +   }
> > +   case llvm::Triple::ve:
> > diff --git
> a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..1681080ece279b38b0806889dde067c=
bf6ffe836
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lssp_=
nonshared-on-musl.patch
> > @@ -0,0 +1,32 @@
> > +From 47dfdd42687c403c044fdb830472d7bedc1b3d39 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 19 May 2016 21:11:06 -0700
> > +Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
> > +
> > +musl driver will need to add ssp_nonshared for stack_check_local
> > +on the linker cmdline when using stack protector commands on
> > +compiler cmdline
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++
> > + 1 file changed, 6 insertions(+)
> > +
> > +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> > +index f56eeda3cb5f..9f7b9e8d42a8 100644
> > +--- a/clang/lib/Driver/ToolChains/Gnu.cpp
> > ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> > +@@ -631,6 +631,12 @@ void
> tools::gnutools::Linker::ConstructJob(Compilation &C, const JobAction &JA=
,
> > +       if (IsIAMCU)
> > +         CmdArgs.push_back("-lgloss");
> > +
> > ++      if (ToolChain.getTriple().isMusl() &&
> > ++          (Args.hasArg(options::OPT_fstack_protector) ||
> > ++          Args.hasArg(options::OPT_fstack_protector_strong) ||
> > ++          Args.hasArg(options::OPT_fstack_protector_all))) {
> > ++        CmdArgs.push_back("-lssp_nonshared");
> > ++      }
> > +       if (IsStatic || IsStaticPIE)
> > +         CmdArgs.push_back("--end-group");
> > +       else
> > diff --git
> a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroo=
t.patch
> b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroo=
t.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..12f670034ebb495ac5ca6313e888c75=
26fad56e9
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysroo=
t.patch
> > @@ -0,0 +1,39 @@
> > +From 4b64a243ce69f782964d4841d1079689a62ebdc1 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 16 Mar 2017 09:02:13 -0700
> > +Subject: [PATCH] clang: Prepend trailing '/' to sysroot
> > +
> > +This is needed to handle a case where clang
> > +isntall and target sysroot are perilously same
> > +
> > +e.g.
> > +
> > +sysroot =3D /mnt/clang/recipe-sysroot
> > +clang install =3D /mnt/clang/recipe-sysroot-native
> > +
> > +in this case it will mistakenly assume that
> > +clang is installed under the same sysroot dir
> > +and it will try to add relative ../lib paths
> > +to linker steps which would then be wrong
> > +since they will become relative to clang
> > +installation and not sysroot
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/ToolChains/Linux.cpp | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> > +index e5a696f63fd0..621fa17e0603 100644
> > +--- a/clang/lib/Driver/ToolChains/Linux.cpp
> > ++++ b/clang/lib/Driver/ToolChains/Linux.cpp
> > +@@ -216,7 +216,7 @@ Linux::Linux(const Driver &D, const llvm::Triple
> &Triple, const ArgList &Args)
> > +   Multilibs =3D GCCInstallation.getMultilibs();
> > +   SelectedMultilibs.assign({GCCInstallation.getMultilib()});
> > +   llvm::Triple::ArchType Arch =3D Triple.getArch();
> > +-  std::string SysRoot =3D computeSysRoot();
> > ++  std::string SysRoot =3D computeSysRoot() + "/";
> > +   ToolChain::path_list &PPaths =3D getProgramPaths();
> > +
> > +   Generic_GCC::PushPPaths(PPaths);
> > diff --git
> a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sys=
root-for-compiler-ru.patch
> b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sys=
root-for-compiler-ru.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..5d7a292fcf6967f2a3c770651ae0e17=
87aa2b7a5
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-sys=
root-for-compiler-ru.patch
> > @@ -0,0 +1,41 @@
> > +From edc111019281ed898add2c3f86ebfd54b0fa46d9 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Thu, 16 Mar 2017 19:06:26 -0700
> > +Subject: [PATCH] clang: Look inside the target sysroot for compiler
> runtime
> > +
> > +In OE compiler-rt and libc++ are built and staged into target
> > +sysroot and not into resourcedir which is relative to clang
> > +driver installation where the libraries are not instlled
> > +
> > +Specific to cross compiling the way yocto/OE works
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/ToolChain.cpp | 6 +++++-
> > + 1 file changed, 5 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/clang/lib/Driver/ToolChain.cpp
> b/clang/lib/Driver/ToolChain.cpp
> > +index acf9d264d631..3e46c88e95cb 100644
> > +--- a/clang/lib/Driver/ToolChain.cpp
> > ++++ b/clang/lib/Driver/ToolChain.cpp
> > +@@ -16,6 +16,7 @@
> > + #include "ToolChains/InterfaceStubs.h"
> > + #include "clang/Basic/ObjCRuntime.h"
> > + #include "clang/Basic/Sanitizers.h"
> > ++#include "clang/Basic/Version.h"
> > + #include "clang/Config/config.h"
> > + #include "clang/Driver/Action.h"
> > + #include "clang/Driver/Driver.h"
> > +@@ -708,7 +709,10 @@ StringRef ToolChain::getOSLibName() const {
> > + }
> > +
> > + std::string ToolChain::getCompilerRTPath() const {
> > +-  SmallString<128> Path(getDriver().ResourceDir);
> > ++  SmallString<128> Path(getDriver().SysRoot);
> > ++  StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
> > ++  llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang"=
,
> > ++                            CLANG_VERSION_STRING);
> > +   if (isBareMetal()) {
> > +     llvm::sys::path::append(Path, "lib", getOSLibName());
> > +     if (!SelectedMultilibs.empty()) {
> > diff --git
> a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-insta=
llation-dir.patch
> b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-insta=
llation-dir.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..c4fbaee956a7902dd41b631f3c3bed2=
4c2e21d07
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-insta=
llation-dir.patch
> > @@ -0,0 +1,123 @@
> > +From e79d44241dfd0f4b4ec25547e6a65e61d2a0b4b2 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Sat, 20 Mar 2021 16:09:16 -0700
> > +Subject: [PATCH] clang: Define / releative gcc installation dir
> > +
> > +This is required for OE gcc installation to work.
> > +Without this its not able to find the paths for libgcc
> > +and other standard headers and libraries from gcc
> > +installation in OE
> > +
> > +* Do not use install relative libc++ headers
> > +In OE we use same clang for native and cross builds, therefore we need
> > +to ensure that native sysroot install of libc++ is not searched for
> > +headers when doing cross compile instead it searches the target sysroo=
t
> > +this is especially troublesome when libcxx-native is staged along with
> > +libcxx e.g. chromium
> > +
> > + * Fix lib paths for OpenEmbedded Host
> > +
> > +Under OpenEmbedded Host, while building with clang-native, it cannot
> find
> > +the GCCInstallPath, which causing following error:
> > +[snip]
> > +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> > +-target x86_64-linux
> >
> +-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroo=
t-native/usr/include
> > +-O2 -pipe
> >
> +/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cm=
ake-3.21/Modules/CMakeCCompilerABI.c`
> > +hosttools/ld: cannot find crtbeginS.o: No such file or directory
> > +[snip]
> > +
> > +Before this patch:
> > +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> > +clang version 13.0.1 (https://github.com/llvm/llvm-project
> 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)
> > +Target: x86_64-unknown-linux-gnu
> > +Thread model: posix
> > +InstalledDir:
> /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sy=
sroot-native/usr/bin
> > +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
> > +
> > +After this patch:
> > +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> > +clang version 13.0.1 (https://github.com/llvm/llvm-project
> 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)
> > +Thread model: posix
> > +InstalledDir:
> /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sy=
sroot-native/usr/bin
> > +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
> > +Found candidate GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
> > +Selected GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
> > +Candidate multilib: .;@m64
> > +Selected multilib: .;@m64
> > +
> > +For OpenEmbedded Host, sysroots are of the
> form<sysroot>/usr/lib/<triple>/x.y.z.
> > +Take x86-64 as example, the default triple is x86_64-unknown-linux-gnu=
.
> > +For clang-native, the target vendor is '-unknown', need to test curren=
t
> distro
> > +to follow above form.
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/ToolChains/Gnu.cpp | 22 ++++++++++++++--------
> > + 1 file changed, 14 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> > +index 9f7b9e8d42a8..268fb7bf7167 100644
> > +--- a/clang/lib/Driver/ToolChains/Gnu.cpp
> > ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> > +@@ -19,6 +19,7 @@
> > + #include "Linux.h"
> > + #include "clang/Config/config.h" // for GCC_INSTALL_PREFIX
> > + #include "clang/Driver/Compilation.h"
> > ++#include "clang/Driver/Distro.h"
> > + #include "clang/Driver/Driver.h"
> > + #include "clang/Driver/DriverDiagnostic.h"
> > + #include "clang/Driver/MultilibBuilder.h"
> > +@@ -2860,6 +2861,7 @@ void
> Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
> > +     const llvm::Triple &TargetTriple, const ArgList &Args,
> > +     const std::string &LibDir, StringRef CandidateTriple,
> > +     bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists=
)
> {
> > ++  Distro Distro(D.getVFS(), TargetTriple);
> > +   // Locations relative to the system lib directory where GCC's
> triple-specific
> > +   // directories might reside.
> > +   struct GCCLibSuffix {
> > +@@ -2871,19 +2873,20 @@ void
> Generic_GCC::GCCInstallationDetector::ScanLibDirForGCCTriple(
> > +     // Whether this library suffix is relevant for the triple.
> > +     bool Active;
> > +   } Suffixes[] =3D {
> > +-      // This is the normal place.
> > +-      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
> > +-
> > +-      // Debian puts cross-compilers in gcc-cross.
> > +-      {"gcc-cross/" + CandidateTriple.str(), "../..",
> GCCCrossDirExists},
> > +-
> > +       // The Freescale PPC SDK has the gcc libraries in
> > +       // <sysroot>/usr/lib/<triple>/x.y.z so have a look there as
> well. Only do
> > +       // this on Freescale triples, though, since some systems put a
> *lot* of
> > +       // files in that location, not just GCC installation data.
> > +       {CandidateTriple.str(), "..",
> > +        TargetTriple.getVendor() =3D=3D llvm::Triple::Freescale ||
> > +-           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded=
}};
> > ++           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded=
 ||
> > ++           Distro.IsOpenEmbedded()},
> > ++
> > ++      // This is the normal place.
> > ++      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
> > ++
> > ++      // Debian puts cross-compilers in gcc-cross.
> > ++      {"gcc-cross/" + CandidateTriple.str(), "../..",
> GCCCrossDirExists}};
> > +
> > +   for (auto &Suffix : Suffixes) {
> > +     if (!Suffix.Active)
> > +@@ -3274,8 +3277,11 @@ Generic_GCC::addLibCxxIncludePaths(const
> llvm::opt::ArgList &DriverArgs,
> > +   // incompatible with the NDK libraries.
> > +   SmallString<128> DriverIncludeDir(getDriver().Dir);
> > +   llvm::sys::path::append(DriverIncludeDir, "..", "include");
> > ++
> > ++  // do not add it when --sysroot is specified, since it would expect
> > ++  // libc++ headers from sysroot and not relative to compiler install
> location
> > +   if (AddIncludePath(DriverIncludeDir,
> > +-                     /*TargetDirRequired=3D*/getTriple().isAndroid())=
)
> > ++                     /*TargetDirRequired=3D*/getTriple().isAndroid() =
|
> !computeSysRoot().empty()))
> > +     return;
> > +   // If this is a development, non-installed, clang, libcxx will
> > +   // not be found at ../include/c++ but it likely to be found at
> > diff --git
> a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along=
-with-lunwind-for-st.patch
> b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along=
-with-lunwind-for-st.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..e50e3bf026129aac9604cac380d241c=
ae8053cb2
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-along=
-with-lunwind-for-st.patch
> > @@ -0,0 +1,35 @@
> > +From 42dc7f1fd3e7bc549f87b9c28fb3024a3970e96d Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 31 Jul 2019 22:51:39 -0700
> > +Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for
> static
> > + linking
> > +
> > +When doing static liking with --unwindlib=3Dlibunwind -static we encou=
nter
> > +undefined symbols
> > +libunwind/src/RWMutex.hpp:68: undefined reference to
> `pthread_rwlock_wrlock'
> > +
> > +and
> > +
> > +libunwind/src/AddressSpace.hpp:597: undefined reference to `dladdr'
> > +
> > +therefore we need to link in libpthread and libdl to fill these symbol=
s
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/ToolChains/CommonArgs.cpp | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp
> b/clang/lib/Driver/ToolChains/CommonArgs.cpp
> > +index ae635fb6a180..255e7e0b7150 100644
> > +--- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
> > ++++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
> > +@@ -2254,6 +2254,8 @@ static void AddUnwindLibrary(const ToolChain &TC=
,
> const Driver &D,
> > +         CmdArgs.push_back("-lunwind");
> > +     } else if (LGT =3D=3D LibGccType::StaticLibGcc) {
> > +       CmdArgs.push_back("-l:libunwind.a");
> > ++      CmdArgs.push_back("-lpthread");
> > ++      CmdArgs.push_back("-ldl");
> > +     } else if (LGT =3D=3D LibGccType::SharedLibGcc) {
> > +       if (TC.getTriple().isOSCygMing())
> > +         CmdArgs.push_back("-l:libunwind.dll.a");
> > diff --git
> a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cros=
s-compiling-for-nati.patch
> b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cros=
s-compiling-for-nati.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..0f386cd1a6c5d9633d700a77cb5493d=
337a739d1
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cros=
s-compiling-for-nati.patch
> > @@ -0,0 +1,24 @@
> > +From 0e60706bcddbb9a97ab28df6fba39bf6bd49ab27 Mon Sep 17 00:00:00 2001
> > +From: Anuj Mittal <anuj.mittal@intel.com>
> > +Date: Thu, 26 Dec 2019 12:56:16 -0800
> > +Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for nativ=
e
> build
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + llvm/cmake/modules/CrossCompile.cmake | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/llvm/cmake/modules/CrossCompile.cmake
> b/llvm/cmake/modules/CrossCompile.cmake
> > +index 3b31d3e218a3..a07ab45878fd 100644
> > +--- a/llvm/cmake/modules/CrossCompile.cmake
> > ++++ b/llvm/cmake/modules/CrossCompile.cmake
> > +@@ -100,6 +100,7 @@ function(llvm_create_cross_target project_name
> target_name toolchain buildtype)
> > +
>  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3D"${LLVM_TEMPORARILY_ALLOW_OLD_T=
OOLCHAIN}"
> > +         -DLLVM_INCLUDE_BENCHMARKS=3DOFF
> > +         -DLLVM_INCLUDE_TESTS=3DOFF
> > ++        -DPYTHON_EXECUTABLE=3D"${PYTHON_EXECUTABLE}"
> > +         ${build_type_flags} ${linker_flag} ${external_clang_dir}
> ${libc_flags}
> > +         ${ARGN}
> > +     WORKING_DIRECTORY ${${project_name}_${target_name}_BUILD}
> > diff --git
> a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsi=
cs.patch
> b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsi=
cs.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..3a6713a2deeb5e863d0543649d92c44=
ccf22037d
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrinsi=
cs.patch
> > @@ -0,0 +1,34 @@
> > +From f7ef28286dd0adfd384ef55c9039022b4f92f99c Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Mon, 18 Nov 2019 17:00:29 -0800
> > +Subject: [PATCH] Check for atomic<double> intrinsics
> > +
> > +On some architectures e.g. x86/32bit gcc decides to inline calls to
> > +double atomic variables but clang does not and defers it to libatomic
> > +therefore detect if clang can use built-ins for atomic<double> if not
> > +then link libatomic, this helps building clangd for x86 on linux syste=
ms
> > +with gcc runtime
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + llvm/cmake/modules/CheckAtomic.cmake | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/llvm/cmake/modules/CheckAtomic.cmake
> b/llvm/cmake/modules/CheckAtomic.cmake
> > +index f11cadf39ff6..80a18a92956a 100644
> > +--- a/llvm/cmake/modules/CheckAtomic.cmake
> > ++++ b/llvm/cmake/modules/CheckAtomic.cmake
> > +@@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)
> > + #include <atomic>
> > + #include <cstdint>
> > + std::atomic<uint64_t> x (0);
> > ++std::atomic<double> y (0);
> > + int main() {
> > +   uint64_t i =3D x.load(std::memory_order_relaxed);
> > +   (void)i;
> > +-  return 0;
> > ++  return int(y);
> > + }
> > + " ${varname})
> > +   set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
> > diff --git
> a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-u=
sing-find_package.patch
> b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages=
-using-find_package.patch
> > similarity index 98%
> > rename from
> meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-usi=
ng-find_package.patch
> > rename to
> meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages-u=
sing-find_package.patch
> > index
> 94c056ab8e0abcdf4b96fc3c9bf22842018941e8..033f9e6d7ca2e1b61c223db37d1653a=
4663f3510
> 100644
> > ---
> a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-packages-u=
sing-find_package.patch
> > +++
> b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packages=
-using-find_package.patch
> > @@ -1,4 +1,4 @@
> > -From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 2001
> > +From aae87f7ce9d07ba1c401de8f2981b046321fba3b Mon Sep 17 00:00:00 2001
> > From: Ovidiu Panait <ovidiu.panait@windriver.com>
> > Date: Fri, 31 Jan 2020 10:56:11 +0200
> > Subject: [PATCH] cmake: Fix configure for packages using find_package()
> > diff --git
> a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-=
for-cross-toolchains.patch
> b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-=
for-cross-toolchains.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..479cc01004ed8441bdf235409e6e757=
7b865bce2
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-location-=
for-cross-toolchains.patch
> > @@ -0,0 +1,50 @@
> > +From e374b21872c382d0450a5813184c72fdaabcac11 Mon Sep 17 00:00:00 2001
> > +From: Jim Broadus <jbroadus@xevo.com>
> > +Date: Thu, 26 Mar 2020 16:05:53 -0700
> > +Subject: [PATCH] clang: Fix resource dir location for cross toolchains
> > +
> > +When clang looks for the resources directory, it does so based on the
> binary
> > +location and assumes that the containing directory is a sibling to lib=
.
> The
> > +Yocto cross.bbclass defines the default bindir as
> > +${exec_prefix}/bin/${CROSS_TARGET_SYS_DIR}. ex:
> /usr/bin/aarch64-poky-linux/.
> > +This causes clang to form a path that looks like /usr/bin/lib/clang/..=
.
> > +
> > +As a fix for this, check the parent directory name. If that is "bin",
> then
> > +use that directory's parent.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Jim Broadus <jbroadus@xevo.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/Driver.cpp | 9 ++++++++-
> > + 1 file changed, 8 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
> > +index 87855fdb7997..036c9d09df26 100644
> > +--- a/clang/lib/Driver/Driver.cpp
> > ++++ b/clang/lib/Driver/Driver.cpp
> > +@@ -176,6 +176,7 @@ std::string Driver::GetResourcesPath(StringRef
> BinaryPath) {
> > +
> > +   // Dir is bin/ or lib/, depending on where BinaryPath is.
> > +   StringRef Dir =3D llvm::sys::path::parent_path(BinaryPath);
> > ++  StringRef LastDirName =3D llvm::sys::path::filename(Dir);
> > +   SmallString<128> P(Dir);
> > +
> > +   StringRef ConfiguredResourceDir(CLANG_RESOURCE_DIR);
> > +@@ -187,9 +188,15 @@ std::string Driver::GetResourcesPath(StringRef
> BinaryPath) {
> > +     // With a static-library build of libclang, LibClangPath will
> contain the
> > +     // path of the embedding binary, which for LLVM binaries will be
> in bin/.
> > +     // ../lib gets us to lib/ in both cases.
> > +-    P =3D llvm::sys::path::parent_path(Dir);
> > +     // This search path is also created in the COFF driver of lld, so
> any
> > +     // changes here also needs to happen in lld/COFF/Driver.cpp
> > ++
> > ++    // OE cross toolchains are installed, by default, in a subdir of
> bin.
> > ++    if (LastDirName =3D=3D "bin") {
> > ++      P =3D llvm::sys::path::parent_path(Dir);
> > ++    } else {
> > ++      P =3D
> llvm::sys::path::parent_path(llvm::sys::path::parent_path(Dir));
> > ++    }
> > +     llvm::sys::path::append(P, CLANG_INSTALL_LIBDIR_BASENAME, "clang"=
,
> > +                             CLANG_VERSION_MAJOR_STRING);
> > +   }
> > diff --git
> a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-whe=
n-checking-sysroot-f.patch
> b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-whe=
n-checking-sysroot-f.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..3803603355d808bec4a895bea57eed4=
e6478b87c
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-whe=
n-checking-sysroot-f.patch
> > @@ -0,0 +1,79 @@
> > +From 3acdfa74ce633bfebf1c3982d86b4931b8b606c8 Mon Sep 17 00:00:00 2001
> > +From: Oleksandr Ocheretnyi <oocheret@cisco.com>
> > +Date: Wed, 15 Apr 2020 00:08:39 +0300
> > +Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot
> for ldso
> > + path
> > +
> > + * the dyld-prefix shall be taken into account when the default
> > +   path for the dynamic linker has to be checked.
> > +
> > + * this patch shall be used as annex to the next patch:
> > +   'clang: driver: Check sysroot for ldso path' which includes
> > +   the usrmerge scenario.
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/lib/Driver/ToolChains/Linux.cpp | 20 ++++++++++----------
> > + 1 file changed, 10 insertions(+), 10 deletions(-)
> > +
> > +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> > +index 621fa17e0603..8fd454d4eff4 100644
> > +--- a/clang/lib/Driver/ToolChains/Linux.cpp
> > ++++ b/clang/lib/Driver/ToolChains/Linux.cpp
> > +@@ -525,8 +525,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +
> > +     Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
> > +     LibDir =3D "lib32";
> > +-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > +-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/" + LibDir + "/" + Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/lib/" + Loader)) {
> > +         LibDir =3D "lib";
> > +     }
> > +     break;
> > +@@ -582,8 +582,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +     LibDir =3D "lib64";
> > +     Loader =3D
> > +         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" :
> "ld64.so.1";
> > +-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > +-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/" + LibDir + "/" + Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/lib/" + Loader)) {
> > +         LibDir =3D "lib";
> > +     }
> > +     break;
> > +@@ -591,8 +591,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +     LibDir =3D "lib64";
> > +     Loader =3D
> > +         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" :
> "ld64.so.2";
> > +-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > +-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/" + LibDir + "/" + Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/lib/" + Loader)) {
> > +         LibDir =3D "lib";
> > +     }
> > +     break;
> > +@@ -612,8 +612,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +   case llvm::Triple::sparcv9:
> > +     LibDir =3D "lib64";
> > +     Loader =3D "ld-linux.so.2";
> > +-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > +-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/" + LibDir + "/" + Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/lib/" + Loader)) {
> > +         LibDir =3D "lib";
> > +     }
> > +     break;
> > +@@ -630,8 +630,8 @@ std::string Linux::getDynamicLinker(const ArgList
> &Args) const {
> > +
> > +     LibDir =3D X32 ? "libx32" : "lib64";
> > +     Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
> > +-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" +
> Loader) &&
> > +-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
> > ++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/" + LibDir + "/" + Loader) &&
> > ++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix
> + "/lib/" + Loader)) {
> > +         LibDir =3D "lib";
> > +     }
> > +     break;
> > diff --git
> a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scri=
pts.patch
> b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scri=
pts.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..329cd8b0237816fbe3d7a550c58c377=
2fa9f2fcd
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-scri=
pts.patch
> > @@ -0,0 +1,35 @@
> > +From 02ce42db3325d5fab553627dfc73750270c0b665 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Wed, 14 Oct 2020 22:19:57 -0700
> > +Subject: [PATCH] clang: Use python3 in python scripts
> > +
> > +Some scripts ask for python, but they work fine with python3
> > +and in OE python symlink is not exposed to build, only python3 is
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + .../find-all-symbols/tool/run-find-all-symbols.py               | 2 +=
-
> > + clang/tools/scan-view/bin/scan-view                             | 2 +=
-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git
> a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
> b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
> > +index 471dbf8c110b..f98385dc6651 100755
> > +---
> a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
> > ++++
> b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find-al=
l-symbols.py
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > + #
> > + # =3D- run-find-all-symbols.py - Parallel find-all-symbols runner -*-
> python  -*-=3D#
> > + #
> > +diff --git a/clang/tools/scan-view/bin/scan-view
> b/clang/tools/scan-view/bin/scan-view
> > +index d01aebb4029a..f3375804654d 100755
> > +--- a/clang/tools/scan-view/bin/scan-view
> > ++++ b/clang/tools/scan-view/bin/scan-view
> > +@@ -1,4 +1,4 @@
> > +-#!/usr/bin/env python
> > ++#!/usr/bin/env python3
> > +
> > + from __future__ import print_function
> > +
> > diff --git
> a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> > new file mode 100644
> > index
> 0000000000000000000000000000000000000000..bf46b22f361def855b1a402d3970dbe=
a577fad1b
> > --- /dev/null
> > +++
> b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-for-add=
ing-OE-distro-vendor.patch
> > @@ -0,0 +1,167 @@
> > +From aec307904022e138d1004ceb44b9600deaa7fbdb Mon Sep 17 00:00:00 2001
> > +From: Hongxu Jia <hongxu.jia@windriver.com>
> > +Date: Mon, 25 Jan 2021 16:14:35 +0800
> > +Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendor
> names
> > +
> > +This helps in making right detection for OE built gcc toolchains
> > +
> > +The //CLANG_EXTRA_OE_VENDORS_CASES string is replaced with list of
> > +additional Ceses based on CLANG_EXTRA_OE_VENDORS variable in
> > +recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
> > +
> > +* For x86_64, set Yocto based GCC install search path
> > +
> > +Under Yocto host, while using clang-native to build, it searches
> > +install host gcc failed which causing the include file not found
> > +[snip]
> > +|clang++ -target x86_64-linux  -MMD -MF
> src/base/files/file_path_constants.o.d -I../../../tools/gn/src -I. \
> >
> +-isystem/tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/recipe-s=
ysroot-native/usr/include
> -O2 -pipe \
> > +-std=3Dc++17 -c ../../../tools/gn/src/base/files/file_path_constants.c=
c
> -o src/base/files/file_path_constants.o
> > +|../../../tools/gn/src/base/files/file_path_constants.cc:7:10: fatal
> error: 'iterator' file not found
> > +|#include <iterator>
> > +|         ^~~~~~~~
> > +[snip]
> > +
> > +* Set three Yocto based GCC triple: poky, oe-core and wind river
> > +
> > +Before aplly the patch
> > +[snip]
> > +$ ../recipe-sysroot-native/usr/bin/clang++ -v
> > +clang version 11.0.1 (https://github.com/llvm/llvm-project
> 43ff75f2c3feef64f9d73328230d34dac8832a91)
> > +Target: x86_64-unknown-linux-gnu
> > +Thread model: posix
> >
> +InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chro=
mium-87.0.4280.141/../recipe-sysroot-native/usr/bin
> > +[snip]
> > +
> > +After this patch:
> > +[snip]
> > +$ ../recipe-sysroot-native/usr/bin/clang++ -v
> > +clang version 11.0.1 (https://github.com/llvm/llvm-project
> 22c3241ff9a6224261df48d0258957fd8acc3d64)
> > +Target: x86_64-unknown-linux-gnu
> > +Thread model: posix
> >
> +InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chro=
mium-87.0.4280.141/../recipe-sysroot-native/usr/bin
> > +Found candidate GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
> > +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.1.0
> > +Selected GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
> > +Candidate multilib: .;@m64
> > +Selected multilib: .;@m64
> > +[snip]
> > +
> > +BTW, it is hardly to insert a triple by the replacement of TARGET_SYS
> > +(=3D${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}), since TARGET_VENDOR
> > +is different between clang and clang-native
> > +
> > +* The //CLANG_EXTRA_OE_VENDORS_TRIPLES string is replaced with list of
> > +additional triples based on CLANG_EXTRA_OE_VENDORS variable in
> > +recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
> > +
> > +* Correct library search path for OpenEmbedded Host
> > +
> > +For OpenEmbedded Host, the gcc install path is
> > +/usr/lib/x86_64-[distroname]-linux/[gcc-version].
> > +So the library search path is not found with default triple
> > +'x86_64-linux-gnu' for x86_64. Causing following error:
> > +[snip]
> > +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
> > +-target x86_64-linux
> >
> +-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroo=
t-native/usr/include
> > +-O2 -pipe
> >
> +/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cm=
ake-3.21/Modules/CMakeCCompilerABI.c`
> > +|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
> > +|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
> > +|     clang-13: error: linker command failed with exit code 1 (use -v
> to see invocation)
> > +[snip]
> > +
> > +before this patch:
> > +b59da142f2b0:$
> /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/=
usr/bin/clang
> --print-search-dirs
> > +programs:
> =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe=
-sysroot-native/usr/bin
> > +libraries:
> =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe=
-sysroot-native/usr/lib/clang/13.0.1:/build/tmp-glibc/work/x86_64-linux/com=
piler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://lib://usr/=
lib
> > +
> > +after this patch:
> > +b59da142f2b0:$
> /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/=
usr/bin/clang
> --print-search-dirs
> > +programs:
> =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe=
-sysroot-native/usr/bin
> > +libraries:
> =3D/build/tmp-glibc/work/x84_64-linux/compiler-rt-native/13.0.1-r0/recipe=
-sysroot-native/usr/lib/clang/13.0.1:/usr/lib/x86_64-wrs-linux/10.2.0://lib=
/x86_64-wrs-linux://usr/lib/x86_64-wrs-linux:/build/tmp-glibc/work/x86_64-l=
inux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://li=
b://usr/lib
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + clang/include/clang/Driver/Distro.h   | 2 ++
> > + clang/lib/Driver/Distro.cpp           | 1 +
> > + clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
> > + clang/lib/Driver/ToolChains/Linux.cpp | 1 +
> > + llvm/lib/TargetParser/Triple.cpp      | 2 +-
> > + 5 files changed, 6 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/clang/include/clang/Driver/Distro.h
> b/clang/include/clang/Driver/Distro.h
> > +index b4d485dac8a2..ac0bf25b7c63 100644
> > +--- a/clang/include/clang/Driver/Distro.h
> > ++++ b/clang/include/clang/Driver/Distro.h
> > +@@ -45,6 +45,7 @@ public:
> > +     RHEL7,
> > +     Fedora,
> > +     Gentoo,
> > ++    //CLANG_EXTRA_OE_DISTRO_NAME
> > +     OpenSUSE,
> > +     UbuntuHardy,
> > +     UbuntuIntrepid,
> > +@@ -139,6 +140,7 @@ public:
> > +
> > +   bool IsGentoo() const { return DistroVal =3D=3D Gentoo; }
> > +
> > ++  //CLANG_EXTRA_OE_DISTRO_CHECK
> > +   /// @}
> > + };
> > +
> > +diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
> > +index 3cc79535de8d..595656179bdc 100644
> > +--- a/clang/lib/Driver/Distro.cpp
> > ++++ b/clang/lib/Driver/Distro.cpp
> > +@@ -43,6 +43,7 @@ static Distro::DistroType
> DetectOsRelease(llvm::vfs::FileSystem &VFS) {
> > +                     .Case("sles", Distro::OpenSUSE)
> > +                     .Case("opensuse", Distro::OpenSUSE)
> > +                     .Case("exherbo", Distro::Exherbo)
> > ++                    //CLANG_EXTRA_OE_DISTRO_CASE
> > +                     .Default(Distro::UnknownDistro);
> > +   return Version;
> > + }
> > +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp
> b/clang/lib/Driver/ToolChains/Gnu.cpp
> > +index 268fb7bf7167..868d32f501e8 100644
> > +--- a/clang/lib/Driver/ToolChains/Gnu.cpp
> > ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
> > +@@ -2452,6 +2452,7 @@ void
> Generic_GCC::GCCInstallationDetector::AddDefaultGCCPrefixes(
> > +       "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
> > +       "x86_64-redhat-linux",    "x86_64-suse-linux",
> > +       "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
> > ++      "x86_64-oe-linux",//CLANG_EXTRA_OE_VENDORS_TRIPLES
> > +       "x86_64-unknown-linux",   "x86_64-amazon-linux"};
> > +   static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
> > +                                            "x86_64-pc-linux-gnux32"};
> > +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp
> b/clang/lib/Driver/ToolChains/Linux.cpp
> > +index 8fd454d4eff4..fb9d433a80be 100644
> > +--- a/clang/lib/Driver/ToolChains/Linux.cpp
>

--000000000000522bf40634132488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Thu, May 1, 2025 at 6:12=E2=80=AFAM =
Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">These recipes still =
set TOOLCHAIN, should these be left in bbappends in meta-clang for now?</bl=
ockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I thought about it b=
ut I kept it because with this set I can completely delete the recipes from=
 meta-clang it will be simpler to maintain secondly we are already setting =
it for other recipes in core=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=
=3D"auto"><br>
<br>
Ross<br>
<br>
&gt; On 27 Apr 2025, at 04:16, Khem Raj via <a href=3D"http://lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> =
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; This can ensure that meta-clang does not carry them and can rely on co=
re layer<br>
&gt; while mesa can use them too.<br>
&gt; <br>
&gt; Fix llvm-config.h to be multilib safe<br>
&gt; <br>
&gt; Omit time stamps in openmp from generated files to improve<br>
&gt; reproducibility<br>
&gt; <br>
&gt; fix the issue that:<br>
&gt; | file /usr/include/llvm/Config/llvm-config.h conflicts between attemp=
ted installs of lib32-llvm-dev-20.1.2-r0.core2_32 and llvm-dev-20.1.2-r0.co=
re2_64<br>
&gt; <br>
&gt; Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com=
" target=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
&gt; Signed-off-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov=
@oss.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&=
gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; .../clang/<a href=3D"http://clang-cross-canadian_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">clang-cross-canadian_git.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 ++<br>
&gt; meta/recipes-devtools/clang/<a href=3D"http://clang-cross_git.bb" rel=
=3D"noreferrer" target=3D"_blank">clang-cross_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 39 ++<br>
&gt; meta/recipes-devtools/clang/<a href=3D"http://clang-crosssdk_git.bb" r=
el=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb</a>=C2=A0 |=C2=A0=
 33 ++<br>
&gt; ...ind-libunwind-headers-when-LIBCXXABI_LIBU.patch |=C2=A0 60 +++<br>
&gt; ...er-rt-support-a-new-embedded-linux-target.patch | 309 +++++++++++++=
<br>
&gt; ...-Simplify-cross-compilation.-Don-t-use-na.patch |=C2=A0 44 ++<br>
&gt; ...LibraryInfo-Undefine-libc-functions-if-th.patch |=C2=A0 90 ++++<br>
&gt; ...allow-env-override-of-exe-and-libdir-path.patch |=C2=A0 71 +++<br>
&gt; ...-clang-driver-Check-sysroot-for-ldso-path.patch |=C2=A0 78 ++++<br>
&gt; ...iver-tools.cpp-Add-lssp_nonshared-on-musl.patch |=C2=A0 32 ++<br>
&gt; .../0008-clang-Prepend-trailing-to-sysroot.patch=C2=A0 =C2=A0|=C2=A0 3=
9 ++<br>
&gt; ...inside-the-target-sysroot-for-compiler-ru.patch |=C2=A0 41 ++<br>
&gt; ...ang-Define-releative-gcc-installation-dir.patch | 123 +++++<br>
&gt; ...pthread-and-ldl-along-with-lunwind-for-st.patch |=C2=A0 35 ++<br>
&gt; ..._EXECUTABLE-when-cross-compiling-for-nati.patch |=C2=A0 24 +<br>
&gt; .../0013-Check-for-atomic-double-intrinsics.patch=C2=A0 |=C2=A0 34 ++<=
br>
&gt; ...configure-for-packages-using-find_package.patch |=C2=A0 =C2=A02 +-<=
br>
&gt; ...esource-dir-location-for-cross-toolchains.patch |=C2=A0 50 +++<br>
&gt; ...r-Add-dyld-prefix-when-checking-sysroot-f.patch |=C2=A0 79 ++++<br>
&gt; .../0017-clang-Use-python3-in-python-scripts.patch |=C2=A0 35 ++<br>
&gt; ...Insert-anchor-for-adding-OE-distro-vendor.patch | 167 +++++++<br>
&gt; ...-Do-not-use-backtrace-APIs-on-non-glibc-l.patch |=C2=A0 68 +++<br>
&gt; ...86-triple-for-non-debian-multiarch-linux-.patch |=C2=A0 28 ++<br>
&gt; ...0021-libunwind-Added-unw_backtrace-method.patch |=C2=A0 56 +++<br>
&gt; .../0022-lldb-Link-with-libatomic-on-x86.patch=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 33 ++<br>
&gt; ...023-compiler-rt-Enable-__int128-for-ppc32.patch |=C2=A0 73 +++<br>
&gt; ...-Do-not-use-cmake-infra-to-detect-libzstd.patch |=C2=A0 62 +++<br>
&gt; ...ler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch |=C2=A0 46 ++<br>
&gt; ...-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch |=C2=A0 43 ++<br>
&gt; ...s-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch |=C2=A0 81 ++++<br>
&gt; ...vm-Add-OE-specific-ABI-triple-for-N32-ABI.patch |=C2=A0 78 ++++<br>
&gt; ...d-libunwind.pc.in-and-llvm-config-scripts.patch |=C2=A0 90 ++++<br>
&gt; ...py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch |=C2=A0 92 ++++<br>
&gt; ...r-rt-Do-not-pass-target-to-clang-compiler.patch |=C2=A0 29 ++<br>
&gt; .../clang/clang/0032-Fix-build-on-ppc64-musl.patch |=C2=A0 97 ++++<br>
&gt; ...d-a-build-option-to-disable-building-dexp.patch |=C2=A0 85 ++++<br>
&gt; ...itter-sort-ClassInfo-lists-by-name-as-we.patch} |=C2=A0 =C2=A04 +-<=
br>
&gt; ...-remove-LLVM_LDFLAGS-from-ldflags-output.patch} |=C2=A0 12 +-<br>
&gt; ...ot-emit-date-and-time-into-generate-files.patch |=C2=A0 37 ++<br>
&gt; .../clang}/spirv-internal-build.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
&gt; .../clang}/spirv-shared-library.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A00<br>
&gt; meta/recipes-devtools/clang/<a href=3D"http://clang_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">clang_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 496 +++++++++++++++++++++<br>
&gt; meta/recipes-devtools/clang/common-clang.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 24 +<br>
&gt; meta/recipes-devtools/clang/common-source.inc=C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 17 +<br>
&gt; meta/recipes-devtools/clang/common.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 83 ++++<br>
&gt; .../clang/<a href=3D"http://compiler-rt-sanitizers_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">compiler-rt-sanitizers_git.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 139 ++++++<br>
&gt; meta/recipes-devtools/clang/<a href=3D"http://compiler-rt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">compiler-rt_git.bb</a>=C2=A0 =C2=A0 =C2=
=A0| 125 ++++++<br>
&gt; meta/recipes-devtools/clang/<a href=3D"http://libcxx_git.bb" rel=3D"no=
referrer" target=3D"_blank">libcxx_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 119 +++++<br>
&gt; meta/recipes-devtools/clang/<a href=3D"http://llvm-project-source.bb" =
rel=3D"noreferrer" target=3D"_blank">llvm-project-source.bb</a> |=C2=A0 12 =
+<br>
&gt; .../recipes-devtools/clang/llvm-project-source.inc |=C2=A0 99 ++++<br>
&gt; .../recipes-devtools/clang/<a href=3D"http://nativesdk-clang-glue.bb" =
rel=3D"noreferrer" target=3D"_blank">nativesdk-clang-glue.bb</a> |=C2=A0 36=
 ++<br>
&gt; meta/recipes-devtools/clang/<a href=3D"http://openmp_git.bb" rel=3D"no=
referrer" target=3D"_blank">openmp_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 67 +++<br>
&gt; .../0007-llvm-allow-env-override-of-exe-path.patch |=C2=A0 36 --<br>
&gt; meta/recipes-devtools/llvm/llvm/llvm-config=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 54 ---<br>
&gt; meta/recipes-devtools/llvm/<a href=3D"http://llvm_20.1.2.bb" rel=3D"no=
referrer" target=3D"_blank">llvm_20.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 233 ----------<br>
&gt; 55 files changed, 3642 insertions(+), 333 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang-cross=
-canadian_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross-canadian=
_git.bb</a> b/meta/recipes-devtools/clang/<a href=3D"http://clang-cross-can=
adian_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross-canadian_git=
.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..456c0d61bc560ee131e06f=
d37eb434ab366b1861<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://clang-cross-canadi=
an_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross-canadian_git.bb=
</a><br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +# Copyright (C) 2014 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +# Released under the MIT license (see COPYING.MIT for the terms)<br>
&gt; +<br>
&gt; +SUMMARY =3D &quot;Clang/LLVM based C/C++ compiler (cross-canadian for=
 ${TARGET_ARCH} target)&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://clang.llvm.org/" rel=3D"noreferr=
er" target=3D"_blank">http://clang.llvm.org/</a>&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0-wi=
th-LLVM-exception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab&quot;<br>
&gt; +SECTION =3D &quot;devel&quot;<br>
&gt; +<br>
&gt; +PN =3D &quot;clang-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot;<br>
&gt; +<br>
&gt; +require common-clang.inc<br>
&gt; +require common-source.inc<br>
&gt; +inherit cross-canadian<br>
&gt; +<br>
&gt; +DEPENDS +=3D &quot;nativesdk-clang binutils-cross-canadian-${TRANSLAT=
ED_TARGET_ARCH} virtual/nativesdk-cross-binutils virtual/nativesdk-libc&quo=
t;<br>
&gt; +# We have to point gcc at a sysroot but we don&#39;t need to rebuild =
if this changes<br>
&gt; +# e.g. we switch between different machines with different tunes.<br>
&gt; +EXTRA_OECONF_PATHS[vardepsexclude] =3D &quot;TUNE_PKGARCH&quot;<br>
&gt; +TARGET_ARCH[vardepsexclude] =3D &quot;TUNE_ARCH&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; + install -d ${D}${bindir}<br>
&gt; + for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \<br>
&gt; + llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-obj=
dump llvm-readelf \<br>
&gt; + llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov<br>
&gt; + do<br>
&gt; + ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool<br>
&gt; + done<br>
&gt; +}<br>
&gt; +SSTATE_SCAN_FILES +=3D &quot;*-clang *-clang++ *-llvm-profdata *-llvm=
-ar \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-ranlib *-llvm-nm *-lld *-ld.lld *-llvm-as *-llvm-strip \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov&quot;<br>
&gt; +do_install:append() {<br>
&gt; + cross_canadian_bindirlinks<br>
&gt; +}<br>
&gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang-cross=
_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-cross_git.bb</a> b/meta=
/recipes-devtools/clang/<a href=3D"http://clang-cross_git.bb" rel=3D"norefe=
rrer" target=3D"_blank">clang-cross_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..9b9b120a3d793f6dd989b5=
66b3736934f1c0ff8d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://clang-cross_git.bb=
" rel=3D"noreferrer" target=3D"_blank">clang-cross_git.bb</a><br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +# Copyright (C) 2014 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +# Released under the MIT license (see COPYING.MIT for the terms)<br>
&gt; +<br>
&gt; +SUMMARY =3D &quot;Cross compiler wrappers for LLVM based C/C++ compil=
er&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://clang.llvm.org/" rel=3D"noreferr=
er" target=3D"_blank">http://clang.llvm.org/</a>&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0-wi=
th-LLVM-exception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab&quot;<br>
&gt; +SECTION =3D &quot;devel&quot;<br>
&gt; +<br>
&gt; +PN =3D &quot;clang-cross-${TARGET_ARCH}&quot;<br>
&gt; +<br>
&gt; +require common-clang.inc<br>
&gt; +require common-source.inc<br>
&gt; +inherit cross<br>
&gt; +DEPENDS +=3D &quot;clang-native virtual/cross-binutils&quot;<br>
&gt; +<br>
&gt; +#INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
&gt; +INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; + for tool in clang-tidy lld ld.lld llvm-profdata \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 llvm-nm llvm-ar llvm-as llv=
m-ranlib llvm-strip llvm-objcopy llvm-objdump llvm-readelf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 llvm-addr2line llvm-dwp llv=
m-size llvm-strings llvm-cov<br>
&gt; + do<br>
&gt; + ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool<br>
&gt; + done<br>
&gt; + install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGE=
T_PREFIX}clang<br>
&gt; + install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGE=
T_PREFIX}clang++<br>
&gt; +}<br>
&gt; +SSTATE_SCAN_FILES +=3D &quot;*-clang *-clang++ *-llvm-profdata *-lld =
*-ld.lld \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-strip \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov&quot;<br>
&gt; +<br>
&gt; +SYSROOT_PREPROCESS_FUNCS +=3D &quot;clangcross_sysroot_preprocess&quo=
t;<br>
&gt; +<br>
&gt; +clangcross_sysroot_preprocess () {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysroot_stage_dir ${D}${bindir} ${SYSROOT=
_DESTDIR}${bindir}<br>
&gt; +}<br>
&gt; +PACKAGES =3D &quot;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/clang/<a href=3D"http://clang-cross=
sdk_git.bb" rel=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb</a> =
b/meta/recipes-devtools/clang/<a href=3D"http://clang-crosssdk_git.bb" rel=
=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..47ac96f4f93688b216adc9=
5f4473b8c2dc3ec98b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/<a href=3D"http://clang-crosssdk_git=
.bb" rel=3D"noreferrer" target=3D"_blank">clang-crosssdk_git.bb</a><br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +# Copyright (C) 2014 Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.co=
m" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +# Released under the MIT license (see COPYING.MIT for the terms)<br>
&gt; +<br>
&gt; +SUMMARY =3D &quot;SDK Cross compiler wrappers for LLVM based C/C++ co=
mpiler&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://clang.llvm.org/" rel=3D"noreferr=
er" target=3D"_blank">http://clang.llvm.org/</a>&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/Apache-2.0-wi=
th-LLVM-exception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab&quot;<br>
&gt; +SECTION =3D &quot;devel&quot;<br>
&gt; +<br>
&gt; +PN =3D &quot;clang-crosssdk-${SDK_SYS}&quot;<br>
&gt; +<br>
&gt; +require common-clang.inc<br>
&gt; +require common-source.inc<br>
&gt; +inherit crosssdk<br>
&gt; +DEPENDS +=3D &quot;clang-native nativesdk-clang-glue virtual/nativesd=
k-cross-binutils virtual/nativesdk-libc&quot;<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; +=C2=A0 =C2=A0 install -d ${D}${bindir}<br>
&gt; + for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \<br>
&gt; + llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy llvm-obj=
dump llvm-readelf \<br>
&gt; + llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov<br>
&gt; + do<br>
&gt; + ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool<br>
&gt; + done<br>
&gt; +}<br>
&gt; +SSTATE_SCAN_FILES +=3D &quot;*-clang *-clang++ *-llvm-profdata *-lld =
*-ld.lld \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-strip \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-addr2line \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov&quot;<br>
&gt; +sysroot_stage_all () {<br>
&gt; + sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}<br>
&gt; +}<br>
&gt; +<br>
&gt; +PACKAGES =3D &quot;&quot;<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-lib=
unwind-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clan=
g/0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..21b033b498e5d66322493b=
84da6814d5712c0a8a<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-=
headers-when-LIBCXXABI_LIBU.patch<br>
&gt; @@ -0,0 +1,60 @@<br>
&gt; +From ec9babfa91931042e7aa771915e2f1d4dc8d15e0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 27 Aug 2017 10:37:49 -0700<br>
&gt; +Subject: [PATCH] libcxxabi: Find libunwind headers when<br>
&gt; + LIBCXXABI_LIBUNWIND_INCLUDES is set<br>
&gt; +<br>
&gt; +Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake argumen=
ts<br>
&gt; +then it ends up not searching the specified dir and unwind.h is not f=
ound<br>
&gt; +especially for ARM targets<br>
&gt; +<br>
&gt; +This patch makes the searching synthesized directories and then set<b=
r>
&gt; +LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + libcxxabi/CMakeLists.txt | 15 ++++++++++-----<br>
&gt; + 1 file changed, 10 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt<br>
&gt; +index 6dcfc51e5532..32478a62a058 100644<br>
&gt; +--- a/libcxxabi/CMakeLists.txt<br>
&gt; ++++ b/libcxxabi/CMakeLists.txt<br>
&gt; +@@ -465,7 +465,7 @@ set(LIBCXXABI_LIBUNWIND_PATH &quot;${LIBCXXABI_LI=
BUNWIND_PATH}&quot; CACHE PATH<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&quot;Specify path to libunwind source.&quot; FOR=
CE)<br>
&gt; + <br>
&gt; + if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)<br>
&gt; +-=C2=A0 find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h<b=
r>
&gt; ++=C2=A0 find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${LIBCXXABI_LIBUNWIND_PATH}/=
include<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${CMAKE_BINARY_DIR}/${LIBCXX=
ABI_LIBUNWIND_INCLUDES}<br>
&gt; +@@ -476,18 +476,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_=
ARCH MATCHES ARM)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NO_CMAKE_FIND_ROOT_PATH<br>
&gt; +=C2=A0 =C2=A0)<br>
&gt; + <br>
&gt; +-=C2=A0 if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL &quot;LIBC=
XXABI_LIBUNWIND_INCLUDES_INTERNAL-NOTFOUND&quot;)<br>
&gt; +-=C2=A0 =C2=A0 set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL &quot;&quot;=
)<br>
&gt; ++=C2=A0 if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL &quot;LIBCXXABI_LIB=
UNWIND_INCLUDES-NOTFOUND&quot;)<br>
&gt; ++=C2=A0 =C2=A0 set(LIBCXXABI_LIBUNWIND_INCLUDES &quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0endif()<br>
&gt; + endif()<br>
&gt; + <br>
&gt; +-if (NOT &quot;${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}&quot; STREQUA=
L &quot;&quot;)<br>
&gt; +-=C2=A0 include_directories(&quot;${LIBCXXABI_LIBUNWIND_INCLUDES_INTE=
RNAL}&quot;)<br>
&gt; ++if (NOT &quot;${LIBCXXABI_LIBUNWIND_INCLUDES}&quot; STREQUAL &quot;&=
quot;)<br>
&gt; ++=C2=A0 include_directories(&quot;${LIBCXXABI_LIBUNWIND_INCLUDES}&quo=
t;)<br>
&gt; + endif()<br>
&gt; + <br>
&gt; + add_custom_target(cxxabi-test-depends<br>
&gt; +=C2=A0 =C2=A0COMMENT &quot;Build dependencies required to run the lib=
c++abi test suite.&quot;)<br>
&gt; + <br>
&gt; ++set(LIBCXXABI_LIBUNWIND_INCLUDES &quot;${LIBCXXABI_LIBUNWIND_INCLUDE=
S}&quot; CACHE PATH<br>
&gt; ++=C2=A0 =C2=A0 &quot;Specify path to libunwind includes.&quot; FORCE)=
<br>
&gt; ++set(LIBCXXABI_LIBUNWIND_PATH &quot;${LIBCXXABI_LIBUNWIND_PATH}&quot;=
 CACHE PATH<br>
&gt; ++=C2=A0 =C2=A0 &quot;Specify path to libunwind source.&quot; FORCE)<b=
r>
&gt; ++<br>
&gt; + # Add source code. This also contains all of the logic for deciding =
linker flags<br>
&gt; + # soname, etc...<br>
&gt; + add_subdirectory(include)<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-suppor=
t-a-new-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/000=
2-compiler-rt-support-a-new-embedded-linux-target.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..88cef402daad0b0470f805=
7e55b2a71558c428d2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new=
-embedded-linux-target.patch<br>
&gt; @@ -0,0 +1,309 @@<br>
&gt; +From 8cdfcfb9102c4008758bb844856e553d4fe4ae79 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Sun, 19 Apr 2015 15:16:23 -0700<br>
&gt; +Subject: [PATCH] compiler-rt: support a new embedded linux target<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../make/platform/<a href=3D"http://clang_linux_embedded.mk" rel=3D"=
noreferrer" target=3D"_blank">clang_linux_embedded.mk</a>=C2=A0 =C2=A0 =C2=
=A0| 286 ++++++++++++++++++<br>
&gt; + .../clang_linux_embedded_test_input.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A00<br>
&gt; + 2 files changed, 286 insertions(+)<br>
&gt; + create mode 100644 compiler-rt/make/platform/<a href=3D"http://clang=
_linux_embedded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedd=
ed.mk</a><br>
&gt; + create mode 100644 compiler-rt/make/platform/clang_linux_embedded_te=
st_input.c<br>
&gt; +<br>
&gt; +diff --git a/compiler-rt/make/platform/<a href=3D"http://clang_linux_=
embedded.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</=
a> b/compiler-rt/make/platform/<a href=3D"http://clang_linux_embedded.mk" r=
el=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a><br>
&gt; +new file mode 100644<br>
&gt; +index 000000000000..d0a890075a1c<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/compiler-rt/make/platform/<a href=3D"http://clang_linux_embedde=
d.mk" rel=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a><br>
&gt; +@@ -0,0 +1,286 @@<br>
&gt; ++# These are the functions which clang needs when it is targeting a p=
revious<br>
&gt; ++# version of the OS. The issue is that the backend may use functions=
 which were<br>
&gt; ++# not present in the libgcc that shipped on the platform. In such ca=
ses, we link<br>
&gt; ++# with a version of the library which contains private_extern defini=
tions of all<br>
&gt; ++# the extra functions which might be referenced.<br>
&gt; ++<br>
&gt; ++Description :=3D Static runtime libraries for embedded clang/Linux<b=
r>
&gt; ++<br>
&gt; ++# A function that ensures we don&#39;t try to build for architecture=
s that we<br>
&gt; ++# don&#39;t have working toolchains for.<br>
&gt; ++CheckArches =3D \<br>
&gt; ++=C2=A0 $(shell \<br>
&gt; ++=C2=A0 =C2=A0 result=3D&quot;&quot;; \<br>
&gt; ++=C2=A0 =C2=A0 for arch in $(1); do \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if $(CC) -arch $$arch -c \<br>
&gt; ++=C2=A0 -integrated-as \<br>
&gt; ++=C2=A0 $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.=
c \<br>
&gt; ++=C2=A0 -o /dev/null &gt; /dev/null 2&gt; /dev/null; then \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 result=3D&quot;$$result$$arch &quot;; \<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 else \<br>
&gt; ++ printf 1&gt;&amp;2 \<br>
&gt; ++=C2=A0 &quot;warning: <a href=3D"http://clang_linux_embedded.mk" rel=
=3D"noreferrer" target=3D"_blank">clang_linux_embedded.mk</a>: dropping arc=
h &#39;$$arch&#39; from lib &#39;$(2)&#39;\n&quot;; \<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 fi; \<br>
&gt; ++=C2=A0 =C2=A0 done; \<br>
&gt; ++=C2=A0 =C2=A0 echo $$result)<br>
&gt; ++<br>
&gt; ++XCRun =3D \<br>
&gt; ++=C2=A0 $(shell \<br>
&gt; ++=C2=A0 =C2=A0 result=3D`xcrun -find $(1) 2&gt; /dev/null`; \<br>
&gt; ++=C2=A0 =C2=A0 if [ &quot;$$?&quot; !=3D &quot;0&quot; ]; then result=
=3D$(1); fi; \<br>
&gt; ++=C2=A0 =C2=A0 echo $$result)<br>
&gt; ++<br>
&gt; ++###<br>
&gt; ++<br>
&gt; ++CC=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,clang)<br>
&gt; ++AR=C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,ar)<br>
&gt; ++RANLIB=C2=A0 =C2=A0:=3D $(call XCRun,ranlib)<br>
&gt; ++STRIP=C2=A0 =C2=A0 :=3D $(call XCRun,strip)<br>
&gt; ++LIPO=C2=A0 =C2=A0 =C2=A0:=3D $(call XCRun,lipo)<br>
&gt; ++DSYMUTIL :=3D $(call XCRun,dsymutil)<br>
&gt; ++Configs :=3D<br>
&gt; ++UniversalArchs :=3D<br>
&gt; ++<br>
&gt; ++# Soft-float version of the runtime. No floating-point instructions =
will be used<br>
&gt; ++# and the ABI (out of necessity) passes floating values in normal re=
gisters:<br>
&gt; ++# non-VFP variant of the AAPCS.<br>
&gt; ++UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7e=
m armv7,soft_static)<br>
&gt; ++Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)<br>
&gt; ++<br>
&gt; ++# Hard-float version of the runtime. On ARM VFP instructions and reg=
isters are<br>
&gt; ++# allowed, and floating point values get passed in them. VFP variant=
 of the<br>
&gt; ++# AAPCS.<br>
&gt; ++UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i38=
6 x86_64,hard_static)<br>
&gt; ++Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)<br>
&gt; ++<br>
&gt; ++UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7e=
m armv7,soft_pic)<br>
&gt; ++Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)<br>
&gt; ++<br>
&gt; ++UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386 x=
86_64,hard_pic)<br>
&gt; ++Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)<br>
&gt; ++<br>
&gt; ++CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding<br=
>
&gt; ++<br>
&gt; ++PIC_CFLAGS :=3D -fPIC<br>
&gt; ++STATIC_CFLAGS :=3D -static<br>
&gt; ++<br>
&gt; ++CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft<br>
&gt; ++CFLAGS_HARD :=3D -mfloat-abi=3Dhard<br>
&gt; ++<br>
&gt; ++CFLAGS_I386=C2=A0 :=3D -march=3Dpentium<br>
&gt; ++<br>
&gt; ++CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)<br=
>
&gt; ++CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)<br=
>
&gt; ++CFLAGS.soft_pic=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_S=
OFT)<br>
&gt; ++CFLAGS.hard_pic=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_H=
ARD)<br>
&gt; ++<br>
&gt; ++CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)<=
br>
&gt; ++CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)<=
br>
&gt; ++CFLAGS.soft_pic.armv7=C2=A0 =C2=A0 :=3D $(CFLAGS.soft_pic) $(CFLAGS_=
ARMV7)<br>
&gt; ++CFLAGS.hard_pic.armv7=C2=A0 =C2=A0 :=3D $(CFLAGS.hard_pic) $(CFLAGS_=
ARMV7)<br>
&gt; ++<br>
&gt; ++# x86 platforms ignore -mfloat-abi options and complain about doing =
so. Despite<br>
&gt; ++# this they&#39;re hard-float.<br>
&gt; ++CFLAGS.hard_static.i386=C2=A0 =C2=A0:=3D $(CFLAGS) $(STATIC_CFLAGS) =
$(CFLAGS_I386)<br>
&gt; ++CFLAGS.hard_pic.i386=C2=A0 =C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS=
) $(CFLAGS_I386)<br>
&gt; ++CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)<br>
&gt; ++CFLAGS.hard_pic.x86_64=C2=A0 =C2=A0 :=3D $(CFLAGS) $(PIC_CFLAGS)<br>
&gt; ++<br>
&gt; ++# Functions not wanted:<br>
&gt; ++#=C2=A0 =C2=A0+ eprintf is obsolete anyway<br>
&gt; ++#=C2=A0 =C2=A0+ *vfp: designed for Thumb1 CPUs with VFPv2<br>
&gt; ++<br>
&gt; ++COMMON_FUNCTIONS :=3D \<br>
&gt; ++ absvdi2 \<br>
&gt; ++ absvsi2 \<br>
&gt; ++ addvdi3 \<br>
&gt; ++ addvsi3 \<br>
&gt; ++ ashldi3 \<br>
&gt; ++ ashrdi3 \<br>
&gt; ++ bswapdi2 \<br>
&gt; ++ bswapsi2 \<br>
&gt; ++ clzdi2 \<br>
&gt; ++ clzsi2 \<br>
&gt; ++ cmpdi2 \<br>
&gt; ++ ctzdi2 \<br>
&gt; ++ ctzsi2 \<br>
&gt; ++ divdc3 \<br>
&gt; ++ divdi3 \<br>
&gt; ++ divsc3 \<br>
&gt; ++ divmodsi4 \<br>
&gt; ++ udivmodsi4 \<br>
&gt; ++ do_global_dtors \<br>
&gt; ++ ffsdi2 \<br>
&gt; ++ fixdfdi \<br>
&gt; ++ fixsfdi \<br>
&gt; ++ fixunsdfdi \<br>
&gt; ++ fixunsdfsi \<br>
&gt; ++ fixunssfdi \<br>
&gt; ++ fixunssfsi \<br>
&gt; ++ floatdidf \<br>
&gt; ++ floatdisf \<br>
&gt; ++ floatundidf \<br>
&gt; ++ floatundisf \<br>
&gt; ++ gcc_bcmp \<br>
&gt; ++ lshrdi3 \<br>
&gt; ++ moddi3 \<br>
&gt; ++ muldc3 \<br>
&gt; ++ muldi3 \<br>
&gt; ++ mulsc3 \<br>
&gt; ++ mulvdi3 \<br>
&gt; ++ mulvsi3 \<br>
&gt; ++ negdi2 \<br>
&gt; ++ negvdi2 \<br>
&gt; ++ negvsi2 \<br>
&gt; ++ paritydi2 \<br>
&gt; ++ paritysi2 \<br>
&gt; ++ popcountdi2 \<br>
&gt; ++ popcountsi2 \<br>
&gt; ++ powidf2 \<br>
&gt; ++ powisf2 \<br>
&gt; ++ subvdi3 \<br>
&gt; ++ subvsi3 \<br>
&gt; ++ ucmpdi2 \<br>
&gt; ++ udiv_w_sdiv \<br>
&gt; ++ udivdi3 \<br>
&gt; ++ udivmoddi4 \<br>
&gt; ++ umoddi3 \<br>
&gt; ++ adddf3 \<br>
&gt; ++ addsf3 \<br>
&gt; ++ cmpdf2 \<br>
&gt; ++ cmpsf2 \<br>
&gt; ++ div0 \<br>
&gt; ++ divdf3 \<br>
&gt; ++ divsf3 \<br>
&gt; ++ divsi3 \<br>
&gt; ++ extendsfdf2 \<br>
&gt; ++ ffssi2 \<br>
&gt; ++ fixdfsi \<br>
&gt; ++ fixsfsi \<br>
&gt; ++ floatsidf \<br>
&gt; ++ floatsisf \<br>
&gt; ++ floatunsidf \<br>
&gt; ++ floatunsisf \<br>
&gt; ++ comparedf2 \<br>
&gt; ++ comparesf2 \<br>
&gt; ++ modsi3 \<br>
&gt; ++ muldf3 \<br>
&gt; ++ mulsf3 \<br>
&gt; ++ negdf2 \<br>
&gt; ++ negsf2 \<br>
&gt; ++ subdf3 \<br>
&gt; ++ subsf3 \<br>
&gt; ++ truncdfsf2 \<br>
&gt; ++ udivsi3 \<br>
&gt; ++ umodsi3 \<br>
&gt; ++ unorddf2 \<br>
&gt; ++ unordsf2<br>
&gt; ++<br>
&gt; ++ARM_FUNCTIONS :=3D \<br>
&gt; ++ aeabi_cdcmpeq \<br>
&gt; ++ aeabi_cdrcmple \<br>
&gt; ++ aeabi_cfcmpeq \<br>
&gt; ++ aeabi_cfrcmple \<br>
&gt; ++ aeabi_dcmpeq \<br>
&gt; ++ aeabi_dcmpge \<br>
&gt; ++ aeabi_dcmpgt \<br>
&gt; ++ aeabi_dcmple \<br>
&gt; ++ aeabi_dcmplt \<br>
&gt; ++ aeabi_drsub \<br>
&gt; ++ aeabi_fcmpeq \<br>
&gt; ++ aeabi_fcmpge \<br>
&gt; ++ aeabi_fcmpgt \<br>
&gt; ++ aeabi_fcmple \<br>
&gt; ++ aeabi_fcmplt \<br>
&gt; ++ aeabi_frsub \<br>
&gt; ++ aeabi_idivmod \<br>
&gt; ++ aeabi_uidivmod \<br>
&gt; ++<br>
&gt; ++# ARM Assembly implementation which requires Thumb2 (i.e. won&#39;t =
work on v6M).<br>
&gt; ++THUMB2_FUNCTIONS :=3D \<br>
&gt; ++ switch16 \<br>
&gt; ++ switch32 \<br>
&gt; ++ switch8 \<br>
&gt; ++ switchu8 \<br>
&gt; ++ sync_fetch_and_add_4 \<br>
&gt; ++ sync_fetch_and_sub_4 \<br>
&gt; ++ sync_fetch_and_and_4 \<br>
&gt; ++ sync_fetch_and_or_4 \<br>
&gt; ++ sync_fetch_and_xor_4 \<br>
&gt; ++ sync_fetch_and_nand_4 \<br>
&gt; ++ sync_fetch_and_max_4 \<br>
&gt; ++ sync_fetch_and_umax_4 \<br>
&gt; ++ sync_fetch_and_min_4 \<br>
&gt; ++ sync_fetch_and_umin_4 \<br>
&gt; ++ sync_fetch_and_add_8 \<br>
&gt; ++ sync_fetch_and_sub_8 \<br>
&gt; ++ sync_fetch_and_and_8 \<br>
&gt; ++ sync_fetch_and_or_8 \<br>
&gt; ++ sync_fetch_and_xor_8 \<br>
&gt; ++ sync_fetch_and_nand_8 \<br>
&gt; ++ sync_fetch_and_max_8 \<br>
&gt; ++ sync_fetch_and_umax_8 \<br>
&gt; ++ sync_fetch_and_min_8 \<br>
&gt; ++ sync_fetch_and_umin_8<br>
&gt; ++<br>
&gt; ++I386_FUNCTIONS :=3D=C2=A0 \<br>
&gt; ++ i686.get_pc_thunk.eax \<br>
&gt; ++ i686.get_pc_thunk.ebp \<br>
&gt; ++ i686.get_pc_thunk.ebx \<br>
&gt; ++ i686.get_pc_thunk.ecx \<br>
&gt; ++ i686.get_pc_thunk.edi \<br>
&gt; ++ i686.get_pc_thunk.edx \<br>
&gt; ++ i686.get_pc_thunk.esi<br>
&gt; ++<br>
&gt; ++# FIXME: Currently, compiler-rt is missing implementations for a num=
ber of the<br>
&gt; ++# functions. Filter them out for now.<br>
&gt; ++MISSING_FUNCTIONS :=3D \<br>
&gt; ++ cmpdf2 cmpsf2 div0 \<br>
&gt; ++ ffssi2 \<br>
&gt; ++ udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \<br>
&gt; ++ bswapsi2 \<br>
&gt; ++ gcc_bcmp \<br>
&gt; ++ do_global_dtors \<br>
&gt; ++ i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx \=
<br>
&gt; ++ i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx \=
<br>
&gt; ++ i686.get_pc_thunk.esi \<br>
&gt; ++ aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple aeabi_dcm=
peq \<br>
&gt; ++ aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \<b=
r>
&gt; ++ aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmplt =
\<br>
&gt; ++ aeabi_frsub aeabi_idivmod aeabi_uidivmod<br>
&gt; ++<br>
&gt; ++FUNCTIONS_ARMV6M=C2=A0 :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)<br>
&gt; ++FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS) $(THUMB2=
_FUNCTIONS)<br>
&gt; ++FUNCTIONS_I386=C2=A0 =C2=A0 :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTION=
S)<br>
&gt; ++FUNCTIONS_X86_64=C2=A0 :=3D $(COMMON_FUNCTIONS)<br>
&gt; ++<br>
&gt; ++FUNCTIONS_ARMV6M :=3D \<br>
&gt; ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))<br>
&gt; ++FUNCTIONS_ARM_ALL :=3D \<br>
&gt; ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))<br>
&gt; ++FUNCTIONS_I386 :=3D \<br>
&gt; ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))<br>
&gt; ++FUNCTIONS_X86_64 :=3D \<br>
&gt; ++ $(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))<br>
&gt; ++<br>
&gt; ++FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)<br>
&gt; ++FUNCTIONS.soft_pic.armv6m=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARMV6M)<br>
&gt; ++<br>
&gt; ++FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++FUNCTIONS.soft_pic.armv7m=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++<br>
&gt; ++FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++FUNCTIONS.soft_pic.armv7em=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br=
>
&gt; ++FUNCTIONS.hard_pic.armv7em=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br=
>
&gt; ++<br>
&gt; ++FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++FUNCTIONS.soft_pic.armv7=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++FUNCTIONS.hard_pic.armv7=C2=A0 =C2=A0 :=3D $(FUNCTIONS_ARM_ALL)<br>
&gt; ++<br>
&gt; ++FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)<br>
&gt; ++FUNCTIONS.hard_pic.i386=C2=A0 =C2=A0 :=3D $(FUNCTIONS_I386)<br>
&gt; ++<br>
&gt; ++FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)<br>
&gt; ++FUNCTIONS.hard_pic.x86_64=C2=A0 =C2=A0 :=3D $(FUNCTIONS_X86_64)<br>
&gt; +diff --git a/compiler-rt/make/platform/clang_linux_embedded_test_inpu=
t.c b/compiler-rt/make/platform/clang_linux_embedded_test_input.c<br>
&gt; +new file mode 100644<br>
&gt; +index 000000000000..e69de29bb2d1<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simpli=
fy-cross-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clan=
g/0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..a153624860873d0740bd71=
cc1ae35744a530b44f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cros=
s-compilation.-Don-t-use-na.patch<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +From c105a2efab08776d1f4df6b9b8d26d0f89d14b41 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 19 May 2016 23:11:45 -0700<br>
&gt; +Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don&#39;t u=
se<br>
&gt; + native-compiled llvm-config.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 Note: AddLLVM.cmake does not expose the LLVM source dir=
ectory.<br>
&gt; +=C2=A0 =C2=A0 So if you want to run the test suite, you need to eithe=
r:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 1) set LLVM_MAIN_SRC_DIR explicitly (to find lit.py)<br=
>
&gt; +=C2=A0 =C2=A0 2) change AddLLVM.cmake to point to an installed &#39;l=
it&#39;.<br>
&gt; +=C2=A0 =C2=A0 3) add_subdirectory(compiler-rt/test) from clang instea=
d of compiler-rt.<br>
&gt; +<br>
&gt; +<a href=3D"https://us.codeaurora.org/patches/quic/llvm/50683/compiler=
-rt-cross-compilation.patch" rel=3D"noreferrer" target=3D"_blank">https://u=
s.codeaurora.org/patches/quic/llvm/50683/compiler-rt-cross-compilation.patc=
h</a><br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Greg Fitzgerald &lt;<a href=3D"mailto:gregf@codeaurora=
.org" target=3D"_blank">gregf@codeaurora.org</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + compiler-rt/CMakeLists.txt | 11 ++++++++++-<br>
&gt; + 1 file changed, 10 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt<=
br>
&gt; +index 2c52788de56a..fe409704acc3 100644<br>
&gt; +--- a/compiler-rt/CMakeLists.txt<br>
&gt; ++++ b/compiler-rt/CMakeLists.txt<br>
&gt; +@@ -107,7 +107,16 @@ if (COMPILER_RT_STANDALONE_BUILD)<br>
&gt; +=C2=A0 =C2=A0set(CMAKE_CXX_EXTENSIONS NO)<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0if (NOT LLVM_RUNTIMES_BUILD)<br>
&gt; +-=C2=A0 =C2=A0 load_llvm_config()<br>
&gt; ++=C2=A0 =C2=A0 find_package(LLVM REQUIRED)<br>
&gt; ++=C2=A0 =C2=A0 list(APPEND CMAKE_MODULE_PATH &quot;${LLVM_CMAKE_DIR}&=
quot;)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 # Variables that AddLLVM.cmake depends on (included by=
 AddCompilerRT)<br>
&gt; ++=C2=A0 =C2=A0 set(LLVM_TOOLS_BINARY_DIR &quot;${LLVM_INSTALL_PREFIX}=
/bin&quot;)<br>
&gt; ++=C2=A0 =C2=A0 set(LLVM_LIBRARY_DIR &quot;${LLVM_INSTALL_PREFIX}/lib&=
quot;)<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 set(LLVM_LIBRARY_OUTPUT_INTDIR<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib${LL=
VM_LIBDIR_SUFFIX})<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0endif()<br>
&gt; +=C2=A0 =C2=A0if (TARGET intrinsics_gen)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Loading the llvm config causes this target to b=
e imported so place it<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibrary=
Info-Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/clang/clan=
g/0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..c70f740222f4d3282c4691=
39f18f3cbfdab932b8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Un=
define-libc-functions-if-th.patch<br>
&gt; @@ -0,0 +1,90 @@<br>
&gt; +From 388a70b4a8f828b7c58a0fb7bc3ee18001bc5f9b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Sat, 21 May 2016 00:33:20 +0000<br>
&gt; +Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if =
they are<br>
&gt; + macros<br>
&gt; +<br>
&gt; +musl defines some functions as macros and not inline functions<br>
&gt; +if this is the case then make sure to undefine them<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../llvm/Analysis/TargetLibraryInfo.def=C2=A0 =C2=A0 =C2=A0 =C2=A0| =
22 ++++++++++++++++++-<br>
&gt; + 1 file changed, 21 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/=
include/llvm/Analysis/TargetLibraryInfo.def<br>
&gt; +index db566b8ee610..578161f9c978 100644<br>
&gt; +--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def<br>
&gt; ++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def<br>
&gt; +@@ -1467,6 +1467,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;fopen&quot;)<b=
r>
&gt; + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)<br>
&gt; + <br>
&gt; + /// FILE *fopen64(const char *filename, const char *opentype)<br>
&gt; ++#ifdef fopen64<br>
&gt; ++#undef fopen64<br>
&gt; ++#endif<br>
&gt; + TLI_DEFINE_ENUM_INTERNAL(fopen64)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fopen64&quot;)<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)<br>
&gt; +@@ -1545,7 +1548,9 @@ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Long, Int)<br=
>
&gt; + TLI_DEFINE_ENUM_INTERNAL(fseeko)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fseeko&quot;)<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, IntX, Int)<br>
&gt; +-<br>
&gt; ++#ifdef fseeko64<br>
&gt; ++#undef fseeko64<br>
&gt; ++#endif<br>
&gt; + /// int fseeko64(FILE *stream, off64_t offset, int whence)<br>
&gt; + TLI_DEFINE_ENUM_INTERNAL(fseeko64)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fseeko64&quot;)<br>
&gt; +@@ -1562,6 +1567,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;fstat&quot;)<b=
r>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)<br>
&gt; + <br>
&gt; + /// int fstat64(int filedes, struct stat64 *buf)<br>
&gt; ++#ifdef fstat64<br>
&gt; ++#undef fstat64<br>
&gt; ++#endif<br>
&gt; + TLI_DEFINE_ENUM_INTERNAL(fstat64)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;fstat64&quot;)<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)<br>
&gt; +@@ -1587,6 +1595,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;ftello&quot;)<=
br>
&gt; + TLI_DEFINE_SIG_INTERNAL(IntPlus, Ptr)<br>
&gt; + <br>
&gt; + /// off64_t ftello64(FILE *stream)<br>
&gt; ++#ifdef ftello64<br>
&gt; ++#undef ftello64<br>
&gt; ++#endif<br>
&gt; + TLI_DEFINE_ENUM_INTERNAL(ftello64)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;ftello64&quot;)<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int64, Ptr)<br>
&gt; +@@ -1827,6 +1838,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;lstat&quot;)<b=
r>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; + <br>
&gt; + /// int lstat64(const char *path, struct stat64 *buf);<br>
&gt; ++#ifdef lstat64<br>
&gt; ++#undef lstat64<br>
&gt; ++#endif<br>
&gt; + TLI_DEFINE_ENUM_INTERNAL(lstat64)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;lstat64&quot;)<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; +@@ -2334,6 +2348,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;stat&quot;)<br=
>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; + <br>
&gt; + /// int stat64(const char *path, struct stat64 *buf);<br>
&gt; ++#ifdef stat64<br>
&gt; ++#undef stat64<br>
&gt; ++#endif<br>
&gt; + TLI_DEFINE_ENUM_INTERNAL(stat64)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;stat64&quot;)<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)<br>
&gt; +@@ -2559,6 +2576,9 @@ TLI_DEFINE_STRING_INTERNAL(&quot;tmpfile&quot;)=
<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Ptr)<br>
&gt; + <br>
&gt; + /// FILE *tmpfile64(void)<br>
&gt; ++#ifdef tmpfile64<br>
&gt; ++#undef tmpfile64<br>
&gt; ++#endif<br>
&gt; + TLI_DEFINE_ENUM_INTERNAL(tmpfile64)<br>
&gt; + TLI_DEFINE_STRING_INTERNAL(&quot;tmpfile64&quot;)<br>
&gt; + TLI_DEFINE_SIG_INTERNAL(Ptr)<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-ove=
rride-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005=
-llvm-allow-env-override-of-exe-and-libdir-path.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..6d3f5293aab84056e9693b=
5d2282166fd72b1ede<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-o=
f-exe-and-libdir-path.patch<br>
&gt; @@ -0,0 +1,71 @@<br>
&gt; +From 0b344231c49d8c145bc3ad882d259d36fb19e827 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" target=3D"_=
blank">mkelly@xevo.com</a>&gt;<br>
&gt; +Date: Fri, 19 May 2017 00:22:57 -0700<br>
&gt; +Subject: [PATCH] llvm: allow env override of exe and libdir path<br>
&gt; +<br>
&gt; +When using a native llvm-config from inside a sysroot, we need llvm-c=
onfig to<br>
&gt; +return the libraries, include directories, etc. from inside the sysro=
ot rather<br>
&gt; +than from the native sysroot. Thus provide an env override for callin=
g<br>
&gt; +llvm-config from a target sysroot.<br>
&gt; +<br>
&gt; +Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables=
<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [OE-specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Martin Kelly &lt;<a href=3D"mailto:mkelly@xevo.com" ta=
rget=3D"_blank">mkelly@xevo.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++-----=
-<br>
&gt; + 1 file changed, 19 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm=
-config/llvm-config.cpp<br>
&gt; +index d5b76b1bb6c1..a739f0d8dbea 100644<br>
&gt; +--- a/llvm/tools/llvm-config/llvm-config.cpp<br>
&gt; ++++ b/llvm/tools/llvm-config/llvm-config.cpp<br>
&gt; +@@ -246,6 +246,13 @@ Typical components:\n\<br>
&gt; + <br>
&gt; + /// Compute the path to the main executable.<br>
&gt; + std::string GetExecutablePath(const char *Argv0) {<br>
&gt; ++=C2=A0 // Hack for Yocto: we need to override the root path when we =
are using<br>
&gt; ++=C2=A0 // llvm-config from within a target sysroot.<br>
&gt; ++=C2=A0 const char *Sysroot =3D std::getenv(&quot;YOCTO_ALTERNATE_EXE=
_PATH&quot;);<br>
&gt; ++=C2=A0 if (Sysroot !=3D nullptr) {<br>
&gt; ++=C2=A0 =C2=A0 return Sysroot;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0// This just needs to be some symbol in the binary; C++ =
doesn&#39;t<br>
&gt; +=C2=A0 =C2=A0// allow taking the address of ::main however.<br>
&gt; +=C2=A0 =C2=A0void *P =3D (void *)(intptr_t)GetExecutablePath;<br>
&gt; +@@ -325,7 +332,7 @@ int main(int argc, char **argv) {<br>
&gt; +=C2=A0 =C2=A0// Compute various directory locations based on the deri=
ved location<br>
&gt; +=C2=A0 =C2=A0// information.<br>
&gt; +=C2=A0 =C2=A0std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir=
, ActiveLibDir,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveCMakeDir;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ActiveCMakeDir, Bas=
eLibDir;<br>
&gt; +=C2=A0 =C2=A0std::string ActiveIncludeOption;<br>
&gt; +=C2=A0 =C2=A0if (IsInDevelopmentTree) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) +=
 &quot;/include&quot;;<br>
&gt; +@@ -366,12 +373,18 @@ int main(int argc, char **argv) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0sys::fs::make_absolute(ActivePrefix, Path)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ActiveBinDir =3D std::string(Path);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 ActiveLibDir =3D ActivePrefix + &quot;/lib&quot; + LLV=
M_LIBDIR_SUFFIX;<br>
&gt; +-=C2=A0 =C2=A0 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 SmallString&lt;256&gt; Path(LLVM_INSTALL_PACKAG=
E_DIR);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 sys::fs::make_absolute(ActivePrefix, Path);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 ActiveCMakeDir =3D std::string(Path);<br>
&gt; ++=C2=A0 =C2=A0 // Hack for Yocto: we need to override the lib path wh=
en we are using<br>
&gt; ++=C2=A0 =C2=A0 // llvm-config from within a target sysroot since LLVM=
_LIBDIR_SUFFIX<br>
&gt; ++=C2=A0 =C2=A0 // maybe different for host llvm vs target e.g. ppc64 =
Libdir=3Dlib64 but<br>
&gt; ++=C2=A0 =C2=A0 // x86_64 Libdir =3D lib<br>
&gt; ++=C2=A0 =C2=A0 const char *YoctoLibDir =3D std::getenv(&quot;YOCTO_AL=
TERNATE_LIBDIR&quot;);<br>
&gt; ++=C2=A0 =C2=A0 if (YoctoLibDir !=3D nullptr) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 BaseLibDir =3D std::string(YoctoLibDir);<br>
&gt; ++=C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 BaseLibDir =3D std::string(&quot;/lib&quot;) + =
LLVM_LIBDIR_SUFFIX;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; ++=C2=A0 =C2=A0 ActiveLibDir =3D ActivePrefix + BaseLibDir;<br>
&gt; ++=C2=A0 =C2=A0 ActiveCMakeDir =3D ActiveLibDir + &quot;/cmake/llvm&qu=
ot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ActiveIncludeOption =3D &quot;-I&quot; + ActiveIn=
cludeDir;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; + <br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check=
-sysroot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang=
-driver-Check-sysroot-for-ldso-path.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..02586878207cbc7393239d=
71082299308d426d6e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroo=
t-for-ldso-path.patch<br>
&gt; @@ -0,0 +1,78 @@<br>
&gt; +From 80cacc04e4c0d34f79ee2f112b302c4fbb797d72 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.ca" targe=
t=3D"_blank">dan.mcgregor@usask.ca</a>&gt;<br>
&gt; +Date: Wed, 26 Apr 2017 20:29:41 -0600<br>
&gt; +Subject: [PATCH] clang: driver: Check sysroot for ldso path<br>
&gt; +<br>
&gt; +when we build multilib the ldso has different paths than clangs defau=
lts,<br>
&gt; +every distro kind of does that so OE is not the only one,<br>
&gt; +it happens especially on ppc64, where OE does not necessarily follow =
the<br>
&gt; +default path for the dynamic linker, therefore adjust it for OE. Chec=
k<br>
&gt; +for the default path, and if it isn&#39;t there, check /lib.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Dan McGregor &lt;<a href=3D"mailto:dan.mcgregor@usask.=
ca" target=3D"_blank">dan.mcgregor@usask.ca</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/ToolChains/Linux.cpp | 22 +++++++++++++++++++++-<br=
>
&gt; + 1 file changed, 21 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
&gt; +index 0767fe6c5879..e5a696f63fd0 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
&gt; +@@ -523,8 +523,12 @@ std::string Linux::getDynamicLinker(const ArgLis=
t &amp;Args) const {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Triple.getEnvironment() =3D=3D llvm=
::Triple::GNUEABIHFT64 ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tools::arm::getARMFloatABI(*this, A=
rgs) =3D=3D tools::arm::FloatABI::Hard;<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D HF ? &quot;ld-linux-armhf.so.3&quot; :=
 &quot;ld-linux.so.3&quot;;<br>
&gt; ++=C2=A0 =C2=A0 LibDir =3D &quot;lib32&quot;;<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::loongarch32: {<br>
&gt; +@@ -578,11 +582,19 @@ std::string Linux::getDynamicLinker(const ArgLi=
st &amp;Args) const {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib64&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tools::ppc::hasPPCAbiArg(Args, &qu=
ot;elfv2&quot;)) ? &quot;ld64.so.2&quot; : &quot;ld64.so.1&quot;;<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::ppc64le:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib64&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tools::ppc::hasPPCAbiArg(Args, &qu=
ot;elfv1&quot;)) ? &quot;ld64.so.1&quot; : &quot;ld64.so.2&quot;;<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::riscv32:<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::riscv64: {<br>
&gt; +@@ -600,6 +612,10 @@ std::string Linux::getDynamicLinker(const ArgLis=
t &amp;Args) const {<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::sparcv9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib64&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D &quot;ld-linux.so.2&quot;;<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::systemz:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib&quot;;<br>
&gt; +@@ -614,6 +630,10 @@ std::string Linux::getDynamicLinker(const ArgLis=
t &amp;Args) const {<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D X32 ? &quot;libx32&quot; : &quot;lib64=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D X32 ? &quot;ld-linux-x32.so.2&quot; : =
&quot;ld-linux-x86-64.so.2&quot;;<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 LibDir =3D &quot;lib&quot;;<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::ve:<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools=
.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0=
007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..1681080ece279b38b08068=
89dde067cbf6ffe836<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Ad=
d-lssp_nonshared-on-musl.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From 47dfdd42687c403c044fdb830472d7bedc1b3d39 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 19 May 2016 21:11:06 -0700<br>
&gt; +Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl=
<br>
&gt; +<br>
&gt; +musl driver will need to add ssp_nonshared for stack_check_local<br>
&gt; +on the linker cmdline when using stack protector commands on<br>
&gt; +compiler cmdline<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++<br>
&gt; + 1 file changed, 6 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
&gt; +index f56eeda3cb5f..9f7b9e8d42a8 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
&gt; +@@ -631,6 +631,12 @@ void tools::gnutools::Linker::ConstructJob(Compi=
lation &amp;C, const JobAction &amp;JA,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IsIAMCU)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CmdArgs.push_back(&quot;-lgloss&quo=
t;);<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (ToolChain.getTriple().isMusl() &amp;&amp;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (Args.hasArg(options::OPT_fstack_=
protector) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Args.hasArg(options::OPT_fstack_p=
rotector_strong) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Args.hasArg(options::OPT_fstack_p=
rotector_all))) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 CmdArgs.push_back(&quot;-lssp_nonshared&=
quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IsStatic || IsStaticPIE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CmdArgs.push_back(&quot;--end-group=
&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trai=
ling-to-sysroot.patch b/meta/recipes-devtools/clang/clang/0008-clang-Prepen=
d-trailing-to-sysroot.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..12f670034ebb495ac5ca63=
13e888c7526fad56e9<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to=
-sysroot.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From 4b64a243ce69f782964d4841d1079689a62ebdc1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 16 Mar 2017 09:02:13 -0700<br>
&gt; +Subject: [PATCH] clang: Prepend trailing &#39;/&#39; to sysroot<br>
&gt; +<br>
&gt; +This is needed to handle a case where clang<br>
&gt; +isntall and target sysroot are perilously same<br>
&gt; +<br>
&gt; +e.g.<br>
&gt; +<br>
&gt; +sysroot =3D /mnt/clang/recipe-sysroot<br>
&gt; +clang install =3D /mnt/clang/recipe-sysroot-native<br>
&gt; +<br>
&gt; +in this case it will mistakenly assume that<br>
&gt; +clang is installed under the same sysroot dir<br>
&gt; +and it will try to add relative ../lib paths<br>
&gt; +to linker steps which would then be wrong<br>
&gt; +since they will become relative to clang<br>
&gt; +installation and not sysroot<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/ToolChains/Linux.cpp | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
&gt; +index e5a696f63fd0..621fa17e0603 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
&gt; +@@ -216,7 +216,7 @@ Linux::Linux(const Driver &amp;D, const llvm::Tri=
ple &amp;Triple, const ArgList &amp;Args)<br>
&gt; +=C2=A0 =C2=A0Multilibs =3D GCCInstallation.getMultilibs();<br>
&gt; +=C2=A0 =C2=A0SelectedMultilibs.assign({GCCInstallation.getMultilib()}=
);<br>
&gt; +=C2=A0 =C2=A0llvm::Triple::ArchType Arch =3D Triple.getArch();<br>
&gt; +-=C2=A0 std::string SysRoot =3D computeSysRoot();<br>
&gt; ++=C2=A0 std::string SysRoot =3D computeSysRoot() + &quot;/&quot;;<br>
&gt; +=C2=A0 =C2=A0ToolChain::path_list &amp;PPaths =3D getProgramPaths();<=
br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0Generic_GCC::PushPPaths(PPaths);<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-=
the-target-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clan=
g/0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..5d7a292fcf6967f2a3c770=
651ae0e1787aa2b7a5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-tar=
get-sysroot-for-compiler-ru.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From edc111019281ed898add2c3f86ebfd54b0fa46d9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Thu, 16 Mar 2017 19:06:26 -0700<br>
&gt; +Subject: [PATCH] clang: Look inside the target sysroot for compiler r=
untime<br>
&gt; +<br>
&gt; +In OE compiler-rt and libc++ are built and staged into target<br>
&gt; +sysroot and not into resourcedir which is relative to clang<br>
&gt; +driver installation where the libraries are not instlled<br>
&gt; +<br>
&gt; +Specific to cross compiling the way yocto/OE works<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/ToolChain.cpp | 6 +++++-<br>
&gt; + 1 file changed, 5 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolCh=
ain.cpp<br>
&gt; +index acf9d264d631..3e46c88e95cb 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChain.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChain.cpp<br>
&gt; +@@ -16,6 +16,7 @@<br>
&gt; + #include &quot;ToolChains/InterfaceStubs.h&quot;<br>
&gt; + #include &quot;clang/Basic/ObjCRuntime.h&quot;<br>
&gt; + #include &quot;clang/Basic/Sanitizers.h&quot;<br>
&gt; ++#include &quot;clang/Basic/Version.h&quot;<br>
&gt; + #include &quot;clang/Config/config.h&quot;<br>
&gt; + #include &quot;clang/Driver/Action.h&quot;<br>
&gt; + #include &quot;clang/Driver/Driver.h&quot;<br>
&gt; +@@ -708,7 +709,10 @@ StringRef ToolChain::getOSLibName() const {<br>
&gt; + }<br>
&gt; + <br>
&gt; + std::string ToolChain::getCompilerRTPath() const {<br>
&gt; +-=C2=A0 SmallString&lt;128&gt; Path(getDriver().ResourceDir);<br>
&gt; ++=C2=A0 SmallString&lt;128&gt; Path(getDriver().SysRoot);<br>
&gt; ++=C2=A0 StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);=
<br>
&gt; ++=C2=A0 llvm::sys::path::append(Path, &quot;/usr/&quot;, ClangLibdirB=
asename, &quot;clang&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CLANG_VERSION_STRING);<br>
&gt; +=C2=A0 =C2=A0if (isBareMetal()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0llvm::sys::path::append(Path, &quot;lib&quot;, ge=
tOSLibName());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!SelectedMultilibs.empty()) {<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-relea=
tive-gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0010-cl=
ang-Define-releative-gcc-installation-dir.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..c4fbaee956a7902dd41b63=
1f3c3bed24c2e21d07<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gc=
c-installation-dir.patch<br>
&gt; @@ -0,0 +1,123 @@<br>
&gt; +From e79d44241dfd0f4b4ec25547e6a65e61d2a0b4b2 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Sat, 20 Mar 2021 16:09:16 -0700<br>
&gt; +Subject: [PATCH] clang: Define / releative gcc installation dir<br>
&gt; +<br>
&gt; +This is required for OE gcc installation to work.<br>
&gt; +Without this its not able to find the paths for libgcc<br>
&gt; +and other standard headers and libraries from gcc<br>
&gt; +installation in OE<br>
&gt; +<br>
&gt; +* Do not use install relative libc++ headers<br>
&gt; +In OE we use same clang for native and cross builds, therefore we nee=
d<br>
&gt; +to ensure that native sysroot install of libc++ is not searched for<b=
r>
&gt; +headers when doing cross compile instead it searches the target sysro=
ot<br>
&gt; +this is especially troublesome when libcxx-native is staged along wit=
h<br>
&gt; +libcxx e.g. chromium<br>
&gt; +<br>
&gt; + * Fix lib paths for OpenEmbedded Host<br>
&gt; +<br>
&gt; +Under OpenEmbedded Host, while building with clang-native, it cannot =
find<br>
&gt; +the GCCInstallPath, which causing following error:<br>
&gt; +[snip]<br>
&gt; +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang<br>
&gt; +-target x86_64-linux<br>
&gt; +-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sys=
root-native/usr/include<br>
&gt; +-O2 -pipe<br>
&gt; +/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share=
/cmake-3.21/Modules/CMakeCCompilerABI.c`<br>
&gt; +hosttools/ld: cannot find crtbeginS.o: No such file or directory<br>
&gt; +[snip]<br>
&gt; +<br>
&gt; +Before this patch:<br>
&gt; +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang<br>
&gt; +clang version 13.0.1 (<a href=3D"https://github.com/llvm/llvm-project=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-project=
</a> 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)<br>
&gt; +Target: x86_64-unknown-linux-gnu<br>
&gt; +Thread model: posix<br>
&gt; +InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/1=
3.0.1-r0/recipe-sysroot-native/usr/bin<br>
&gt; +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.=
0<br>
&gt; +<br>
&gt; +After this patch:<br>
&gt; +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang<br>
&gt; +clang version 13.0.1 (<a href=3D"https://github.com/llvm/llvm-project=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-project=
</a> 08e3a5ccd952edee36b3c002e3a29c6b1b5153de)<br>
&gt; +Thread model: posix<br>
&gt; +InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/1=
3.0.1-r0/recipe-sysroot-native/usr/bin<br>
&gt; +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.=
0<br>
&gt; +Found candidate GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0<br=
>
&gt; +Selected GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0<br>
&gt; +Candidate multilib: .;@m64<br>
&gt; +Selected multilib: .;@m64<br>
&gt; +<br>
&gt; +For OpenEmbedded Host, sysroots are of the form&lt;sysroot&gt;/usr/li=
b/&lt;triple&gt;/x.y.z.<br>
&gt; +Take x86-64 as example, the default triple is x86_64-unknown-linux-gn=
u.<br>
&gt; +For clang-native, the target vendor is &#39;-unknown&#39;, need to te=
st current distro<br>
&gt; +to follow above form.<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/ToolChains/Gnu.cpp | 22 ++++++++++++++--------<br>
&gt; + 1 file changed, 14 insertions(+), 8 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
&gt; +index 9f7b9e8d42a8..268fb7bf7167 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
&gt; +@@ -19,6 +19,7 @@<br>
&gt; + #include &quot;Linux.h&quot;<br>
&gt; + #include &quot;clang/Config/config.h&quot; // for GCC_INSTALL_PREFIX=
<br>
&gt; + #include &quot;clang/Driver/Compilation.h&quot;<br>
&gt; ++#include &quot;clang/Driver/Distro.h&quot;<br>
&gt; + #include &quot;clang/Driver/Driver.h&quot;<br>
&gt; + #include &quot;clang/Driver/DriverDiagnostic.h&quot;<br>
&gt; + #include &quot;clang/Driver/MultilibBuilder.h&quot;<br>
&gt; +@@ -2860,6 +2861,7 @@ void Generic_GCC::GCCInstallationDetector::Scan=
LibDirForGCCTriple(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const llvm::Triple &amp;TargetTriple, const ArgLi=
st &amp;Args,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const std::string &amp;LibDir, StringRef Candidat=
eTriple,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool NeedsBiarchSuffix, bool GCCDirExists, bool G=
CCCrossDirExists) {<br>
&gt; ++=C2=A0 Distro Distro(D.getVFS(), TargetTriple);<br>
&gt; +=C2=A0 =C2=A0// Locations relative to the system lib directory where =
GCC&#39;s triple-specific<br>
&gt; +=C2=A0 =C2=A0// directories might reside.<br>
&gt; +=C2=A0 =C2=A0struct GCCLibSuffix {<br>
&gt; +@@ -2871,19 +2873,20 @@ void Generic_GCC::GCCInstallationDetector::Sc=
anLibDirForGCCTriple(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// Whether this library suffix is relevant for th=
e triple.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool Active;<br>
&gt; +=C2=A0 =C2=A0} Suffixes[] =3D {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // This is the normal place.<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {&quot;gcc/&quot; + CandidateTriple.str(), &quo=
t;../..&quot;, GCCDirExists},<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 // Debian puts cross-compilers in gcc-cross.<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 {&quot;gcc-cross/&quot; + CandidateTriple.str()=
, &quot;../..&quot;, GCCCrossDirExists},<br>
&gt; +-<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// The Freescale PPC SDK has the gcc libra=
ries in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// &lt;sysroot&gt;/usr/lib/&lt;triple&gt;/=
x.y.z so have a look there as well. Only do<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// this on Freescale triples, though, sinc=
e some systems put a *lot* of<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0// files in that location, not just GCC in=
stallation data.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0{CandidateTriple.str(), &quot;..&quot;,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 TargetTriple.getVendor() =3D=3D llvm::Tri=
ple::Freescale ||<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TargetTriple.getVendor() =
=3D=3D llvm::Triple::OpenEmbedded}};<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TargetTriple.getVendor() =
=3D=3D llvm::Triple::OpenEmbedded ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Distro.IsOpenEmbedded()},<b=
r>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // This is the normal place.<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;gcc/&quot; + CandidateTriple.str(), &quo=
t;../..&quot;, GCCDirExists},<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 // Debian puts cross-compilers in gcc-cross.<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 {&quot;gcc-cross/&quot; + CandidateTriple.str()=
, &quot;../..&quot;, GCCCrossDirExists}};<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0for (auto &amp;Suffix : Suffixes) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!Suffix.Active)<br>
&gt; +@@ -3274,8 +3277,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm:=
:opt::ArgList &amp;DriverArgs,<br>
&gt; +=C2=A0 =C2=A0// incompatible with the NDK libraries.<br>
&gt; +=C2=A0 =C2=A0SmallString&lt;128&gt; DriverIncludeDir(getDriver().Dir)=
;<br>
&gt; +=C2=A0 =C2=A0llvm::sys::path::append(DriverIncludeDir, &quot;..&quot;=
, &quot;include&quot;);<br>
&gt; ++<br>
&gt; ++=C2=A0 // do not add it when --sysroot is specified, since it would =
expect<br>
&gt; ++=C2=A0 // libc++ headers from sysroot and not relative to compiler i=
nstall location<br>
&gt; +=C2=A0 =C2=A0if (AddIncludePath(DriverIncludeDir,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*TargetDirRequired=3D*/getTriple().isAndroid()))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/*TargetDirRequired=3D*/getTriple().isAndroid() | !computeSysRoot=
().empty()))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0// If this is a development, non-installed, clang, libcx=
x will<br>
&gt; +=C2=A0 =C2=A0// not be found at ../include/c++ but it likely to be fo=
und at<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread=
-and-ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clan=
g/0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..e50e3bf026129aac9604ca=
c380d241cae8053cb2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ld=
l-along-with-lunwind-for-st.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From 42dc7f1fd3e7bc549f87b9c28fb3024a3970e96d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 31 Jul 2019 22:51:39 -0700<br>
&gt; +Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind fo=
r static<br>
&gt; + linking<br>
&gt; +<br>
&gt; +When doing static liking with --unwindlib=3Dlibunwind -static we enco=
unter<br>
&gt; +undefined symbols<br>
&gt; +libunwind/src/RWMutex.hpp:68: undefined reference to `pthread_rwlock_=
wrlock&#39;<br>
&gt; +<br>
&gt; +and<br>
&gt; +<br>
&gt; +libunwind/src/AddressSpace.hpp:597: undefined reference to `dladdr&#3=
9;<br>
&gt; +<br>
&gt; +therefore we need to link in libpthread and libdl to fill these symbo=
ls<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/ToolChains/CommonArgs.cpp | 2 ++<br>
&gt; + 1 file changed, 2 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/D=
river/ToolChains/CommonArgs.cpp<br>
&gt; +index ae635fb6a180..255e7e0b7150 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/CommonArgs.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp<br>
&gt; +@@ -2254,6 +2254,8 @@ static void AddUnwindLibrary(const ToolChain &a=
mp;TC, const Driver &amp;D,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CmdArgs.push_back(&quot;-lunwind&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (LGT =3D=3D LibGccType::StaticLibGcc) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CmdArgs.push_back(&quot;-l:libunwind.a&quo=
t;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 CmdArgs.push_back(&quot;-lpthread&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 CmdArgs.push_back(&quot;-ldl&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (LGT =3D=3D LibGccType::SharedLibGcc) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (TC.getTriple().isOSCygMing())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CmdArgs.push_back(&quot;-l:libunwin=
d.dll.a&quot;);<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUT=
ABLE-when-cross-compiling-for-nati.patch b/meta/recipes-devtools/clang/clan=
g/0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..0f386cd1a6c5d9633d700a=
77cb5493d337a739d1<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-wh=
en-cross-compiling-for-nati.patch<br>
&gt; @@ -0,0 +1,24 @@<br>
&gt; +From 0e60706bcddbb9a97ab28df6fba39bf6bd49ab27 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.com" target=
=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; +Date: Thu, 26 Dec 2019 12:56:16 -0800<br>
&gt; +Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for nati=
ve build<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Anuj Mittal &lt;<a href=3D"mailto:anuj.mittal@intel.co=
m" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + llvm/cmake/modules/CrossCompile.cmake | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/llvm/cmake/modules/CrossCompile.cmake b/llvm/cmake/modul=
es/CrossCompile.cmake<br>
&gt; +index 3b31d3e218a3..a07ab45878fd 100644<br>
&gt; +--- a/llvm/cmake/modules/CrossCompile.cmake<br>
&gt; ++++ b/llvm/cmake/modules/CrossCompile.cmake<br>
&gt; +@@ -100,6 +100,7 @@ function(llvm_create_cross_target project_name ta=
rget_name toolchain buildtype)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCH=
AIN=3D&quot;${LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM_INCLUDE_BENCHMARKS=3DOFF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-DLLVM_INCLUDE_TESTS=3DOFF<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DPYTHON_EXECUTABLE=3D&quot;${PYTHON_EXE=
CUTABLE}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${build_type_flags} ${linker_flag} =
${external_clang_dir} ${libc_flags}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${ARGN}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WORKING_DIRECTORY ${${project_name}_${target_name=
}_BUILD}<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-d=
ouble-intrinsics.patch b/meta/recipes-devtools/clang/clang/0013-Check-for-a=
tomic-double-intrinsics.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..3a6713a2deeb5e863d0543=
649d92c44ccf22037d<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-i=
ntrinsics.patch<br>
&gt; @@ -0,0 +1,34 @@<br>
&gt; +From f7ef28286dd0adfd384ef55c9039022b4f92f99c Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 18 Nov 2019 17:00:29 -0800<br>
&gt; +Subject: [PATCH] Check for atomic&lt;double&gt; intrinsics<br>
&gt; +<br>
&gt; +On some architectures e.g. x86/32bit gcc decides to inline calls to<b=
r>
&gt; +double atomic variables but clang does not and defers it to libatomic=
<br>
&gt; +therefore detect if clang can use built-ins for atomic&lt;double&gt; =
if not<br>
&gt; +then link libatomic, this helps building clangd for x86 on linux syst=
ems<br>
&gt; +with gcc runtime<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + llvm/cmake/modules/CheckAtomic.cmake | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/llvm/cmake/modules/CheckAtomic.cmake b/llvm/cmake/module=
s/CheckAtomic.cmake<br>
&gt; +index f11cadf39ff6..80a18a92956a 100644<br>
&gt; +--- a/llvm/cmake/modules/CheckAtomic.cmake<br>
&gt; ++++ b/llvm/cmake/modules/CheckAtomic.cmake<br>
&gt; +@@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)<br>
&gt; + #include &lt;atomic&gt;<br>
&gt; + #include &lt;cstdint&gt;<br>
&gt; + std::atomic&lt;uint64_t&gt; x (0);<br>
&gt; ++std::atomic&lt;double&gt; y (0);<br>
&gt; + int main() {<br>
&gt; +=C2=A0 =C2=A0uint64_t i =3D x.load(std::memory_order_relaxed);<br>
&gt; +=C2=A0 =C2=A0(void)i;<br>
&gt; +-=C2=A0 return 0;<br>
&gt; ++=C2=A0 return int(y);<br>
&gt; + }<br>
&gt; + &quot; ${varname})<br>
&gt; +=C2=A0 =C2=A0set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})<br=
>
&gt; diff --git a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-=
for-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0=
014-cmake-Fix-configure-for-packages-using-find_package.patch<br>
&gt; similarity index 98%<br>
&gt; rename from meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-f=
or-packages-using-find_package.patch<br>
&gt; rename to meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-f=
or-packages-using-find_package.patch<br>
&gt; index 94c056ab8e0abcdf4b96fc3c9bf22842018941e8..033f9e6d7ca2e1b61c223d=
b37d1653a4663f3510 100644<br>
&gt; --- a/meta/recipes-devtools/llvm/llvm/0014-cmake-Fix-configure-for-pac=
kages-using-find_package.patch<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-p=
ackages-using-find_package.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 93141cee493022d9f39dbd1f5f0bb0a1110ac829 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From aae87f7ce9d07ba1c401de8f2981b046321fba3b Mon Sep 17 00:00:00 200=
1<br>
&gt; From: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu.panait@windriver.com"=
 target=3D"_blank">ovidiu.panait@windriver.com</a>&gt;<br>
&gt; Date: Fri, 31 Jan 2020 10:56:11 +0200<br>
&gt; Subject: [PATCH] cmake: Fix configure for packages using find_package(=
)<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource=
-dir-location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clan=
g/0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..479cc01004ed8441bdf235=
409e6e7577b865bce2<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-lo=
cation-for-cross-toolchains.patch<br>
&gt; @@ -0,0 +1,50 @@<br>
&gt; +From e374b21872c382d0450a5813184c72fdaabcac11 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Jim Broadus &lt;<a href=3D"mailto:jbroadus@xevo.com" target=3D"=
_blank">jbroadus@xevo.com</a>&gt;<br>
&gt; +Date: Thu, 26 Mar 2020 16:05:53 -0700<br>
&gt; +Subject: [PATCH] clang: Fix resource dir location for cross toolchain=
s<br>
&gt; +<br>
&gt; +When clang looks for the resources directory, it does so based on the=
 binary<br>
&gt; +location and assumes that the containing directory is a sibling to li=
b. The<br>
&gt; +Yocto cross.bbclass defines the default bindir as<br>
&gt; +${exec_prefix}/bin/${CROSS_TARGET_SYS_DIR}. ex: /usr/bin/aarch64-poky=
-linux/.<br>
&gt; +This causes clang to form a path that looks like /usr/bin/lib/clang/.=
..<br>
&gt; +<br>
&gt; +As a fix for this, check the parent directory name. If that is &quot;=
bin&quot;, then<br>
&gt; +use that directory&#39;s parent.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Jim Broadus &lt;<a href=3D"mailto:jbroadus@xevo.com" t=
arget=3D"_blank">jbroadus@xevo.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/Driver.cpp | 9 ++++++++-<br>
&gt; + 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cp=
p<br>
&gt; +index 87855fdb7997..036c9d09df26 100644<br>
&gt; +--- a/clang/lib/Driver/Driver.cpp<br>
&gt; ++++ b/clang/lib/Driver/Driver.cpp<br>
&gt; +@@ -176,6 +176,7 @@ std::string Driver::GetResourcesPath(StringRef Bi=
naryPath) {<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0// Dir is bin/ or lib/, depending on where BinaryPath is=
.<br>
&gt; +=C2=A0 =C2=A0StringRef Dir =3D llvm::sys::path::parent_path(BinaryPat=
h);<br>
&gt; ++=C2=A0 StringRef LastDirName =3D llvm::sys::path::filename(Dir);<br>
&gt; +=C2=A0 =C2=A0SmallString&lt;128&gt; P(Dir);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0StringRef ConfiguredResourceDir(CLANG_RESOURCE_DIR);<br>
&gt; +@@ -187,9 +188,15 @@ std::string Driver::GetResourcesPath(StringRef B=
inaryPath) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// With a static-library build of libclang, LibCl=
angPath will contain the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// path of the embedding binary, which for LLVM b=
inaries will be in bin/.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// ../lib gets us to lib/ in both cases.<br>
&gt; +-=C2=A0 =C2=A0 P =3D llvm::sys::path::parent_path(Dir);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// This search path is also created in the COFF d=
river of lld, so any<br>
&gt; +=C2=A0 =C2=A0 =C2=A0// changes here also needs to happen in lld/COFF/=
Driver.cpp<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 // OE cross toolchains are installed, by default, in a=
 subdir of bin.<br>
&gt; ++=C2=A0 =C2=A0 if (LastDirName =3D=3D &quot;bin&quot;) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 P =3D llvm::sys::path::parent_path(Dir);<br>
&gt; ++=C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 P =3D llvm::sys::path::parent_path(llvm::sys::p=
ath::parent_path(Dir));<br>
&gt; ++=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0llvm::sys::path::append(P, CLANG_INSTALL_LIBDIR_B=
ASENAME, &quot;clang&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CLANG_VERSION_MAJOR_STRING);<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-d=
yld-prefix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clan=
g/0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..3803603355d808bec4a895=
bea57eed4e6478b87c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-pre=
fix-when-checking-sysroot-f.patch<br>
&gt; @@ -0,0 +1,79 @@<br>
&gt; +From 3acdfa74ce633bfebf1c3982d86b4931b8b606c8 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Oleksandr Ocheretnyi &lt;<a href=3D"mailto:oocheret@cisco.com" =
target=3D"_blank">oocheret@cisco.com</a>&gt;<br>
&gt; +Date: Wed, 15 Apr 2020 00:08:39 +0300<br>
&gt; +Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot=
 for ldso<br>
&gt; + path<br>
&gt; +<br>
&gt; + * the dyld-prefix shall be taken into account when the default<br>
&gt; +=C2=A0 =C2=A0path for the dynamic linker has to be checked.<br>
&gt; +<br>
&gt; + * this patch shall be used as annex to the next patch:<br>
&gt; +=C2=A0 =C2=A0&#39;clang: driver: Check sysroot for ldso path&#39; whi=
ch includes<br>
&gt; +=C2=A0 =C2=A0the usrmerge scenario.<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Oleksandr Ocheretnyi &lt;<a href=3D"mailto:oocheret@ci=
sco.com" target=3D"_blank">oocheret@cisco.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/lib/Driver/ToolChains/Linux.cpp | 20 ++++++++++----------<br>
&gt; + 1 file changed, 10 insertions(+), 10 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
&gt; +index 621fa17e0603..8fd454d4eff4 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChains/Linux.cpp<br>
&gt; +@@ -525,8 +525,8 @@ std::string Linux::getDynamicLinker(const ArgList=
 &amp;Args) const {<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D HF ? &quot;ld-linux-armhf.so.3&quot; :=
 &quot;ld-linux.so.3&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib32&quot;;<br>
&gt; +-=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + getDriver()=
.DyldPrefix + &quot;/&quot; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + getDriver().DyldPrefix + &quot;/lib/&quot; + Loader)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -582,8 +582,8 @@ std::string Linux::getDynamicLinker(const ArgList=
 &amp;Args) const {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib64&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tools::ppc::hasPPCAbiArg(Args, &qu=
ot;elfv2&quot;)) ? &quot;ld64.so.2&quot; : &quot;ld64.so.1&quot;;<br>
&gt; +-=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + getDriver()=
.DyldPrefix + &quot;/&quot; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + getDriver().DyldPrefix + &quot;/lib/&quot; + Loader)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -591,8 +591,8 @@ std::string Linux::getDynamicLinker(const ArgList=
 &amp;Args) const {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib64&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(tools::ppc::hasPPCAbiArg(Args, &qu=
ot;elfv1&quot;)) ? &quot;ld64.so.1&quot; : &quot;ld64.so.2&quot;;<br>
&gt; +-=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + getDriver()=
.DyldPrefix + &quot;/&quot; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + getDriver().DyldPrefix + &quot;/lib/&quot; + Loader)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -612,8 +612,8 @@ std::string Linux::getDynamicLinker(const ArgList=
 &amp;Args) const {<br>
&gt; +=C2=A0 =C2=A0case llvm::Triple::sparcv9:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib64&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D &quot;ld-linux.so.2&quot;;<br>
&gt; +-=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + getDriver()=
.DyldPrefix + &quot;/&quot; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + getDriver().DyldPrefix + &quot;/lib/&quot; + Loader)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -630,8 +630,8 @@ std::string Linux::getDynamicLinker(const ArgList=
 &amp;Args) const {<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0LibDir =3D X32 ? &quot;libx32&quot; : &quot;lib64=
&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Loader =3D X32 ? &quot;ld-linux-x32.so.2&quot; : =
&quot;ld-linux-x86-64.so.2&quot;;<br>
&gt; +-=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + &quot;/&quo=
t; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + &quot;/lib/&quot; + Loader)) {<br>
&gt; ++=C2=A0 =C2=A0 if (!getVFS().exists(getDriver().SysRoot + getDriver()=
.DyldPrefix + &quot;/&quot; + LibDir + &quot;/&quot; + Loader) &amp;&amp;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0getVFS().exists(getDriver().SysRoo=
t + getDriver().DyldPrefix + &quot;/lib/&quot; + Loader)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LibDir =3D &quot;lib&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0break;<br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-=
in-python-scripts.patch b/meta/recipes-devtools/clang/clang/0017-clang-Use-=
python3-in-python-scripts.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..329cd8b0237816fbe3d7a5=
50c58c3772fa9f2fcd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-pyth=
on-scripts.patch<br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +From 02ce42db3325d5fab553627dfc73750270c0b665 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
&gt; +Date: Wed, 14 Oct 2020 22:19:57 -0700<br>
&gt; +Subject: [PATCH] clang: Use python3 in python scripts<br>
&gt; +<br>
&gt; +Some scripts ask for python, but they work fine with python3<br>
&gt; +and in OE python symlink is not exposed to build, only python3 is<br>
&gt; +<br>
&gt; +Upstream-Status: Pending<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../find-all-symbols/tool/run-find-all-symbols.py=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; + clang/tools/scan-view/bin/scan-view=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
&gt; + 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/t=
ool/run-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-al=
l-symbols/tool/run-find-all-symbols.py<br>
&gt; +index 471dbf8c110b..f98385dc6651 100755<br>
&gt; +--- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run=
-find-all-symbols.py<br>
&gt; ++++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run=
-find-all-symbols.py<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-#!/usr/bin/env python<br>
&gt; ++#!/usr/bin/env python3<br>
&gt; + #<br>
&gt; + # =3D- run-find-all-symbols.py - Parallel find-all-symbols runner -*=
- python=C2=A0 -*-=3D#<br>
&gt; + #<br>
&gt; +diff --git a/clang/tools/scan-view/bin/scan-view b/clang/tools/scan-v=
iew/bin/scan-view<br>
&gt; +index d01aebb4029a..f3375804654d 100755<br>
&gt; +--- a/clang/tools/scan-view/bin/scan-view<br>
&gt; ++++ b/clang/tools/scan-view/bin/scan-view<br>
&gt; +@@ -1,4 +1,4 @@<br>
&gt; +-#!/usr/bin/env python<br>
&gt; ++#!/usr/bin/env python3<br>
&gt; + <br>
&gt; + from __future__ import print_function<br>
&gt; + <br>
&gt; diff --git a/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-=
anchor-for-adding-OE-distro-vendor.patch b/meta/recipes-devtools/clang/clan=
g/0018-llvm-clang-Insert-anchor-for-adding-OE-distro-vendor.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000000000000000000000000000000000..bf46b22f361def855b1a40=
2d3970dbea577fad1b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/clang/clang/0018-llvm-clang-Insert-anchor-=
for-adding-OE-distro-vendor.patch<br>
&gt; @@ -0,0 +1,167 @@<br>
&gt; +From aec307904022e138d1004ceb44b9600deaa7fbdb Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" targ=
et=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; +Date: Mon, 25 Jan 2021 16:14:35 +0800<br>
&gt; +Subject: [PATCH] llvm/clang: Insert anchor for adding OE distro vendo=
r names<br>
&gt; +<br>
&gt; +This helps in making right detection for OE built gcc toolchains<br>
&gt; +<br>
&gt; +The //CLANG_EXTRA_OE_VENDORS_CASES string is replaced with list of<br=
>
&gt; +additional Ceses based on CLANG_EXTRA_OE_VENDORS variable in<br>
&gt; +recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()<br=
>
&gt; +<br>
&gt; +* For x86_64, set Yocto based GCC install search path<br>
&gt; +<br>
&gt; +Under Yocto host, while using clang-native to build, it searches<br>
&gt; +install host gcc failed which causing the include file not found<br>
&gt; +[snip]<br>
&gt; +|clang++ -target x86_64-linux=C2=A0 -MMD -MF src/base/files/file_path=
_constants.o.d -I../../../tools/gn/src -I. \<br>
&gt; +-isystem/tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/recip=
e-sysroot-native/usr/include -O2 -pipe \<br>
&gt; +-std=3Dc++17 -c ../../../tools/gn/src/base/files/file_path_constants.=
cc -o src/base/files/file_path_constants.o<br>
&gt; +|../../../tools/gn/src/base/files/file_path_constants.cc:7:10: fatal =
error: &#39;iterator&#39; file not found<br>
&gt; +|#include &lt;iterator&gt;<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~<br>
&gt; +[snip]<br>
&gt; +<br>
&gt; +* Set three Yocto based GCC triple: poky, oe-core and wind river<br>
&gt; +<br>
&gt; +Before aplly the patch<br>
&gt; +[snip]<br>
&gt; +$ ../recipe-sysroot-native/usr/bin/clang++ -v<br>
&gt; +clang version 11.0.1 (<a href=3D"https://github.com/llvm/llvm-project=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-project=
</a> 43ff75f2c3feef64f9d73328230d34dac8832a91)<br>
&gt; +Target: x86_64-unknown-linux-gnu<br>
&gt; +Thread model: posix<br>
&gt; +InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/c=
hromium-87.0.4280.141/../recipe-sysroot-native/usr/bin<br>
&gt; +[snip]<br>
&gt; +<br>
&gt; +After this patch:<br>
&gt; +[snip]<br>
&gt; +$ ../recipe-sysroot-native/usr/bin/clang++ -v<br>
&gt; +clang version 11.0.1 (<a href=3D"https://github.com/llvm/llvm-project=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/llvm/llvm-project=
</a> 22c3241ff9a6224261df48d0258957fd8acc3d64)<br>
&gt; +Target: x86_64-unknown-linux-gnu<br>
&gt; +Thread model: posix<br>
&gt; +InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/c=
hromium-87.0.4280.141/../recipe-sysroot-native/usr/bin<br>
&gt; +Found candidate GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0<b=
r>
&gt; +Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.1.=
0<br>
&gt; +Selected GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0<br>
&gt; +Candidate multilib: .;@m64<br>
&gt; +Selected multilib: .;@m64<br>
&gt; +[snip]<br>
&gt; +<br>
&gt; +BTW, it is hardly to insert a triple by the replacement of TARGET_SYS=
<br>
&gt; +(=3D${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}), since TARGET_VENDOR=
<br>
&gt; +is different between clang and clang-native<br>
&gt; +<br>
&gt; +* The //CLANG_EXTRA_OE_VENDORS_TRIPLES string is replaced with list o=
f<br>
&gt; +additional triples based on CLANG_EXTRA_OE_VENDORS variable in<br>
&gt; +recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()<br=
>
&gt; +<br>
&gt; +* Correct library search path for OpenEmbedded Host<br>
&gt; +<br>
&gt; +For OpenEmbedded Host, the gcc install path is<br>
&gt; +/usr/lib/x86_64-[distroname]-linux/[gcc-version].<br>
&gt; +So the library search path is not found with default triple<br>
&gt; +&#39;x86_64-linux-gnu&#39; for x86_64. Causing following error:<br>
&gt; +[snip]<br>
&gt; +compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang<br>
&gt; +-target x86_64-linux<br>
&gt; +-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sys=
root-native/usr/include<br>
&gt; +-O2 -pipe<br>
&gt; +/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share=
/cmake-3.21/Modules/CMakeCCompilerABI.c`<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0/build/tmp-glibc/hosttools/ld: cannot find -lgcc=
<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0/build/tmp-glibc/hosttools/ld: cannot find -lgcc=
<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0clang-13: error: linker command failed with exit=
 code 1 (use -v to see invocation)<br>
&gt; +[snip]<br>
&gt; +<br>
&gt; +before this patch:<br>
&gt; +b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/rec=
ipe-sysroot-native/usr/bin/clang --print-search-dirs<br>
&gt; +programs: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13=
.0.1-r0/recipe-sysroot-native/usr/bin<br>
&gt; +libraries: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/1=
3.0.1-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/build/tmp-glibc/work/x=
86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../l=
ib://lib://usr/lib<br>
&gt; +<br>
&gt; +after this patch:<br>
&gt; +b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/rec=
ipe-sysroot-native/usr/bin/clang --print-search-dirs<br>
&gt; +programs: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13=
.0.1-r0/recipe-sysroot-native/usr/bin<br>
&gt; +libraries: =3D/build/tmp-glibc/work/x84_64-linux/compiler-rt-native/1=
3.0.1-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/usr/lib/x86_64-wrs-lin=
ux/10.2.0://lib/x86_64-wrs-linux://usr/lib/x86_64-wrs-linux:/build/tmp-glib=
c/work/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/=
bin/../lib://lib://usr/lib<br>
&gt; +<br>
&gt; +Upstream-Status: Inappropriate [oe specific]<br>
&gt; +<br>
&gt; +Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; +Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
&gt; +Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windri=
ver.com" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
&gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + clang/include/clang/Driver/Distro.h=C2=A0 =C2=A0| 2 ++<br>
&gt; + clang/lib/Driver/Distro.cpp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1 +<br>
&gt; + clang/lib/Driver/ToolChains/Gnu.cpp=C2=A0 =C2=A0| 1 +<br>
&gt; + clang/lib/Driver/ToolChains/Linux.cpp | 1 +<br>
&gt; + llvm/lib/TargetParser/Triple.cpp=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; + 5 files changed, 6 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clan=
g/Driver/Distro.h<br>
&gt; +index b4d485dac8a2..ac0bf25b7c63 100644<br>
&gt; +--- a/clang/include/clang/Driver/Distro.h<br>
&gt; ++++ b/clang/include/clang/Driver/Distro.h<br>
&gt; +@@ -45,6 +45,7 @@ public:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0RHEL7,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Fedora,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Gentoo,<br>
&gt; ++=C2=A0 =C2=A0 //CLANG_EXTRA_OE_DISTRO_NAME<br>
&gt; +=C2=A0 =C2=A0 =C2=A0OpenSUSE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0UbuntuHardy,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0UbuntuIntrepid,<br>
&gt; +@@ -139,6 +140,7 @@ public:<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0bool IsGentoo() const { return DistroVal =3D=3D Gentoo; =
}<br>
&gt; + <br>
&gt; ++=C2=A0 //CLANG_EXTRA_OE_DISTRO_CHECK<br>
&gt; +=C2=A0 =C2=A0/// @}<br>
&gt; + };<br>
&gt; + <br>
&gt; +diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cp=
p<br>
&gt; +index 3cc79535de8d..595656179bdc 100644<br>
&gt; +--- a/clang/lib/Driver/Distro.cpp<br>
&gt; ++++ b/clang/lib/Driver/Distro.cpp<br>
&gt; +@@ -43,6 +43,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs=
::FileSystem &amp;VFS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.Case(&quot;sles&quot;, Distro::OpenSUSE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.Case(&quot;opensuse&quot;, Distro::OpenSUSE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.Case(&quot;exherbo&quot;, Distro::Exherbo)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 //CLANG_EXTRA_OE_DISTRO_CASE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0.Default(Distro::UnknownDistro);<br>
&gt; +=C2=A0 =C2=A0return Version;<br>
&gt; + }<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/T=
oolChains/Gnu.cpp<br>
&gt; +index 268fb7bf7167..868d32f501e8 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/Gnu.cpp<br>
&gt; ++++ b/clang/lib/Driver/ToolChains/Gnu.cpp<br>
&gt; +@@ -2452,6 +2452,7 @@ void Generic_GCC::GCCInstallationDetector::AddD=
efaultGCCPrefixes(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;x86_64-pc-linux-gnu&quot;,=C2=A0 =C2=
=A0 &quot;x86_64-redhat-linux6E&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;x86_64-redhat-linux&quot;,=C2=A0 =C2=
=A0 &quot;x86_64-suse-linux&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;x86_64-manbo-linux-gnu&quot;, &quot;=
x86_64-slackware-linux&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;x86_64-oe-linux&quot;,//CLANG_EXTRA_OE_VE=
NDORS_TRIPLES<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;x86_64-unknown-linux&quot;,=C2=A0 =
=C2=A0&quot;x86_64-amazon-linux&quot;};<br>
&gt; +=C2=A0 =C2=A0static const char *const X32Triples[] =3D {&quot;x86_64-=
linux-gnux32&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;x86_64-pc-linux-gnux32&quot;};<br>
&gt; +diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver=
/ToolChains/Linux.cpp<br>
&gt; +index 8fd454d4eff4..fb9d433a80be 100644<br>
&gt; +--- a/clang/lib/Driver/ToolChains/Linux.cpp<br>
</blockquote></div></div>

--000000000000522bf40634132488--

