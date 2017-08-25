Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7602A784A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 20:13:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Aug 2017 13:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,426,1498546800"; d="scan'208";a="128303992"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2017 13:13:06 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 7B709580940
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:13:06 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Aug 2017 23:12:28 +0300
Message-Id: <d18a2dae1a705745dca2bff988fb1577add15f14.1503691753.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503691753.git.ed.bartosh@linux.intel.com>
References: <cover.1503691753.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 7/8] wic: always read image partitions
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
X-List-Received-Date: Fri, 25 Aug 2017 20:13:05 -0000

Got rid of lazy evaluation of self.partitions property.
It's not needed because partitions of the source image should
be always read.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 303f323..eafc6c7 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -254,12 +254,13 @@ class Disk:
         if not self.parted:
             raise WicError("Can't find executable parted")
 
+        self.partitions = self.get_partitions()
+
     def __del__(self):
         for path in self._partimages.values():
             os.unlink(path)
 
-    @property
-    def partitions(self):
+    def get_partitions(self):
         if self._partitions is None:
             self._partitions = OrderedDict()
             out = exec_cmd("%s -sm %s unit B print" % (self.parted, self.imagepath))
-- 
2.1.4


