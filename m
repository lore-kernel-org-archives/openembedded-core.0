Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7443BC4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 06:19:45 +0000 (UTC)
Received: from TWMBX02.aspeed.com (TWMBX02.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.16006.1705645183191773477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 22:19:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.25) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 19 Jan
 2024 14:19:43 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jan 2024 14:19:43 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 3/4] u-boot-sign:uboot-config: support to verify signed FIT image
Date: Fri, 19 Jan 2024 14:19:36 +0800
Message-ID: <20240119061937.1368163-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
References: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 06:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194012

It does not verify the signed FIT image of kernel and uboot.
To catch the unexpected errors as far as possible at the build time,
add uboot-fit-check-sign tool which is provided by u-boot to
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
index 4b462698f9..7a0b8047e4 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -112,6 +112,10 @@ concat_dtb() {
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
@@ -316,6 +320,12 @@ EOF
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
 	if [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
--=20
2.25.1


