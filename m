Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E937CAC59D
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 19:11:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1335.1757963479789522680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 12:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 241F71424
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 12:11:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0683D3F694
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 12:11:18 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 7/8] clang: use EXTRA_OECMAKE +=
Date: Mon, 15 Sep 2025 20:11:08 +0100
Message-ID: <20250915191109.1117663-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915191109.1117663-1-ross.burton@arm.com>
References: <20250915191109.1117663-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 19:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223504

Don't assign EXTRA_OECMAKE so that the include files can set defaults.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/libclc_git.bb |  2 +-
 meta/recipes-devtools/clang/lld_git.bb    |  6 +++---
 meta/recipes-devtools/clang/lldb_git.bb   | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-dev=
tools/clang/libclc_git.bb
index e56cf2eb6c0..60909339e70 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -21,7 +21,7 @@ B_NATIVE =3D "${B}-native"
 # Semicolon-separated list of targets to build
 LIBCLC_TARGETS ?=3D "all"
=20
-EXTRA_OECMAKE =3D "-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS}"
+EXTRA_OECMAKE +=3D "-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS}"
 EXTRA_OECMAKE:append:class-target =3D " -DPREPARE_BUILTINS=3D${B_NATIVE}=
/prepare_builtins"
 EXTRA_OECMAKE:append:class-nativesdk =3D " -DPREPARE_BUILTINS=3D${B_NATI=
VE}/prepare_builtins"
=20
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtoo=
ls/clang/lld_git.bb
index 02006e0edc9..b0261ad2cb6 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -19,8 +19,8 @@ OECMAKE_SOURCEPATH =3D "${S}/lld"
 #
 # Explicitly enable symlinks as the lld build doesn't call into the llvm=
 setup
 # and turn that on.
-EXTRA_OECMAKE =3D "-DCMAKE_SKIP_BUILD_RPATH=3DON \
-                 -DLLVM_INCLUDE_TESTS=3DOFF -DLLVM_USE_SYMLINKS=3DON \
-                 -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tbl=
gen"
+EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_BUILD_RPATH=3DON \
+                  -DLLVM_INCLUDE_TESTS=3DOFF -DLLVM_USE_SYMLINKS=3DON \
+                  -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devto=
ols/clang/lldb_git.bb
index eafc3cb3128..ecab8c09a75 100644
--- a/meta/recipes-devtools/clang/lldb_git.bb
+++ b/meta/recipes-devtools/clang/lldb_git.bb
@@ -16,15 +16,15 @@ DEPENDS =3D "llvm-tblgen-native clang"
=20
 OECMAKE_SOURCEPATH =3D "${S}/lldb"
=20
-EXTRA_OECMAKE =3D "-DLLDB_INCLUDE_TESTS=3DOFF \
-                 -DLLDB_ENABLE_LUA=3DOFF \
-                 -DLLDB_PYTHON_RELATIVE_PATH=3D${PYTHON_SITEPACKAGES_DIR=
} \
-                 -DLLDB_PYTHON_EXE_RELATIVE_PATH=3D${PYTHON_PN} \
-                 -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
-                 -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm/ \
-                 -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen =
\
-                 -DLLDB_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/lldb-tbl=
gen \
-                 -DLLDB_NO_INSTALL_DEFAULT_RPATH=3DON \
+EXTRA_OECMAKE +=3D "-DLLDB_INCLUDE_TESTS=3DOFF \
+                  -DLLDB_ENABLE_LUA=3DOFF \
+                  -DLLDB_PYTHON_RELATIVE_PATH=3D${PYTHON_SITEPACKAGES_DI=
R} \
+                  -DLLDB_PYTHON_EXE_RELATIVE_PATH=3D${PYTHON_PN} \
+                  -DLLDB_PYTHON_EXT_SUFFIX=3D${SOLIBSDEV} \
+                  -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm/ \
+                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen=
 \
+                  -DLLDB_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/lldb-tb=
lgen \
+                  -DLLDB_NO_INSTALL_DEFAULT_RPATH=3DON \
 "
=20
 PACKAGECONFIG ??=3D "libedit libxml2 lzma"
--=20
2.43.0


