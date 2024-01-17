Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA0DC47077
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 02:11:04 +0000 (UTC)
Received: from TWMBX02.aspeed.com (TWMBX02.aspeed.com [211.20.114.72])
 by mx.groups.io with SMTP id smtpd.web10.2653.1705457457185077908
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jan 2024 18:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: aspeedtech.com, ip: 211.20.114.72, mailfrom: jamin_lin@aspeedtech.com)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 17 Jan
 2024 10:10:54 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Jan 2024 10:10:54 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v1] uboot-sign: support to load optee-os and TFA images
Date: Wed, 17 Jan 2024 10:10:51 +0800
Message-ID: <20240117021051.2102450-1-jamin_lin@aspeedtech.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 02:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193883

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

3: Both optee-os and trusted-firmware-a are enabled
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
index ad04c82378..b874eb84db 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -88,6 +88,18 @@ UBOOT_FIT_ADDRESS_CELLS ?=3D "1"
 # This is only necessary for determining the signing configuration
 KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
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
@@ -230,6 +242,20 @@ addtask uboot_generate_rsa_keys before do_uboot_assemb=
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
@@ -282,13 +308,76 @@ EOF
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


