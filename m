Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FFFCAC5B7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:08:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10925.1758715719932442666
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 738EB106F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:08:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3C2483F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:08:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 5/7] clang: improve tablegen installation
Date: Wed, 24 Sep 2025 13:08:32 +0100
Message-ID: <20250924120834.2886320-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924120834.2886320-1-ross.burton@arm.com>
References: <20250924120834.2886320-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223971

Backport a patch from upstream to install lldb-tblgen, and change the
llvm-tblgen-native recipe to use `cmake --install` instead of copying
the binaries.

This ensures that CMake does any post-install steps that are needed, and
we don't install binaries that have eg RPATHs pointing at the build tree.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../clang/0001-Install-lldb-tblgen.patch      | 29 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 .../clang/llvm-tblgen-native_git.bb           |  8 ++---
 3 files changed, 33 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0001-Install-lldb-t=
blgen.patch

diff --git a/meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.p=
atch b/meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch
new file mode 100644
index 00000000000..c9741675893
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0001-Install-lldb-tblgen.patch
@@ -0,0 +1,29 @@
+From 7de6d35aeea2d06b1597539c47f6af30d2798d73 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 19 Sep 2025 16:33:55 +0100
+Subject: [PATCH] Install lldb-tblgen
+
+In keeping with the llvm-tblgen and clang-tblgen binaries, allow
+lldb-tblgen to be installed by cmake so that cross builds are easier.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/0=
ce6052a0c08035a07fcabb05271be7313308db3]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ lldb/utils/TableGen/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lldb/utils/TableGen/CMakeLists.txt b/lldb/utils/TableGen/CM=
akeLists.txt
+index 0ac010bcda35..ce96dddd4420 100644
+--- a/lldb/utils/TableGen/CMakeLists.txt
++++ b/lldb/utils/TableGen/CMakeLists.txt
+@@ -8,6 +8,7 @@ if (NOT DEFINED LLDB_TABLEGEN_EXE)
+     set(LLVM_LINK_COMPONENTS Support)
+=20
+     add_tablegen(lldb-tblgen LLDB
++      DESTINATION "${CMAKE_INSTALL_BINDIR}"
+       LLDBOptionDefEmitter.cpp
+       LLDBPropertyDefEmitter.cpp
+       LLDBTableGen.cpp
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index e01eb2d2879..512bf1dd028 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,7 @@ SRC_URI =3D "\
     file://0037-Revert-libc-Remap-headers-in-the-debug-info-when-bui.pat=
ch \
     file://0038-Prevent-revisiting-block-when-searching-for-noreturn.pat=
ch \
     file://0039-Only-build-c-index-test-when-clang-tests-are-include.pat=
ch \
+    file://0001-Install-lldb-tblgen.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??=3D ""
diff --git a/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb b/meta=
/recipes-devtools/clang/llvm-tblgen-native_git.bb
index be04c1aa4d1..8023d745782 100644
--- a/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb
+++ b/meta/recipes-devtools/clang/llvm-tblgen-native_git.bb
@@ -16,12 +16,10 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
=20
 EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelease -DLLVM_ENABLE_PROJECTS=3D=
'llvm;clang;lldb'"
=20
-BINARIES =3D "llvm-min-tblgen llvm-tblgen clang-tblgen lldb-tblgen"
-
-OECMAKE_TARGET_COMPILE =3D "${BINARIES}"
+OECMAKE_TARGET_COMPILE =3D "llvm-tblgen clang-tblgen lldb-tblgen"
=20
 do_install() {
-    for f in ${BINARIES}; do
-        install -D ${B}/bin/$f ${D}${bindir}/$f
+    for TARGET in ${OECMAKE_TARGET_COMPILE}; do
+        DESTDIR=3D${D} cmake --install ${B} --component $TARGET
     done
 }
--=20
2.43.0


