Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850AACAC5B3
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 12:08:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10926.1758715720576057476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 05:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EC30106F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:08:32 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8BB03F66E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 05:08:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 6/7] clang: tell cross-builds of clang how to build natively
Date: Wed, 24 Sep 2025 13:08:33 +0100
Message-ID: <20250924120834.2886320-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924120834.2886320-1-ross.burton@arm.com>
References: <20250924120834.2886320-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223972

If we pass CROSS_TOOLCHAIN_FLAGS_NATIVE to all the builds, instead of
just nativesdk, then clang can correctly build its own native tools as
needed.

This means we can stop manually installing clang-tidy-confusable-chars-ge=
n
as clang-tidy will build it.  We (currently) still build the tblgen
binaries once as they're used in several recipes so there's likely value
in building those once.

Also consolidate the LLVM_TABLEGEN variables as they're not specific to
a particular class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index 998c1731f2f..9ccb81a5308 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -120,14 +120,13 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF =
\
                   -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
                   -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
                   -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
-                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
+                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
+                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
                   -DLLVM_INCLUDE_TESTS=3DOFF \
+                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
 "
=20
 EXTRA_OECMAKE:append:class-nativesdk =3D "\
-                  -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAIN_FI=
LE=3D${WORKDIR}/toolchain-native.cmake' \
-                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
-                  -DCLANG_TIDY_CONFUSABLE_CHARS_GEN=3D${STAGING_BINDIR_N=
ATIVE}/clang-tidy-confusable-chars-gen \
                   -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ranlib \
                   -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
                   -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
@@ -205,7 +204,6 @@ do_install:append:class-native () {
     if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', =
d)}; then
         install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
     fi
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
=20
     for f in `find ${D}${bindir} -executable -type f -not -type l`; do
         test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
@@ -225,7 +223,6 @@ do_install:append:class-nativesdk () {
         install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${b=
indir}/clangd-indexer
     fi
     install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}=
/clang-tblgen
-    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tidy-confusable-char=
s-gen ${D}${bindir}/clang-tidy-confusable-chars-gen
     for f in `find ${D}${bindir} -executable -type f -not -type l`; do
         test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
     done
--=20
2.43.0


