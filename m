Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.phytec.co.uk [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD9C77075
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:17:39 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id AE86FA0048E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:17:53 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101910173717-42260 ;
	Mon, 19 Oct 2015 10:17:37 +0200 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 10:15:38 +0200
Message-Id: <1445242541-41638-5-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 10:17:37,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 10:17:37,
	Serialize complete at 19.10.2015 10:17:37
Subject: [PATCH 4/7] linux-dtb.inc: use same variable name DTB for all elements of KERNEL_DEVICETREE
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

Signed-off-by: Stefan Christ <s.christ@phytec.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 0095155..f44851a 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -58,9 +58,9 @@ do_deploy_append() {
 
 pkg_postinst_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
-	for DTB_FILE in ${KERNEL_DEVICETREE}
+	for DTB in ${KERNEL_DEVICETREE}
 	do
-		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
+		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		update-alternatives --install /${KERNEL_IMAGEDEST}/${DTB_BASE_NAME}.dtb ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
@@ -68,9 +68,9 @@ pkg_postinst_kernel-devicetree () {
 
 pkg_postrm_kernel-devicetree () {
 	cd /${KERNEL_IMAGEDEST}
-	for DTB_FILE in ${KERNEL_DEVICETREE}
+	for DTB in ${KERNEL_DEVICETREE}
 	do
-		DTB_BASE_NAME=`basename ${DTB_FILE} | awk -F "." '{print $1}'`
+		DTB_BASE_NAME=`basename ${DTB} | awk -F "." '{print $1}'`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		update-alternatives --remove ${DTB_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
 	done
-- 
1.9.1


