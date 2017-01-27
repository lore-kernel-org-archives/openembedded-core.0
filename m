Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1E2C8774C7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:11 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 27 Jan 2017 12:43:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="59049590"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 27 Jan 2017 12:43:12 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1691C6A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:13 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:43 +0200
Message-Id: <5eac69f7c2b0dcc239b275a9dd16b616b5d7e6f9.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 06/11] isoimage-isohybrid: use TRANSLATED_TARGET_ARCH instead of MACHINE_ARCH
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
X-List-Received-Date: Fri, 27 Jan 2017 20:43:12 -0000

isoimage-sihybrid plugin uses MACHINE_ARCH to get the name of initrd image.
It doesn't work for all machines, for example for quemux86-64 machine
MACHINE_ARCH is quemux86_64 and initrd name is
core-image-minimal-initramfs-qemux86-64.cpio.gz

Used TRANSLATED_TARGET_ARCH variable to get the initrd image name.
Replaced MACHINE_ARCH->TRANSLATED_TARGET_ARCH in WICVARS variable to
make it available from <image>.env file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass                       | 4 ++--
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
index bd79073..3e98959 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -2,8 +2,8 @@
 # variables from this list is written to <image>.env file
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
-           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR MACHINE_ARCH \
-           RECIPE_SYSROOT_NATIVE ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
+           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS TRANSLATED_TARGET_ARCH"
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index b54a229..e4637a3 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -158,11 +158,11 @@ class IsoImagePlugin(SourcePlugin):
             if not image_type:
                 msger.error("Couldn't find INITRAMFS_FSTYPES, exiting.\n")
 
-            machine_arch = get_bitbake_var("MACHINE_ARCH")
-            if not machine_arch:
-                msger.error("Couldn't find MACHINE_ARCH, exiting.\n")
+            target_arch = get_bitbake_var("TRANSLATED_TARGET_ARCH")
+            if not target_arch:
+                msger.error("Couldn't find TRANSLATED_TARGET_ARCH, exiting.\n")
 
-            initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, machine_arch, image_type))[0]
+            initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, target_arch, image_type))[0]
 
         if not os.path.exists(initrd):
             # Create initrd from rootfs directory
-- 
2.1.4


