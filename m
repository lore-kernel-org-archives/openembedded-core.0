Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 99F4F73175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 23:25:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2016 16:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,606,1455004800"; d="scan'208";a="700145814"
Received: from keanhoon-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.253])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2016 16:25:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 11:24:20 +1200
Message-Id: <546bcbb57854d40ab129cd0b979d3f1b05460d59.1462921503.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462921503.git.paul.eggleton@linux.intel.com>
References: <cover.1462921503.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 6/6] classes/image: implement progress support for do_rootfs
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
X-List-Received-Date: Tue, 10 May 2016 23:25:08 -0000

Use the new task progress functionality to report progress during
do_rootfs. I did some timings of the various parts of the do_rootfs code
and set some weightings accordingly. This is a little coarse and ideally
we would have some progress within the installation section, but it's
better than nothing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass |   9 +++-
 meta/lib/oe/rootfs.py      | 101 +++++++++++++++++++++++++++++++++++++++------
 2 files changed, 95 insertions(+), 15 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 4542e95..efa0629 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -198,6 +198,9 @@ fakeroot python do_rootfs () {
     from oe.rootfs import create_rootfs
     from oe.manifest import create_manifest
 
+    stage_weights = [0.01, 0.1, 0.18, 0.1, 0.03, 0.5, 0, 0.01, 0.02, 0.02, 0.02, 0.01, 0]
+    progress_reporter = bb.build.MultiStageProgressReporter(d, stage_weights)
+
     # Handle package exclusions
     excl_pkgs = d.getVar("PACKAGE_EXCLUDE", True).split()
     inst_pkgs = d.getVar("PACKAGE_INSTALL", True).split()
@@ -230,8 +233,10 @@ fakeroot python do_rootfs () {
     # Generate the initial manifest
     create_manifest(d)
 
-    # Generate rootfs
-    create_rootfs(d)
+    progress_reporter.next_stage()
+
+    # generate rootfs
+    create_rootfs(d, progress_reporter=progress_reporter)
 }
 do_rootfs[dirs] = "${TOPDIR}"
 do_rootfs[cleandirs] += "${S}"
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0546c1e..d143227 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -16,11 +16,12 @@ class Rootfs(object):
     """
     __metaclass__ = ABCMeta
 
-    def __init__(self, d):
+    def __init__(self, d, progress_reporter=None):
         self.d = d
         self.pm = None
         self.image_rootfs = self.d.getVar('IMAGE_ROOTFS', True)
         self.deploy_dir_image = self.d.getVar('DEPLOY_DIR_IMAGE', True)
+        self.progress_reporter = progress_reporter
 
         self.install_order = Manifest.INSTALL_ORDER
 
@@ -195,6 +196,9 @@ class Rootfs(object):
 
         execute_pre_post_process(self.d, pre_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         # call the package manager dependent create method
         self._create()
 
@@ -209,6 +213,9 @@ class Rootfs(object):
 
         execute_pre_post_process(self.d, post_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         if bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs",
                          True, False, self.d):
             delayed_postinsts = self._get_delayed_postinsts()
@@ -222,6 +229,9 @@ class Rootfs(object):
 
         self._uninstall_unneeded()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self._insert_feed_uris()
 
         self._run_ldconfig()
@@ -232,6 +242,10 @@ class Rootfs(object):
         self._cleanup()
         self._log_check()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+
     def _uninstall_unneeded(self):
         # Remove unneeded init script symlinks
         delayed_postinsts = self._get_delayed_postinsts()
@@ -363,8 +377,8 @@ class Rootfs(object):
 
 
 class RpmRootfs(Rootfs):
-    def __init__(self, d, manifest_dir):
-        super(RpmRootfs, self).__init__(d)
+    def __init__(self, d, manifest_dir, progress_reporter=None):
+        super(RpmRootfs, self).__init__(d, progress_reporter)
         self.log_check_regex = '(unpacking of archive failed|Cannot find package'\
                                '|exit 1|ERROR: |Error: |Error |ERROR '\
                                '|Failed |Failed: |Failed$|Failed\(\d+\):)'
@@ -422,11 +436,17 @@ class RpmRootfs(Rootfs):
 
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
@@ -437,12 +457,24 @@ class RpmRootfs(Rootfs):
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
@@ -454,6 +486,10 @@ class RpmRootfs(Rootfs):
 
         self.pm.rpm_setup_smart_target_config()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
+
     @staticmethod
     def _depends_list():
         return ['DEPLOY_DIR_RPM', 'INC_RPM_IMAGE_GEN', 'RPM_PREPROCESS_COMMANDS',
@@ -524,8 +560,8 @@ class RpmRootfs(Rootfs):
            bb.utils.remove(self.pm.install_dir_path, True)
 
 class DpkgOpkgRootfs(Rootfs):
-    def __init__(self, d):
-        super(DpkgOpkgRootfs, self).__init__(d)
+    def __init__(self, d, progress_reporter=None):
+        super(DpkgOpkgRootfs, self).__init__(d, progress_reporter)
 
     def _get_pkgs_postinsts(self, status_file):
         def _get_pkg_depends_list(pkg_depends):
@@ -619,8 +655,8 @@ class DpkgOpkgRootfs(Rootfs):
             num += 1
 
 class DpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir):
-        super(DpkgRootfs, self).__init__(d)
+    def __init__(self, d, manifest_dir, progress_reporter=None):
+        super(DpkgRootfs, self).__init__(d, progress_reporter)
         self.log_check_regex = '^E:'
         self.log_check_expected_errors_regexes = \
         [
@@ -648,15 +684,31 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
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
@@ -667,6 +719,9 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
         execute_pre_post_process(self.d, deb_post_process_cmds)
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
     @staticmethod
     def _depends_list():
         return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
@@ -692,8 +747,8 @@ class DpkgRootfs(DpkgOpkgRootfs):
 
 
 class OpkgRootfs(DpkgOpkgRootfs):
-    def __init__(self, d, manifest_dir):
-        super(OpkgRootfs, self).__init__(d)
+    def __init__(self, d, manifest_dir, progress_reporter=None):
+        super(OpkgRootfs, self).__init__(d, progress_reporter)
         self.log_check_regex = '(exit 1|Collected errors)'
 
         self.manifest = OpkgManifest(d, manifest_dir)
@@ -887,13 +942,24 @@ class OpkgRootfs(DpkgOpkgRootfs):
 
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
@@ -905,8 +971,14 @@ class OpkgRootfs(DpkgOpkgRootfs):
                 self.pm.install(pkgs_to_install[pkg_type],
                                 [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self.pm.install_complementary()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
         self._setup_dbg_rootfs(['/etc', '/var/lib/opkg'])
 
         execute_pre_post_process(self.d, opkg_post_process_cmds)
@@ -914,6 +986,9 @@ class OpkgRootfs(DpkgOpkgRootfs):
         if self.inc_opkg_image_gen == "1":
             self.pm.backup_packaging_data()
 
+        if self.progress_reporter:
+            self.progress_reporter.next_stage()
+
     @staticmethod
     def _depends_list():
         return ['IPKGCONF_SDK', 'IPK_FEED_URIS', 'DEPLOY_DIR_IPK', 'IPKGCONF_TARGET', 'INC_IPK_IMAGE_GEN', 'OPKG_ARGS', 'OPKGLIBDIR', 'OPKG_PREPROCESS_COMMANDS', 'OPKG_POSTPROCESS_COMMANDS', 'OPKGLIBDIR']
@@ -949,16 +1024,16 @@ def variable_depends(d, manifest_dir=None):
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


