Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 91FC5784DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 18:23:16 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2017 11:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,398,1500966000"; d="scan'208";a="1195534948"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2017 11:23:17 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 11:22:44 -0700
Message-Id: <20170915182244.27986-1-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] core-image-tiny-initramfs: initramfs recipes should not generate an actual image file
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
X-List-Received-Date: Fri, 15 Sep 2017 18:23:16 -0000

core-image-tiny-initramfs was used to generate a wic image, which was conceptually wrong
since initrafms recipes should only generate the boot artifacts that can later be used
by another recipe to generate an image using the tool of their choice.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-core/images/core-image-tiny-initramfs.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/images/core-image-tiny-initramfs.bb b/meta/recipes-core/images/core-image-tiny-initramfs.bb
index 184727ddf7a..a8893d1e53e 100644
--- a/meta/recipes-core/images/core-image-tiny-initramfs.bb
+++ b/meta/recipes-core/images/core-image-tiny-initramfs.bb
@@ -1,10 +1,9 @@
 # Simple initramfs image artifact generation for tiny images.
 DESCRIPTION = "Tiny image capable of booting a device. The kernel includes \
 the Minimal RAM-based Initial Root Filesystem (initramfs), which finds the \
-first 'init' program more efficiently.  core-image-tiny-initramfs doesn't \
+first 'init' program more efficiently. core-image-tiny-initramfs doesn't \
 actually generate an image but rather generates boot and rootfs artifacts \
-into a common location that can subsequently be picked up by external image \
-generation tools such as wic."
+that can subsequently be picked up by external image generation tools such as wic."
 
 PACKAGE_INSTALL = "initramfs-live-boot packagegroup-core-boot dropbear ${VIRTUAL-RUNTIME_base-utils} udev base-passwd ${ROOTFS_BOOTSTRAP_INSTALL}"
 
@@ -17,7 +16,7 @@ IMAGE_LINGUAS = ""
 LICENSE = "MIT"
 
 # don't actually generate an image, just the artifacts needed for one
-IMAGE_FSTYPES = "${INITRAMFS_FSTYPES} wic"
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 
 inherit core-image
 
-- 
2.12.3


