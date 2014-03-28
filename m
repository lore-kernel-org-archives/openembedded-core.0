Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 02F4B6EBA5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:12:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2014 03:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,750,1389772800"; d="scan'208";a="482031623"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2014 03:12:13 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Mar 2014 12:10:44 +0200
Message-Id: <83b9c45128ab9213ef135e1aa3b1ee644890d975.1396000670.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1396000670.git.laurentiu.palcu@intel.com>
References: <cover.1396000670.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1396000670.git.laurentiu.palcu@intel.com>
References: <cover.1396000670.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] rootfs.py: add new cleanup method
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
X-List-Received-Date: Fri, 28 Mar 2014 10:12:14 -0000

This commit adds a new _cleanup() internal method that will be called at
the end of rootfs creation, so that each backend can delete various
files that were probably generated during rootfs postprocess execution,
etc.

[YOCTO #6049]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/rootfs.py |   25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0e6c8bc..3eac3c9 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -50,6 +50,15 @@ class Rootfs(object):
     def _handle_intercept_failure(self, failed_script):
         pass
 
+    """
+    The _cleanup() method should be used to clean-up stuff that we don't really
+    want to end up on target. For example, in the case of RPM, the DB locks.
+    The method is called, once, at the end of create() method.
+    """
+    @abstractmethod
+    def _cleanup(self):
+        pass
+
     def _exec_shell_cmd(self, cmd):
         fakerootcmd = self.d.getVar('FAKEROOT', True)
         if fakerootcmd is not None:
@@ -117,6 +126,8 @@ class Rootfs(object):
 
         self._generate_kernel_module_deps()
 
+        self._cleanup()
+
     def _uninstall_uneeded(self):
         if base_contains("IMAGE_FEATURES", "package-management",
                          True, False, self.d):
@@ -358,6 +369,13 @@ class RpmRootfs(Rootfs):
         for pkg in registered_pkgs.split():
             self.pm.save_rpmpostinst(pkg)
 
+    def _cleanup(self):
+        # during the execution of postprocess commands, rpm is called several
+        # times to get the files installed, dependencies, etc. This creates the
+        # __db.00* (Berkeley DB files that hold locks, rpm specific environment
+        # settings, etc.), that should not get into the final rootfs
+        self.pm.unlock_rpm_db()
+
 
 class DpkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir):
@@ -431,6 +449,9 @@ class DpkgRootfs(Rootfs):
     def _log_check(self):
         pass
 
+    def _cleanup(self):
+        pass
+
 
 class OpkgRootfs(Rootfs):
     def __init__(self, d, manifest_dir):
@@ -694,6 +715,10 @@ class OpkgRootfs(Rootfs):
     def _log_check(self):
         pass
 
+    def _cleanup(self):
+        pass
+
+
 def create_rootfs(d, manifest_dir=None):
     env_bkp = os.environ.copy()
 
-- 
1.7.9.5


