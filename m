Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCF0C5B549
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 07:19:28 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.28356.1749194358674990690
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 00:19:19 -0700
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
Subject: [PATCH v1 1/2] uboot-sign: Avoid symlink and install errors when SPL DTB is missing
Date: Fri, 6 Jun 2025 15:19:14 +0800
Message-ID: <20250606071915.2680182-2-jamin_lin@aspeedtech.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218113

Fix potential errors during do_deploy and deploy_spl_dtb when SPL_DTB_BINAR=
Y or
SPL_BINARY is not present.

Wrapped install command in deploy_spl_dtb() with a file existence check.
Improved condition in do_deploy to check for actual existence of
${SPL_DIR}/${SPL_DTB_BINARY} instead of only relying on variable non-emptin=
ess.
Prevents "install: missing destination file operand" and invalid symlink
creation.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 73e9ce3f11..6ee1874cd6 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -275,7 +275,9 @@ deploy_spl_dtb() {
 	fi
=20
 	# For backwards compatibility...
-	install -Dm644 ${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+	if [ -e "${SPL_BINARY}" ]; then
+		install -Dm644 ${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
+	fi
 }
=20
 do_uboot_generate_rsa_keys() {
@@ -600,7 +602,7 @@ do_deploy:prepend() {
 		ln -sf ${UBOOT_FITIMAGE_IMAGE} ${DEPLOYDIR}/${UBOOT_FITIMAGE_SYMLINK}
 	fi
=20
-	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -n "${SPL_DTB_BINARY}" ] ; then
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" -a -e "${SPL_DIR}/${SPL_DTB_BINARY}" ] =
; then
 		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_SYMLINK}
 		ln -sf ${SPL_DTB_IMAGE} ${DEPLOYDIR}/${SPL_DTB_BINARY}
 		ln -sf ${SPL_NODTB_IMAGE} ${DEPLOYDIR}/${SPL_NODTB_SYMLINK}
--=20
2.43.0


