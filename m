Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id AE23D61222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 15:37:26 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id l109so2318429yhq.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=PFOyMIz5YIe/sYG9ANrzB1hd3CbarbaQROSlllz9irE=;
	b=ELBkOld8Tuxb+XLzfv3pGToOHxJ33tDDbrJVy+5EFncvQP3mW3jy7FTZ3CJPVh2ChL
	jzWWmUBQ46AdNIkdn3Yb5E4I0y/1bWhB2LqR/2N1Y9qyxnixEJX5MBkZoYpGUyJd1saR
	DosRQyJlNSkj2XTqhpLIrlmQXQ8n3Qcu0xYkFPdDXSBMuCMCcgqhja0lEUPlEWJIj4Aw
	TwafETo8VWAjl2MvMrb7Y2APnGypKrXK+VTQJiCwMt8vr22w5Z/WUauy7cVw09g5azAP
	Q35mVlMpSqyXb8UQxVweIGzWNQCxqfj/Tq4eCRz4/QRDe4DFrie/UEaCaV25ypGqijOw
	8mXQ==
X-Received: by 10.236.22.193 with SMTP id t41mr8947178yht.248.1376321846746;
	Mon, 12 Aug 2013 08:37:26 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id n28sm9179128yhm.4.2013.08.12.08.37.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 08:37:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Aug 2013 12:37:09 -0300
Message-Id: <1376321829-30658-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	Lauren Post <lauren.post@freescale.com>
Subject: [PATCH] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Mon, 12 Aug 2013 15:37:28 -0000

As the Linux kernel, unconditionally, builds the dtc application and
it is the compatible version with the DeviceTree files shipped within
the kernel it is better to use it and the kernel build system to
generate the dtb files.

Some DeviceTree files rely on CPP and kernel headers to be able to
generate the dtb binary contents and it is harder to replicate it
outside of Linux kernel build system so we /use/ it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
NOTE: This depends on 'linux-dtb.inc: Replace /boot/ with /${KERNEL_IMAGEDEST}/' patch

 meta/recipes-kernel/linux/linux-dtb.inc | 59 +++++++++++++++------------------
 1 file changed, 27 insertions(+), 32 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 41dd599..a65f8bd 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -1,44 +1,39 @@
 # Support for device tree generation
 FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
-KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
 
 python __anonymous () {
-    devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
-    if devicetree:
-        depends = d.getVar("DEPENDS", True)
-        d.setVar("DEPENDS", "%s dtc-native" % depends)
-        packages = d.getVar("PACKAGES", True)
-        d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
+    d.appendVar("PACKAGES", " kernel-devicetree")
 }
 
 do_install_append() {
+	bbwarn "ARRG"
 	if test -n "${KERNEL_DEVICETREE}"; then
-		for DTS_FILE in ${KERNEL_DEVICETREE}; do
-			if [ ! -f ${DTS_FILE} ]; then
-				echo "Warning: ${DTS_FILE} is not available!"
-				continue
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} points to the full path dts file while it should have the target for use."
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
-			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-			dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
-			install -m 0644 ${DTS_BASE_NAME} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+			DTB_BASE_NAME=`basename ${DTB} .dtb`
+			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			oe_runmake ${DTB}
+			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
 		done
 	fi
 }
 
 do_deploy_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
-		for DTS_FILE in ${KERNEL_DEVICETREE}; do
-			if [ ! -f ${DTS_FILE} ]; then
-				echo "Warning: ${DTS_FILE} is not available!"
-				continue
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} points to the full path dts file while it should have the target for use. "
+				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
-			DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+			DTB_BASE_NAME=`basename ${DTB} .dtb`
+			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 			install -d ${DEPLOYDIR}
-			install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
+			install -m 0644 ${B}/arch/${ARCH}/boot/${DTB} ${DEPLOYDIR}/${DTB_NAME}.dtb
 			cd ${DEPLOYDIR}
 			ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
 			cd -
@@ -48,20 +43,20 @@ do_deploy_append() {
 
 pkg_postinst_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
-	for DTS_FILE in ${KERNEL_DEVICETREE}
+	for DTB_FILE in ${KERNEL_DEVICETREE}
 	do
-		DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
 }
 
 pkg_postrm_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
-	for DTS_FILE in ${KERNEL_DEVICETREE}
+	for DTB_FILE in ${KERNEL_DEVICETREE}
 	do
-		DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
-		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
-		update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
 }
-- 
1.8.4.rc1


