Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E88C3DA6D
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 01:21:32 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.1137.1747790485245780897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 18:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 21 May
 2025 09:21:22 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 21 May 2025 09:21:22 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
CC: <troy_lee@aspeedtech.com>, <jamin_lin@aspeedtech.com>,
	<vince_chang@aspeedtech.com>
Subject: [PATCH v3 2/2] uboot-sign: Add support for setting firmware property in FIT configuration
Date: Wed, 21 May 2025 09:21:21 +0800
Message-ID: <20250521012121.3697660-3-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521012121.3697660-1-jamin_lin@aspeedtech.com>
References: <20250521012121.3697660-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216959

Add the ability to set the "firmware" property in the FIT configuration nod=
e
by introducing the UBOOT_FIT_CONF_FIRMWARE variable.

This property defines the primary image to be executed during boot. If it i=
s
set, its value will be written into the FIT configuration under the "firmwa=
re"
field. If not set, the bootloader will fall back to using the first entry i=
n
the "loadables" list.

Using this property improves control over the boot sequence, especially in
multi-binary boot scenarios.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index dcf94b7179..796c040e8b 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -101,6 +101,10 @@ UBOOT_FIT_TEE_IMAGE ?=3D "tee-raw.bin"
 # User specific settings
 UBOOT_FIT_USER_SETTINGS ?=3D ""
=20
+# Sets the firmware property to select the image to boot first.
+# If not set, the first entry in "loadables" is used instead.
+UBOOT_FIT_CONF_FIRMWARE ?=3D ""
+
 # Unit name containing a list of users additional binaries to be loaded.
 # It is a comma-separated list of strings.
 UBOOT_FIT_CONF_USER_LOADABLES ?=3D ''
@@ -361,6 +365,7 @@ EOF
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
 	conf_loadables=3D"\"uboot\""
+	conf_firmware=3D""
 	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
=20
 	# First we create the ITS script
@@ -432,6 +437,10 @@ EOF
 		conf_loadables=3D"${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
 	fi
=20
+	if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
+		conf_firmware=3D"firmware =3D \"${UBOOT_FIT_CONF_FIRMWARE}\";"
+	fi
+
 	cat << EOF >> ${UBOOT_ITS}
     };
=20
@@ -439,6 +448,7 @@ EOF
         default =3D "conf";
         conf {
             description =3D "Boot with signed U-Boot FIT";
+            ${conf_firmware}
             loadables =3D ${conf_loadables};
             fdt =3D "fdt";
         };
--=20
2.43.0


