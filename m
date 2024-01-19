Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7B7C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 06:19:55 +0000 (UTC)
Received: from TWMBX01.aspeed.com (TWMBX01.aspeed.com [211.20.114.70])
 by mx.groups.io with SMTP id smtpd.web10.16007.1705645185269314821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 22:19:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=fail (domain: aspeedtech.com, ip: 211.20.114.70, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.124) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 19 Jan
 2024 14:20:08 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jan 2024 14:19:44 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 4/4] uboot-sign: support to load optee-os and TFA images
Date: Fri, 19 Jan 2024 14:19:37 +0800
Message-ID: <20240119061937.1368163-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
References: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 06:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194013

Currently, u-boot FIT image only support to load u-boot image.
To support optee-os and trusted-firmware-a, update ITS file generation
scripts, so users are able to use u-boot FIT image to load
u-boot, optee-os and treustred-firmware-a images

Add a variable "UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A" to
enable trusted-firmware-a image and it is disable by default.

Add a variable "UBOOT_FIT_OPTEE_OS" to enable optee-os image
and it is disable by default.

The ITS file creation looks like as following.
1. Both optee-os and trusted-firmware-a are disabled.
'''
/dts-v1/;

/ {
    images {
        uboot {
        };
        fdt {
        };
    };

    configurations {
        default =3D "conf";
        conf {
            loadables =3D "uboot";
            fdt =3D "fdt";
        };
    };
};
'''

2. Only enable optee-os
'''
/dts-v1/;

/ {
    images {
        uboot {
        };
        fdt {
        };
        optee {
        };
    };

    configurations {
        default =3D "conf";
        conf {
            firmware =3D "optee";
            loadables =3D "uboot";
            fdt =3D "fdt";
        };
    };
};
'''

3. Both optee-os and trusted-firmware-a are enabled
'''
/dts-v1/;

/ {
    images {
        uboot {
        };
        fdt {
        };
        atf {
        };
        optee {
        };
    };

    configurations {
        default =3D "conf";
        conf {
            firmware =3D "atf";
            loadables =3D "uboot", "optee";
            fdt =3D "fdt";
        };
    };
};
'''

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 meta/classes-recipe/uboot-sign.bbclass | 91 +++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 7a0b8047e4..d2b1013b93 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -91,6 +91,18 @@ KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
 UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
=20
+# Trusted Firmware-A (TF-A) provides a reference implementation of
+# secure world software for Armv7-A and Armv8-A,
+# including a Secure Monitor executing at Exception Level 3 (EL3)
+# ATF is used as the initial start code on ARMv8-A cores for all K3 platfo=
rms
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A ?=3D "0"
+UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE ?=3D "bl31.bin"
+
+# OP-TEE is a Trusted Execution Environment (TEE) designed as
+# companion to a non-secure Linux kernel running on Arm
+UBOOT_FIT_OPTEE_OS ?=3D "0"
+UBOOT_FIT_OPTEE_OS_IMAGE ?=3D "tee-raw.bin"
+
 python() {
     # We need u-boot-tools-native if we're creating a U-Boot fitImage
     sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1'
@@ -237,6 +249,20 @@ addtask uboot_generate_rsa_keys before do_uboot_assemb=
le_fitimage after do_compi
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
+	conf_loadables=3D"\"uboot\""
+	conf_firmware=3D""
+
+	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" =3D "1" ]; then
+		conf_firmware=3D"\"atf\""
+		if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ]; then
+			conf_loadables=3D"\"uboot\", \"optee\""
+		fi
+	else
+		if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ]; then
+			conf_firmware=3D"\"optee\""
+		fi
+	fi
+
 	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
=20
 	# First we create the ITS script
@@ -289,13 +315,76 @@ EOF
=20
 	cat << EOF >> ${UBOOT_ITS}
         };
+EOF
+	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A}" =3D "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+        atf {
+            description =3D "ARM Trusted Firmware-A";
+            data =3D /incbin/("${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_IMAGE}")=
;
+            type =3D "firmware";
+            arch =3D "${UBOOT_ARCH}";
+            os =3D "arm-trusted-firmware";
+            load =3D <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_LOADADDRESS}>;
+            entry =3D <${UBOOT_FIT_ARM_TRUSTED_FIRMWARE_A_ENTRYPOINT}>;
+            compression =3D "none";
+EOF
+
+		if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
+			cat << EOF >> ${UBOOT_ITS}
+            signature {
+                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
+            };
+EOF
+		fi
+
+	cat << EOF >> ${UBOOT_ITS}
+        };
+EOF
+	fi
+
+	if [ "${UBOOT_FIT_OPTEE_OS}" =3D "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+        optee {
+            description =3D "OPTEE OS Image";
+            data =3D /incbin/("${UBOOT_FIT_OPTEE_OS_IMAGE}");
+            type =3D "tee";
+            arch =3D "${UBOOT_ARCH}";
+            os =3D "tee";
+            load =3D <${UBOOT_FIT_OPTEE_OS_LOADADDRESS}>;
+            entry =3D <${UBOOT_FIT_OPTEE_OS_ENTRYPOINT}>;
+            compression =3D "none";
+EOF
+
+		if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
+			cat << EOF >> ${UBOOT_ITS}
+            signature {
+                algo =3D "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint =3D "${SPL_SIGN_KEYNAME}";
+            };
+EOF
+		fi
+
+	cat << EOF >> ${UBOOT_ITS}
+        };
+EOF
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
     };
=20
     configurations {
         default =3D "conf";
         conf {
             description =3D "Boot with signed U-Boot FIT";
-            loadables =3D "uboot";
+EOF
+	if [ -n "${conf_firmware}" ]; then
+	cat << EOF >> ${UBOOT_ITS}
+            firmware =3D ${conf_firmware};
+EOF
+	fi
+	cat << EOF >> ${UBOOT_ITS}
+            loadables =3D ${conf_loadables};
             fdt =3D "fdt";
         };
     };
--=20
2.25.1


