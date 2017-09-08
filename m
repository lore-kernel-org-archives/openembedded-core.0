Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3E98778190
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:43:41 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id r66so1386451qke.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=mgbY/Ctmz9G63qtfoWYi+ldEpkIeXv5/ocZJl9acRaw=;
	b=pmFAe2m/ce5OFpsT589blFpCMztOOw3xi3cVPa3IbMvXBCfh8/FH1JgerW0J95y/1K
	+ToFJGOZtHJ3S84HdEkJQyw+Nm3sM9PXaucxg58idW6Bt0HPkHqzM2+E5Bf0Z3Tvmd4e
	MvqoZUZoGKGAJQZlOkLZpKVgl46vYQz/ebLex7wHpQlSIKOEp6FM13k4s7aCHc7cgeUR
	aIutOYadxEhip/uwf2dG8CK3+gMJtWPeSipV6HCOVPRPPQVE0fwLIGmk6X4qa67Zci4q
	Sw6mfQhfbjMMVA5W2jfC6zuxIf3OeCmmCS/cM1W/uUKMoYPNgorpl8OmahOH1sRHJ8Lm
	m1Ww==
X-Gm-Message-State: AHPjjUh5g93ND2uAC/8MagA7HjEzY6o93CaLZuLZnFg07/EERc+5aB/w
	fWQiFUTwsSWo/wGw
X-Google-Smtp-Source: AOwi7QB+QuR0RdhqvHNN6KyS62wD+olKLln0jqvXefsq5DFxh5esNCY0d/ft/ZEz7uwX+EqKgdEkKg==
X-Received: by 10.55.16.75 with SMTP id a72mr4008698qkh.146.1504878222124;
	Fri, 08 Sep 2017 06:43:42 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id z1sm1268587qtz.87.2017.09.08.06.43.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:43:41 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:43:32 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:43:29 -0300
Message-Id: <20170908134331.6695-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v6 1/3] kernel: Stop using update-alternatives
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
X-List-Received-Date: Fri, 08 Sep 2017 13:43:42 -0000

The update-alternatives where using relative links so not being really
in use since December 2016 (see OE-Core:c7bc46b9 "kernel: Fix
symlinks") so instead we now generate the relative symlinks during the
do_install task and drop the update-alternatives use at all.

Acked-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- Fix symlink on deploy directory

Changes in v3: None
Changes in v2: None

 meta/classes/kernel.bbclass             | 16 +++------------
 meta/recipes-kernel/linux/linux-dtb.inc | 36 +++++----------------------------
 2 files changed, 8 insertions(+), 44 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3cc0432fcf..02a5e961cb 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -2,7 +2,7 @@ inherit linux-kernel-base kernel-module-split
 
 PROVIDES += "virtual/kernel"
 DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
-PACKAGE_WRITE_DEPS += "depmodwrapper-cross virtual/update-alternatives-native"
+PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
 
 do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
 
@@ -57,7 +57,7 @@ python __anonymous () {
 
         d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
 
-        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
+        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}' + ' /' + imagedest + '/' + type)
 
         d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
 
@@ -65,13 +65,6 @@ python __anonymous () {
 
         d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
 
-        priority = d.getVar('KERNEL_PRIORITY')
-        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
-        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
-
-        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
-        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
-
     image = d.getVar('INITRAMFS_IMAGE')
     if image:
         d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
@@ -137,10 +130,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 export KBUILD_BUILD_USER = "oe-user"
 export KBUILD_BUILD_HOST = "oe-host"
 
-KERNEL_PRIORITY ?= "${@int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
-                       int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[1]) * 100 + \
-                       int(d.getVar('PV').split('-')[0].split('+')[0].split('.')[-1])}"
-
 KERNEL_RELEASE ?= "${KERNEL_VERSION}"
 
 # The directory where built kernel lies in the kernel tree
@@ -350,6 +339,7 @@ kernel_do_install() {
 	install -d ${D}/boot
 	for type in ${KERNEL_IMAGETYPES} ; do
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${type} ${D}/${KERNEL_IMAGEDEST}/${type}-${KERNEL_VERSION}
+		ln -sf ${type}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${type}
 	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 0174c80d85..ca92822d25 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,7 +1,5 @@
 # Support for device tree generation
-FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
-
-PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
+FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/*.dtb /${KERNEL_IMAGEDEST}/*.dtbo"
 
 python __anonymous () {
     d.appendVar("PACKAGES", " kernel-devicetree")
@@ -36,12 +34,13 @@ do_install_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
 		DTB_EXT=${DTB##*.}
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
+		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT}
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-			install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
+			ln -sf ${DTB_BASE_NAME}.${DTB_EXT} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
 		done
 	done
 }
@@ -60,32 +59,7 @@ do_deploy_append() {
 			install -d ${DEPLOYDIR}
 			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
 			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
-		done
-	done
-}
-
-pkg_postinst_kernel-devicetree () {
-	cd /${KERNEL_IMAGEDEST}
-	for DTB in ${KERNEL_DEVICETREE}; do
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			DTB_EXT=${DTB##*.}
-			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
-			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
-		done
-	done
-}
-
-pkg_postrm_kernel-devicetree () {
-	cd /${KERNEL_IMAGEDEST}
-	for DTB in ${KERNEL_DEVICETREE}; do
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			DTB_EXT=${DTB##*.}
-			DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
-			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
+			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_BASE_NAME}.${DTB_EXT}
 		done
 	done
 }
-- 
2.14.1


