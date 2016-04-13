Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C5D5B6FF23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 09:45:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2016 02:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,479,1455004800"; d="scan'208";a="931420687"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2016 02:45:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 126F96A4006;
	Wed, 13 Apr 2016 03:33:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 10:25:31 +0300
Message-Id: <1460532331-17077-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: fix bug in handling fsoptions
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
X-List-Received-Date: Wed, 13 Apr 2016 09:45:25 -0000

Partitions specifying --fsoptions were silently skipped by wic
due to the old bug introduced when removing code related to
subvolume handling:

- if mountpoint == "/" or not fsopts or fsopts.find("subvol=") == -1
+ if mountpoint == "/" or not fsopts:

[YOCTO #9396]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 36 ++++++++++++++++------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 5a103bb..ad596d2 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -96,25 +96,23 @@ class Image(object):
         # Converting kB to sectors for parted
         size = size * 1024 / self.sector_size
 
-        # We still need partition for "/" or non-subvolume
-        if mountpoint == "/" or not fsopts:
-            part = {'ks_pnum': ks_pnum, # Partition number in the KS file
-                    'size': size, # In sectors
-                    'mountpoint': mountpoint, # Mount relative to chroot
-                    'source_file': source_file, # partition contents
-                    'fstype': fstype, # Filesystem type
-                    'fsopts': fsopts, # Filesystem mount options
-                    'label': label, # Partition label
-                    'disk_name': disk_name, # physical disk name holding partition
-                    'device': None, # kpartx device node for partition
-                    'num': None, # Partition number
-                    'boot': boot, # Bootable flag
-                    'align': align, # Partition alignment
-                    'no_table' : no_table, # Partition does not appear in partition table
-                    'part_type' : part_type, # Partition type
-                    'uuid': uuid} # Partition UUID
-
-            self.__add_partition(part)
+        part = {'ks_pnum': ks_pnum, # Partition number in the KS file
+                'size': size, # In sectors
+                'mountpoint': mountpoint, # Mount relative to chroot
+                'source_file': source_file, # partition contents
+                'fstype': fstype, # Filesystem type
+                'fsopts': fsopts, # Filesystem mount options
+                'label': label, # Partition label
+                'disk_name': disk_name, # physical disk name holding partition
+                'device': None, # kpartx device node for partition
+                'num': None, # Partition number
+                'boot': boot, # Bootable flag
+                'align': align, # Partition alignment
+                'no_table' : no_table, # Partition does not appear in partition table
+                'part_type' : part_type, # Partition type
+                'uuid': uuid} # Partition UUID
+
+        self.__add_partition(part)
 
     def layout_partitions(self, ptable_format="msdos"):
         """ Layout the partitions, meaning calculate the position of every
-- 
2.1.4


