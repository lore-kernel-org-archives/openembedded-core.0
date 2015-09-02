Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2D94777011
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 02 Sep 2015 04:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="796215062"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 02 Sep 2015 04:00:24 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id CF0EF6A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:32 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:08 +0300
Message-Id: <f8b30728c868e4fea00c27010e936ccbf073bdc4.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/17] wic: fix errors in partition.py module
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:24 -0000

Fixed the followring errors found by pylint in partition.py:

E: 42, 0: class already defined line 33 (function-redefined)
E:429,63: Undefined variable 'fs' (undefined-variable)
E:432,37: Undefined variable 'fs' (undefined-variable)
E:481, 0: class already defined line 33 (function-redefined)
E:488,22: Undefined variable 'OptionValueError' (undefined-variable)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index dd6edd2..6defc99 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -27,10 +27,10 @@
 import os
 import tempfile
 import uuid
+from optparse import OptionValueError
 
 from pykickstart.commands.partition import FC4_PartData, FC4_Partition
 from wic.utils.oe.misc import *
-from wic.kickstart.custom_commands import *
 from wic.plugin import pluginmgr
 
 partition_methods = {
@@ -426,10 +426,10 @@ class Wic_PartData(FC4_PartData):
         if self.label:
             label_str = "-n %s" % self.label
 
-        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, fs, blocks)
+        dosfs_cmd = "mkdosfs %s -S 512 -C %s %d" % (label_str, rootfs, blocks)
         exec_native_cmd(dosfs_cmd, native_sysroot)
 
-        chmod_cmd = "chmod 644 %s" % fs
+        chmod_cmd = "chmod 644 %s" % rootfs
         exec_cmd(chmod_cmd)
 
     def prepare_empty_partition_squashfs(self, cr_workdir, oe_builddir,
-- 
2.1.4


