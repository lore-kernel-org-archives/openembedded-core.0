Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 669AD65CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 12:57:50 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5FBEAF81188; Fri, 17 Jul 2015 06:57:50 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BD1AEF811D7;
	Fri, 17 Jul 2015 06:57:49 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2015 06:58:00 -0600
Message-Id: <1437137880-9715-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] *image.bbclass: Consolidate ROOTFS_POSTPROCESS_COMMANDs
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
X-List-Received-Date: Fri, 17 Jul 2015 12:57:50 -0000

Move ROOTFS_POSTPROCESS_COMMANDs from core-image.bbclass to
image.bbclass so that images built using just image.bbclass
will benefit from them.  Without this change, an image built
using image.bbclass did not honor read-only-rootfs image feature.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/classes/core-image.bbclass | 6 ------
 meta/classes/image.bbclass      | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index a78f934..501456d 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -69,9 +69,3 @@ CORE_IMAGE_EXTRA_INSTALL ?= ""
 IMAGE_INSTALL ?= "${CORE_IMAGE_BASE_INSTALL}"
 
 inherit image
-
-# Create /etc/timestamp during image construction to give a reasonably sane default time setting
-ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
-
-# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
-ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 57aaf35..e2995e2 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -182,6 +182,12 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
 # Enable postinst logging if debug-tweaks is enabled
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", "",d)}'
 
+# Create /etc/timestamp during image construction to give a reasonably sane default time setting
+ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
+
+# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
+ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
+
 # Write manifest
 IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
 ROOTFS_POSTUNINSTALL_COMMAND =+ "write_image_manifest ; "
-- 
1.9.1


