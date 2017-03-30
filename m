Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 1ACC477D45
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490899515; x=1522435515;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VRPRWARTX5/UEGU+rJqho0rO974WbLfVQywcvx4cSNk=;
	b=CuQrpOcG7i38C82/FxcZsKxpfSAjXB0Q/vfpT3NRFkd3sj7C76G3VfXF
	Cv/Duhi0MPoA80DoMY78Q8zuOJqCZA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 11:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="1113744377"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 30 Mar 2017 11:45:14 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 66ABE2C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:45 +0300
Message-Id: <db68f23066569fa07a40927620ac22261ceadd33.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 3/9] wic: don't silently skip unknown fstypes
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
X-List-Received-Date: Thu, 30 Mar 2017 18:45:14 -0000

Fixed wic code that loops through hard-coded list of known fstypes
to find prepare_rootfs_<fstype> or prepare_empty_partition_<fstype>
methods and silently skipping unknown fstypes.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/partition.py | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index f0e88fb..28ad3e6 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -145,13 +145,11 @@ class Partition():
                                              self.lineno, self.fstype)
                 if os.path.isfile(rootfs):
                     os.remove(rootfs)
-                for prefix in ("ext", "btrfs", "vfat", "squashfs"):
-                    if self.fstype.startswith(prefix):
-                        method = getattr(self,
-                                         "prepare_empty_partition_" + prefix)
-                        method(rootfs, oe_builddir, native_sysroot)
-                        self.source_file = rootfs
-                        break
+
+                prefix = "ext" if self.fstype.startswith("ext") else self.fstype
+                method = getattr(self, "prepare_empty_partition_" + prefix)
+                method(rootfs, oe_builddir, native_sysroot)
+                self.source_file = rootfs
             return
 
         plugins = PluginMgr.get_plugins('source')
@@ -231,19 +229,15 @@ class Partition():
                                '--overhead-factor will be applied')
                 self.size = int(round(float(rsize_bb)))
 
-        for prefix in ("ext", "btrfs", "vfat", "squashfs"):
-            if self.fstype.startswith(prefix):
-                method = getattr(self, "prepare_rootfs_" + prefix)
-                method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
-
-                self.source_file = rootfs
+        prefix = "ext" if self.fstype.startswith("ext") else self.fstype
+        method = getattr(self, "prepare_rootfs_" + prefix)
+        method(rootfs, oe_builddir, rootfs_dir, native_sysroot, pseudo)
+        self.source_file = rootfs
 
-                # get the rootfs size in the right units for kickstart (kB)
-                du_cmd = "du -Lbks %s" % rootfs
-                out = exec_cmd(du_cmd)
-                self.size = int(out.split()[0])
-
-                break
+        # get the rootfs size in the right units for kickstart (kB)
+        du_cmd = "du -Lbks %s" % rootfs
+        out = exec_cmd(du_cmd)
+        self.size = int(out.split()[0])
 
     def prepare_rootfs_ext(self, rootfs, oe_builddir, rootfs_dir,
                            native_sysroot, pseudo):
-- 
2.1.4


