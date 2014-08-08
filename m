Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C04D770ACD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 22:07:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2014 15:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,827,1400050800"; d="scan'208";a="555928483"
Received: from unknown (HELO localhost) ([10.255.12.19])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2014 15:07:15 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Aug 2014 17:05:57 -0500
Message-Id: <4ed56fdfa62946f41d86fb5c34c41772f04a5c21.1407533201.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
References: <116ccc6f7ce3e70924e3fae56b24ff9e0914bde2.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1407533201.git.tom.zanussi@linux.intel.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 32/35] wic: Rename MountError
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
X-List-Received-Date: Fri, 08 Aug 2014 22:07:17 -0000

wic doesn't mount anything, so can't have a mount error; rename it to
something more appropriate.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/imager/direct.py                 | 4 ++--
 scripts/lib/mic/plugins/source/bootimg-efi.py    | 2 +-
 scripts/lib/mic/plugins/source/bootimg-pcbios.py | 4 ++--
 scripts/lib/mic/utils/errors.py                  | 5 +----
 scripts/lib/mic/utils/partitionedfs.py           | 8 ++++----
 5 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/mic/imager/direct.py b/scripts/lib/mic/imager/direct.py
index a4f5691..2f2bd4e 100644
--- a/scripts/lib/mic/imager/direct.py
+++ b/scripts/lib/mic/imager/direct.py
@@ -32,7 +32,7 @@ import shutil
 from mic import kickstart, msger
 from mic.utils import fs_related, runner, misc
 from mic.utils.partitionedfs import Image
-from mic.utils.errors import CreatorError, MountError
+from mic.utils.errors import CreatorError, ImageError
 from mic.imager.baseimager import BaseImageCreator
 from mic.utils.oe.misc import *
 from mic.plugin import pluginmgr
@@ -358,6 +358,6 @@ class DirectImageCreator(BaseImageCreator):
         if not self.__image is None:
             try:
                 self.__image.cleanup()
-            except MountError, err:
+            except ImageError, err:
                 msger.warning("%s" % err)
 
diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
index e880358..5b1a533 100644
--- a/scripts/lib/mic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -77,7 +77,7 @@ class BootimgEFIPlugin(SourcePlugin):
         if cr._ptable_format == 'msdos':
             rootstr = rootdev
         else:
-            raise MountError("Unsupported partition table format found")
+            raise ImageError("Unsupported partition table format found")
 
         grubefi_conf += "linux %s root=%s rootwait %s\n" \
             % (kernel, rootstr, options)
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
index 53ed7c3..959cf41 100644
--- a/scripts/lib/mic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -62,7 +62,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         rc = runner.show(['dd', 'if=%s' % mbrfile,
                           'of=%s' % full_path, 'conv=notrunc'])
         if rc != 0:
-            raise MountError("Unable to set MBR to %s" % full_path)
+            raise ImageError("Unable to set MBR to %s" % full_path)
 
     @classmethod
     def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
@@ -107,7 +107,7 @@ class BootimgPcbiosPlugin(SourcePlugin):
         if cr._ptable_format == 'msdos':
             rootstr = rootdev
         else:
-            raise MountError("Unsupported partition table format found")
+            raise ImageError("Unsupported partition table format found")
 
         syslinux_conf += "APPEND label=boot root=%s %s\n" % (rootstr, options)
 
diff --git a/scripts/lib/mic/utils/errors.py b/scripts/lib/mic/utils/errors.py
index 38fda30..86e230a 100644
--- a/scripts/lib/mic/utils/errors.py
+++ b/scripts/lib/mic/utils/errors.py
@@ -40,11 +40,8 @@ class Usage(CreatorError):
             self.msg = str(self.msg)
         return self.keyword + self.msg + ', please use "--help" for more info'
 
-class Abort(CreatorError):
-    keyword = ''
-
 class KsError(CreatorError):
     keyword = '<kickstart>'
 
-class MountError(CreatorError):
+class ImageError(CreatorError):
     keyword = '<mount>'
diff --git a/scripts/lib/mic/utils/partitionedfs.py b/scripts/lib/mic/utils/partitionedfs.py
index f4ce4a9..68e4cab 100644
--- a/scripts/lib/mic/utils/partitionedfs.py
+++ b/scripts/lib/mic/utils/partitionedfs.py
@@ -22,7 +22,7 @@ import os
 
 from mic import msger
 from mic.utils import runner
-from mic.utils.errors import MountError
+from mic.utils.errors import ImageError
 from mic.utils.fs_related import *
 from mic.utils.oe.misc import *
 
@@ -121,7 +121,7 @@ class Image:
         msger.debug("Assigning %s partitions to disks" % ptable_format)
 
         if ptable_format not in ('msdos'):
-            raise MountError("Unknown partition table format '%s', supported " \
+            raise ImageError("Unknown partition table format '%s', supported " \
                              "formats are: 'msdos'" % ptable_format)
 
         if self._partitions_layed_out:
@@ -134,14 +134,14 @@ class Image:
             p = self.partitions[n]
 
             if not self.disks.has_key(p['disk_name']):
-                raise MountError("No disk %s for partition %s" \
+                raise ImageError("No disk %s for partition %s" \
                                  % (p['disk_name'], p['mountpoint']))
 
             if p['part_type']:
                 # The --part-type can also be implemented for MBR partitions,
                 # in which case it would map to the 1-byte "partition type"
                 # filed at offset 3 of the partition entry.
-                raise MountError("setting custom partition type is not " \
+                raise ImageError("setting custom partition type is not " \
                                  "implemented for msdos partitions")
 
             # Get the disk where the partition is located
-- 
1.8.3.1


