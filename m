Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B819265E14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 01:36:01 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2014 18:30:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,846,1400050800"; d="scan'208";a="557165635"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO localhost)
	([10.255.12.45])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2014 18:35:42 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 20:35:35 -0500
Message-Id: <e3fcfa6ac6fbbcf83a82a3e7a730f87626aea615.1407806939.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1407806939.git.tom.zanussi@linux.intel.com>
References: <cover.1407806939.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/7] wic: Add '--sourceparams' partition option
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
X-List-Received-Date: Tue, 12 Aug 2014 01:36:01 -0000

To go along with '--source' as a way to parameterize source plugins.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 24f523a..3920adb 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -47,6 +47,7 @@ class Wic_PartData(Mic_PartData):
         Mic_PartData.__init__(self, *args, **kwargs)
         self.deleteRemovedAttrs()
         self.source = kwargs.get("source", None)
+        self.sourceparams = kwargs.get("sourceparams", None)
         self.rootfs = kwargs.get("rootfs-dir", None)
         self.source_file = ""
         self.size = 0
@@ -56,6 +57,8 @@ class Wic_PartData(Mic_PartData):
 
         if self.source:
             retval += " --source=%s" % self.source
+            if self.sourceparams:
+                retval += " --sourceparams=%s" % self.sourceparams
             if self.rootfs:
                 retval += " --rootfs-dir=%s" % self.rootfs
 
@@ -490,6 +493,9 @@ class Wic_Partition(Mic_Partition):
         # and calculate partition size
         op.add_option("--source", type="string", action="store",
                       dest="source", default=None)
+        # comma-separated list of param=value pairs
+        op.add_option("--sourceparams", type="string", action="store",
+                      dest="sourceparams", default=None)
         # use specified rootfs path to fill the partition
         op.add_option("--rootfs-dir", type="string", action="store",
                       dest="rootfs", default=None)
-- 
1.8.3.1


