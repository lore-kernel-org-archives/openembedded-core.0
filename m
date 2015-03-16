Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67D236013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 10:58:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 03:56:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680696065"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 03:58:12 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 409FA6A4090;
	Mon, 16 Mar 2015 03:57:53 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 12:57:55 +0200
Message-Id: <1426503475-20593-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Cc: Ed Bartosh <eduard.bartosh@intel.com>
Subject: [wic][PATCH] wic: Consider PSEUDO_* environment variables
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
X-List-Received-Date: Mon, 16 Mar 2015 10:58:12 -0000

Used default values of PSEUDO_* environment variables only
if variables are not set.

This allows to set custom PSEUDO_PREFIX and other pseudo
variables in order to use pseudo database from non-standard
locations.

Change-Id: I0bc1af5e521121d1f96d590cb6edb23cf0cb0b83
Signed-off-by: Ed Bartosh <eduard.bartosh@intel.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/kickstart/custom_commands/partition.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/wic/kickstart/custom_commands/partition.py b/scripts/lib/wic/kickstart/custom_commands/partition.py
index 4f5a1e5..f3d553b 100644
--- a/scripts/lib/wic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/partition.py
@@ -193,10 +193,15 @@ class Wic_PartData(Mic_PartData):
 
         Currently handles ext2/3/4, btrfs and vfat.
         """
-        pseudo = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
-        pseudo += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
-        pseudo += "export PSEUDO_PASSWD=%s;" % rootfs_dir
-        pseudo += "export PSEUDO_NOSYMLINKEXP=1;"
+        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
+        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
+                                         "%s/../pseudo" % rootfs_dir)
+        p_passwd = os.environ.get("PSEUDO_PASSWD", rootfs_dir)
+        p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
+        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
+        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
+        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
         pseudo += "%s/usr/bin/pseudo " % native_sysroot
 
         if self.fstype.startswith("ext"):
-- 
2.1.4


