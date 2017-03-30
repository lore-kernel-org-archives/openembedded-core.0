Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EA7CA77D56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490899517; x=1522435517;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jmxCN4piqMc65et4fkfavSJwptBiJAdgz8XnWvbUbf0=;
	b=st5wAGpud46495DWqpSZD3PUebfKa5cwWaRZO3H7mO+USwoAA+I7sXJF
	vL8vhnVKIKdAZB6+W4jEwDbYGyYakw==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Mar 2017 11:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="82827955"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2017 11:45:17 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 9C5022C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:45:09 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 21:43:47 +0300
Message-Id: <52b907479452fee08d1a2b9d186a28b6f49098f1.1490898545.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490898545.git.ed.bartosh@linux.intel.com>
References: <cover.1490898545.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/9] wic: set FAT 16 for msdos partitions
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
X-List-Received-Date: Thu, 30 Mar 2017 18:45:16 -0000

Used '-F 16' parameter for mkdosfs to create FAT16 partitions for
'msdos' partition type.

[YOCTO #11137]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/partition.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index d59351c..6f324ad 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -305,7 +305,12 @@ class Partition():
         if self.label:
             label_str = "-n %s" % self.label
 
-        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, rootfs_size)
+        size_str = ""
+        if self.fstype == 'msdos':
+            size_str = "-F 16" # FAT 16
+
+        dosfs_cmd = "mkdosfs %s -S 512 %s -C %s %d" % (label_str, size_str,
+                                                       rootfs, rootfs_size)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
@@ -372,7 +377,12 @@ class Partition():
         if self.label:
             label_str = "-n %s" % self.label
 
-        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, blocks)
+        size_str = ""
+        if self.fstype == 'msdos':
+            size_str = "-F 16" # FAT 16
+
+        dosfs_cmd = "mkdosfs %s -S 512 %s -C %s %d" % (label_str, size_str,
+                                                       rootfs, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
         chmod_cmd = "chmod 644 %s" % rootfs
-- 
2.1.4


