Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A991088E5C
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 23:31:15 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28202.1773876673988802525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 16:31:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=RGOttPym;
 dkim=pass header.i=@valla.it header.s=default header.b=iUyrdHLo;
 spf=pass (domain: valla.it, ip: 185.56.87.9, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	 b=BHNp/0rbcJ+by3TsTuNOKe0WQR/67xi+m+97jT5cuMZ5ogfLmIkO2Kw/cPszEl4cT20wswnYOW
	  bcJHvm6Psi0XcoWCKqf9ho7MPIlplw76G+gwfu93jMqbEjoXGq6Uy8998SDnq8ERv9CF/UTRBA
	  EH4z7T3MnppQyepD8h54sGMRYUWdrcftSccxEvWbB6sKNKQBsHfwunGooOIIBC+8i13IMggRRQ
	  DuDS15J+EL11yqKkMmKhOneWQZgSnP0x+e9ATksi/JfS3R4oJY+ozvG0nQQ06DIUBQegYvfpc/
	  jQeH/JI2a3ducFTwlLr7SX1Qgn3I2CWqetFq863zTG39sg==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com; s=arckey; t=1773876674;
	bh=ufKnjS6Nrw6tfuZfwT5mLqvpNhC8fqraIzVx4+SAFjA=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=tnmL20sc5n8ZBC2P8kygjhH069QwwqT1Dz5G7q0o82lUunoxTCcO1Kn6v9kANdbNqleCtzHZ7s
	  6DbQh0+tmTMWDRI2lu3lVIC/NSt0iUaWiK/I0e2Wmbk9cptMSyNd1Oi1nfKdVcYYQZdJZQDboy
	  k1Zuber5VPvpvB1XW9qGAaXveJcGaq7a2Pc1td/r9N3r7ZM2MthtB+nmvV54QEW742ghA1bjqi
	  wEQ97HJjjcQEA4KEpwikhWN+8ZBIn8xnFRY7CWLQcoi/+p08FglLKEJ/iNnmmiig0rHPBAaBMS
	  fsCdLZCpwbTWFO85zLB8qeWz7owQSNheHbuFZHk7sv7O1g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=Pc+tnRJ83ZyDrF5FXkdsoQ0oH7VketqCKMCDjLknofE=; b=RGOttPym2ZUAjhWeP6FYhtH7Do
	TmKqI997gR5yG5nWAmREDtxLcourD0ko7Pt4Lxkg9pn6YBbmRw7/IZIAjE765F0k/L7mu7EsD6ZBt
	1PT3XFnvLngdnk5WCYrUw3ZuNcLVcAMcerLeTwA4BtAoiudQYDacmF6S331Ta9fD7TIw=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Lx-00000000hVV-3Bzy
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Mar 2026 23:31:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Pc+tnRJ83ZyDrF5FXkdsoQ0oH7VketqCKMCDjLknofE=; b=iUyrdHLohIWB0KC9batsrrV130
	AbYkhtExg8RWvwHED9z3RtKJTEd3lK/q69skryjJszWxtXIww5t3Z5EZ0KuWeRqo1CoFEFOzSlOit
	dRV+ZtEYqXdrNjmBvG8RuA1gkb2n3J1RLwZVQQ/d5ryFHkKmqUTRm8EU/Z/JByqTq/YU=;
Received: from [82.57.88.19] (port=60381 helo=[192.168.178.43])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w30Lr-00000000OEU-3sn4;
	Wed, 18 Mar 2026 23:30:59 +0000
From: Francesco Valla <francesco@valla.it>
Date: Thu, 19 Mar 2026 00:30:50 +0100
Subject: [PATCH RFC 2/4] image_types: add bootconfig conversion type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-bootconfig-v1-2-a4d467c3f0ba@valla.it>
References: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
In-Reply-To: <20260319-bootconfig-v1-0-a4d467c3f0ba@valla.it>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>, 
 Francesco Castagnotto <fcastagnotto@linux.com>, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4249; i=francesco@valla.it;
 h=from:subject:message-id; bh=ufKnjS6Nrw6tfuZfwT5mLqvpNhC8fqraIzVx4+SAFjA=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJm7TTdVr7u2fX1UbUi1ypL+nydSn32J3dLlXszu7X9UN
 rXgp8eqjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAiUyYxMvx4Xn0v17mXp8Jg
 NfdtFmuxacuExQ1Tkj/v8Heeq73h4SeG/64Wu+e8tjQI4l+RIseSu+VQ1tnSDcs/SlXFlWm2Tf5
 ezQAA
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
X-SGantispam-id: e38abe9fad07af3a65c519cbc7e149c7
X-AntiAbuse: ID - e38abe9fad07af3a65c519cbc7e149c7
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w30Lx-00000000hVV-3Bzy-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-jxsh.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 23:31:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233450

Add the addition of a bootconfig block at the end of an image as a
conversion type; while a bootconfig is mostly used in conjuntion with an
initramfs (i.e.: a cpio image or one of its compressed forms), having it
as a generic conversion type simplifies the implemntation and is ready
for future modifications at kernel side.

The following configurations variables are introduced (in a separate
bbclass, for further usage by other components):

  - BOOTCONFIG_SRC: source file to be used as bootconfig, to be found
    inside DEPLOY_DIR_IMAGE;
  - BOOTCONFIG_TASK: task deploying the bootconfig source file specified
    in BOOTCONFIG_SRC to DEPLOY_DIR_IMAGE; an image using the bootconfig
    modifier will depend on it.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 meta/classes-recipe/bootconfig-config.bbclass | 12 ++++++++++++
 meta/classes-recipe/image_types.bbclass       | 15 +++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/bootconfig-config.bbclass b/meta/classes-recipe/bootconfig-config.bbclass
new file mode 100644
index 0000000000000000000000000000000000000000..3d34fc47a3a684aef1ecdbd5ed52c904611bf95d
--- /dev/null
+++ b/meta/classes-recipe/bootconfig-config.bbclass
@@ -0,0 +1,12 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+# Name of the file to be used as bootconfig source, to be found inside DEPLOY_DIR_IMAGE
+BOOTCONFIG_SRC ?= ""
+
+# Task deploying the bootconfig source to DEPLOY_DIR_IMAGE
+#  e.g.: BOOTCONFIG_TASK = "bootconfig-debug:do_deploy"
+BOOTCONFIG_TASK ?= ""
diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/image_types.bbclass
index e6ef0ce11e40c0f8388fb5547ab03943004bde2f..98c6d9e836f5c80f78e6f6f32aa923de66feb836 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -264,9 +264,18 @@ IMAGE_CMD:f2fs () {
 	sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}.f2fs
 }
 
+oe_bootconfig() {
+	local src_image=$1
+	if [ -z "${BOOTCONFIG_SRC}" ]; then
+		bbfatal "bootconfig image type requested but BOOTCONFIG_SRC is not set"
+	fi
+	cp ${src_image} ${src_image}.bootconfig
+	bootconfig -a ${DEPLOY_DIR_IMAGE}/${BOOTCONFIG_SRC} ${src_image}.bootconfig
+}
+
 EXTRA_IMAGECMD = ""
 
-inherit siteinfo kernel-arch image-artifact-names
+inherit siteinfo kernel-arch image-artifact-names bootconfig-config
 
 JFFS2_ENDIANNESS ?= "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
@@ -333,7 +342,7 @@ IMAGE_TYPES:append:x86-64 = " hddimg iso"
 # CONVERSION_CMD/DEPENDS.
 COMPRESSIONTYPES ?= ""
 
-CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync ${COMPRESSIONTYPES}"
+CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip 7zip zst sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum bmap u-boot vmdk vhd vhdx vdi qcow2 base64 gzsync zsync bootconfig ${COMPRESSIONTYPES}"
 CONVERSION_CMD:lzma = "lzma -k -f -7 ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:gz = "gzip -f -9 -n -c --rsyncable ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.gz"
 CONVERSION_CMD:bz2 = "pbzip2 -f -k ${IMAGE_NAME}.${type}"
@@ -360,6 +369,7 @@ CONVERSION_CMD:qcow2 = "qemu-img convert -O qcow2 ${IMAGE_NAME}.${type} ${IMAGE_
 CONVERSION_CMD:base64 = "base64 ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.${type}.base64"
 CONVERSION_CMD:zsync = "zsyncmake_curl ${IMAGE_NAME}.${type}"
 CONVERSION_CMD:gzsync = "zsyncmake_curl -z ${IMAGE_NAME}.${type}"
+CONVERSION_CMD:bootconfig = "oe_bootconfig ${IMAGE_NAME}.${type}"
 CONVERSION_DEPENDS_lzma = "xz-native"
 CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
@@ -380,6 +390,7 @@ CONVERSION_DEPENDS_vhdx = "qemu-system-native"
 CONVERSION_DEPENDS_vhd = "qemu-system-native"
 CONVERSION_DEPENDS_zsync = "zsync-curl-native"
 CONVERSION_DEPENDS_gzsync = "zsync-curl-native"
+CONVERSION_DEPENDS_bootconfig = "bootconfig-native ${BOOTCONFIG_TASK}"
 
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"

-- 
2.53.0


