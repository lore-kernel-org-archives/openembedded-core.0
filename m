Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id B453D78438
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 21:34:44 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id l65so666423qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 14:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=IKmaMqtBKrab8KZ28FhNH4WZwIAFn8IQKPd42ySRfX8=;
	b=XceZObGqwRBGwQkNMUe3kfFn+CS3yEjGRp6ek04OZyjfH+IiaaAwIyG8C6iaOuM94Z
	ME7s62jhl1okoMetifZGuPdu3i99Po2oAaJsPHy4/KqpkuqfWbRfCeHvZV3vE/7R5Xn4
	ShRCce5fA3Nf2SchCezKyr0pKrMawPF8vFtWcLTVbQRW280xR29wVxgMRgrm79YekqRI
	hDusABZZUqjQr2IfavOqWDUk6SHg5zT4BS8vGrv+A2phOSQShLyzxao8zZbPZCrKCzfC
	BjeMsGIh+5jXJH1871LBdjJ9vpThuIVYZNkGYKigHc93bd9jyi3IiS6I6V7tkn7vVr8t
	8G2Q==
X-Gm-Message-State: AHYfb5i/8KkjrvSWmEa6/HdLI8xdpYk9eLlf4p5N94LG+u9txrEJydqe
	h6Wl7ceAf6g5gfxo
X-Google-Smtp-Source: ADKCNb62iPWpJwx5AFmZVA97zp2L9nifgZJUAKVqOtn6PoIUVykqRyg5XKfAojDpHPxH3uMunxTrkQ==
X-Received: by 10.55.180.199 with SMTP id d190mr5951441qkf.87.1504215285143;
	Thu, 31 Aug 2017 14:34:45 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e126sm5900177qkd.80.2017.08.31.14.34.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 31 Aug 2017 14:34:44 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 31 Aug 2017 18:34:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Aug 2017 18:34:35 -0300
Message-Id: <20170831213435.16487-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] kernel: Stop using update-alternatives
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
X-List-Received-Date: Thu, 31 Aug 2017 21:34:45 -0000

The update-alternatives where using relative links so not being really
in use since December 2016 (see OE-Core:c7bc46b9 "kernel: Fix
symlinks") so instead we now generate the relative symlinks during the
do_install task and drop the update-alternatives use at all.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/kernel.bbclass             | 16 +++------------
 meta/recipes-kernel/linux/linux-dtb.inc | 36 ++++-----------------------------
 2 files changed, 7 insertions(+), 45 deletions(-)

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
index 0174c80d85..6e6f39e640 100644
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
@@ -59,33 +58,6 @@ do_deploy_append() {
 			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 			install -d ${DEPLOYDIR}
 			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
-			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
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
 		done
 	done
 }
-- 
2.14.1


