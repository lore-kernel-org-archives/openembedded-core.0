Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7A4EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 13:07:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.39079.1688994414979133706
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 06:06:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B944E2B;
	Mon, 10 Jul 2023 06:07:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D86153F67D;
	Mon, 10 Jul 2023 06:06:53 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libdmx: remove obsolete library
Date: Mon, 10 Jul 2023 14:06:52 +0100
Message-Id: <20230710130652.3413573-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 13:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184076

From: Ross Burton <ross.burton@arm.com>

The Xdmx server was removed from the xorg-server sources in xorg-server
21 (released Oct. 2021), so this is only useful for communicating with
Xdmx from the 1.20 and older releases.

Also remove the DEPENDS on libdmx in xdpyinfo for the same reason.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc       |  1 -
 .../xorg-app/xdpyinfo_1.3.4.bb                 |  2 +-
 meta/recipes-graphics/xorg-lib/libdmx_1.1.5.bb | 18 ------------------
 3 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libdmx_1.1.5.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index fafa8eeb2ca..6e82e943fa3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -321,7 +321,6 @@ RECIPE_MAINTAINER:pn-libconvert-asn1-perl =3D "Tim Or=
ling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-libcroco =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libdaemon =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-libdazzle =3D "Alexander Kanavin <alex.kanavin@gmai=
l.com>"
-RECIPE_MAINTAINER:pn-libdmx =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libdnf =3D "Alexander Kanavin <alex.kanavin@gmail.c=
om>"
 RECIPE_MAINTAINER:pn-libdrm =3D "Otavio Salvador <otavio.salvador@ossyst=
ems.com.br>"
 RECIPE_MAINTAINER:pn-libedit =3D "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb b/meta/reci=
pes-graphics/xorg-app/xdpyinfo_1.3.4.bb
index aaa8aa8903a..3becd402810 100644
--- a/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
+++ b/meta/recipes-graphics/xorg-app/xdpyinfo_1.3.4.bb
@@ -9,7 +9,7 @@ clients and the server, and the different types of screen=
s and visuals \
 that are available."
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df3d09e6b9e203a1af489e16c708f4=
fb3"
-DEPENDS +=3D "libxtst libxext libxxf86vm libxi libxrender libxinerama li=
bdmx libxau libxcomposite"
+DEPENDS +=3D "libxtst libxext libxxf86vm libxi libxrender libxinerama li=
bxau libxcomposite"
 PE =3D "1"
=20
 SRC_URI +=3D "file://disable-xkb.patch"
diff --git a/meta/recipes-graphics/xorg-lib/libdmx_1.1.5.bb b/meta/recipe=
s-graphics/xorg-lib/libdmx_1.1.5.bb
deleted file mode 100644
index 96015ad882c..00000000000
--- a/meta/recipes-graphics/xorg-lib/libdmx_1.1.5.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-lib-common.inc
-
-SUMMARY =3D "DMX: Distributed Multihead X extension library"
-
-DESCRIPTION =3D "The DMX extension provides support for communication wi=
th \
-and control of Xdmx(1) server. Attributes of the Xdmx(1) server and of \
-the back-end screens attached to the server can be queried and modified =
\
-via this protocol."
-
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da3c3499231a8035efd0e004cfbd3b=
72a \
-                    file://src/dmx.c;endline=3D33;md5=3Dc43f19af03c7c861=
9cadc9724ed9afe1"
-
-DEPENDS +=3D "libxext xorgproto"
-
-PE =3D "1"
-
-SRC_URI[sha256sum] =3D "35a4e26a8b0b2b4fe36441dca463645c3fa52d282ac35205=
01a38ea942cbf74f"
--=20
2.34.1


