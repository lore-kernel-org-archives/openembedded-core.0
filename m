Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 50F6176A51
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 15:48:56 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so19362210wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=POtDjZx5RA2tjQvVseAyNcqkmlVM1Fa3UHQMbow3/+4=;
	b=QE219cP/fBPeezYkj7N96NExByPuMrPfQCpCm/FFPv0OEJqrQnZQnWUcVDSb/IRTtu
	LxF3noSX/L5049ewC0leUKNtBh3lUUC2ltw/SbSDHXYQcp5fJazodTNVWzfk6kiyCSM6
	E9iRK3ExEp6DBej5RVMy526C8KFs1UNJJjzfJfB6ct8isycllenEn1NX8iTAcItOmknB
	Gml4WFmWi46rE7fjSCQbu+dE1LFHRv0T0IX9bEDB1cxd82coEqqLCmJrvArUdIOOF78f
	aZXRYJV4Fd5ivCx42GD6KJeMem1HA5CNMmS8/EOXZfuZWPy7v53HyJCmsEWdH+wMHiSK
	EheA==
X-Gm-Message-State: ALoCoQnY2N9MKDOBXUEVTpN8xTKphbq8RTDYaoGWkg49qVqxW3JKhVWY+3bMCEEvSu8Pj98xrCsC
X-Received: by 10.180.11.176 with SMTP id r16mr13272836wib.87.1440604136586;
	Wed, 26 Aug 2015 08:48:56 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	ir5sm4457290wjb.23.2015.08.26.08.48.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Aug 2015 08:48:56 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 16:48:29 +0100
Message-Id: <1440604110-4306-3-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
References: <1440604110-4306-1-git-send-email-nicolas.dechesne@linaro.org>
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [RFC PATCH 2/2] image_types.bbclass: add support for fastboot image type
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
X-List-Received-Date: Wed, 26 Aug 2015 15:48:59 -0000

Fastboot images are images that can be flashed using the fastboot protocol
implemented in many popular bootloader for SBCs or even real world products
(such as Android phones and tablets).

This image type was implemented in meta-smartphone, and is being moved in
oe-core.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/classes/image_types.bbclass | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8547574..4c53dc9 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -156,6 +156,19 @@ IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_
 
 EXTRA_IMAGECMD = ""
 
+FASTBOOT_PARTITION_SIZE ?= "16384"
+
+IMAGE_CMD_ext4.fastboot () {
+	if [ ${ROOTFS_SIZE} -lt ${FASTBOOT_PARTITION_SIZE} ]; then
+		make_ext4fs -l `expr ${FASTBOOT_PARTITION_SIZE} \* 1024` \
+			${EXTRA_IMAGECMD} \
+			${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ext4.fastboot \
+			${IMAGE_ROOTFS}
+	else
+		bbfatal "Rootfs is too small for partition (Rootfs Actual Size: ${ROOTFS_SIZE}, Partition size: ${FASTBOOT_PARTITION_SIZE})"
+	fi
+}
+
 inherit siteinfo
 JFFS2_ENDIANNESS ?= "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
@@ -167,6 +180,7 @@ EXTRA_IMAGECMD_ext3 ?= "-i 4096"
 EXTRA_IMAGECMD_ext4 ?= "-i 4096"
 EXTRA_IMAGECMD_btrfs ?= ""
 EXTRA_IMAGECMD_elf ?= ""
+EXTRA_IMAGECMD_ext4.fastboot ?= "-s -b 4096"
 
 IMAGE_DEPENDS = ""
 IMAGE_DEPENDS_jffs2 = "mtd-utils-native"
@@ -182,6 +196,7 @@ IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
 IMAGE_DEPENDS_multiubi = "mtd-utils-native"
+IMAGE_DEPENDS_ext4.fastboot = "android-tools-native"
 
 # This variable is available to request which values are suitable for IMAGE_FSTYPES
 IMAGE_TYPES = " \
@@ -201,6 +216,7 @@ IMAGE_TYPES = " \
     vdi \
     qcow2 \
     elf \
+    ext4.fastboot \
 "
 
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
-- 
2.3.5


