Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjuZX-0001h2-JF
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:54:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 08:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161344548"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 08:43:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jun 2012 08:43:18 -0700
Message-Id: <7e27b096d51e766962f94f9f4e2cc0872a927c25.1340811559.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340811559.git.sgw@linux.intel.com>
References: <cover.1340811559.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 13/20] linux-dtb: add multi-dtb build support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 15:54:28 -0000

From: Zhenhua Luo <b19537@freescale.com>

    including following enhancement:
    * support multi-dtb build
    * skip dtb build and install when KERNEL_DEVICETREE is empty
    * print a warning message when specified dts file is not available

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   36 +++++++++++++++++++++++++------
 1 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 9188cee..8aa1458 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -15,13 +15,35 @@ python __anonymous () {
 
 do_install_append() {
     if test -n "${KERNEL_DEVICETREE}"; then
-	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
-	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
-	install -d ${DEPLOYDIR}
-	install -m 0644 devicetree ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
-	cd ${DEPLOYDIR}
-	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
-	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
+        for DTS_FILE in ${KERNEL_DEVICETREE}; do
+            if [ ! -f ${DTS_FILE} ]; then
+                echo "Warning: ${DTS_FILE} is not available!"
+                continue
+            fi
+            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
+            install -m 0644 ${DTS_BASE_NAME} ${D}/boot/devicetree-${DTB_SYMLINK_NAME}.dtb
+        done
     fi
 }
 
+do_deploy_append() {
+    if test -n "${KERNEL_DEVICETREE}"; then
+        for DTS_FILE in ${KERNEL_DEVICETREE}; do
+            if [ ! -f ${DTS_FILE} ]; then
+                echo "Warning: ${DTS_FILE} is not available!"
+                continue
+            fi
+            DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+            DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+            install -d ${DEPLOYDIR}
+            install -m 0644 ${B}/${DTS_BASE_NAME} ${DEPLOYDIR}/${DTB_NAME}.dtb
+            cd ${DEPLOYDIR}
+            ln -sf ${DTB_NAME}.dtb ${DTB_SYMLINK_NAME}.dtb
+            cd -
+        done
+    fi
+}
-- 
1.7.7.6



