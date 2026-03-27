Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2081C10F2853
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 16:49:48 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77240.1774630178850148027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 09:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=swtbtPdn;
 dkim=pass header.i=@valla.it header.s=default header.b=eWXBDSOU;
 spf=pass (domain: valla.it, ip: 185.56.87.6, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-1d9v.prod.antispam.mailspamprotection.com; s=arckey; t=1774630179;
	 b=IzocybYCUCvoF2pZ8ZeeACjqtOoaw+hL3/VgPU+8Awo55U8Hftt7M3p79NhHWvsqbDWw++FiNd
	  wWC47Raid2NFqHojqoA4EH5U859rhEFrIQ6RR/k6a0JQXTD41fNrnnpWRqZTOdADQlhqreNJ3W
	  uROyAsqtbVUybbiAFOaNxU6wj/iOIVthpnyhjFSltDtNyy6gO3maDskdXSifnLMUSHfAZ4meYZ
	  GhTNIqQ/ViKP93mB0Rhqhj96fF21At+L+QeJqYSYct5qIg420orZXbEyXSolciitXrOF3UqwZP
	  8a9B/QhlsXMmsk0H9D8K6AIqwhYLy3gYS5X/oRR+bDnPiQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-1d9v.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-1d9v.prod.antispam.mailspamprotection.com; s=arckey; t=1774630179;
	bh=95+gSABo5RJ3gmWsf04dAGel55k71jsoXIAS39JtEAM=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=IcC6X0fDZC+ecX2msP62XQCgcgIu11BRJqkWy7jDBwZLbfvbMWAPwJBx5URb8mj4kWvVmU+PTt
	  mWbmU94OAjSFdinPx04/FFzExdUVfFVm4ejzSqi6rj43jS4W8vvX5cBJLxZ3ihvjpEpU9YkurG
	  HcDLNl9aMHSfbbmEo1Gr5bhbtaeS/GWi0lH/TbunVrvMZkaKxtbPGEnx2xCqJfpMNNx7/PiZ8z
	  DGOWjYDc971S2UmrtzFI/FCdxJGum1ZLGnJXIitflPjp/2Y+YiO9lC9WRUTC6BYaEt0oEwFIEH
	  u8jRjjGQ6fcFE6XrorgCOyz3+6vQ54md19T5smGzTHr5fw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=bAgOgMoA9i+FqB4LjqCr4CguDP3ATvhCc8SKTehJoYU=; b=swtbtPdnoxWLHwb0Q7YwSmqyTj
	rqZgqLR8Ayou8iv6l9BtzLSb6EPVxLMKSrhAiXnuUm5yD7io6l+6v4MWg985IXtzN0OS+p7TxsEaa
	7x1OOJrvYuOxi/xfL5hH/w0HfKXnle3SBodfnHlumSnETZ/9soH0ELGFM+lPUNyZ+yJM=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-1d9v.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w6ANK-000000094eS-3Rni
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Mar 2026 16:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=bAgOgMoA9i+FqB4LjqCr4CguDP3ATvhCc8SKTehJoYU=; b=eWXBDSOUTKJzsQRdMF3h0Wo2m9
	64+/6QZmzOAz4YAbpV/7o7aLOG6BkVBBi2BsZWp/pDMAljyA6WE6cUDrfbBl6jmL/MqnrHGTYIx5c
	yfZsTPeZaA0J/Qj/nYTwIDhTLKSEDvhM5cVbWCe8kwmjxHm+89YsdjpUmMqDpWeUkSIM=;
Received: from [95.248.129.24] (port=61428 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w6ANE-000000007CG-0iz2;
	Fri, 27 Mar 2026 16:49:28 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 27 Mar 2026 17:49:14 +0100
Subject: [PATCH RFC v2 2/4] image_types: add bootconfig conversion type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-bootconfig-v2-2-891975014056@valla.it>
References: <20260327-bootconfig-v2-0-891975014056@valla.it>
In-Reply-To: <20260327-bootconfig-v2-0-891975014056@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Bruce Ashfield <bruce.ashfield@gmail.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4549; i=francesco@valla.it;
 h=from:subject:message-id; bh=95+gSABo5RJ3gmWsf04dAGel55k71jsoXIAS39JtEAM=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJnHtoo1B/DcKdDq0L1l7PfaQcZmptbpnOMX5q21i1ZLu
 Zuzb9e9jlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAi0tMY/ldE2x6+GKK1PEh7
 8YPplm7zMwPF/l/66J9wRa/NbIvKXW+GPzxevIX7P32TMpT/3D/pudvblVPajgn+jbm6WrN099P
 mQHYA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 51478490fbed00cb7a111e743f78593b
X-AntiAbuse: ID - 51478490fbed00cb7a111e743f78593b
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w6ANK-000000094eS-3Rni-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-1d9v.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234098

Add the addition of a bootconfig block at the end of an image as a
conversion type; while a bootconfig is mostly used in conjuntion with an
initramfs (i.e.: a cpio image or one of its compressed forms), having it
as a generic conversion type simplifies the implemntation and is ready
for future modifications at kernel side.

The following configurations variables are introduced (in a separate
bbclass, for further usage by other components):

  - BOOTCONFIG_SOURCES: list of source files to be used as bootconfig,
    to be found inside DEPLOY_DIR_IMAGE;
  - BOOTCONFIG_TASKS: list of tasks deploying the bootconfig source
    files specified in BOOTCONFIG_SOURCES to DEPLOY_DIR_IMAGE; an image
    using the bootconfig modifier will depend on them.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/classes-recipe/bootconfig-config.bbclass | 12 ++++++++++++
 meta/classes-recipe/image_types.bbclass       | 28 +++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/bootconfig-config.bbclass b/meta/classes-recipe/bootconfig-config.bbclass
new file mode 100644
index 0000000000000000000000000000000000000000..79e6a915eefb28164cc414f65875b4386764ce5a
--- /dev/null
+++ b/meta/classes-recipe/bootconfig-config.bbclass
@@ -0,0 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Name of the file(s) to be used as bootconfig source, to be found inside DEPLOY_DIR_IMAGE
+BOOTCONFIG_SOURCES ?= ""
+
+# Task deploying the bootconfig source to DEPLOY_DIR_IMAGE
+#  e.g.: BOOTCONFIG_TASKS = "bootconfig-debug:do_deploy"
+BOOTCONFIG_TASKS ?= ""
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index e6ef0ce11e40c0f8388fb5547ab03943004bde2f..7d0120e6cd56c9a08fb3c2ac8ea6edb56602aa53 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -264,9 +264,31 @@ IMAGE_CMD:f2fs () {
 	sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
 }
 
+oe_bootconfig() {
+	local src_image=$1
+
+	if [ -z "${BOOTCONFIG_SOURCES}" ]; then
+		bbfatal "bootconfig image type requested but BOOTCONFIG_SOURCES is not set"
+	fi
+
+	cp ${src_image} ${src_image}.bootconfig
+
+	# Add bootconfig(s) to file
+	rm -f bootconfig.txt
+	for src in ${BOOTCONFIG_SOURCES}; do
+		cat ${DEPLOY_DIR_IMAGE}/${src} >> bootconfig.txt
+	done
+
+	bootconfig -a bootconfig.txt ${src_image}.bootconfig
+	rm bootconfig.txt
+
+	# Re-read bootconfig
+	bootconfig -l ${src_image}.bootconfig
+}
+
 EXTRA_IMAGECMD = ""
 
-inherit siteinfo kernel-arch image-artifact-names
+inherit siteinfo kernel-arch image-artifact-names bootconfig-config
 
 JFFS2_ENDIANNESS ?= "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
@@ -333,7 +355,7 @@ IMAGE_TYPES:append:x86-64 = " hddimg iso"
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""
 
-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync bootconfig ${COMPRESSIONTYPES}"
 CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.gz"
 CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}.${type}"
@@ -360,6 +382,7 @@ CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}.${type} ${IMAGE_
 CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.base64"
 CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}.${type}"
+CONVERSION_CMD:bootconfig = "oe_bootconfig ${IMAGE_NAME}.${type}"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
@@ -380,6 +403,7 @@ CONVERSION_DEPENDS_vhdx = "qemu-system-native"
 CONVERSION_DEPENDS_vhd = "qemu-system-native"
 CONVERSION_DEPENDS_zsync = "zsync-curl-native"
 CONVERSION_DEPENDS_gzsync = "zsync-curl-native"
+CONVERSION_DEPENDS_bootconfig = "linux-bootconfig-native ${BOOTCONFIG_TASKS}"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"

-- 
2.53.0


