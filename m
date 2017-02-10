Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E06F71ABF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:29:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 07:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="1105690523"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2017 07:29:00 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 393216A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:59 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:49 +0200
Message-Id: <10d1f08f71a623ca6d45cf0ae1afa2e880591a09.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486738307.git.ed.bartosh@linux.intel.com>
References: <cover.1486738307.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 13/13] wic: direct: move creation of PartitionedImage to __init__
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
X-List-Received-Date: Fri, 10 Feb 2017 15:29:00 -0000

Moved creation of PartitionedImage object from DirectPlugin.create
method to init. It makes the code a bit more readable and logical.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index c517904..481d24d 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -81,6 +81,10 @@ class DirectPlugin(ImagerPlugin):
                 self.ks.bootloader.source = part.source
                 break
 
+        image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
+        self._image = PartitionedImage(image_path, self.ptable_format,
+                                       self.parts, self.native_sysroot)
+
     def do_create(self):
         """
         Plugin entry point.
@@ -150,10 +154,6 @@ class DirectPlugin(ImagerPlugin):
         filesystems from the artifacts directly and combine them into
         a partitioned image.
         """
-        image_path = self._full_path(self.workdir, self.parts[0].disk, "direct")
-        self._image = PartitionedImage(image_path, self.ptable_format,
-                                       self.parts, self.native_sysroot)
-
         fstab_path = self._write_fstab(self.rootfs_dir.get("ROOTFS_DIR"))
 
         for part in self.parts:
-- 
2.1.4


