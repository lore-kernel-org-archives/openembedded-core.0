Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 943EA78ABD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 07:59:30 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id t6-v6so4314509wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 00:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9H9r3Hi2kXJoby0FjiGh92aDDRAombyvSyAFmZLB29s=;
	b=U9C8O3rnEpSvSoSyb/Jum5Akyqn7iUKdCaOD4yfvIqh+lSeANA7YOvdiONMjN8xa82
	S0Z9ZtqBEnZdD5bMwGFprxrYWNEHK1Y0qm19BzbUq824oz9RlkM0zj1kEmaCzZB4btG0
	PejNlsjON4C6iPMsUO9+F3ugU418m9RWid2MrADzKNy36s1MQA4vhKwnlbwvj++oP9tc
	vBkBX4SDRgTGr+0pru+q3uUvRyZ/wni6FhORRXdkn54DJEIyLIxTIAjS2k6BnAPy38dc
	XHy+HRMj0l1Kt+0B8iqsaR1PFTq4q87ZfdFc96sPHZYn70nXlsF+W8jM+r5+MoYus3Vd
	qYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9H9r3Hi2kXJoby0FjiGh92aDDRAombyvSyAFmZLB29s=;
	b=ggIT1+g8IdioUzhRjxmQbPTUfvyR2Ntb6Wp/kpLuGaIyaGN7QiFgf1W9HGXhaXdnUJ
	mQ5AoX/F3rC8EdJEtUebGAjpzZSOsAIV1/ceK6kWxznXXMQiB4QFUcE+AeAGTAEQOmZ0
	GYMkOegHudavKAQSzgfBSH+Z9E8NiZQ8RezTZk5MX4YF/zVQrdCwPxIKWbFDhIoQl2ZM
	MaK9DpACJIu0NfuRzJi03YSY7O6aXVIHd37XqL/rPPey2fJ9UyGt+0UqT0oVK4hcn1bk
	AuMC6J52yZBpJgZtin0FiiIYqZAh6kLd/RrgwKkE+SwOsOtwbMF8uqb9wAA6aZ01lP2Q
	CSJw==
X-Gm-Message-State: APt69E03If8pDQp5xKmrq3PsrKwyp0aYCB9r9VEZ/RSPB5stkwLJ8nuu
	zmmznw6HJ+r3Sjvy1uarmZ1ulw==
X-Google-Smtp-Source: AAOMgpfvtCyg0fBnW2CE4peu/HcJlGC2vOdmJif3qM6gNaEEVYnC6gWYYBkVApz67pO/dClzs+g7Ww==
X-Received: by 2002:a5d:6401:: with SMTP id z1-v6mr750542wru.64.1530691171096; 
	Wed, 04 Jul 2018 00:59:31 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l17-v6sm5183420wrh.45.2018.07.04.00.59.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Jul 2018 00:59:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 07:59:22 +0000
Message-Id: <20180704075924.24065-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180704075924.24065-1-Martin.Jansa@gmail.com>
References: <CA+chaQd9otpzozM5DrifBUVdODogBsVdy2U8czAAd+Ys_6TBtA@mail.gmail.com>
	<20180704075924.24065-1-Martin.Jansa@gmail.com>
Subject: [PATCHv3 2/4] kernel-devicetree.bbclass: Fix and simplify instalation of DTB files
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
X-List-Received-Date: Wed, 04 Jul 2018 07:59:30 -0000

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
index 5d38d3760d..7faa869493 100644
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


