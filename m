Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0679771C1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 25 Aug 2017 06:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="894048579"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2017 06:42:33 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E749E58048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:32 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:41 +0300
Message-Id: <129e7b1b38ae058752c628819576922d39c05de7.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 06/10] wic: added 'fstypes' parameter to Disk.__init__
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:32 -0000

This parameter specifies list of supported filesystems.
So far only 'fat' is supported, but 'wic write' is going
to support at least 'fat', 'ext' and 'swap'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 83e633d..a6ea362 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -232,9 +232,10 @@ def wic_list(args, scripts_path):
 
 
 class Disk:
-    def __init__(self, imagepath, native_sysroot):
+    def __init__(self, imagepath, native_sysroot, fstypes=('fat',)):
         self.imagepath = imagepath
         self.native_sysroot = native_sysroot
+        self.fstypes = fstypes
         self._partitions = None
         self._partimages = {}
         self._lsector_size = None
@@ -288,7 +289,11 @@ class Disk:
         if pnum not in self.partitions:
             raise WicError("Partition %s is not in the image")
         part = self.partitions[pnum]
-        if not part.fstype.startswith("fat"):
+        # check if fstype is supported
+        for fstype in self.fstypes:
+            if part.fstype.startswith(fstype):
+                break
+        else:
             raise WicError("Not supported fstype: {}".format(part.fstype))
         if pnum not in self._partimages:
             tmpf = tempfile.NamedTemporaryFile(prefix="wic-part")
-- 
2.1.4


