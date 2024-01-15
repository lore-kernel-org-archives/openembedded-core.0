Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70BEC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 06:53:43 +0000 (UTC)
Received: from TWMBX03.aspeed.com (TWMBX03.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.71316.1705301613367906832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jan 2024 22:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 15 Jan
 2024 14:53:30 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jan 2024 14:53:30 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v1] u-boot-sign.bbclass: support to verify signed FIT image
Date: Mon, 15 Jan 2024 14:53:28 +0800
Message-ID: <20240115065328.2878707-1-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 06:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193635

It does not verify the signed FIT image of kernel and uboot.
To catch the unexpected errors as far as possible at the build time,
add uboot-fit-check-sign tool which is provided by u-boot tools to
verify the signed FIT image.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-config.bbclass |  3 +++
 meta/classes-recipe/uboot-sign.bbclass   | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 9be1d64d3e..0c579e8861 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -94,6 +94,9 @@ SPL_MKIMAGE_SIGN_ARGS ?=3D ""
 UBOOT_DTB ?=3D ""
 UBOOT_DTB_BINARY ??=3D ""
=20
+# uboot-fit_check_sign command
+UBOOT_FIT_CHECK_SIGN ?=3D "uboot-fit_check_sign"
+
 python () {
     ubootmachine =3D d.getVar("UBOOT_MACHINE")
     ubootconfigflags =3D d.getVarFlags('UBOOT_CONFIG')
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index ad04c82378..741d2216b9 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -109,6 +109,10 @@ concat_dtb() {
 			-K "${UBOOT_DTB_BINARY}" \
 			-r ${B}/fitImage-linux \
 			${UBOOT_MKIMAGE_SIGN_ARGS}
+		# Verify the kernel image and u-boot dtb
+		${UBOOT_FIT_CHECK_SIGN} \
+			-k "${UBOOT_DTB_BINARY}" \
+			-f ${B}/fitImage-linux
 		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
 	fi
=20
@@ -313,6 +317,12 @@ EOF
 			-K "${SPL_DIR}/${SPL_DTB_BINARY}" \
 			-r ${UBOOT_FITIMAGE_BINARY} \
 			${SPL_MKIMAGE_SIGN_ARGS}
+		#
+		# Verify the U-boot FIT image and SPL dtb
+		#
+		${UBOOT_FIT_CHECK_SIGN} \
+			-k "${SPL_DIR}/${SPL_DTB_BINARY}" \
+			-f ${UBOOT_FITIMAGE_BINARY}
 	fi
=20
 	cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
--=20
2.25.1


