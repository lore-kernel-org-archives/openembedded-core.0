Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B019D1A62D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 13:58:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10573.1767967137580652915
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 05:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CFA9FEC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:58:50 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D3B4A3F5A1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 Jan 2026 05:58:56 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/6] alsa-utils: reorder recipe
Date: Fri,  9 Jan 2026 13:58:51 +0000
Message-ID: <20260109135852.3187805-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109135852.3187805-1-ross.burton@arm.com>
References: <20260109135852.3187805-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229122

Move SRC_URI and inherits up to be more like the idiomatic order.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/r=
ecipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
index 36a05354bd..179fefa368 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
@@ -11,24 +11,22 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33=
659b29e73d4adb9f9f6552 \
                     file://alsactl/utils.c;beginline=3D3;endline=3D18;md=
5=3D96cc06a4cebe5eb7975688ffb0e65642"
 DEPENDS =3D "alsa-lib ncurses libsamplerate0 bash"
=20
-PACKAGECONFIG ??=3D "udev"
+# alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
+SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
+SRC_URI[sha256sum] =3D "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7=
c1a30e2b093d3327"
=20
+inherit autotools gettext pkgconfig manpages
+
+PACKAGECONFIG ??=3D "udev"
 # alsabat can be built also without fftw support (with reduced functiona=
lity).
 # It would be better to always enable alsabat, but provide an option for
 # enabling/disabling fftw. The configure script doesn't support that, ho=
wever
 # (at least in any obvious way), so for now we only support alsabat with=
 fftw
 # or no alsabat at all.
 PACKAGECONFIG[bat] =3D "--enable-bat,--disable-bat,fftwf"
-
 PACKAGECONFIG[udev] =3D ",--with-udev-rules-dir=3D/unwanted/rules.d,udev=
"
 PACKAGECONFIG[manpages] =3D "--enable-rst2man --enable-xmlto, --disable-=
rst2man --disable-xmlto, python3-docutils-native xmlto-native docbook-xml=
-dtd4-native docbook-xsl-stylesheets-native"
=20
-# alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI =3D "https://www.alsa-project.org/files/pub/utils/alsa-utils-${P=
V}.tar.bz2"
-SRC_URI[sha256sum] =3D "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7=
c1a30e2b093d3327"
-
-inherit autotools gettext pkgconfig manpages
-
 # alsa-utils is an empty meta-package
 FILES:${PN} =3D ""
 ALLOW_EMPTY:${PN} =3D "1"
--=20
2.43.0


