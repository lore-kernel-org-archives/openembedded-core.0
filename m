Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2467C4453C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 15:42:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3133.1784734978136903498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 08:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=S0UAiaw3;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 759C3168F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:53 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 548213F66F
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784734977; bh=G2+riIoWCmZAwSbBBegSjjNdLpVE+q5GDimiz82Oyn4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=S0UAiaw3S2WVrf2U3ONJc14IEkBlX4ayy96G7zHlhnY5/zug1t4GccCZaqml0TKH3
	 OXs7KfOmbNMvI5OES8ISBd8A08M0c+uZw6JqykhJiO32yG808qDnOFW888ZzvOdqY3
	 VdZ6D30LkOwHwVyyHc5/ZwHyJ73HNRhgRmw7rsqc=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] xorg-lib-common: disable documentation generation
Date: Wed, 22 Jul 2026 16:42:45 +0100
Message-ID: <20260722154247.2987545-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722154247.2987545-1-ross.burton@arm.com>
References: <20260722154247.2987545-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 15:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241701

The X.org libraries have a number of different ways of building documenta=
tion,
instead of disabling them individually just disable all documentation.

This doesn't change the output, as we were disabling everything anyway.

This simplifies the autoconf options, making things neater when we allow
builds with meson.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/re=
cipes-graphics/xorg-lib/xorg-lib-common.inc
index 9584a805707..25697e8471b 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -14,13 +14,8 @@ S =3D "${UNPACKDIR}/${XORG_PN}-${PV}"
=20
 inherit autotools features_check pkgconfig
=20
-EXTRA_OECONF =3D "--disable-specs --without-groff --without-ps2pdf --wit=
hout-fop"
+EXTRA_OECONF =3D "--disable-docs --disable-specs"
=20
-PACKAGECONFIG ??=3D ""
-PACKAGECONFIG[xmlto] =3D "--with-xmlto, --without-xmlto, xmlto-native do=
cbook-xml-dtd4-native docbook-xsl-stylesheets-native"
-
-UNKNOWN_CONFIGURE_OPT_IGNORE +=3D "--disable-specs --without-groff --wit=
hout-ps2pdf --without-fop \
-                                --without-xmlto --with-xmlto \
-"
+UNKNOWN_CONFIGURE_OPT_IGNORE +=3D "--disable-docs --disable-specs"
=20
 REQUIRED_DISTRO_FEATURES ?=3D "x11"
--=20
2.43.0


