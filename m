Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C340E71C20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:10:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 16 Jan 2017 08:10:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="54488082"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2017 08:10:52 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4FB3E6A4006;
	Mon, 16 Jan 2017 08:09:56 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:38 +0200
Message-Id: <836a2c47855e262f0555cca801cc4a765909a6bc.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 09/14] wic: use INITRD_LIVE in isoimage-isohybrid
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
X-List-Received-Date: Mon, 16 Jan 2017 16:10:51 -0000

INITRD variable is not set if hddimg is disabled.
isoimage-isohybrid can't get correct name for initrd if INITRD
variable is not set.

Added INITRD_LIVE to WICVARS and used it in isoimage-isohybrid
code to get initrd artifact name. Used INITRD if INITRD_LIVE is not set.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass                       | 2 +-
 meta/lib/oeqa/selftest/wic.py                        | 2 +-
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
index 370eba8..df021ec 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -5,7 +5,7 @@ WKS_FULL_PATH = "${@wks_search('${WKS_FILES}'.split(), '${WKS_SEARCH_PATH}') or
 
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
-WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS WORKDIR"
+WICVARS ?= "BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS WORKDIR"
 
 def wks_search(files, search_path):
     for f in files:
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 49bbfe3..b187d4f 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -351,7 +351,7 @@ class Wic(oeSelfTest):
         wicvars = set(get_bb_var('WICVARS', image).split())
         # filter out optional variables
         wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
-                                      'INITRD', 'ISODIR'))
+                                      'INITRD', 'INITRD_LIVE', 'ISODIR'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 3858fd4..3c43f5b 100644
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


