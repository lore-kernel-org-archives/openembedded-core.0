Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC14C36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 12:11:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20853.1742991116408207791
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 05:11:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D0F11596
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 05:12:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 460183F63F
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 05:11:55 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] flex: remove obsolete disable-tests.patch
Date: Wed, 26 Mar 2025 12:11:49 +0000
Message-ID: <20250326121151.260340-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213647

We added this because automake was causing things to be built, but now
this doesn't seem to be the case:

  all: all-am

  all-am: Makefile $(SCRIPTS)

  SCRIPTS =3D $(dist_noinst_SCRIPTS)

  dist_noinst_SCRIPTS =3D tableopts.sh

tableopts.sh is a source file that is both in the tarballs and git.

Thus, remove the patch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../flex/flex/disable-tests.patch             | 19 -------------------
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  1 -
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-devtools/flex/flex/disable-tests.patch

diff --git a/meta/recipes-devtools/flex/flex/disable-tests.patch b/meta/r=
ecipes-devtools/flex/flex/disable-tests.patch
deleted file mode 100644
index 4dc801d72c3..00000000000
--- a/meta/recipes-devtools/flex/flex/disable-tests.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Due to automake stupidity the Makefile in tests/ has an 'all' target tha=
t
-depends on $(BUILD_SOURCES), which means when building flex parts of the=
 test
-suite are built even if they're not needed, resulting in flex needing
-flex-native and bison-native to build.
-
-This patch removes the tests directory from SUBDIRS and will be conditio=
nally
-applied by the recipe.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 076ccad..0574d7b 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -55,3 +55,2 @@ SUBDIRS =3D \
- 	po \
--	tests \
- 	tools
diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devt=
ools/flex/flex_2.6.4.bb
index 2236b2bc6a5..434ce47c03a 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -15,7 +15,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De4742cf92e89=
040b39486a6219b68067 \
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/flex-${PV}.tar.gz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
-           ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disabl=
e-tests.patch', d)} \
            file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.pa=
tch \
            file://check-funcs.patch \
            file://0001-Emit-no-line-directives-if-gen_line_dirs-is-false=
.patch \
--=20
2.43.0


