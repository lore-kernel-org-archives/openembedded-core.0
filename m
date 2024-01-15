Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D087EC47077
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 03:03:02 +0000 (UTC)
Received: from TWMBX02.aspeed.com (TWMBX02.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.66921.1705287772720874493
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 19:02:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Jan
 2024 11:02:49 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jan 2024 11:02:49 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] uboot-sign: add variables to set load address and entrypoint
Date: Mon, 15 Jan 2024 11:02:40 +0800
Message-ID: <20240115030240.1261131-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=twmbx02.aspeed.com;
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 03:03:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193629

According to the design of uboot-sign.bbclass and kernel-fitimage.bbclass,
both of them use an UBOOT_LOADADDRESS variable to set the load address of
kernel and u-boot image and use an UBOOT_ENTRYPOINT to set the entry addres=
s of
kernel and u-boot image.

However, users may set the different load address of u-boot
and kernel image. Therefore, adds UBOOT_FIT_UBOOT_LOADADDRESS
and UBOOT_FIT_UBOOT_ENTRYPOINT to set the
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


