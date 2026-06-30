Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCA3C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 19:00:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28904.1782846017438381704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 12:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KKSuF/iJ;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782846017; x=1814382017;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2+f1isH8lCESQyDfT6QNqs+Zj5WwDniZgTPjGvbczTo=;
  b=KKSuF/iJvbGWV0fKCA2Su0XfBFWIMdg8z0Bndm8rL7nTnBz4Ha4wnlZE
   tXT8fNIgFNTmDEa5skCSgH/BGNciFE7zqnzAUc0c3WDP9WrFBaEP90sMK
   nyqxJfTalT0dE+L3TuFmGubx0PedJrSYiy3JrIecSDgK1HeOrs3ng4k24
   2TZ6YKcfaKPYtognTsLLsMcOdxIpbLP5LW7hViSgbP5iMsS2u6AESYXQV
   BiwWgTDFZ8a7WxBM7Tge8aNYbfzxH6O9qVAi7H+OHNa+G5YADKpdJJPzX
   GJJnbmVXzIGBHF6hllXp8488xvFE4fMHz0p6+nMbCfYC7wqa8jrOhwFib
   g==;
X-CSE-ConnectionGUID: sMnvDlvqRmKGX5JytGhAFg==
X-CSE-MsgGUID: MY79Un/GRhy79Zz0pque9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82683900"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="82683900"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 12:00:17 -0700
X-CSE-ConnectionGUID: a4DUYBiBSlys37xjLAE2Gw==
X-CSE-MsgGUID: LE4PcNCMTjuqZ9YWw7BXUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="250633862"
Received: from andromeda02.png.intel.com ([10.107.232.49])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 12:00:16 -0700
From: yogesh.tyagi@intel.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH] bindgen-cli: set CLANG_PATH in native wrapper to native clang
Date: Wed,  1 Jul 2026 03:00:04 +0800
Message-ID: <20260630190004.1083997-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 19:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239913

From: Yogesh Tyagi <yogesh.tyagi@intel.com>

bindgen uses the clang-sys crate to locate a 'clang' executable for
querying default include paths. clang-sys's search order is CLANG_PATH,
then libclang's directory, then 'llvm-config --bindir', then PATH.

When clang is used as the toolchain, the crossscripts llvm-config wrapper
honours YOCTO_ALTERNATE_EXE_PATH and reports the target sysroot bindir.
clang-sys's 'llvm-config --bindir' step then resolves to a target clang
that cannot execute on the build host, so native bindgen fails with:

  could not run executable .../recipe-sysroot/usr/bin/clang-NN:
  No such file or directory (os error 2)

This is hit, for example, when building mesa with the rusticl/opencl
PACKAGECONFIG, whose do_compile runs the native bindgen against
rusticl_mesa_bindings.h.

Set CLANG_PATH to the native clang in the bindgen wrapper so clang-sys
uses the runnable host binary first, short-circuiting the llvm-config
lookup. The native wrapper already exports LIBCLANG_PATH the same way.

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 .../bindgen-cli/bindgen-cli_0.72.1.bb               | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
index 72dadfe52f..1e2b901aab 100644
--- a/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
+++ b/meta/recipes-devtools/bindgen-cli/bindgen-cli_0.72.1.bb
@@ -11,8 +11,19 @@ SRCREV = "d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5"
 
 require ${BPN}-crates.inc
 
+# bindgen uses the clang-sys crate to locate a 'clang' executable for querying
+# default include paths. clang-sys's search order is: CLANG_PATH, libclang's dir,
+# 'llvm-config --bindir', then PATH. When clang is the toolchain, the crossscripts
+# llvm-config wrapper honours YOCTO_ALTERNATE_EXE_PATH and reports the target
+# sysroot bindir, so clang-sys's 'llvm-config --bindir' step resolves to a target
+# clang that cannot run on the build host (native bindgen then fails with
+# "could not run executable .../clang-NN: No such file or directory", e.g. when
+# building mesa with the rusticl/opencl PACKAGECONFIG). Set CLANG_PATH to the
+# native clang so the runnable host binary is used first.
 do_install:append:class-native() {
-	create_wrapper ${D}/${bindir}/bindgen LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}"
+	create_wrapper ${D}/${bindir}/bindgen \
+		LIBCLANG_PATH="${STAGING_LIBDIR_NATIVE}" \
+		CLANG_PATH="${STAGING_BINDIR_NATIVE}/clang"
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


