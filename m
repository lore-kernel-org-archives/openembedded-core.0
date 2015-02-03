Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D9B3E60024
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 18:34:59 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Feb 2015 10:34:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,514,1418112000"; d="scan'208";a="672175795"
Received: from lzavalam-mobl.amr.corp.intel.com (HELO
	swold-mobl5.amr.corp.intel.com) ([10.252.252.168])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2015 10:34:58 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Feb 2015 10:34:31 -0800
Message-Id: <f305b44fc206694e8f0b1bde4ccb8481489bca15.1422988163.git.sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
In-Reply-To: <cover.1422988163.git.sgw@linux.intel.com>
References: <cover.1422988163.git.sgw@linux.intel.com>
Subject: [PATCH 5/6] core-image: split debug-tweaks into individual features
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
X-List-Received-Date: Tue, 03 Feb 2015 18:35:02 -0000

Split the debug-tweaks into a more fine tunable set of IMAGE_FEATURES
which activate the component functions.

Clean-up image-core and image bbclass by having the ROOTFS_POSTPROCESS_COMMANDs
in in one place for the debug-tweaks related functions

[YOCTO #5344]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/core-image.bbclass |  3 ---
 meta/classes/image.bbclass      | 11 +++++++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 62363fb..a78f934 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -73,8 +73,5 @@ inherit image
 # Create /etc/timestamp during image construction to give a reasonably sane default time setting
 ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
 
-# Zap the root password if debug-tweaks feature is not enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_empty_root_password ; ",d)}'
-
 # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b2a3e97..caca52f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -162,10 +162,17 @@ IMAGE_CLASSES += "image_types"
 inherit ${IMAGE_CLASSES}
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
+MACHINE_POSTPROCESS_COMMAND ?= ""
+
+# Zap the root password if debug-tweaks feature is not enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'empty-root-password' ], "", "zap_empty_root_password ; ",d)}'
+
 # Allow dropbear/openssh to accept logins from accounts with an empty password string if debug-tweaks is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "ssh_allow_empty_password; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'allow-empty-password' ], "ssh_allow_empty_password; ", "",d)}'
+
 # Enable postinst logging if debug-tweaks is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "postinst_enable_logging; ", "",d)}'
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
+
 # Write manifest
 IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
-- 
2.1.0


