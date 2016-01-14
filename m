Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C1357731C9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 14:15:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Jan 2016 06:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,294,1449561600"; d="scan'208";a="860455063"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 14 Jan 2016 06:15:24 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id EBB2D6A4002
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:03:20 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:12:58 +0200
Message-Id: <2bad6e86b3bd5ad53f08575d84174d624b7f3235.1452766193.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1452766193.git.ed.bartosh@linux.intel.com>
References: <cover.1452766193.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 8/9] wic: get rid of set_size and set_source_file setters
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
X-List-Received-Date: Thu, 14 Jan 2016 14:15:45 -0000

Used size and source_file attributes instead of using
setters. It's more pythonic, clear an consistent.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py        | 4 ++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py     | 4 ++--
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 35afa30..8bfa3a9 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -235,5 +235,5 @@ class BootimgEFIPlugin(SourcePlugin):
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
-        part.set_size(bootimg_size)
-        part.set_source_file(bootimg)
+        part.size = bootimg_size
+        part.source_file = bootimg
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 255684b..e84bddf 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -205,7 +205,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         out = exec_cmd(du_cmd)
         bootimg_size = out.split()[0]
 
-        part.set_size(bootimg_size)
-        part.set_source_file(bootimg)
+        part.size = int(out.split()[0])
+        part.source_file = bootimg
 
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index b5ca4d3..daefff3 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -302,7 +302,7 @@ class IsoImagePlugin(SourcePlugin):
             # which contains rootfs
             du_cmd = "du -bks %s" % rootfs_dir
             out = exec_cmd(du_cmd)
-            part.set_size(int(out.split()[0]))
+            part.size = int(out.split()[0])
             part.extra_space = 0
             part.overhead_factor = 1.2
             part.prepare_rootfs(cr_workdir, oe_builddir, rootfs_dir, \
@@ -502,8 +502,8 @@ class IsoImagePlugin(SourcePlugin):
         out = exec_cmd(du_cmd)
         isoimg_size = int(out.split()[0])
 
-        part.set_size(isoimg_size)
-        part.set_source_file(iso_img)
+        part.size = isoimg_size
+        part.source_file = iso_img
 
     @classmethod
     def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
-- 
2.1.4


