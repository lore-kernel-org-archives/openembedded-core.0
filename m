Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607B3CCA46F
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 17:11:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.3801.1759165893947543369
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 10:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67A7E150C
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:11:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 14E7D3F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 10:11:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] clang: fix reproducibility issue in LLVMConfig.cmake
Date: Mon, 29 Sep 2025 18:11:24 +0100
Message-ID: <20250929171125.2170364-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929171125.2170364-1-ross.burton@arm.com>
References: <20250929171125.2170364-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 17:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224161

The LLVMConfig.cmake file is mostly LLVM configuration, but it also
specifies if some Python modules (needed by the opt-viewer tool) were
present on the build host.

This is host contamination and a source of non-determinism, so remove it
from the installed file.

A ticket has been filed upstream to resolve this:

  https://github.com/llvm/llvm-project/issues/161199

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch | 29 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-dont-expose-LL=
VM_HAVE_OPT_VIEWER_MODULES.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-dont-expose-LLVM_HAVE=
_OPT_VIEWER_MODULES.patch b/meta/recipes-devtools/clang/clang/0001-dont-e=
xpose-LLVM_HAVE_OPT_VIEWER_MODULES.patch
new file mode 100644
index 00000000000..4f6ab6d00f5
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-dont-expose-LLVM_HAVE_OPT_VI=
EWER_MODULES.patch
@@ -0,0 +1,29 @@
+From b6af0a5b42adfbebaca1ee673d4c1d9d10fbacfb Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 29 Sep 2025 14:44:05 +0100
+Subject: [PATCH] Don't expose LLVM_HAVE_OPT_VIEWER_MODULES externally
+
+This variable states whether at build-time some python modules were pres=
ent,
+which is meaningless and simply introduces non-deterministic behaviour.
+
+Upstream-Status: Pending [https://github.com/llvm/llvm-project/issues/16=
1199]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ llvm/cmake/modules/LLVMConfig.cmake.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/llvm/cmake/modules/LLVMConfig.cmake.in b/llvm/cmake/modules=
/LLVMConfig.cmake.in
+index c15b9576cd5d..9cff70e4ef8e 100644
+--- a/llvm/cmake/modules/LLVMConfig.cmake.in
++++ b/llvm/cmake/modules/LLVMConfig.cmake.in
+@@ -135,7 +135,6 @@ set(LLVM_DEFINITIONS "@LLVM_DEFINITIONS@")
+ set(LLVM_BINARY_DIR "@LLVM_CONFIG_BINARY_DIR@")
+ set(LLVM_CMAKE_DIR "@LLVM_CONFIG_CMAKE_DIR@")
+ set(LLVM_TOOLS_BINARY_DIR "@LLVM_CONFIG_TOOLS_BINARY_DIR@")
+-set(LLVM_HAVE_OPT_VIEWER_MODULES @LLVM_HAVE_OPT_VIEWER_MODULES@)
+ set(LLVM_CONFIGURATION_TYPES @CMAKE_CONFIGURATION_TYPES@)
+ set(LLVM_ENABLE_SHARED_LIBS @BUILD_SHARED_LIBS@)
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index 512bf1dd028..b8f7d410899 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -61,6 +61,7 @@ SRC_URI =3D "\
     file://0038-Prevent-revisiting-block-when-searching-for-noreturn.pat=
ch \
     file://0039-Only-build-c-index-test-when-clang-tests-are-include.pat=
ch \
     file://0001-Install-lldb-tblgen.patch \
+    file://0001-dont-expose-LLVM_HAVE_OPT_VIEWER_MODULES.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
--=20
2.43.0


