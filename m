Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EB3BB6E62F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 19:11:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 29 Jun 2015 12:11:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,371,1432623600"; d="scan'208";a="737099237"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2015 12:11:38 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id E1F416A4083;
	Mon, 29 Jun 2015 12:10:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 22:10:27 +0300
Message-Id: <1435605033-11509-15-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435605033-11509-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 14/20] wic: Fix naming conflict
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
X-List-Received-Date: Mon, 29 Jun 2015 19:11:37 -0000

Image file name is not unique for the partitions without label.
This causes image being rewritten and used as a source for all
partitions without label. Wic produces broken or incorrect result
images because of that.

Added wks line number to the image name to make it unique.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 72f617a..874b207 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -160,7 +160,8 @@ class Wic_PartData(Mic_PartData):
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
             elif self.fstype:
-                rootfs = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
+                rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, self.label,
+                                             self.lineno, self.fstype)
                 if os.path.isfile(rootfs):
                     os.remove(rootfs)
                 for prefix in ("ext", "btrfs", "vfat", "squashfs"):
@@ -227,7 +228,8 @@ class Wic_PartData(Mic_PartData):
         pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
         pseudo += "%s/usr/bin/pseudo " % native_sysroot
 
-        rootfs = "%s/rootfs_%s.%s" % (cr_workdir, self.label, self.fstype)
+        rootfs = "%s/rootfs_%s.%s.%s" % (cr_workdir, self.label,
+                                         self.lineno, self.fstype)
         if os.path.isfile(rootfs):
             os.remove(rootfs)
 
-- 
2.1.4


