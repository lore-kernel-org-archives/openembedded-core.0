Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0A21377E4A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:28:31 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id p55so2286513qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=PV0k6yyk0vN9X6DIMZdM4Mo7indrwPzxoTrLnO5M4WE=;
	b=nT8iUp+k3G2Mvpk2qEqmudXUg9gMRKBwc38CDyCncw+VzyAquIuurn6dGdF5rPJ0hg
	uP6bdtOR6hB/zuzMgwsylpyDibjt5eszznXeA7iyoXXXzgoqKWL5ZbXS1+EJwnB+u0M/
	tAfFf48rWgRMHl2l4P5P4BglBDsUSH3yl80twhmzhXy5UGB5lhWqmmY/IuohyiE3RJXY
	zz8lVBF0Yfh8JutHUP5Aj9IdVGGNl7jwdp88PpE6h6XOVh7IbDkQbUSogfC3w2pCDj6w
	E1+D9wn8TM8F65OAX85ZkAwuTn1wsE68Sk9gD2rBsPUrBwLM/ZNsEW40gffHHbn7atZu
	ChDw==
X-Gm-Message-State: AHPjjUg9jOaShAeS9+Jfmw5mKPUtStRRZybj9/dIH6OHZ4zi2Vqcx+gu
	lpONJC2cvhRmt13i
X-Google-Smtp-Source: ADKCNb73jRszXyWIW+adOumNC+aD16u3CedXlipVbbbiRbpPDNELjjApgX1yeoKFbqHK3iNaSx/pYQ==
X-Received: by 10.200.50.218 with SMTP id a26mr5535288qtb.211.1504621712398;
	Tue, 05 Sep 2017 07:28:32 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id r130sm484020qke.9.2017.09.05.07.28.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:28:31 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:28:22 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:28:20 -0300
Message-Id: <20170905142822.17693-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 1/3] kernel: Stop using update-alternatives
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
X-List-Received-Date: Tue, 05 Sep 2017 14:28:32 -0000

The update-alternatives where using relative links so not being really
in use since December 2016 (see OE-Core:c7bc46b9 "kernel: Fix
symlinks") so instead we now generate the relative symlinks during the
do_install task and drop the update-alternatives use at all.

Acked-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


