Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296D1CA0EFC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 13:29:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19891.1755696579056911340
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 06:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29B3F1D31
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:29:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 031183F58B
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:29:37 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] spirv-llvm-translator: small recipe cleanup
Date: Wed, 20 Aug 2025 14:29:27 +0100
Message-ID: <20250820132929.2644708-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 13:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222179

- There is no need for python3native, as this recipe doesn't depend on
  other python modules.

- Inherit lib_package so the llvm-spirv binary is in a separate package
  to the libLLVMSPIRVLib.so library.

- Remove obsolete CMake options that no longer appear to be required.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../spir/spirv-llvm-translator_20.1.4.bb               | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b=
/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
index 64a73ce55aa..3a090b7b5cb 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
@@ -15,18 +15,10 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+=
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


