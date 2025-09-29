Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAE7CAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 17:11:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3971.1759165894497101274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 10:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F859150C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:11:26 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B0E873F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:11:33 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] clang: build with MinSizeRel
Date: Mon, 29 Sep 2025 18:11:25 +0100
Message-ID: <20250929171125.2170364-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929171125.2170364-1-ross.burton@arm.com>
References: <20250929171125.2170364-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 17:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224162

This is the recommended build configuration upstream unless speed is the
ultimate goal. They say it's almost as fast as Release (-O3) but a lot
smaller on disk:

  clang-libclang-cpp: PKGSIZE changed from 71729568 to 49368816 (-31%)
  clang-libllvm: PKGSIZE changed from 83015559 to 56662823 (-32%)
  clang-tidy: PKGSIZE changed from 15861679 to 9956175 (-37%)
  clang-tools: PKGSIZE changed from 6865635 to 5374691 (-22%)
  clang: PKGSIZE changed from 29693308 to 22697548 (-24%)
  libclang: PKGSIZE changed from 40087018 to 26966218 (-33%)

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 53bca1c24f8..f25633a5861 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -112,7 +112,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir libffi) \
                   -DLLVM_BUILD_EXTERNAL_COMPILER_RT=3DON \
                   -DCMAKE_SYSTEM_NAME=3DLinux \
-                  -DCMAKE_BUILD_TYPE=3DRelease \
+                  -DCMAKE_BUILD_TYPE=3DMinSizeRel \
                   -DLLVM_ENABLE_PROJECTS=3D'${LLVM_PROJECTS}' \
                   -DLLVM_BINUTILS_INCDIR=3D${STAGING_INCDIR} \
                   -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
@@ -175,7 +175,7 @@ do_install:append() {
=20
 do_install:append:class-target () {
     # Allow bin path to change based on YOCTO_ALTERNATE_EXE_PATH
-    sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdi=
r}/cmake/llvm/LLVMExports-release.cmake
+    sed -i 's;${_IMPORT_PREFIX}/bin;${_IMPORT_PREFIX_BIN};g' ${D}${libdi=
r}/cmake/llvm/LLVMExports-*.cmake
=20
     # Insert function to populate Import Variables
     sed -i "4i\
@@ -183,7 +183,7 @@ if(DEFINED ENV{YOCTO_ALTERNATE_EXE_PATH})\n\
   execute_process(COMMAND \"llvm-config\" \"--bindir\" OUTPUT_VARIABLE _=
IMPORT_PREFIX_BIN OUTPUT_STRIP_TRAILING_WHITESPACE)\n\
 else()\n\
   set(_IMPORT_PREFIX_BIN \"\${_IMPORT_PREFIX}/bin\")\n\
-endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-release.cmake
+endif()\n" ${D}${libdir}/cmake/llvm/LLVMExports-*.cmake
=20
     if [ -n "${LLVM_LIBDIR_SUFFIX}" ]; then
         mkdir -p ${D}${nonarch_libdir}
--=20
2.43.0


