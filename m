Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1ULcjy-0004qH-B2
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 18:05:22 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2TGmF5j016619
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 11:48:16 -0500
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TGmELm020264
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 22:18:15 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 29 Mar 2013 22:18:14 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2TGmBYb016994;
	Fri, 29 Mar 2013 22:18:13 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Mar 2013 11:48:08 -0500
Message-ID: <1364575688-19681-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH] linux-dtb: Add simple DTB symlinks for devicetree
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
X-List-Received-Date: Fri, 29 Mar 2013 17:05:22 -0000
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
 meta/recipes-kernel/linux/linux-dtb.inc |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index ec6c375..66cf255 100644
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
+        DTB_NAME="devicetree-uImage-${DTS_BASE_NAME}.dtb"
+        update-alternatives --install /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb ${DTS_BASE_NAME}.dtb ${DTB_NAME} ${KERNEL_PRIORITY} || true
+    done
+}
+
+pkg_postrm_kernel-devicetree () {
+    cd /${KERNEL_IMAGEDEST}
+    for DTS_FILE in ${KERNEL_DEVICETREE}
+    do
+        DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
+        DTB_NAME="devicetree-uImage-${DTS_BASE_NAME}.dtb"
+        update-alternatives --remove ${DTS_BASE_NAME}.dtb ${DTB_NAME} ${KERNEL_PRIORITY} || true
+    done
+}
-- 
1.7.0.4



