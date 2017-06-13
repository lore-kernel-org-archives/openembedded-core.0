Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0645078320
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 13 Jun 2017 04:24:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1159868587"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2017 04:24:07 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 8BA595800CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:21:56 +0300
Message-Id: <bbe25ef92243abd9ca03caec896854e124cf95f7.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 08/26] engine: implement listing wic images
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:06 -0000

Implemented 'wic ls' functionality:
 - list image partitions
 - list directory content of vfat partitions

[YOCTO #11283]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 84 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index e58beb7..95c8d1c 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -30,10 +30,15 @@
 
 import logging
 import os
+import tempfile
+
+from collections import namedtuple, OrderedDict
+from distutils.spawn import find_executable
 
 from wic import WicError
+from wic.filemap import sparse_copy
 from wic.pluginbase import PluginMgr
-from wic.utils.misc import get_bitbake_var
+from wic.utils.misc import get_bitbake_var, exec_cmd
 
 logger = logging.getLogger('wic')
 
@@ -225,9 +230,84 @@ def wic_list(args, scripts_path):
 
     return False
 
+
+class Disk:
+    def __init__(self, imagepath, native_sysroot):
+        self.imagepath = imagepath
+        self.native_sysroot = native_sysroot
+        self._partitions = None
+        self._mdir = None
+        self._partimages = {}
+
+        # find parted
+        self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
+        if native_sysroot:
+            for path in self.paths.split(':'):
+                self.paths = "%s%s:%s" % (native_sysroot, path, self.paths)
+
+        self.parted = find_executable("parted", self.paths)
+        if not self.parted:
+            raise WicError("Can't find executable parted")
+
+    def __del__(self):
+        for path in self._partimages.values():
+            os.unlink(path)
+
+    @property
+    def partitions(self):
+        if self._partitions is None:
+            self._partitions = OrderedDict()
+            out = exec_cmd("%s -sm %s unit B print" % (self.parted, self.imagepath))
+            parttype = namedtuple("Part", "pnum start end size fstype")
+            for line in out.splitlines()[2:]:
+                pnum, start, end, size, fstype = line.split(':')[:5]
+                partition = parttype(pnum, int(start[:-1]), int(end[:-1]),
+                                     int(size[:-1]), fstype)
+                self._partitions[pnum] = partition
+
+        return self._partitions
+
+    @property
+    def mdir(self):
+        if self._mdir is None:
+            self._mdir = find_executable("mdir", self.paths)
+            if not self._mdir:
+                raise WicError("Can't find executable mdir")
+        return self._mdir
+
+    def _get_part_image(self, pnum):
+        if pnum not in self.partitions:
+            raise WicError("Partition %s is not in the image")
+        part = self.partitions[pnum]
+        if not part.fstype.startswith("fat"):
+            raise WicError("Not supported fstype: {}".format(part.fstype))
+        if pnum not in self._partimages:
+            tmpf = tempfile.NamedTemporaryFile(prefix="wic-part")
+            dst_fname = tmpf.name
+            tmpf.close()
+            sparse_copy(self.imagepath, dst_fname, skip=part.start, length=part.size)
+            self._partimages[pnum] = dst_fname
+
+        return self._partimages[pnum]
+
+    def dir(self, pnum, path):
+        return exec_cmd("{} -i {} ::{}".format(self.mdir,
+                                               self._get_part_image(pnum),
+                                               path))
+
 def wic_ls(args, native_sysroot):
     """List contents of partitioned image or vfat partition."""
-    pass
+    disk = Disk(args.path.image, native_sysroot)
+    if not args.path.part:
+        if disk.partitions:
+            print('Num     Start        End          Size      Fstype')
+            for part in disk.partitions.values():
+                print("{:2s}  {:12d} {:12d} {:12d}  {}".format(\
+                          part.pnum, part.start, part.end,
+                          part.size, part.fstype))
+    else:
+        path = args.path.path or '/'
+        print(disk.dir(args.path.part, path))
 
 def find_canned(scripts_path, file_name):
     """
-- 
2.1.4


