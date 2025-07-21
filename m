Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBFFC83F26
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 13:24:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.40564.1753104275544556083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 06:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43968153B
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B7E9C3F6A8
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 06:24:34 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 5/5] clang: ensure the native-built tblgen binaries are used
Date: Mon, 21 Jul 2025 14:24:26 +0100
Message-ID: <20250721132426.3321928-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250721132426.3321928-1-ross.burton@arm.com>
References: <20250721132426.3321928-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 13:24:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220691

Set LLVM_HEADERS_TBLGEN so that we don't build another copy of tblgen.

Also remove LLVM_OPTIMIZED_TABLEGEN, this is redundant as we're not
building a tablegen binary in this recipe anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index d551be72e63..e15f4a632e1 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -149,7 +149,6 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_ENABLE_FFI=3DON \
                   -DLLVM_ENABLE_ZSTD=3DON \
                   -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir libffi) \
-                  -DLLVM_OPTIMIZED_TABLEGEN=3DON \
                   -DLLVM_BUILD_EXTERNAL_COMPILER_RT=3DON \
                   -DCMAKE_SYSTEM_NAME=3DLinux \
                   -DCMAKE_BUILD_TYPE=3DRelease \
@@ -159,6 +158,8 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
                   -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BUILD}' \
                   -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
+                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
+                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
 "
=20
 EXTRA_OECMAKE:append:class-nativesdk =3D "\
@@ -167,14 +168,10 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
                   -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
                   -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
                   -DCMAKE_STRIP=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_P=
REFIX}llvm-strip \
-                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
-                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
                   -DPYTHON_LIBRARY=3D${STAGING_LIBDIR}/lib${PYTHON_DIR}$=
{PYTHON_ABI}.so \
                   -DPYTHON_INCLUDE_DIR=3D${STAGING_INCDIR}/${PYTHON_DIR}=
${PYTHON_ABI} \
 "
 EXTRA_OECMAKE:append:class-target =3D "\
-                  -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
-                  -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
                   -DCMAKE_RANLIB=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_=
PREFIX}llvm-ranlib \
                   -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
                   -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
--=20
2.43.0


