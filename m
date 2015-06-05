Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 58C0875862
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:10:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 02:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="721242609"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jun 2015 02:10:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 1D9BA6A4083;
	Fri,  5 Jun 2015 02:10:23 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:17:08 +0300
Message-Id: <1433488636-4540-2-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 1/9] wic: Add --use-uuid partition option
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
X-List-Received-Date: Fri, 05 Jun 2015 09:10:57 -0000

Added --use-uuid option to the configuration of wks parser.
Processing of this option will be implemented in the following
commits.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 5d033bb..7d04738 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -51,6 +51,7 @@ class Wic_PartData(Mic_PartData):
         self.no_table = kwargs.get("no-table", False)
         self.extra_space = kwargs.get("extra-space", "10M")
         self.overhead_factor = kwargs.get("overhead-factor", 1.3)
+        self.use_uuid = kwargs.get("use-uuid", False)
         self.source_file = ""
         self.size = 0
 
@@ -65,6 +66,8 @@ class Wic_PartData(Mic_PartData):
                 retval += " --rootfs-dir=%s" % self.rootfs
         if self.no_table:
             retval += " --no-table"
+        if self.use_uuid:
+            retval += " --use-uuid"
         retval += " --extra-space=%d" % self.extra_space
         retval += " --overhead-factor=%f" % self.overhead_factor
 
@@ -561,4 +564,7 @@ class Wic_Partition(Mic_Partition):
         op.add_option("--overhead-factor", dest="overhead_factor",
                       action="callback", callback=overhead_cb, type="float",
                       nargs=1, default=1.3)
+        op.add_option("--use-uuid", dest="use_uuid", action="store_true",
+                      default=False)
+
         return op
-- 
2.1.4


