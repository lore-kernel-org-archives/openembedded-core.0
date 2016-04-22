Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2554A7318E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:52:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Apr 2016 04:52:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="937963197"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2016 04:52:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 6842D6A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:40:29 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 12:32:02 +0300
Message-Id: <12ee39c8487afa47b54066497d7b17f5abf956a7.1461317156.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461317156.git.ed.bartosh@linux.intel.com>
References: <cover.1461317156.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 4/6] wic: add system_id argument to Image.add_partition
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
X-List-Received-Date: Fri, 22 Apr 2016 11:52:53 -0000

Added new argument to add_partition call to pass partition
system id down the stack.

[YOCTO #9096]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py       | 3 ++-
 scripts/lib/wic/utils/partitionedfs.py | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index a1b4249..1937042 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -267,7 +267,8 @@ class DirectImageCreator(BaseImageCreator):
                                        align=part.align,
                                        no_table=part.no_table,
                                        part_type=part.part_type,
-                                       uuid=part.uuid)
+                                       uuid=part.uuid,
+                                       system_id=part.system_id)
 
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index ad596d2..9da4a7f 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -87,7 +87,7 @@ class Image(object):
 
     def add_partition(self, size, disk_name, mountpoint, source_file=None, fstype=None,
                       label=None, fsopts=None, boot=False, align=None, no_table=False,
-                      part_type=None, uuid=None):
+                      part_type=None, uuid=None, system_id=None):
         """ Add the next partition. Prtitions have to be added in the
         first-to-last order. """
 
-- 
2.1.4


