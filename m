Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.tricorecenter.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id B074477164
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:17:42 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id D461CA0048F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:17:53 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101910173731-42263 ;
	Mon, 19 Oct 2015 10:17:37 +0200 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 10:15:41 +0200
Message-Id: <1445242541-41638-8-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 10:17:37,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 10:17:37,
	Serialize complete at 19.10.2015 10:17:37
Subject: [PATCH 7/7] linux-dtb.inc: refactor common code to function get_real_dtb_path_in_kernel
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
X-List-Received-Date: Mon, 19 Oct 2015 08:17:43 -0000

Signed-off-by: Stefan Christ <s.christ@phytec.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 658a32f..beacdff 100644
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


