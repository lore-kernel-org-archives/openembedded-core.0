Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C97073204
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 09:35:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 28 Apr 2016 02:35:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="93512132"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2016 02:35:16 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 0DB0A6A4007;
	Thu, 28 Apr 2016 03:22:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 10:14:53 +0300
Message-Id: <1461827697-16934-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1461827697-16934-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1461827697-16934-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/6] wic: get rid of inheritance Disk->DiskImage
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
X-List-Received-Date: Thu, 28 Apr 2016 09:35:17 -0000

There is no need in this inheritance as DiskImage class
is used only in one module and no other classes are inherited.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/fs_related.py | 43 ++++++++-----------------------------
 1 file changed, 9 insertions(+), 34 deletions(-)

diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index 2658dcf..22aa294 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -32,47 +32,22 @@ def makedirs(dirname):
         if err.errno != errno.EEXIST:
             raise
 
-class Disk:
-    """
-    Generic base object for a disk.
-    """
-    def __init__(self, size, device=None):
-        self._device = device
-        self._size = size
-
-    def create(self):
-        pass
-
-    def cleanup(self):
-        pass
-
-    def get_device(self):
-        return self._device
-    def set_device(self, path):
-        self._device = path
-    device = property(get_device, set_device)
-
-    def get_size(self):
-        return self._size
-    size = property(get_size)
-
-
-class DiskImage(Disk):
+class DiskImage():
     """
     A Disk backed by a file.
     """
-    def __init__(self, image_file, size):
-        Disk.__init__(self, size)
-        self.image_file = image_file
+    def __init__(self, device, size):
+        self.size = size
+        self.device = device
+        self.created = False
 
     def exists(self):
-        return os.path.exists(self.image_file)
+        return os.path.exists(self.device)
 
     def create(self):
-        if self.device is not None:
+        if self.created:
             return
         # create sparse disk image
-        cmd = "truncate %s -s %s" % (self.image_file, self.size)
+        cmd = "truncate %s -s %s" % (self.device, self.size)
         exec_cmd(cmd)
-
-        self.device = self.image_file
+        self.created = True
-- 
2.1.4


