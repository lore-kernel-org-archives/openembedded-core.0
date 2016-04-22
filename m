Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AF72A73199
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:52:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2016 04:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="964240714"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Apr 2016 04:52:54 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 89EE36A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:40:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 12:32:03 +0300
Message-Id: <073eb51b1ab98879b56b132f6fd639d24e299790.1461317156.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 5/6] wic: set partition system id
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
X-List-Received-Date: Fri, 22 Apr 2016 11:52:52 -0000

Used sfdisk to set partition system id if --system-id parameter
is used for a partition in wks file.

[YOCTO #9096]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/partitionedfs.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 9da4a7f..4170ec1 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -110,7 +110,8 @@ class Image(object):
                 'align': align, # Partition alignment
                 'no_table' : no_table, # Partition does not appear in partition table
                 'part_type' : part_type, # Partition type
-                'uuid': uuid} # Partition UUID
+                'uuid': uuid, # Partition UUID
+                'system_id': system_id} # Partition system id
 
         self.__add_partition(part)
 
@@ -310,6 +311,10 @@ class Image(object):
                 exec_native_cmd("parted -s %s set %d %s on" % \
                                 (disk['disk'].device, part['num'], flag_name),
                                 self.native_sysroot)
+            if part['system_id']:
+                exec_native_cmd("sfdisk --part-type %s %s %s" % \
+                                (disk['disk'].device, part['num'], part['system_id']),
+                                self.native_sysroot)
 
             # Parted defaults to enabling the lba flag for fat16 partitions,
             # which causes compatibility issues with some firmware (and really
-- 
2.1.4


