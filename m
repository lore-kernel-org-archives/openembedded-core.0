Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0634E6FF93
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 21:19:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 14 Jul 2016 14:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,364,1464678000"; d="scan'208";a="995483856"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga001.jf.intel.com with ESMTP; 14 Jul 2016 14:19:48 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jul 2016 14:20:37 -0700
Message-Id: <20160714212038.12385-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.0
Cc: Steven Walter <stevenrwalter@gmail.com>
Subject: [PATCH] Allow for simultaneous do_rootfs tasks with rpm
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
X-List-Received-Date: Thu, 14 Jul 2016 21:19:49 -0000

Give each rootfs its own RPM channel to use.  This puts the RPM metadata
in a private subdirectory of $WORKDIR, rather than living in DEPLOY_DIR
where other tasks may race with it.

This allows us to reduce the time that the rpm.lock is held to only the
time needed to hardlink the RPMs, allowing the majority of the rootfs
operation to run in parallel.

[ YOCTO #9255 ]

Signed-Off-By: Steven Walter <stevenrwalter@gmail.com>
Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |  5 -----
 meta/lib/oe/package_manager.py  | 17 ++++++++++++++---
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 38b3c99..37730a7 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -24,11 +24,6 @@ do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
 
-# RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
-# in ${DEPLOY_DIR_RPM}. This can be removed if package_update_index_rpm can be called concurrently
-do_rootfs[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
-do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
-
 python () {
     if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
         flags = d.getVarFlag('do_rootfs', 'recrdeptask', True)
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2004a42..8a08503 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -9,6 +9,7 @@ import collections
 import bb
 import tempfile
 import oe.utils
+import oe.path
 import string
 from oe.gpg_sign import get_signer
 
@@ -175,7 +176,7 @@ class RpmIndexer(Indexer):
             dbpath = os.path.join(self.d.getVar('WORKDIR', True), 'rpmdb', arch)
             if os.path.exists(dbpath):
                 bb.utils.remove(dbpath, True)
-            arch_dir = os.path.join(self.deploy_dir, arch)
+            arch_dir = os.path.join(self.d.getVar('WORKDIR', True), 'rpms', arch)
             if not os.path.isdir(arch_dir):
                 continue
 
@@ -1010,8 +1011,18 @@ class RpmPM(PackageManager):
         ch_already_added = []
         for canonical_arch in platform_extra:
             arch = canonical_arch.split('-')[0]
-            arch_channel = os.path.join(self.deploy_dir, arch)
-            if os.path.exists(arch_channel) and not arch in ch_already_added:
+            arch_channel = os.path.join(self.d.getVar('WORKDIR', True), 'rpms', arch)
+            oe.path.remove(arch_channel)
+            deploy_arch_dir = os.path.join(self.deploy_dir, arch)
+            if not os.path.exists(deploy_arch_dir):
+                    continue
+
+            lockfilename = self.d.getVar('DEPLOY_DIR_RPM', True) + "/rpm.lock"
+            lf = bb.utils.lockfile(lockfilename, False)
+            oe.path.copyhardlinktree(deploy_arch_dir, arch_channel)
+            bb.utils.unlockfile(lf)
+
+            if not arch in ch_already_added:
                 bb.note('Adding Smart channel %s (%s)' %
                         (arch, channel_priority))
                 self._invoke_smart('channel --add %s type=rpm-md baseurl=%s -y'
-- 
2.9.0


