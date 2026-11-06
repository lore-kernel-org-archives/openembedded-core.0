Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5123.1793969244262595326
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 04:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=EnnabIjr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE3DB153B
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 04:47:20 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 62C8F3F673
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 04:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793969243; bh=Xg9K3iHDXh/OuYw23cXBn1jB+2mIDfb6nFA4hytwaIo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EnnabIjrEVfqmlcVOsAsNKmfd9QtwAn6Fdp7kqFwbz9DvV5sc+7b60q6ZmRc+xDe8
	 wncVPSps3rK1ITiXKJIJur+JN8WPgLQWrT0nMQzOHj9+bfH2B1VjG7+7+QQH2T29Uh
	 MI97KRUHjoJW+Ghkrv3E27AwZT/gMJ6MZItCamss=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-dbus: clean up packaging
Date: Fri,  6 Nov 2026 12:47:17 +0000
Message-ID: <20261106124717.564830-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106124717.564830-1-ross.burton@arm.com>
References: <20261106124717.564830-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 12:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249642
Content-Type: text/plain; charset="utf-8"

The dependencies on expat and libintl are redundant, and
${libdir}/pkgconfig is already in the default FILES for -dev.

Note that we can't use the python_mesonpy class for this recipe: it
installs headers and pkgconfig files which don't install to the correct
paths when the package is built into a wheel and then installed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-dbus_1.5.1.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.5.1.bb b/meta/re=
cipes-devtools/python/python3-dbus_1.5.1.bb
index ccd39d46a23..4e8281d903d 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.5.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97f58951300aa5=
2a9f9e3a62bd5c846c \
                     file://subprojects/dbus-gmain/LICENSES/GPL-2.0-or-la=
ter.txt;md5=3D3d26203303a722dedc6bf909d95ba815 \
                     file://subprojects/dbus-gmain/LICENSES/AFL-2.1.txt;m=
d5=3Df3ad2f482ec639b440413665cfb9e714 \
                     "
-DEPENDS =3D "expat dbus glib-2.0 virtual/libintl"
+DEPENDS =3D "dbus glib-2.0"
=20
 PYPI_PACKAGE =3D "dbus-python"
=20
@@ -15,11 +15,8 @@ SRC_URI[sha256sum] =3D "57423cf87d09b7d084f420b55b737f=
e654c33339b06df77945620d9779
=20
 inherit pypi setuptools3-base meson pkgconfig
=20
-# requires dbus-run-session
 EXTRA_OEMESON +=3D "-Dtests=3Ddisabled"
=20
 RDEPENDS:${PN} =3D "python3-io python3-logging python3-stringold python3=
-threading python3-xml"
=20
-FILES:${PN}-dev +=3D "${libdir}/pkgconfig"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0

