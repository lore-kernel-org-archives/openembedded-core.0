Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D45FC7869D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 20:11:21 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v186so21108370wma.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0ppeWVZtlKj4OXmLyv+iiXA0210Y+avs8B842lNMYn0=;
	b=vZgRbgD1TgDkc7AKh532+qFqhXT++HIZ4XmPRgMgjME35VNmZpLLQJhzB1kGshHll6
	oTndpBc+MDgZxeFElIfGOqwhRDREvhCgFyL5dWdyoK35iYubbVyWd7O3r2+6zInQRX5z
	4jDM5lc6ooXWgBIZjqltdrhoVRetg5A1kvxbSo4dgliMje4EdfE5Lf03TmDjIRQxfSkz
	59cqnEuj13VAgP0vk/kgdS2wc7LeSGNnGeO30f0XKxEiOAwtwNM70h2ZJXo9XER9rWtN
	qRD8E1vLITDfD050lFs6nKCNvGq+asqxe0QES3AxDJWYf77wfvgbUqPFSIFQgSs+24Ka
	IpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0ppeWVZtlKj4OXmLyv+iiXA0210Y+avs8B842lNMYn0=;
	b=YERWB36B0abF425i2nXWL9zYdxbZex2oBM5PM+eTYDvF0NoA9+QC7XrdY0bnLZedVE
	wWC8A48zZX5yJfglgt3+f4dWjufRBZwYS+0RRbv2UDz6Pmw70MnzGVHT/Res4ue+r134
	jYt8dHstiYDrRxf4UZwdcRQ/EVvQ1eVVvt4dc1E/WSrsdFtFoIqLh3KBcnTYHYmOhEsT
	asEMy8UeeBK2mqqoQbePvdf3UHUEzVHCsg2AM37LqqEupS3M74pAgJH7EGh7UDUP4pyV
	fdQcxjE3q/evMV1wn+vTSwYumdZqiea9fVP/tBesGachbHKodUO/vN1EYmVAipVTEyvv
	fRdg==
X-Gm-Message-State: AJaThX6HPNa4+tcTnmmsNqvQsr1v3kOf7ubeIl1TOHKJOJ+QYBDQ7/ny
	LlO8LDNFHBJoEJIMb7Rj4hUuHw==
X-Google-Smtp-Source: AGs4zMZcQ0gE7FVB0nlVc05/BUynAlfQf9J/6Kkp7XG8OO7nW4x/b183S9gTqlfg9OJoEvSB1oXLjQ==
X-Received: by 10.28.105.14 with SMTP id e14mr4205516wmc.74.1511208682191;
	Mon, 20 Nov 2017 12:11:22 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 2sm9494959wre.17.2017.11.20.12.11.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Nov 2017 12:11:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 20:11:01 +0000
Message-Id: <5bd9692f89f156af3ca64c0b9745b8776b88fee8.1511207344.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1511207344.git.Martin.Jansa@gmail.com>
References: <cover.1511207344.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 2/5] kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
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
X-List-Received-Date: Mon, 20 Nov 2017 20:11:22 -0000

* add 2 new variables:
  KERNEL_DTB_BASE_NAME
  KERNEL_DTB_SYMLINK_NAME
  instead of reusing KERNEL_IMAGE_SYMLINK_NAME and than expecting that
  default value ${MACHINE} was being used in e.g.:
  DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`

* install normal DTB files only once even if there is multiple entries
  in KERNEL_IMAGETYPE_FOR_MAKE and don't prefix them with the type of
  the kernel image, use the KERNEL_IMAGETYPE_FOR_MAKE as a prefix only
  when installing them bundled with kernel or initramfs image.

* deploy the files from ${D}/${KERNEL_IMAGEDEST}/ instead of kernel
  build directory, so that we don't need to call
  DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
  again in do_deploy

* create all links in do_deploy task, because default KERNEL_DTB_BASE_NAME
  like KERNEL_IMAGE_BASE_NAME contains PKGR and PKGR is different in
  do_install and do_deploy, because kernel.bbclass calls
  meta/classes/kernel.bbclass:do_install[prefuncs] += "package_get_auto_pr"
  meta/classes/kernel.bbclass:do_deploy[prefuncs] += "package_get_auto_pr"

* the filenames are a bit different, but with separate variable it
  should be easier for other bbclasses which use these DTB files to
  find them correctly, just use either the cannonical name
  $dtb_base_name.$dtb_ext or $dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext
  because PKGR (and other PKG* variables) might be different in your
  task and kernel.do_deploy task.

* fix DTB files being deployed with incorrect filenames when
  KERNEL_IMAGE_SYMLINK_NAME isn't set to ${MACHINE}, e.g. instead of
  the default:
-rw-r--r-- 2 bitbake bitbake 1.4K Nov 20 07:41 deploy/images/raspberrypi3-64/Image-1-4.9.59+git0+e7976b2aff-r0.2-lirc-rpi-20171120043031.dtbo
lrwxrwxrwx 2 bitbake bitbake   64 Nov 20 07:41 deploy/images/raspberrypi3-64/Image-lirc-rpi.dtbo -> Image-1-4.9.59+git0+e7976b2aff-r0.2-lirc-rpi-20171120043031.dtbo
lrwxrwxrwx 2 bitbake bitbake   64 Nov 20 07:41 deploy/images/raspberrypi3-64/lirc-rpi.dtbo -> Image-1-4.9.59+git0+e7976b2aff-r0.2-lirc-rpi-20171120043031.dtbo
  I was getting:
-rw-r--r-- 2 bitbake bitbake 1348 Nov 20 10:28 deploy/images/raspberrypi3-64/Image-linux-raspberrypi-lirc-rpi.dtbo
lrwxrwxrwx 2 bitbake bitbake   37 Nov 20 10:28 deploy/images/raspberrypi3-64/Image-linux-raspberrypi-lirc-rpi-master-20171120102653.dtbo -> Image-linux-raspberrypi-lirc-rpi.dtbo
lrwxrwxrwx 2 bitbake bitbake   37 Nov 20 10:28 deploy/images/raspberrypi3-64/lirc-rpi.dtbo -> Image-linux-raspberrypi-lirc-rpi.dtbo
  and e.g. sdcard_image-rpi.bbclass from meta-raspberrypi:
  https://github.com/agherzan/meta-raspberrypi/blob/37e4e18f4a745ce8dc11f7e40a29da0859ff13c6/classes/sdcard_image-rpi.bbclass
  was failing in:
  mcopy -i ${WORKDIR}/boot.img -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${DTB_BASE_NAME}.dtb ::${DTB_BASE_NAME}.dtb
  because ${KERNEL_IMAGETYPE}-${DTB_BASE_NAME}.dtb doesn't exist in my
  build, due to
  DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
  not replacing whole "${KERNEL_IMAGE_SYMLINK_NAME}" (read ${MACHINE})
  with just ${DTB_BASE_NAME}

* with this change applied the deploy dir looks like this:
-rw-r--r-- 2 bitbake bitbake 1.4K Nov 20 15:49 deploy/images/raspberrypi3-64/lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8-raspberrypi3-64-20171120154716.dtbo
lrwxrwxrwx 2 bitbake bitbake   74 Nov 20 15:49 deploy/images/raspberrypi3-64/lirc-rpi.dtbo -> lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8-raspberrypi3-64-20171120154716.dtbo
lrwxrwxrwx 2 bitbake bitbake   74 Nov 20 15:49 deploy/images/raspberrypi3-64/lirc-rpi-raspberrypi3-64.dtbo -> lirc-rpi-1-4.9.59+git0+e7976b2aff-r0.8-raspberrypi3-64-20171120154716.dtbo
  and works correctly even with DISTRO using different naming scheme

* the sdcard_image-rpi.bbclass still needs to be modified, I've provided
  updated version here:
  https://github.com/agherzan/meta-raspberrypi/pull/159

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 47 +++++++++++-----------------------
 meta/classes/kernel.bbclass            |  3 +++
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 3dca652..de12f26 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -60,20 +60,9 @@ do_install_append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_ext=${dtb##*.}
+		dtb_base_name=`basename $dtb .$dtb_ext`
 		dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-		dtb_base_name=`basename $dtb ."$dtb_ext"`
 		install -m 0644 $dtb_path ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext
-		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			dtb_symlink_name=`echo ${symlink_name} | sed "s/${MACHINE}/$dtb_base_name/g"`
-			ln -sf $dtb_base_name.$dtb_ext ${D}/${KERNEL_IMAGEDEST}/devicetree-$dtb_symlink_name.$dtb_ext
-
-			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
-				cat ${D}/${KERNEL_IMAGEDEST}/$type \
-					${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext \
-					> ${D}/${KERNEL_IMAGEDEST}/$type-$dtb_base_name.$dtb_ext.bin
-			fi
-		done
 	done
 }
 
@@ -81,30 +70,24 @@ do_deploy_append() {
 	for dtbf in ${KERNEL_DEVICETREE}; do
 		dtb=`normalize_dtb "$dtbf"`
 		dtb_ext=${dtb##*.}
-		dtb_base_name=`basename $dtb ."$dtb_ext"`
+		dtb_base_name=`basename $dtb .$dtb_ext`
+		install -d ${DEPLOYDIR}
+		install -m 0644 ${D}/${KERNEL_IMAGEDEST}/$dtb_base_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
+		ln -sf $dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
+		ln -sf $dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext ${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
-			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
-			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
-			dtb_name=`echo ${base_name} | sed "s/${MACHINE}/$dtb_base_name/g"`
-			dtb_symlink_name=`echo ${symlink_name} | sed "s/${MACHINE}/$dtb_base_name/g"`
-			dtb_path=`get_real_dtb_path_in_kernel "$dtb"`
-			install -d ${DEPLOYDIR}
-			install -m 0644 $dtb_path ${DEPLOYDIR}/$dtb_name.$dtb_ext
-			ln -sf $dtb_name.$dtb_ext ${DEPLOYDIR}/$dtb_symlink_name.$dtb_ext
-			ln -sf $dtb_name.$dtb_ext ${DEPLOYDIR}/$dtb_base_name.$dtb_ext
-
 			if [ "$type" = "zImage" ] && [ "${KERNEL_DEVICETREE_BUNDLE}" = "1" ]; then
-				cat ${DEPLOYDIR}/$type \
-					${DEPLOYDIR}/$dtb_name.$dtb_ext \
-					> ${DEPLOYDIR}/$dtb_name.$dtb_ext.bin
-				ln -sf $dtb_name.$dtb_ext.bin ${DEPLOYDIR}/$type-$dtb_base_name.$dtb_ext.bin
-
+				cat ${D}/${KERNEL_IMAGEDEST}/$type \
+					${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext \
+					> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin
+				ln -sf $type-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin \
+					${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
-						${DEPLOYDIR}/$dtb_name.$dtb_ext \
-						> ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name.$dtb_ext.bin
-					ln -sf ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name.$dtb_ext.bin \
-					       ${DEPLOYDIR}/${type}-initramfs-$dtb_base_name.$dtb_ext-${MACHINE}.bin
+						${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext
+						>  ${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin
+					ln -sf ${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_BASE_NAME}.$dtb_ext.bin \
+						${DEPLOYDIR}/${type}-${INITRAMFS_BASE_NAME}-$dtb_base_name-${KERNEL_DTB_SYMLINK_NAME}.$dtb_ext.bin
 				fi
 			fi
 		done
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 756707a..8752af7 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -618,6 +618,9 @@ KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 # Don't include the DATETIME variable in the sstate package signatures
 KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 KERNEL_IMAGE_SYMLINK_NAME ?= "${MACHINE}"
+KERNEL_DTB_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
+KERNEL_DTB_BASE_NAME[vardepsexclude] = "DATETIME"
+KERNEL_DTB_SYMLINK_NAME ?= "${MACHINE}"
 MODULE_IMAGE_BASE_NAME ?= "modules-${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
 MODULE_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
 MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
-- 
2.7.4


