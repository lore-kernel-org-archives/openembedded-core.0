Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E9D466D310
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 14:24:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Oct 2013 07:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="311116459"
Received: from unknown (HELO localhost) ([10.255.14.222])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Oct 2013 07:24:19 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2013 09:24:05 -0500
Message-Id: <7d138d9b62545fadb04ed299cfe01a93a7cd8cea.1382451106.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
References: <9872888983dba131e54cd489a1c5b9ef05728681.1382451106.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1382451106.git.tom.zanussi@linux.intel.com>
References: <cover.1382451106.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 10/10] wic: Update and generalize pseudo setup for rootfs generation
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
X-List-Received-Date: Tue, 22 Oct 2013 14:24:18 -0000

Remove unnecessary pseudo exports i.e. PSEUDO_DISABLED and move the
setup to the top-level prepare_rootfs().

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 .../lib/mic/kickstart/custom_commands/partition.py | 28 ++++++++++++----------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 0eb0671..4b11195 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -204,25 +204,27 @@ class Wic_PartData(Mic_PartData):
 
         Currently handles ext2/3/4 and btrfs.
         """
+        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
+        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+        pseudo += "%s/usr/bin/pseudo " % native_sysroot
+
         if self.fstype.startswith("ext"):
             return self.prepare_rootfs_ext(cr_workdir, oe_builddir,
-                                           rootfs_dir, native_sysroot)
+                                           rootfs_dir, native_sysroot,
+                                           pseudo)
         elif self.fstype.startswith("btrfs"):
             return self.prepare_rootfs_btrfs(cr_workdir, oe_builddir,
-                                             rootfs_dir, native_sysroot)
+                                             rootfs_dir, native_sysroot,
+                                             pseudo)
 
     def prepare_rootfs_ext(self, cr_workdir, oe_builddir, rootfs_dir,
-                           native_sysroot):
+                           native_sysroot, pseudo):
         """
         Prepare content for an ext2/3/4 rootfs partition.
         """
-        populate_script = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
-        populate_script += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
-        populate_script += "export PSEUDO_PASSWD=%s;" % rootfs_dir
-        populate_script += "export PSEUDO_NOSYMLINKEXP=1;"
-        populate_script += "export PSEUDO_DISABLED=0;"
-        populate_script += "%s/usr/bin/pseudo %s/usr/bin/populate-extfs.sh" % \
-            (native_sysroot, native_sysroot)
+        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
 
         image_extra_space = 10240
 
@@ -245,7 +247,7 @@ class Wic_PartData(Mic_PartData):
         rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
 
         populate_cmd = populate_script + " " + image_rootfs + " " + rootfs
-        rc, out = exec_native_cmd(populate_cmd, native_sysroot)
+        rc, out = exec_native_cmd(pseudo + populate_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
@@ -258,7 +260,7 @@ class Wic_PartData(Mic_PartData):
         return 0
 
     def prepare_rootfs_btrfs(self, cr_workdir, oe_builddir, rootfs_dir,
-                             native_sysroot):
+                             native_sysroot, pseudo):
         """
         Prepare content for a btrfs rootfs partition.
 
@@ -281,7 +283,7 @@ class Wic_PartData(Mic_PartData):
 
         mkfs_cmd = "mkfs.%s -b %d -r %s %s" % \
             (self.fstype, rootfs_size * 1024, image_rootfs, rootfs)
-        rc, out = exec_native_cmd(mkfs_cmd, native_sysroot)
+        rc, out = exec_native_cmd(pseudo + mkfs_cmd, native_sysroot)
 
         # get the rootfs size in the right units for kickstart (Mb)
         du_cmd = "du -Lbms %s" % rootfs
-- 
1.8.3.1


