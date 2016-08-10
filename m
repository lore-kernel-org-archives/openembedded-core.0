Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8DF6771D6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 20:40:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 10 Aug 2016 13:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,501,1464678000"; d="scan'208";a="863269514"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 13:40:15 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Aug 2016 13:03:16 -0700
Message-Id: <20160810200316.28446-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160810200316.28446-1-stephano.cetola@linux.intel.com>
References: <20160810200316.28446-1-stephano.cetola@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH V2] Allow for simultaneous do_rootfs tasks with rpm
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
X-List-Received-Date: Wed, 10 Aug 2016 20:40:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Give each rootfs its own RPM channel to use.  This puts the RPM metadata
in a private subdirectory of $WORKDIR, rather than living in DEPLOY_DIR
where other tasks may race with it.

This allows us to reduce the time that the rpm.lock is held to only the
time needed to hardlink the RPMs, allowing the majority of the rootfs
operation to run in parallel.

Also, this fixes the smart tests by generating an index for all packages
at the time of the test, rather than using the one provided by the
rootfs process.

Original credit for the enhancement should go to Steven Walter
stevenrwalter@gmail.com.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |  5 -----
 meta/lib/oe/package_manager.py  | 17 ++++++++++++++---
 meta/lib/oeqa/runtime/smart.py  | 41 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 54 insertions(+), 9 deletions(-)

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
index 47f6831..2802254 100644
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
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index c7a5753..c8ba433 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -1,5 +1,7 @@
 import unittest
 import re
+import oe
+import subprocess
 from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 from oeqa.utils.httpserver import HTTPService
@@ -53,9 +55,46 @@ class SmartBasicTest(SmartTest):
 class SmartRepoTest(SmartTest):
 
     @classmethod
+    def create_index(self, arg):
+        index_cmd = arg
+        try:
+            bb.note("Executing '%s' ..." % index_cmd)
+            result = subprocess.check_output(index_cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            return("Index creation command '%s' failed with return code %d:\n%s" %
+                    (e.cmd, e.returncode, e.output.decode("utf-8")))
+        if result:
+            bb.note(result)
+        return None
+
+    @classmethod
     def setUpClass(self):
         self.repolist = []
-        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True), oeRuntimeTest.tc.target.server_ip)
+
+        # Index RPMs
+        rpm_createrepo = bb.utils.which(os.getenv('PATH'), "createrepo")
+        index_cmds = []
+        rpm_dirs_found = False
+        archs = (oeRuntimeTest.tc.d.getVar('ALL_MULTILIB_PACKAGE_ARCHS', True) or "").replace('-', '_').split()
+        for arch in archs:
+            rpm_dir = os.path.join(oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM', True), arch)
+            idx_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR', True), 'rpm', arch)
+            db_path = os.path.join(oeRuntimeTest.tc.d.getVar('WORKDIR', True), 'rpmdb', arch)
+            if not os.path.isdir(rpm_dir):
+                continue
+            if os.path.exists(db_path):
+                bb.utils.remove(dbpath, True)
+            lockfilename = oeRuntimeTest.tc.d.getVar('DEPLOY_DIR_RPM', True) + "/rpm.lock"
+            lf = bb.utils.lockfile(lockfilename, False)
+            oe.path.copyhardlinktree(rpm_dir, idx_path)
+            bb.utils.unlockfile(lf)
+            index_cmds.append("%s --dbpath %s --update -q %s" % (rpm_createrepo, db_path, idx_path))
+            rpm_dirs_found = True
+         # Create repodata¬
+        result = oe.utils.multiprocess_exec(index_cmds, self.create_index)
+        if result:
+            bb.fatal('%s' % ('\n'.join(result)))
+        self.repo_server = HTTPService(oeRuntimeTest.tc.d.getVar('WORKDIR', True), oeRuntimeTest.tc.target.server_ip)
         self.repo_server.start()
 
     @classmethod
-- 
2.9.2


