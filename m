Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9A46F731EF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:15:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jan 2016 06:15:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="893132457"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 14 Jan 2016 06:15:12 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 805526A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:03:08 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:57 +0200
Message-Id: <0a948d53ca14af9ac009d54f6b4863626a9f2392.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 7/9] wic: get rid of get_rootfs and set_rootfs
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
X-List-Received-Date: Thu, 14 Jan 2016 14:15:11 -0000

Got rid of get_rootfs and set_rootfs java-like getter and
setter. Renamed rootfs to rootfs_dir to be consistent with
the name of kickstart parameter --rootfs-dir.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py                     |  6 +++---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 14 +++++++-------
 scripts/lib/wic/plugins/source/rootfs.py             | 14 +++++++-------
 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py  |  2 +-
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 25bab89..09ff5f8 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -233,7 +233,7 @@ class DirectImageCreator(BaseImageCreator):
             # get rootfs size from bitbake variable if it's not set in .ks file
             if not part.size:
                 # and if rootfs name is specified for the partition
-                image_name = part.get_rootfs()
+                image_name = part.rootfs_dir
                 if image_name:
                     # Bitbake variable ROOTFS_SIZE is calculated in
                     # Image._get_rootfs_size method from meta/lib/oe/image.py
@@ -336,13 +336,13 @@ class DirectImageCreator(BaseImageCreator):
 
         msg += 'The following build artifacts were used to create the image(s):\n'
         for part in parts:
-            if part.get_rootfs() is None:
+            if part.rootfs_dir is None:
                 continue
             if part.mountpoint == '/':
                 suffix = ':'
             else:
                 suffix = '["%s"]:' % (part.mountpoint or part.label)
-            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), part.get_rootfs())
+            msg += '  ROOTFS_DIR%s%s\n' % (suffix.ljust(20), part.rootfs_dir)
 
         msg += '  BOOTIMG_DIR:                  %s\n' % self.bootimg_dir
         msg += '  KERNEL_DIR:                   %s\n' % self.kernel_dir
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 9ad0bc7..b5ca4d3 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -262,26 +262,26 @@ class IsoImagePlugin(SourcePlugin):
 
         isodir = "%s/ISO" % cr_workdir
 
-        if part.rootfs is None:
+        if part.rootfs_dir is None:
             if not 'ROOTFS_DIR' in rootfs_dir:
                 msger.error("Couldn't find --rootfs-dir, exiting.\n")
             rootfs_dir = rootfs_dir['ROOTFS_DIR']
         else:
-            if part.rootfs in rootfs_dir:
-                rootfs_dir = rootfs_dir[part.rootfs]
-            elif part.rootfs:
-                rootfs_dir = part.rootfs
+            if part.rootfs_dir in rootfs_dir:
+                rootfs_dir = rootfs_dir[part.rootfs_dir]
+            elif part.rootfs_dir:
+                rootfs_dir = part.rootfs_dir
             else:
                 msg = "Couldn't find --rootfs-dir=%s connection "
                 msg += "or it is not a valid path, exiting.\n"
-                msger.error(msg % part.rootfs)
+                msger.error(msg % part.rootfs_dir)
 
         if not os.path.isdir(rootfs_dir):
             rootfs_dir = get_bitbake_var("IMAGE_ROOTFS")
         if not os.path.isdir(rootfs_dir):
             msger.error("Couldn't find IMAGE_ROOTFS, exiting.\n")
 
-        part.set_rootfs(rootfs_dir)
+        part.rootfs_dir = rootfs_dir
 
         # Prepare rootfs.img
         hdd_dir = get_bitbake_var("HDDDIR")
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index a90712b..425da8b 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -61,23 +61,23 @@ class RootfsPlugin(SourcePlugin):
         'prepares' the partition to be incorporated into the image.
         In this case, prepare content for legacy bios boot partition.
         """
-        if part.rootfs is None:
+        if part.rootfs_dir is None:
             if not 'ROOTFS_DIR' in krootfs_dir:
                 msg = "Couldn't find --rootfs-dir, exiting"
                 msger.error(msg)
             rootfs_dir = krootfs_dir['ROOTFS_DIR']
         else:
-            if part.rootfs in krootfs_dir:
-                rootfs_dir = krootfs_dir[part.rootfs]
-            elif part.rootfs:
-                rootfs_dir = part.rootfs
+            if part.rootfs_dir in krootfs_dir:
+                rootfs_dir = krootfs_dir[part.rootfs_dir]
+            elif part.rootfs_dir:
+                rootfs_dir = part.rootfs_dir
             else:
                 msg = "Couldn't find --rootfs-dir=%s connection"
                 msg += " or it is not a valid path, exiting"
-                msger.error(msg % part.rootfs)
+                msger.error(msg % part.rootfs_dir)
 
         real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
-        part.set_rootfs(real_rootfs_dir)
+        part.rootfs_dir = real_rootfs_dir
         part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
 
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index bdf1b54..48b4817 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -141,7 +141,7 @@ class RootfsPlugin(SourcePlugin):
 
         real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
 
-        part.set_rootfs(real_rootfs_dir)
+        part.rootfs_dir = real_rootfs_dir
         part.prepare_rootfs(image_creator_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
 
         # install syslinux into rootfs partition
-- 
2.1.4


