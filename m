Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619B8C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 11:36:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38362.1785929800444571607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 04:36:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=WrwEoLPE;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A1D516F2
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 04:36:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0B083F66F
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785929800; bh=NOqUAVEEhzA3QYZFrOQpWsXlhNV+iPCQtLYRPwosd0I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WrwEoLPEuUB6+86g7sXKvXPK7HWREuW4BjntGlfHB7rZsX/mzR8O9DyPDipJu6GbH
	 vgnJU8RPvp40PIM0GLN8UY+1HVaRueSrAZeh+DhNxM4GX3aabb9BYoexJwKR9ubYsA
	 xjcdcolz3AWCTlIIcI4ybD6JZJsszr6UUWhhEDBY=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-numpy: remove HOSTTOOLS_DIR from __config__.py
Date: Wed,  5 Aug 2026 12:36:33 +0100
Message-ID: <20260805113634.79174-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805113634.79174-1-ross.burton@arm.com>
References: <20260805113634.79174-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 11:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242862

If ccache is enabled then HOSTTOOLS_DIR ends up in __config__.py, so
remove that path too.

Also remove redundant entries: there's no need to remove both
${RECIPE_SYSROOT}=3D and ${RECIPE_SYSROOT}.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-numpy_2.5.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.1.bb b/meta/r=
ecipes-devtools/python/python3-numpy_2.5.1.bb
index 88786dc0168..d053cc56932 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.1.bb
@@ -29,10 +29,10 @@ do_install:append() {
     sed -i \
         -e 's|${S}=3D||g' \
         -e 's|${B}=3D||g' \
-        -e 's|${RECIPE_SYSROOT_NATIVE}=3D||g' \
         -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
-        -e 's|${RECIPE_SYSROOT}=3D||g' \
-        -e 's|${RECIPE_SYSROOT}||g' ${D}${PYTHON_SITEPACKAGES_DIR}/numpy=
/__config__.py
+        -e 's|${RECIPE_SYSROOT}||g' \
+        -e 's|${HOSTTOOLS_DIR}||g' \
+        ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
=20
     nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/nu=
mpy/__config__.py
 }
--=20
2.43.0


