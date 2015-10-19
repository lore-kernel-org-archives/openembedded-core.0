Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 80C5E770B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:17:39 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id B4319A00490
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:17:53 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101910173721-42261 ;
	Mon, 19 Oct 2015 10:17:37 +0200 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 10:15:39 +0200
Message-Id: <1445242541-41638-6-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 10:17:37,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 10:17:37,
	Serialize complete at 19.10.2015 10:17:37
Subject: [PATCH 5/7] linux-dtb.inc: explicit test for empty string not needed
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
X-List-Received-Date: Mon, 19 Oct 2015 08:17:42 -0000

The for loop already handles the case when KERNEL_DEVICETREE is empty.

Signed-off-by: Stefan Christ <s.christ@phytec.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 78 +++++++++++++++------------------
 1 file changed, 36 insertions(+), 42 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index f44851a..5bfd33b 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -6,54 +6,48 @@ python __anonymous () {
 }
 
 do_compile_append() {
-	if test -n "${KERNEL_DEVICETREE}"; then
-		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q '\.dts$'; then
-				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-			fi
-			oe_runmake ${DTB}
-		done
-	fi
+	for DTB in ${KERNEL_DEVICETREE}; do
+		if echo ${DTB} | grep -q '\.dts$'; then
+			bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+			DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+		fi
+		oe_runmake ${DTB}
+	done
 }
 
 do_install_append() {
-	if test -n "${KERNEL_DEVICETREE}"; then
-		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q '\.dts$'; then
-				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-			fi
-			DTB_BASE_NAME=`basename ${DTB} .dtb`
-			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-			if [ ! -e "${DTB_PATH}" ]; then
-				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
-			fi
-			install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
-		done
-	fi
+	for DTB in ${KERNEL_DEVICETREE}; do
+		if echo ${DTB} | grep -q '\.dts$'; then
+			bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+			DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+		fi
+		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+		if [ ! -e "${DTB_PATH}" ]; then
+			DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+		fi
+		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
+	done
 }
 
 do_deploy_append() {
-	if test -n "${KERNEL_DEVICETREE}"; then
-		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q '\.dts$'; then
-				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-			fi
-			DTB_BASE_NAME=`basename ${DTB} .dtb`
-			DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-			DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-			if [ ! -e "${DTB_PATH}" ]; then
-				DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
-			fi
-			install -d ${DEPLOYDIR}
-			install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
-			ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
-		done
-	fi
+	for DTB in ${KERNEL_DEVICETREE}; do
+		if echo ${DTB} | grep -q '\.dts$'; then
+			bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+			DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+		fi
+		DTB_BASE_NAME=`basename ${DTB} .dtb`
+		DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
+		DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+		if [ ! -e "${DTB_PATH}" ]; then
+			DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+		fi
+		install -d ${DEPLOYDIR}
+		install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
+		ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
+	done
 }
 
 pkg_postinst_kernel-devicetree () {
-- 
1.9.1


