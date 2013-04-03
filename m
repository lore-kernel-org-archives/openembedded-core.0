Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UNTYf-0004rF-Gy
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 21:41:22 +0200
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r33JO6wA008277
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Apr 2013 14:24:06 -0500
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33JO4gj028327
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Apr 2013 00:54:05 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 4 Apr 2013 00:54:04 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r33JO1uA001716;
	Thu, 4 Apr 2013 00:54:03 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Apr 2013 14:23:58 -0500
Message-ID: <1365017039-21728-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 1/2] linux-dtb: Add simple DTB symlinks for devicetree
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 19:41:22 -0000
Content-Type: text/plain

* This is similar to the symlinks provided for the kernel image
  in the /boot directory of a file system.  The goal is to have
  simply named symlinks in /boot that mirror the device tree
  name in the kernel sources.  This is so that programs like
  U-Boot can easily find the default device tree binary in the
  /boot directory and use that when booting the kernel.
* Use update-alternatives to handle proper creation and removal
  of the symlinks.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Changed the variable names to use variables that match the
      do_install and do_deploy more closely for consistency.  i.e.
      using DTB_SYMLINK_NAME instead of DTB_NAME.
    * The above changes were based on input from:
        * Darren Hart <dvhart@linux.intel.com>
        * Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-dtb.inc |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index ec6c375..421ffa3 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -45,3 +45,23 @@ do_deploy_append() {
         done
     fi
 }
+
+pkg_postinst_kernel-devicetree () {
+    cd /${KERNEL_IMAGEDEST}
+    for DTS_FILE in ${KERNEL_DEVICETREE}
+    do
+        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+        DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+        update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+    done
+}
+
+pkg_postrm_kernel-devicetree () {
+    cd /${KERNEL_IMAGEDEST}
+    for DTS_FILE in ${KERNEL_DEVICETREE}
+    do
+        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+        DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
+        update-alternatives --remove ${DTS_BASE_NAME}.dtb devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
+    done
+}
-- 
1.7.0.4



