Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B827AC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:27:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.130443.1712647665993480461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 883EADA7
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 00:28:15 -0700 (PDT)
Received: from e133390.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A50E53F766
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 00:27:44 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] u-boot-tools: Package mkeficapsule
Date: Tue,  9 Apr 2024 08:27:25 +0100
Message-Id: <20240409072725.3365204-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:27:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198055

mkeficapsule is a tool provided by U-Boot (as part of the tools-only
targets) for generating UEFI capsule update archives.

Install mkeficapsule into a u-boot-tools-mkeficapsule package.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools.inc | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/=
u-boot/u-boot-tools.inc
index 09b3c3f68c..f3010763c0 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
@@ -4,10 +4,10 @@ DEPENDS +=3D "gnutls openssl util-linux swig-native"
 inherit python3native
 export STAGING_INCDIR=3D"${STAGING_INCDIR_NATIVE}"
=20
-PROVIDES =3D "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage"
-PROVIDES:class-native =3D "u-boot-mkimage-native u-boot-mkenvimage-nativ=
e"
+PROVIDES =3D "${MLPREFIX}u-boot-mkimage ${MLPREFIX}u-boot-mkenvimage ${M=
LPREFIX}u-boot-mkeficapsule"
+PROVIDES:class-native =3D "u-boot-mkimage-native u-boot-mkenvimage-nativ=
e u-boot-mkeficapsule-native"
=20
-PACKAGES +=3D "${PN}-mkimage ${PN}-mkenvimage"
+PACKAGES +=3D "${PN}-mkimage ${PN}-mkenvimage ${PN}-mkeficapsule"
=20
 # Required for backward compatibility with "u-boot-mkimage-xxx.bb"
 RPROVIDES:${PN}-mkimage =3D "u-boot-mkimage"
@@ -70,15 +70,20 @@ do_install () {
 	# fit_check_sign
 	install -m 0755 tools/fit_check_sign ${D}${bindir}/uboot-fit_check_sign
 	ln -sf uboot-fit_check_sign ${D}${bindir}/fit_check_sign
+
+	# mkeficapsule
+	install -m 0755 tools/mkeficapsule ${D}${bindir}/uboot-mkeficapsule
+	ln -sf uboot-mkeficapsule ${D}${bindir}/mkeficapsule
 }
=20
 ALLOW_EMPTY:${PN} =3D "1"
 FILES:${PN} =3D ""
 FILES:${PN}-mkimage =3D "${bindir}/uboot-mkimage ${bindir}/mkimage ${bin=
dir}/uboot-dumpimage ${bindir}/dumpimage ${bindir}/uboot-fit_check_sign $=
{bindir}/fit_check_sign"
 FILES:${PN}-mkenvimage =3D "${bindir}/uboot-mkenvimage ${bindir}/mkenvim=
age"
+FILES:${PN}-mkeficapsule =3D "${bindir}/uboot-mkeficapsule ${bindir}/mke=
ficapsule"
=20
 RDEPENDS:${PN}-mkimage +=3D "dtc"
-RDEPENDS:${PN} +=3D "${PN}-mkimage ${PN}-mkenvimage"
+RDEPENDS:${PN} +=3D "${PN}-mkimage ${PN}-mkenvimage ${PN}-mkeficapsule"
 RDEPENDS:${PN}:class-native =3D ""
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


