Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B1A3475C90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 08:53:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2015 01:53:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,376,1432623600"; d="scan'208";a="516463023"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2015 01:53:04 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 429B06A4005;
	Tue, 30 Jun 2015 01:52:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jun 2015 11:51:46 +0300
Message-Id: <1435654312-18177-15-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1435654312-18177-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 14/20] wic: Fix naming conflict
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
X-List-Received-Date: Tue, 30 Jun 2015 08:53:05 -0000

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


