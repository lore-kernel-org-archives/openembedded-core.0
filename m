Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED75757B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:06:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 05 Jun 2015 02:06:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="721240974"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2015 02:06:21 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0E5286A4083;
	Fri,  5 Jun 2015 02:05:45 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:12:16 +0300
Message-Id: <1433488349-4178-3-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488349-4178-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 2/9] wic: generate random uuid for partition
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
X-List-Received-Date: Fri, 05 Jun 2015 09:06:19 -0000

'uuid' attribute of partition object is set to generated uuid
when --use-uuid option is used for partition in .wks file.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 7d04738..f3c5545 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -26,6 +26,7 @@
 
 import os
 import tempfile
+import uuid
 
 from pykickstart.commands.partition import *
 from wic.utils.oe.misc import *
@@ -51,6 +52,8 @@ class Wic_PartData(Mic_PartData):
         self.no_table = kwargs.get("no-table", False)
         self.extra_space = kwargs.get("extra-space", "10M")
         self.overhead_factor = kwargs.get("overhead-factor", 1.3)
+        self._use_uuid = False
+        self.uuid = None
         self.use_uuid = kwargs.get("use-uuid", False)
         self.source_file = ""
         self.size = 0
@@ -73,6 +76,16 @@ class Wic_PartData(Mic_PartData):
 
         return retval
 
+    @property
+    def use_uuid(self):
+        return self._use_uuid
+
+    @use_uuid.setter
+    def use_uuid(self, value):
+        self._use_uuid = value
+        if value and not self.uuid:
+            self.uuid = str(uuid.uuid4())
+
     def get_rootfs(self):
         """
         Acessor for rootfs dir
-- 
2.1.4


