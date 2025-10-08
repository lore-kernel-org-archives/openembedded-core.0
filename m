Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3856CCA470
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 14:26:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.110.1759933582929684337
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 07:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 593BE22FC
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 07:26:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF2BB3F738
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Oct 2025 07:26:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] clang: consolidate LLVM_APPEND_VC_REV=OFF
Date: Wed,  8 Oct 2025 15:26:20 +0100
Message-ID: <20251008142620.692102-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 14:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224583

Whilst the change to add TMPDIR to GIT_CEILING_DIRECTORIES should stop
LLVM from embedding git information into the recipes, also disable this
behaviour explicitly.

We do this because it's not just the sha of the source tree but also
the full URL of the repository, which would be an information leak if
an internal git mirror was being used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/clang_git.bb     | 1 -
 meta/recipes-devtools/clang/common-clang.inc | 4 ++++
 meta/recipes-devtools/clang/openmp_git.bb    | 1 -
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
index ca539635902..e10c327a2af 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -57,7 +57,6 @@ SOLIBSDEV:mingw32 =3D ".pyd"
 #CMAKE_VERBOSE =3D "VERBOSE=3D1"
=20
 EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
-                  -DLLVM_APPEND_VC_REV=3DOFF \
                   -DLLVM_ENABLE_PIC=3DON \
                   -DCLANG_DEFAULT_PIE_ON_LINUX=3DON \
                   -DFFI_INCLUDE_DIR=3D$(pkg-config --variable=3Dincluded=
ir libffi) \
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-=
devtools/clang/common-clang.inc
index f7b7a1cf9a0..2e9d3d73f92 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -48,4 +48,8 @@ def get_clang_target_arch(bb, d):
 # install they cause non-deterministic binaries.
 EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_WITH_INSTALL_RPATH=3DON"
=20
+# Don't embed found git information into the version string as this
+# will include the git server URL.
+EXTRA_OECMAKE +=3D "-DLLVM_APPEND_VC_REV=3DOFF"
+
 require common.inc
diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-dev=
tools/clang/openmp_git.bb
index 2d86718dee6..b6b1cc29785 100644
--- a/meta/recipes-devtools/clang/openmp_git.bb
+++ b/meta/recipes-devtools/clang/openmp_git.bb
@@ -18,7 +18,6 @@ inherit cmake pkgconfig perlnative python3native python=
3targetconfig
 DEPENDS +=3D "elfutils libffi clang"
=20
 EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
-                  -DLLVM_APPEND_VC_REV=3DOFF \
                   -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
                   -DOPENMP_LIBDIR_SUFFIX=3D${@d.getVar('baselib').replac=
e('lib', '')} \
                   -DOPENMP_STANDALONE_BUILD=3DON \
--=20
2.43.0


