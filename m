Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 72410607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 22:28:13 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ez1so5799760pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 15:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c41LovbTIENkwx/WuK6p+3cGaiFQmIaVUdHxInWPnNk=;
	b=q9/7MnSSrKsZMs9xc5yQMXvia81PUoi6c4PGIg7UHxJHHugdN7b12AwqJPHQmpPS/O
	a6oTMpyqgpiyOoFqneX/sWqzpML2sqVLART7PEgm+dkKfGH9s+N7uZuRCcr1Xus8TVyL
	ozRoLT6G9YMsysk8VQdImiswlsrdBf3jgTy4/xrwWgMQibkQDDvYOtgsYIIKyahiNaP7
	RC1uJXEK2JC/w7Iac/VpzB5Zr/QMfrIXHE4K6MOuY5u/7sqajRkzTawLyDBBfmjHcaU6
	myeWXvFoGkGr0iSdw6ZCgggOze4i2mbj6rtYovHb30HYSh95ziNUV1FlYvdCwlIQs6Vi
	vd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c41LovbTIENkwx/WuK6p+3cGaiFQmIaVUdHxInWPnNk=;
	b=IrI2C7p4SyosX3pecamBLbwKFi0i2UfdA7ruT1aOoI/SoiMwX87sh/1dCds8unc+PO
	Esp28j6eFfkf0WQKxjT/BIIcFJnRi8/4m4zkRT1u9EELZycLew0r0h7xWdbaCw7JA+Mn
	qoXd+phOCNJgipWGylekQVFQnFAVWi5ZZQq5uflhR3LU9fq+6aoufykxGhhArfKJJBtz
	VkeiYw+Uyu96spyhjqDmVLybDMP3bMu0zsv1Ek+TZ9hg91NfTk6wh+MNbgbTTLvNdPcU
	9YNaXjYGCWyZ35k7ywYCGwFebqK4g73xJSaNtcf0N++Mu2sf9ld8LyM4XCqzCM/OGpzL
	wCVQ==
X-Gm-Message-State: AEkoouv6rlfNDiZqriijtErg1W4jdLAvah5GRsyEuQyxxP7fihf0WPsCnNztuQE8ubfkoQ==
X-Received: by 10.66.229.9 with SMTP id sm9mr72451467pac.138.1469831294863;
	Fri, 29 Jul 2016 15:28:14 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	191sm27326626pfx.68.2016.07.29.15.28.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jul 2016 15:28:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2016 15:27:59 -0700
Message-Id: <20160729222801.9806-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH 1/3] linux-dtb.inc: Support for .dtbo files for dtb overlays
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
X-List-Received-Date: Fri, 29 Jul 2016 22:28:14 -0000

From: Herve Jourdain <herve.jourdain@neuf.fr>

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 74f5ef8..8528d64 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -33,12 +33,13 @@ do_compile_append() {
 do_install_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
-		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_EXT=${DTB##*.}
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
-			install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+			install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT}
 		done
 	done
 }
@@ -46,7 +47,8 @@ do_install_append() {
 do_deploy_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
-		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_EXT=${DTB##*.}
+		DTB_BASE_NAME=`basename ${DTB} ."${DTB_EXT}"`
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			base_name=${type}"-"${KERNEL_IMAGE_BASE_NAME}
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
@@ -54,8 +56,8 @@ do_deploy_append() {
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
-			ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
+			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.${DTB_EXT}
+			ln -sf ${DTB_NAME}.${DTB_EXT} ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.${DTB_EXT}
 		done
 	done
 }
@@ -65,9 +67,10 @@ pkg_postinst_kernel-devicetree () {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+			update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.${DTB_EXT} ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
@@ -77,9 +80,10 @@ pkg_postrm_kernel-devicetree () {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		for type in ${KERNEL_IMAGETYPE_FOR_MAKE}; do
 			symlink_name=${type}"-"${KERNEL_IMAGE_SYMLINK_NAME}
+			DTB_EXT=${DTB##*.}
 			DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
 			DTB_SYMLINK_NAME=`echo ${symlink_name} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			update-alternatives --remove ${DTB_BASE_NAME}.dtb /boot/devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+			update-alternatives --remove ${DTB_BASE_NAME}.${DTB_EXT} /boot/devicetree-${DTB_SYMLINK_NAME}.${DTB_EXT} ${KERNEL_PRIORITY} || true
 		done
 	done
 }
-- 
2.9.0


