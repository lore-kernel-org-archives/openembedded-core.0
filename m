Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BED27758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:23:22 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n129so4378390wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d/UW/WUySZU7/cNLcnlneuzcFRJku7Dgk7XTG7FBdeA=;
	b=hqQ8x5ynF7/DB7mM/H8kBJfFs0xJIjQg5NchH4IR/cZ7bc7cbh/jYtcD/H4ok2RnA+
	K2tD2HZODewHx/DqWeW1gaVJ0zoIJJaUhopeB1a2X9cXSa1njt+82jq7TmfaSfEpivmE
	DZ597QqPF/bfTUvaqiqxKxUgRpCFg2cBo6Gy4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=d/UW/WUySZU7/cNLcnlneuzcFRJku7Dgk7XTG7FBdeA=;
	b=ZVIIaJZ74QVtlW6HrwWl10aFsFTJpwdc1wT+6mqnF6hRPz7mBHuYE/rVlz4+pWj3Pp
	mtu2ZMcDPNq+5taQDOealqTgotbPcmc+iNMB60u7HbD8FtnA5FNzoQafZdwtacirTcA7
	UoOw1Ey8J5pkqksq3bQE4Tl0VL0lfcFhzHLwQvvoIFWwsAdv4grGvHHHv/1Y+kgNMxme
	ET0xDS3THmDV4/XZaaMXkFFgdn8t60b7lJkmCcKsqEdwgfkF+mGpjLw/BSik5v8l+eVI
	oULsEzcwfF8lyNQtFWYmyNyuQiH/2byRhSIoJlLoa4Z20YnXn/3cVuL5gVco3MqZ6eRu
	d5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=d/UW/WUySZU7/cNLcnlneuzcFRJku7Dgk7XTG7FBdeA=;
	b=grjnKOCTAUqpnzt6JLAOQH031qneBlRVMNUoof5cBtdViwxmO+C1s0zCvNdza11vMe
	YxKweqN0O6KceUa9xeQCSlkfvvJzP3el2Rz79S2undChD0latiw/GdJqC2hJdnevuGQU
	I3zIvUm84OyxVpcNz4aAnXt2/CzRndvFSjndP8neqgmC/i+8QLpIHhrXRgg6XcYxayQ+
	xI6r1cRmoa6JH1wseqq+l2YTgbX9MuufUobNOAjlKgzctOw3BQZcOEfJFbAlwX8XLdQL
	97CWqhs7+KSQwa4VzTqPlCmvGwB0EdBKTDQOTAL5ApgEqwN2Qb919O1OUhKS63frhSkK
	h52w==
X-Gm-Message-State: AOPr4FVcJr8ty+buKGUSyzjRmbmqX7HtlhZfwaSKzH+6aAZJkdr1Rpai3TChCAlU68Bsyg==
X-Received: by 10.194.26.41 with SMTP id i9mr10726329wjg.114.1461767003383;
	Wed, 27 Apr 2016 07:23:23 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	kq9sm4313514wjc.26.2016.04.27.07.23.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 07:23:22 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:20:53 +0200
Message-Id: <1461766856-27881-2-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [PATCH v3 1/4] u-boot: basic support of dtb append for verified boot
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
X-List-Received-Date: Wed, 27 Apr 2016 14:23:26 -0000

This introduces a new uboot-sign.class to support U-Boot verified boot.

This part delivers the new class file, with related environment variables, and
a new task intended to run before do_install task and which performs the
concatenation of the u-boot-nodtb.bin and the device tree blob. The 'cat'
command used overrides the u-boot.bin in both DEPLOYDIR & build dir to
propagate the changes in later tasks (do_install, do_package, etc.)

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/uboot-sign.bbclass    | 67 ++++++++++++++++++++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot.inc |  2 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/classes/uboot-sign.bbclass

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
new file mode 100644
index 0000000..ad84c44
--- /dev/null
+++ b/meta/classes/uboot-sign.bbclass
@@ -0,0 +1,67 @@
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
+# The tasks sequence is set as below, using DEPLOY_IMAGE_DIR as common place to
+# treat the device tree blob:
+#
+#   u-boot:do_deploy_dtb
+#   u-boot:do_deploy
+#   virtual/kernel:do_assemble_fitimage
+#   u-boot:do_concat_dtb
+#   u-boot:do_install
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
+do_concat_dtb () {
+	# Concatenate U-Boot w/o DTB & DTB with public key
+	# (cf. kernel-fitimage.bbclass for more details)
+	cd ${DEPLOYDIR}
+	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
+		if [ -e "${UBOOT_NODTB_IMAGE}" -a -e "${UBOOT_DTB_IMAGE}" ]; then
+			cat ${UBOOT_NODTB_IMAGE} ${UBOOT_DTB_IMAGE} | tee ${B}/${UBOOT_BINARY} > ${UBOOT_IMAGE}
+		else
+			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
+		fi
+	fi
+}
+
+python () {
+	uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+	if d.getVar('UBOOT_SIGN_ENABLE', True) == '1' and d.getVar('PN', True) == uboot_pn:
+		kernel_pn = d.getVar('PREFERRED_PROVIDER_virtual/kernel', True)
+
+		# do_concat_dtb is scheduled _before_ do_install as it overwrite the
+		# u-boot.bin in both DEPLOYDIR and DEPLOY_IMAGE_DIR.
+		bb.build.addtask('do_concat_dtb', 'do_install', None, d)
+		d.appendVarFlag('do_concat_dtb', 'depends', ' %s:do_assemble_fitimage' % kernel_pn)
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


