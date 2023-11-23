Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000B7C61D85
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 11:35:06 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.89093.1700739297607395918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 03:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout06.t-online.de (Postfix) with SMTP id 9C69623390
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 12:34:55 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.134]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r67yw-0WwZHd0; Thu, 23 Nov 2023 12:34:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] pciutils: add packageconfigs for options
Date: Thu, 23 Nov 2023 12:34:52 +0100
Message-ID: <20231123113452.1697802-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700739294-FEB02990-9245B888/0/0 CLEAN NORMAL
X-TOI-MSGID: 73e690f3-e619-4d48-a5e5-92a2ba182a08
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 11:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191142

My motivation for this is to get zlib support selectable, because
libosinfo requires the pci.ids file uncompressed. Add packageconfigs for
the other options as well to avoid autoselect.

Configuration stays the same besides zlib is deselected by default.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-bsp/pciutils/pciutils_3.10.0.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb b/meta/recipes-=
bsp/pciutils/pciutils_3.10.0.bb
index e27cfd4ced..4bde090169 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe"
 # Can drop make-native when all systems have make 4.3
 # https://git.savannah.gnu.org/cgit/make.git/commit/?id=3Db90fabc8d6f34f=
b37d428dc0fb1b8b1951a9fbed
 # causes space issues in lib/libpci.pc
-DEPENDS =3D "zlib kmod make-native"
+DEPENDS =3D "make-native"
=20
 SRC_URI =3D "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.=
tar.xz \
            file://configure.patch"
@@ -18,10 +18,11 @@ SRC_URI[sha256sum] =3D "238a2e27166730e53a17fe07bfad2=
29e07fa39b618117e5944b6d7eda9
=20
 inherit multilib_header pkgconfig update-alternatives
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'hwdb', '', d)}"
+PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', =
'hwdb', '', d)} dns kmod"
 PACKAGECONFIG[hwdb] =3D "HWDB=3Dyes,HWDB=3Dno,udev"
-
-PCI_CONF_FLAG =3D "ZLIB=3Dyes DNS=3Dyes SHARED=3Dyes STRIP=3D LIBDIR=3D$=
{libdir}"
+PACKAGECONFIG[zlib] =3D "ZLIB=3Dyes,ZLIB=3Dno,zlib"
+PACKAGECONFIG[kmod] =3D "LIBKMOD=3Dyes,LIBKMOD=3Dno,kmod"
+PACKAGECONFIG[dns] =3D "DNS=3Dyes,DNS=3Dno"
=20
 # see configure.patch
 do_configure () {
@@ -38,7 +39,7 @@ export SBINDIR =3D "${sbindir}"
 export SHAREDIR =3D "${datadir}"
 export MANDIR =3D "${mandir}"
=20
-EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D ${PCI_CONF_FLAG}"
+EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D SHARED=3Dyes STRIP=3D LIBDIR=3D${libdi=
r}"
=20
 ASNEEDED =3D ""
=20
--=20
2.42.0


