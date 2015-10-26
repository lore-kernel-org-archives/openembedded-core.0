Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2837676E2E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 08:22:49 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 74227A00424
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 09:23:08 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015102609224936-4124 ;
	Mon, 26 Oct 2015 09:22:49 +0100 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2015 09:20:37 +0100
Message-Id: <1445847637-46008-5-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445847637-46008-1-git-send-email-s.christ@phytec.de>
References: <1445847637-46008-1-git-send-email-s.christ@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 26.10.2015 09:22:49,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 26.10.2015 09:22:49,
	Serialize complete at 26.10.2015 09:22:49
Subject: [PATCH v2 5/5] linux-dtb.inc: refactor common code to function get_real_dtb_path_in_kernel
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
X-List-Received-Date: Mon, 26 Oct 2015 08:22:52 -0000

Signed-off-by: Stefan Christ <s.christ@phytec.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 22801b7..772adcb 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -14,6 +14,15 @@ normalize_dtb () {
 	echo "${DTB}"
 }
 
+get_real_dtb_path_in_kernel () {
+	DTB="$1"
+	DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
+	if [ ! -e "${DTB_PATH}" ]; then
+		DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
+	fi
+	echo "${DTB_PATH}"
+}
+
 do_compile_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
 		DTB=`normalize_dtb "${DTB}"`
@@ -26,10 +35,7 @@ do_install_append() {
 		DTB=`normalize_dtb "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} .dtb`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-		if [ ! -e "${DTB_PATH}" ]; then
-			DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
-		fi
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 		install -m 0644 ${DTB_PATH} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
 	done
 }
@@ -40,10 +46,7 @@ do_deploy_append() {
 		DTB_BASE_NAME=`basename ${DTB} .dtb`
 		DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-		DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
-		if [ ! -e "${DTB_PATH}" ]; then
-			DTB_PATH="${B}/arch/${ARCH}/boot/${DTB}"
-		fi
+		DTB_PATH=`get_real_dtb_path_in_kernel "${DTB}"`
 		install -d ${DEPLOYDIR}
 		install -m 0644 ${DTB_PATH} ${DEPLOYDIR}/${DTB_NAME}.dtb
 		ln -sf ${DTB_NAME}.dtb ${DEPLOYDIR}/${DTB_SYMLINK_NAME}.dtb
-- 
1.9.1


