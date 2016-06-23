Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 914F660123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730815"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:06:59 +1200
Message-Id: <613446b1758d4f4a3c3821c8d14c24466096d764.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1466683248.git.paul.eggleton@linux.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 03/10] classes/image: implement progress support for do_rootfs
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:40 -0000

Use the new task progress functionality to report progress during
do_rootfs. This is a little coarse and ideally we would have some
progress within the installation section, but it's better than
nothing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass |  19 ++++++++-
 meta/lib/oe/rootfs.py      | 101 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 105 insertions(+), 15 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 61295f4..30dfd64 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -198,6 +198,17 @@ fakeroot python do_rootfs () {
     from oe.rootfs import create_rootfs
     from oe.manifest import create_manifest
 
+    # NOTE: if you add, remove or significantly refactor the stages of this
+    # process then you should recalculate the weightings here. This is quite
+    # easy to do - just change the MultiStageProgressReporter line temporarily
+    # to pass debug=True as the last parameter and you'll get a printout of
+    # the weightings as well as a map to the lines where next_stage() was
+    # called. Of course this isn't critical, but it helps to keep the progress
+    # reporting accurate.
+    stage_weights = [1, 203, 354, 186, 65, 4228, 1, 353, 49, 330, 382, 23, 1]
+    progress_reporter = bb.progress.MultiStageProgressReporter(d, stage_weights)
+    progress_reporter.next_stage()
+
     # Handle package exclusions
     excl_pkgs = d.getVar("PACKAGE_EXCLUDE", True).split()
     inst_pkgs = d.getVar("PACKAGE_INSTALL", True).split()
@@ -230,8 +241,12 @@ fakeroot python do_rootfs () {
     # Generate the initial manifest
     create_manifest(d)
 
-    # Generate rootfs
-    create_rootfs(d)
+    progress_reporter.next_stage()
+
+    # generate rootfs
+    create_rootfs(d, progress_reporter=progress_reporter)
+
+    progress_reporter.finish()
 }
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${S}"
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 1fc35bd..ed0bab1 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -15,11 +15,12 @@ class Rootfs(object, metaclass=ABCMeta):
     This is an abstract class. Do not instantiate this directly.
     """
 
-    def __init__(self, d):
+    def __init__(self, d, progress_reporter=None):
         self.d = d
         self.pm = None
         self.image_rootfs = self.d.getVar('IMAGE_ROOTFS', True)
         self.deploy_dir_image = self.d.getVar('DEPLOY_DIR_IMAGE', True)
+        self.progress_reporter = progress_reporter
 
         self.install_order = Manifest.INSTALL_ORDER
 
@@ -191,6 +192,9 @@ class Rootfs(object, metaclass=ABCMeta):
 
         execute_pre_post_process(self.d, pre_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         # call the package manager dependent create method
         self._create()
 
@@ -205,6 +209,9 @@ class Rootfs(object, metaclass=ABCMeta):
 
         execute_pre_post_process(self.d, post_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         if bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                          True, False, self.d):
             delayed_postinsts = self._get_delayed_postinsts()
@@ -218,6 +225,9 @@ class Rootfs(object, metaclass=ABCMeta):
 
         self._uninstall_unneeded()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self._insert_feed_uris()
 
         self._run_ldconfig()
@@ -228,6 +238,10 @@ class Rootfs(object, metaclass=ABCMeta):
         self._cleanup()
         self._log_check()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+
     def _uninstall_unneeded(self):
         # Remove unneeded init script symlinks
         delayed_postinsts = self._get_delayed_postinsts()
@@ -359,8 +373,8 @@ class Rootfs(object, metaclass=ABCMeta):
 
 
 class RpmRootfs(Rootfs):
-    def __init__(self, d, manifest_dir):
-        super(RpmRootfs, self).__init__(d)
+    def __init__(self, d, manifest_dir, progress_reporter=None):
+        super(RpmRootfs, self).__init__(d, progress_reporter)
         self.log_check_regex = '(unpacking of archive failed|Cannot find package'\
                                '|exit 1|ERROR: |Error: |Error |ERROR '\
                                '|Failed |Failed: |Failed$|Failed\(\d+\):)'
@@ -418,11 +432,17 @@ class RpmRootfs(Rootfs):
 
         execute_pre_post_process(self.d, rpm_pre_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self.pm.dump_all_available_pkgs()
 
         if self.inc_rpm_image_gen == "1":
             self._create_incremental(pkgs_to_install)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self.pm.update()
 
         pkgs = []
@@ -433,12 +453,24 @@ class RpmRootfs(Rootfs):
             else:
                 pkgs += pkgs_to_install[pkg_type]
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self.pm.install(pkgs)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self.pm.install(pkgs_attempt, True)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self.pm.install_complementary()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self._setup_dbg_rootfs(['/etc/rpm', '/var/lib/rpm', '/var/lib/smart'])
 
         execute_pre_post_process(self.d, rpm_post_process_cmds)
@@ -450,6 +482,10 @@ class RpmRootfs(Rootfs):
 
         self.pm.rpm_setup_smart_target_config()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+
     @staticmethod
     def _depends_list():
         return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
@@ -494,8 +530,8 @@ class RpmRootfs(Rootfs):
            bb.utils.remove(self.pm.install_dir_path, True)
 
 class DpkgOpkgRootfs(Rootfs):
-    def __init__(self, d):
-        super(DpkgOpkgRootfs, self).__init__(d)
+    def __init__(self, d, progress_reporter=None):
+        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter)
 
     def _get_pkgs_postinsts(self, status_file):
         def _get_pkg_depends_list(pkg_depends):
@@ -589,8 +625,8 @@ class DpkgOpkgRootfs(Rootfs):
             num += 1
 
 class DpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir):
-        super(DpkgRootfs, self).__init__(d)
+    def __init__(self, d, manifest_dir, progress_reporter=None):
+        super(DpkgRootfs, self).__init__(d, progress_reporter)
         self.log_check_regex = '^E:'
         self.log_check_expected_regexes = \
         [
@@ -618,15 +654,31 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         execute_pre_post_process(self.d, deb_pre_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+            # Don't support incremental, so skip that
+            self.progress_reporter.next_stage()
+
         self.pm.update()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         for pkg_type in self.install_order:
             if pkg_type in pkgs_to_install:
                 self.pm.install(pkgs_to_install[pkg_type],
                                 [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
+        if self.progress_reporter:
+            # Don't support attemptonly, so skip that
+            self.progress_reporter.next_stage()
+            self.progress_reporter.next_stage()
+
         self.pm.install_complementary()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self._setup_dbg_rootfs(['/var/lib/dpkg'])
 
         self.pm.fix_broken_dependencies()
@@ -637,6 +689,9 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         execute_pre_post_process(self.d, deb_post_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
     @staticmethod
     def _depends_list():
         return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
@@ -662,8 +717,8 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
 
 class OpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir):
-        super(OpkgRootfs, self).__init__(d)
+    def __init__(self, d, manifest_dir, progress_reporter=None):
+        super(OpkgRootfs, self).__init__(d, progress_reporter)
         self.log_check_regex = '(exit 1|Collected errors)'
 
         self.manifest = OpkgManifest(d, manifest_dir)
@@ -857,13 +912,24 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
         execute_pre_post_process(self.d, opkg_pre_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+            # Steps are a bit different in order, skip next
+            self.progress_reporter.next_stage()
+
         self.pm.update()
 
         self.pm.handle_bad_recommendations()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         if self.inc_opkg_image_gen == "1":
             self._remove_extra_packages(pkgs_to_install)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         for pkg_type in self.install_order:
             if pkg_type in pkgs_to_install:
                 # For multilib, we perform a sanity test before final install
@@ -875,8 +941,14 @@ class OpkgRootfs(DpkgOpkgRootfs):
                 self.pm.install(pkgs_to_install[pkg_type],
                                 [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self.pm.install_complementary()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self._setup_dbg_rootfs(['/etc', '/var/lib/opkg', '/usr/lib/ssl'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
@@ -884,6 +956,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if self.inc_opkg_image_gen == "1":
             self.pm.backup_packaging_data()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
     @staticmethod
     def _depends_list():
         return ['IPKGCONF_SDK', 'IPK_FEED_URIS', 'DEPLOY_DIR_IPK', 'IPKGCONF_TARGET', 'INC_IPK_IMAGE_GEN', 'OPKG_ARGS', 'OPKGLIBDIR', 'OPKG_PREPROCESS_COMMANDS', 'OPKG_POSTPROCESS_COMMANDS', 'OPKGLIBDIR']
@@ -919,16 +994,16 @@ def variable_depends(d, manifest_dir=None):
     cls = get_class_for_type(img_type)
     return cls._depends_list()
 
-def create_rootfs(d, manifest_dir=None):
+def create_rootfs(d, manifest_dir=None, progress_reporter=None):
     env_bkp = os.environ.copy()
 
     img_type = d.getVar('IMAGE_PKGTYPE', True)
     if img_type == "rpm":
-        RpmRootfs(d, manifest_dir).create()
+        RpmRootfs(d, manifest_dir, progress_reporter).create()
     elif img_type == "ipk":
-        OpkgRootfs(d, manifest_dir).create()
+        OpkgRootfs(d, manifest_dir, progress_reporter).create()
     elif img_type == "deb":
-        DpkgRootfs(d, manifest_dir).create()
+        DpkgRootfs(d, manifest_dir, progress_reporter).create()
 
     os.environ.clear()
     os.environ.update(env_bkp)
-- 
2.5.5


