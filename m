Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA68D3ABDE
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 18:13:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.66462.1731348830179258044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 10:13:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9ED351CE0
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:14:19 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C9393F59E
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 10:13:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] libpciaccess: remove redundant feature check
Date: Mon, 11 Nov 2024 18:13:38 +0000
Message-Id: <20241111181341.3296523-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111181341.3296523-1-ross.burton@arm.com>
References: <20241111181341.3296523-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 18:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206972

This recipe once included the xorg common .inc file but had to reset
several variables. It no longer includes that file but there's a lot of
cruft to remove: the LICENSE being "MIT & MIT" and the features_check
class not checking for any features, specifically.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xorg-lib/libpciaccess_0.18.1.bb               | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb b/meta=
/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
index d311fd95e0b..247a14ac44e 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb
@@ -1,26 +1,19 @@
 SUMMARY =3D "Generic PCI access library for X"
-
 DESCRIPTION =3D "libpciaccess provides functionality for X to access the=
 \
 PCI bus and devices in a platform-independent way."
=20
 HOMEPAGE =3D "http://www.x.org"
 BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.cgi?product=3Dxor=
g"
-
 SECTION =3D "x11/libs"
+
 LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D54c978968e565218eea36cf03ef24=
352"
+
 DEPENDS =3D "util-macros"
=20
 SRC_URI =3D "${XORG_MIRROR}/individual/lib/${BP}.tar.xz"
-
-inherit features_check pkgconfig meson
-
-REQUIRED_DISTRO_FEATURES ?=3D "x11"
-
 SRC_URI[sha256sum] =3D "4af43444b38adb5545d0ed1c2ce46d9608cc47b31c2387fc=
5181656765a6fa76"
=20
-LICENSE =3D "MIT & MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D54c978968e565218eea36cf03ef24=
352"
-
-REQUIRED_DISTRO_FEATURES =3D ""
+inherit pkgconfig meson
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


