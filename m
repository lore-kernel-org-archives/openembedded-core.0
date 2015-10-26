Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2912C76FD0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 08:22:49 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 6CE15A0041E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 09:23:08 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015102609224933-4123 ;
	Mon, 26 Oct 2015 09:22:49 +0100 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Oct 2015 09:20:36 +0100
Message-Id: <1445847637-46008-4-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445847637-46008-1-git-send-email-s.christ@phytec.de>
References: <1445847637-46008-1-git-send-email-s.christ@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 26.10.2015 09:22:49,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 26.10.2015 09:22:49,
	Serialize complete at 26.10.2015 09:22:49
Subject: [PATCH v2 4/5] linux-dtb.inc: refactor common code to function normalize_dtb
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
 meta/recipes-kernel/linux/linux-dtb.inc | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 2b8b11f..22801b7 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -5,22 +5,25 @@ python __anonymous () {
     d.appendVar("PACKAGES", " kernel-devicetree")
 }
 
+normalize_dtb () {
+	DTB="$1"
+	if echo ${DTB} | grep -q '/dts/'; then
+		bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
+		DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
+	fi
+	echo "${DTB}"
+}
+
 do_compile_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
-		if echo ${DTB} | grep -q '/dts/'; then
-			bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-			DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-		fi
+		DTB=`normalize_dtb "${DTB}"`
 		oe_runmake ${DTB}
 	done
 }
 
 do_install_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
-		if echo ${DTB} | grep -q '/dts/'; then
-			bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-			DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-		fi
+		DTB=`normalize_dtb "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} .dtb`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		DTB_PATH="${B}/arch/${ARCH}/boot/dts/${DTB}"
@@ -33,10 +36,7 @@ do_install_append() {
 
 do_deploy_append() {
 	for DTB in ${KERNEL_DEVICETREE}; do
-		if echo ${DTB} | grep -q '/dts/'; then
-			bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-			DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-		fi
+		DTB=`normalize_dtb "${DTB}"`
 		DTB_BASE_NAME=`basename ${DTB} .dtb`
 		DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
 		DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTB_BASE_NAME}/g"`
-- 
1.9.1


