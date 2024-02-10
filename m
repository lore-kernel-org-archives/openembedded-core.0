Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45197C48260
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 11:36:31 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.12175.1707564982650556347
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 03:36:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=kOE9QeaJ;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 9752F240028
	for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 12:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1707564980; bh=CV+Nu/hMEAGhA+JmFrIxlPCp5jfHm1v2tLWT8dubSXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=kOE9QeaJ/i/vBSyQrnB8pFOByPewUgMIw5qCPIODSc9R9yqO8U6xaEhXxicwLN/U8
	 mTuGtzNEI6qH4zm4WXOjT+lwG0vnIe5G6eGHDguloBfTOTX98c253FoEn2yPQZ23FC
	 vRGffsQQh7qt7t3iu7U/8MDixpBfvserCin0MBITVM4ILbo6xd3FQGLKp8dAZWWYRO
	 FH9RYbhiM7fVraG/Ll9s761vzbjnBZlimUfCLOKfSfA7Y5t4LPi5OfecHB0Er1AHLW
	 eMCZ6L0wUQdRz68fVk5s2Ux8ET7JY48RpW2yJcbwNAd7pmCfC2Wv3HRgnc3Us9CS+S
	 ufy9Kw5kczP7g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TX7w36D1Xz6tsb;
	Sat, 10 Feb 2024 12:36:19 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] meta: stop using "virtual-" in RPROVIDES and RDEPENDS
Date: Sat, 10 Feb 2024 11:36:12 +0000
Message-Id: <20240210113612.525615-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 11:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195261

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Instead of using "virtual-" use "VIRTUAL-RUNTIME_" as recommended
in insane.bbclass for RPROVIDES and RDEPENDS.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-bsp/grub/grub-bootconf_1.00.bb        | 2 +-
 meta/recipes-bsp/grub/grub-efi_2.12.bb             | 2 +-
 meta/recipes-core/glibc/glibc-package.inc          | 2 +-
 meta/recipes-core/musl/musl_git.bb                 | 2 +-
 meta/recipes-core/systemd/systemd-boot_255.1.bb    | 2 +-
 meta/recipes-core/systemd/systemd-bootconf_1.00.bb | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb b/meta/recipes-b=
sp/grub/grub-bootconf_1.00.bb
index 783e30bf38..33a4517e5b 100644
--- a/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
+++ b/meta/recipes-bsp/grub/grub-bootconf_1.00.bb
@@ -5,7 +5,7 @@ DESCRIPTION =3D "Grub might require different configurati=
on file for \
 different machines."
 HOMEPAGE =3D "https://www.gnu.org/software/grub/manual/grub/grub.html#Co=
nfiguration"
=20
-RPROVIDES:${PN} +=3D "virtual-grub-bootconf"
+RPROVIDES:${PN} +=3D "VIRTUAL-RUNTIME_grub-bootconf"
=20
 inherit grub-efi-cfg
=20
diff --git a/meta/recipes-bsp/grub/grub-efi_2.12.bb b/meta/recipes-bsp/gr=
ub/grub-efi_2.12.bb
index 9857e8e036..078a59a465 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.12.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.12.bb
@@ -5,7 +5,7 @@ require conf/image-uefi.conf
 GRUBPLATFORM =3D "efi"
=20
 DEPENDS:append =3D " grub-native"
-RDEPENDS:${PN} =3D "grub-common virtual-grub-bootconf"
+RDEPENDS:${PN} =3D "grub-common VIRTUAL-RUNTIME_grub-bootconf"
=20
 SRC_URI +=3D " \
            file://cfg \
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
index 1ef987be0a..8846934b25 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -7,7 +7,7 @@ RPROVIDES:${PN} =3D "eglibc rtld(GNU_HASH)"
 RPROVIDES:${PN}-utils =3D "eglibc-utils"
 RPROVIDES:${PN}-mtrace =3D "eglibc-mtrace libc-mtrace"
 RPROVIDES:${PN}-pic =3D "eglibc-pic"
-RPROVIDES:${PN}-dev =3D "eglibc-dev libc6-dev virtual-libc-dev"
+RPROVIDES:${PN}-dev =3D "eglibc-dev libc6-dev VIRTUAL-RUNTIME_libc-dev"
 RPROVIDES:${PN}-staticdev =3D "eglibc-staticdev"
 RPROVIDES:${PN}-doc =3D "eglibc-doc"
 RPROVIDES:glibc-extra-nss =3D "eglibc-extra-nss"
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
index 324269a968..54df0de913 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -76,7 +76,7 @@ FILES:${PN}-dev =3D+ "${libdir}/libcrypt.a ${libdir}/li=
bdl.a ${libdir}/libm.a \
                    "
=20
 RDEPENDS:${PN}-dev +=3D "linux-libc-headers-dev bsd-headers-dev libssp-n=
onshared-staticdev"
-RPROVIDES:${PN}-dev +=3D "libc-dev virtual-libc-dev"
+RPROVIDES:${PN}-dev +=3D "libc-dev VIRTUAL-RUNTIME_libc-dev"
 RPROVIDES:${PN} +=3D "ldd rtld(GNU_HASH)"
=20
 LEAD_SONAME =3D "libc.so"
diff --git a/meta/recipes-core/systemd/systemd-boot_255.1.bb b/meta/recip=
es-core/systemd/systemd-boot_255.1.bb
index 4ee25ee72f..32495c883d 100644
--- a/meta/recipes-core/systemd/systemd-boot_255.1.bb
+++ b/meta/recipes-core/systemd/systemd-boot_255.1.bb
@@ -45,7 +45,7 @@ python __anonymous () {
=20
 FILES:${PN} =3D "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
=20
-RDEPENDS:${PN} +=3D "virtual-systemd-bootconf"
+RDEPENDS:${PN} +=3D "VIRTUAL-RUNTIME_systemd-bootconf"
=20
 CFLAGS:append:libc-musl =3D " -D__DEFINED_wchar_t"
=20
diff --git a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb b/meta/re=
cipes-core/systemd/systemd-bootconf_1.00.bb
index 19637546a9..5017b256e7 100644
--- a/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
+++ b/meta/recipes-core/systemd/systemd-bootconf_1.00.bb
@@ -2,7 +2,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
 SUMMARY =3D "Basic systemd-boot configuration files"
=20
-RPROVIDES:${PN} +=3D "virtual-systemd-bootconf"
+RPROVIDES:${PN} +=3D "VIRTUAL-RUNTIME_systemd-bootconf"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 inherit systemd-boot-cfg
--=20
2.39.2


