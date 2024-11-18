Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB9BD6DDF9
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
Subject: [PATCH v4 1/3] uboot-sign: support to create TEE and ATF image tree source
Date: Mon, 18 Nov 2024 14:32:31 +0800
Message-ID: <20241118063233.698679-2-jamin_lin@aspeedtech.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207204

Currently, uboot-sign.bbclass only supports to create Image Tree Source(ITS=
)
for "u-boot" and "flat_dt". However, users may want to support multiple ima=
ges
such as  ARM Trusted Firmware(ATF), Trusted Execution Environment(TEE) and
users private images for specific application and purpose.

To make this bbclass more flexible and support ATF and TEE, creates new
functions which are "uboot_fitimage_atf" and "uboot_fitimage_tee"
for ATF and TEE ITS file creation, respectively.

Add a variable "UBOOT_FIT_ARM_TRUSTED_FIRMWARE" to
enable ATF ITS generation and it is disable by default.

Add a variable "UBOOT_FIT_TEE" to enable TEE ITS generation
and it is disable by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 80 +++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index a17be745ce..f1b3470127 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -88,6 +88,18 @@ UBOOT_FIT_ADDRESS_CELLS ?=3D "1"
 # This is only necessary for determining the signing configuration
 KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
=20
+# ARM Trusted Firmware(ATF) is a reference implementation of secure world
+# software for Arm A-Profile architectures, (Armv8-A and Armv7-A), includi=
ng
+# an Exception Level 3 (EL3) Secure Monitor.
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE ?=3D "0"
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE ?=3D "bl31.bin"
+
+# A Trusted Execution Environment(TEE) is an environment for executing cod=
e,
+# in which those executing the code can have high levels of trust in the a=
sset
+# management of that surrounding environment.
+UBOOT_FIT_TEE ?=3D "0"
+UBOOT_FIT_TEE_IMAGE ?=3D "tee-raw.bin"
+
 UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
=20
@@ -234,9 +246,64 @@ do_uboot_generate_rsa_keys() {
=20
 addtask uboot_generate_rsa_keys before do_uboot_assemble_fitimage after do=
_compile
=20
+# Create a ITS file for the atf
+uboot_fitimage_atf() {
+	cat << EOF >> ${UBOOT_ITS}
+        atf {
+            description =3D "ARM Trusted Firmware";
+            data =3D /incbin/("${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_IMAGE}");
+            type =3D "firmware";
+            arch =3D "${UBOOT_ARCH}";
+            os =3D "arm-trusted-firmware";
+            load =3D <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS}>;
+            entry =3D <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT}>;
+            compression =3D "none";
+EOF
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            signature {
+                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
+            };
+EOF
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
+        };
+EOF
+}
+
+# Create a ITS file for the tee
+uboot_fitimage_tee() {
+	cat << EOF >> ${UBOOT_ITS}
+        tee {
+            description =3D "Trusted Execution Environment";
+            data =3D /incbin/("${UBOOT_FIT_TEE_IMAGE}");
+            type =3D "tee";
+            arch =3D "${UBOOT_ARCH}";
+            os =3D "tee";
+            load =3D <${UBOOT_FIT_TEE_LOADADDRESS}>;
+            entry =3D <${UBOOT_FIT_TEE_ENTRYPOINT}>;
+            compression =3D "none";
+EOF
+	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            signature {
+                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
+            };
+EOF
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
+        };
+EOF
+}
+
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
+	conf_loadables=3D"\"uboot\""
 	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
=20
 	# First we create the ITS script
@@ -289,13 +356,24 @@ EOF
=20
 	cat << EOF >> ${UBOOT_ITS}
         };
+EOF
+	if [ "${UBOOT_FIT_TEE}" =3D "1" ] ; then
+		conf_loadables=3D"\"tee\", ${conf_loadables}"
+		uboot_fitimage_tee
+	fi
+
+	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE}" =3D "1" ] ; then
+		conf_loadables=3D"\"atf\", ${conf_loadables}"
+		uboot_fitimage_atf
+	fi
+	cat << EOF >> ${UBOOT_ITS}
     };
=20
     configurations {
         default =3D "conf";
         conf {
             description =3D "Boot with signed U-Boot FIT";
-            loadables =3D "uboot";
+            loadables =3D ${conf_loadables};
             fdt =3D "fdt";
         };
     };
--=20
2.25.1


