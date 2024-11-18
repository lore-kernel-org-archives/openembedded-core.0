Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70F67D6DDC4
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 06:32:45 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web11.35187.1731911555263160883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 22:32:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 18 Nov
 2024 14:32:33 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 18 Nov 2024 14:32:33 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>
Subject: [PATCH v4 2/3] uboot-sign: support to create users specific image tree source
Date: Mon, 18 Nov 2024 14:32:32 +0800
Message-ID: <20241118063233.698679-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
References: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 06:32:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207205

Currently, uboot-sign.bbclass only supports to create Image Tree Source(ITS=
)
for "u-boot" and "flat_dt". However, users may want to support their privat=
e
images for specific application and purpose.

To make this bbclass more flexible and support users specific ITS, creates =
new
"uboot_fitimage_user_image" function. It is an empty function, so users can
create a bbappend to overwrite this function with their specific settings.

Otherwise, users need to overwrite the "uboot_fitimage_assemble" function.

Add a variable "UBOOT_FIT_USER_IMAGE" to enable users specific ITS generati=
on
and it is disable by default.

Add a variable "UBOOT_FIT_CONF_USER_LOADABLES" to load users specific image=
s
and it is an empty by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index f1b3470127..3b61f239e3 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -100,6 +100,13 @@ UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
 UBOOT_FIT_TEE ?=3D "0"
 UBOOT_FIT_TEE_IMAGE ?=3D "tee-raw.bin"
=20
+# User specific image
+UBOOT_FIT_USER_IMAGE ?=3D "0"
+
+# Unit name containing a list of users additional binaries to be loaded.
+# It is a comma-separated list of strings.
+UBOOT_FIT_CONF_USER_LOADABLES ?=3D ''
+
 UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
=20
@@ -246,6 +253,12 @@ do_uboot_generate_rsa_keys() {
=20
 addtask uboot_generate_rsa_keys before do_uboot_assemble_fitimage after do=
_compile
=20
+# Create a ITS file for the user specific image. It is an empty function a=
nd
+# users should create a bbappend to overwrite this function
+uboot_fitimage_user_image() {
+	bbwarn "Please add your specific image ITS settings for u-boot FIT image =
generation."
+}
+
 # Create a ITS file for the atf
 uboot_fitimage_atf() {
 	cat << EOF >> ${UBOOT_ITS}
@@ -366,6 +379,13 @@ EOF
 		conf_loadables=3D"\"atf\", ${conf_loadables}"
 		uboot_fitimage_atf
 	fi
+
+	if [ "${UBOOT_FIT_USER_IMAGE}" =3D "1" ] ; then
+		if [ -n "${UBOOT_FIT_CONF_USER_LOADABLES}" ] ; then
+			conf_loadables=3D"${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
+		fi
+		uboot_fitimage_user_image
+	fi
 	cat << EOF >> ${UBOOT_ITS}
     };
=20
--=20
2.25.1


