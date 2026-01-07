Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E1ACFD649
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:38:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8657.1767800289084783261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C30B5497
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:01 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4052D3F5A1
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:38:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] alsa-utils: build more manpages with rst2man
Date: Wed,  7 Jan 2026 15:37:59 +0000
Message-ID: <20260107153803.2905889-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229007

alsa-utils uses both xmlto and rst2man (from docutils) to build manpages,
but we were only enabling xmlto.  Enable/disable both xmlto and rst2man
depending on whether manpages are being requested.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.2.15.bb
index 09b3de81f4..9299f31312 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.bb
@@ -21,19 +21,13 @@ PACKAGECONFIG ??=3D "udev"
 PACKAGECONFIG[bat] =3D "--enable-bat,--disable-bat,fftwf"
=20
 PACKAGECONFIG[udev] =3D "--with-udev-rules-dir=3D`pkg-config --variable=3D=
udevdir udev`/rules.d,--with-udev-rules-dir=3D/unwanted/rules.d,udev"
-PACKAGECONFIG[manpages] =3D "--enable-xmlto, --disable-xmlto, xmlto-nati=
ve docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[manpages] =3D "--enable-rst2man --enable-xmlto, --disable-=
rst2man --disable-xmlto, python3-docutils-native xmlto-native docbook-xml=
-dtd4-native docbook-xsl-stylesheets-native"
=20
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2 \
 	   file://0001-alsactl-fix-build-when-in-subdirectory.patch"
 SRC_URI[sha256sum] =3D "d3183d2ed2d69e9143c5beb97036267c3fdabfe8bfbea8bc=
6863f17b1f0b568e"
=20
-# On build machines with python-docutils (not python3-docutils !!) insta=
lled
-# rst2man (not rst2man.py) is detected and compile fails with
-# | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.=
  Stop.
-# Avoid this by disabling expicitly
-EXTRA_OECONF =3D "--disable-rst2man"
-
 inherit autotools gettext pkgconfig manpages
=20
 # This are all packages that we need to make. Also, the now empty alsa-u=
tils
--=20
2.43.0


