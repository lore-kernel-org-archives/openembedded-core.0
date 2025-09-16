Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23378CAC59A
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:37:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15010.1758015463675086359
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD0B212FC
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:37:34 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BA8873F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 02:37:42 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] spirv-llvm-translator: small recipe cleanup
Date: Tue, 16 Sep 2025 10:37:36 +0100
Message-ID: <20250916093738.1636562-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 09:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223534

- There is no need for python3native, as this recipe doesn't depend on
  other python modules.

- Inherit lib_package so the llvm-spirv binary is in a separate package
  to the libLLVMSPIRVLib.so library.

- Remove obsolete CMake options that no longer appear to be required.

- Change CMAKE_SKIP_RPATH to CMAKE_SKIP_BUILD_RPATH as this stops the
  ELF editing on install without potentially removing any explicit
  RPATHs, and aligns with a change I've proposed for cmake.bbclass.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../spir/spirv-llvm-translator_21.1.0.bb              | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb b=
/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
index 63fae47377e..13a93f3c5e5 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb
@@ -15,19 +15,12 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+=
)"
=20
 DEPENDS =3D "llvm spirv-tools spirv-headers"
=20
-inherit cmake pkgconfig python3native
+inherit cmake pkgconfig lib_package
=20
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-# for CMAKE_SHARED_LIBS=3DOFF see https://github.com/KhronosGroup/SPIRV-=
LLVM-Translator/issues/1868
 EXTRA_OECMAKE =3D "\
     -DBASE_LLVM_VERSION=3D'${@oe.utils.trim_version('${PV}', 3)}' \
+    -DCMAKE_SKIP_BUILD_RPATH=3DON \
     -DBUILD_SHARED_LIBS=3DON \
-    -DCMAKE_BUILD_TYPE=3DRelease \
-    -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
-    -DCMAKE_SKIP_RPATH=3DON \
-    -DLLVM_EXTERNAL_LIT=3Dlit \
-    -DLLVM_INCLUDE_TESTS=3DON \
-    -Wno-dev \
     -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=3D${STAGING_INCDIR}/.. \
 "
=20
--=20
2.43.0


