Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 538AAC07D5A
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 07:07:46 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.87760.1701068862968535459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Nov 2023 23:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 2EDC822F21
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 08:07:41 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.41.136]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r7ViT-0r1Pgf0; Mon, 27 Nov 2023 08:07:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] pciutils: add packageconfigs for options
Date: Mon, 27 Nov 2023 08:07:46 +0100
Message-ID: <20231127070746.3199347-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701068857-E560B93F-69EF8F9A/0/0 CLEAN NORMAL
X-TOI-MSGID: cd61ec51-38f2-4181-910f-374e2d298cd6
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 07:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191260

My motivation for this is to get zlib support selectable, because
libosinfo requires the pci.ids file uncompressed. Add packageconfigs for
the other options as well to avoid autoselect.

Configuration stays the same besides zlib is deselected by default.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta/recipes-bsp/pciutils/pciutils_3.10.0.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/pciutils/pciutils_3.10.0.bb b/meta/recipes-=
bsp/pciutils/pciutils_3.10.0.bb
index e27cfd4ced..351dd94778 100644
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
@@ -29,7 +30,7 @@ do_configure () {
 	  cd lib && \
 	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain =
'HWDB=3Dyes/no',
 	  # so we put it before ./configure
-	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadi=
r} ${TARGET_OS} ${TARGET_ARCH}
+	  ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} $=
{TARGET_ARCH}
 	)
 }
=20
@@ -38,7 +39,7 @@ export SBINDIR =3D "${sbindir}"
 export SHAREDIR =3D "${datadir}"
 export MANDIR =3D "${mandir}"
=20
-EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D ${PCI_CONF_FLAG}"
+EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D'SHARED=3Dyes STRIP=3D LIBDIR=3D${libdi=
r}'"
=20
 ASNEEDED =3D ""
=20
--=20
2.42.1


