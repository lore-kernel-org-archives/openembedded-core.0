Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75716C47DD6
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 06:19:45 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.70])
 by mx.groups.io with SMTP id smtpd.web10.16005.1705645182890444594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 22:19:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=fail (domain: aspeedtech.com, ip: 211.20.114.70, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX03.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 19 Jan
 2024 14:20:04 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Jan
 2024 14:20:05 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jan 2024 14:19:40 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/4] uboot-sign: set load address and entrypoint
Date: Fri, 19 Jan 2024 14:19:34 +0800
Message-ID: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194010

According to the design of uboot-sign.bbclass and kernel-fitimage.bbclass,
both of them use an UBOOT_LOADADDRESS variable to set the load address of
kernel and u-boot image and use an UBOOT_ENTRYPOINT variable to set the ent=
ry address of
kernel and u-boot image.

However, users may want to set the different load address of u-boot
and kernel image. Therefore, adds UBOOT_FIT_UBOOT_LOADADDRESS
and UBOOT_FIT_UBOOT_ENTRYPOINT variables to set the
load address and entry point of u-boot image, respectively.

The value of UBOOT_FIT_UBOOT_ENTRYPOINT is UBOOT_LOADADDRESS by default.
The value of UBOOT_FIT_UBOOT_ENTRYPOINT is UBOOT_ENTRYPOINT by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index ad04c82378..abde0bc61c 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -88,6 +88,9 @@ UBOOT_FIT_ADDRESS_CELLS ?=3D "1"
 # This is only necessary for determining the signing configuration
 KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
=20
+UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
+UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
+
 python() {
     # We need u-boot-tools-native if we're creating a U-Boot fitImage
     sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
@@ -248,8 +251,8 @@ uboot_fitimage_assemble() {
             os =3D "u-boot";
             arch =3D "${UBOOT_ARCH}";
             compression =3D "none";
-            load =3D <${UBOOT_LOADADDRESS}>;
-            entry =3D <${UBOOT_ENTRYPOINT}>;
+            load =3D <${UBOOT_FIT_UBOOT_LOADADDRESS}>;
+            entry =3D <${UBOOT_FIT_UBOOT_ENTRYPOINT}>;
 EOF
=20
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
--=20
2.25.1


