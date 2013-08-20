Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by mail.openembedded.org (Postfix) with ESMTP id DDFCD6B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 16:20:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7KGKRxO000777;
	Tue, 20 Aug 2013 11:20:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7KGKRUE032262;
	Tue, 20 Aug 2013 11:20:27 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 11:20:27 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7KGKLvK006373;
	Tue, 20 Aug 2013 11:20:25 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2013 11:51:27 -0500
Message-ID: <1377017488-32708-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1377017488-32708-1-git-send-email-fcooper@ti.com>
References: <1377017488-32708-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [for dylan][PATCH 2/3] linux-dtb: Use kernel build system to generate the dtb files
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
X-List-Received-Date: Tue, 20 Aug 2013 16:20:42 -0000
Content-Type: text/plain

From: Otavio Salvador <otavio@ossystems.com.br>

As the Linux kernel, unconditionally, builds the dtc application and
it is the compatible version with the DeviceTree files shipped within
the kernel it is better to use it and the kernel build system to
generate the dtb files.

Some DeviceTree files rely on CPP and kernel headers to be able to
generate the dtb binary contents and it is harder to replicate it
outside of Linux kernel build system so we /use/ it.

To comply with these assumptions we need to use the dtb file when
calling 'make' instead of pointing to the DeviceTree source file; the
code has been made backward compatible but it is advised to move to
the new definition to avoid warnings as:

,----[ Original definition ]
| KERNEL_DEVICETREE = "${S}/arch/arm/boot/dts/imx6q-sabresd.dts"
`----

Becomes:

,----[ New definition ]
| KERNEL_DEVICETREE = "imx6q-sabresd.dtb"
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   57 ++++++++++++++-----------------
 1 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 401d1e0..7c8058f 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -3,42 +3,37 @@ FILES_kernel-devicetree = "/${KERNEL_IMAGEDEST}/devicetree*"
 KERNEL_DEVICETREE_FLAGS ?= "-R 8 -p 0x3000"
 
 python __anonymous () {
-    devicetree = d.getVar("KERNEL_DEVICETREE", True) or ''
-    if devicetree:
-	depends = d.getVar("DEPENDS", True)
-	d.setVar("DEPENDS", "%s dtc-native" % depends)
-	packages = d.getVar("PACKAGES", True)
-	d.setVar("PACKAGES", "%s kernel-devicetree" % packages)
+	d.appendVar("PACKAGES", " kernel-devicetree")
 }
 
 do_install_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
-		for DTS_FILE in ${KERNEL_DEVICETREE}; do
-			if [ ! -f ${DTS_FILE} ]; then
-				echo "Warning: ${DTS_FILE} is not available!"
-				continue
+		for DTB in ${KERNEL_DEVICETREE}; do
+			if echo ${DTB} | grep -q '/dts/'; then
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
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
+				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
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
1.7.0.4


