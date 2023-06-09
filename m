Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2DBC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 23:57:36 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8651.1686355051001269495
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 16:57:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E671640C90;
	Fri,  9 Jun 2023 23:57:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6ASF8XiwLb8; Fri,  9 Jun 2023 23:57:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C440E40C1C;
	Fri,  9 Jun 2023 23:57:28 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 421DF16394C;
	Fri,  9 Jun 2023 19:56:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH] binutils: move packaging of gprofng static lib into common .inc
Date: Fri,  9 Jun 2023 23:57:26 +0000
Message-Id: <20230609235726.3119540-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 23:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182600

Commit f72fd51e0d (binutils: package static libs from gprofng) added
corresponding FILES:${PN}-staticdev entry to the main .bb recipe.
But binutils-cross-canadian fails with exactly the same QA issue,
hence move FILES:${PN}-staticdev to the common shared .inc file.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-devtools/binutils/binutils.inc     | 2 ++
 meta/recipes-devtools/binutils/binutils_2.40.bb | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
index c69d29448f..e176b5cff1 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -33,6 +33,8 @@ FILES:${PN}-dev =3D " \
 	${libdir}/libctf-nobfd.so \
 	${libdir}/libopcodes.so"
=20
+FILES:${PN}-staticdev +=3D "${libdir}/gprofng/*.a"
+
 # Rather than duplicating multiple entries for these, make one
 # list and reuse it.
=20
diff --git a/meta/recipes-devtools/binutils/binutils_2.40.bb b/meta/recip=
es-devtools/binutils/binutils_2.40.bb
index 9fe4bf5ae3..4ce1b4bec2 100644
--- a/meta/recipes-devtools/binutils/binutils_2.40.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.40.bb
@@ -67,7 +67,6 @@ FILES:libbfd =3D "${libdir}/libbfd-*.so.* ${libdir}/lib=
bfd-*.so"
 FILES:libopcodes =3D "${libdir}/libopcodes-*.so.* ${libdir}/libopcodes-*=
.so"
 FILES:gprofng =3D "${sysconfdir}/gprofng.rc ${libdir}/gprofng/libgp-*.so=
 ${libdir}/gprofng/libgprofng.so.* ${bindir}/gp-* ${bindir}/gprofng"
 FILES:${PN}-dev +=3D "${libdir}/libgprofng.so ${libdir}/libsframe.so"
-FILES:${PN}-staticdev +=3D "${libdir}/gprofng/*.a"
 SRC_URI:append:class-nativesdk =3D  " file://0003-binutils-nativesdk-Sea=
rch-for-alternative-ld.so.conf.patch "
=20
 USE_ALTERNATIVES_FOR:class-nativesdk =3D ""
--=20
2.35.3


