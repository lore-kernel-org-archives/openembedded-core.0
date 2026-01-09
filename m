Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15709D1A62F
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:58:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10571.1767967134851420644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97C3BFEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:58:47 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C54B3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:58:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/6] alsa-utils: build more manpages with rst2man
Date: Fri,  9 Jan 2026 13:58:47 +0000
Message-ID: <20260109135852.3187805-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229118

alsa-utils uses both xmlto and rst2man (from docutils) to build manpages,
but we were only enabling xmlto.  Enable/disable both xmlto and rst2man
depending on whether manpages are being requested.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index dad5478f39..e231acbfc0 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -21,18 +21,12 @@ PACKAGECONFIG ??=3D "udev"
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
V}.tar.bz2"
 SRC_URI[sha256sum] =3D "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7=
c1a30e2b093d3327"
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


