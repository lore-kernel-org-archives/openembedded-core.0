Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SC3qp-0003s7-8f
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 08:56:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Mar 2012 23:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="133089938"
Received: from unknown (HELO localhost.localdomain) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2012 23:47:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 23:47:07 -0700
Message-Id: <6a68cf7d22e94be417215b12cac4cf1c5b9baefa.1332744104.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
Subject: [Build App RFC 4/5] vmdk: Update for direstdisk
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
X-List-Received-Date: Mon, 26 Mar 2012 06:56:23 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image-vmdk.bbclass |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
index 9d596cd..736d1d7 100644
--- a/meta/classes/image-vmdk.bbclass
+++ b/meta/classes/image-vmdk.bbclass
@@ -1,15 +1,23 @@
 
 NOISO = "1"
+
+SYSLINUX_ROOT = "root=/dev/hda2 "
 SYSLINUX_PROMPT = "0"
 SYSLINUX_TIMEOUT = "1"
 SYSLINUX_LABELS = "boot"
+LABELS_append = " ${SYSLINUX_LABELS} "
+
+# need to define the dependency and the ROOTFS for directdisk
+do_bootdirectdisk[depends] += "${IMAGE_BASENAME}:do_rootfs"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 
 # creating VMDK relies on having a live hddimg so ensure we
 # inherit it here.
-inherit image-live
+#inherit image-live
+inherit boot-directdisk
 
 create_vmdk_image () {
-	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hddimg ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
+	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
 	ln -s ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
 
 }
@@ -18,7 +26,8 @@ python do_vmdkimg() {
         bb.build.exec_func('create_vmdk_image', d)
 }
 
-addtask vmdkimg after do_bootimg before do_build
+#addtask vmdkimg after do_bootimg before do_build
+addtask vmdkimg after do_bootdirectdisk before do_build
 do_vmdkimg[nostamp] = "1"
 
 do_vmdkimg[depends] += "qemu-native:do_populate_sysroot" 
-- 
1.7.7.6



