Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 183BCD33A2B
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.28083.1730832352589393637
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fh1nBVbh;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2bb1efe78so77153a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832352; x=1731437152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPZMUAzq5xtA38zHOIyK2dT/ynl0SX29dwxZaQ7useE=;
        b=Fh1nBVbhaXL0kxhP/UEDK7e/dcT2ujAF5nZ9BZIw8CCVksFrCHnPPcoIXGajG+4/MU
         zXAWuWsW/THbewtpVXZvozfkxnYqr1hsyPOJBZNwbcOt+cM0+HmJCN0PepL/qvlYClDZ
         s25PqfVifolLctjw/S6ArGSUYPciY1SrSz1s+yx0HRXf6RbEvlmvVZuZRn/PLhqTBa0V
         bG6azp5CmB5ucH5+DLZiIqVV1i0DkWc+3pRUroClKtAl0uwV/4Bk6d42QTPcHtYSInB+
         9Zslqt3AZ2hZmTull4Wa77UAv3PQIC+EmwLCGUn1rtsRQvf37PtM2bBs7uE6y02c3YNo
         lOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832352; x=1731437152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPZMUAzq5xtA38zHOIyK2dT/ynl0SX29dwxZaQ7useE=;
        b=KRtYNMBQbgXTzgs8RbDppVOON38qmah+Q/6APl6ysFcRlLPvpAJEugsa/kqUCkvjNB
         whtPYoGJnA2Rp+Gk7lUElyyK2E+f/e1qfP3r832L0i/l5zI1w/KEmsfdKnWzT/c1rPl8
         zNepW00Xe689gIOxNdi3cbb9XWZklP24E/qPFprK6Oa1I8eSNJWSCDXRy0RJ1OcEjLEE
         mRpYx1h8HXr6GlzjZZLHVERzCeXHfgxjE+WbZ3HJnlG1egDjh5r3u+s259tBjygvZOpJ
         7peef3bOe3ku9kZTobMdUiboXj5E1ymM3dR0M+pukvMyxWBvcxwvw8iV/4/nxPx85zWp
         bMJQ==
X-Gm-Message-State: AOJu0Yyu1j177fqCc9bpQjCm/2OH9MYc6TOyjsaYTEFBRXczfQHqVIiM
	gXEt8gnpX8k8P3366/HwoW72p1VRezISmV/ehLoUaCBeIEf05wd0UP6a8w==
X-Google-Smtp-Source: AGHT+IGWF/V6JNlluZG6ILq9DYB3a7fjHkJlZef8CozzVpK84FakpiMoLtNhgGu8dteG3hlSoj6XGQ==
X-Received: by 2002:a17:90b:1a8f:b0:2da:82d4:c63c with SMTP id 98e67ed59e1d1-2e94bcb6255mr26008918a91.4.1730832351680;
        Tue, 05 Nov 2024 10:45:51 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 09/19] llvm: Delete
Date: Tue,  5 Nov 2024 10:45:28 -0800
Message-ID: <20241105184540.3450302-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206737

clang recipes would PROVIDE and RPROVIDE llvm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-sort-ClassInfo-lists-by-name-as-we.patch |  31 ---
 ...-llvm-allow-env-override-of-exe-path.patch |  37 ----
 meta/recipes-devtools/llvm/llvm/llvm-config   |  51 -----
 meta/recipes-devtools/llvm/llvm_19.1.2.bb     | 179 ------------------
 4 files changed, 298 deletions(-)
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
 delete mode 100644 meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
 delete mode 100644 meta/recipes-devtools/llvm/llvm/llvm-config
 delete mode 100644 meta/recipes-devtools/llvm/llvm_19.1.2.bb

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index a5c53b66574..00000000000
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 73724e662f9e..1ca9c73415db 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -361,7 +361,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the backends
-     // accidentally rely on this behaviour, so it will have to stay like this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName != RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and binary reproducibility
-+    return Name < RHS.Name;
-   }
- };
- 
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
deleted file mode 100644
index add38b3bb4d..00000000000
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH] llvm: allow env override of exe and libdir path
-
-When using a native llvm-config from inside a sysroot, we need llvm-config to
-return the libraries, include directories, etc. from inside the sysroot rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
- 1 file changed, 19 insertions(+), 6 deletions(-)
-
-diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index e86eb2b44b10..7b2abf318dbe 100644
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -246,6 +246,13 @@ Typical components:\n\
- 
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are using
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot = std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot != nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P = (void *)(intptr_t)GetExecutablePath;
- 
diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
deleted file mode 100644
index 5e4ded2da5b..00000000000
--- a/meta/recipes-devtools/llvm/llvm/llvm-config
+++ /dev/null
@@ -1,51 +0,0 @@
-#!/bin/bash
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-# Wrap llvm-config since the native llvm-config will remap some values correctly
-# if placed in the target sysroot but for flags, it would provide the native ones.
-# Provide ours from the environment instead.
-
-NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
-if [[ $# == 0 ]]; then
-  exec "$NEXT_LLVM_CONFIG"
-fi
-
-remain=""
-output=""
-for arg in "$@"; do
-  case "$arg" in
-    --cppflags)
-      output="${output} ${CPPFLAGS}"
-      ;;
-    --cflags)
-      output="${output} ${CFLAGS}"
-      ;;
-    --cxxflags)
-      output="${output} ${CXXFLAGS}"
-      ;;
-    --ldflags)
-      output="${output} ${LDFLAGS}"
-      ;;
-    --shared-mode)
-      output="${output} shared"
-      ;;
-    --libs)
-      output="${output} -lLLVM"
-      ;;
-    --link-shared)
-      break
-      ;;
-    *)
-      remain="${remain} ${arg}"
-      ;;
-  esac
-done
-
-if [ "${remain}" != "" ]; then
-      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
-fi
-
-echo "${output}"
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.2.bb b/meta/recipes-devtools/llvm/llvm_19.1.2.bb
deleted file mode 100644
index 7128d1e71ee..00000000000
--- a/meta/recipes-devtools/llvm/llvm_19.1.2.bb
+++ /dev/null
@@ -1,179 +0,0 @@
-# Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "The LLVM Compiler Infrastructure"
-HOMEPAGE = "http://llvm.org"
-LICENSE = "Apache-2.0-with-LLVM-exception"
-SECTION = "devel"
-
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
-
-DEPENDS = "libffi libxml2 zlib zstd libedit ninja-native llvm-native"
-
-RDEPENDS:${PN}:append:class-target = " ncurses-terminfo"
-
-inherit cmake pkgconfig
-# could be 'rcX' or 'git' or empty ( for release )
-VER_SUFFIX = ""
-
-PV .= "${VER_SUFFIX}"
-
-MAJOR_VERSION = "${@oe.utils.trim_version("${PV}", 1)}"
-
-LLVM_RELEASE = "${PV}"
-
-SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/llvm-project-${PV}.src.tar.xz \
-           file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-           file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-           file://llvm-config \
-           "
-SRC_URI[sha256sum] = "3666f01fc52d8a0b0da83e107d74f208f001717824be0b80007f529453aa1e19"
-UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
-UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-
-S = "${WORKDIR}/llvm-project-${PV}.src/llvm"
-
-LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-
-def get_llvm_arch(bb, d, arch_var):
-    import re
-    a = d.getVar(arch_var)
-    if   re.match(r'(i.86|athlon|x86.64)$', a):         return 'X86'
-    elif re.match(r'arm$', a):                          return 'ARM'
-    elif re.match(r'armeb$', a):                        return 'ARM'
-    elif re.match(r'aarch64$', a):                      return 'AArch64'
-    elif re.match(r'aarch64_be$', a):                   return 'AArch64'
-    elif re.match(r'mips(isa|)(32|64|)(r6|)(el|)$', a): return 'Mips'
-    elif re.match(r'riscv(32|64)(eb|)$', a):            return 'RISCV'
-    elif re.match(r'p(pc|owerpc)(|64)', a):             return 'PowerPC'
-    else:
-        raise bb.parse.SkipRecipe("Cannot map '%s' to a supported LLVM architecture" % a)
-
-def get_llvm_host_arch(bb, d):
-    return get_llvm_arch(bb, d, 'HOST_ARCH')
-
-PACKAGECONFIG ??= "libllvm"
-# if optviewer OFF, force the modules to be not found or the ones on the host would be found
-PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
-PACKAGECONFIG[libllvm] = ""
-
-#
-# Default to build all OE-Core supported target arches (user overridable).
-#
-LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
-
-ARM_INSTRUCTION_SET:armv5 = "arm"
-ARM_INSTRUCTION_SET:armv4t = "arm"
-
-EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
-                  -DLLVM_ENABLE_EXPENSIVE_CHECKS=OFF \
-                  -DLLVM_ENABLE_PIC=ON \
-                  -DLLVM_BINDINGS_LIST='' \
-                  -DLLVM_LINK_LLVM_DYLIB=ON \
-                  -DLLVM_ENABLE_FFI=ON \
-                  -DLLVM_ENABLE_RTTI=ON \
-                  -DFFI_INCLUDE_DIR=$(pkg-config --variable=includedir libffi) \
-                  -DLLVM_OPTIMIZED_TABLEGEN=ON \
-                  -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS}' \
-                  -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
-                  -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
-                  -DCMAKE_BUILD_TYPE=Release \
-                 "
-
-EXTRA_OECMAKE:append:class-target = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                 "
-
-EXTRA_OECMAKE:append:class-nativesdk = "\
-                  -DCMAKE_CROSSCOMPILING:BOOL=ON \
-                  -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
-                  -DLLVM_CONFIG_PATH=${STAGING_BINDIR_NATIVE}/llvm-config${PV} \
-                 "
-
-# patch out build host paths for reproducibility
-do_compile:prepend:class-target() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_compile:prepend:class-nativesdk() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/tools/llvm-config/BuildVariables.inc
-}
-
-do_compile() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
-	ninja -v ${PARALLEL_MAKE}
-    else
-	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
-    fi
-}
-
-do_install() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
-	DESTDIR=${D} ninja -v install
-
-        # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
-        mv -T -n ${D}/${prefix}/lib ${D}/${libdir} || true
-
-        # Remove opt-viewer: https://llvm.org/docs/Remarks.html
-        rm -rf ${D}${datadir}/opt-viewer
-        rmdir ${D}${datadir}
-
-        # reproducibility
-        sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
-    fi
-}
-
-do_install:append:class-native() {
-	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
-	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
-	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
-}
-
-SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
-
-llvm_sysroot_preprocess() {
-	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 0755 ${UNPACKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
-}
-
-PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
-
-RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
-
-FILES:${PN}-bugpointpasses = "\
-    ${libdir}/BugpointPasses.so \
-"
-
-FILES:${PN}-libllvm = "\
-    ${libdir}/libLLVM-${MAJOR_VERSION}.so \
-    ${libdir}/libLLVM.so.${MAJOR_VER}.${MINOR_VER} \
-"
-
-FILES:${PN}-liblto += "\
-    ${libdir}/libLTO.so.* \
-"
-
-FILES:${PN}-liboptremarks += "\
-    ${libdir}/libRemarks.so.* \
-"
-
-FILES:${PN}-llvmhello = "\
-    ${libdir}/LLVMHello.so \
-"
-
-FILES:${PN}-dev += " \
-    ${libdir}/llvm-config \
-    ${libdir}/libRemarks.so \
-    ${libdir}/libLLVM-${PV}.so \
-"
-
-FILES:${PN}-staticdev += "\
-    ${libdir}/*.a \
-"
-
-INSANE_SKIP:${PN}-libllvm += "dev-so"
-
-BBCLASSEXTEND = "native nativesdk"

