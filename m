Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A213271C2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 16:10:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 16 Jan 2017 08:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,239,1477983600"; d="scan'208";a="31209577"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 16 Jan 2017 08:10:53 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id A96D06A4006;
	Mon, 16 Jan 2017 08:09:57 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jan 2017 17:46:39 +0200
Message-Id: <849590a1b6e1d37203a9d8aa9fbd82ae9b6f5ce8.1484581112.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484581112.git.ed.bartosh@linux.intel.com>
References: <cover.1484581112.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 10/14] wic: isoimage-isohybrid: stop using HDDDIR
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
X-List-Received-Date: Mon, 16 Jan 2017 16:10:52 -0000

Stop using HDDDIR in isoimage-isohybrid wic plugin.
This variable is set by hddimg code, which is going to be
removed soon.

All required artifacts should be available from ISODIR.
wic-image.bbclass has been modified to build iso artifacts,
so it should be safe to remove usage of HDDDIR.

[YOCTO #10835]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 3c43f5b..8bc9dea 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -298,12 +298,8 @@ class IsoImagePlugin(SourcePlugin):
         part.rootfs_dir = rootfs_dir
 
         # Prepare rootfs.img
-        hdd_dir = get_bitbake_var("HDDDIR")
         img_iso_dir = get_bitbake_var("ISODIR")
-
-        rootfs_img = "%s/rootfs.img" % hdd_dir
-        if not os.path.isfile(rootfs_img):
-            rootfs_img = "%s/rootfs.img" % img_iso_dir
+        rootfs_img = "%s/rootfs.img" % img_iso_dir
         if not os.path.isfile(rootfs_img):
             # check if rootfs.img is in deploydir
             deploy_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
@@ -332,9 +328,7 @@ class IsoImagePlugin(SourcePlugin):
             os.remove(part.source_file)
 
         # Prepare initial ramdisk
-        initrd = "%s/initrd" % hdd_dir
-        if not os.path.isfile(initrd):
-            initrd = "%s/initrd" % img_iso_dir
+        initrd = "%s/initrd" % img_iso_dir
         if not os.path.isfile(initrd):
             initrd = cls._build_initramfs_path(rootfs_dir, cr_workdir)
 
-- 
2.1.4


