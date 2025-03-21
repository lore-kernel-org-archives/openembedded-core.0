Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232E6C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 11:47:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19332.1742557635561030046
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 04:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2337106F
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 04:47:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D25253F673
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 04:47:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][kirkstone] libxcrypt-compat: Remove libcrypt.so to fix conflict with libcrypt
Date: Fri, 21 Mar 2025 11:46:44 +0000
Message-ID: <20250321114644.3160133-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 11:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213443

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
IMAGE_INSTALL:append =3D " libxcrypt-compat"

$ bitbake <image> -cpopulate_sdk
file /usr/lib/libcrypt.so from install of libxcrypt-compat-dev-4.4.33-r0.=
0.aarch64 conflicts with file from package libcrypt-dev-4.4.33-r0.2.aarch=
64

Remove libcrypt.so like other files to fix the error.

(From OE-Core rev: dc0c7a8c3d1d4f02869b7f0d42f704fd24bf0dde)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb b/met=
a/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
index ec9f9f4fa34..d5546ce9bab 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
@@ -13,6 +13,6 @@ API =3D "--enable-obsolete-api"
 do_install:append () {
 	rm -rf ${D}${includedir}
 	rm -rf ${D}${libdir}/pkgconfig
+	rm -rf ${D}${libdir}/libcrypt.so
 	rm -rf ${D}${datadir}
 }
-
--=20
2.43.0


