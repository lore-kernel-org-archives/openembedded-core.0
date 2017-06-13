Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBC27830A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 13 Jun 2017 04:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1181818476"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2017 04:24:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1A6F05800CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:11 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:22:01 +0300
Message-Id: <a5938592ab02cb8b67e46604bb2b116d3ca9c2ca.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 13/26] wic: add Disk._prop helper
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:11 -0000

Added generic helper to use in property methods to
access commands in a lazy manner.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index f8f2844..e3701c4 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -267,13 +267,18 @@ class Disk:
 
         return self._partitions
 
+    def _prop(self, name):
+        """Get path to the executable in a lazy way."""
+        aname = "_%s" % name
+        if getattr(self, aname) is None:
+            setattr(self, aname, find_executable(name, self.paths))
+            if not getattr(self, aname):
+                raise WicError("Can't find executable {}".format(name))
+        return getattr(self, aname)
+
     @property
     def mdir(self):
-        if self._mdir is None:
-            self._mdir = find_executable("mdir", self.paths)
-            if not self._mdir:
-                raise WicError("Can't find executable mdir")
-        return self._mdir
+        return self._prop('mdir')
 
     def _get_part_image(self, pnum):
         if pnum not in self.partitions:
-- 
2.1.4


