Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AB0CAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 19:11:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1336.1757963480332949049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 12:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE86E1424
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 12:11:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A38103F694
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 12:11:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 8/8] clang: globally disable build-time RPATHs for reproducibility
Date: Mon, 15 Sep 2025 20:11:09 +0100
Message-ID: <20250915191109.1117663-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915191109.1117663-1-ross.burton@arm.com>
References: <20250915191109.1117663-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 19:11:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223505

Various bits of the LLVM project set the build RPATH in a way that means
we have non-deterministic binaries even though we should always be using
relative paths.

This clearly is not working as some of the binaries get rewritten on
install and have large string paddings that correlate with erased build
paths.

So that we don't have to disable RPATHs in every recipe, just do it once
in the common include file and remove the existing recipe-specific
assignments that are now not needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/common-clang.inc | 4 ++++
 meta/recipes-devtools/clang/libcxx_git.bb    | 1 -
 meta/recipes-devtools/clang/lld_git.bb       | 6 +-----
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
index bf3a63914a7..643721bad48 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -44,4 +44,8 @@ def get_clang_host_arch(bb, d):
 def get_clang_target_arch(bb, d):
     return get_clang_arch(bb, d, 'TARGET_ARCH')
=20
+# Don't put build-time RPATHs in the binaries, whilst they'll be strippe=
d on
+# install they cause non-deterministic binaries.
+EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_BUILD_RPATH=3DON"
+
 require common.inc
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-dev=
tools/clang/libcxx_git.bb
index b0ee3925f43..c630bd973ea 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -77,7 +77,6 @@ EXTRA_OECMAKE +=3D "\
                   -DLLVM_RUNTIME_TARGETS=3D${HOST_ARCH} \
                   -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_APPEND_VC_REV=3DOFF \
-                  -DCMAKE_BUILD_WITH_INSTALL_RPATH=3DON \
 "
=20
 EXTRA_OECMAKE:append:class-target =3D " \
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtoo=
ls/clang/lld_git.bb
index b0261ad2cb6..ba369427909 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -14,13 +14,9 @@ DEPENDS =3D "llvm-tblgen-native llvm"
=20
 OECMAKE_SOURCEPATH =3D "${S}/lld"
=20
-# Explicitly disable RPATHs as otherwise they're stipped out of the bina=
ries,
-# and are then non-reproducible.
-#
 # Explicitly enable symlinks as the lld build doesn't call into the llvm=
 setup
 # and turn that on.
-EXTRA_OECMAKE +=3D "-DCMAKE_SKIP_BUILD_RPATH=3DON \
-                  -DLLVM_INCLUDE_TESTS=3DOFF -DLLVM_USE_SYMLINKS=3DON \
+EXTRA_OECMAKE +=3D "-DLLVM_INCLUDE_TESTS=3DOFF -DLLVM_USE_SYMLINKS=3DON =
\
                   -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


