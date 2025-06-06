Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF026C5B555
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:19:28 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.28356.1749194358674990690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 00:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 6 Jun
 2025 15:19:15 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Jun 2025 15:19:15 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v1 2/2] uboot-sign: Make SPL DTB public key injection optional
Date: Fri, 6 Jun 2025 15:19:15 +0800
Message-ID: <20250606071915.2680182-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606071915.2680182-1-jamin_lin@aspeedtech.com>
References: <20250606071915.2680182-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 07:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218114

Introduce SPL_SIGN_ADD_PUBKEY to control whether the public key is
added into the SPL device tree and whether FIT signature verification is
performed after signing.

Key changes:
- Added SPL_SIGN_ADD_PUBKEY variable (default =3D "1")
- Conditionally apply '-K <dtb>' to mkimage only if adding key is enabled
- Skip fit_check_sign when public key injection is disabled
- Suppress concat_spl_dtb() warnings if key adding is turned off

This allows U-Boot FIT images to be signed without modifying the SPL DTB,
useful in scenarios where public key management is handled elsewhere or
post-processing will be done separately.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 6ee1874cd6..3bcf47dd33 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -34,6 +34,12 @@ UBOOT_FITIMAGE_ENABLE ?=3D "0"
 # Signature activation - this requires UBOOT_FITIMAGE_ENABLE =3D "1"
 SPL_SIGN_ENABLE ?=3D "0"
=20
+# Whether to add (embed) the public key into the SPL Device Tree (.dtb).
+# If set to "1", the key will be inserted into the /signature node of the =
DTB
+# and fit_check_sign will be used to verify the signature.
+# If set to "0", only signing will be performed, without modifying the DTB=
.
+SPL_SIGN_ADD_PUBKEY ?=3D "1"
+
 # Default value for deployment filenames.
 UBOOT_DTB_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.dtb"
 UBOOT_DTB_BINARY ?=3D "u-boot.dtb"
@@ -245,7 +251,9 @@ concat_spl_dtb() {
 	if [ -e "${SPL_DIR}/${SPL_NODTB_BINARY}" -a -e "${SPL_DIR}/${SPL_DTB_BINA=
RY}" ] ; then
 		cat ${SPL_DIR}/${SPL_NODTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED} > "${SPL=
_BINARY}"
 	else
-		bbwarn "Failure while adding public key to spl binary. Verified U-Boot b=
oot won't be available."
+		if [ "${SPL_SIGN_ADD_PUBKEY}" =3D "1" ]; then
+			bbwarn "Failure while adding public key to spl binary. Verified U-Boot =
boot won't be available."
+		fi
 	fi
 }
=20
@@ -474,15 +482,17 @@ EOF
 		${UBOOT_MKIMAGE_SIGN} \
 			${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else =
''} \
 			-F -k "${SPL_SIGN_KEYDIR}" \
-			-K "${SPL_DIR}/${SPL_DTB_BINARY}" \
+			${@'-K "${SPL_DIR}/${SPL_DTB_BINARY}"' if d.getVar("SPL_SIGN_ADD_PUBKEY=
") =3D=3D "1" else ''} \
 			-r ${UBOOT_FITIMAGE_BINARY} \
 			${SPL_MKIMAGE_SIGN_ARGS}
 		#
 		# Verify the U-boot FIT image and SPL dtb
 		#
-		${UBOOT_FIT_CHECK_SIGN} \
-			-k "${SPL_DIR}/${SPL_DTB_BINARY}" \
-			-f ${UBOOT_FITIMAGE_BINARY}
+		if [ "${SPL_SIGN_ADD_PUBKEY}" =3D "1" ]; then
+			${UBOOT_FIT_CHECK_SIGN} \
+				-k "${SPL_DIR}/${SPL_DTB_BINARY}" \
+				-f ${UBOOT_FITIMAGE_BINARY}
+		fi
 	fi
=20
 	if [ -e "${SPL_DIR}/${SPL_DTB_BINARY}" ]; then
--=20
2.43.0


