Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233DCCD4F25
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 15:10:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37132.1778857809957297000
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 08:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gDrQ1gSO;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE3592923
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 08:10:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF3483F85F
	for <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 08:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778857809; bh=eTJFncF41Swm5k3O4/T5dovYI5hnpEfHKmq3R4LWkRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gDrQ1gSOJxQgQMncTVZNVltjMmZ1pb3AnotlObtbtHH1OodpXwAjJx4KliKf9EmAt
	 me8xnqPLJGrCWte1GAWPhVpwQDLKv1Qky5iQyac48mgQPxWo0tC/Co4FoE8DfUmPZS
	 i8pglDcbF4I5wH1FItk+BDjlupMihHMhDAr5lqOA=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] librsvg: add PACKAGECONFIGs for avif and gdkpixbuf
Date: Fri, 15 May 2026 16:10:03 +0100
Message-ID: <20260515151004.2591185-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260515151004.2591185-1-ross.burton@arm.com>
References: <20260515151004.2591185-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 15:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237178

The existing gdkpixbuf PACKAGECONFIG is actually for the gdk-pixbuf SVG
loader.  Rename this to gdkpixbuf-loader and add another PACKAGECONFIG
that controls whether gdk-pixbuf support is enabled, and enable this by
default to preserve behaviour.

Add a new PACKAGECONFIG to enable support for embedded AVIF[1] files.
This is disabled out of the box as it depends on dav1d, part of meta-oe.

[1] https://en.wikipedia.org/wiki/AVIF

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.61.3.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb b/meta/recipes-=
gnome/librsvg/librsvg_2.61.3.bb
index 00f8599828c..2c1979dd154 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb
@@ -10,7 +10,7 @@ LICENSE =3D "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b=
364516c"
=20
 SECTION =3D "x11/utils"
-DEPENDS =3D "cairo gdk-pixbuf glib-2.0 libxml2 pango python3-docutils-na=
tive cargo-native cargo-c-native"
+DEPENDS =3D "cairo glib-2.0 libxml2 pango python3-docutils-native cargo-=
native cargo-c-native"
 RDEPENDS:${PN}-ptest +=3D "rsvg"
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -56,11 +56,14 @@ LDFLAGS +=3D " -L${B}/rsvg"
 # needed on ubuntu 20.04/debian 11 to avoid 'undefined reference to `dls=
ym'' errors
 BUILD_LDFLAGS +=3D " -ldl"
=20
-PACKAGECONFIG ??=3D "gdkpixbuf \
+PACKAGECONFIG ??=3D "gdkpixbuf gdkpixbuf-loader \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'apitest',=
 '', d)} \
                    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vala=
', '', d)}"
-# The gdk-pixbuf loader
-PACKAGECONFIG[gdkpixbuf] =3D "-Dpixbuf-loader=3Denabled,-Dpixbuf-loader=3D=
disabled,gdk-pixbuf-native"
+
+PACKAGECONFIG[avif] =3D "-Davif=3Denabled,-Davif=3Ddisabled,dav1d"
+PACKAGECONFIG[gdkpixbuf] =3D "-Dpixbuf=3Denabled,-Dpixbuf=3Ddisabled,gdk=
-pixbuf"
+# The gdk-pixbuf loader (depends on gdkpixbuf)
+PACKAGECONFIG[gdkpixbuf-loader] =3D "-Dpixbuf-loader=3Denabled,-Dpixbuf-=
loader=3Ddisabled,gdk-pixbuf-native"
 PACKAGECONFIG[vala] =3D "-Dvala=3Denabled,-Dvala=3Ddisabled"
 PACKAGECONFIG[apitest] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
=20
--=20
2.43.0


