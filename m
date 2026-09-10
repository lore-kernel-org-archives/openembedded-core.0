Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA03CC79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 15:03:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16501.1789052601753460770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 08:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=uneRb0DW;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F9E122E6
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 08:03:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9B9DB3F59E
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789052601; bh=NrUb1myFLVJjymyGFPn8QJnAijzNR7Dbp299EaCPobc=;
	h=From:To:Subject:Date:From;
	b=uneRb0DWtvvoFnsiyjyrUBHhC+wX7fBckWeD1iFYxxGCq8tTsA54kcbhnGAUitfS3
	 Y5x2dov6qXKaAym8Zl9RzOaOQ1fZptGJXMX4FQBjgpeGNQUKOJhrMxeqjoT/SdggcV
	 cZxyMm9Z/B739VBEnpDFihkXK8v6RtkmYudjzs/Q=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-numpy: remove more sources of non-reproducibility
Date: Thu, 10 Sep 2026 16:03:16 +0100
Message-ID: <20260910150316.2400274-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 15:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245585

It was noticed that __config__.py contains details of the build machine
hardware, which is another source of non-reproducibility.

As this file is only used to dump the build configuration on errors, we
can remove entries that leak build details entirely.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-numpy_2.5.3.bb             | 21 ++++++++-----------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb b/meta/r=
ecipes-devtools/python/python3-numpy_2.5.3.bb
index c88b0bf1a29..338bdd2bbd0 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
@@ -26,20 +26,17 @@ PACKAGECONFIG[svml] =3D "-Ddisable-svml=3Dfalse,-Ddis=
able-svml=3Dtrue"
 # the overflow tests fail with compiler-rt on aarch64
 LDFLAGS:append:toolchain-clang:aarch64 =3D " -rtlib=3Dlibgcc -unwindlib=3D=
libgcc"
=20
-# Remove references to buildpaths from numpy's __config__.py
-do_install:append() {
+# To ensure reproducibility, remove entries from __config__ which expose=
 build
+# machine details, such as build paths, host paths, and hardware configu=
ration.
+strip_build_info() {
     sed -i \
-        -e 's|${S}=3D||g' \
-        -e 's|${B}=3D||g' \
-        -e 's|${HOSTTOOLS_DIR}||g' \
-        -e 's|${RECIPE_SYSROOT_NATIVE}=3D||g' \
-        -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
-        -e 's|${RECIPE_SYSROOT}=3D||g' \
-        -e 's|${RECIPE_SYSROOT}||g' \
-        ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
-
-    nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/nu=
mpy/__config__.py
+        -e 's/@.*_ARGS@//' \
+        -e 's/@.*_CMD_ARRAY@//' \
+        -e 's/@BUILD_CPU.*@//' \
+        -e 's/@PYTHON_PATH@//' \
+        ${S}/numpy/__config__.py.in
 }
+do_patch[postfuncs] +=3D "strip_build_info"
=20
 do_install_ptest:append() {
     sed -i \
--=20
2.43.0


