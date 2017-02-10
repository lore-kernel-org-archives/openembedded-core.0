Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 80C1E71ABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 10 Feb 2017 07:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="932388918"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 10 Feb 2017 07:28:57 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0899D6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:55 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:46 +0200
Message-Id: <b7832606dc7f5ecd90ddfc3fe9fc9ea87e557cf7.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 10/13] wic: direct: set bootloader.source in the __init__
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:57 -0000

Moved setting of bootloader source from do_create method
to __init__ as it doesn't have anything to do with image
creation.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 18cd277..64a3368 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -87,6 +87,13 @@ class DirectPlugin(ImagerPlugin):
                     continue
                 part.realnum = realnum
 
+        # as a convenience, set source to the boot partition source
+        # instead of forcing it to be set via bootloader --source
+        for part in self.parts:
+            if not self.ks.bootloader.source and part.mountpoint == "/boot":
+                self.ks.bootloader.source = part.source
+                break
+
     def do_create(self):
         """
         Plugin entry point.
@@ -160,12 +167,6 @@ class DirectPlugin(ImagerPlugin):
         self._image = PartitionedImage(image_path, self.ptable_format,
                                        self.parts, self.native_sysroot)
 
-        for part in self.parts:
-            # as a convenience, set source to the boot partition source
-            # instead of forcing it to be set via bootloader --source
-            if not self.ks.bootloader.source and part.mountpoint == "/boot":
-                self.ks.bootloader.source = part.source
-
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for part in self.parts:
-- 
2.1.4


