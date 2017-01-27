Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F1AAD774B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 27 Jan 2017 12:43:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="1099859766"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2017 12:43:07 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CD4766A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:09 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:39 +0200
Message-Id: <042cfa1fc28fdbda00fbb7dbdfc2335545260558.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 02/11] wic: use INITRD_LIVE in isoimage-isohybrid
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
X-List-Received-Date: Fri, 27 Jan 2017 20:43:08 -0000

INITRD variable is not set if hddimg is disabled.
isoimage-isohybrid can't get correct name for initrd if INITRD
variable is not set.

Added INITRD_LIVE to WICVARS and used it in isoimage-isohybrid
code to get initrd artifact name. Used INITRD if INITRD_LIVE is not set.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass                       | 4 ++--
 meta/lib/oeqa/selftest/wic.py                        | 2 +-
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
index 2acfd65..ab2e541 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -2,8 +2,8 @@
 # variables from this list is written to <image>.env file
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES \
-           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
+           IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR MACHINE_ARCH \
+           RECIPE_SYSROOT_NATIVE ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 53631fa..8eb77ae 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -373,7 +373,7 @@ class Wic(oeSelfTest):
         wicvars = set(get_bb_var('WICVARS', image).split())
         # filter out optional variables
         wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
-                                      'INITRD', 'ISODIR'))
+                                      'INITRD', 'INITRD_LIVE', 'ISODIR'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index a8a5dc0..fd25190 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -144,7 +144,7 @@ class IsoImagePlugin(SourcePlugin):
         Create path for initramfs image
         """
 
-        initrd = get_bitbake_var("INITRD")
+        initrd = get_bitbake_var("INITRD_LIVE") or get_bitbake_var("INITRD")
         if not initrd:
             initrd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not initrd_dir:
-- 
2.1.4


