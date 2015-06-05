Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 72DEC7582E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:11:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 02:11:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="582586873"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 05 Jun 2015 02:11:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 89BE76A4083;
	Fri,  5 Jun 2015 02:10:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:17:12 +0300
Message-Id: <1433488636-4540-6-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 5/9] wic: Add parameter 'uuid' to Image.add_partition method
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
X-List-Received-Date: Fri, 05 Jun 2015 09:11:02 -0000

With this parameter it's possible to pass generated UUID
into Image class to set it for partition when it's created.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 36150c9..2290ecd 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -272,7 +272,8 @@ class DirectImageCreator(BaseImageCreator):
                                        boot=p.active,
                                        align=p.align,
                                        no_table=p.no_table,
-                                       part_type=p.part_type)
+                                       part_type=p.part_type,
+                                       uuid=p.uuid)
 
         self._restore_fstab(fstab)
 
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 902548f..a6e2e4f 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -86,7 +86,7 @@ class Image(object):
 
     def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
                       label=None, fsopts=None, boot=False, align=None, no_table=False,
-                      part_type=None):
+                      part_type=None, uuid=None):
         """ Add the next partition. Prtitions have to be added in the
         first-to-last order. """
 
@@ -110,7 +110,8 @@ class Image(object):
                     'boot': boot, # Bootable flag
                     'align': align, # Partition alignment
                     'no_table' : no_table, # Partition does not appear in partition table
-                    'part_type' : part_type} # Partition type
+                    'part_type' : part_type, # Partition type
+                    'uuid': uuid} # Partition UUID
 
             self.__add_partition(part)
 
-- 
2.1.4


