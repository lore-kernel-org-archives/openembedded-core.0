Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EDCCA789EE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 22:07:45 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id p11-v6so242684wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2018 15:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eg163b/muc/It65lWLyjgJaDh+ISkgYk8kN9hRdQCV8=;
	b=iNVjAjptwbuz8ONisxMNHWZMn/R1nvG1YZnm0HCYld4xiQhOxNDKeLqefBwyKRcMZR
	d9H4PaSuia/pzq/1I8rx4e3azQwCyFsdtAuKY8UFJDN2mqKNo4xP9k+KUzykjRXATvxs
	rDzMbgKNkRFOEoBy9Ce5EbWIRGcLTYOPPmBgEI7fpM9+nRGbwJqMXzohOnUkYy/7cOhu
	W5590QL+s89aArOiDzcOwdEDG2UBFLsBolIIYiBblO6kmC2pFocFpQVQtaPN2kM7jTkE
	8o7vQ+4SpycfLLdrbZOfl2vQbphOEamQvmOHCOMOSYVk8vnJNDs3sYR1ypkJBRsxhXe+
	gQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eg163b/muc/It65lWLyjgJaDh+ISkgYk8kN9hRdQCV8=;
	b=dZA9A7hPiIUciV/NOaPS2x2ELRgRH1smRGOd4MmgjFCTuuKhcssQOwM9PO1PRJHbcu
	ASuiatSpzii3/jq7ChAdb2M3nE+3SsjbxlwvkgD4CS03znq5w4xTOTb0J2HTjQhFwfT7
	yX+CRxQ89GXC/QHKvoJ9EaOLwybF2HMk9bIo53sd3/zVWa3NB6M5rNflJdCydL9f7o+q
	NpWQUK7jLjyQ03Yw0asOO3TqqjMen59g4Z8kUYrHfsSUW/MKG1vaiETYV5jGMxnXnA8n
	vFzgvf/1o/cEue9N8g1HfqXyRPQVtNbw7sTb5u9PPcZ4ZVB/jbppQ4rAUL36XuOA0+cc
	Pasw==
X-Gm-Message-State: APt69E3eDdY45n8zGdibC3OdO7hFCf6zeSHLvaibprbgknIuIkt0Wkq+
	11wJ9VtD0xBkWv/7nZTiVKi2BA==
X-Google-Smtp-Source: AAOMgpeVp9LFcm6zSyH49hTSoOuaEe9cWHfESak+zweRHE2XNfdA52qXdS16XOgW4vxL7DqG+kkxTw==
X-Received: by 2002:a1c:b49:: with SMTP id 70-v6mr8613638wml.5.1530569266378; 
	Mon, 02 Jul 2018 15:07:46 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c7-v6sm19028926wre.73.2018.07.02.15.07.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Jul 2018 15:07:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2018 22:07:42 +0000
Message-Id: <20180702220744.10881-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180702220744.10881-1-Martin.Jansa@gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180702220744.10881-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2 2/4] kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
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
X-List-Received-Date: Mon, 02 Jul 2018 22:07:46 -0000

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
 meta/classes/kernel-devicetree.bbclass | 47 ++++++++------------------
 meta/classes/kernel.bbclass            |  3 ++
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index 10441475e8..9c5e125981 100644
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
index 3213b932bf..7ce64fd19f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -663,6 +663,9 @@ KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}-${DATETIME}"
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
2.17.1


