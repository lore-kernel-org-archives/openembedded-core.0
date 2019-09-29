Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6A16D6C129
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 20:14:02 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id v24so7286522ljj.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EfgnZG5lcLvxGsfNSJrzBZbYCFX0RcV0RA99JJv03Po=;
	b=Y4czygZiHbkemTJwV/ADrb13mUKE0WBbm2QeI1e5kqL+kfM0fyf58KZ1t+vVvt6FTl
	lsJKi7zCuoOOrifzDuprdQByx5xK+7uXFfUJTIY47RNFAKYUbkadkVxnxm5qjpB6uJfQ
	2SHDE6c4bLF5htCx/r1mgMIe4/ln7poMQrOeSVnLOv7JfQ3Xiwp9qsks7cLVA4szVTLj
	pgCda+i62PMgCTk+L/iN54wcEdHKHUIAErFMxPAnD1ygvQEa1svRs0XM1qxep+lBKjf1
	1iO/VzPHv8N9/Gi9GRh1zcbm2QEeqAMUbuYx96izg3o+JqyEUG5CV/mid488MofijJrZ
	sAYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EfgnZG5lcLvxGsfNSJrzBZbYCFX0RcV0RA99JJv03Po=;
	b=dKeJ3LCj9x2bYyjgcHYSSzbZXrUNYSczCUKwkZTvLRJl0IUzA/hgc0OrUYCCRbcLMd
	T6GSvC7hBqN4Lu8JUxAMv6tMBsIRl8Fo5fGi7KZgJLkvmWU678by+3BxJ4y3YMMoFEsQ
	cM99q1rZyndJSfTJzo5OzpGqlB0dKGaRj90KZe1VETiJbayka6Xa2VdEGuODPUK+XQiw
	vmuopCTs0E8v8DXYknIA/fxAz+4T3bIy4LS+KdatzWVRnjvarKEt8UoiMxclK8bAZDCM
	FF0n36HOvokmB98a7pXr/OwQlwFu0MTOyJVabWKb6iZBMHH5uUzQ19kK+XGQE26Cx72P
	XgkQ==
X-Gm-Message-State: APjAAAWT/Xjdld5KqinkTs7jNkpSPV6EUbPBmf4B6opVIFUi7d+uuekP
	AHxWB1LhLS/a5dnr5mIQNcTPm8Hb
X-Google-Smtp-Source: APXvYqxUr0ux1c0zAiqGLV2h+6POOtF27vjtiXeX3tUxrMlzkv5VNbm60GQv0UnH7m8dlbMoKeX9Sg==
X-Received: by 2002:a2e:b1ce:: with SMTP id e14mr10139068lja.135.1569788041987;
	Sun, 29 Sep 2019 13:14:01 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.87])
	by smtp.gmail.com with ESMTPSA id
	w77sm2414685lff.49.2019.09.29.13.14.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 13:14:00 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 23:13:55 +0300
Message-Id: <20190929201359.9837-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v2 1/5] grub-efi: replace anonymous function with static configuration
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
X-List-Received-Date: Sun, 29 Sep 2019 20:14:02 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Replace anonymous function setting GRUB_* variables with static
configuration, since grub-efi.bbclass will use fixed names for grub
bootloader.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 40 ++++++++++++--------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index b9d6225d2774..419f25c014b9 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -13,26 +13,22 @@ SRC_URI += " \
 
 S = "${WORKDIR}/grub-${PV}"
 
-# Determine the target arch for the grub modules
+GRUB_TARGET = "UNSUPPORTED"
+GRUB_TARGET_x86-64 = "x86_64"
+GRUB_TARGET_x86 = "i386"
+GRUB_TARGET_aarch64 = "arm64"
+GRUB_TARGET_arm = "arm"
+
+GRUB_IMAGE = "grub-efi-${EFI_BOOT_IMAGE}"
+
+# install to the image as boot*.efi if its the EFI_PROVIDER,
+# otherwise install as the full name.
+# This allows multiple bootloaders to coexist in a single image.
 python __anonymous () {
-    import re
-    target = d.getVar('TARGET_ARCH')
-    prefix = "" if d.getVar('EFI_PROVIDER') == "grub-efi" else "grub-efi-"
-    if target == "x86_64":
-        grubtarget = 'x86_64'
-    elif re.match('i.86', target):
-        grubtarget = 'i386'
-    elif re.match('aarch64', target):
-        grubtarget = 'arm64'
-    elif re.match('arm', target):
-        grubtarget = 'arm'
+    if d.getVar('EFI_PROVIDER') == "grub-efi":
+        d.setVar("GRUB_EFI_BOOT_IMAGE", d.getVar("EFI_BOOT_IMAGE"))
     else:
-        raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
-    grubimage = prefix + d.getVar("EFI_BOOT_IMAGE")
-    d.setVar("GRUB_TARGET", grubtarget)
-    d.setVar("GRUB_IMAGE", grubimage)
-    prefix = "grub-efi-" if prefix == "" else ""
-    d.setVar("GRUB_IMAGE_PREFIX", prefix)
+        d.setVar("GRUB_EFI_BOOT_IMAGE", d.getVar("GRUB_IMAGE"))
 }
 
 inherit deploy
@@ -45,7 +41,7 @@ do_mkimage() {
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
 	grub-mkimage -c ../cfg -p ${EFIDIR} -d ./grub-core/ \
-	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
+	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               ${GRUB_BUILDIN}
 }
 
@@ -57,7 +53,7 @@ do_mkimage_class-native() {
 
 do_install_append_class-target() {
 	install -d ${D}${EFI_FILES_PATH}
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_IMAGE}
+	install -m 644 ${B}/${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_EFI_BOOT_IMAGE}
 }
 
 do_install_class-native() {
@@ -86,7 +82,7 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 configfile search loadenv test"
 
 do_deploy() {
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
+	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
 do_deploy_class-native() {
@@ -97,7 +93,7 @@ addtask deploy after do_install before do_build
 
 FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
-               ${EFI_FILES_PATH}/${GRUB_IMAGE} \
+               ${EFI_FILES_PATH}/${GRUB_EFI_BOOT_IMAGE} \
                "
 
 FILES_${PN}_remove_aarch64 = "${libdir}/grub/${GRUB_TARGET}-efi"
-- 
2.23.0


