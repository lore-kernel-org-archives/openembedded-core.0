Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DD41E73163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:51:31 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id e201so10794884wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VEVkJAAVGfnQ1hzifhlp35Sy5D1/bglNrlcWPGBfvvE=;
	b=eQmqApwNIyba4aSopYpJt7nDK1iBJ/RhJP1P32qTnNO8FP6SMukq8e2nvWFtijCYdp
	XU71pzKDIUXgATZzQ30w5DanDCn2cyyXLuAN5rQp0w9n9kfV23kdOrVi3K6tQ9eTCzvM
	kmYRVzrVX2AEqyAlrKSy/eTr/3O16pgJfZofQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VEVkJAAVGfnQ1hzifhlp35Sy5D1/bglNrlcWPGBfvvE=;
	b=SRQZN0MsKTp0CFp7FHPXq4MuGmXvpRR/QT4XyyUkxYp67SMwCG3EadGyajC8x35snf
	aDFv3BELLOcxpfTDVZoL5/fFs4AHuyrrEcbStaIMd3KHcVOsbra6+hH1XrENKrhtmFbv
	Lg3sbfVtpjXU5aizDxCqWsbbxMe40x9+Pa/30hWuEpoamKWJRLpqiuD2sMbkQhqRJFKc
	zZ5U57+pIB/7rMpzo9t3enK83j2h75eG3GW2n/8F37Lw3fB1a1dLE79eKBIYKloxwr1X
	7mNbsSRB/d0lgoEtFqLx8PIy67Ft0xU/1tVW92jMb9Qi/UTKil/pNASvmPxzvqnovoV6
	++VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=VEVkJAAVGfnQ1hzifhlp35Sy5D1/bglNrlcWPGBfvvE=;
	b=VYt+6TjwPHnGNf4DCZ1crMvukzsF2QgouxXR4ij2NNG6+4Iqcd4q9WX7jfmL9XbOdO
	FsMZT4ZQ6YQE8ghfq9pebH61X0bz2DFuW86ZGVsyxVXoMDHM5hnQ2sQY8wtf12DS/LRZ
	6Fs6SuP7PcBT6HrvQ1lRx+gc5e36TiFYx5h9SdYnTWvcXyIGyFxeXwyU4Sy9C7vSytvt
	ydNuiDMCHOQraPIFkGjjZZVzCSQzCG2faswV4S4UM640Nl/IJ3db4r9+kz3X5zZG22mx
	soDF4sKEgqzxfUqVJvFln3fWFJScB+01r6ELEqVrSi1NRFpgjQzFWzaeLbl4kiVYySrI
	kpCA==
X-Gm-Message-State: AOPr4FUQ9kaiBRm9A46jAJVn7e9IEL+18hIvINCl5JA7n0LOJhSfRF9TJWfBJkFzOjhl1Q==
X-Received: by 10.194.230.97 with SMTP id sx1mr10328812wjc.0.1461160291672;
	Wed, 20 Apr 2016 06:51:31 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id w3sm5770581wjt.0.2016.04.20.06.51.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 06:51:31 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 15:50:36 +0200
Message-Id: <1461160239-7799-2-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC][PATCH v2 1/4] u-boot: basic support of dtb append for verified boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Apr 2016 13:51:32 -0000

This introduces a new uboot-sign.class to support U-Boot verified boot.

This part delivers the new class file, with related environment variables, and
a basic prepend to do_install task which performs the concatenation of the
u-boot-nodtb.bin and the device tree blob. The 'cat' command used
overrides the u-boot.bin in both DEPLOYDIR & build dir to propagate the
changes in later tasks (do_install, do_package, etc.)

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/uboot-sign.bbclass    | 59 ++++++++++++++++++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc |  2 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/uboot-sign.bbclass

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
new file mode 100644
index 0000000..63a5181
--- /dev/null
+++ b/meta/classes/uboot-sign.bbclass
@@ -0,0 +1,59 @@
+# This file is part of U-Boot verified boot support and is intended to be
+# inherited from u-boot recipe and from kernel-fitimage.bbclass.
+#
+# The signature procedure requires the user to generate an RSA key and
+# certificate in a directory and to define the following variable:
+#
+#   UBOOT_SIGN_KEYDIR = "/keys/directory"
+#   UBOOT_SIGN_KEYNAME = "dev" # keys name in keydir (eg. "dev.crt", "dev.key")
+#   UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+#   UBOOT_SIGN_ENABLE = "1"
+#
+# As verified boot depends on fitImage generation, following is also required:
+#
+#   KERNEL_CLASSES ?= " kernel-fitimage "
+#   KERNEL_IMAGETYPE ?= "fitImage"
+#
+# The signature support is limited to the use of CONFIG_OF_SEPARATE in U-Boot.
+#
+# The tasks sequence is as below, using DEPLOY_IMAGE_DIR as common place to
+# treat the device tree blob:
+#
+# u-boot:do_deploy -> virtual/kernel:do_assemble_fitimage -> u-boot:do_install
+#
+# For more details on signature process, please refer to U-boot documentation.
+
+# Signature activation.
+UBOOT_SIGN_ENABLE ?= "0"
+
+# Default value for deployment filenames.
+UBOOT_DTB_IMAGE ?= "u-boot-${MACHINE}-${PV}-${PR}.dtb"
+UBOOT_DTB_BINARY ?= "u-boot.dtb"
+UBOOT_DTB_SYMLINK ?= "u-boot-${MACHINE}.dtb"
+UBOOT_NODTB_IMAGE ?= "u-boot-nodtb-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_NODTB_BINARY ?= "u-boot-nodtb.${UBOOT_SUFFIX}"
+UBOOT_NODTB_SYMLINK ?= "u-boot-nodtb-${MACHINE}.${UBOOT_SUFFIX}"
+
+#
+# Following is relevant only for u-boot recipes:
+#
+
+do_install_prepend_pn-u-boot () {
+	# Concatenate U-Boot w/o DTB & DTB with public key
+	# (cf. kernel-fitimage.bbclass for more details)
+	cd ${DEPLOYDIR}
+	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
+		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
+			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${UBOOT_IMAGE}
+			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} > ${B}/${UBOOT_BINARY}
+		else
+			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+		fi
+	fi
+}
+
+python () {
+	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == 'u-boot':
+		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
+		d.appendVarFlag('do_install', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
+}
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 3ba866d..037f35c 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -12,7 +12,7 @@ S = "${WORKDIR}/git"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit uboot-config deploy
+inherit uboot-config uboot-sign deploy
 
 EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=1'
 EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
-- 
1.9.1


