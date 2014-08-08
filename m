Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CAB9370AA9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2014 15:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="555928268"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2014 15:06:54 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:51 -0500
Message-Id: <3d4bc2719a950e8da752adef0a89dd33eda1bd53.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 26/35] wic: Remove Mount object
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:24 -0000

It doesn't do anything we need, so remove it and fix up callers/base
classes.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/utils/fs_related.py    | 16 ----------------
 scripts/lib/mic/utils/partitionedfs.py |  4 +---
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/scripts/lib/mic/utils/fs_related.py b/scripts/lib/mic/utils/fs_related.py
index e6e362d..07a5ff9 100644
--- a/scripts/lib/mic/utils/fs_related.py
+++ b/scripts/lib/mic/utils/fs_related.py
@@ -112,19 +112,3 @@ class DiskImage(Disk):
         exec_cmd(dd_cmd)
 
         self.device = self.image_file
-
-
-class Mount:
-    """A generic base class to deal with mounting things."""
-    def __init__(self, mountdir):
-        self.mountdir = mountdir
-
-    def cleanup(self):
-        self.unmount()
-
-    def mount(self, options = None):
-        pass
-
-    def unmount(self):
-        pass
-
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index ef92125..50536b4 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -32,9 +32,8 @@ MBR_OVERHEAD = 1
 # Size of a sector in bytes
 SECTOR_SIZE = 512
 
-class PartitionedMount(Mount):
+class PartitionedMount:
     def __init__(self, mountdir):
-        Mount.__init__(self, mountdir)
         self.disks = {}
         self.partitions = []
         self.mountOrder = []
@@ -316,7 +315,6 @@ class PartitionedMount(Mount):
         self.unmountOrder.reverse()
 
     def cleanup(self):
-        Mount.cleanup(self)
         if self.disks:
             for dev in self.disks.keys():
                 d = self.disks[dev]
-- 
1.8.3.1


