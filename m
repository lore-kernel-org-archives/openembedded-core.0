Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 35EB47849A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:13:02 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Aug 2017 13:13:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="142080542"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 25 Aug 2017 13:13:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4CA2E5808E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:13:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 23:12:25 +0300
Message-Id: <2586966a13979a973067f3cb76265607f01e8cb3.1503691753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503691753.git.ed.bartosh@linux.intel.com>
References: <cover.1503691753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 4/8] wic: added 'fstypes' parameter to Disk.__init__
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
X-List-Received-Date: Fri, 25 Aug 2017 20:13:03 -0000

This parameter specifies list of supported filesystems.
So far only 'fat' is supported, but 'wic write' is going
to support at least 'fat', 'ext' and 'swap'.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index e169147..9f2e87f 100644
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


