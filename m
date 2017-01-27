Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 57524774B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:08 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2017 12:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="58382658"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 27 Jan 2017 12:43:09 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E04CD6A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:10 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:40 +0200
Message-Id: <7cabcad991149ead5d3403265d55c0b63773e82b.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 03/11] wic: isoimage-isohybrid: stop using HDDDIR
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
index fd25190..a637ce5 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -249,12 +249,8 @@ class IsoImagePlugin(SourcePlugin):
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
@@ -283,9 +279,7 @@ class IsoImagePlugin(SourcePlugin):
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


