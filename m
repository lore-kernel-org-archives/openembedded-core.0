Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F0ECCD194
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 15:41:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.20965.1760542893924138039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 08:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CD5F1655
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:41:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 041443F738
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:41:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] openmp: recipe cleanup
Date: Wed, 15 Oct 2025 16:41:27 +0100
Message-ID: <20251015154128.119639-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 15:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224897

Remove perlnative inherit, this recipe does not depend on non-standard
perl (or any perl, in fact).

Remove python3native inherit, this recipe does not depend on non-standard
Python modules. python3-native will still be pulled into the sysroot via
python3targetconfig however.

Remove PACKAGECONFIG:remove:powerpc, as powerpc is explicitly marked as
not compatible later in the recipe.

Remove LLVM_ENABLE_PER_TARGET_RUNTIME_DIR, this is only used during
monolithic builds of llvm.

Remove OPENMP_STANDALONE_BUILD, this is automatically detected when
building.

Remove CMAKE_POSITION_INDEPENDENT_CODE, this is the default value.

Remove all _TOOL, these are not used.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/clang/openmp_git.bb | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-dev=
tools/clang/openmp_git.bb
index b6b1cc29785..2ba83d48c64 100644
--- a/meta/recipes-devtools/clang/openmp_git.bb
+++ b/meta/recipes-devtools/clang/openmp_git.bb
@@ -13,21 +13,12 @@ CVE_PRODUCT +=3D "openmp"
=20
 LIC_FILES_CHKSUM =3D "file://openmp/LICENSE.TXT;md5=3Dd75288d1ce0450b28b=
8d58a284c09c79"
=20
-inherit cmake pkgconfig perlnative python3native python3targetconfig
+inherit cmake pkgconfig python3targetconfig
=20
 DEPENDS +=3D "elfutils libffi clang"
=20
 EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
-                  -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=3DOFF \
                   -DOPENMP_LIBDIR_SUFFIX=3D${@d.getVar('baselib').replac=
e('lib', '')} \
-                  -DOPENMP_STANDALONE_BUILD=3DON \
-                  -DCLANG_TOOL=3D${STAGING_BINDIR_NATIVE}/clang \
-                  -DLINK_TOOL=3D${STAGING_BINDIR_NATIVE}/llvm-link \
-                  -DOPT_TOOL=3D${STAGING_BINDIR_NATIVE}/opt \
-                  -DOPENMP_LLVM_LIT_EXECUTABLE=3D${STAGING_BINDIR_NATIVE=
}/llvm-lit \
-                  -DEXTRACT_TOOL=3D${STAGING_BINDIR_NATIVE}/llvm-extract=
 \
-                  -DPACKAGER_TOOL=3D${STAGING_BINDIR_NATIVE}/clang-offlo=
ad-packager \
-                  -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
                   "
=20
 OECMAKE_SOURCEPATH =3D "${S}/openmp"
@@ -35,8 +26,6 @@ OECMAKE_SOURCEPATH =3D "${S}/openmp"
 PACKAGECONFIG ?=3D "ompt-tools offloading-plugin"
=20
 PACKAGECONFIG:remove:arm =3D "ompt-tools offloading-plugin"
-PACKAGECONFIG:remove:powerpc =3D "ompt-tools offloading-plugin"
-
 PACKAGECONFIG:append:mipsarcho32 =3D " no-atomics"
=20
 PACKAGECONFIG[ompt-tools] =3D "-DOPENMP_ENABLE_OMPT_TOOLS=3DON,-DOPENMP_=
ENABLE_OMPT_TOOLS=3DOFF,"
--=20
2.43.0


