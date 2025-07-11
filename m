Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0035BC83F20
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 15:51:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17339.1752249103263642421
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 08:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FACD16F8
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 08:51:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6DA3F3F6A8
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 08:51:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] clang: move BPN assignment from common.inc
Date: Fri, 11 Jul 2025 16:51:34 +0100
Message-ID: <20250711155136.2172651-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 15:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220145

There's a BPN assignment in common.inc which means all recipes need to
either be called clang, or set BPN themselves.

Move the assignment to the clang recipes. For now I'm leaving the
existing BPN assignments in the other recipes, in case there are complex
multilib-related reasons to retain them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang-cross-canadian_git.bb | 1 +
 meta/recipes-devtools/clang/clang-cross_git.bb          | 1 +
 meta/recipes-devtools/clang/clang-crosssdk_git.bb       | 1 +
 meta/recipes-devtools/clang/clang_git.bb                | 2 ++
 meta/recipes-devtools/clang/common.inc                  | 2 --
 5 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/me=
ta/recipes-devtools/clang/clang-cross-canadian_git.bb
index 456c0d61bc5..0e84d3ac9a3 100644
--- a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache=
-2.0-with-LLVM-exception;
 SECTION =3D "devel"
=20
 PN =3D "clang-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+BPN =3D "clang"
=20
 require common-clang.inc
 require common-source.inc
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipe=
s-devtools/clang/clang-cross_git.bb
index 323cc0d8809..99e48522a0b 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache=
-2.0-with-LLVM-exception;
 SECTION =3D "devel"
=20
 PN =3D "clang-cross-${TARGET_ARCH}"
+BPN =3D "clang"
=20
 require common-clang.inc
 require common-source.inc
diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/rec=
ipes-devtools/clang/clang-crosssdk_git.bb
index ef162ef153f..234d4635784 100644
--- a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
+++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache=
-2.0-with-LLVM-exception;
 SECTION =3D "devel"
=20
 PN =3D "clang-crosssdk-${SDK_SYS}"
+BPN =3D "clang"
=20
 require common-clang.inc
 require common-source.inc
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 23dfbb5deb6..2b5d3a27524 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -17,6 +17,8 @@ SECTION =3D "devel"
 require common-clang.inc
 require common-source.inc
=20
+BPN =3D "clang"
+
 INHIBIT_DEFAULT_DEPS:class-native =3D "1"
=20
 LDFLAGS:append:class-target:riscv32 =3D " -Wl,--no-as-needed -latomic -W=
l,--as-needed"
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtoo=
ls/clang/common.inc
index 37d37ec1975..a9d6f899c03 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -71,5 +71,3 @@ B ?=3D "${WORKDIR}/llvm-project-source-${PV}/build.${HO=
ST_SYS}.${TARGET_SYS}"
 # The real WORKDIR location isn't a dependency for the shared workdir.
 src_patches[vardepsexclude] =3D "WORKDIR"
 should_apply[vardepsexclude] +=3D "PN"
-
-BPN =3D "clang"
--=20
2.43.0


