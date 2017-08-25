Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A03937849A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:12:59 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 25 Aug 2017 13:13:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="122646782"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 25 Aug 2017 13:13:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 13AF158048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:12:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 23:12:22 +0300
Message-Id: <948a2fb6883875b2bfffc11a64b54f6d16d45152.1503691753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503691753.git.ed.bartosh@linux.intel.com>
References: <cover.1503691753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 1/8] wic: reimplement getting paths of used tools
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
X-List-Received-Date: Fri, 25 Aug 2017 20:12:59 -0000

So far every used tool have to have separate property and
private attribute in the Disk class. This is too verbose,
considering that there will be much more tools used.

Reimplemented getting tools paths using custom __getattr__
method. This is much more compact and readable.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 36 +++++++++---------------------------
 1 file changed, 9 insertions(+), 27 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 2dc2fd5..b23dd65 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -236,10 +236,6 @@ class Disk:
         self.imagepath = imagepath
         self.native_sysroot = native_sysroot
         self._partitions = None
-        self._mdir = None
-        self._mcopy = None
-        self._mdel = None
-        self._mdeltree = None
         self._partimages = {}
 
         # find parted
@@ -270,30 +266,16 @@ class Disk:
 
         return self._partitions
 
-    def _prop(self, name):
+    def __getattr__(self, name):
         """Get path to the executable in a lazy way."""
-        aname = "_%s" % name
-        if getattr(self, aname) is None:
-            setattr(self, aname, find_executable(name, self.paths))
-            if not getattr(self, aname):
-                raise WicError("Can't find executable {}".format(name))
-        return getattr(self, aname)
-
-    @property
-    def mdir(self):
-        return self._prop('mdir')
-
-    @property
-    def mcopy(self):
-        return self._prop("mcopy")
-
-    @property
-    def mdel(self):
-        return self._prop("mdel")
-
-    @property
-    def mdeltree(self):
-        return self._prop("mdeltree")
+        if name in ("mdir", "mcopy", "mdel", "mdeltree"):
+            aname = "_%s" % name
+            if aname not in self.__dict__:
+                setattr(self, aname, find_executable(name, self.paths))
+                if aname not in self.__dict__:
+                    raise WicError("Can't find executable {}".format(name))
+            return self.__dict__[aname]
+        return self.__dict__[name]
 
     def _get_part_image(self, pnum):
         if pnum not in self.partitions:
-- 
2.1.4


