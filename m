Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7F37870A38
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Aug 2014 15:07:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="573937972"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by fmsmga001.fm.intel.com with ESMTP; 08 Aug 2014 15:07:14 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:56 -0500
Message-Id: <2ae324f76cb3e9d77363255677fcdad7e7c12cc2.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 31/35] wic: Rename PartitionedMount
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:14 -0000

It's actually a container for disks and partitions, and wic doesn't
mount anything, so rename it to match what it really is.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/direct.py                 | 15 +++++++--------
 scripts/lib/mic/plugins/imager/direct_plugin.py  |  1 -
 scripts/lib/mic/plugins/source/bootimg-efi.py    |  1 -
 scripts/lib/mic/plugins/source/bootimg-pcbios.py |  1 -
 scripts/lib/mic/plugins/source/rootfs.py         |  1 -
 scripts/lib/mic/utils/partitionedfs.py           |  8 +++++++-
 6 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index 17bfd01..a4f5691 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -31,7 +31,7 @@ import shutil
 
 from mic import kickstart, msger
 from mic.utils import fs_related, runner, misc
-from mic.utils.partitionedfs import PartitionedMount
+from mic.utils.partitionedfs import Image
 from mic.utils.errors import CreatorError, MountError
 from mic.imager.baseimager import BaseImageCreator
 from mic.utils.oe.misc import *
@@ -226,7 +226,7 @@ class DirectImageCreator(BaseImageCreator):
         """
         parts = self._get_parts()
 
-        self.__image = PartitionedMount()
+        self.__image = Image()
 
         for p in parts:
             # as a convenience, set source to the boot partition source
@@ -237,12 +237,11 @@ class DirectImageCreator(BaseImageCreator):
         for p in parts:
             # need to create the filesystems in order to get their
             # sizes before we can add them and do the layout.
-            # PartitionedMount.create() actually calls __format_disks()
-            # to create the disk images and carve out the partitions,
-            # then self.install() calls PartitionedMount.install()
-            # which calls __install_partitition() for each partition
-            # to dd the fs into the partitions.
-
+            # Image.create() actually calls __format_disks() to create
+            # the disk images and carve out the partitions, then
+            # self.assemble() calls Image.assemble() which calls
+            # __write_partitition() for each partition to dd the fs
+            # into the partitions.
             fstab = self.__write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
             p.prepare(self, self.workdir, self.oe_builddir, self.rootfs_dir,
diff --git a/scripts/lib/mic/plugins/imager/direct_plugin.py b/scripts/lib/mic/plugins/imager/direct_plugin.py
index ff30f09..c05a400 100644
--- a/scripts/lib/mic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/mic/plugins/imager/direct_plugin.py
@@ -34,7 +34,6 @@ from mic import msger
 from mic.utils import misc, fs_related, errors, runner, cmdln
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
-from mic.utils.partitionedfs import PartitionedMount
 
 import mic.imager.direct as direct
 from mic.pluginbase import ImagerPlugin
diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index d4a7771..e880358 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -33,7 +33,6 @@ from mic import kickstart, msger
 from mic.utils import misc, fs_related, errors, runner, cmdln
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
-from mic.utils.partitionedfs import PartitionedMount
 import mic.imager.direct as direct
 from mic.pluginbase import SourcePlugin
 from mic.utils.oe.misc import *
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
index 3434320..53ed7c3 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -33,7 +33,6 @@ from mic import kickstart, msger
 from mic.utils import misc, fs_related, errors, runner, cmdln
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
-from mic.utils.partitionedfs import PartitionedMount
 import mic.imager.direct as direct
 from mic.pluginbase import SourcePlugin
 from mic.utils.oe.misc import *
diff --git a/scripts/lib/mic/plugins/source/rootfs.py b/scripts/lib/mic/plugins/source/rootfs.py
index 8cb576d..8ebf62c 100644
--- a/scripts/lib/mic/plugins/source/rootfs.py
+++ b/scripts/lib/mic/plugins/source/rootfs.py
@@ -34,7 +34,6 @@ from mic import kickstart, msger
 from mic.utils import misc, fs_related, errors, runner, cmdln
 from mic.conf import configmgr
 from mic.plugin import pluginmgr
-from mic.utils.partitionedfs import PartitionedMount
 import mic.imager.direct as direct
 from mic.pluginbase import SourcePlugin
 from mic.utils.oe.misc import *
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index 2f950a6..f4ce4a9 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -32,7 +32,13 @@ MBR_OVERHEAD = 1
 # Size of a sector in bytes
 SECTOR_SIZE = 512
 
-class PartitionedMount:
+class Image:
+    """
+    Generic base object for an image.
+
+    An Image is a container for a set of DiskImages and associated
+    partitions.
+    """
     def __init__(self):
         self.disks = {}
         self.partitions = []
-- 
1.8.3.1


