Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 79569771DC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316037"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:20 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:23:06 -0700
Message-Id: <094f92c9067fed889ee7b12acdcff1d43b8ff577.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 18/20] oeqa.selftest.sstatetests: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:24 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/sstatetests.conf |  25 +++++
 meta/lib/oeqa/selftest/sstatetests.py        | 162 ++++++++++++++++++---------
 2 files changed, 133 insertions(+), 54 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/sstatetests.conf

diff --git a/meta/lib/oeqa/selftest/conf/sstatetests.conf b/meta/lib/oeqa/selftest/conf/sstatetests.conf
new file mode 100644
index 0000000..23c87c4
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/sstatetests.conf
@@ -0,0 +1,25 @@
+[SStateTests]
+setUpClass_prefix = binutils-cross-
+setUpClass_recipe1 = binutils-native
+setUpClass_recipe2 = glibc-initial
+setupClass_recipe3 = m4
+setupClass_recipe4 = meta-toolchain
+setupClass_recipe5 = meta-environment
+setupClass_recipe6 = cross-canadian
+setUpClass_pattern = populate_lic
+setUpClass_machine1 = qemux86-64
+setupClass_machine2 = qemux86
+setupClass_machine3 = qemuarm
+setUpClass_machine4 = qemux86copy
+setUpClass_image = core-image-sato
+sstate_32_64_same_hash_features_1 = MACHINE = "qemux86"
+                                    BUILD_ARCH = "x86_64"
+                                    BUILD_OS = "linux"
+                                    SDKMACHINE = "x86_64"
+sstate_32_64_same_hash_features_2 = MACHINE = "qemux86"
+                                    BUILD_ARCH = "i686"
+                                    BUILD_OS = "linux"
+                                    SDKMACHINE = "i686"
+sstate_32_64_same_hash_arch2 = i686
+sstate_32_64_same_hash_arch1 = x86_64
+
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 07212ac..814c6d0 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -11,9 +11,29 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.selftest.sstate import SStateBase
 from oeqa.utils.decorators import testcase
+from oeqa.utils.readconfig import conffile
+
 
 class SStateTests(SStateBase):
 
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.prefix = cls.config.get('SStateTests', 'setUpClass_prefix')
+        cls.recipe1 = cls.config.get('SStateTests', 'setUpClass_recipe1')
+        cls.recipe2 = cls.config.get('SStateTests', 'setUpClass_recipe2')
+        cls.recipe3 = cls.config.get('SStateTests', 'setUpClass_recipe3')
+        cls.recipe4 = cls.config.get('SStateTests', 'setUpClass_recipe4')
+        cls.recipe5 = cls.config.get('SStateTests', 'setUpClass_recipe5')
+        cls.recipe6 = cls.config.get('SStateTests', 'setUpClass_recipe6')
+        cls.pattern = cls.config.get('SStateTests', 'setUpClass_pattern')
+        cls.machine1 = cls.config.get('SStateTests', 'setUpClass_machine1')
+        cls.machine2 = cls.config.get('SStateTests', 'setUpClass_machine2')
+        cls.machine3 = cls.config.get('SStateTests', 'setUpClass_machine3')
+        cls.machine4 = cls.config.get('SStateTests', 'setUpClass_machine4')
+        cls.image = cls.config.get('SStateTests', 'setUpClass_image')
+
     # Test sstate files creation and their location
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
         self.config_sstate(temp_sstate_location)
@@ -42,20 +62,29 @@ class SStateTests(SStateBase):
     @testcase(975)
     def test_sstate_creation_distro_specific_pass(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+        self.run_test_sstate_creation(
+            [self.prefix + targetarch, self.recipe1], distro_specific=True,
+            distro_nonspecific=False, temp_sstate_location=True)
 
     @testcase(1374)
     def test_sstate_creation_distro_specific_fail(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
+        self.run_test_sstate_creation(
+            [self.prefix + targetarch, self.recipe1],
+            distro_specific=False, distro_nonspecific=True,
+            temp_sstate_location=True, should_pass=False)
 
     @testcase(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
-        self.run_test_sstate_creation(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        self.run_test_sstate_creation(
+            [self.recipe2], distro_specific=False,
+            distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
-        self.run_test_sstate_creation(['glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
+        self.run_test_sstate_creation(
+            [self.recipe2], distro_specific=True, distro_nonspecific=False,
+            temp_sstate_location=True, should_pass=False)
 
 
     # Test the sstate files deletion part of the do_cleansstate task
@@ -78,16 +107,24 @@ class SStateTests(SStateBase):
     @testcase(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_cleansstate_task(['binutils-cross-' + targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
+        self.run_test_cleansstate_task(
+            [self.prefix + targetarch, self.recipe1, self.recipe2],
+            distro_specific=True, distro_nonspecific=True,
+            temp_sstate_location=True)
 
     @testcase(1376)
     def test_cleansstate_task_distro_nonspecific(self):
-        self.run_test_cleansstate_task(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        self.run_test_cleansstate_task(
+            [self.recipe2], distro_specific=False,
+            distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1377)
     def test_cleansstate_task_distro_specific(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+        self.run_test_cleansstate_task(
+            [self.prefix + targetarch, self.recipe1, self.recipe2],
+            distro_specific=True, distro_nonspecific=False,
+            temp_sstate_location=True)
 
 
     # Test rebuilding of distro-specific sstate files
@@ -125,16 +162,20 @@ class SStateTests(SStateBase):
     @testcase(175)
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch, 'binutils-native'], temp_sstate_location=True)
+        self.run_test_rebuild_distro_specific_sstate(
+            [self.prefix + targetarch, self.recipe1],
+            temp_sstate_location=True)
 
     @testcase(1372)
     def test_rebuild_distro_specific_sstate_cross_target(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + targetarch], temp_sstate_location=True)
+        self.run_test_rebuild_distro_specific_sstate(
+            [self.prefix + targetarch], temp_sstate_location=True)
 
     @testcase(1373)
     def test_rebuild_distro_specific_sstate_native_target(self):
-        self.run_test_rebuild_distro_specific_sstate(['binutils-native'], temp_sstate_location=True)
+        self.run_test_rebuild_distro_specific_sstate(
+            [self.recipe1], temp_sstate_location=True)
 
 
     # Test the sstate-cache-management script. Each element in the global_config list is used with the corresponding element in the target_config list
@@ -186,7 +227,9 @@ class SStateTests(SStateBase):
         target_config = []
         global_config.append('')
         target_config.append('PR = "0"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script(
+            self.recipe3, global_config,  target_config,
+            ignore_patterns=[self.pattern])
 
     @testcase(978)
     def test_sstate_cache_management_script_using_pr_2(self):
@@ -196,29 +239,35 @@ class SStateTests(SStateBase):
         target_config.append('PR = "0"')
         global_config.append('')
         target_config.append('PR = "1"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script(
+            self.recipe3, global_config,  target_config,
+            ignore_patterns=[self.pattern])
 
     @testcase(979)
     def test_sstate_cache_management_script_using_pr_3(self):
         global_config = []
         target_config = []
-        global_config.append('MACHINE = "qemux86-64"')
+        global_config.append('MACHINE = "%s"' % self.machine1)
         target_config.append('PR = "0"')
         global_config.append(global_config[0])
         target_config.append('PR = "1"')
-        global_config.append('MACHINE = "qemux86"')
+        global_config.append('MACHINE = "%s"' % self.machine2)
         target_config.append('PR = "1"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script(
+            self.recipe3, global_config,  target_config,
+            ignore_patterns=[self.pattern])
 
     @testcase(974)
     def test_sstate_cache_management_script_using_machine(self):
         global_config = []
         target_config = []
-        global_config.append('MACHINE = "qemux86-64"')
+        global_config.append('MACHINE = "%s"' % self.machine1)
         target_config.append('')
-        global_config.append('MACHINE = "qemux86"')
+        global_config.append('MACHINE = "%s"' % self.machine2)
         target_config.append('')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
+        self.run_test_sstate_cache_management_script(
+            self.recipe3, global_config, target_config,
+            ignore_patterns=[self.pattern])
 
     @testcase(1270)
     def test_sstate_32_64_same_hash(self):
@@ -231,29 +280,27 @@ class SStateTests(SStateBase):
 
         topdir = get_bb_var('TOPDIR')
         targetvendor = get_bb_var('TARGET_VENDOR')
-        self.write_config("""
-MACHINE = "qemux86"
-TMPDIR = "${TOPDIR}/tmp-sstatesamehash"
-BUILD_ARCH = "x86_64"
-BUILD_OS = "linux"
-SDKMACHINE = "x86_64"
-""")
+        features1 = self.config.get(
+                  'SStateTests', 'sstate_32_64_same_hash_features_1')
+        features2 = self.config.get(
+                  'SStateTests', 'sstate_32_64_same_hash_features_2')
+        arch1 = self.config.get(
+              'SStateTests', 'sstate_32_64_same_hash_arch1')
+        arch2 = self.config.get(
+              'SStateTests', 'sstate_32_64_same_hash_arch2')
+        features1 += '\nTMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"'
+        self.write_config(features1)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
-        self.write_config("""
-MACHINE = "qemux86"
-TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
-BUILD_ARCH = "i686"
-BUILD_OS = "linux"
-SDKMACHINE = "i686"
-""")
+        bitbake("%s -S none" % self.image)
+        features2 += '\nTMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"'
+        self.write_config(features2)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        bitbake("%s -S none" % self.image)
 
         def get_files(d):
             f = []
             for root, dirs, files in os.walk(d):
-                if "core-image-sato" in root:
+                if self.image in root:
                     # SDKMACHINE changing will change
                     # do_rootfs/do_testimage/do_build stamps of images which
                     # is safe to ignore.
@@ -262,7 +309,14 @@ SDKMACHINE = "i686"
             return f
         files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
-        files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash").replace("i686-linux", "x86_64-linux").replace("i686" + targetvendor + "-linux", "x86_64" + targetvendor + "-linux", ) for x in files2]
+        files2 = [x.replace("tmp-sstatesamehash2",
+                            "tmp-sstatesamehash").replace("%s-linux" % arch2,
+                  "%s-linux" % arch1).replace("%s" % arch2 +
+                                              targetvendor +
+                                              "-linux", "%s" % arch1 +
+                                              targetvendor +
+                                              "-linux", )
+                  for x in files2]
         self.maxDiff = None
         self.assertCountEqual(files1, files2)
 
@@ -281,13 +335,13 @@ TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 NATIVELSBSTRING = \"DistroA\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
+        bitbake("%s -S none" % self.image)
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 NATIVELSBSTRING = \"DistroB\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        bitbake("%s -S none" % self.image)
 
         def get_files(d):
             f = []
@@ -314,22 +368,22 @@ NATIVELSBSTRING = \"DistroB\"
         targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-MACHINE = \"qemux86\"
-""")
+MACHINE = \"%s\"
+""" % self.machine2)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("world meta-toolchain -S none")
+        bitbake("world %s -S none" % self.recipe4)
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-MACHINE = \"qemuarm\"
-""")
+MACHINE = \"%s\"
+""" % self.machine3)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("world meta-toolchain -S none")
+        bitbake("world %s -S none" % self.recipe4)
 
         def get_files(d):
             f = {}
             for root, dirs, files in os.walk(d):
                 for name in files:
-                    if "meta-environment" in root or "cross-canadian" in root:
+                    if self.recipe5 in root or self.recipe6 in root:
                         continue
                     if "do_build" not in name:
                         # 1.4.1+gitAUTOINC+302fca9f4c-r0.do_package_write_ipk.sigdata.f3a2a38697da743f0dbed8b56aafcf79
@@ -361,30 +415,30 @@ MACHINE = \"qemuarm\"
         targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
-MACHINE = \"qemux86\"
+MACHINE = \"%s\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
-""")
+""" % self.machine2)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         bitbake("world meta-toolchain -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
-MACHINE = \"qemux86copy\"
+MACHINE = \"%s\"
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
-""")
+""" % self.machine4)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("world meta-toolchain -S none")
+        bitbake("world %s -S none" % self.recipe4)
 
         def get_files(d):
             f = []
             for root, dirs, files in os.walk(d):
                 for name in files:
-                    if "meta-environment" in root or "cross-canadian" in root:
+                    if self.recipe5 in root or self.recipe6 in root:
                         continue
-                    if "qemux86copy-" in root or "qemux86-" in root:
+                    if "%s-" % self.machine4 in root or "%s-" % self.machine2 in root:
                         continue
                     if "do_build" not in name and "do_populate_sdk" not in name:
                         f.append(os.path.join(root, name))
@@ -416,7 +470,7 @@ http_proxy = ""
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
         self.track_for_cleanup(topdir + "/download1")
-        bitbake("world meta-toolchain -S none")
+        bitbake("world %s -S none" % self.recipe4)
         self.write_config("""
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
 BB_NUMBER_THREADS = "2"
@@ -431,7 +485,7 @@ http_proxy = "http://example.com/"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
         self.track_for_cleanup(topdir + "/download2")
-        bitbake("world meta-toolchain -S none")
+        bitbake("world %s -S none" % self.recipe4)
 
         def get_files(d):
             f = {}
-- 
1.8.3.1


