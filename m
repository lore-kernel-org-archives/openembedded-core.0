Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 39D8F78493
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:13:01 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP; 25 Aug 2017 13:13:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="894141827"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Aug 2017 13:13:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 3D73958048D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:13:02 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 23:12:24 +0300
Message-Id: <fdbd8133efdb8117934d33824caad37b80f79fae.1503691753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503691753.git.ed.bartosh@linux.intel.com>
References: <cover.1503691753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 3/8] wic: convert partition number to int
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
X-List-Received-Date: Fri, 25 Aug 2017 20:13:01 -0000

Converted partition number to int in order to use
it as an index in the list of partitions.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index a965b8b..e169147 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -267,7 +267,7 @@ class Disk:
             self._psector_size = int(psector_size)
             for line in splitted[2:]:
                 pnum, start, end, size, fstype = line.split(':')[:5]
-                partition = parttype(pnum, int(start[:-1]), int(end[:-1]),
+                partition = parttype(int(pnum), int(start[:-1]), int(end[:-1]),
                                      int(size[:-1]), fstype)
                 self._partitions[pnum] = partition
 
@@ -341,7 +341,7 @@ def wic_ls(args, native_sysroot):
         if disk.partitions:
             print('Num     Start        End          Size      Fstype')
             for part in disk.partitions.values():
-                print("{:2s}  {:12d} {:12d} {:12d}  {}".format(\
+                print("{:2d}  {:12d} {:12d} {:12d}  {}".format(\
                           part.pnum, part.start, part.end,
                           part.size, part.fstype))
     else:
-- 
2.1.4


