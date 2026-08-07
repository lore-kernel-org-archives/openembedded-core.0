Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06766C5AC80
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:35:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39805.1786098946301785951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=JT/R8z/F;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EF941516
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:35:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 491C23F9A2
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2026 03:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786098945; bh=DfiqEzTvHjVot6wJUSdySzJA6cqlKXbFg+G+2MoJ+co=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JT/R8z/FvsCB3ysv77q6IODUeG5ZpYgDXov+Q4JccYSKqGXrDAvUl0uTzDOkoSp5p
	 0fnaSNiG35XvHxsj8QFm2KjMB/jxNV/aXNhRrSczxrJcq33Wr4WzmZ+IFSxx8kQ+bX
	 elJ1rN02YyIczXJawCFmNHKHl3IUzPgHziJ8U+9s=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] python3-numpy: remove HOSTTOOLS_DIR from __config__.py
Date: Fri,  7 Aug 2026 11:35:40 +0100
Message-ID: <20260807103540.3404860-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807103540.3404860-1-ross.burton@arm.com>
References: <20260807103540.3404860-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 10:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243004

If ccache is enabled then HOSTTOOLS_DIR ends up in __config__.py, so
remove that path too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-numpy_2.5.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.1.bb b/meta/r=
ecipes-devtools/python/python3-numpy_2.5.1.bb
index 88786dc0168..e700222126d 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.1.bb
@@ -29,10 +29,12 @@ do_install:append() {
     sed -i \
         -e 's|${S}=3D||g' \
         -e 's|${B}=3D||g' \
+        -e 's|${HOSTTOOLS_DIR}||g' \
         -e 's|${RECIPE_SYSROOT_NATIVE}=3D||g' \
         -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
         -e 's|${RECIPE_SYSROOT}=3D||g' \
-        -e 's|${RECIPE_SYSROOT}||g' ${D}${PYTHON_SITEPACKAGES_DIR}/numpy=
/__config__.py
+        -e 's|${RECIPE_SYSROOT}||g' \
+        ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
=20
     nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/nu=
mpy/__config__.py
 }
--=20
2.43.0


