Return-Path: <tom.zanussi@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id F06436C76F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 20:27:46 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Oct 2013 13:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,508,1378882800"; d="scan'208";a="375729126"
Received: from unknown (HELO localhost) ([10.255.15.157])
	by azsmga001.ch.intel.com with ESMTP; 16 Oct 2013 13:25:41 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 15:25:41 -0500
Message-Id: <fd09f894b40dadb8bc8b267a26dbf52e22a53d66.1381954954.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1381954954.git.tom.zanussi@linux.intel.com>
References: <cover.1381954954.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/1] wic: add pseudo to the populate-extfs step
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
X-List-Received-Date: Wed, 16 Oct 2013 20:27:47 -0000

Without this, files in the generated filesystem pick up the wrong
ownership.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/kickstart/custom_commands/partition.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/mic/kickstart/custom_commands/partition.py b/scripts/lib/mic/kickstart/custom_commands/partition.py
index 302cace..0eb0671 100644
--- a/scripts/lib/mic/kickstart/custom_commands/partition.py
+++ b/scripts/lib/mic/kickstart/custom_commands/partition.py
@@ -216,7 +216,14 @@ class Wic_PartData(Mic_PartData):
         """
         Prepare content for an ext2/3/4 rootfs partition.
         """
-        populate_script = "%s/usr/bin/populate-extfs.sh" % native_sysroot
+        populate_script = "export PSEUDO_PREFIX=%s/usr;" % native_sysroot
+        populate_script += "export PSEUDO_LOCALSTATEDIR=%s/../pseudo;" % rootfs_dir
+        populate_script += "export PSEUDO_PASSWD=%s;" % rootfs_dir
+        populate_script += "export PSEUDO_NOSYMLINKEXP=1;"
+        populate_script += "export PSEUDO_DISABLED=0;"
+        populate_script += "%s/usr/bin/pseudo %s/usr/bin/populate-extfs.sh" % \
+            (native_sysroot, native_sysroot)
+
         image_extra_space = 10240
 
         image_rootfs = rootfs_dir
-- 
1.7.11.4


