Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ACFC77B60
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 18:50:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.34317.1680202209585585376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 11:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E33942F4;
	Thu, 30 Mar 2023 11:50:52 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 214E63F663;
	Thu, 30 Mar 2023 11:50:08 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] llvm: remove redundant CMake variables
Date: Thu, 30 Mar 2023 19:50:04 +0100
Message-Id: <20230330185006.306389-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 18:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179348

This recipe uses the cmake class, so there's no need to set the Ninja
backend, or tell it where Python is, or that we're cross-compiling.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb         | 3 +--
 meta/recipes-devtools/rust/rust-llvm_1.67.1.bb | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtoo=
ls/llvm/llvm_git.bb
index f133653903e..f617b172310 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -82,9 +82,8 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
                   -DLLVM_OPTIMIZED_TABLEGEN=3DON \
                   -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
-                  -DPYTHON_EXECUTABLE=3D${HOSTTOOLS_DIR}/python3 \
                   -DCMAKE_BUILD_TYPE=3DRelease \
-                  -G Ninja"
+                 "
=20
 EXTRA_OECMAKE:append:class-target =3D "\
                   -DCMAKE_CROSSCOMPILING:BOOL=3DON \
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.67.1.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.67.1.bb
index 4da11da8ef3..6304070debf 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.67.1.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.67.1.bb
@@ -49,14 +49,12 @@ EXTRA_OECMAKE =3D " \
     -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
 "
 EXTRA_OECMAKE:append:class-target =3D "\
-    -DCMAKE_CROSSCOMPILING:BOOL=3DON \
     -DLLVM_BUILD_TOOLS=3DOFF \
     -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
     -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
 "
=20
 EXTRA_OECMAKE:append:class-nativesdk =3D "\
-    -DCMAKE_CROSSCOMPILING:BOOL=3DON \
     -DLLVM_BUILD_TOOLS=3DOFF \
     -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
     -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
--=20
2.34.1


