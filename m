Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 25B5371A92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:30:11 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="103186223"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 17 May 2017 06:30:12 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id E66166A4080;
	Wed, 17 May 2017 06:29:56 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:30:07 +0000
Message-Id: <20170517133007.10730-1-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] isoimage-isohybrid: don't use TRANSLATED_TARGET_ARCH
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
X-List-Received-Date: Wed, 17 May 2017 13:30:12 -0000

isoimage-isohybrid plugin fails with this error when
trying to find initrd image:
    initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, target_arch, image_type))[0]
    IndexError: list index out of range
as it uses TRANSLATED_TARGET_ARCH value as part of the image.
This approach stopped to work due to changes in oe core code.

initrd file name is made using MACHINE variable. wic can't get value
of this variable as it's not included into bitbake -e output.

Used basename of deploy dir as MACHINE value to fix the breakage.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass                 | 2 +-
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 3b73261d5e..dcf67e3c24 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,7 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS TRANSLATED_TARGET_ARCH"
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 1ceba62be0..b464263c3d 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -162,11 +162,9 @@ class IsoImagePlugin(SourcePlugin):
             if not image_type:
                 raise WicError("Couldn't find INITRAMFS_FSTYPES, exiting.")
 
-            target_arch = get_bitbake_var("TRANSLATED_TARGET_ARCH")
-            if not target_arch:
-                raise WicError("Couldn't find TRANSLATED_TARGET_ARCH, exiting.")
+            machine = os.path.basename(initrd_dir)
 
-            initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, target_arch, image_type))[0]
+            initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, machine, image_type))[0]
 
         if not os.path.exists(initrd):
             # Create initrd from rootfs directory
-- 
2.12.0


