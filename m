Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 707B078456
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:42:29 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 25 Aug 2017 06:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,425,1498546800"; d="scan'208";a="122556596"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 25 Aug 2017 06:42:31 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id C9B1558048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 06:42:30 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 16:41:39 +0300
Message-Id: <6247d44b8f9ddce6d53e7e4dcb7d1e665d2ff9f5.1503667857.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/10] wic: get more info from the 'parted print' output
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
X-List-Received-Date: Fri, 25 Aug 2017 13:42:30 -0000

Got partition type and sector sizes from the output
of 'parted print'. This info may be used in the implementation
of 'wic write' command.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index a030ca2..b8fd3ae 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -237,6 +237,9 @@ class Disk:
         self.native_sysroot = native_sysroot
         self._partitions = None
         self._partimages = {}
+        self._lsector_size = None
+        self._psector_size = None
+        self._ptable_format = None
 
         # find parted
         self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
@@ -258,7 +261,11 @@ class Disk:
             self._partitions = OrderedDict()
             out = exec_cmd("%s -sm %s unit B print" % (self.parted, self.imagepath))
             parttype = namedtuple("Part", "pnum start end size fstype")
-            for line in out.splitlines()[2:]:
+            splitted = out.splitlines()
+            lsector_size, psector_size, self._ptable_format = splitted[1].split(":")[3:6]
+            self._lsector_size = int(lsector_size)
+            self._psector_size = int(psector_size)
+            for line in splitted[2:]:
                 pnum, start, end, size, fstype = line.split(':')[:5]
                 partition = parttype(pnum, int(start[:-1]), int(end[:-1]),
                                      int(size[:-1]), fstype)
-- 
2.1.4


