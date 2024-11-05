Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4707FD33A36
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.28082.1730832352469629010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iF9LegSx;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c693b68f5so62842745ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832352; x=1731437152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsJtYimSidpa8TvpJYLYhPNR9qmDIM8N0Wtp05+2/fk=;
        b=iF9LegSxxuqXXke9/ozvuFhJOnB0Q8SHU2WaDeVeoNNt/MmMUcnoSD9gtacY1YlGQ3
         0ZIUDwylECmDiqGNMh1A0S4fTtBCJyXuOeqAJDilQbl/cfZKJa8PBQq3BA1Fai2eQhSI
         JzXNI6vkrveyBH4GHRyMIjaPzc5NhI/tSeIfpzsy09DszKpc2FLlCv8TNNjH4QbGcSmr
         043WSxtVoB6HxOb34CsIdCaGpFRveIzLt8ZDUpNNMNlYUERfZf0yoRzzeGJ0BPdqSBDQ
         Wg4+WHFzvhhoP5reAK/hTI5olPw7cPJ1hiE1nzlzWHRO68yEL5xr0b4othkITY0DZExE
         7Nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832352; x=1731437152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsJtYimSidpa8TvpJYLYhPNR9qmDIM8N0Wtp05+2/fk=;
        b=GBsVt28eOj329F4LCDYV8od99rHIhaR9IfdapCIPho+cw2N2ofZw4ky7uHwvQkq35Y
         zpPuct5fOOBIS+P42pOZWFO36+t7Ng3CHsYf3fNnvw+RqE52ZoQRb//zsQTe6KJPCm+/
         H6mQidfWaYaiVl4WxOJPWuIESpxMeo7tceKCQst0EMWtfvQCEFmeBKBH+qiNc4eTi1rX
         4NX+eqEmZ3S5NgOvPo8ysq12mJLz2WizI88+P0lqXnpGMe7Zyc3lMlWw6XGXr1EohlGB
         rJC80jhNsdPlkrrmHSZLo3S2OuVuljMDwreglogBV9rNpjCgyFxmxZDUtA/lfR+mfQaZ
         Iivw==
X-Gm-Message-State: AOJu0YxC8/3c2VMh2cwILFP/vncojwRpK/ZSOpjJLfUYKnuzs1u7oYzE
	4QMT2IS2NtCv66QOf45uR/PPyGNx27Kh74lxihOUzVVX+TbRvpS/aNDXPg==
X-Google-Smtp-Source: AGHT+IFA3guUzAZcw2FH8k0++6Y2zRea4Er15qYLtjlmlsxfYGaVTIO6yAmQsuutAD7yxGRfWQUeGw==
X-Received: by 2002:a17:902:f791:b0:20b:5645:d860 with SMTP id d9443c01a7336-21103b34323mr272826485ad.36.1730832349736;
        Tue, 05 Nov 2024 10:45:49 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 07/19] clang: Migrate clang and related recipes from meta-clang
Date: Tue,  5 Nov 2024 10:45:26 -0800
Message-ID: <20241105184540.3450302-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206736

This includes compiler, tools and runtime libraries, they are
brought in together to avoid major rehashing due to their
interdependence.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clang/clang-cross-canadian_git.bb         |  36 ++
 .../recipes-devtools/clang/clang-cross_git.bb |  35 ++
 .../clang/clang-crosssdk_git.bb               |  34 ++
 meta/recipes-devtools/clang/clang.inc         |  24 +
 ...ibunwind-headers-when-LIBCXXABI_LIBU.patch |  60 +++
 ...-support-a-new-embedded-linux-target.patch | 309 ++++++++++++
 ...lify-cross-compilation.-Don-t-use-na.patch |  44 ++
 ...ryInfo-Undefine-libc-functions-if-th.patch |  90 ++++
 ...-env-override-of-exe-and-libdir-path.patch |  71 +++
 ...g-driver-Check-sysroot-for-ldso-path.patch |  75 +++
 ...tools.cpp-Add-lssp_nonshared-on-musl.patch |  32 ++
 ...08-clang-Prepend-trailing-to-sysroot.patch |  39 ++
 ...e-the-target-sysroot-for-compiler-ru.patch |  41 ++
 ...efine-releative-gcc-installation-dir.patch |  47 ++
 ...ad-and-ldl-along-with-lunwind-for-st.patch |  35 ++
 ...UTABLE-when-cross-compiling-for-nati.patch |  24 +
 ...3-Check-for-atomic-double-intrinsics.patch |  34 ++
 ...gure-for-packages-using-find_package.patch | 115 +++++
 ...ce-dir-location-for-cross-toolchains.patch |  42 ++
 ...-dyld-prefix-when-checking-sysroot-f.patch |  79 +++
 ...-clang-Use-python3-in-python-scripts.patch |  35 ++
 ...-Yocto-based-GCC-install-search-path.patch |  70 +++
 ...or-for-adding-OE-distro-vendor-names.patch |  32 ++
 ...ot-use-backtrace-APIs-on-non-glibc-l.patch |  68 +++
 ...iple-for-non-debian-multiarch-linux-.patch |  28 ++
 ...libunwind-Added-unw_backtrace-method.patch |  56 +++
 ...ot-use-install-relative-libc-headers.patch |  34 ++
 ...-Fix-lib-paths-for-OpenEmbedded-Host.patch |  79 +++
 ...ry-search-path-for-OpenEmbedded-Host.patch |  84 ++++
 ...0026-lldb-Link-with-libatomic-on-x86.patch |  33 ++
 ...ompiler-rt-Enable-__int128-for-ppc32.patch |  73 +++
 ...ot-use-cmake-infra-to-detect-libzstd.patch |  62 +++
 ...t-Fix-stat-struct-s-size-for-O32-ABI.patch |  44 ++
 ...f-_TIME_BITS-along-with-_FILE_OFFSET.patch |  43 ++
 ....cpp-ARMLibDirs-search-also-in-lib32.patch |  81 +++
 ...d-OE-specific-ABI-triple-for-N32-ABI.patch |  78 +++
 ...unwind.pc.in-and-llvm-config-scripts.patch |  90 ++++
 ...spect-LLVM_LIBDIR_SUFFIX-like-other-.patch |  92 ++++
 meta/recipes-devtools/clang/clang_git.bb      | 463 ++++++++++++++++++
 meta/recipes-devtools/clang/common-source.inc |  17 +
 meta/recipes-devtools/clang/common.inc        |  66 +++
 .../clang/compiler-rt-sanitizers_git.bb       | 123 +++++
 .../recipes-devtools/clang/compiler-rt_git.bb | 126 +++++
 meta/recipes-devtools/clang/libclc_git.bb     |  36 ++
 meta/recipes-devtools/clang/libcxx_git.bb     | 115 +++++
 .../clang/llvm-project-source.bb              |  12 +
 .../clang/llvm-project-source.inc             |  99 ++++
 .../clang/nativesdk-clang-glue.bb             |  36 ++
 meta/recipes-devtools/clang/openmp_git.bb     |  65 +++
 49 files changed, 3506 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang-cross-canadian_git.bb
 create mode 100644 meta/recipes-devtools/clang/clang-cross_git.bb
 create mode 100644 meta/recipes-devtools/clang/clang-crosssdk_git.bb
 create mode 100644 meta/recipes-devtools/clang/clang.inc
 create mode 100644 meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-l=
ibunwind-headers-when-LIBCXXABI_LIBU.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0002-compiler-rt-supp=
ort-a-new-embedded-linux-target.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0003-compiler-rt-Simp=
lify-cross-compilation.-Don-t-use-na.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0004-llvm-TargetLibra=
ryInfo-Undefine-libc-functions-if-th.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0005-llvm-allow-env-o=
verride-of-exe-and-libdir-path.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0006-clang-driver-Che=
ck-sysroot-for-ldso-path.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0007-clang-Driver-too=
ls.cpp-Add-lssp_nonshared-on-musl.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0008-clang-Prepend-tr=
ailing-to-sysroot.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0009-clang-Look-insid=
e-the-target-sysroot-for-compiler-ru.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0010-clang-Define-rel=
eative-gcc-installation-dir.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0011-clang-Add-lpthre=
ad-and-ldl-along-with-lunwind-for-st.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXEC=
UTABLE-when-cross-compiling-for-nati.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0013-Check-for-atomic=
-double-intrinsics.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0014-cmake-Fix-config=
ure-for-packages-using-find_package.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0015-clang-Fix-resour=
ce-dir-location-for-cross-toolchains.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0016-clang-driver-Add=
-dyld-prefix-when-checking-sysroot-f.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0017-clang-Use-python=
3-in-python-scripts.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0018-For-x86_64-set-Y=
octo-based-GCC-install-search-path.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0019-llvm-Insert-anch=
or-for-adding-OE-distro-vendor-names.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0020-compiler-rt-Do-n=
ot-use-backtrace-APIs-on-non-glibc-l.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0021-clang-Fix-x86-tr=
iple-for-non-debian-multiarch-linux-.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0022-libunwind-Added-=
unw_backtrace-method.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0023-clang-Do-not-use=
-install-relative-libc-headers.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0024-Fix-lib-paths-fo=
r-OpenEmbedded-Host.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0025-Correct-library-=
search-path-for-OpenEmbedded-Host.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0026-lldb-Link-with-l=
ibatomic-on-x86.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0027-compiler-rt-Enab=
le-__int128-for-ppc32.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0028-llvm-Do-not-use-=
cmake-infra-to-detect-libzstd.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0029-compiler-rt-Fix-=
stat-struct-s-size-for-O32-ABI.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0030-compiler-rt-Unde=
f-_TIME_BITS-along-with-_FILE_OFFSET.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0031-ToolChains-Gnu.c=
pp-ARMLibDirs-search-also-in-lib32.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0032-clang-llvm-Add-O=
E-specific-ABI-triple-for-N32-ABI.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwi=
nd.pc.in-and-llvm-config-scripts.patch
 create mode 100644 meta/recipes-devtools/clang/clang/0034-scan-build-py-re=
spect-LLVM_LIBDIR_SUFFIX-like-other-.patch
 create mode 100644 meta/recipes-devtools/clang/clang_git.bb
 create mode 100644 meta/recipes-devtools/clang/common-source.inc
 create mode 100644 meta/recipes-devtools/clang/common.inc
 create mode 100644 meta/recipes-devtools/clang/compiler-rt-sanitizers_git.=
bb
 create mode 100644 meta/recipes-devtools/clang/compiler-rt_git.bb
 create mode 100644 meta/recipes-devtools/clang/libclc_git.bb
 create mode 100644 meta/recipes-devtools/clang/libcxx_git.bb
 create mode 100644 meta/recipes-devtools/clang/llvm-project-source.bb
 create mode 100644 meta/recipes-devtools/clang/llvm-project-source.inc
 create mode 100644 meta/recipes-devtools/clang/nativesdk-clang-glue.bb
 create mode 100644 meta/recipes-devtools/clang/openmp_git.bb

diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/meta=
/recipes-devtools/clang/clang-cross-canadian_git.bb
new file mode 100644
index 00000000000..33c33c4d443
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
@@ -0,0 +1,36 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "Clang/LLVM based C/C++ compiler (cross-canadian for ${TAR=
GET_ARCH} target)"
+HOMEPAGE =3D "http://clang.llvm.org/"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-ex=
ception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION =3D "devel"
+
+PN =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+require clang.inc
+require common-source.inc
+inherit cross-canadian
+
+DEPENDS +=3D "nativesdk-clang binutils-cross-canadian-${TRANSLATED_TARGET_=
ARCH} virtual/${HOST_PREFIX}binutils virtual/nativesdk-libc"
+# We have to point gcc at a sysroot but we don't need to rebuild if this c=
hanges
+# e.g. we switch between different machines with different tunes.
+EXTRA_OECONF_PATHS[vardepsexclude] =3D "TUNE_PKGARCH"
+TARGET_ARCH[vardepsexclude] =3D "TUNE_ARCH"
+
+do_install() {
+        install -d ${D}${bindir}
+	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
+            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy ll=
vm-objdump llvm-readelf \
+            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
+	do
+		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+	done
+}
+SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-llvm-ar \
+                      *-llvm-ranlib *-llvm-nm *-lld *-ld.lld *-llvm-as *-l=
lvm-strip \
+                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-=
addr2line \
+                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
+do_install:append() {
+        cross_canadian_bindirlinks
+}
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-=
devtools/clang/clang-cross_git.bb
new file mode 100644
index 00000000000..8aee5cd8628
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -0,0 +1,35 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "Cross compiler wrappers for LLVM based C/C++ compiler"
+HOMEPAGE =3D "http://clang.llvm.org/"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-ex=
ception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION =3D "devel"
+
+PN =3D "clang-cross-${TARGET_ARCH}"
+
+require clang.inc
+require common-source.inc
+inherit cross
+DEPENDS +=3D "clang-native virtual/${TARGET_PREFIX}binutils"
+
+do_install() {
+        install -d ${D}${bindir}
+	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
+            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy ll=
vm-objdump llvm-readelf \
+            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
+	do
+		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+	done
+}
+SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-lld *-ld.lld \
+                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-s=
trip \
+                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-=
addr2line \
+                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
+
+SYSROOT_PREPROCESS_FUNCS +=3D "clangcross_sysroot_preprocess"
+
+clangcross_sysroot_preprocess () {
+        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
+}
+PACKAGES =3D ""
diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/recip=
es-devtools/clang/clang-crosssdk_git.bb
new file mode 100644
index 00000000000..e4b521d0d23
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
@@ -0,0 +1,34 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
+HOMEPAGE =3D "http://clang.llvm.org/"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-ex=
ception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION =3D "devel"
+
+PN =3D "clang-crosssdk-${SDK_SYS}"
+
+require clang.inc
+require common-source.inc
+inherit crosssdk
+DEPENDS +=3D "clang-native nativesdk-clang-glue virtual/${TARGET_PREFIX}bi=
nutils virtual/nativesdk-libc"
+
+do_install() {
+        install -d ${D}${bindir}
+	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
+            llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy ll=
vm-objdump llvm-readelf \
+            llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
+	do
+		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
+	done
+}
+SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-lld *-ld.lld \
+                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm-s=
trip \
+                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llvm-=
addr2line \
+                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
+sysroot_stage_all () {
+        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
+}
+
+PACKAGES =3D ""
+
diff --git a/meta/recipes-devtools/clang/clang.inc b/meta/recipes-devtools/=
clang/clang.inc
new file mode 100644
index 00000000000..3005acc7dd1
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang.inc
@@ -0,0 +1,24 @@
+LLVM_RELEASE =3D ""
+LLVM_DIR =3D "llvm${LLVM_RELEASE}"
+
+LLVM_HTTP ?=3D "https://github.com/llvm"
+
+MAJOR_VER =3D "19"
+MINOR_VER =3D "1"
+PATCH_VER =3D "3"
+# could be 'rcX' or 'git' or empty ( for release )
+VER_SUFFIX =3D ""
+
+PV =3D "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}${VER_SUFFIX}"
+
+LLVMMD5SUM =3D "8a15a0759ef07f2682d2ba4b893c9afe"
+CLANGMD5SUM =3D "ff42885ed2ab98f1ecb8c1fc41205343"
+LLDMD5SUM =3D "ae7dc7c027b1fa89b5b013d391d3ee2b"
+LLDBMD5SUM =3D "2e0d44968471fcde980034dbb826bea9"
+
+LLVM_LIBDIR_SUFFIX=3D"${@d.getVar('baselib').replace('lib', '')}"
+
+# set the default pigz thread
+export PIGZ =3D "-p ${@oe.utils.cpu_count(at_least=3D2)}"
+
+require common.inc
diff --git a/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwin=
d-headers-when-LIBCXXABI_LIBU.patch b/meta/recipes-devtools/clang/clang/000=
1-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch
new file mode 100644
index 00000000000..f2cc81e765d
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-libcxxabi-Find-libunwind-heade=
rs-when-LIBCXXABI_LIBU.patch
@@ -0,0 +1,60 @@
+From 1ae8003c398cb280038301697860ef5769687648 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 27 Aug 2017 10:37:49 -0700
+Subject: [PATCH] libcxxabi: Find libunwind headers when
+ LIBCXXABI_LIBUNWIND_INCLUDES is set
+
+Currently, when LIBCXXABI_LIBUNWIND_INCLUDES is set via CMake arguments
+then it ends up not searching the specified dir and unwind.h is not found
+especially for ARM targets
+
+This patch makes the searching synthesized directories and then set
+LIBCXXABI_LIBUNWIND_INCLUDES if its there in environment
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcxxabi/CMakeLists.txt | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/libcxxabi/CMakeLists.txt b/libcxxabi/CMakeLists.txt
+index 43400c6e8d9a..cc0841112c0c 100644
+--- a/libcxxabi/CMakeLists.txt
++++ b/libcxxabi/CMakeLists.txt
+@@ -423,7 +423,7 @@ set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PA=
TH}" CACHE PATH
+     "Specify path to libunwind source." FORCE)
+=20
+ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH MATCHES ARM)
+-  find_path(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL libunwind.h
++  find_path(LIBCXXABI_LIBUNWIND_INCLUDES libunwind.h
+     PATHS ${LIBCXXABI_LIBUNWIND_INCLUDES}
+           ${LIBCXXABI_LIBUNWIND_PATH}/include
+           ${CMAKE_BINARY_DIR}/${LIBCXXABI_LIBUNWIND_INCLUDES}
+@@ -434,18 +434,23 @@ if (LIBCXXABI_USE_LLVM_UNWINDER OR LLVM_NATIVE_ARCH =
MATCHES ARM)
+     NO_CMAKE_FIND_ROOT_PATH
+   )
+=20
+-  if (LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL STREQUAL "LIBCXXABI_LIBUNWIND=
_INCLUDES_INTERNAL-NOTFOUND")
+-    set(LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL "")
++  if (LIBCXXABI_LIBUNWIND_INCLUDES STREQUAL "LIBCXXABI_LIBUNWIND_INCLUDES=
-NOTFOUND")
++    set(LIBCXXABI_LIBUNWIND_INCLUDES "")
+   endif()
+ endif()
+=20
+-if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}" STREQUAL "")
+-  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES_INTERNAL}")
++if (NOT "${LIBCXXABI_LIBUNWIND_INCLUDES}" STREQUAL "")
++  include_directories("${LIBCXXABI_LIBUNWIND_INCLUDES}")
+ endif()
+=20
+ add_custom_target(cxxabi-test-depends
+   COMMENT "Build dependencies required to run the libc++abi test suite.")
+=20
++set(LIBCXXABI_LIBUNWIND_INCLUDES "${LIBCXXABI_LIBUNWIND_INCLUDES}" CACHE =
PATH
++    "Specify path to libunwind includes." FORCE)
++set(LIBCXXABI_LIBUNWIND_PATH "${LIBCXXABI_LIBUNWIND_PATH}" CACHE PATH
++    "Specify path to libunwind source." FORCE)
++
+ # Add source code. This also contains all of the logic for deciding linke=
r flags
+ # soname, etc...
+ add_subdirectory(include)
diff --git a/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-n=
ew-embedded-linux-target.patch b/meta/recipes-devtools/clang/clang/0002-com=
piler-rt-support-a-new-embedded-linux-target.patch
new file mode 100644
index 00000000000..e8981b8d763
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0002-compiler-rt-support-a-new-embe=
dded-linux-target.patch
@@ -0,0 +1,309 @@
+From c0462b384da7a882ea924ea47476c3cb49feae46 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 19 Apr 2015 15:16:23 -0700
+Subject: [PATCH] compiler-rt: support a new embedded linux target
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../make/platform/clang_linux_embedded.mk     | 286 ++++++++++++++++++
+ .../clang_linux_embedded_test_input.c         |   0
+ 2 files changed, 286 insertions(+)
+ create mode 100644 compiler-rt/make/platform/clang_linux_embedded.mk
+ create mode 100644 compiler-rt/make/platform/clang_linux_embedded_test_in=
put.c
+
+diff --git a/compiler-rt/make/platform/clang_linux_embedded.mk b/compiler-=
rt/make/platform/clang_linux_embedded.mk
+new file mode 100644
+index 000000000000..d0a890075a1c
+--- /dev/null
++++ b/compiler-rt/make/platform/clang_linux_embedded.mk
+@@ -0,0 +1,286 @@
++# These are the functions which clang needs when it is targeting a previo=
us
++# version of the OS. The issue is that the backend may use functions whic=
h were
++# not present in the libgcc that shipped on the platform. In such cases, =
we link
++# with a version of the library which contains private_extern definitions=
 of all
++# the extra functions which might be referenced.
++
++Description :=3D Static runtime libraries for embedded clang/Linux
++
++# A function that ensures we don't try to build for architectures that we
++# don't have working toolchains for.
++CheckArches =3D \
++  $(shell \
++    result=3D""; \
++    for arch in $(1); do \
++      if $(CC) -arch $$arch -c \
++	  -integrated-as \
++	  $(ProjSrcRoot)/make/platform/clang_linux_embedded_test_input.c \
++	  -o /dev/null > /dev/null 2> /dev/null; then \
++        result=3D"$$result$$arch "; \
++      else \
++	printf 1>&2 \
++	  "warning: clang_linux_embedded.mk: dropping arch '$$arch' from lib '$(=
2)'\n"; \
++      fi; \
++    done; \
++    echo $$result)
++
++XCRun =3D \
++  $(shell \
++    result=3D`xcrun -find $(1) 2> /dev/null`; \
++    if [ "$$?" !=3D "0" ]; then result=3D$(1); fi; \
++    echo $$result)
++
++###
++
++CC       :=3D $(call XCRun,clang)
++AR       :=3D $(call XCRun,ar)
++RANLIB   :=3D $(call XCRun,ranlib)
++STRIP    :=3D $(call XCRun,strip)
++LIPO     :=3D $(call XCRun,lipo)
++DSYMUTIL :=3D $(call XCRun,dsymutil)
++Configs :=3D
++UniversalArchs :=3D
++
++# Soft-float version of the runtime. No floating-point instructions will =
be used
++# and the ABI (out of necessity) passes floating values in normal registe=
rs:
++# non-VFP variant of the AAPCS.
++UniversalArchs.soft_static :=3D $(call CheckArches,arm armv7m armv7em arm=
v7,soft_static)
++Configs +=3D $(if $(UniversalArchs.soft_static),soft_static)
++
++# Hard-float version of the runtime. On ARM VFP instructions and register=
s are
++# allowed, and floating point values get passed in them. VFP variant of t=
he
++# AAPCS.
++UniversalArchs.hard_static :=3D $(call CheckArches,armv7em armv7 i386 x86=
_64,hard_static)
++Configs +=3D $(if $(UniversalArchs.hard_static),hard_static)
++
++UniversalArchs.soft_pic :=3D $(call CheckArches,armv6m armv7m armv7em arm=
v7,soft_pic)
++Configs +=3D $(if $(UniversalArchs.soft_pic),soft_pic)
++
++UniversalArchs.hard_pic :=3D $(call CheckArches,armv7em armv7 i386 x86_64=
,hard_pic)
++Configs +=3D $(if $(UniversalArchs.hard_pic),hard_pic)
++
++CFLAGS :=3D -Wall -Werror -Oz -fomit-frame-pointer -ffreestanding
++
++PIC_CFLAGS :=3D -fPIC
++STATIC_CFLAGS :=3D -static
++
++CFLAGS_SOFT :=3D -mfloat-abi=3Dsoft
++CFLAGS_HARD :=3D -mfloat-abi=3Dhard
++
++CFLAGS_I386  :=3D -march=3Dpentium
++
++CFLAGS.soft_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_SOFT)
++CFLAGS.hard_static :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_HARD)
++CFLAGS.soft_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_SOFT)
++CFLAGS.hard_pic    :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_HARD)
++
++CFLAGS.soft_static.armv7 :=3D $(CFLAGS.soft_static) $(CFLAGS_ARMV7)
++CFLAGS.hard_static.armv7 :=3D $(CFLAGS.hard_static) $(CFLAGS_ARMV7)
++CFLAGS.soft_pic.armv7    :=3D $(CFLAGS.soft_pic) $(CFLAGS_ARMV7)
++CFLAGS.hard_pic.armv7    :=3D $(CFLAGS.hard_pic) $(CFLAGS_ARMV7)
++
++# x86 platforms ignore -mfloat-abi options and complain about doing so. D=
espite
++# this they're hard-float.
++CFLAGS.hard_static.i386   :=3D $(CFLAGS) $(STATIC_CFLAGS) $(CFLAGS_I386)
++CFLAGS.hard_pic.i386      :=3D $(CFLAGS) $(PIC_CFLAGS) $(CFLAGS_I386)
++CFLAGS.hard_static.x86_64 :=3D $(CFLAGS) $(STATIC_CFLAGS)
++CFLAGS.hard_pic.x86_64    :=3D $(CFLAGS) $(PIC_CFLAGS)
++
++# Functions not wanted:
++#   + eprintf is obsolete anyway
++#   + *vfp: designed for Thumb1 CPUs with VFPv2
++
++COMMON_FUNCTIONS :=3D \
++	absvdi2 \
++	absvsi2 \
++	addvdi3 \
++	addvsi3 \
++	ashldi3 \
++	ashrdi3 \
++	bswapdi2 \
++	bswapsi2 \
++	clzdi2 \
++	clzsi2 \
++	cmpdi2 \
++	ctzdi2 \
++	ctzsi2 \
++	divdc3 \
++	divdi3 \
++	divsc3 \
++	divmodsi4 \
++	udivmodsi4 \
++	do_global_dtors \
++	ffsdi2 \
++	fixdfdi \
++	fixsfdi \
++	fixunsdfdi \
++	fixunsdfsi \
++	fixunssfdi \
++	fixunssfsi \
++	floatdidf \
++	floatdisf \
++	floatundidf \
++	floatundisf \
++	gcc_bcmp \
++	lshrdi3 \
++	moddi3 \
++	muldc3 \
++	muldi3 \
++	mulsc3 \
++	mulvdi3 \
++	mulvsi3 \
++	negdi2 \
++	negvdi2 \
++	negvsi2 \
++	paritydi2 \
++	paritysi2 \
++	popcountdi2 \
++	popcountsi2 \
++	powidf2 \
++	powisf2 \
++	subvdi3 \
++	subvsi3 \
++	ucmpdi2 \
++	udiv_w_sdiv \
++	udivdi3 \
++	udivmoddi4 \
++	umoddi3 \
++	adddf3 \
++	addsf3 \
++	cmpdf2 \
++	cmpsf2 \
++	div0 \
++	divdf3 \
++	divsf3 \
++	divsi3 \
++	extendsfdf2 \
++	ffssi2 \
++	fixdfsi \
++	fixsfsi \
++	floatsidf \
++	floatsisf \
++	floatunsidf \
++	floatunsisf \
++	comparedf2 \
++	comparesf2 \
++	modsi3 \
++	muldf3 \
++	mulsf3 \
++	negdf2 \
++	negsf2 \
++	subdf3 \
++	subsf3 \
++	truncdfsf2 \
++	udivsi3 \
++	umodsi3 \
++	unorddf2 \
++	unordsf2
++
++ARM_FUNCTIONS :=3D \
++	aeabi_cdcmpeq \
++	aeabi_cdrcmple \
++	aeabi_cfcmpeq \
++	aeabi_cfrcmple \
++	aeabi_dcmpeq \
++	aeabi_dcmpge \
++	aeabi_dcmpgt \
++	aeabi_dcmple \
++	aeabi_dcmplt \
++	aeabi_drsub \
++	aeabi_fcmpeq \
++	aeabi_fcmpge \
++	aeabi_fcmpgt \
++	aeabi_fcmple \
++	aeabi_fcmplt \
++	aeabi_frsub \
++	aeabi_idivmod \
++	aeabi_uidivmod \
++
++# ARM Assembly implementation which requires Thumb2 (i.e. won't work on v=
6M).
++THUMB2_FUNCTIONS :=3D \
++	switch16 \
++	switch32 \
++	switch8 \
++	switchu8 \
++	sync_fetch_and_add_4 \
++	sync_fetch_and_sub_4 \
++	sync_fetch_and_and_4 \
++	sync_fetch_and_or_4 \
++	sync_fetch_and_xor_4 \
++	sync_fetch_and_nand_4 \
++	sync_fetch_and_max_4 \
++	sync_fetch_and_umax_4 \
++	sync_fetch_and_min_4 \
++	sync_fetch_and_umin_4 \
++	sync_fetch_and_add_8 \
++	sync_fetch_and_sub_8 \
++	sync_fetch_and_and_8 \
++	sync_fetch_and_or_8 \
++	sync_fetch_and_xor_8 \
++	sync_fetch_and_nand_8 \
++	sync_fetch_and_max_8 \
++	sync_fetch_and_umax_8 \
++	sync_fetch_and_min_8 \
++	sync_fetch_and_umin_8
++
++I386_FUNCTIONS :=3D  \
++	i686.get_pc_thunk.eax \
++	i686.get_pc_thunk.ebp \
++	i686.get_pc_thunk.ebx \
++	i686.get_pc_thunk.ecx \
++	i686.get_pc_thunk.edi \
++	i686.get_pc_thunk.edx \
++	i686.get_pc_thunk.esi
++
++# FIXME: Currently, compiler-rt is missing implementations for a number o=
f the
++# functions. Filter them out for now.
++MISSING_FUNCTIONS :=3D \
++	cmpdf2 cmpsf2 div0 \
++	ffssi2 \
++	udiv_w_sdiv unorddf2 unordsf2 bswapdi2 \
++	bswapsi2 \
++	gcc_bcmp \
++	do_global_dtors \
++	i686.get_pc_thunk.eax i686.get_pc_thunk.ebp i686.get_pc_thunk.ebx \
++	i686.get_pc_thunk.ecx i686.get_pc_thunk.edi i686.get_pc_thunk.edx \
++	i686.get_pc_thunk.esi \
++	aeabi_cdcmpeq aeabi_cdrcmple aeabi_cfcmpeq aeabi_cfrcmple aeabi_dcmpeq \
++	aeabi_dcmpge aeabi_dcmpgt aeabi_dcmple aeabi_dcmplt aeabi_drsub \
++	aeabi_fcmpeq \ aeabi_fcmpge aeabi_fcmpgt aeabi_fcmple aeabi_fcmplt \
++	aeabi_frsub aeabi_idivmod aeabi_uidivmod
++
++FUNCTIONS_ARMV6M  :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS)
++FUNCTIONS_ARM_ALL :=3D $(COMMON_FUNCTIONS) $(ARM_FUNCTIONS) $(THUMB2_FUNC=
TIONS)
++FUNCTIONS_I386    :=3D $(COMMON_FUNCTIONS) $(I386_FUNCTIONS)
++FUNCTIONS_X86_64  :=3D $(COMMON_FUNCTIONS)
++
++FUNCTIONS_ARMV6M :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARMV6M))
++FUNCTIONS_ARM_ALL :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_ARM_ALL))
++FUNCTIONS_I386 :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_I386))
++FUNCTIONS_X86_64 :=3D \
++	$(filter-out $(MISSING_FUNCTIONS),$(FUNCTIONS_X86_64))
++
++FUNCTIONS.soft_static.armv6m :=3D $(FUNCTIONS_ARMV6M)
++FUNCTIONS.soft_pic.armv6m    :=3D $(FUNCTIONS_ARMV6M)
++
++FUNCTIONS.soft_static.armv7m :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7m    :=3D $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.soft_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_static.armv7em :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_pic.armv7em    :=3D $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.soft_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_static.armv7 :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.soft_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
++FUNCTIONS.hard_pic.armv7    :=3D $(FUNCTIONS_ARM_ALL)
++
++FUNCTIONS.hard_static.i386 :=3D $(FUNCTIONS_I386)
++FUNCTIONS.hard_pic.i386    :=3D $(FUNCTIONS_I386)
++
++FUNCTIONS.hard_static.x86_64 :=3D $(FUNCTIONS_X86_64)
++FUNCTIONS.hard_pic.x86_64    :=3D $(FUNCTIONS_X86_64)
+diff --git a/compiler-rt/make/platform/clang_linux_embedded_test_input.c b=
/compiler-rt/make/platform/clang_linux_embedded_test_input.c
+new file mode 100644
+index 000000000000..e69de29bb2d1
diff --git a/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cr=
oss-compilation.-Don-t-use-na.patch b/meta/recipes-devtools/clang/clang/000=
3-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch
new file mode 100644
index 00000000000..0cf0a89767d
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0003-compiler-rt-Simplify-cross-com=
pilation.-Don-t-use-na.patch
@@ -0,0 +1,44 @@
+From 4f2e69944e8a42da9bd1f7d49399dc3d0fad4859 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 May 2016 23:11:45 -0700
+Subject: [PATCH] compiler-rt: Simplify cross-compilation. Don't use
+ native-compiled llvm-config.
+
+    Note: AddLLVM.cmake does not expose the LLVM source directory.
+    So if you want to run the test suite, you need to either:
+
+    1) set LLVM_MAIN_SRC_DIR explicitly (to find lit.py)
+    2) change AddLLVM.cmake to point to an installed 'lit'.
+    3) add_subdirectory(compiler-rt/test) from clang instead of compiler-r=
t.
+
+https://us.codeaurora.org/patches/quic/llvm/50683/compiler-rt-cross-compil=
ation.patch
+
+Upstream-Status: Pending
+Signed-off-by: Greg Fitzgerald <gregf@codeaurora.org>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/CMakeLists.txt | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/compiler-rt/CMakeLists.txt b/compiler-rt/CMakeLists.txt
+index 2207555b03a0..c28106378bdd 100644
+--- a/compiler-rt/CMakeLists.txt
++++ b/compiler-rt/CMakeLists.txt
+@@ -86,7 +86,16 @@ if (COMPILER_RT_STANDALONE_BUILD)
+   set(CMAKE_CXX_EXTENSIONS NO)
+=20
+   if (NOT LLVM_RUNTIMES_BUILD)
+-    load_llvm_config()
++    find_package(LLVM REQUIRED)
++    list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
++
++    # Variables that AddLLVM.cmake depends on (included by AddCompilerRT)
++    set(LLVM_TOOLS_BINARY_DIR "${LLVM_INSTALL_PREFIX}/bin")
++    set(LLVM_LIBRARY_DIR "${LLVM_INSTALL_PREFIX}/lib")
++
++    set(LLVM_LIBRARY_OUTPUT_INTDIR
++      ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/lib${LLVM_LIBDIR_SUFFIX})
++
+   endif()
+   if (TARGET intrinsics_gen)
+     # Loading the llvm config causes this target to be imported so place =
it
diff --git a/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-=
Undefine-libc-functions-if-th.patch b/meta/recipes-devtools/clang/clang/000=
4-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch
new file mode 100644
index 00000000000..8d8995b3f99
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0004-llvm-TargetLibraryInfo-Undefin=
e-libc-functions-if-th.patch
@@ -0,0 +1,90 @@
+From 0d94f6e299bfa76da9be6451d9e759bc3f6d08a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 May 2016 00:33:20 +0000
+Subject: [PATCH] llvm: TargetLibraryInfo: Undefine libc functions if they =
are
+ macros
+
+musl defines some functions as macros and not inline functions
+if this is the case then make sure to undefine them
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../llvm/Analysis/TargetLibraryInfo.def       | 22 ++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/include/llvm/Analysis/TargetLibraryInfo.def b/llvm/inclu=
de/llvm/Analysis/TargetLibraryInfo.def
+index 623cdb4b6e0b..18bb48beb702 100644
+--- a/llvm/include/llvm/Analysis/TargetLibraryInfo.def
++++ b/llvm/include/llvm/Analysis/TargetLibraryInfo.def
+@@ -1368,6 +1368,9 @@ TLI_DEFINE_STRING_INTERNAL("fopen")
+ TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
+=20
+ /// FILE *fopen64(const char *filename, const char *opentype)
++#ifdef fopen64
++#undef fopen64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(fopen64)
+ TLI_DEFINE_STRING_INTERNAL("fopen64")
+ TLI_DEFINE_SIG_INTERNAL(Ptr, Ptr, Ptr)
+@@ -1446,7 +1449,9 @@ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Long, Int)
+ TLI_DEFINE_ENUM_INTERNAL(fseeko)
+ TLI_DEFINE_STRING_INTERNAL("fseeko")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, IntX, Int)
+-
++#ifdef fseeko64
++#undef fseeko64
++#endif
+ /// int fseeko64(FILE *stream, off64_t offset, int whence)
+ TLI_DEFINE_ENUM_INTERNAL(fseeko64)
+ TLI_DEFINE_STRING_INTERNAL("fseeko64")
+@@ -1463,6 +1468,9 @@ TLI_DEFINE_STRING_INTERNAL("fstat")
+ TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
+=20
+ /// int fstat64(int filedes, struct stat64 *buf)
++#ifdef fstat64
++#undef fstat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(fstat64)
+ TLI_DEFINE_STRING_INTERNAL("fstat64")
+ TLI_DEFINE_SIG_INTERNAL(Int, Int, Ptr)
+@@ -1488,6 +1496,9 @@ TLI_DEFINE_STRING_INTERNAL("ftello")
+ TLI_DEFINE_SIG_INTERNAL(IntPlus, Ptr)
+=20
+ /// off64_t ftello64(FILE *stream)
++#ifdef ftello64
++#undef ftello64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(ftello64)
+ TLI_DEFINE_STRING_INTERNAL("ftello64")
+ TLI_DEFINE_SIG_INTERNAL(Int64, Ptr)
+@@ -1698,6 +1709,9 @@ TLI_DEFINE_STRING_INTERNAL("lstat")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+=20
+ /// int lstat64(const char *path, struct stat64 *buf);
++#ifdef lstat64
++#undef lstat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(lstat64)
+ TLI_DEFINE_STRING_INTERNAL("lstat64")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+@@ -2125,6 +2139,9 @@ TLI_DEFINE_STRING_INTERNAL("stat")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+=20
+ /// int stat64(const char *path, struct stat64 *buf);
++#ifdef stat64
++#undef stat64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(stat64)
+ TLI_DEFINE_STRING_INTERNAL("stat64")
+ TLI_DEFINE_SIG_INTERNAL(Int, Ptr, Ptr)
+@@ -2350,6 +2367,9 @@ TLI_DEFINE_STRING_INTERNAL("tmpfile")
+ TLI_DEFINE_SIG_INTERNAL(Ptr)
+=20
+ /// FILE *tmpfile64(void)
++#ifdef tmpfile64
++#undef tmpfile64
++#endif
+ TLI_DEFINE_ENUM_INTERNAL(tmpfile64)
+ TLI_DEFINE_STRING_INTERNAL("tmpfile64")
+ TLI_DEFINE_SIG_INTERNAL(Ptr)
diff --git a/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override=
-of-exe-and-libdir-path.patch b/meta/recipes-devtools/clang/clang/0005-llvm=
-allow-env-override-of-exe-and-libdir-path.patch
new file mode 100644
index 00000000000..f7677807c0a
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0005-llvm-allow-env-override-of-exe=
-and-libdir-path.patch
@@ -0,0 +1,71 @@
+From 754c5869819c2dd008786a191f06385e6b97e19b Mon Sep 17 00:00:00 2001
+From: Martin Kelly <mkelly@xevo.com>
+Date: Fri, 19 May 2017 00:22:57 -0700
+Subject: [PATCH] llvm: allow env override of exe and libdir path
+
+When using a native llvm-config from inside a sysroot, we need llvm-config=
 to
+return the libraries, include directories, etc. from inside the sysroot ra=
ther
+than from the native sysroot. Thus provide an env override for calling
+llvm-config from a target sysroot.
+
+Add YOCTO_ALTERNATE_LIBDIR and YOCTO_ALTERNATE_EXE_PATH env variables
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Martin Kelly <mkelly@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
+ 1 file changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-conf=
ig/llvm-config.cpp
+index d5b76b1bb6c1..a739f0d8dbea 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -246,6 +246,13 @@ Typical components:\n\
+=20
+ /// Compute the path to the main executable.
+ std::string GetExecutablePath(const char *Argv0) {
++  // Hack for Yocto: we need to override the root path when we are using
++  // llvm-config from within a target sysroot.
++  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
++  if (Sysroot !=3D nullptr) {
++    return Sysroot;
++  }
++
+   // This just needs to be some symbol in the binary; C++ doesn't
+   // allow taking the address of ::main however.
+   void *P =3D (void *)(intptr_t)GetExecutablePath;
+@@ -325,7 +332,7 @@ int main(int argc, char **argv) {
+   // Compute various directory locations based on the derived location
+   // information.
+   std::string ActivePrefix, ActiveBinDir, ActiveIncludeDir, ActiveLibDir,
+-              ActiveCMakeDir;
++              ActiveCMakeDir, BaseLibDir;
+   std::string ActiveIncludeOption;
+   if (IsInDevelopmentTree) {
+     ActiveIncludeDir =3D std::string(LLVM_SRC_ROOT) + "/include";
+@@ -366,12 +373,18 @@ int main(int argc, char **argv) {
+       sys::fs::make_absolute(ActivePrefix, Path);
+       ActiveBinDir =3D std::string(Path);
+     }
+-    ActiveLibDir =3D ActivePrefix + "/lib" + LLVM_LIBDIR_SUFFIX;
+-    {
+-      SmallString<256> Path(LLVM_INSTALL_PACKAGE_DIR);
+-      sys::fs::make_absolute(ActivePrefix, Path);
+-      ActiveCMakeDir =3D std::string(Path);
++    // Hack for Yocto: we need to override the lib path when we are using
++    // llvm-config from within a target sysroot since LLVM_LIBDIR_SUFFIX
++    // maybe different for host llvm vs target e.g. ppc64 Libdir=3Dlib64 =
but
++    // x86_64 Libdir =3D lib
++    const char *YoctoLibDir =3D std::getenv("YOCTO_ALTERNATE_LIBDIR");
++    if (YoctoLibDir !=3D nullptr) {
++      BaseLibDir =3D std::string(YoctoLibDir);
++    } else {
++      BaseLibDir =3D std::string("/lib") + LLVM_LIBDIR_SUFFIX;
+     }
++    ActiveLibDir =3D ActivePrefix + BaseLibDir;
++    ActiveCMakeDir =3D ActiveLibDir + "/cmake/llvm";
+     ActiveIncludeOption =3D "-I" + ActiveIncludeDir;
+   }
+=20
diff --git a/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysr=
oot-for-ldso-path.patch b/meta/recipes-devtools/clang/clang/0006-clang-driv=
er-Check-sysroot-for-ldso-path.patch
new file mode 100644
index 00000000000..9a4621b3a4e
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0006-clang-driver-Check-sysroot-for=
-ldso-path.patch
@@ -0,0 +1,75 @@
+From df4c35c458e7f0b752e76500316ce3ab7583dd5b Mon Sep 17 00:00:00 2001
+From: Dan McGregor <dan.mcgregor@usask.ca>
+Date: Wed, 26 Apr 2017 20:29:41 -0600
+Subject: [PATCH] clang: driver: Check sysroot for ldso path
+
+OE does not necessarily follow the default path for the dynamic linker,
+therefore adjust it for OE. Check for the default path, and if it isn't
+there, check /lib.
+
+Upstream-Status: Pending
+Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 35bf39069605..e4f593e462d6 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -511,7 +511,11 @@ std::string Linux::getDynamicLinker(const ArgList &Ar=
gs) const {
+         Triple.getEnvironment() =3D=3D llvm::Triple::GNUEABIHFT64 ||
+         tools::arm::getARMFloatABI(*this, Args) =3D=3D tools::arm::FloatA=
BI::Hard;
+=20
+-    LibDir =3D "lib";
++    LibDir =3D "lib32";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
+     break;
+   }
+@@ -566,11 +570,19 @@ std::string Linux::getDynamicLinker(const ArgList &A=
rgs) const {
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.s=
o.1";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   case llvm::Triple::ppc64le:
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.s=
o.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   case llvm::Triple::riscv32:
+   case llvm::Triple::riscv64: {
+@@ -588,6 +600,10 @@ std::string Linux::getDynamicLinker(const ArgList &Ar=
gs) const {
+   case llvm::Triple::sparcv9:
+     LibDir =3D "lib64";
+     Loader =3D "ld-linux.so.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   case llvm::Triple::systemz:
+     LibDir =3D "lib";
+@@ -602,6 +618,10 @@ std::string Linux::getDynamicLinker(const ArgList &Ar=
gs) const {
+=20
+     LibDir =3D X32 ? "libx32" : "lib64";
+     Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
++    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
++         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++        LibDir =3D "lib";
++    }
+     break;
+   }
+   case llvm::Triple::ve:
diff --git a/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-=
Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0007-c=
lang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
new file mode 100644
index 00000000000..fc46b3ca1b1
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0007-clang-Driver-tools.cpp-Add-lss=
p_nonshared-on-musl.patch
@@ -0,0 +1,32 @@
+From 7875b568926bbec5b7e3312c55991723c917493e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 19 May 2016 21:11:06 -0700
+Subject: [PATCH] clang: Driver/tools.cpp: Add -lssp_nonshared on musl
+
+musl driver will need to add ssp_nonshared for stack_check_local
+on the linker cmdline when using stack protector commands on
+compiler cmdline
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index 5e9a655eaf82..3e301f2e1d95 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -632,6 +632,12 @@ void tools::gnutools::Linker::ConstructJob(Compilatio=
n &C, const JobAction &JA,
+       if (IsIAMCU)
+         CmdArgs.push_back("-lgloss");
+=20
++      if (ToolChain.getTriple().isMusl() &&
++          (Args.hasArg(options::OPT_fstack_protector) ||
++          Args.hasArg(options::OPT_fstack_protector_strong) ||
++          Args.hasArg(options::OPT_fstack_protector_all))) {
++        CmdArgs.push_back("-lssp_nonshared");
++      }
+       if (IsStatic || IsStaticPIE)
+         CmdArgs.push_back("--end-group");
+       else
diff --git a/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-=
to-sysroot.patch b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-tra=
iling-to-sysroot.patch
new file mode 100644
index 00000000000..f21be08e2a2
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0008-clang-Prepend-trailing-to-sysr=
oot.patch
@@ -0,0 +1,39 @@
+From 84c1650cac223a4578eb43c905fdfb30b617274e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Mar 2017 09:02:13 -0700
+Subject: [PATCH] clang: Prepend trailing '/' to sysroot
+
+This is needed to handle a case where clang
+isntall and target sysroot are perilously same
+
+e.g.
+
+sysroot =3D /mnt/clang/recipe-sysroot
+clang install =3D /mnt/clang/recipe-sysroot-native
+
+in this case it will mistakenly assume that
+clang is installed under the same sysroot dir
+and it will try to add relative ../lib paths
+to linker steps which would then be wrong
+since they will become relative to clang
+installation and not sysroot
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index e4f593e462d6..720bc136528b 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -222,7 +222,7 @@ Linux::Linux(const Driver &D, const llvm::Triple &Trip=
le, const ArgList &Args)
+   Multilibs =3D GCCInstallation.getMultilibs();
+   SelectedMultilibs.assign({GCCInstallation.getMultilib()});
+   llvm::Triple::ArchType Arch =3D Triple.getArch();
+-  std::string SysRoot =3D computeSysRoot();
++  std::string SysRoot =3D computeSysRoot() + "/";
+   ToolChain::path_list &PPaths =3D getProgramPaths();
+=20
+   Generic_GCC::PushPPaths(PPaths);
diff --git a/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-t=
arget-sysroot-for-compiler-ru.patch b/meta/recipes-devtools/clang/clang/000=
9-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch
new file mode 100644
index 00000000000..2ee776bef2e
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0009-clang-Look-inside-the-target-s=
ysroot-for-compiler-ru.patch
@@ -0,0 +1,41 @@
+From 4584c7048d003b239593ad66162437ffd669c220 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Mar 2017 19:06:26 -0700
+Subject: [PATCH] clang: Look inside the target sysroot for compiler runtime
+
+In OE compiler-rt and libc++ are built and staged into target
+sysroot and not into resourcedir which is relative to clang
+driver installation where the libraries are not instlled
+
+Specific to cross compiling the way yocto/OE works
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChain.cpp | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChain.cpp b/clang/lib/Driver/ToolChain.c=
pp
+index 20a555afb809..e6d285795337 100644
+--- a/clang/lib/Driver/ToolChain.cpp
++++ b/clang/lib/Driver/ToolChain.cpp
+@@ -15,6 +15,7 @@
+ #include "ToolChains/InterfaceStubs.h"
+ #include "clang/Basic/ObjCRuntime.h"
+ #include "clang/Basic/Sanitizers.h"
++#include "clang/Basic/Version.h"
+ #include "clang/Config/config.h"
+ #include "clang/Driver/Action.h"
+ #include "clang/Driver/Driver.h"
+@@ -619,7 +620,10 @@ StringRef ToolChain::getOSLibName() const {
+ }
+=20
+ std::string ToolChain::getCompilerRTPath() const {
+-  SmallString<128> Path(getDriver().ResourceDir);
++  SmallString<128> Path(getDriver().SysRoot);
++  StringRef ClangLibdirBasename(CLANG_INSTALL_LIBDIR_BASENAME);
++  llvm::sys::path::append(Path, "/usr/", ClangLibdirBasename, "clang",
++                            CLANG_VERSION_STRING);
+   if (isBareMetal()) {
+     llvm::sys::path::append(Path, "lib", getOSLibName());
+     if (!SelectedMultilibs.empty()) {
diff --git a/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-=
gcc-installation-dir.patch b/meta/recipes-devtools/clang/clang/0010-clang-D=
efine-releative-gcc-installation-dir.patch
new file mode 100644
index 00000000000..c8978088d93
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0010-clang-Define-releative-gcc-ins=
tallation-dir.patch
@@ -0,0 +1,47 @@
+From c86ed165440802158757582df52f848cad3c0e57 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 20 Mar 2021 16:09:16 -0700
+Subject: [PATCH] clang: Define / releative gcc installation dir
+
+This is required for OE gcc installation to work.
+Without this its not able to find the paths for libgcc
+and other standard headers and libraries from gcc
+installation in OE
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index 3e301f2e1d95..89ffc429d059 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2918,19 +2918,19 @@ void Generic_GCC::GCCInstallationDetector::ScanLib=
DirForGCCTriple(
+     // Whether this library suffix is relevant for the triple.
+     bool Active;
+   } Suffixes[] =3D {
+-      // This is the normal place.
+-      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
+-
+-      // Debian puts cross-compilers in gcc-cross.
+-      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists},
+-
+       // The Freescale PPC SDK has the gcc libraries in
+       // <sysroot>/usr/lib/<triple>/x.y.z so have a look there as well. O=
nly do
+       // this on Freescale triples, though, since some systems put a *lot=
* of
+       // files in that location, not just GCC installation data.
+       {CandidateTriple.str(), "..",
+        TargetTriple.getVendor() =3D=3D llvm::Triple::Freescale ||
+-           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded}};
++           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded},
++
++      // This is the normal place.
++      {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
++
++      // Debian puts cross-compilers in gcc-cross.
++      {"gcc-cross/" + CandidateTriple.str(), "../..", GCCCrossDirExists}};
+=20
+   for (auto &Suffix : Suffixes) {
+     if (!Suffix.Active)
diff --git a/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-=
ldl-along-with-lunwind-for-st.patch b/meta/recipes-devtools/clang/clang/001=
1-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch
new file mode 100644
index 00000000000..b5712d6b690
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0011-clang-Add-lpthread-and-ldl-alo=
ng-with-lunwind-for-st.patch
@@ -0,0 +1,35 @@
+From 08b05e4e835b6cb73c844e300dcc4eb4919d8154 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 31 Jul 2019 22:51:39 -0700
+Subject: [PATCH] clang: Add -lpthread and -ldl along with -lunwind for sta=
tic
+ linking
+
+When doing static liking with --unwindlib=3Dlibunwind -static we encounter
+undefined symbols
+libunwind/src/RWMutex.hpp:68: undefined reference to `pthread_rwlock_wrloc=
k'
+
+and
+
+libunwind/src/AddressSpace.hpp:597: undefined reference to `dladdr'
+
+therefore we need to link in libpthread and libdl to fill these symbols
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/CommonArgs.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/CommonArgs.cpp b/clang/lib/Driver=
/ToolChains/CommonArgs.cpp
+index 019df16a909f..00d608c0c095 100644
+--- a/clang/lib/Driver/ToolChains/CommonArgs.cpp
++++ b/clang/lib/Driver/ToolChains/CommonArgs.cpp
+@@ -2183,6 +2183,8 @@ static void AddUnwindLibrary(const ToolChain &TC, co=
nst Driver &D,
+         CmdArgs.push_back("-lunwind");
+     } else if (LGT =3D=3D LibGccType::StaticLibGcc) {
+       CmdArgs.push_back("-l:libunwind.a");
++      CmdArgs.push_back("-lpthread");
++      CmdArgs.push_back("-ldl");
+     } else if (LGT =3D=3D LibGccType::SharedLibGcc) {
+       if (TC.getTriple().isOSCygMing())
+         CmdArgs.push_back("-l:libunwind.dll.a");
diff --git a/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-=
when-cross-compiling-for-nati.patch b/meta/recipes-devtools/clang/clang/001=
2-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch
new file mode 100644
index 00000000000..2086e0ad2f2
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0012-Pass-PYTHON_EXECUTABLE-when-cr=
oss-compiling-for-nati.patch
@@ -0,0 +1,24 @@
+From 322385b4a6109f3f53c3679d7a276ec0084dd7b6 Mon Sep 17 00:00:00 2001
+From: Anuj Mittal <anuj.mittal@intel.com>
+Date: Thu, 26 Dec 2019 12:56:16 -0800
+Subject: [PATCH] Pass PYTHON_EXECUTABLE when cross compiling for native bu=
ild
+
+Upstream-Status: Pending
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/cmake/modules/CrossCompile.cmake | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/cmake/modules/CrossCompile.cmake b/llvm/cmake/modules/Cr=
ossCompile.cmake
+index 39b4abaa0d93..a47afde7f85d 100644
+--- a/llvm/cmake/modules/CrossCompile.cmake
++++ b/llvm/cmake/modules/CrossCompile.cmake
+@@ -92,6 +92,7 @@ function(llvm_create_cross_target project_name target_na=
me toolchain buildtype)
+         -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3D"${LLVM_TEMPORARILY_ALLO=
W_OLD_TOOLCHAIN}"
+         -DLLVM_INCLUDE_BENCHMARKS=3DOFF
+         -DLLVM_INCLUDE_TESTS=3DOFF
++        -DPYTHON_EXECUTABLE=3D"${PYTHON_EXECUTABLE}"
+         ${build_type_flags} ${linker_flag} ${external_clang_dir} ${libc_f=
lags}
+         ${ARGN}
+     WORKING_DIRECTORY ${${project_name}_${target_name}_BUILD}
diff --git a/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double=
-intrinsics.patch b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic=
-double-intrinsics.patch
new file mode 100644
index 00000000000..6db24a941a6
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0013-Check-for-atomic-double-intrin=
sics.patch
@@ -0,0 +1,34 @@
+From 2f41e0721f964677e8876b2c2f540836f426c83f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Nov 2019 17:00:29 -0800
+Subject: [PATCH] Check for atomic<double> intrinsics
+
+On some architectures e.g. x86/32bit gcc decides to inline calls to
+double atomic variables but clang does not and defers it to libatomic
+therefore detect if clang can use built-ins for atomic<double> if not
+then link libatomic, this helps building clangd for x86 on linux systems
+with gcc runtime
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/cmake/modules/CheckAtomic.cmake | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/llvm/cmake/modules/CheckAtomic.cmake b/llvm/cmake/modules/Che=
ckAtomic.cmake
+index f11cadf39ff6..80a18a92956a 100644
+--- a/llvm/cmake/modules/CheckAtomic.cmake
++++ b/llvm/cmake/modules/CheckAtomic.cmake
+@@ -30,10 +30,11 @@ function(check_working_cxx_atomics64 varname)
+ #include <atomic>
+ #include <cstdint>
+ std::atomic<uint64_t> x (0);
++std::atomic<double> y (0);
+ int main() {
+   uint64_t i =3D x.load(std::memory_order_relaxed);
+   (void)i;
+-  return 0;
++  return int(y);
+ }
+ " ${varname})
+   set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
diff --git a/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for=
-packages-using-find_package.patch b/meta/recipes-devtools/clang/clang/0014=
-cmake-Fix-configure-for-packages-using-find_package.patch
new file mode 100644
index 00000000000..5e9eb01a925
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0014-cmake-Fix-configure-for-packag=
es-using-find_package.patch
@@ -0,0 +1,115 @@
+From 6c4f71af6a8c5c0e9261cd20522ecf8d1cdb9e48 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 31 Jan 2020 10:56:11 +0200
+Subject: [PATCH] cmake: Fix configure for packages using find_package()
+
+Currently, when a package (i.e. bcc [https://github.com/iovisor/bcc.git])
+that depends on LLVM/Clang tries to run cmake find_package() during
+do_configure, it will fail with a similar error:
+
+|   The imported target "llvm-tblgen" references the file
+|      ".../recipe-sysroot/usr/bin/llvm-tblgen"
+|
+|   but this file does not exist.  Possible reasons include:
+|   * The file was deleted, renamed, or moved to another location.
+|   * An install or uninstall procedure did not complete successfully.
+|   * The installation package was faulty and contained
+|      ".../recipe-sysroot/usr/lib/cmake/LLVMExports.cmake"
+|   but not all the files it references.
+
+This is due to the fact that currently the cmake scripts look for target
+binaries in sysroot. Work around this by not exporting the target binaries=
 in
+Exports-* cmake files.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ clang/cmake/modules/AddClang.cmake | 2 --
+ llvm/cmake/modules/AddLLVM.cmake   | 7 +------
+ llvm/cmake/modules/TableGen.cmake  | 6 ------
+ 3 files changed, 1 insertion(+), 14 deletions(-)
+
+diff --git a/clang/cmake/modules/AddClang.cmake b/clang/cmake/modules/AddC=
lang.cmake
+index 9d09be193684..d6123b834337 100644
+--- a/clang/cmake/modules/AddClang.cmake
++++ b/clang/cmake/modules/AddClang.cmake
+@@ -169,7 +169,6 @@ macro(add_clang_tool name)
+     if (CLANG_BUILD_TOOLS)
+       get_target_export_arg(${name} Clang export_to_clangtargets)
+       install(TARGETS ${name}
+-        ${export_to_clangtargets}
+         RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
+         COMPONENT ${name})
+=20
+@@ -178,7 +177,6 @@ macro(add_clang_tool name)
+                                  DEPENDS ${name}
+                                  COMPONENT ${name})
+       endif()
+-      set_property(GLOBAL APPEND PROPERTY CLANG_EXPORTS ${name})
+     endif()
+   endif()
+ endmacro()
+diff --git a/llvm/cmake/modules/AddLLVM.cmake b/llvm/cmake/modules/AddLLVM=
.cmake
+index 03f4e1f190fd..6335ab262d19 100644
+--- a/llvm/cmake/modules/AddLLVM.cmake
++++ b/llvm/cmake/modules/AddLLVM.cmake
+@@ -1435,7 +1435,6 @@ macro(llvm_add_tool project name)
+       if( LLVM_BUILD_TOOLS )
+         get_target_export_arg(${name} LLVM export_to_llvmexports)
+         install(TARGETS ${name}
+-                ${export_to_llvmexports}
+                 RUNTIME DESTINATION ${${project}_TOOLS_INSTALL_DIR}
+                 COMPONENT ${name})
+=20
+@@ -1446,9 +1445,7 @@ macro(llvm_add_tool project name)
+         endif()
+       endif()
+     endif()
+-    if( LLVM_BUILD_TOOLS )
+-      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
+-    endif()
++    set_target_properties(${name} PROPERTIES FOLDER "Tools")
+   endif()
+   get_subproject_title(subproject_title)
+   set_target_properties(${name} PROPERTIES FOLDER "${subproject_title}/To=
ols")
+@@ -1497,7 +1494,6 @@ macro(add_llvm_utility name)
+     if (LLVM_INSTALL_UTILS AND LLVM_BUILD_UTILS)
+       get_target_export_arg(${name} LLVM export_to_llvmexports)
+       install(TARGETS ${name}
+-              ${export_to_llvmexports}
+               RUNTIME DESTINATION ${LLVM_UTILS_INSTALL_DIR}
+               COMPONENT ${name})
+=20
+@@ -1506,7 +1502,6 @@ macro(add_llvm_utility name)
+                                  DEPENDS ${name}
+                                  COMPONENT ${name})
+       endif()
+-      set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS ${name})
+     elseif(LLVM_BUILD_UTILS)
+       set_property(GLOBAL APPEND PROPERTY LLVM_EXPORTS_BUILDTREE_ONLY ${n=
ame})
+     endif()
+diff --git a/llvm/cmake/modules/TableGen.cmake b/llvm/cmake/modules/TableG=
en.cmake
+index ffcc718b4777..a76f28e74b86 100644
+--- a/llvm/cmake/modules/TableGen.cmake
++++ b/llvm/cmake/modules/TableGen.cmake
+@@ -232,12 +232,7 @@ macro(add_tablegen target project)
+=20
+   if (ADD_TABLEGEN_DESTINATION AND NOT LLVM_INSTALL_TOOLCHAIN_ONLY AND
+       (LLVM_BUILD_UTILS OR ${target} IN_LIST LLVM_DISTRIBUTION_COMPONENTS=
))
+-    set(export_arg)
+-    if(ADD_TABLEGEN_EXPORT)
+-      get_target_export_arg(${target} ${ADD_TABLEGEN_EXPORT} export_arg)
+-    endif()
+     install(TARGETS ${target}
+-            ${export_arg}
+             COMPONENT ${target}
+             RUNTIME DESTINATION "${ADD_TABLEGEN_DESTINATION}")
+     if(NOT LLVM_ENABLE_IDE)
+@@ -248,6 +243,5 @@ macro(add_tablegen target project)
+   endif()
+   if(ADD_TABLEGEN_EXPORT)
+     string(TOUPPER ${ADD_TABLEGEN_EXPORT} export_upper)
+-    set_property(GLOBAL APPEND PROPERTY ${export_upper}_EXPORTS ${target})
+   endif()
+ endmacro()
diff --git a/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-=
location-for-cross-toolchains.patch b/meta/recipes-devtools/clang/clang/001=
5-clang-Fix-resource-dir-location-for-cross-toolchains.patch
new file mode 100644
index 00000000000..74ddbefabc2
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0015-clang-Fix-resource-dir-locatio=
n-for-cross-toolchains.patch
@@ -0,0 +1,42 @@
+From 11fce59f48e7d15d9b16509146484d60a04f25e9 Mon Sep 17 00:00:00 2001
+From: Jim Broadus <jbroadus@xevo.com>
+Date: Thu, 26 Mar 2020 16:05:53 -0700
+Subject: [PATCH] clang: Fix resource dir location for cross toolchains
+
+When clang looks for the resources directory, it does so based on the bina=
ry
+location and assumes that the containing directory is a sibling to lib. The
+Yocto cross.bbclass defines the default bindir as
+${exec_prefix}/bin/${CROSS_TARGET_SYS_DIR}. ex: /usr/bin/aarch64-poky-linu=
x/.
+This causes clang to form a path that looks like /usr/bin/lib/clang/...
+
+As a fix for this, check the parent directory name. If that is "bin", then
+use that directory's parent.
+
+Upstream-Status: Pending
+Signed-off-by: Jim Broadus <jbroadus@xevo.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/Driver.cpp | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/Driver.cpp b/clang/lib/Driver/Driver.cpp
+index ecae475f75da..ca6c8c98961f 100644
+--- a/clang/lib/Driver/Driver.cpp
++++ b/clang/lib/Driver/Driver.cpp
+@@ -189,9 +189,15 @@ std::string Driver::GetResourcesPath(StringRef Binary=
Path,
+     // With a static-library build of libclang, LibClangPath will contain=
 the
+     // path of the embedding binary, which for LLVM binaries will be in b=
in/.
+     // ../lib gets us to lib/ in both cases.
+-    P =3D llvm::sys::path::parent_path(Dir);
++    Dir =3D std::string(llvm::sys::path::parent_path(Dir));
+     // This search path is also created in the COFF driver of lld, so any
+     // changes here also needs to happen in lld/COFF/Driver.cpp
++
++    // OE cross toolchains are installed, by default, in a subdir of bin.
++    if (llvm::sys::path::filename(Dir) =3D=3D "bin") {
++      Dir =3D std::string(llvm::sys::path::parent_path(Dir));
++    }
++    P =3D Dir;
+     llvm::sys::path::append(P, CLANG_INSTALL_LIBDIR_BASENAME, "clang",
+                             CLANG_VERSION_MAJOR_STRING);
+   }
diff --git a/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-p=
refix-when-checking-sysroot-f.patch b/meta/recipes-devtools/clang/clang/001=
6-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch
new file mode 100644
index 00000000000..7b130e99829
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0016-clang-driver-Add-dyld-prefix-w=
hen-checking-sysroot-f.patch
@@ -0,0 +1,79 @@
+From ed293c1fb5888f6ffe091f7276a7897e1a239c01 Mon Sep 17 00:00:00 2001
+From: Oleksandr Ocheretnyi <oocheret@cisco.com>
+Date: Wed, 15 Apr 2020 00:08:39 +0300
+Subject: [PATCH] clang: driver: Add dyld-prefix when checking sysroot for =
ldso
+ path
+
+ * the dyld-prefix shall be taken into account when the default
+   path for the dynamic linker has to be checked.
+
+ * this patch shall be used as annex to the next patch:
+   'clang: driver: Check sysroot for ldso path' which includes
+   the usrmerge scenario.
+
+Upstream-Status: Pending
+Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 20 ++++++++++----------
+ 1 file changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 720bc136528b..b3a399187ec3 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -512,8 +512,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+         tools::arm::getARMFloatABI(*this, Args) =3D=3D tools::arm::FloatA=
BI::Hard;
+=20
+     LibDir =3D "lib32";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     Loader =3D HF ? "ld-linux-armhf.so.3" : "ld-linux.so.3";
+@@ -570,8 +570,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv2")) ? "ld64.so.2" : "ld64.s=
o.1";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
+@@ -579,8 +579,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+     LibDir =3D "lib64";
+     Loader =3D
+         (tools::ppc::hasPPCAbiArg(Args, "elfv1")) ? "ld64.so.1" : "ld64.s=
o.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
+@@ -600,8 +600,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+   case llvm::Triple::sparcv9:
+     LibDir =3D "lib64";
+     Loader =3D "ld-linux.so.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
+@@ -618,8 +618,8 @@ std::string Linux::getDynamicLinker(const ArgList &Arg=
s) const {
+=20
+     LibDir =3D X32 ? "libx32" : "lib64";
+     Loader =3D X32 ? "ld-linux-x32.so.2" : "ld-linux-x86-64.so.2";
+-    if (!getVFS().exists(getDriver().SysRoot + "/" + LibDir + "/" + Loade=
r) &&
+-         getVFS().exists(getDriver().SysRoot + "/lib/" + Loader)) {
++    if (!getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/" + LibDir + "/" + Loader) &&
++         getVFS().exists(getDriver().SysRoot + getDriver().DyldPrefix + "=
/lib/" + Loader)) {
+         LibDir =3D "lib";
+     }
+     break;
diff --git a/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-py=
thon-scripts.patch b/meta/recipes-devtools/clang/clang/0017-clang-Use-pytho=
n3-in-python-scripts.patch
new file mode 100644
index 00000000000..2631ba76933
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0017-clang-Use-python3-in-python-sc=
ripts.patch
@@ -0,0 +1,35 @@
+From 42acc8d6b252851b3f3cdae08bd9e1ed5a9c8935 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Oct 2020 22:19:57 -0700
+Subject: [PATCH] clang: Use python3 in python scripts
+
+Some scripts ask for python, but they work fine with python3
+and in OE python symlink is not exposed to build, only python3 is
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../find-all-symbols/tool/run-find-all-symbols.py               | 2 +-
+ clang/tools/scan-view/bin/scan-view                             | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/r=
un-find-all-symbols.py b/clang-tools-extra/clang-include-fixer/find-all-sym=
bols/tool/run-find-all-symbols.py
+index 471dbf8c110b..f98385dc6651 100755
+--- a/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find=
-all-symbols.py
++++ b/clang-tools-extra/clang-include-fixer/find-all-symbols/tool/run-find=
-all-symbols.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # =3D- run-find-all-symbols.py - Parallel find-all-symbols runner -*- pyt=
hon  -*-=3D#
+ #
+diff --git a/clang/tools/scan-view/bin/scan-view b/clang/tools/scan-view/b=
in/scan-view
+index d01aebb4029a..f3375804654d 100755
+--- a/clang/tools/scan-view/bin/scan-view
++++ b/clang/tools/scan-view/bin/scan-view
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+=20
+ from __future__ import print_function
+=20
diff --git a/meta/recipes-devtools/clang/clang/0018-For-x86_64-set-Yocto-ba=
sed-GCC-install-search-path.patch b/meta/recipes-devtools/clang/clang/0018-=
For-x86_64-set-Yocto-based-GCC-install-search-path.patch
new file mode 100644
index 00000000000..5970565d1ab
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0018-For-x86_64-set-Yocto-based-GCC=
-install-search-path.patch
@@ -0,0 +1,70 @@
+From 1acea10c68785c42d625618d5cf120e4f19138f2 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 25 Jan 2021 16:14:35 +0800
+Subject: [PATCH] For x86_64, set Yocto based GCC install search path
+
+Under Yocto host, while using clang-native to build, it searches
+install host gcc failed which causing the include file not found
+[snip]
+|clang++ -target x86_64-linux  -MMD -MF src/base/files/file_path_constants=
.o.d -I../../../tools/gn/src -I. \
+-isystem/tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/recipe-sys=
root-native/usr/include -O2 -pipe \
+-std=3Dc++17 -c ../../../tools/gn/src/base/files/file_path_constants.cc -o=
 src/base/files/file_path_constants.o
+|../../../tools/gn/src/base/files/file_path_constants.cc:7:10: fatal error=
: 'iterator' file not found
+|#include <iterator>
+|         ^~~~~~~~
+[snip]
+
+Set three Yocto based GCC triple: poky, oe-core and wind river
+
+Before aplly the patch
+[snip]
+$ ../recipe-sysroot-native/usr/bin/clang++ -v
+clang version 11.0.1 (https://github.com/llvm/llvm-project 43ff75f2c3feef6=
4f9d73328230d34dac8832a91)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromi=
um-87.0.4280.141/../recipe-sysroot-native/usr/bin
+[snip]
+
+After aplly the patch:
+[snip]
+$ ../recipe-sysroot-native/usr/bin/clang++ -v
+clang version 11.0.1 (https://github.com/llvm/llvm-project 22c3241ff9a6224=
261df48d0258957fd8acc3d64)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir:tmp-glibc/work/x86_64-linux/gn-native/87.0.4280.141-r0/chromi=
um-87.0.4280.141/../recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.1.0
+Selected GCC installation: /usr/lib//x86_64-wrs-linux/10.1.0
+Candidate multilib: .;@m64
+Selected multilib: .;@m64
+[snip]
+
+BTW, it is hardly to insert a triple by the replacement of TARGET_SYS
+(=3D${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}), since TARGET_VENDOR
+is different between clang and clang-native
+
+The //CLANG_EXTRA_OE_VENDORS_TRIPLES string is replaced with list of
+additional triples based on CLANG_EXTRA_OE_VENDORS variable in
+recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index 89ffc429d059..e05dd30c3f89 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2498,6 +2498,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(
+       "x86_64-pc-linux-gnu",    "x86_64-redhat-linux6E",
+       "x86_64-redhat-linux",    "x86_64-suse-linux",
+       "x86_64-manbo-linux-gnu", "x86_64-slackware-linux",
++      "x86_64-oe-linux",//CLANG_EXTRA_OE_VENDORS_TRIPLES
+       "x86_64-unknown-linux",   "x86_64-amazon-linux"};
+   static const char *const X32Triples[] =3D {"x86_64-linux-gnux32",
+                                            "x86_64-pc-linux-gnux32"};
diff --git a/meta/recipes-devtools/clang/clang/0019-llvm-Insert-anchor-for-=
adding-OE-distro-vendor-names.patch b/meta/recipes-devtools/clang/clang/001=
9-llvm-Insert-anchor-for-adding-OE-distro-vendor-names.patch
new file mode 100644
index 00000000000..06b8ffd1705
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0019-llvm-Insert-anchor-for-adding-=
OE-distro-vendor-names.patch
@@ -0,0 +1,32 @@
+From a1ae883e90cb9554e10d24277a955fb0660e85a1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 11 Feb 2021 16:42:49 -0800
+Subject: [PATCH] llvm: Insert anchor for adding OE distro vendor names
+
+This helps in making right detection for OE built gcc toolchains
+
+The //CLANG_EXTRA_OE_VENDORS_CASES string is replaced with list of
+additional Ceses based on CLANG_EXTRA_OE_VENDORS variable in
+recipes-devtools/clang/llvm-project-source.inc:add_distro_vendor()
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ llvm/lib/TargetParser/Triple.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Trip=
le.cpp
+index 21d6c74b5956..32adf92c47bf 100644
+--- a/llvm/lib/TargetParser/Triple.cpp
++++ b/llvm/lib/TargetParser/Triple.cpp
+@@ -639,7 +639,7 @@ static Triple::VendorType parseVendor(StringRef Vendor=
Name) {
+     .Case("amd", Triple::AMD)
+     .Case("mesa", Triple::Mesa)
+     .Case("suse", Triple::SUSE)
+-    .Case("oe", Triple::OpenEmbedded)
++    .Case("oe", Triple::OpenEmbedded)//CLANG_EXTRA_OE_VENDORS_CASES
+     .Default(Triple::UnknownVendor);
+ }
+=20
diff --git a/meta/recipes-devtools/clang/clang/0020-compiler-rt-Do-not-use-=
backtrace-APIs-on-non-glibc-l.patch b/meta/recipes-devtools/clang/clang/002=
0-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch
new file mode 100644
index 00000000000..5b17a7a6367
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0020-compiler-rt-Do-not-use-backtra=
ce-APIs-on-non-glibc-l.patch
@@ -0,0 +1,68 @@
+From 11ef637da77e0fd115211f42665c2ed533f921a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 17:32:13 -0700
+Subject: [PATCH] compiler-rt: Do not use backtrace APIs on non-glibc linux
+
+musl e.g. does not provide backtrace APIs
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../lib/gwp_asan/optional/backtrace_linux_libc.cpp  | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp b/=
compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
+index ea8e72be287d..0344074dd254 100644
+--- a/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
++++ b/compiler-rt/lib/gwp_asan/optional/backtrace_linux_libc.cpp
+@@ -7,7 +7,9 @@
+ //=3D=3D=3D--------------------------------------------------------------=
--------=3D=3D=3D//
+=20
+ #include <assert.h>
++#ifdef __GLIBC__
+ #include <execinfo.h>
++#endif
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+@@ -21,8 +23,11 @@
+ namespace {
+ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
+   static_assert(sizeof(uintptr_t) =3D=3D sizeof(void *), "uintptr_t is no=
t void*");
+-
++#ifdef __GLIBC__
+   return backtrace(reinterpret_cast<void **>(TraceBuffer), Size);
++#else
++  return -1;
++#endif
+ }
+=20
+ // We don't need any custom handling for the Segv backtrace - the libc un=
winder
+@@ -30,7 +35,11 @@ size_t Backtrace(uintptr_t *TraceBuffer, size_t Size) {
+ // to avoid the additional frame.
+ GWP_ASAN_ALWAYS_INLINE size_t SegvBacktrace(uintptr_t *TraceBuffer, size_=
t Size,
+                                             void * /*Context*/) {
++#ifdef __GLIBC__
+   return Backtrace(TraceBuffer, Size);
++#else
++  return -1;
++#endif
+ }
+=20
+ static void PrintBacktrace(uintptr_t *Trace, size_t TraceLength,
+@@ -40,6 +49,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Trac=
eLength,
+     return;
+   }
+=20
++#ifdef __GLIBC__
+   char **BacktraceSymbols =3D
+       backtrace_symbols(reinterpret_cast<void **>(Trace), TraceLength);
+=20
+@@ -53,6 +63,7 @@ static void PrintBacktrace(uintptr_t *Trace, size_t Trac=
eLength,
+   Printf("\n");
+   if (BacktraceSymbols)
+     free(BacktraceSymbols);
++#endif
+ }
+ } // anonymous namespace
+=20
diff --git a/meta/recipes-devtools/clang/clang/0021-clang-Fix-x86-triple-fo=
r-non-debian-multiarch-linux-.patch b/meta/recipes-devtools/clang/clang/002=
1-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch
new file mode 100644
index 00000000000..b33a9f4c592
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0021-clang-Fix-x86-triple-for-non-d=
ebian-multiarch-linux-.patch
@@ -0,0 +1,28 @@
+From 9a336eeaa8f8d62057802a98e249df695befa6b6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 May 2021 17:56:03 -0700
+Subject: [PATCH] clang: Fix x86 triple for non-debian multiarch linux dist=
ros
+
+OpenEmbedded does not hardcode mutli-arch like debian therefore ensure
+that it still uses the proper tuple
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Linux.cpp | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index b3a399187ec3..f39c771798a8 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -715,6 +715,9 @@ void Linux::addLibStdCxxIncludePaths(const llvm::opt::=
ArgList &DriverArgs,
+       GCCInstallation.getTriple().getArch() =3D=3D llvm::Triple::x86
+           ? "i386-linux-gnu"
+           : TripleStr;
++  // OpenEmbedded does not hardcode the triple to i386-linux-gnu like deb=
ian
++  if (GCCInstallation.getTriple().getVendor() =3D=3D llvm::Triple::OpenEm=
bedded)
++	  DebianMultiarch =3D TripleStr;
+=20
+   // Try generic GCC detection first.
+   if (Generic_GCC::addGCCLibStdCxxIncludePaths(DriverArgs, CC1Args,
diff --git a/meta/recipes-devtools/clang/clang/0022-libunwind-Added-unw_bac=
ktrace-method.patch b/meta/recipes-devtools/clang/clang/0022-libunwind-Adde=
d-unw_backtrace-method.patch
new file mode 100644
index 00000000000..77cbc1cde51
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0022-libunwind-Added-unw_backtrace-=
method.patch
@@ -0,0 +1,56 @@
+From 01500348e14ae9fa8272f00c2a99ac6e153f5f8e Mon Sep 17 00:00:00 2001
+From: Maksim Kita <maksim-kita@yandex-team.ru>
+Date: Sun, 23 May 2021 10:27:29 +0000
+Subject: [PATCH] libunwind: Added unw_backtrace method
+
+Source: https://github.com/ClickHouse-Extras/libunwind/commit/52f0f7861926=
cbfaef7e6c97d8a6d7ba2a1f6747#diff-a82fc885e2e4facf4b92d26171c13aa4aa5db296f=
77e1158ba2f8664e3bd1f5c
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libunwind/include/libunwind.h |  1 +
+ libunwind/src/libunwind.cpp   | 20 ++++++++++++++++++++
+ 2 files changed, 21 insertions(+)
+
+diff --git a/libunwind/include/libunwind.h b/libunwind/include/libunwind.h
+index b2dae8feed9a..0ab974c9bfa4 100644
+--- a/libunwind/include/libunwind.h
++++ b/libunwind/include/libunwind.h
+@@ -130,6 +130,7 @@ extern int unw_is_fpreg(unw_cursor_t *, unw_regnum_t) =
LIBUNWIND_AVAIL;
+ extern int unw_is_signal_frame(unw_cursor_t *) LIBUNWIND_AVAIL;
+ extern int unw_get_proc_name(unw_cursor_t *, char *, size_t, unw_word_t *=
) LIBUNWIND_AVAIL;
+ //extern int       unw_get_save_loc(unw_cursor_t*, int, unw_save_loc_t*);
++extern int unw_backtrace(void **, int) LIBUNWIND_AVAIL;
+=20
+ extern unw_addr_space_t unw_local_addr_space;
+=20
+diff --git a/libunwind/src/libunwind.cpp b/libunwind/src/libunwind.cpp
+index cf39ec5f7dbd..1896f20d57f8 100644
+--- a/libunwind/src/libunwind.cpp
++++ b/libunwind/src/libunwind.cpp
+@@ -431,6 +431,26 @@ int __unw_remove_find_dynamic_unwind_sections(
+=20
+ #endif // __APPLE__
+=20
++int unw_backtrace(void **buffer, int size) {
++  unw_context_t context;
++  unw_cursor_t cursor;
++  if (unw_getcontext(&context) || unw_init_local(&cursor, &context)) {
++    return 0;
++  }
++
++  unw_word_t ip;
++  int current =3D 0;
++  while (unw_step(&cursor) > 0) {
++    if (current >=3D size || unw_get_reg(&cursor, UNW_REG_IP, &ip)) {
++      break;
++    }
++
++    buffer[current++] =3D reinterpret_cast<void *>(static_cast<uintptr_t>=
(ip));
++  }
++
++  return current;
++}
++
+ // Add logging hooks in Debug builds only
+ #ifndef NDEBUG
+ #include <stdlib.h>
diff --git a/meta/recipes-devtools/clang/clang/0023-clang-Do-not-use-instal=
l-relative-libc-headers.patch b/meta/recipes-devtools/clang/clang/0023-clan=
g-Do-not-use-install-relative-libc-headers.patch
new file mode 100644
index 00000000000..bac9d105c18
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0023-clang-Do-not-use-install-relat=
ive-libc-headers.patch
@@ -0,0 +1,34 @@
+From 081655795d08178e20bcfbaef5dab4a97230f095 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Aug 2021 18:37:11 -0700
+Subject: [PATCH] clang: Do not use install relative libc++ headers
+
+In OE we use same clang for native and cross builds, therefore we need
+to ensure that native sysroot install of libc++ is not searched for
+headers when doing cross compile instead it searches the target sysroot
+this is especially troublesome when libcxx-native is staged along with
+libcxx e.g. chromium
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index e05dd30c3f89..d9efd09d9da6 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -3316,8 +3316,11 @@ Generic_GCC::addLibCxxIncludePaths(const llvm::opt:=
:ArgList &DriverArgs,
+   // incompatible with the NDK libraries.
+   SmallString<128> DriverIncludeDir(getDriver().Dir);
+   llvm::sys::path::append(DriverIncludeDir, "..", "include");
++
++  // do not add it when --sysroot is specified, since it would expect
++  // libc++ headers from sysroot and not relative to compiler install loc=
ation
+   if (AddIncludePath(DriverIncludeDir,
+-                     /*TargetDirRequired=3D*/getTriple().isAndroid()))
++                     /*TargetDirRequired=3D*/getTriple().isAndroid() | !c=
omputeSysRoot().empty()))
+     return;
+   // If this is a development, non-installed, clang, libcxx will
+   // not be found at ../include/c++ but it likely to be found at
diff --git a/meta/recipes-devtools/clang/clang/0024-Fix-lib-paths-for-OpenE=
mbedded-Host.patch b/meta/recipes-devtools/clang/clang/0024-Fix-lib-paths-f=
or-OpenEmbedded-Host.patch
new file mode 100644
index 00000000000..617113d4c9d
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0024-Fix-lib-paths-for-OpenEmbedded=
-Host.patch
@@ -0,0 +1,79 @@
+From 68007800df2e080d799670378c7ec9d667c7e782 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 7 Dec 2021 04:08:22 +0000
+Subject: [PATCH] Fix lib paths for OpenEmbedded Host
+
+Under OpenEmbedded Host, while building with clang-native, it cannot find
+the GCCInstallPath, which causing following error:
+[snip]
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+-target x86_64-linux
+-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-=
native/usr/include
+-O2 -pipe
+/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmak=
e-3.21/Modules/CMakeCCompilerABI.c`
+hosttools/ld: cannot find crtbeginS.o: No such file or directory
+[snip]
+
+Before this patch:
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952ede=
e36b3c002e3a29c6b1b5153de)
+Target: x86_64-unknown-linux-gnu
+Thread model: posix
+InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
+
+After this patch:
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+clang version 13.0.1 (https://github.com/llvm/llvm-project 08e3a5ccd952ede=
e36b3c002e3a29c6b1b5153de)
+Thread model: posix
+InstalledDir: /build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/bin
+Found candidate GCC installation: /usr/lib/gcc/x86_64-wrs-linux/10.2.0
+Found candidate GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
+Selected GCC installation: /usr/lib/x86_64-wrs-linux/10.2.0
+Candidate multilib: .;@m64
+Selected multilib: .;@m64
+
+Summary:
+For OpenEmbedded Host, sysroots are of the form<sysroot>/usr/lib/<triple>/=
x.y.z.
+Take x86-64 as example, the default triple is x86_64-unknown-linux-gnu.
+For clang-native, the target vendor is '-unknown', need to test current di=
stro
+to follow above form.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index d9efd09d9da6..4ec4976a6a0c 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -19,6 +19,7 @@
+ #include "Linux.h"
+ #include "clang/Config/config.h" // for GCC_INSTALL_PREFIX
+ #include "clang/Driver/Compilation.h"
++#include "clang/Driver/Distro.h"
+ #include "clang/Driver/Driver.h"
+ #include "clang/Driver/DriverDiagnostic.h"
+ #include "clang/Driver/MultilibBuilder.h"
+@@ -2908,6 +2909,7 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDi=
rForGCCTriple(
+     const llvm::Triple &TargetTriple, const ArgList &Args,
+     const std::string &LibDir, StringRef CandidateTriple,
+     bool NeedsBiarchSuffix, bool GCCDirExists, bool GCCCrossDirExists) {
++  Distro Distro(D.getVFS(), TargetTriple);
+   // Locations relative to the system lib directory where GCC's triple-sp=
ecific
+   // directories might reside.
+   struct GCCLibSuffix {
+@@ -2925,7 +2927,8 @@ void Generic_GCC::GCCInstallationDetector::ScanLibDi=
rForGCCTriple(
+       // files in that location, not just GCC installation data.
+       {CandidateTriple.str(), "..",
+        TargetTriple.getVendor() =3D=3D llvm::Triple::Freescale ||
+-           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded},
++           TargetTriple.getVendor() =3D=3D llvm::Triple::OpenEmbedded ||
++           Distro.IsOpenEmbedded()},
+=20
+       // This is the normal place.
+       {"gcc/" + CandidateTriple.str(), "../..", GCCDirExists},
diff --git a/meta/recipes-devtools/clang/clang/0025-Correct-library-search-=
path-for-OpenEmbedded-Host.patch b/meta/recipes-devtools/clang/clang/0025-C=
orrect-library-search-path-for-OpenEmbedded-Host.patch
new file mode 100644
index 00000000000..11dc1966ee9
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0025-Correct-library-search-path-fo=
r-OpenEmbedded-Host.patch
@@ -0,0 +1,84 @@
+From 65e12e7671888531d657e0484aa0397e7e98b134 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 7 Dec 2021 04:55:48 +0000
+Subject: [PATCH] Correct library search path for OpenEmbedded Host
+
+For OpenEmbedded Host, the gcc install path is
+/usr/lib/x86_64-[distroname]-linux/[gcc-version].
+So the library search path is not found with default triple
+'x86_64-linux-gnu' for x86_64. Causing following error:
+[snip]
+compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/clang
+-target x86_64-linux
+-isystem/path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-=
native/usr/include
+-O2 -pipe
+/path/to/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/share/cmak=
e-3.21/Modules/CMakeCCompilerABI.c`
+|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
+|     /build/tmp-glibc/hosttools/ld: cannot find -lgcc
+|     clang-13: error: linker command failed with exit code 1 (use -v to s=
ee invocation)
+[snip]
+
+before this patch:
+b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-s=
ysroot-native/usr/bin/clang --print-search-dirs
+programs: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-=
r0/recipe-sysroot-native/usr/bin
+libraries: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/build/tmp-glibc/work/x86_64=
-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/../lib://=
lib://usr/lib
+
+after this patch:
+b59da142f2b0:$ /path/to/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-s=
ysroot-native/usr/bin/clang --print-search-dirs
+programs: =3D/build/tmp-glibc/work/x86_64-linux/compiler-rt-native/13.0.1-=
r0/recipe-sysroot-native/usr/bin
+libraries: =3D/build/tmp-glibc/work/x84_64-linux/compiler-rt-native/13.0.1=
-r0/recipe-sysroot-native/usr/lib/clang/13.0.1:/usr/lib/x86_64-wrs-linux/10=
.2.0://lib/x86_64-wrs-linux://usr/lib/x86_64-wrs-linux:/build/tmp-glibc/wor=
k/x86_64-linux/compiler-rt-native/13.0.1-r0/recipe-sysroot-native/usr/bin/.=
./lib://lib://usr/lib
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/include/clang/Driver/Distro.h   | 2 ++
+ clang/lib/Driver/Distro.cpp           | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp | 1 +
+ 3 files changed, 4 insertions(+)
+
+diff --git a/clang/include/clang/Driver/Distro.h b/clang/include/clang/Dri=
ver/Distro.h
+index 1404e1686848..90940e4a0bac 100644
+--- a/clang/include/clang/Driver/Distro.h
++++ b/clang/include/clang/Driver/Distro.h
+@@ -45,6 +45,7 @@ public:
+     RHEL7,
+     Fedora,
+     Gentoo,
++    //CLANG_EXTRA_OE_DISTRO_NAME
+     OpenSUSE,
+     UbuntuHardy,
+     UbuntuIntrepid,
+@@ -138,6 +139,7 @@ public:
+=20
+   bool IsGentoo() const { return DistroVal =3D=3D Gentoo; }
+=20
++  //CLANG_EXTRA_OE_DISTRO_CHECK
+   /// @}
+ };
+=20
+diff --git a/clang/lib/Driver/Distro.cpp b/clang/lib/Driver/Distro.cpp
+index 6f49e641104c..63b9ff30f0b6 100644
+--- a/clang/lib/Driver/Distro.cpp
++++ b/clang/lib/Driver/Distro.cpp
+@@ -44,6 +44,7 @@ static Distro::DistroType DetectOsRelease(llvm::vfs::Fil=
eSystem &VFS) {
+                     .Case("sles", Distro::OpenSUSE)
+                     .Case("opensuse", Distro::OpenSUSE)
+                     .Case("exherbo", Distro::Exherbo)
++                    //CLANG_EXTRA_OE_DISTRO_CASE
+                     .Default(Distro::UnknownDistro);
+   return Version;
+ }
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index f39c771798a8..9af52769b09a 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -82,6 +82,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+       return "x86_64-linux-android";
+     if (TargetEnvironment =3D=3D llvm::Triple::GNUX32)
+       return "x86_64-linux-gnux32";
++    //CLANG_EXTRA_OE_DISTRO_TRIPLE
+     return "x86_64-linux-gnu";
+   case llvm::Triple::aarch64:
+     if (IsAndroid)
diff --git a/meta/recipes-devtools/clang/clang/0026-lldb-Link-with-libatomi=
c-on-x86.patch b/meta/recipes-devtools/clang/clang/0026-lldb-Link-with-liba=
tomic-on-x86.patch
new file mode 100644
index 00000000000..275a7c68381
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0026-lldb-Link-with-libatomic-on-x8=
6.patch
@@ -0,0 +1,33 @@
+From d395cc2696d62d7d3448bc9a90f7697cf60e6273 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Feb 2022 01:31:26 -0800
+Subject: [PATCH] lldb: Link with libatomic on x86
+
+cmake atomic check is not sufficient for i686 target where clang14 still
+generates __atomic_store calls but the check does not entail this
+function and happily thinks that compiler can resolve all atomic via intri=
nsics
+on i686, but thats not the case, ideally the check for determining
+atomic operation should be make more robust but until then lets ask to
+link with libatomic on i686/linux
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lldb/source/Utility/CMakeLists.txt | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lldb/source/Utility/CMakeLists.txt b/lldb/source/Utility/CMak=
eLists.txt
+index e9954d66cd1a..f36f1c9e9d28 100644
+--- a/lldb/source/Utility/CMakeLists.txt
++++ b/lldb/source/Utility/CMakeLists.txt
+@@ -19,6 +19,10 @@ if (CMAKE_SYSTEM_NAME MATCHES "Windows")
+   list(APPEND LLDB_SYSTEM_LIBS ws2_32 rpcrt4)
+ endif ()
+=20
++if (CMAKE_SYSTEM_PROCESSOR MATCHES "i686" AND CMAKE_SYSTEM_NAME MATCHES "=
Linux")
++    list(APPEND LLDB_SYSTEM_LIBS atomic)
++endif()
++
+ if (NOT HAVE_CXX_ATOMICS64_WITHOUT_LIB )
+     list(APPEND LLDB_SYSTEM_LIBS atomic)
+ endif()
diff --git a/meta/recipes-devtools/clang/clang/0027-compiler-rt-Enable-__in=
t128-for-ppc32.patch b/meta/recipes-devtools/clang/clang/0027-compiler-rt-E=
nable-__int128-for-ppc32.patch
new file mode 100644
index 00000000000..bbccb8a71cd
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0027-compiler-rt-Enable-__int128-fo=
r-ppc32.patch
@@ -0,0 +1,73 @@
+From a92ea48f1959a20ab58b88091127f80a90d5870a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 9 Mar 2022 16:28:16 -0800
+Subject: [PATCH] compiler-rt: Enable __int128 for ppc32
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/builtins/CMakeLists.txt | 15 +++++++--------
+ compiler-rt/lib/builtins/int_types.h    |  2 +-
+ 2 files changed, 8 insertions(+), 9 deletions(-)
+
+diff --git a/compiler-rt/lib/builtins/CMakeLists.txt b/compiler-rt/lib/bui=
ltins/CMakeLists.txt
+index e0b2d08c2077..1b245fd5deeb 100644
+--- a/compiler-rt/lib/builtins/CMakeLists.txt
++++ b/compiler-rt/lib/builtins/CMakeLists.txt
+@@ -710,11 +710,9 @@ set(mips64el_SOURCES ${GENERIC_TF_SOURCES}
+=20
+ set(nvptx64_SOURCES ${GENERIC_SOURCES})
+=20
+-set(powerpc_SOURCES ${GENERIC_SOURCES})
+-
+ set(powerpcspe_SOURCES ${GENERIC_SOURCES})
+=20
+-set(powerpc64_SOURCES
++set(powerpc_SOURCES
+   ppc/divtc3.c
+   ppc/fixtfdi.c
+   ppc/fixunstfdi.c
+@@ -729,14 +727,15 @@ set(powerpc64_SOURCES
+ )
+ # These routines require __int128, which isn't supported on AIX.
+ if (NOT OS_NAME MATCHES "AIX")
+-  set(powerpc64_SOURCES
++  set(powerpc_SOURCES
+     ppc/floattitf.c
+     ppc/fixtfti.c
+     ppc/fixunstfti.c
+-    ${powerpc64_SOURCES}
++    ${powerpc_SOURCES}
+   )
+ endif()
+-set(powerpc64le_SOURCES ${powerpc64_SOURCES})
++set(powerpc64le_SOURCES ${powerpc_SOURCES})
++set(powerpc64_SOURCES ${powerpc_SOURCES})
+=20
+ set(riscv_SOURCES
+   riscv/fp_mode.c
+@@ -888,9 +887,9 @@ else ()
+         list(APPEND BUILTIN_CFLAGS_${arch} -fomit-frame-pointer -DCOMPILE=
R_RT_ARMHF_TARGET)
+       endif()
+=20
+-      # For RISCV32, we must force enable int128 for compiling long
++      # For RISCV32/PPC32, we must force enable int128 for compiling long
+       # double routines.
+-      if(COMPILER_RT_ENABLE_SOFTWARE_INT128 OR "${arch}" STREQUAL "riscv3=
2")
++      if(COMPILER_RT_ENABLE_SOFTWARE_INT128 OR "${arch}" STREQUAL "riscv3=
2" OR "${arch}" STREQUAL "powerpc")
+         list(APPEND BUILTIN_CFLAGS_${arch} -fforce-enable-int128)
+       endif()
+=20
+diff --git a/compiler-rt/lib/builtins/int_types.h b/compiler-rt/lib/builti=
ns/int_types.h
+index 48862f364217..cc47d3e33f67 100644
+--- a/compiler-rt/lib/builtins/int_types.h
++++ b/compiler-rt/lib/builtins/int_types.h
+@@ -64,7 +64,7 @@ typedef union {
+ } udwords;
+=20
+ #if defined(__LP64__) || defined(__wasm__) || defined(__mips64) ||       =
      \
+-    defined(__SIZEOF_INT128__) || defined(_WIN64)
++    defined(__SIZEOF_INT128__) || defined(_WIN64) || defined(__powerpc__)
+ #define CRT_HAS_128BIT
+ #endif
+=20
diff --git a/meta/recipes-devtools/clang/clang/0028-llvm-Do-not-use-cmake-i=
nfra-to-detect-libzstd.patch b/meta/recipes-devtools/clang/clang/0028-llvm-=
Do-not-use-cmake-infra-to-detect-libzstd.patch
new file mode 100644
index 00000000000..8c56c1de5aa
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0028-llvm-Do-not-use-cmake-infra-to=
-detect-libzstd.patch
@@ -0,0 +1,62 @@
+From e06415c9d95a4830b61a21d2a9b159145c0a46f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 12 Aug 2022 11:50:57 -0700
+Subject: [PATCH] llvm: Do not use cmake infra to detect libzstd
+
+OE's version is build using plain make not cmake as a result we do not
+have the cmake support files and this probing method can get this info
+from build host and force linking with libzstd from /usr/lib which is
+not what we want when cross building.
+
+Fixes errors building llvm-config like
+/usr/lib/libzstd.so.1.5.2: error adding symbols: file in wrong
+format
+| clang-15: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
+| ninja: build stopped: subcommand failed.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/lib/Support/CMakeLists.txt | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/llvm/lib/Support/CMakeLists.txt b/llvm/lib/Support/CMakeLists=
.txt
+index f653379e3033..6456caff9dff 100644
+--- a/llvm/lib/Support/CMakeLists.txt
++++ b/llvm/lib/Support/CMakeLists.txt
+@@ -22,7 +22,7 @@ if (HAS_WERROR_GLOBAL_CTORS)
+ endif()
+=20
+ if(LLVM_ENABLE_ZLIB)
+-  list(APPEND imported_libs ZLIB::ZLIB)
++  list(APPEND imported_libs z)
+ endif()
+=20
+ if(LLVM_ENABLE_ZSTD)
+@@ -34,7 +34,7 @@ if(LLVM_ENABLE_ZSTD)
+ endif()
+=20
+ if(LLVM_ENABLE_ZSTD)
+-  list(APPEND imported_libs ${zstd_target})
++  list(APPEND imported_libs zstd)
+ endif()
+=20
+ if( WIN32 )
+@@ -310,7 +310,7 @@ if(LLVM_ENABLE_ZLIB)
+     get_property(zlib_library TARGET ZLIB::ZLIB PROPERTY LOCATION)
+   endif()
+   get_library_name(${zlib_library} zlib_library)
+-  set(llvm_system_libs ${llvm_system_libs} "${zlib_library}")
++  set(llvm_system_libs ${llvm_system_libs} z)
+ endif()
+=20
+ if(LLVM_ENABLE_ZSTD)
+@@ -324,7 +324,7 @@ if(LLVM_ENABLE_ZSTD)
+   endif()
+   if (zstd_target STREQUAL zstd::libzstd_shared)
+     get_library_name(${zstd_library} zstd_library)
+-    set(llvm_system_libs ${llvm_system_libs} "${zstd_library}")
++    set(llvm_system_libs ${llvm_system_libs} zstd)
+   else()
+     set(llvm_system_libs ${llvm_system_libs} "${zstd_STATIC_LIBRARY}")
+   endif()
diff --git a/meta/recipes-devtools/clang/clang/0029-compiler-rt-Fix-stat-st=
ruct-s-size-for-O32-ABI.patch b/meta/recipes-devtools/clang/clang/0029-comp=
iler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch
new file mode 100644
index 00000000000..674cbe52293
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0029-compiler-rt-Fix-stat-struct-s-=
size-for-O32-ABI.patch
@@ -0,0 +1,44 @@
+From a1729e842b825919a8efe0389aa2b0f0c16a2924 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Jan 2023 18:44:34 -0800
+Subject: [PATCH] compiler-rt: Fix stat struct's size for O32 ABI
+
+stat struct size differs on glibc based on ABI choices e.g. 64bit off_t
+and/or 64bit time_t will make this size different. Therefore separate
+out the O32 case out, makes it more readable.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../sanitizer_platform_limits_posix.h               | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_po=
six.h b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
+index 34bfef1f7ef4..0ba5451c1ccf 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform_limits_posix.h
+@@ -98,11 +98,24 @@ const unsigned struct_kernel_stat64_sz =3D 104;
+ const unsigned struct_kernel_stat_sz =3D 144;
+ const unsigned struct_kernel_stat64_sz =3D 104;
+ #elif defined(__mips__)
++#if defined(__mips_o32) // O32 ABI
++#if _TIME_BITS =3D=3D 64
++const unsigned struct_kernel_stat_sz =3D 112;
++const unsigned struct_kernel_stat64_sz =3D 112;
++#elif _FILE_OFFSET_BITS =3D=3D 64
++const unsigned struct_kernel_stat_sz =3D 160;
++const unsigned struct_kernel_stat64_sz =3D 160;
++#else
++const unsigned struct_kernel_stat_sz =3D 144;
++const unsigned struct_kernel_stat64_sz =3D 160;
++#endif
++#else // __mips_o32
+ const unsigned struct_kernel_stat_sz =3D
+     SANITIZER_ANDROID
+         ? FIRST_32_SECOND_64(104, 128)
+         : FIRST_32_SECOND_64((_MIPS_SIM =3D=3D _ABIN32) ? 176 : 160, 216);
+ const unsigned struct_kernel_stat64_sz =3D 104;
++#endif
+ #elif defined(__s390__) && !defined(__s390x__)
+ const unsigned struct_kernel_stat_sz =3D 64;
+ const unsigned struct_kernel_stat64_sz =3D 104;
diff --git a/meta/recipes-devtools/clang/clang/0030-compiler-rt-Undef-_TIME=
_BITS-along-with-_FILE_OFFSET.patch b/meta/recipes-devtools/clang/clang/003=
0-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch
new file mode 100644
index 00000000000..1c5e1adb4cd
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0030-compiler-rt-Undef-_TIME_BITS-a=
long-with-_FILE_OFFSET.patch
@@ -0,0 +1,43 @@
+From dbf32edb06caeed5324edfb13bc42bf8fc1406a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 Feb 2023 12:46:10 -0800
+Subject: [PATCH] compiler-rt: Undef _TIME_BITS along with _FILE_OFFSET_BIT=
S in
+ sanitizers
+
+On 32bit systems using 64bit time_t build fails because
+_FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
+
+Fixes
+In file included from compiler-rt/lib/sanitizer_common/sanitizer_procmaps_=
solaris.cpp:17:
+In file included from compiler-rt/lib/sanitizer_common/sanitizer_platform.=
h:25:
+In file included from /usr/include/features.h:393:
+/usr/include/features-time64.h:26:5: error: "_TIME_BITS=3D64 is allowed on=
ly with _FILE_OFFSET_BITS=3D64"
+    ^
+1 error generated.
+
+Upstream-Status: Submitted [https://reviews.llvm.org/D144514]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/sanitizer_common/sanitizer_platform.h | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h b/compi=
ler-rt/lib/sanitizer_common/sanitizer_platform.h
+index 57966403c92a..efa83f30eca0 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_platform.h
+@@ -22,6 +22,15 @@
+ // function declarations into a .S file which doesn't compile.
+ // https://crbug.com/1162741
+ #if __has_include(<features.h>) && !defined(__ANDROID__)
++// Some sources undefine _FILE_OFFSET_BITS deliberately e.g.
++// sanitizer_procmaps_solaris.cpp. This is problematic on glibc systems w=
ith
++// 32-bit architectures using 64-bit time_t and users passing _TIME_BITS=
=3D64
++// from build environment, therefore both _FILE_OFFSET_BITS and _TIME_BITS
++// need to be undefined together since features.h will check for both bei=
ng 64
++// if one is set to 64.
++#  if !defined(_FILE_OFFSET_BITS)
++#    undef _TIME_BITS
++#  endif
+ #  include <features.h>
+ #endif
+=20
diff --git a/meta/recipes-devtools/clang/clang/0031-ToolChains-Gnu.cpp-ARML=
ibDirs-search-also-in-lib32.patch b/meta/recipes-devtools/clang/clang/0031-=
ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch
new file mode 100644
index 00000000000..48e3d7a3513
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0031-ToolChains-Gnu.cpp-ARMLibDirs-=
search-also-in-lib32.patch
@@ -0,0 +1,81 @@
+From ac240fbfa07115791271abdbfde256ea0f0c64c6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 31 Aug 2023 18:14:47 +0200
+Subject: [PATCH] ToolChains/Gnu.cpp: ARMLibDirs search also in lib32
+
+* in some strange multilib configs we build lib32-image where
+  32bit libs are in /usr/lib32 and 64bit in /usr/lib64 but in such
+  setup the clang search for GCC candidate installation doesn't
+  check lib32 directory in sysroot and fails to find the installation
+
+  X86LibDirs was already searching in lib32 for very long time:
+  https://github.com/llvm/llvm-project/commit/621fed5f5a051a0333415aaed75b=
8f2ed2350dbd
+  but ARMLibDirs didn't include it for some reason.
+
+* if we don't add lib32 for arm in getOSLibDir(), then it will
+  find -lgcc, crtbeginS.o, crtendS.o, but still fail to find
+  -lgcc_s, -lc, Scrt1.o, crti.o, crtn.o
+
+* fixes lib32-compiler-rt build failure:
+
+-- Configuring incomplete, errors occurred!
+CMake Error at TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/l=
ib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/share/cmake-3.26/Modules/=
CMakeTestCCompiler.cmake:67 (message):
+  The C compiler
+
+    "TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compi=
ler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm=
-oemllib32-linux-gnueabi-clang"
+
+  is not able to compile a simple test program.
+
+  It fails with the following output:
+
+    Change Dir: TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/=
lib32-compiler-rt/16.0.6/build/CMakeFiles/CMakeScratch/TryCompile-rWXyQZ
+
+    Run Build Command(s):ninja -v cmTC_84d18 && [1/2] TOPDIR/BUILD/work/ra=
spberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysro=
ot-native/usr/bin/arm-oemllib32-linux-gnueabi/arm-oemllib32-linux-gnueabi-c=
lang --target=3Darm-oemllib32-linux-gnueabi --sysroot=3DTOPDIR/BUILD/work/r=
aspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recip=
e-sysroot   -target arm-oemllib32-linux-gnueabi  -march=3Darmv7ve -mthumb -=
mfpu=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -mlittle-endian --dyld-prefix=3D/usr=
 -Qunused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIF=
Y_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=
=3Dreturn-type -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3DTOPD=
IR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.=
0.6/lib32-recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types   -fm=
acro-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/gi=
t=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR=
/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32=
-compiler-rt/16.0.6-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4=
_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug=
/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspbe=
rrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src=
/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/=
raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-reci=
pe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemll=
ib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebu=
g-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/li=
b32-compiler-rt/16.0.6/recipe-sysroot-native=3D    -fPIE -MD -MT CMakeFiles=
/cmTC_84d18.dir/testCCompiler.c.o -MF CMakeFiles/cmTC_84d18.dir/testCCompil=
er.c.o.d -o CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -c TOPDIR/BUILD/wor=
k/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build/CM=
akeFiles/CMakeScratch/TryCompile-rWXyQZ/testCCompiler.c
+    [2/2] : && TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/l=
ib32-compiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-g=
nueabi/arm-oemllib32-linux-gnueabi-clang --target=3Darm-oemllib32-linux-gnu=
eabi --sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/=
lib32-compiler-rt/16.0.6/lib32-recipe-sysroot -target arm-oemllib32-linux-g=
nueabi  -march=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -m=
little-endian --dyld-prefix=3D/usr -Qunused-arguments -funwind-tables -fsta=
ck-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -=
Werror=3Dformat-security -Werror=3Dreturn-type -D_TIME_BITS=3D64 -D_FILE_OF=
FSET_BITS=3D64  --sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-lin=
ux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -O2 -pipe -g -fel=
iminate-unused-debug-types   -fmacro-prefix-map=3DTOPDIR/BUILD/work-shared/=
llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6=
-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0=
.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=
=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler=
-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-pref=
ix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-co=
mpiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebu=
g-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/li=
b32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR=
/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.=
6/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberry=
pi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-nati=
ve=3D -target arm-oemllib32-linux-gnueabi  -march=3Darmv7ve -mthumb -mfpu=
=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -mlittle-endian --dyld-prefix=3D/usr -Qu=
nused-arguments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SO=
URCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dret=
urn-type -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3DTOPDIR/BUI=
LD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/li=
b32-recipe-sysroot  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -fmacr=
o-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=
=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/=
BUILD/work-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-=
compiler-rt/16.0.6-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_=
64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/=
lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspber=
rypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/=
debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/r=
aspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recip=
e-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemlli=
b32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebug=
-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib=
32-compiler-rt/16.0.6/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now -unwind=
lib=3Dlibgcc -rtlib=3Dlibgcc -stdlib=3Dlibstdc++   -fuse-ld=3Dlld -Wl,-O1 -=
Wl,--hash-style=3Dgnu -Wl,--as-needed   -fmacro-prefix-map=3DTOPDIR/BUILD/w=
ork-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compile=
r-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-=
source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-=
prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib3=
2-compiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -f=
debug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueab=
i/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-=
r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-=
gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-ma=
p=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compile=
r-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work=
/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sy=
sroot-native=3D  -Wl,-z,relro,-z,now -unwindlib=3Dlibgcc -rtlib=3Dlibgcc -s=
tdlib=3Dlibstdc++   -fuse-ld=3Dlld CMakeFiles/cmTC_84d18.dir/testCCompiler.=
c.o -o cmTC_84d18   && :
+    FAILED: cmTC_84d18
+    : && TOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-c=
ompiler-rt/16.0.6/recipe-sysroot-native/usr/bin/arm-oemllib32-linux-gnueabi=
/arm-oemllib32-linux-gnueabi-clang --target=3Darm-oemllib32-linux-gnueabi -=
-sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-=
compiler-rt/16.0.6/lib32-recipe-sysroot -target arm-oemllib32-linux-gnueabi=
  -march=3Darmv7ve -mthumb -mfpu=3Dneon-vfpv4 -mfloat-abi=3Dsoftfp -mlittle=
-endian --dyld-prefix=3D/usr -Qunused-arguments -funwind-tables -fstack-pro=
tector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=
=3Dformat-security -Werror=3Dreturn-type -D_TIME_BITS=3D64 -D_FILE_OFFSET_B=
ITS=3D64  --sysroot=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnu=
eabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot  -O2 -pipe -g -feliminat=
e-unused-debug-types   -fmacro-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-p=
roject-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -=
fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/=
git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-map=3DTOPD=
IR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.=
0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=
=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler=
-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-pref=
ix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-co=
mpiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDIR/BUILD=
/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib3=
2-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64=
-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-native=3D =
-target arm-oemllib32-linux-gnueabi  -march=3Darmv7ve -mthumb -mfpu=3Dneon-=
vfpv4 -mfloat-abi=3Dsoftfp -mlittle-endian --dyld-prefix=3D/usr -Qunused-ar=
guments -funwind-tables -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2=
 -Wformat -Wformat-security -Werror=3Dformat-security -Werror=3Dreturn-type=
 -D_TIME_BITS=3D64 -D_FILE_OFFSET_BITS=3D64  --sysroot=3DTOPDIR/BUILD/work/=
raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-reci=
pe-sysroot  -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed   -fmacro-prefix=
-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16.0.6-r0/git=3D/usr/sr=
c/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work=
-shared/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-r=
t/16.0.6-r0  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib=
32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/lib32-comp=
iler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-o=
emllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/build=3D/usr/src/debug/lib3=
2-compiler-rt/16.0.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi=
4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=
=3D  -fmacro-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux=
-gnueabi/lib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fdebug-prefix-m=
ap=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compil=
er-rt/16.0.6/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now -unwindlib=3Dlib=
gcc -rtlib=3Dlibgcc -stdlib=3Dlibstdc++   -fuse-ld=3Dlld -Wl,-O1 -Wl,--hash=
-style=3Dgnu -Wl,--as-needed   -fmacro-prefix-map=3DTOPDIR/BUILD/work-share=
d/llvm-project-source-16.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0=
.6-r0  -fdebug-prefix-map=3DTOPDIR/BUILD/work-shared/llvm-project-source-16=
.0.6-r0/git=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fmacro-prefix-ma=
p=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compile=
r-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdebug-pre=
fix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-c=
ompiler-rt/16.0.6/build=3D/usr/src/debug/lib32-compiler-rt/16.0.6-r0  -fdeb=
ug-prefix-map=3DTOPDIR/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/l=
ib32-compiler-rt/16.0.6/lib32-recipe-sysroot=3D  -fmacro-prefix-map=3DTOPDI=
R/BUILD/work/raspberrypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0=
.6/lib32-recipe-sysroot=3D  -fdebug-prefix-map=3DTOPDIR/BUILD/work/raspberr=
ypi4_64-oemllib32-linux-gnueabi/lib32-compiler-rt/16.0.6/recipe-sysroot-nat=
ive=3D  -Wl,-z,relro,-z,now -unwindlib=3Dlibgcc -rtlib=3Dlibgcc -stdlib=3Dl=
ibstdc++   -fuse-ld=3Dlld CMakeFiles/cmTC_84d18.dir/testCCompiler.c.o -o cm=
TC_84d18   && :
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open Scrt1.o: No suc=
h file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crti.o: No such=
 file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtbeginS.o: No=
 such file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgc=
c_s
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgcc
+    arm-oemllib32-linux-gnueabi-ld.lld: error: unable to find library -lgc=
c_s
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtendS.o: No s=
uch file or directory
+    arm-oemllib32-linux-gnueabi-ld.lld: error: cannot open crtn.o: No such=
 file or directory
+    clang-16: error: linker command failed with exit code 1 (use -v to see=
 invocation)
+    ninja: build stopped: subcommand failed.
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 2 +-
+ clang/lib/Driver/ToolChains/Linux.cpp | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index 4ec4976a6a0c..d5cfb99686d1 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2475,7 +2475,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(
+   static const char *const AArch64beLibDirs[] =3D {"/lib"};
+   static const char *const AArch64beTriples[] =3D {"aarch64_be-none-linux=
-gnu"};
+=20
+-  static const char *const ARMLibDirs[] =3D {"/lib"};
++  static const char *const ARMLibDirs[] =3D {"/lib", "/lib32"};
+   static const char *const ARMTriples[] =3D {"arm-linux-gnueabi"};
+   static const char *const ARMHFTriples[] =3D {"arm-linux-gnueabihf",
+                                              "armv7hl-redhat-linux-gnueab=
i",
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 9af52769b09a..33e8ae99ba1d 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -205,6 +205,7 @@ static StringRef getOSLibDir(const llvm::Triple &Tripl=
e, const ArgList &Args) {
+   // reasoning about oslibdir spellings with the lib dir spellings in the
+   // GCCInstallationDetector, but that is a more significant refactoring.
+   if (Triple.getArch() =3D=3D llvm::Triple::x86 || Triple.isPPC32() ||
++      Triple.getArch() =3D=3D llvm::Triple::arm || Triple.getArch() =3D=
=3D llvm::Triple::thumb ||
+       Triple.getArch() =3D=3D llvm::Triple::sparc)
+     return "lib32";
+=20
diff --git a/meta/recipes-devtools/clang/clang/0032-clang-llvm-Add-OE-speci=
fic-ABI-triple-for-N32-ABI.patch b/meta/recipes-devtools/clang/clang/0032-c=
lang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch
new file mode 100644
index 00000000000..019ed3d2d00
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0032-clang-llvm-Add-OE-specific-ABI=
-triple-for-N32-ABI.patch
@@ -0,0 +1,78 @@
+From 05d5bc0e32b8275f91421b24fc86494b9e81815d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Feb 2024 16:47:10 -0800
+Subject: [PATCH] clang/llvm: Add OE specific ABI triple for N32 ABI
+
+Its gnun32 when using OE
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ clang/lib/Driver/ToolChains/Gnu.cpp   | 1 +
+ clang/lib/Driver/ToolChains/Linux.cpp | 4 ++--
+ llvm/lib/TargetParser/Triple.cpp      | 4 +++-
+ 3 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/clang/lib/Driver/ToolChains/Gnu.cpp b/clang/lib/Driver/ToolCh=
ains/Gnu.cpp
+index d5cfb99686d1..926455ac6680 100644
+--- a/clang/lib/Driver/ToolChains/Gnu.cpp
++++ b/clang/lib/Driver/ToolChains/Gnu.cpp
+@@ -2538,6 +2538,7 @@ void Generic_GCC::GCCInstallationDetector::AddDefaul=
tGCCPrefixes(
+=20
+   static const char *const MIPSN32LibDirs[] =3D {"/lib32"};
+   static const char *const MIPSN32Triples[] =3D {"mips64-linux-gnuabin32",
++                                               "mips64-linux-gnun32",
+                                                "mipsisa64r6-linux-gnuabin=
32"};
+   static const char *const MIPSN32ELLibDirs[] =3D {"/lib32"};
+   static const char *const MIPSN32ELTriples[] =3D {
+diff --git a/clang/lib/Driver/ToolChains/Linux.cpp b/clang/lib/Driver/Tool=
Chains/Linux.cpp
+index 33e8ae99ba1d..58badf20d1b3 100644
+--- a/clang/lib/Driver/ToolChains/Linux.cpp
++++ b/clang/lib/Driver/ToolChains/Linux.cpp
+@@ -136,7 +136,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+     return IsMipsR6 ? "mipsisa32r6el-linux-gnu" : "mipsel-linux-gnu";
+   case llvm::Triple::mips64: {
+     std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6" : "mips64") +
+-                     "-linux-" + (IsMipsN32Abi ? "gnuabin32" : "gnuabi64"=
);
++                     "-linux-" + (IsMipsN32Abi ? "gnun32" : "gnu");
+     if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
+       return MT;
+     if (D.getVFS().exists(concat(SysRoot, "/lib/mips64-linux-gnu")))
+@@ -145,7 +145,7 @@ std::string Linux::getMultiarchTriple(const Driver &D,
+   }
+   case llvm::Triple::mips64el: {
+     std::string MT =3D std::string(IsMipsR6 ? "mipsisa64r6el" : "mips64el=
") +
+-                     "-linux-" + (IsMipsN32Abi ? "gnuabin32" : "gnuabi64"=
);
++                     "-linux-" + (IsMipsN32Abi ? "gnun32" : "gnu");
+     if (D.getVFS().exists(concat(SysRoot, "/lib", MT)))
+       return MT;
+     if (D.getVFS().exists(concat(SysRoot, "/lib/mips64el-linux-gnu")))
+diff --git a/llvm/lib/TargetParser/Triple.cpp b/llvm/lib/TargetParser/Trip=
le.cpp
+index 32adf92c47bf..3411e3c968a2 100644
+--- a/llvm/lib/TargetParser/Triple.cpp
++++ b/llvm/lib/TargetParser/Triple.cpp
+@@ -319,7 +319,7 @@ StringRef Triple::getEnvironmentTypeName(EnvironmentTy=
pe Kind) {
+   case GNU: return "gnu";
+   case GNUT64: return "gnut64";
+   case GNUABI64: return "gnuabi64";
+-  case GNUABIN32: return "gnuabin32";
++  case GNUABIN32: return "gnun32";
+   case GNUEABI: return "gnueabi";
+   case GNUEABIT64: return "gnueabit64";
+   case GNUEABIHF: return "gnueabihf";
+@@ -695,6 +695,7 @@ static Triple::EnvironmentType parseEnvironment(String=
Ref EnvironmentName) {
+       .StartsWith("eabihf", Triple::EABIHF)
+       .StartsWith("eabi", Triple::EABI)
+       .StartsWith("gnuabin32", Triple::GNUABIN32)
++      .StartsWith("gnun32", Triple::GNUABIN32)
+       .StartsWith("gnuabi64", Triple::GNUABI64)
+       .StartsWith("gnueabihft64", Triple::GNUEABIHFT64)
+       .StartsWith("gnueabihf", Triple::GNUEABIHF)
+@@ -1002,6 +1003,7 @@ Triple::Triple(const Twine &Str)
+       Environment =3D
+           StringSwitch<Triple::EnvironmentType>(Components[0])
+               .StartsWith("mipsn32", Triple::GNUABIN32)
++              .StartsWith("mips64-n32", Triple::GNUABIN32)
+               .StartsWith("mips64", Triple::GNUABI64)
+               .StartsWith("mipsisa64", Triple::GNUABI64)
+               .StartsWith("mipsisa32", Triple::GNU)
diff --git a/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.i=
n-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0033-ll=
vm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
new file mode 100644
index 00000000000..97554cbda1a
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0033-llvm-Add-libunwind.pc.in-and-l=
lvm-config-scripts.patch
@@ -0,0 +1,90 @@
+From a1b090d189ebc5ccda088f222a927fb6e225588d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 14 May 2024 22:04:43 -0700
+Subject: [PATCH] llvm: Add libunwind.pc.in and llvm-config scripts
+
+These are added by OE project
+
+Upstream-Status: Inappropriate [ OE-Specific ]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libunwind/libunwind.pc.in          |  9 ++++++
+ llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
+ 2 files changed, 61 insertions(+)
+ create mode 100644 libunwind/libunwind.pc.in
+ create mode 100644 llvm/tools/llvm-config/llvm-config
+
+diff --git a/libunwind/libunwind.pc.in b/libunwind/libunwind.pc.in
+new file mode 100644
+index 000000000000..a93d676604f9
+--- /dev/null
++++ b/libunwind/libunwind.pc.in
+@@ -0,0 +1,9 @@
++prefix=3D/usr
++exec_prefix=3D/usr
++libdir=3D@LIBDIR@
++includedir=3D/usr/include
++
++Name: libunwind
++Description: libunwind base library
++Version: @VERSION@
++Libs: -lunwind
+diff --git a/llvm/tools/llvm-config/llvm-config b/llvm/tools/llvm-config/l=
lvm-config
+new file mode 100644
+index 000000000000..6a0dd54b8eab
+--- /dev/null
++++ b/llvm/tools/llvm-config/llvm-config
+@@ -0,0 +1,52 @@
++#!/bin/bash
++#
++# Wrapper script for llvm-config. Supplies the right environment variables
++# for the target and delegates to the native llvm-config for anything els=
e. This
++# is needed because arguments like --ldflags, --cxxflags, etc. are set by=
 the
++# native compile rather than the target compile.
++#
++SCRIPT_DIR=3D"$(dirname "$(readlink -f "$0")")"
++NEXT_LLVM_CONFIG=3D"$(which -a llvm-config | sed -n 2p)"
++export YOCTO_ALTERNATE_EXE_PATH=3D"${YOCTO_ALTERNATE_EXE_PATH:=3D"$(readl=
ink -f "$SCRIPT_DIR/../llvm-config")"}"
++if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
++    export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERNATE_LIBDIR:=3D"/lib64"=
}"
++else
++    export YOCTO_ALTERNATE_LIBDIR=3D"${YOCTO_ALTERNATE_LIBDIR:=3D"/lib"}"
++fi
++if [[ $# =3D=3D 0 ]]; then
++  exec "$NEXT_LLVM_CONFIG"
++fi
++
++remain=3D""
++output=3D""
++for arg in "$@"; do
++  case "$arg" in
++    --cppflags)
++      output=3D"${output} ${CPPFLAGS}"
++      ;;
++    --cflags)
++      output=3D"${output} ${CFLAGS}"
++      ;;
++    --cxxflags)
++      output=3D"${output} ${CXXFLAGS}"
++      ;;
++    --ldflags)
++      output=3D"${output} ${LDFLAGS}"
++      ;;
++    --shared-mode)
++      output=3D"${output} shared"
++      ;;
++    --link-shared)
++      break
++      ;;
++    *)
++      remain=3D"${remain} ${arg}"
++      ;;
++  esac
++done
++
++if [ "${remain}" !=3D "" ]; then
++      output=3D"${output} "$("$NEXT_LLVM_CONFIG" ${remain})
++fi
++
++echo "${output}"
diff --git a/meta/recipes-devtools/clang/clang/0034-scan-build-py-respect-L=
LVM_LIBDIR_SUFFIX-like-other-.patch b/meta/recipes-devtools/clang/clang/003=
4-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch
new file mode 100644
index 00000000000..0eebe63721a
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0034-scan-build-py-respect-LLVM_LIB=
DIR_SUFFIX-like-other-.patch
@@ -0,0 +1,92 @@
+From 47a9749e0dcd1c7dd85922610434ce63d5fe8bd6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Fri, 13 Sep 2024 13:38:08 +0200
+Subject: [PATCH] scan-build-py: respect LLVM_LIBDIR_SUFFIX like other tool=
s do
+
+* other libraries are installed in 'lib64' or 'lib32' based on
+  LLVM_LIBDIR_SUFFIX value, but libscanbuild files were always
+  installed in 'lib'
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/1085=
49]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ clang/tools/scan-build-py/CMakeLists.txt | 38 ++++++++++++------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/clang/tools/scan-build-py/CMakeLists.txt b/clang/tools/scan-b=
uild-py/CMakeLists.txt
+index 9273eb5ed977..9033786d2da5 100644
+--- a/clang/tools/scan-build-py/CMakeLists.txt
++++ b/clang/tools/scan-build-py/CMakeLists.txt
+@@ -77,52 +77,52 @@ foreach(lib ${LibExecs})
+ endforeach()
+=20
+ foreach(lib ${LibScanbuild})
+-  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib}
++  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/=
libscanbuild/${lib}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libsc=
anbuild
+                      COMMAND ${CMAKE_COMMAND} -E copy
+                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/${lib}
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libsc=
anbuild/
+                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild=
/${lib})
+-  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/${lib})
++  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libsca=
nbuild/${lib})
+   install(FILES lib/libscanbuild/${lib}
+-          DESTINATION lib/libscanbuild
++          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild
+           COMPONENT scan-build-py)
+ endforeach()
+=20
+ foreach(resource ${LibScanbuildResources})
+-  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libscanbuild/resource=
s/${resource}
++  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/=
libscanbuild/resources/${resource}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libsc=
anbuild
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libsc=
anbuild/resources
+                      COMMAND ${CMAKE_COMMAND} -E copy
+                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild/resou=
rces/${resource}
+-                       ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libsc=
anbuild/resources
+                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libscanbuild=
/resources/${resource})
+-  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libscanbuild/resources/${re=
source})
++  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libsca=
nbuild/resources/${resource})
+   install(FILES lib/libscanbuild/resources/${resource}
+-          DESTINATION lib/libscanbuild/resources
++          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libscanbuild/resources
+           COMPONENT scan-build-py)
+ endforeach()
+=20
+ foreach(lib ${LibEar})
+-  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/libear/${lib}
++  add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/=
libear/${lib}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}
+                      COMMAND ${CMAKE_COMMAND} -E make_directory
+-                       ${CMAKE_BINARY_DIR}/lib/libear
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear
+                      COMMAND ${CMAKE_COMMAND} -E copy
+                        ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib}
+-                       ${CMAKE_BINARY_DIR}/lib/libear/
++                       ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libea=
r/
+                      DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/lib/libear/${lib=
})
+-  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib/libear/${lib})
++  list(APPEND Depends ${CMAKE_BINARY_DIR}/lib${LLVM_LIBDIR_SUFFIX}/libear=
/${lib})
+   install(FILES lib/libear/${lib}
+-          DESTINATION lib/libear
++          DESTINATION lib${LLVM_LIBDIR_SUFFIX}/libear
+           COMPONENT scan-build-py)
+ endforeach()
+=20
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtoo=
ls/clang/clang_git.bb
new file mode 100644
index 00000000000..c2b6f272d8f
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -0,0 +1,463 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "LLVM based C/C++ compiler"
+HOMEPAGE =3D "http://clang.llvm.org/"
+SECTION =3D "devel"
+
+require clang.inc
+require common-source.inc
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+BUILD_CC:class-nativesdk =3D "clang"
+BUILD_CXX:class-nativesdk =3D "clang++"
+BUILD_AR:class-nativesdk =3D "llvm-ar"
+BUILD_RANLIB:class-nativesdk =3D "llvm-ranlib"
+BUILD_NM:class-nativesdk =3D "llvm-nm"
+
+BUILDSDK_CPPFLAGS:append:class-nativesdk =3D "${@oe.utils.vartrue('DEBUG_B=
UILD', ' -Wno-error=3Dunused-command-line-argument', '', d)}"
+
+LDFLAGS:remove:class-nativesdk =3D "-fuse-ld=3Dlld"
+
+LDFLAGS:append:class-target:riscv32 =3D " -Wl,--no-as-needed -latomic -Wl,=
--as-needed"
+LDFLAGS:append:class-target:mips =3D " -Wl,--no-as-needed -latomic -Wl,--a=
s-needed"
+
+inherit cmake cmake-native pkgconfig python3native python3targetconfig
+
+OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
+
+def get_clang_arch(bb, d, arch_var):
+    import re
+    a =3D d.getVar(arch_var)
+    if   re.match('(i.86|athlon|x86.64)$', a):         return 'X86'
+    elif re.match('arm$', a):                          return 'ARM'
+    elif re.match('armeb$', a):                        return 'ARM'
+    elif re.match('aarch64$', a):                      return 'AArch64'
+    elif re.match('aarch64_be$', a):                   return 'AArch64'
+    elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
+    elif re.match('riscv32$', a):                      return 'riscv32'
+    elif re.match('riscv64$', a):                      return 'riscv64'
+    elif re.match('p(pc|owerpc)(|64)', a):             return 'PowerPC'
+    elif re.match('loongarch64$', a):                  return 'loongarch64'
+    else:
+        bb.note("'%s' is not a primary llvm architecture" % a)
+    return ""
+
+def get_clang_host_arch(bb, d):
+    return get_clang_arch(bb, d, 'HOST_ARCH')
+
+def get_clang_target_arch(bb, d):
+    return get_clang_arch(bb, d, 'TARGET_ARCH')
+
+PACKAGECONFIG_CLANG_COMMON =3D "build-id eh libedit rtti shared-libs \
+                              ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm=
', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
+                              "
+
+PACKAGECONFIG ??=3D "compiler-rt libcplusplus lldb-wchar terminfo \
+                   ${PACKAGECONFIG_CLANG_COMMON} \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'lto thin-lto', d=
)} \
+                   "
+PACKAGECONFIG:class-native =3D "clangd \
+                              ${PACKAGECONFIG_CLANG_COMMON} \
+                              "
+PACKAGECONFIG:class-nativesdk =3D "clangd \
+                                 ${PACKAGECONFIG_CLANG_COMMON} \
+                                 ${@bb.utils.filter('DISTRO_FEATURES', 'lt=
o thin-lto', d)} \
+                                 "
+
+PACKAGECONFIG[bootstrap] =3D "-DCLANG_ENABLE_BOOTSTRAP=3DOn -DCLANG_BOOTST=
RAP_PASSTHROUGH=3D'${PASSTHROUGH}' -DBOOTSTRAP_LLVM_ENABLE_LTO=3DThin -DBOO=
TSTRAP_LLVM_ENABLE_LLD=3DON,,,"
+PACKAGECONFIG[build-id] =3D "-DENABLE_LINKER_BUILD_ID=3DON,-DENABLE_LINKER=
_BUILD_ID=3DOFF,,"
+PACKAGECONFIG[clangd] =3D "-DCLANG_ENABLE_CLANGD=3DON,-DCLANG_ENABLE_CLANG=
D=3DOFF,,"
+PACKAGECONFIG[compiler-rt] =3D "-DCLANG_DEFAULT_RTLIB=3Dcompiler-rt,,"
+PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF,,"
+PACKAGECONFIG[libcplusplus] =3D "-DCLANG_DEFAULT_CXX_STDLIB=3Dlibc++,,"
+PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON -DLLDB_ENABLE_LIBED=
IT=3DON,-DLLVM_ENABLE_LIBEDIT=3DOFF -DLLDB_ENABLE_LIBEDIT=3DOFF,libedit lib=
edit-native"
+PACKAGECONFIG[libomp] =3D "-DCLANG_DEFAULT_OPENMP_RUNTIME=3Dlibomp,,"
+PACKAGECONFIG[lld] =3D "-DCLANG_DEFAULT_LINKER=3Dlld,,"
+PACKAGECONFIG[lldb-lua] =3D "-DLLDB_ENABLE_LUA=3DON,-DLLDB_ENABLE_LUA=3DOF=
F,lua"
+PACKAGECONFIG[lldb-wchar] =3D "-DLLDB_EDITLINE_USE_WCHAR=3D1,-DLLDB_EDITLI=
NE_USE_WCHAR=3D0,"
+PACKAGECONFIG[lto] =3D "-DLLVM_ENABLE_LTO=3DFull -DLLVM_BINUTILS_INCDIR=3D=
${STAGING_INCDIR},,binutils,"
+PACKAGECONFIG[pfm] =3D "-DLLVM_ENABLE_LIBPFM=3DON,-DLLVM_ENABLE_LIBPFM=3DO=
FF,libpfm,"
+PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3DOFF,=
,"
+PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK_L=
LVM_DYLIB=3DON,,,"
+PACKAGECONFIG[split-dwarf] =3D "-DLLVM_USE_SPLIT_DWARF=3DON,-DLLVM_USE_SPL=
IT_DWARF=3DOFF,,"
+PACKAGECONFIG[terminfo] =3D "-DLLVM_ENABLE_TERMINFO=3DON -DCOMPILER_RT_TER=
MINFO_LIB=3DON,-DLLVM_ENABLE_TERMINFO=3DOFF -DCOMPILER_RT_TERMINFO_LIB=3DOF=
F,ncurses,"
+PACKAGECONFIG[thin-lto] =3D "-DLLVM_ENABLE_LTO=3DThin -DLLVM_BINUTILS_INCD=
IR=3D${STAGING_INCDIR},,binutils,"
+PACKAGECONFIG[unwindlib] =3D "-DCLANG_DEFAULT_UNWINDLIB=3Dlibunwind,-DCLAN=
G_DEFAULT_UNWINDLIB=3Dlibgcc,,"
+
+OECMAKE_SOURCEPATH =3D "${S}/llvm"
+
+OECMAKE_TARGET_COMPILE =3D "${@bb.utils.contains('PACKAGECONFIG', 'bootstr=
ap', 'stage2', 'all', d)}"
+OECMAKE_TARGET_INSTALL =3D "${@bb.utils.contains('PACKAGECONFIG', 'bootstr=
ap', 'stage2-install', 'install', d)}"
+BINPATHPREFIX =3D "${@bb.utils.contains('PACKAGECONFIG', 'bootstrap', '/to=
ols/clang/stage2-bins/NATIVE', '', d)}"
+
+PASSTHROUGH =3D "\
+CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_CXX_STDLIB;LLVM_BUILD_LLVM_DYLIB;LLVM_LI=
NK_LLVM_DYLIB;\
+LLVM_ENABLE_ASSERTIONS;LLVM_ENABLE_EXPENSIVE_CHECKS;LLVM_ENABLE_PIC;\
+LLVM_BINDINGS_LIST;LLVM_ENABLE_FFI;FFI_INCLUDE_DIR;LLVM_OPTIMIZED_TABLEGEN=
;\
+LLVM_ENABLE_RTTI;LLVM_ENABLE_EH;LLVM_BUILD_EXTERNAL_COMPILER_RT;CMAKE_SYST=
EM_NAME;\
+CMAKE_BUILD_TYPE;BUILD_SHARED_LIBS;LLVM_ENABLE_PROJECTS;LLVM_BINUTILS_INCD=
IR;\
+LLVM_TARGETS_TO_BUILD;LLVM_EXPERIMENTAL_TARGETS_TO_BUILD;PYTHON_EXECUTABLE=
;\
+PYTHON_LIBRARY;PYTHON_INCLUDE_DIR;LLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN;LLD=
B_EDITLINE_USE_WCHAR;\
+LLVM_ENABLE_LIBEDIT;LLDB_ENABLE_LIBEDIT;LLDB_PYTHON_RELATIVE_PATH;LLDB_PYT=
HON_EXE_RELATIVE_PATH;\
+LLDB_PYTHON_EXT_SUFFIX;CMAKE_C_FLAGS_RELEASE;CMAKE_CXX_FLAGS_RELEASE;CMAKE=
_ASM_FLAGS_RELEASE;\
+CLANG_DEFAULT_CXX_STDLIB;CLANG_DEFAULT_RTLIB;CLANG_DEFAULT_UNWINDLIB;\
+CLANG_DEFAULT_OPENMP_RUNTIME;LLVM_ENABLE_PER_TARGET_RUNTIME_DIR;\
+LLVM_BUILD_TOOLS;LLVM_USE_HOST_TOOLS;LLVM_CONFIG_PATH;\
+"
+#
+# Default to build all OE-Core supported target arches (user overridable).
+# Gennerally setting LLVM_TARGETS_TO_BUILD =3D "" in local.conf is ok in m=
ost simple situations
+# where only one target architecture is needed along with just one build a=
rch (usually X86)
+#
+LLVM_TARGETS_TO_BUILD ?=3D "AMDGPU;AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;=
LoongArch"
+
+LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
+
+HF =3D ""
+HF:class-target =3D "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', '=
hf', '', d)}"
+HF[vardepvalue] =3D "${HF}"
+
+LLVM_PROJECTS ?=3D "clang;clang-tools-extra;lld${LLDB}"
+LLDB ?=3D ";lldb"
+# LLDB support for RISCV32/Mips32 does not work yet
+LLDB:riscv32 =3D ""
+LLDB:mips =3D ""
+LLDB:mipsel =3D ""
+LLDB:powerpc =3D ""
+
+# linux hosts (.so) on Windows .pyd
+SOLIBSDEV:mingw32 =3D ".pyd"
+
+#CMAKE_VERBOSE =3D "VERBOSE=3D1"
+
+EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
+                  -DLLVM_APPEND_VC_REV=3DOFF \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
+                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=3DOFF \
+                  -DLLVM_ENABLE_PIC=3DON \
+                  -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
+                  -DLLVM_BINDINGS_LIST=3D'' \
+                  -DLLVM_ENABLE_FFI=3DON \
+                  -DLLVM_ENABLE_ZSTD=3DON \
+                  -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincludedir=
 libffi) \
+                  -DLLVM_OPTIMIZED_TABLEGEN=3DON \
+                  -DLLVM_BUILD_EXTERNAL_COMPILER_RT=3DON \
+                  -DCMAKE_SYSTEM_NAME=3DLinux \
+                  -DCMAKE_BUILD_TYPE=3DRelease \
+                  -DCMAKE_CXX_FLAGS_RELEASE=3D'${CXXFLAGS} -DNDEBUG -g0' \
+                  -DCMAKE_C_FLAGS_RELEASE=3D'${CFLAGS} -DNDEBUG -g0' \
+                  -DBUILD_SHARED_LIBS=3DOFF \
+                  -DLLVM_ENABLE_PROJECTS=3D'${LLVM_PROJECTS}' \
+                  -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \
+                  -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
+                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
+                  -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
+                  -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIMEN=
TAL_TARGETS_TO_BUILD}' \
+"
+
+EXTRA_OECMAKE:append:class-native =3D "\
+                  -DPYTHON_EXECUTABLE=3D'${PYTHON}' \
+"
+EXTRA_OECMAKE:append:class-nativesdk =3D "\
+                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DLLDB_PYTHON_RELATIVE=
_PATH=3D${PYTHON_SITEPACKAGES_DIR} \
+                                                  -DLLDB_PYTHON_EXE_RELATI=
VE_PATH=3D${PYTHON_PN} \
+                                                  -DLLDB_PYTHON_EXT_SUFFIX=
=3D${SOLIBSDEV} \
+                                                  -DCMAKE_TOOLCHAIN_FILE=
=3D${WORKDIR}/toolchain-native.cmake' \
+                  -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PR=
EFIX}llvm-ranlib \
+                  -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-ar \
+                  -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-nm \
+                  -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PRE=
FIX}llvm-strip \
+                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
+                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-=
min-tblgen \
+                  -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}${P=
YTHON_ABI}.so \
+                  -DLLDB_PYTHON_RELATIVE_PATH=3D${PYTHON_SITEPACKAGES_DIR}=
 \
+                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=3D${PYTHON_PN} \
+                  -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
+                  -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${=
PYTHON_ABI} \
+                  -DPYTHON_EXECUTABLE=3D'${PYTHON}' \
+"
+EXTRA_OECMAKE:append:class-target =3D "\
+                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
+                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-=
min-tblgen \
+                  -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PR=
EFIX}llvm-ranlib \
+                  -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-ar \
+                  -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX=
}llvm-nm \
+                  -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PRE=
FIX}llvm-strip \
+                  -DLLVM_TARGET_ARCH=3D${@get_clang_target_arch(bb, d)} \
+                  -DLLVM_DEFAULT_TARGET_TRIPLE=3D${TARGET_SYS}${HF} \
+                  -DLLVM_HOST_TRIPLE=3D${TARGET_SYS}${HF} \
+                  -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}${P=
YTHON_ABI}.so \
+                  -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}${=
PYTHON_ABI} \
+                  -DLLVM_LIBDIR_SUFFIX=3D${@d.getVar('baselib').replace('l=
ib', '')} \
+                  -DLLDB_PYTHON_RELATIVE_PATH=3D${PYTHON_SITEPACKAGES_DIR}=
 \
+                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=3D${bindir} \
+                  -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
+"
+
+DEPENDS =3D "binutils zlib zstd libffi libxml2 libxml2-native ninja-native=
 swig-native"
+DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} virtual/${T=
ARGET_PREFIX}binutils nativesdk-python3"
+DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} python3 compi=
ler-rt libcxx"
+
+RRECOMMENDS:${PN} =3D "binutils"
+RRECOMMENDS:${PN}:append:class-target =3D " libcxx-dev"
+
+# patch out build host paths for reproducibility
+reproducible_build_variables() {
+    sed -i -e "s,${DEBUG_PREFIX_MAP},,g" \
+        -e "s,--sysroot=3D${RECIPE_SYSROOT},,g" \
+        -e "s,${STAGING_DIR_HOST},,g" \
+        -e "s,${S}/llvm,,g"  \
+        -e "s,${B},,g" \
+        ${B}/tools/llvm-config/BuildVariables.inc
+}
+
+do_configure:append:class-target() {
+    reproducible_build_variables
+}
+
+do_configure:append:class-nativesdk() {
+    reproducible_build_variables
+}
+
+do_install:append() {
+    rm -rf ${D}${libdir}/python*/site-packages/six.py
+    for t in clang-pseudo clang-pseudo-gen clang-rename; do
+        if [ -e ${B}${BINPATHPREFIX}/bin/$t ]; then
+            install -Dm 0755 ${B}${BINPATHPREFIX}/bin/$t ${D}${bindir}/$t
+        fi
+    done
+}
+
+do_install:append:class-target () {
+    # Allow bin path to change based on YOCTO_ALTERNATE_EXE_PATH
+    sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdir}=
/cmake/llvm/LLVMExports-release.cmake
+
+    # Insert function to populate Import Variables
+    sed -i "4i\
+if(DEFINED ENV{YOCTO_ALTERNATE_EXE_PATH})\n\
+  execute_process(COMMAND \"llvm-config\" \"--bindir\" OUTPUT_VARIABLE _IM=
PORT_PREFIX_BIN OUTPUT_STRIP_TRAILING_WHITESPACE)\n\
+else()\n\
+  set(_IMPORT_PREFIX_BIN \"\${_IMPORT_PREFIX}/bin\")\n\
+endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
+
+    if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
+        mkdir -p ${D}${nonarch_libdir}
+        mv ${D}${libdir}/clang ${D}${nonarch_libdir}/clang
+        ln -rs ${D}${nonarch_libdir}/clang ${D}${libdir}/clang
+        rmdir --ignore-fail-on-non-empty ${D}${libdir}
+    fi
+    for t in clang clang++ llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip =
llvm-objcopy llvm-objdump llvm-readelf \
+        llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov; do
+        ln -sf $t ${D}${bindir}/${TARGET_PREFIX}$t
+    done
+
+    # reproducibility
+    sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
+}
+
+do_install:append:class-native () {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)=
}; then
+        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bin=
dir}/clangd-indexer
+    fi
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-chars-=
gen ${D}${bindir}/clang-tidy-confusable-chars-gen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/c=
lang-tblgen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/lldb-tblgen ${D}${bindir}/ll=
db-tblgen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/llvm-min-tblgen ${D}${bindir=
}/llvm-min-tblgen
+    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
+        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
+        echo "stripped $f"
+    done
+    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
+    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
+    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
+}
+
+do_install:append:class-nativesdk () {
+    sed -i -e "s|${B}/./bin/||g" ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
+    if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)=
}; then
+        install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bin=
dir}/clangd-indexer
+    fi
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/c=
lang-tblgen
+    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-chars-=
gen ${D}${bindir}/clang-tidy-confusable-chars-gen
+    for f in `find ${D}${bindir} -executable -type f -not -type l`; do
+        test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
+    done
+    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
+    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
+    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
+    rm -rf ${D}${datadir}/llvm/cmake
+    rm -rf ${D}${datadir}/llvm
+
+    #reproducibility
+    sed -i -e 's,${B},,g' ${D}${libdir}/cmake/llvm/LLVMConfig.cmake
+}
+
+PACKAGES =3D+ "${PN}-libllvm ${PN}-lldb-python ${PN}-libclang-cpp ${PN}-ti=
dy ${PN}-format ${PN}-tools \
+             libclang lldb lldb-server liblldb llvm-linker-tools"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+RDEPENDS:lldb +=3D "${PN}-lldb-python lldb-server"
+
+RDEPENDS:${PN}-tools +=3D "\
+  perl-module-digest-md5 \
+  perl-module-file-basename \
+  perl-module-file-copy \
+  perl-module-file-find \
+  perl-module-file-path \
+  perl-module-findbin \
+  perl-module-hash-util \
+  perl-module-sys-hostname \
+  perl-module-term-ansicolor \
+"
+
+RRECOMMENDS:${PN}-tidy +=3D "${PN}-tools"
+
+FILES:llvm-linker-tools =3D "${libdir}/LLVMgold* ${libdir}/libLTO.so.* ${l=
ibdir}/LLVMPolly*"
+
+FILES:${PN}-libclang-cpp =3D "${libdir}/libclang-cpp.so.*"
+
+FILES:${PN}-lldb-python =3D "${libdir}/python*/site-packages/lldb/*"
+
+FILES:${PN}-tidy =3D "${bindir}/*clang-tidy*"
+FILES:${PN}-format =3D "${bindir}/*clang-format*"
+
+FILES:${PN}-tools =3D "${bindir}/analyze-build \
+  ${bindir}/c-index-test \
+  ${bindir}/clang-apply-replacements \
+  ${bindir}/clang-change-namespace \
+  ${bindir}/clang-check \
+  ${bindir}/clang-doc \
+  ${bindir}/clang-extdef-mapping \
+  ${bindir}/clang-include-fixer \
+  ${bindir}/clang-linker-wrapper \
+  ${bindir}/clang-move \
+  ${bindir}/clang-nvlink-wrapper \
+  ${bindir}/clang-offload-bundler \
+  ${bindir}/clang-offload-packager \
+  ${bindir}/clang-pseudo* \
+  ${bindir}/clang-query \
+  ${bindir}/clang-refactor \
+  ${bindir}/clang-rename* \
+  ${bindir}/clang-reorder-fields \
+  ${bindir}/clang-repl \
+  ${bindir}/clang-scan-deps \
+  ${bindir}/diagtool \
+  ${bindir}/find-all-symbols \
+  ${bindir}/hmaptool \
+  ${bindir}/hwasan_symbolize \
+  ${bindir}/intercept-build \
+  ${bindir}/modularize \
+  ${bindir}/pp-trace \
+  ${bindir}/sancov \
+  ${bindir}/scan-build \
+  ${bindir}/scan-build-py \
+  ${bindir}/scan-view \
+  ${bindir}/split-file \
+  ${libdir}/libscanbuild/* \
+  ${libdir}/libear/* \
+  ${libexecdir}/analyze-c++ \
+  ${libexecdir}/analyze-cc \
+  ${libexecdir}/c++-analyzer \
+  ${libexecdir}/ccc-analyzer \
+  ${libexecdir}/intercept-c++ \
+  ${libexecdir}/intercept-cc \
+  ${datadir}/scan-build/* \
+  ${datadir}/scan-view/* \
+  ${datadir}/opt-viewer/* \
+  ${datadir}/clang/* \
+"
+
+FILES:${PN} +=3D "\
+  ${bindir}/clang-cl \
+  ${libdir}/BugpointPasses.so \
+  ${libdir}/LLVMHello.so \
+  ${libdir}/*Plugin.so \
+  ${libdir}/${BPN} \
+  ${nonarch_libdir}/${BPN}/*/include/ \
+"
+
+FILES:lldb =3D "\
+  ${bindir}/lldb \
+  ${bindir}/lldb-argdumper \
+  ${bindir}/lldb-instr \
+  ${bindir}/lldb-vscode \
+"
+
+FILES:lldb-server =3D "\
+  ${bindir}/lldb-server \
+"
+
+FILES:liblldb =3D "\
+  ${libdir}/liblldbIntelFeatures.so.* \
+  ${libdir}/liblldb.so.* \
+"
+
+FILES:${PN}-libllvm =3D+ "\
+  ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
+  ${libdir}/libLLVM-${MAJOR_VER}.so \
+  ${libdir}/libRemarks.so.* \
+"
+
+FILES:libclang =3D "\
+  ${libdir}/libclang.so.* \
+"
+
+FILES:${PN}-dev +=3D "\
+  ${datadir}/llvm/cmake \
+  ${libdir}/cmake \
+  ${nonarch_libdir}/libear \
+  ${nonarch_libdir}/${BPN}/*.la \
+"
+FILES:${PN}-doc +=3D "${datadir}/clang-doc"
+
+FILES:${PN}-staticdev +=3D "${nonarch_libdir}/${BPN}/*.a"
+
+FILES:${PN}-staticdev:remove =3D "${libdir}/${BPN}/*.a"
+FILES:${PN}-dev:remove =3D "${libdir}/${BPN}/*.la"
+FILES:${PN}:remove =3D "${libdir}/${BPN}/*"
+
+
+INSANE_SKIP:${PN} +=3D "already-stripped"
+#INSANE_SKIP:${PN}-dev +=3D "dev-elf"
+INSANE_SKIP:${PN}-lldb-python +=3D "dev-so dev-deps"
+INSANE_SKIP:${MLPREFIX}liblldb =3D "dev-so"
+INSANE_SKIP:${PN}-libllvm =3D "dev-so"
+
+#Avoid SSTATE_SCAN_COMMAND running sed over llvm-config.
+SSTATE_SCAN_FILES:remove =3D "*-config"
+
+TOOLCHAIN =3D "clang"
+TOOLCHAIN:class-native =3D "gcc"
+TOOLCHAIN:class-nativesdk =3D "clang"
+COMPILER_RT:class-nativesdk:toolchain-clang:runtime-llvm =3D "-rtlib=3Dlib=
gcc --unwindlib=3Dlibgcc"
+LIBCPLUSPLUS:class-nativesdk:toolchain-clang:runtime-llvm =3D "-stdlib=3Dl=
ibstdc++"
+
+SYSROOT_DIRS:append:class-target =3D " ${nonarch_libdir}"
+
+SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " clang_sysroot_preproces=
s"
+
+clang_sysroot_preprocess() {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR=
}${bindir_crossscripts}/
+	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${=
PV}
+	# LLDTargets.cmake references the lld executable(!) that some modules/plu=
gins link to
+	install -d ${SYSROOT_DESTDIR}${bindir}
+
+	binaries=3D"lld diagtool clang-${MAJOR_VER} clang-format clang-offload-pa=
ckager
+	                clang-offload-bundler clang-scan-deps clang-repl
+	                clang-refactor clang-check clang-extdef-mapping clang-app=
ly-replacements
+	                clang-reorder-fields clang-tidy clang-change-namespace cl=
ang-doc clang-include-fixer
+	                find-all-symbols clang-move clang-query pp-trace modulari=
ze"
+
+	if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; =
then
+	        binaries=3D"${binaries} clangd"
+	fi
+
+	for f in ${binaries}
+	do
+		install -m 755 ${D}${bindir}/$f ${SYSROOT_DESTDIR}${bindir}/
+	done
+}
diff --git a/meta/recipes-devtools/clang/common-source.inc b/meta/recipes-d=
evtools/clang/common-source.inc
new file mode 100644
index 00000000000..d8a0f68175c
--- /dev/null
+++ b/meta/recipes-devtools/clang/common-source.inc
@@ -0,0 +1,17 @@
+do_fetch() {
+        :
+}
+do_fetch[noexec] =3D "1"
+deltask do_unpack
+deltask do_patch
+
+SRC_URI =3D ""
+
+do_configure[depends] +=3D "llvm-project-source-${PV}:do_preconfigure"
+do_populate_lic[depends] +=3D "llvm-project-source-${PV}:do_unpack"
+do_create_spdx[depends] +=3D "llvm-project-source-${PV}:do_preconfigure"
+
+# spdx shared workdir detection fails as not WORKDIR is altered but S and B
+# return always true to fix that
+def is_work_shared_spdx(d):
+    return True
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools=
/clang/common.inc
new file mode 100644
index 00000000000..927aac693bc
--- /dev/null
+++ b/meta/recipes-devtools/clang/common.inc
@@ -0,0 +1,66 @@
+FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/clang:"
+
+LIC_FILES_CHKSUM =3D "file://llvm/LICENSE.TXT;md5=3D${LLVMMD5SUM} \
+                    file://clang/LICENSE.TXT;md5=3D${CLANGMD5SUM} \
+"
+LICENSE =3D "Apache-2.0-with-LLVM-exception"
+
+# Snapshot
+#RELEASE ?=3D "7ba7d8e2f7b6445b60679da826210cdde29eaf8b"
+#BASEURI ?=3D "https://api.github.com/repos/llvm/llvm-project/tarball/${RE=
LEASE};downloadfilename=3Dllvm-${PV}-${RELEASE}.tar.gz"
+#SOURCEDIR ?=3D "llvm-llvm-project-${@'${RELEASE}'[0:7]}"
+#SRC_URI[sha256sum] =3D "cca3fa1c6efb72bd8bc22b926a2c5551e6b8560d95828452b=
c62b9140cb87a90"
+
+# GA Release
+RELEASE ?=3D "${PV}"
+BASEURI ?=3D "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}/ll=
vm-project-${PV}.src.tar.xz"
+SOURCEDIR ?=3D "llvm-project-${PV}.src"
+SRC_URI[sha256sum] =3D "324d483ff0b714c8ce7819a1b679dd9e4706cf91c6caf7336d=
c4ac0c1d3bf636"
+
+SRC_URI =3D "\
+    ${BASEURI} \
+    file://0001-libcxxabi-Find-libunwind-headers-when-LIBCXXABI_LIBU.patch=
 \
+    file://0002-compiler-rt-support-a-new-embedded-linux-target.patch \
+    file://0003-compiler-rt-Simplify-cross-compilation.-Don-t-use-na.patch=
 \
+    file://0004-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch=
 \
+    file://0005-llvm-allow-env-override-of-exe-and-libdir-path.patch \
+    file://0006-clang-driver-Check-sysroot-for-ldso-path.patch \
+    file://0007-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch \
+    file://0008-clang-Prepend-trailing-to-sysroot.patch \
+    file://0009-clang-Look-inside-the-target-sysroot-for-compiler-ru.patch=
 \
+    file://0010-clang-Define-releative-gcc-installation-dir.patch \
+    file://0011-clang-Add-lpthread-and-ldl-along-with-lunwind-for-st.patch=
 \
+    file://0012-Pass-PYTHON_EXECUTABLE-when-cross-compiling-for-nati.patch=
 \
+    file://0013-Check-for-atomic-double-intrinsics.patch \
+    file://0014-cmake-Fix-configure-for-packages-using-find_package.patch \
+    file://0015-clang-Fix-resource-dir-location-for-cross-toolchains.patch=
 \
+    file://0016-clang-driver-Add-dyld-prefix-when-checking-sysroot-f.patch=
 \
+    file://0017-clang-Use-python3-in-python-scripts.patch \
+    file://0018-For-x86_64-set-Yocto-based-GCC-install-search-path.patch \
+    file://0019-llvm-Insert-anchor-for-adding-OE-distro-vendor-names.patch=
 \
+    file://0020-compiler-rt-Do-not-use-backtrace-APIs-on-non-glibc-l.patch=
 \
+    file://0021-clang-Fix-x86-triple-for-non-debian-multiarch-linux-.patch=
 \
+    file://0022-libunwind-Added-unw_backtrace-method.patch \
+    file://0023-clang-Do-not-use-install-relative-libc-headers.patch \
+    file://0024-Fix-lib-paths-for-OpenEmbedded-Host.patch \
+    file://0025-Correct-library-search-path-for-OpenEmbedded-Host.patch \
+    file://0026-lldb-Link-with-libatomic-on-x86.patch \
+    file://0027-compiler-rt-Enable-__int128-for-ppc32.patch \
+    file://0028-llvm-Do-not-use-cmake-infra-to-detect-libzstd.patch \
+    file://0029-compiler-rt-Fix-stat-struct-s-size-for-O32-ABI.patch \
+    file://0030-compiler-rt-Undef-_TIME_BITS-along-with-_FILE_OFFSET.patch=
 \
+    file://0031-ToolChains-Gnu.cpp-ARMLibDirs-search-also-in-lib32.patch \
+    file://0032-clang-llvm-Add-OE-specific-ABI-triple-for-N32-ABI.patch \
+    file://0033-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch \
+    file://0034-scan-build-py-respect-LLVM_LIBDIR_SUFFIX-like-other-.patch=
 \
+"
+# Fallback to no-PIE if not set
+GCCPIE ??=3D ""
+
+S =3D "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}/${SOURCEDIR}"
+B ?=3D "${WORKDIR}/llvm-project-source-${PV}/build.${HOST_SYS}.${TARGET_SY=
S}"
+
+# We need to ensure that for the shared work directory, the do_patch signa=
tures match
+# The real WORKDIR location isn't a dependency for the shared workdir.
+src_patches[vardepsexclude] =3D "WORKDIR"
+should_apply[vardepsexclude] +=3D "PN"
diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/me=
ta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
new file mode 100644
index 00000000000..db484683af4
--- /dev/null
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -0,0 +1,123 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "LLVM based C/C++ compiler Runtime"
+HOMEPAGE =3D "http://compiler-rt.llvm.org/"
+SECTION =3D "base"
+
+require clang.inc
+require common-source.inc
+
+inherit cmake pkgconfig python3native
+
+
+LIC_FILES_CHKSUM =3D "file://compiler-rt/LICENSE.TXT;md5=3Dd846d1d65baf322=
d4c485d6ee54e877a"
+
+TUNE_CCARGS:remove =3D "-no-integrated-as"
+
+DEPENDS +=3D "ninja-native virtual/crypt compiler-rt"
+DEPENDS:append:class-native =3D " clang-native libxcrypt-native"
+DEPENDS:append:class-nativesdk =3D " clang-native clang-crosssdk-${SDK_SYS=
} nativesdk-libxcrypt"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[crt] =3D "-DCOMPILER_RT_BUILD_CRT:BOOL=3DON,-DCOMPILER_RT_BU=
ILD_CRT:BOOL=3DOFF"
+PACKAGECONFIG[static-libcxx] =3D "-DSANITIZER_USE_STATIC_CXX_ABI=3DON -DSA=
NITIZER_USE_STATIC_LLVM_UNWINDER=3DON -DCOMPILER_RT_ENABLE_STATIC_UNWINDER=
=3DON,,"
+# Context Profiling
+PACKAGECONFIG[ctx-profile] =3D"-DCOMPILER_RT_BUILD_CTX_PROFILE=3DON,-DCOMP=
ILER_RT_BUILD_CTX_PROFILE=3DOFF"
+
+HF =3D ""
+HF:class-target =3D "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', '=
hf', '', d)}"
+HF[vardepvalue] =3D "${HF}"
+
+CXXFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
+
+OECMAKE_TARGET_COMPILE =3D "compiler-rt"
+OECMAKE_TARGET_INSTALL =3D "install-compiler-rt install-compiler-rt-header=
s"
+OECMAKE_SOURCEPATH =3D "${S}/llvm"
+EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
+                  -DCOMPILER_RT_STANDALONE_BUILD=3DOFF \
+                  -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
+                  -DCOMPILER_RT_USE_BUILTINS_LIBRARY=3DON \
+                  -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-$=
{HOST_OS}${HF} \
+                  -DCOMPILER_RT_BUILD_BUILTINS=3DOFF \
+                  -DCOMPILER_RT_INCLUDE_TESTS=3DOFF \
+                  -DSANITIZER_CXX_ABI_LIBNAME=3D${@bb.utils.contains("TC_C=
XX_RUNTIME", "llvm", "libc++", "libstdc++", d)} \
+                  -DCOMPILER_RT_BUILD_XRAY=3DON \
+                  -DCOMPILER_RT_BUILD_SANITIZERS=3DON \
+                  -DCOMPILER_RT_BUILD_LIBFUZZER=3DON \
+                  -DCOMPILER_RT_BUILD_PROFILE=3DON \
+                  -DCOMPILER_RT_BUILD_MEMPROF=3DON \
+                  -DLLVM_ENABLE_PROJECTS=3D'compiler-rt' \
+                  -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
+                  -DLLVM_APPEND_VC_REV=3DOFF \
+"
+
+EXTRA_OECMAKE:append:class-nativesdk =3D "\
+               -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFI=
X}llvm-ranlib \
+               -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-ar \
+               -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-nm \
+               -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+               -DCLANG_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/clang-tblgen \
+"
+
+EXTRA_OECMAKE:append:class-target =3D "\
+               -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFI=
X}llvm-ranlib \
+               -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-ar \
+               -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-nm \
+               -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
+"
+
+EXTRA_OECMAKE:append:libc-musl =3D " -DLIBCXX_HAS_MUSL_LIBC=3DON "
+EXTRA_OECMAKE:append:powerpc =3D " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3Dpow=
erpc "
+
+do_install:append () {
+    if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
+        mkdir -p ${D}${nonarch_libdir}/clang
+        mv ${D}${libdir}/clang/${MAJOR_VER} ${D}${nonarch_libdir}/clang/${=
MAJOR_VER}.${MINOR_VER}.${PATCH_VER}
+        rmdir --ignore-fail-on-non-empty ${D}${libdir}/clang ${D}${libdir}
+    else
+    	mv ${D}${libdir}/clang/${MAJOR_VER} ${D}${libdir}/clang/${MAJOR_VER}.=
${MINOR_VER}.${PATCH_VER}
+    fi
+    # Already shipped with compile-rt Orc support
+    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/liborc_rt-*.a
+    rm -rf ${D}${nonarch_libdir}/clang/${MAJOR_VER}/include/orc/
+}
+
+FILES_SOLIBSDEV =3D ""
+FILES:${PN} +=3D "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATC=
H_VER} \
+				${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/lib*${SOLIBSDEV} \
+                ${nonarch_libdir}/clang/${MAJOR_VER}/*.txt \
+                ${nonarch_libdir}/clang/${MAJOR_VER}/share/*.txt"
+FILES:${PN}-staticdev +=3D "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_V=
ER}.${PATCH_VER}/lib/linux/*.a"
+FILES:${PN}-dev +=3D "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}/lib/=
linux/*.syms \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}/include \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/clang_r=
t.crt*.o \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}/lib/linux/libclan=
g_rt.asan-preinit*.a"
+INSANE_SKIP:${PN} =3D "dev-so libdir"
+INSANE_SKIP:${PN}-dbg =3D "libdir"
+
+#PROVIDES:append:class-target =3D "\
+#        virtual/${TARGET_PREFIX}compilerlibs \
+#        libgcc \
+#        libgcc-initial \
+#        libgcc-dev \
+#        libgcc-initial-dev \
+#        "
+#
+
+RDEPENDS:${PN}-dev +=3D "${PN}-staticdev"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+ALLOW_EMPTY:${PN} =3D "1"
+ALLOW_EMPTY:${PN}-dev =3D "1"
+
+TOOLCHAIN:forcevariable =3D "clang"
+SYSROOT_DIRS:append:class-target =3D " ${nonarch_libdir}"
+
+# riscv and x86_64 Sanitizers work on musl too
+COMPATIBLE_HOST:libc-musl:x86-64 =3D "(.*)"
+COMPATIBLE_HOST:libc-musl:riscv64 =3D "(.*)"
+COMPATIBLE_HOST:libc-musl:riscv32 =3D "(.*)"
+COMPATIBLE_HOST:libc-musl =3D "null"
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-=
devtools/clang/compiler-rt_git.bb
new file mode 100644
index 00000000000..a6f6db3cc73
--- /dev/null
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -0,0 +1,126 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "LLVM based C/C++ compiler Runtime"
+HOMEPAGE =3D "http://compiler-rt.llvm.org/"
+SECTION =3D "base"
+
+require clang.inc
+require common-source.inc
+
+inherit cmake cmake-native pkgconfig python3native
+
+
+LIC_FILES_CHKSUM =3D "file://compiler-rt/LICENSE.TXT;md5=3Dd846d1d65baf322=
d4c485d6ee54e877a"
+
+LIBCPLUSPLUS =3D ""
+COMPILER_RT =3D ""
+
+TUNE_CCARGS:remove =3D "-no-integrated-as"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+DEPENDS +=3D "ninja-native libgcc"
+DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} virtual/${MLP=
REFIX}libc gcc-runtime"
+DEPENDS:append:class-nativesdk =3D " clang-native clang-crosssdk-${SDK_SYS=
} nativesdk-gcc-runtime"
+DEPENDS:append:class-native =3D " clang-native"
+
+# Trick clang.bbclass into not creating circular dependencies
+UNWINDLIB:class-nativesdk:toolchain-clang =3D "--unwindlib=3Dlibgcc"
+COMPILER_RT:class-nativesdk:toolchain-clang =3D "-rtlib=3Dlibgcc --unwindl=
ib=3Dlibgcc"
+LIBCPLUSPLUS:class-nativesdk:toolchain-clang =3D "-stdlib=3Dlibstdc++"
+UNWINDLIB:class-native:toolchain-clang =3D "--unwindlib=3Dlibgcc"
+COMPILER_RT:class-native:toolchain-clang =3D "-rtlib=3Dlibgcc --unwindlib=
=3Dlibgcc"
+LIBCPLUSPLUS:class-native:toolchain-clang =3D "-stdlib=3Dlibstdc++"
+UNWINDLIB:class-target:toolchain-clang =3D "--unwindlib=3Dlibgcc"
+COMPILER_RT:class-target:toolchain-clang =3D "-rtlib=3Dlibgcc --unwindlib=
=3Dlibgcc"
+LIBCPLUSPLUS:class-target:toolchain-clang =3D "-stdlib=3Dlibstdc++"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[crt] =3D "-DCOMPILER_RT_BUILD_CRT:BOOL=3DON,-DCOMPILER_RT_BU=
ILD_CRT:BOOL=3DOFF"
+PACKAGECONFIG[profile] =3D"-DCOMPILER_RT_BUILD_PROFILE=3DON,-DCOMPILER_RT_=
BUILD_PROFILE=3DOFF"
+# Context Profiling, might need to enable 'profile' too
+PACKAGECONFIG[ctx-profile] =3D"-DCOMPILER_RT_BUILD_CTX_PROFILE=3DON,-DCOMP=
ILER_RT_BUILD_CTX_PROFILE=3DOFF"
+
+HF =3D ""
+HF:class-target =3D "${@ bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', '=
hf', '', d)}"
+HF[vardepvalue] =3D "${HF}"
+
+OECMAKE_TARGET_COMPILE =3D "compiler-rt"
+OECMAKE_TARGET_INSTALL =3D "install-compiler-rt install-compiler-rt-header=
s"
+OECMAKE_SOURCEPATH =3D "${S}/llvm"
+EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
+                  -DCOMPILER_RT_STANDALONE_BUILD=3DOFF \
+                  -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
+                  -DCOMPILER_RT_INCLUDE_TESTS=3DOFF \
+                  -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}-$=
{HOST_OS}${HF} \
+                  -DCOMPILER_RT_BUILD_XRAY=3DOFF \
+                  -DCOMPILER_RT_BUILD_SANITIZERS=3DOFF \
+                  -DCOMPILER_RT_BUILD_MEMPROF=3DOFF \
+                  -DCOMPILER_RT_BUILD_LIBFUZZER=3DOFF \
+                  -DLLVM_ENABLE_PROJECTS=3D'compiler-rt' \
+                  -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
+                  -DLLVM_APPEND_VC_REV=3DOFF \
+"
+EXTRA_OECMAKE:append:class-target =3D "\
+               -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFI=
X}llvm-ranlib \
+               -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-ar \
+               -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-nm \
+               -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
+"
+
+EXTRA_OECMAKE:append:class-nativesdk =3D "\
+               -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFI=
X}llvm-ranlib \
+               -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-ar \
+               -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX}ll=
vm-nm \
+               -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+               -DCLANG_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/clang-tblgen \
+"
+EXTRA_OECMAKE:append:powerpc =3D " -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3Dpow=
erpc "
+
+do_install:append () {
+    if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
+        mkdir -p ${D}${nonarch_libdir}/clang
+        mv ${D}${libdir}/clang/${MAJOR_VER} ${D}${nonarch_libdir}/clang/${=
MAJOR_VER}.${MINOR_VER}.${PATCH_VER}
+        rmdir --ignore-fail-on-non-empty ${D}${libdir}/clang ${D}${libdir}
+    else
+        mv ${D}${libdir}/clang/${MAJOR_VER} ${D}${libdir}/clang/${MAJOR_VE=
R}.${MINOR_VER}.${PATCH_VER}
+    fi
+}
+
+FILES_SOLIBSDEV =3D ""
+
+FILES:${PN} +=3D "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATC=
H_VER}/lib/linux/lib*${SOLIBSDEV} \
+                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_=
VER}/*.txt \
+                ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PATCH_=
VER}/share/*.txt"
+FILES:${PN}-staticdev +=3D "${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_V=
ER}.${PATCH_VER}/lib/linux/*.a"
+FILES:${PN}-dev +=3D "${datadir} ${nonarch_libdir}/clang/${MAJOR_VER}.${MI=
NOR_VER}.${PATCH_VER}/lib/linux/*.syms \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PA=
TCH_VER}/include \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PA=
TCH_VER}/lib/linux/clang_rt.crt*.o \
+                    ${nonarch_libdir}/clang/${MAJOR_VER}.${MINOR_VER}.${PA=
TCH_VER}/lib/linux/libclang_rt.asan-preinit*.a"
+
+INSANE_SKIP:${PN} =3D "dev-so libdir"
+INSANE_SKIP:${PN}-dbg =3D "libdir"
+
+#PROVIDES:append:class-target =3D "\
+#        virtual/${TARGET_PREFIX}compilerlibs \
+#        libgcc \
+#        libgcc-initial \
+#        libgcc-dev \
+#        libgcc-initial-dev \
+#        "
+#
+
+RDEPENDS:${PN}-dev +=3D "${PN}-staticdev"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+ALLOW_EMPTY:${PN} =3D "1"
+ALLOW_EMPTY:${PN}-dev =3D "1"
+
+TOOLCHAIN =3D "clang"
+# Overrides defaults from clang.bbclass
+TOOLCHAIN:class-nativesdk =3D "clang"
+TOOLCHAIN:class-native =3D "clang"
+SYSROOT_DIRS:append:class-target =3D " ${nonarch_libdir}"
diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devto=
ols/clang/libclc_git.bb
new file mode 100644
index 00000000000..16ab8332138
--- /dev/null
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -0,0 +1,36 @@
+DESCRIPTION =3D "LLVM based OpenCL runtime support library"
+HOMEPAGE =3D "http://libclc.llvm.org/"
+SECTION =3D "libs"
+
+require clang.inc
+require common-source.inc
+
+TOOLCHAIN =3D "clang"
+
+LIC_FILES_CHKSUM =3D "file://libclc/LICENSE.TXT;md5=3D7cc795f6cbb2d801d843=
36b83c8017db"
+
+inherit cmake cmake-qemu pkgconfig python3native
+
+DEPENDS +=3D "clang spirv-tools spirv-llvm-translator spirv-llvm-translato=
r-native ncurses"
+
+OECMAKE_SOURCEPATH =3D "${S}/libclc"
+
+EXTRA_OECMAKE +=3D "\
+    -DLLVM_APPEND_VC_REV=3DOFF \
+    -DLIBCLC_CUSTOM_LLVM_TOOLS_BINARY_DIR=3D${STAGING_BINDIR_NATIVE} \
+    -DLLVM_CLANG=3D${STAGING_BINDIR_NATIVE}/clang \
+    -DLLVM_AS=3D${STAGING_BINDIR_NATIVE}/llvm-as \
+    -DLLVM_LINK=3D${STAGING_BINDIR_NATIVE}/llvm-link \
+    -DLLVM_OPT=3D${STAGING_BINDIR_NATIVE}/opt \
+    -DLLVM_SPIRV=3D${STAGING_BINDIR_NATIVE}/llvm-spirv \
+    -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+    -Dclc_comp_in:FILEPATH=3D${OECMAKE_SOURCEPATH}/cmake/CMakeCLCCompiler.=
cmake.in \
+    -Dll_comp_in:FILEPATH=3D${OECMAKE_SOURCEPATH}/cmake/CMakeLLAsmCompiler=
.cmake.in \
+    -DCMAKE_POSITION_INDEPENDENT_CODE=3DON"
+
+FILES:${PN} +=3D "${datadir}/clc"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+export YOCTO_ALTERNATE_EXE_PATH
+export YOCTO_ALTERNATE_LIBDIR
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devto=
ols/clang/libcxx_git.bb
new file mode 100644
index 00000000000..a2a67880a8b
--- /dev/null
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -0,0 +1,115 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "libc++ is a new implementation of the C++ standard librar=
y, targeting C++11"
+HOMEPAGE =3D "http://libcxx.llvm.org/"
+SECTION =3D "base"
+
+require clang.inc
+require common-source.inc
+
+inherit cmake cmake-native python3native
+
+PACKAGECONFIG ??=3D "compiler-rt exceptions ${@bb.utils.contains("TC_CXX_R=
UNTIME", "llvm", "unwind unwind-shared", "", d)}"
+PACKAGECONFIG:append:armv5 =3D " no-atomics"
+PACKAGECONFIG:remove:class-native =3D "compiler-rt"
+PACKAGECONFIG[unwind] =3D "-DLIBCXXABI_USE_LLVM_UNWINDER=3DON -DLIBCXXABI_=
ENABLE_STATIC_UNWINDER=3DON,-DLIBCXXABI_USE_LLVM_UNWINDER=3DOFF,,"
+PACKAGECONFIG[exceptions] =3D "-DLIBCXXABI_ENABLE_EXCEPTIONS=3DON -DLIBCXX=
_ENABLE_EXCEPTIONS=3DON,-DLIBCXXABI_ENABLE_EXCEPTIONS=3DOFF -DLIBCXX_ENABLE=
_EXCEPTIONS=3DOFF -DCMAKE_REQUIRED_FLAGS=3D'-fno-exceptions',"
+PACKAGECONFIG[no-atomics] =3D "-D_LIBCXXABI_HAS_ATOMIC_BUILTINS=3DOFF -DCM=
AKE_SHARED_LINKER_FLAGS=3D'-latomic',,"
+PACKAGECONFIG[compiler-rt] =3D "-DLIBCXX_USE_COMPILER_RT=3DON -DLIBCXXABI_=
USE_COMPILER_RT=3DON -DLIBUNWIND_USE_COMPILER_RT=3DON,,compiler-rt"
+PACKAGECONFIG[unwind-shared] =3D "-DLIBUNWIND_ENABLE_SHARED=3DON,-DLIBUNWI=
ND_ENABLE_SHARED=3DOFF,,"
+
+DEPENDS +=3D "ninja-native"
+DEPENDS:append:class-target =3D " clang-cross-${TARGET_ARCH} virtual/${MLP=
REFIX}libc virtual/${TARGET_PREFIX}compilerlibs"
+DEPENDS:append:class-nativesdk =3D " clang-crosssdk-${SDK_SYS} nativesdk-c=
ompiler-rt"
+DEPENDS:append:class-native =3D " clang-native compiler-rt-native"
+
+COMPILER_RT ?=3D "${@bb.utils.contains("PACKAGECONFIG", "compiler-rt", "-r=
tlib=3Dcompiler-rt", "-rtlib=3Dlibgcc", d)}"
+UNWINDLIB ?=3D "${@bb.utils.contains("PACKAGECONFIG", "unwind", "-unwindli=
b=3Dnone", "-unwindlib=3Dlibgcc", d)}"
+LIBCPLUSPLUS ?=3D "-stdlib=3Dlibstdc++"
+# Trick clang.bbclass into not creating circular dependencies
+UNWINDLIB:class-nativesdk =3D "-unwindlib=3Dlibgcc"
+LIBCPLUSPLUS:class-nativesdk =3D "-stdlib=3Dlibstdc++"
+UNWINDLIB:class-native =3D "-unwindlib=3Dlibgcc"
+LIBCPLUSPLUS:class-native =3D "-stdlib=3Dlibstdc++"
+
+LDFLAGS:append =3D " ${UNWINDLIB}"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+LIC_FILES_CHKSUM =3D "file://libcxx/LICENSE.TXT;md5=3D55d89dd7eec8d3b4204b=
680e27da3953 \
+                    file://libcxxabi/LICENSE.TXT;md5=3D7b9334635b542c56868=
400a46b272b1e \
+                    file://libunwind/LICENSE.TXT;md5=3Df66970035d12f196030=
658b11725e1a1 \
+"
+
+OECMAKE_TARGET_COMPILE =3D "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm",=
 "unwind", "", d)} cxxabi cxx"
+OECMAKE_TARGET_INSTALL =3D "${@bb.utils.contains("TC_CXX_RUNTIME", "llvm",=
 "install-unwind", "", d)} install-cxxabi install-cxx"
+
+OECMAKE_SOURCEPATH =3D "${S}/llvm"
+EXTRA_OECMAKE +=3D "\
+                  -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
+                  -DCMAKE_CROSSCOMPILING=3DON \
+                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
+                  -DLLVM_ENABLE_RTTI=3DON \
+                  -DLIBUNWIND_ENABLE_CROSS_UNWINDING=3DON \
+                  -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=3DON \
+                  -DLIBCXXABI_INCLUDE_TESTS=3DOFF \
+                  -DLIBCXXABI_ENABLE_SHARED=3DON \
+                  -DLIBCXXABI_LIBCXX_INCLUDES=3D${S}/libcxx/include \
+                  -DLIBCXX_CXX_ABI=3Dlibcxxabi \
+                  -DLIBCXX_CXX_ABI_INCLUDE_PATHS=3D${S}/libcxxabi/include \
+                  -DLIBCXX_CXX_ABI_LIBRARY_PATH=3D${B}/lib${LLVM_LIBDIR_SU=
FFIX} \
+                  -S ${S}/runtimes \
+                  -DLLVM_ENABLE_RUNTIMES=3D'libcxx;libcxxabi;libunwind' \
+                  -DLLVM_RUNTIME_TARGETS=3D${HOST_SYS} \
+                  -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
+                  -DLLVM_APPEND_VC_REV=3DOFF \
+                  -DCMAKE_BUILD_WITH_INSTALL_RPATH=3DON \
+"
+
+EXTRA_OECMAKE:append:class-target =3D " \
+                  -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${AR} \
+                  -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${NM} \
+                  -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
+                  -DLLVM_DEFAULT_TARGET_TRIPLE=3D${HOST_SYS} \
+                  -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
+"
+
+EXTRA_OECMAKE:append:class-nativesdk =3D " \
+                  -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${AR} \
+                  -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${NM} \
+                  -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${RANLIB} \
+                  -DLLVM_DEFAULT_TARGET_TRIPLE=3D${HOST_SYS} \
+"
+
+EXTRA_OECMAKE:append:libc-musl =3D " -DLIBCXX_HAS_MUSL_LIBC=3DON "
+
+CXXFLAGS:append:armv5 =3D " -mfpu=3Dvfp2"
+
+ALLOW_EMPTY:${PN} =3D "1"
+
+PROVIDES:append:runtime-llvm =3D " libunwind"
+
+do_install:append() {
+    if ${@bb.utils.contains("TC_CXX_RUNTIME", "llvm", "true", "false", d)}
+    then
+        for f in libunwind.h __libunwind_config.h unwind.h unwind_itanium.=
h unwind_arm_ehabi.h
+        do
+            install -Dm 0644 ${S}/libunwind/include/$f ${D}${includedir}/$f
+        done
+        install -d ${D}${libdir}/pkgconfig
+        sed -e 's,@LIBDIR@,${libdir},g;s,@VERSION@,${PV},g' ${S}/libunwind=
/libunwind.pc.in > ${D}${libdir}/pkgconfig/libunwind.pc
+    fi
+}
+
+PACKAGES:append:runtime-llvm =3D " libunwind"
+FILES:libunwind:runtime-llvm =3D "${libdir}/libunwind.so.*"
+# Package library module manifest path
+FILES:${PN}-dev +=3D "${datadir}/libc++/v1/ ${libdir}/libc++.modules.json"
+
+BBCLASSEXTEND =3D "native nativesdk"
+TOOLCHAIN =3D "clang"
+# Overrides defaults from clang.bbclass
+TOOLCHAIN:class-nativesdk =3D "clang"
+TOOLCHAIN:class-native =3D "clang"
diff --git a/meta/recipes-devtools/clang/llvm-project-source.bb b/meta/reci=
pes-devtools/clang/llvm-project-source.bb
new file mode 100644
index 00000000000..c1cd8877ab8
--- /dev/null
+++ b/meta/recipes-devtools/clang/llvm-project-source.bb
@@ -0,0 +1,12 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY =3D "This is the canonical git mirror of the LLVM subversion repos=
itory."
+HOMEPAGE =3D "https://github.com/llvm/llvm-project"
+
+require llvm-project-source.inc
+require clang.inc
+
+BPN =3D "llvm-project-source"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/rec=
ipes-devtools/clang/llvm-project-source.inc
new file mode 100644
index 00000000000..50e9154e87a
--- /dev/null
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -0,0 +1,99 @@
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+deltask do_populate_lic
+RM_WORK_EXCLUDE +=3D "${PN}"
+
+inherit nopackages
+
+PN =3D "llvm-project-source-${PV}"
+WORKDIR =3D "${TMPDIR}/work-shared/llvm-project-source-${PV}-${PR}"
+SSTATE_SWSPEC =3D "sstate:llvm-project-source::${PV}:${PR}::${SSTATE_VERSI=
ON}:"
+
+STAMP =3D "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-${PR}"
+STAMPCLEAN =3D "${STAMPS_DIR}/work-shared/llvm-project-source-${PV}-*"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+DEPENDS =3D ""
+PACKAGES =3D ""
+TARGET_ARCH =3D "allarch"
+TARGET_AS_ARCH =3D "none"
+TARGET_CC_ARCH =3D "none"
+TARGET_LD_ARCH =3D "none"
+TARGET_OS =3D "linux"
+baselib =3D "lib"
+PACKAGE_ARCH =3D "all"
+
+B =3D "${WORKDIR}/build"
+
+# space separated list of additional distro vendor values we want to suppo=
rt e.g.
+# "yoe webos" or "-yoe -webos" '-' is optional
+CLANG_EXTRA_OE_VENDORS ?=3D "${TARGET_VENDOR} ${SDK_VENDOR}"
+# Extra OE DISTRO that want to support as build host. space separated list=
 of additional distro.
+# ":" separated the ID in "/etc/os-release" and the triple for finding gcc=
 on this OE DISTRO.
+# eg: "poky:poky wrlinux:wrs"
+CLANG_EXTRA_OE_DISTRO ?=3D "poky:poky"
+# Match with MULTILIB_GLOBAL_VARIANTS
+MULTILIB_VARIANTS =3D "lib32 lib64 libx32"
+
+python do_preconfigure() {
+    import subprocess
+    case =3D ""
+    triple =3D ""
+    vendors =3D d.getVar('CLANG_EXTRA_OE_VENDORS')
+    multilib_variants =3D (d.getVar("MULTILIB_VARIANTS") or "").split()
+    vendors_to_add =3D []
+    for vendor in vendors.split():
+        # convert -yoe into yoe
+        vendor =3D vendor.lstrip('-')
+        # generate possible multilib vendor names for yoe
+        # such as yoemllib32
+        vendors_to_add.extend([vendor + 'ml' + variant for variant in mult=
ilib_variants])
+        # skip oe since already part of the cpp file
+        if vendor !=3D "oe":
+            vendors_to_add.append(vendor)
+
+    for vendor_to_add in vendors_to_add:
+        case +=3D '\\n    .Case("' + vendor_to_add + '", Triple::OpenEmbed=
ded)'
+        triple +=3D ' "x86_64-' + vendor_to_add + '-linux",'
+
+    bb.note("Adding support following TARGET_VENDOR values")
+    bb.note(str(vendors_to_add))
+    bb.note("in llvm/lib/TargetParser/Triple.cpp and ${S}/clang/lib/Driver=
/ToolChains/Gnu.cpp")
+    cmd =3D d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_TRIPLES#%s#g' ${S=
}/clang/lib/Driver/ToolChains/Gnu.cpp" % (triple))
+    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, shell=3DTrue)
+    cmd =3D d.expand("sed -i 's#//CLANG_EXTRA_OE_VENDORS_CASES#%s#g' -i ${=
S}/llvm/lib/TargetParser/Triple.cpp" % (case))
+    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, shell=3DTrue)
+
+
+    case =3D ""
+    triple =3D ""
+    name =3D ""
+    check =3D ""
+    oe_names =3D ""
+    distros =3D d.getVar('CLANG_EXTRA_OE_DISTRO')
+    for distro in distros.split():
+        distro_id =3D distro.split(":")[0].replace('-','_')
+        distro_triple =3D distro.split(":")[1]
+        case +=3D '\\n    .Case("' + distro_id + '", Distro::' + distro_id=
.upper() + ')'
+        triple +=3D '\\n   if (Distro.Is' + distro_id.upper() + '())\\n   =
  return "x86_64-' + distro_triple + '-linux",'
+        name +=3D '\\n    '+ distro_id.upper() + ','
+        check +=3D '\\nbool Is' + distro_id.upper() + '() const { return D=
istroVal =3D=3D ' + distro_id.upper() + '; }'
+        oe_names +=3D  distro_id.upper() + ' ||'
+
+    check +=3D '\\nbool IsOpenEmbedded() const { return DistroVal =3D=3D '=
 + oe_names[0:-3] + '; }'
+
+    cmd =3D d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' ${S}/cl=
ang/include/clang/Driver/Distro.h" % (name))
+    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, shell=3DTrue)
+    cmd =3D d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CHECK#%s#g' ${S}/c=
lang/include/clang/Driver/Distro.h" % (check))
+    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, shell=3DTrue)
+    cmd =3D d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_TRIPLES#%s#g' ${S}=
/clang/lib/Driver/ToolChains/Linux.cpp" % (triple))
+    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, shell=3DTrue)
+    cmd =3D d.expand("sed -i 's#//CLANG_EXTRA_OE_DISTRO_CASES#%s#g' -i ${S=
}/clang/lib/Driver/Distro.cpp" % (case))
+    subprocess.check_output(cmd, stderr=3Dsubprocess.STDOUT, shell=3DTrue)
+}
+
+do_patch[vardepsexclude] =3D "MULTILIBS"
+addtask do_preconfigure after do_patch
+do_create_spdx[depends] +=3D "${PN}:do_preconfigure"
diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/rec=
ipes-devtools/clang/nativesdk-clang-glue.bb
new file mode 100644
index 00000000000..a0b93740845
--- /dev/null
+++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
@@ -0,0 +1,36 @@
+# Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
+HOMEPAGE =3D "http://clang.llvm.org/"
+LICENSE =3D "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-ex=
ception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab"
+SECTION =3D "devel"
+
+inherit_defer nativesdk
+DEPENDS +=3D "nativesdk-clang"
+
+do_install() {
+    install -d ${D}${prefix_nativesdk}
+    cd ${D}${prefix_nativesdk}
+    ln -s ..${libdir} .
+    ln -s ..${includedir} .
+    cd ..
+    ln -s .${base_libdir} .
+}
+
+sysroot_stage_all () {
+	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
+}
+
+FILES:${PN} +=3D "${prefix_nativesdk} ${base_libdir_nativesdk}"
+FILES:${PN}-dbg =3D ""
+
+deltask do_configure
+deltask do_compile
+deltask do_patch
+deltask do_fetch
+deltask do_unpack
+deltask do_create_spdx
+deltask do_create_package_spdx
+deltask do_create_runtime_spdx
diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-devto=
ols/clang/openmp_git.bb
new file mode 100644
index 00000000000..34f6e4ab9e5
--- /dev/null
+++ b/meta/recipes-devtools/clang/openmp_git.bb
@@ -0,0 +1,65 @@
+# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION =3D "LLVM based C/C++ compiler Runtime"
+HOMEPAGE =3D "https://openmp.llvm.org/"
+SECTION =3D "libs"
+
+require clang.inc
+require common-source.inc
+
+TOOLCHAIN =3D "clang"
+
+LIC_FILES_CHKSUM =3D "file://openmp/LICENSE.TXT;md5=3Dd75288d1ce0450b28b8d=
58a284c09c79"
+
+inherit cmake pkgconfig perlnative python3native python3targetconfig
+
+DEPENDS +=3D "elfutils libffi clang"
+
+EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
+                  -DLLVM_APPEND_VC_REV=3DOFF \
+                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
+                  -DOPENMP_LIBDIR_SUFFIX=3D${@d.getVar('baselib').replace(=
'lib', '')} \
+                  -DOPENMP_STANDALONE_BUILD=3DON \
+                  -DCLANG_TOOL=3D${STAGING_BINDIR_NATIVE}/clang \
+                  -DLINK_TOOL=3D${STAGING_BINDIR_NATIVE}/llvm-link \
+                  -DOPT_TOOL=3D${STAGING_BINDIR_NATIVE}/opt \
+                  -DOPENMP_LLVM_LIT_EXECUTABLE=3D${STAGING_BINDIR_NATIVE}/=
llvm-lit \
+                  -DEXTRACT_TOOL=3D${STAGING_BINDIR_NATIVE}/llvm-extract \
+                  -DPACKAGER_TOOL=3D${STAGING_BINDIR_NATIVE}/clang-offload=
-packager \
+                  -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
+                  "
+
+OECMAKE_SOURCEPATH =3D "${S}/openmp"
+
+PACKAGECONFIG ?=3D "ompt-tools offloading-plugin"
+
+PACKAGECONFIG:remove:arm =3D "ompt-tools offloading-plugin"
+PACKAGECONFIG:remove:powerpc =3D "ompt-tools offloading-plugin"
+
+PACKAGECONFIG:append:mipsarcho32 =3D " no-atomics"
+
+PACKAGECONFIG[ompt-tools] =3D "-DOPENMP_ENABLE_OMPT_TOOLS=3DON,-DOPENMP_EN=
ABLE_OMPT_TOOLS=3DOFF,"
+PACKAGECONFIG[aliases] =3D "-DLIBOMP_INSTALL_ALIASES=3DON,-DLIBOMP_INSTALL=
_ALIASES=3DOFF,"
+PACKAGECONFIG[offloading-plugin] =3D ",,elfutils libffi,libelf libffi"
+PACKAGECONFIG[no-atomics] =3D "-DLIBOMP_HAVE_BUILTIN_ATOMIC=3DOFF -DLIBOMP=
_LIBFLAGS=3D'-latomic',,"
+
+PACKAGES +=3D "${PN}-libomptarget ${PN}-gdb-plugin"
+FILES_SOLIBSDEV =3D ""
+FILES:${PN} +=3D "${libdir}/lib*${SOLIBSDEV}"
+FILES:${PN}-libomptarget =3D "${libdir}/libomptarget-*.bc"
+FILES:${PN}-gdb-plugin =3D "${datadir}/gdb/python/ompd"
+
+RDEPENDS:${PN}-gdb-plugin +=3D "python3-core"
+
+INSANE_SKIP:${PN} =3D "dev-so"
+# Currently the static libraries contain buildpaths
+INSANE_SKIP:${PN}-staticdev +=3D "buildpaths"
+
+COMPATIBLE_HOST:mips64 =3D "null"
+COMPATIBLE_HOST:riscv32 =3D "null"
+COMPATIBLE_HOST:powerpc =3D "null"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+CVE_STATUS[CVE-2022-26345] =3D "cpe-incorrect: specific to the Intel distr=
ibution before 2022.1"

