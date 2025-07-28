Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C33C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 15:56:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.84734.1753718160690424160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 08:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B5D4153B
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 08:55:52 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8A313F5A1
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 08:55:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] clang-cross: trim the recipe
Date: Mon, 28 Jul 2025 16:55:53 +0100
Message-ID: <20250728155554.2624191-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250728155554.2624191-1-ross.burton@arm.com>
References: <20250728155554.2624191-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 15:56:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221010

As a single clang-native build is a cross-compiler for all targets, this
recipe should simply create target-prefixed symlinks.

As such, it doesn't need to pull in the common clang include files, or
set TOOLCHAIN.

Unsetting PACKAGES isn't needed as cross inherits nopackages.

The sysroot preprocessing is used to stage bindir, but cross recipes
already stage this directory.

There doesn't appear to be a need to copy clang, so these are now linked
too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/clang/clang-cross_git.bb | 27 ++++---------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipe=
s-devtools/clang/clang-cross_git.bb
index 99e48522a0b..aef08c65e31 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -3,39 +3,22 @@
=20
 SUMMARY =3D "Cross compiler wrappers for LLVM based C/C++ compiler"
 HOMEPAGE =3D "http://clang.llvm.org/"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-=
exception;md5=3D0bcd48c3bdfef0c9d9fd17726e4b7dab"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e=
0bcf8506ecda2f7b4f302"
 SECTION =3D "devel"
=20
 PN =3D "clang-cross-${TARGET_ARCH}"
-BPN =3D "clang"
=20
-require common-clang.inc
-require common-source.inc
 inherit cross
-TOOLCHAIN =3D "clang"
-DEPENDS +=3D "clang-native virtual/cross-binutils"
=20
-#INHIBIT_PACKAGE_STRIP =3D "1"
-INHIBIT_SYSROOT_STRIP =3D "1"
+DEPENDS +=3D "clang-native"
+
 do_install() {
         install -d ${D}${bindir}
-	for tool in clang-tidy lld ld.lld llvm-profdata \
+	for tool in clang clang++ clang-tidy lld ld.lld llvm-profdata \
             llvm-nm llvm-ar llvm-as llvm-ranlib llvm-strip llvm-objcopy =
llvm-objdump llvm-readelf \
             llvm-addr2line llvm-dwp llvm-size llvm-strings llvm-cov
 	do
 		ln -sf ../$tool ${D}${bindir}/${TARGET_PREFIX}$tool
 	done
-	install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGET_P=
REFIX}clang
-	install -m 0755 ${STAGING_BINDIR_NATIVE}/clang ${D}${bindir}/${TARGET_P=
REFIX}clang++
 }
-SSTATE_SCAN_FILES +=3D "*-clang *-clang++ *-llvm-profdata *-lld *-ld.lld=
 \
-                      *-llvm-nm *-llvm-ar *-llvm-as *-llvm-ranlib *-llvm=
-strip \
-                      *-llvm-objcopy *-llvm-objdump *-llvm-readelf *-llv=
m-addr2line \
-                      *-llvm-dwp *-llvm-size *-llvm-strings *-llvm-cov"
-
-SYSROOT_PREPROCESS_FUNCS +=3D "clangcross_sysroot_preprocess"
-
-clangcross_sysroot_preprocess () {
-        sysroot_stage_dir ${D}${bindir} ${SYSROOT_DESTDIR}${bindir}
-}
-PACKAGES =3D ""
--=20
2.43.0


