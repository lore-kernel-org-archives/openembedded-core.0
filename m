Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9D3C433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 14:50:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9352.1634136647516686504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 07:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0C7ED6E;
	Wed, 13 Oct 2021 07:50:45 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7098C3F694;
	Wed, 13 Oct 2021 07:50:45 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [OE-core] [PATCH] u-boot: Convert ${UBOOT_ENV}.cmd into
 ${UBOOT_ENV}.scr
Date: Wed, 13 Oct 2021 15:50:11 +0100
Message-Id: <20211013145011.2993321-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 14:50:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156914

From: Peter Hoyes <Peter.Hoyes@arm.com>

 * Add extra SRC variables to uboot-config.class for source cmd file
 * Add DEPENDS on u-boot-mkimage-native if UBOOT_ENV_SUFFIX is scr
 * Compile cmd -> scr in do_compile if UBOOT_ENV_SUFFIX is scr

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 meta/classes/uboot-config.bbclass  | 2 ++
 meta/recipes-bsp/u-boot/u-boot.inc | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-confi=
g.bbclass
index 07a303d0a07..b9ad35821ac 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -53,6 +53,8 @@ SPL_SYMLINK ?=3D "${SPL_BINARYNAME}-${MACHINE}${SPL_DEL=
IMITER}${SPL_SUFFIX}"
 # include it in the SRC_URI and set the UBOOT_ENV parameter.
 UBOOT_ENV_SUFFIX ?=3D "txt"
 UBOOT_ENV ?=3D ""
+UBOOT_ENV_SRC_SUFFIX ?=3D "cmd"
+UBOOT_ENV_SRC ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SRC_SUFFIX}"
 UBOOT_ENV_BINARY ?=3D "${UBOOT_ENV}.${UBOOT_ENV_SUFFIX}"
 UBOOT_ENV_IMAGE ?=3D "${UBOOT_ENV}-${MACHINE}-${PV}-${PR}.${UBOOT_ENV_SU=
FFIX}"
 UBOOT_ENV_SYMLINK ?=3D "${UBOOT_ENV}-${MACHINE}.${UBOOT_ENV_SUFFIX}"
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
index f27fdd5998e..ec4a3d201d1 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -4,6 +4,7 @@ PROVIDES =3D "virtual/bootloader"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 DEPENDS +=3D "kern-tools-native"
+DEPENDS +=3D "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mk=
image-native', '', d)}"
=20
 inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python=
3native kernel-arch
=20
@@ -106,6 +107,11 @@ do_compile () {
             oe_runmake -C ${S} O=3D${B} u-boot-initial-env
         fi
     fi
+
+    if [ -n "${UBOOT_ENV}" && "${UBOOT_ENV_SUFFIX}" =3D "scr" ]
+    then
+        ${UBOOT_MKIMAGE} -C none -A ${UBOOT_ARCH} -T script -d ${WORKDIR=
}/${UBOOT_ENV_SRC} ${WORKDIR}/${UBOOT_ENV_BINARY}
+    fi
 }
=20
 do_install () {
--=20
2.25.1


