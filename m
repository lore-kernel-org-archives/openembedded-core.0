Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qey6g-0002Ta-D9
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:35:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 16:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,496,1304319600"; d="scan'208";a="22846269"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.236])
	by orsmga002.jf.intel.com with ESMTP; 07 Jul 2011 16:31:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2011 16:31:33 -0700
Message-Id: <c55e57619344a0ddff4444e1a4403c9516089e5b.1310081443.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
Subject: [PATCH 1/8] rootfs_rpm: Add 50Meg to image size for zypper
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
X-List-Received-Date: Thu, 07 Jul 2011 23:35:42 -0000

[YOCTO #1171]

Add /var space for zypper due to its space usage for db maintence

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    2 +-
 meta/classes/rootfs_rpm.bbclass  |    5 +++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8c86227..505342d 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -13,7 +13,7 @@ def get_imagecmds(d):
 
 runimagecmd () {
 	# Image generation code for image type ${type}
-	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE}; OFMT = "%.0f" ; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
+	ROOTFS_SIZE=`du -ks ${IMAGE_ROOTFS}|awk '{size = $1 * ${IMAGE_OVERHEAD_FACTOR} + ${IMAGE_ROOTFS_EXTRA_SPACE} + ${ZYPPER_VAR_DB_SPACE}; OFMT = "%.0f" ; print (size > ${IMAGE_ROOTFS_SIZE} ? size : ${IMAGE_ROOTFS_SIZE}) }'`
 	${cmd}
 	cd ${DEPLOY_DIR_IMAGE}/
 	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.${type}
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 3a11858..67c547f 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -3,6 +3,10 @@
 #
 
 ROOTFS_PKGMANAGE = "rpm zypper"
+
+# Add 50Meg of extra space for zypper database space
+ZYPPER_VAR_DB_SPACE = "51200"
+
 # Postinstalls on device are handled within this class at present
 ROOTFS_PKGMANAGE_BOOTSTRAP = ""
 
@@ -101,6 +105,7 @@ EOF
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 
+
 	${ROOTFS_POSTINSTALL_COMMAND}
 
 	mkdir -p ${IMAGE_ROOTFS}/etc/rpm-postinsts/
-- 
1.7.3.4



