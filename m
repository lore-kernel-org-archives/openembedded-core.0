Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8E66AC15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jun 2015 12:11:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="596920011"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 29 Jun 2015 12:11:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 4EF1F6A4083;
	Mon, 29 Jun 2015 12:11:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:28 +0300
Message-Id: <1435605033-11509-16-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 15/20] wic: Add --uuid partition option
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:38 -0000

Added --uuid option to the configuration of wks parser.
This option specifies partition UUID. The code to process
it is already in place. It was implemented for --use-uuid
option.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index c8b2fab..0666d80 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -787,6 +787,11 @@ DESCRIPTION
                      random globally unique identifier (GUID) for the partition
                      and use it in bootloader configuration to specify root partition.
 
+         --uuid: This option is specific to wic. It specifies partition UUID.
+                 It's useful if preconfigured partition UUID is added to kernel command line
+                 in bootloader configuration before running wic. In this case .wks file can
+                 be generated or modified to set preconfigured parition UUID using this option.
+
     * bootloader
 
       This command allows the user to specify various bootloader
diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 874b207..fea4d6d 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -53,7 +53,7 @@ class Wic_PartData(Mic_PartData):
         self.extra_space = kwargs.get("extra-space", "10M")
         self.overhead_factor = kwargs.get("overhead-factor", 1.3)
         self._use_uuid = False
-        self.uuid = None
+        self.uuid = kwargs.get("uuid", None)
         self.use_uuid = kwargs.get("use-uuid", False)
         self.source_file = ""
         self.size = 0
@@ -71,6 +71,8 @@ class Wic_PartData(Mic_PartData):
             retval += " --no-table"
         if self.use_uuid:
             retval += " --use-uuid"
+        if self.uuid:
+            retval += " --uuid=%s" % self.uuid
         retval += " --extra-space=%s" % self.extra_space
         retval += " --overhead-factor=%f" % self.overhead_factor
 
@@ -491,5 +493,6 @@ class Wic_Partition(Mic_Partition):
                       nargs=1, default=1.3)
         op.add_option("--use-uuid", dest="use_uuid", action="store_true",
                       default=False)
+        op.add_option("--uuid")
 
         return op
-- 
2.1.4


