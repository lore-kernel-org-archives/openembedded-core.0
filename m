Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 25A30774BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:09 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2017 12:43:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="58074692"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 27 Jan 2017 12:43:10 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id EC83A6A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:11 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:41 +0200
Message-Id: <3e6b1a73681b4d67a79c9cc3ebad62c9bcebf131.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 04/11] image-wic: remove HDDDIR from WICVARS
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
X-List-Received-Date: Fri, 27 Jan 2017 20:43:09 -0000

Removed HDDDIR as it's not used by wic anymore.
Stopped usage of HDDDIR in wic test suite.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image-wic.bbclass | 2 +-
 meta/lib/oeqa/selftest/wic.py  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image-wic.bbclass b/meta/classes/image-wic.bbclass
index ab2e541..bd79073 100644
--- a/meta/classes/image-wic.bbclass
+++ b/meta/classes/image-wic.bbclass
@@ -1,7 +1,7 @@
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
 WICVARS ?= "\
-           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES \
+           BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR MACHINE_ARCH \
            RECIPE_SYSROOT_NATIVE ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS"
 
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 8eb77ae..ebbb280 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -372,8 +372,8 @@ class Wic(oeSelfTest):
 
         wicvars = set(get_bb_var('WICVARS', image).split())
         # filter out optional variables
-        wicvars = wicvars.difference(('HDDDIR', 'IMAGE_BOOT_FILES',
-                                      'INITRD', 'INITRD_LIVE', 'ISODIR'))
+        wicvars = wicvars.difference(('IMAGE_BOOT_FILES', 'INITRD',
+                                      'INITRD_LIVE', 'ISODIR'))
         with open(path) as envfile:
             content = dict(line.split("=", 1) for line in envfile)
             # test if variables used by wic present in the .env file
-- 
2.1.4


