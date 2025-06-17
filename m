Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B58D4C7115F
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 08:10:59 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.13301.1750147855276325504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 01:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 17 Jun
 2025 16:10:52 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 17 Jun 2025 16:10:52 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v2 1/3] uboot-sign: Support signing U-Boot FIT image without SPL
Date: Tue, 17 Jun 2025 16:10:50 +0800
Message-ID: <20250617081052.3087995-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617081052.3087995-1-jamin_lin@aspeedtech.com>
References: <20250617081052.3087995-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 08:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218859

Previously, the signing flow in "uboot-sign.bbclass" assumed that SPL was a=
lways
present and that the FIT signing process must inject the public key into th=
e
SPL DTB. This made it inflexible for use cases where only the U-Boot proper
FIT image is built and signed, with no SPL binary at all.

This change introduces the following adjustments:
- The `SPL_DTB_BINARY` variable can be explicitly set to an empty string
  to indicate that no SPL is present.
- The signing logic checks `SPL_DTB_BINARY` and skips injecting the
  key or verifying the SPL DTB if it is empty.
- The FIT image generation and deployment are always performed if
  `UBOOT_FITIMAGE_ENABLE` is enabled, regardless of the SPL settings.
- The deploy helper now uses a single check on `SPL_DTB_BINARY` to decide
  whether to deploy the signed SPL DTB.

Now the sign step checks if SPL_DTB_BINARY is empty:
If present, it signs the FIT image and injects the public key into the SPL =
DTB,
then verifies both.
If empty, it only signs the FIT image and generates the ITS with the signat=
ure
node, but does not attempt to verify or add the key to a non-existent SPL D=
TB.

Key Behavior Explained
If SPL_DTB_BINARY is empty, we assume there is no SPL.
If UBOOT_FITIMAGE_ENABLE=3D1, we always create the FIT image and ITS.
If SPL_SIGN_ENABLE=3D1, we always sign the FIT image, but only inject the k=
ey into
the SPL DTB if it exists.

Example usage:
  UBOOT_FITIMAGE_ENABLE =3D "1"
  SPL_SIGN_ENABLE =3D "1"
  SPL_DTB_BINARY =3D ""

This means:
  - Generate and sign the FIT image.
  - Do not attempt to sign or deploy an SPL DTB.

This aligns the implementation with real scenarios where some boards do not
require an SPL.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 50 +++++++++++++++-----------
 1 file changed, 29 insertions(+), 21 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 73e9ce3f11..01c53c7448 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -50,6 +50,8 @@ UBOOT_FITIMAGE_BINARY ?=3D "u-boot-fitImage"
 UBOOT_FITIMAGE_SYMLINK ?=3D "u-boot-fitImage-${MACHINE}"
 SPL_DIR ?=3D "spl"
 SPL_DTB_IMAGE ?=3D "u-boot-spl-${MACHINE}-${PV}-${PR}.dtb"
+# When SPL is not used, set SPL_DTB_BINARY ?=3D "" to explicitly indicate
+# that no SPL DTB should be created or signed.
 SPL_DTB_BINARY ?=3D "u-boot-spl.dtb"
 SPL_DTB_SIGNED ?=3D "${SPL_DTB_BINARY}-signed"
 SPL_DTB_SYMLINK ?=3D "u-boot-spl-${MACHINE}.dtb"
@@ -466,25 +468,31 @@ EOF
 		${UBOOT_FITIMAGE_BINARY}
=20
 	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
-		#
-		# Sign the U-boot FIT image and add public key to SPL dtb
-		#
-		${UBOOT_MKIMAGE_SIGN} \
-			${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else =
''} \
-			-F -k "${SPL_SIGN_KEYDIR}" \
-			-K "${SPL_DIR}/${SPL_DTB_BINARY}" \
-			-r ${UBOOT_FITIMAGE_BINARY} \
-			${SPL_MKIMAGE_SIGN_ARGS}
-		#
-		# Verify the U-boot FIT image and SPL dtb
-		#
-		${UBOOT_FIT_CHECK_SIGN} \
-			-k "${SPL_DIR}/${SPL_DTB_BINARY}" \
-			-f ${UBOOT_FITIMAGE_BINARY}
-	fi
+		if [ -n "${SPL_DTB_BINARY}" ] ; then
+			#
+			# Sign the U-boot FIT image and add public key to SPL dtb
+			#
+			${UBOOT_MKIMAGE_SIGN} \
+				${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else=
 ''} \
+				-F -k "${SPL_SIGN_KEYDIR}" \
+				-K "${SPL_DIR}/${SPL_DTB_BINARY}" \
+				-r ${UBOOT_FITIMAGE_BINARY} \
+				${SPL_MKIMAGE_SIGN_ARGS}
=20
-	if [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
-		cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
+			# Verify the U-boot FIT image and SPL dtb
+			${UBOOT_FIT_CHECK_SIGN} \
+				-k "${SPL_DIR}/${SPL_DTB_BINARY}" \
+				-f ${UBOOT_FITIMAGE_BINARY}
+
+			cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
+		else
+			# Sign the U-boot FIT image
+			${UBOOT_MKIMAGE_SIGN} \
+				${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else=
 ''} \
+				-F -k "${SPL_SIGN_KEYDIR}" \
+				-r ${UBOOT_FITIMAGE_BINARY} \
+				${SPL_MKIMAGE_SIGN_ARGS}
+		fi
 	fi
 }
=20
@@ -496,7 +504,7 @@ uboot_assemble_fitimage_helper() {
 		concat_dtb "$type" "$binary"
 	fi
=20
-	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; then
+	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" ]; then
 		uboot_fitimage_assemble
 	fi
=20
@@ -543,7 +551,7 @@ deploy_helper() {
 		deploy_dtb $type
 	fi
=20
-	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ]; then
+	if [ "${UBOOT_FITIMAGE_ENABLE}" =3D "1" ]; then
 		if [ -n "${type}" ]; then
 			uboot_its_image=3D"u-boot-its-${type}-${PV}-${PR}"
 			uboot_fitimage_image=3D"u-boot-fitImage-${type}-${PV}-${PR}"
@@ -561,7 +569,7 @@ deploy_helper() {
 		fi
 	fi
=20
-	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_SIGNED}" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ] ; then
 		deploy_spl_dtb $type
 	fi
 }
--=20
2.43.0


