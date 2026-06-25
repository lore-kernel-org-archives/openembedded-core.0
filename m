Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3D6CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:31:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11597.1782394289801228065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=lSxaux02;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA6BE165C
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:31:24 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.2.203.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBD7C3F62B
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782394289; bh=P6etbWUJPrM+tLFMwL3YaQlyhb3nt84V6nTt9a9VaIE=;
	h=From:To:Subject:Date:From;
	b=lSxaux02+AejnJB8Jwkp5HPbrn4vHDxKLTeSw3shqlnswVjyMFQq/kUZsehrUwNqT
	 5nqBqIa5eFaHzV6n/eAalucZW4s37wFwzIYjcxREVTznPlhDvTHA8De+dm6zTxYWLy
	 sta6M8upLbWlZWE+6t+kSNutipHMTHf3xCVK2mw0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] llvm: Enable MLIR support
Date: Thu, 25 Jun 2026 14:31:20 +0100
Message-Id: <20260625133120.2111653-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239565

Enable the MLIR LLVM project in the clang folder so the compiler
flow can use MLIR and TOSA APIs that are not provided by a plain
LLVM build.

Add a patch that fix the install targets for mlir-src-sharder
and mlir-irdl-to-cpp.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 ...l-helper-tools-used-by-CMake-exports.patch | 59 +++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 meta/recipes-devtools/clang/llvm-mlir_git.bb  | 66 +++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0042-MLIR-Install-h=
elper-tools-used-by-CMake-exports.patch
 create mode 100644 meta/recipes-devtools/clang/llvm-mlir_git.bb

diff --git a/meta/recipes-devtools/clang/clang/0042-MLIR-Install-helper-t=
ools-used-by-CMake-exports.patch b/meta/recipes-devtools/clang/clang/0042=
-MLIR-Install-helper-tools-used-by-CMake-exports.patch
new file mode 100644
index 000000000000..6079e61c9cc2
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0042-MLIR-Install-helper-tools-us=
ed-by-CMake-exports.patch
@@ -0,0 +1,59 @@
+From e5f6551510eb2adb1fffe9564965101e05ca9720 Mon Sep 17 00:00:00 2001
+From: Momchil Velikov <momchil.velikov@arm.com>
+Date: Fri, 19 Jun 2026 18:00:51 +0000
+Subject: [PATCH] [MLIR] Install missing standalone helper tools
+
+Standalone MLIR installs CMake package files that can reference helper
+executables needed by downstream builds. Most helper tools already have
+install paths available through existing LLVM tool and utility install
+options, but mlir-src-sharder does not pass an install destination to
+add_tablegen and mlir-irdl-to-cpp does not define an install rule.
+
+Install those two missing helpers.
+
+Co-Authored-by: Luca Fancellu <luca.fancellu@arm.com>
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/20=
5066]
+
+Backported to oe-core version of clang.
+
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ mlir/tools/mlir-irdl-to-cpp/CMakeLists.txt | 11 +++++++++++
+ mlir/tools/mlir-src-sharder/CMakeLists.txt |  2 ++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/mlir/tools/mlir-irdl-to-cpp/CMakeLists.txt b/mlir/tools/mli=
r-irdl-to-cpp/CMakeLists.txt
+index 27a7e22db7d7..5b69b364c6b3 100644
+--- a/mlir/tools/mlir-irdl-to-cpp/CMakeLists.txt
++++ b/mlir/tools/mlir-irdl-to-cpp/CMakeLists.txt
+@@ -7,3 +7,14 @@ mlir_target_link_libraries(mlir-irdl-to-cpp
+   )
+=20
+ setup_host_tool(mlir-irdl-to-cpp MLIR_IRDL_TO_CPP MLIR_IRDL_TO_CPP_EXE =
MLIR_IRDL_TO_CPP_TARGET)
++
++if(NOT LLVM_INSTALL_TOOLCHAIN_ONLY)
++  install(TARGETS mlir-irdl-to-cpp
++          RUNTIME DESTINATION "${MLIR_TOOLS_INSTALL_DIR}"
++          COMPONENT mlir-irdl-to-cpp)
++  if(NOT LLVM_ENABLE_IDE)
++    add_llvm_install_targets(install-mlir-irdl-to-cpp
++                             DEPENDS mlir-irdl-to-cpp
++                             COMPONENT mlir-irdl-to-cpp)
++  endif()
++endif()
+diff --git a/mlir/tools/mlir-src-sharder/CMakeLists.txt b/mlir/tools/mli=
r-src-sharder/CMakeLists.txt
+index 6f98bd15fc18..07ad45e52592 100644
+--- a/mlir/tools/mlir-src-sharder/CMakeLists.txt
++++ b/mlir/tools/mlir-src-sharder/CMakeLists.txt
+@@ -2,6 +2,8 @@ set(LLVM_LINK_COMPONENTS Support)
+ set(LIBS MLIRSupport)
+=20
+ add_tablegen(mlir-src-sharder MLIR_SRC_SHARDER
++  DESTINATION "${MLIR_TOOLS_INSTALL_DIR}"
++  EXPORT MLIR
+   mlir-src-sharder.cpp
+=20
+   DEPENDS
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index 441ea099a9e1..96c6f1217176 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,7 @@ SRC_URI =3D "\
     file://0039-Rename-UNUSED-and-UNKNOWN-elements-of-OffloadArch-enum.p=
atch \
     file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.pat=
ch \
     file://0041-Consolidate-and-fix-sysroot-based-compiler-rt-search.pat=
ch \
+    file://0042-MLIR-Install-helper-tools-used-by-CMake-exports.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
diff --git a/meta/recipes-devtools/clang/llvm-mlir_git.bb b/meta/recipes-=
devtools/clang/llvm-mlir_git.bb
new file mode 100644
index 000000000000..f9f52a236489
--- /dev/null
+++ b/meta/recipes-devtools/clang/llvm-mlir_git.bb
@@ -0,0 +1,66 @@
+#
+# SPDX-FileCopyrightText: <text>Copyright 2026 Arm Limited and/or its
+# affiliates <open-source-office@arm.com></text>
+#
+# SPDX-License-Identifier: MIT
+
+SUMMARY =3D "MLIR compiler infrastructure"
+DESCRIPTION =3D "MLIR is a reusable and extensible compiler infrastructu=
re from the LLVM project."
+HOMEPAGE =3D "https://mlir.llvm.org"
+SECTION =3D "devel"
+
+require common-clang.inc
+require common-source.inc
+
+LICENSE =3D "Apache-2.0-with-LLVM-exception"
+LIC_FILES_CHKSUM =3D "file://mlir/LICENSE.TXT;md5=3D7ef1911355f6e321fa0d=
7971689b7a67"
+
+inherit cmake pkgconfig
+
+DEPENDS =3D "llvm"
+DEPENDS:append:class-target =3D " llvm-mlir-native"
+DEPENDS:append:class-nativesdk =3D " llvm-mlir-native"
+
+OECMAKE_SOURCEPATH =3D "${S}/mlir"
+
+PACKAGECONFIG ??=3D "shared-libs"
+PACKAGECONFIG[shared-libs] =3D "\
+    -DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_LINK_LLVM_DYLIB=3DON -DMLIR_LINK=
_MLIR_DYLIB=3DON, \
+    -DLLVM_BUILD_LLVM_DYLIB=3DOFF -DLLVM_LINK_LLVM_DYLIB=3DOFF -DMLIR_LI=
NK_MLIR_DYLIB=3DOFF, \
+"
+
+MLIR_NATIVE_TOOLS_OECMAKE =3D "\
+    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
+    -DMLIR_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/mlir-tblgen \
+    -DMLIR_PDLL_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/mlir-pdll \
+    -DMLIR_IRDL_TO_CPP=3D${STAGING_BINDIR_NATIVE}/mlir-irdl-to-cpp \
+    -DMLIR_LINALG_ODS_YAML_GEN=3D${STAGING_BINDIR_NATIVE}/mlir-linalg-od=
s-yaml-gen \
+"
+MLIR_NATIVE_TOOLS_OECMAKE:class-native =3D ""
+
+EXTRA_OECMAKE +=3D "\
+    -DCMAKE_BUILD_TYPE=3DMinSizeRel \
+    -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm \
+    -DLLVM_ENABLE_ASSERTIONS=3DOFF \
+    -DLLVM_ENABLE_PIC=3DON \
+    -DMLIR_ENABLE_BINDINGS_PYTHON=3DOFF \
+    -DMLIR_INCLUDE_TESTS=3DOFF \
+    -DMLIR_INCLUDE_INTEGRATION_TESTS=3DOFF \
+    -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FILE=3D${WORKDIR=
}/toolchain-native.cmake' \
+    -DLLVM_BUILD_UTILS=3DON \
+    -DLLVM_BUILD_TOOLS=3DON \
+    -DLLVM_INSTALL_TOOLCHAIN_ONLY=3DOFF \
+    ${MLIR_NATIVE_TOOLS_OECMAKE} \
+"
+
+OECMAKE_TARGET_COMPILE:class-native =3D "all mlir-src-sharder"
+
+PACKAGES =3D+ "${PN}-tools"
+
+FILES:${PN}-tools +=3D "\
+    ${bindir}/mlir-* \
+    ${bindir}/tblgen-* \
+"
+FILES:${PN}-dev +=3D "${libdir}/objects-*"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


