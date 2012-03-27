Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SCPKB-0006eo-S9
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 07:52:08 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Mar 2012 22:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146024247"
Received: from unknown (HELO swold-mobl.domain.invalid) ([10.255.12.107])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2012 22:43:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 22:42:58 -0700
Message-Id: <6dde3b8fa4bcd8af6b93ba9ba119f8cfc46fdb1d.1332826876.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
In-Reply-To: <cover.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
Subject: [PATCH 4/6] vmdk: Update for direstdisk
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
X-List-Received-Date: Tue, 27 Mar 2012 05:52:08 -0000

The conversion to directdisk is necessary due to the limitation
in the mkdosfs version we carry and larger filesystems.

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



