Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1F228731CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 13:04:26 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 26 Jan 2017 05:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="52621260"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 26 Jan 2017 05:04:27 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 722E16A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2017 05:03:29 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2017 14:40:38 +0200
Message-Id: <7c5835d6d1c456ca478f557d3bee63bb9ca0bf09.1485434085.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485434085.git.ed.bartosh@linux.intel.com>
References: <cover.1485434085.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 10/14] wic: isoimage-isohybrid: stop using HDDDIR
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
X-List-Received-Date: Thu, 26 Jan 2017 13:04:27 -0000

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


