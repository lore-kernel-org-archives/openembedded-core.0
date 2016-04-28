Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A84C3766E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:18:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2016 06:18:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="942094732"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2016 06:18:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 2037F6A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:05:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:58:07 +0300
Message-Id: <bbe78c9fdab6f40339b526acbabbd82b7c49cfce.1461834510.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1461834510.git.ed.bartosh@linux.intel.com>
References: <cover.1461834510.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 4/8] wic: moved DiskImage to direct.py
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
X-List-Received-Date: Thu, 28 Apr 2016 13:18:32 -0000

Moved DiskImage class from utils/fs_related.py to
imager/direct.py as it's only used there.

Removed fs_related module as it doesn't contain anything
except of DiskImage.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py    | 23 ++++++++++++++++++++--
 scripts/lib/wic/utils/fs_related.py | 39 -------------------------------------
 2 files changed, 21 insertions(+), 41 deletions(-)
 delete mode 100644 scripts/lib/wic/utils/fs_related.py

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index a1b4249..699f9a5 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -28,7 +28,6 @@ import os
 import shutil
 
 from wic import msger
-from wic.utils import fs_related
 from wic.utils.oe.misc import get_bitbake_var
 from wic.utils.partitionedfs import Image
 from wic.utils.errors import CreatorError, ImageError
@@ -40,6 +39,26 @@ disk_methods = {
     "do_install_disk":None,
 }
 
+class DiskImage():
+    """
+    A Disk backed by a file.
+    """
+    def __init__(self, device, size):
+        self.size = size
+        self.device = device
+        self.created = False
+
+    def exists(self):
+        return os.path.exists(self.device)
+
+    def create(self):
+        if self.created:
+            return
+        # create sparse disk image
+        cmd = "truncate %s -s %s" % (self.device, self.size)
+        exec_cmd(cmd)
+        self.created = True
+
 class DirectImageCreator(BaseImageCreator):
     """
     Installs a system into a file containing a partitioned disk image.
@@ -279,7 +298,7 @@ class DirectImageCreator(BaseImageCreator):
             full_path = self._full_path(self.__imgdir, disk_name, "direct")
             msger.debug("Adding disk %s as %s with size %s bytes" \
                         % (disk_name, full_path, disk['min_size']))
-            disk_obj = fs_related.DiskImage(full_path, disk['min_size'])
+            disk_obj = DiskImage(full_path, disk['min_size'])
             self.__disks[disk_name] = disk_obj
             self.__image.add_disk(disk_name, disk_obj)
 
diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
deleted file mode 100644
index fc3c174..0000000
--- a/scripts/lib/wic/utils/fs_related.py
+++ /dev/null
@@ -1,39 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2007, Red Hat, Inc.
-# Copyright (c) 2009, 2010, 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-from wic.utils.oe.misc import exec_cmd
-
-class DiskImage():
-    """
-    A Disk backed by a file.
-    """
-    def __init__(self, device, size):
-        self.size = size
-        self.device = device
-        self.created = False
-
-    def exists(self):
-        return os.path.exists(self.device)
-
-    def create(self):
-        if self.created:
-            return
-        # create sparse disk image
-        cmd = "truncate %s -s %s" % (self.device, self.size)
-        exec_cmd(cmd)
-        self.created = True
-- 
2.1.4


