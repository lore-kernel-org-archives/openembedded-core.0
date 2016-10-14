Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 45C6171B84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:34 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705490"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:35 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:33 -0500
Message-Id: <928787e847df566ac17e3512b8478a7b609609c6.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 8/9] selftest: skip sstatetests methods considering distro and its features
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:34 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Some tests builds images that poky-tiny cannot build so skip those. Also,
bitbake world fails if distro does not contain opengl, so skip those
tests if opengl is not present. One other change was made into the sstate
module: rename self.distro to a better name (self.hostdistro)

[YOCTO #8525]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/sstate.py      | 10 +++---
 meta/lib/oeqa/selftest/sstatetests.py | 57 ++++++++++++++++++++++++++++++-----
 2 files changed, 54 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstate.py b/meta/lib/oeqa/selftest/sstate.py
index 5989724..d27a45c 100644
--- a/meta/lib/oeqa/selftest/sstate.py
+++ b/meta/lib/oeqa/selftest/sstate.py
@@ -14,8 +14,8 @@ class SStateBase(oeSelfTest):
     def setUpLocal(self):
         self.temp_sstate_location = None
         self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.distro = get_bb_var('NATIVELSBSTRING')
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
+        self.hostdistro = get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
 
     # Creates a special sstate configuration with the option to add sstate mirrors
     def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
@@ -27,8 +27,8 @@ class SStateBase(oeSelfTest):
             self.append_config(config_temp_sstate)
             self.track_for_cleanup(temp_sstate_path)
         self.sstate_path = get_bb_var('SSTATE_DIR')
-        self.distro = get_bb_var('NATIVELSBSTRING')
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.distro)
+        self.hostdistro = get_bb_var('NATIVELSBSTRING')
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
 
         if add_local_mirrors:
             config_set_sstate_if_not_set = 'SSTATE_MIRRORS ?= ""'
@@ -42,7 +42,7 @@ class SStateBase(oeSelfTest):
     def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
         result = []
         for root, dirs, files in os.walk(self.sstate_path):
-            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.distro, root):
+            if distro_specific and re.search("%s/[a-z0-9]{2}$" % self.hostdistro, root):
                 for f in files:
                     if re.search(filename_regex, f):
                         result.append(f)
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 6642539..8ea3932 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -42,20 +42,36 @@ class SStateTests(SStateBase):
     @testcase(975)
     def test_sstate_creation_distro_specific_pass(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+        # Execute the test in all distros expect poky-tiny where glibc-initial is not provided
+        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
+        if self.distro == 'poky-tiny':
+            self.skipTest('Distro %s does not support building the following targets %s' % (self.distro, ','.join(targets)))
+        self.run_test_sstate_creation(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
     @testcase(1374)
     def test_sstate_creation_distro_specific_fail(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_sstate_creation(['binutils-cross-'+ targetarch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
+        # Execute the test in all distros expect poky-tiny where glibc-initial is not provided
+        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
+        if self.distro == 'poky-tiny':
+            self.skipTest('Distro %s does not support building the following targets %s' % (self.distro, ','.join(targets)))
+        self.run_test_sstate_creation(targets, distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
 
     @testcase(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
-        self.run_test_sstate_creation(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        # Execute the test in all distros expect poky-tiny where glibc-initial is not provided
+        targets = ['glibc-initial']
+        if self.distro == 'poky-tiny':
+            self.skipTest('Distro %s does not support building the following targets %s' % (self.distro, ','.join(targets)))
+        self.run_test_sstate_creation(targets, distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
-        self.run_test_sstate_creation(['glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
+        # Execute the test in all distros expect poky-tiny where glibc-initial is not provided
+        targets = ['glibc-initial']
+        if self.distro == 'poky-tiny':
+            self.skipTest('Distro %s does not support building the following targets %s' % (self.distro, ','.join(targets)))
+        self.run_test_sstate_creation(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
 
     # Test the sstate files deletion part of the do_cleansstate task
@@ -78,17 +94,28 @@ class SStateTests(SStateBase):
     @testcase(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_cleansstate_task(['binutils-cross-' + targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
+        # Execute the test in all distros expect poky-tiny where glibc-initial is not provided
+        targets = ['binutils-cross-' + targetarch, 'binutils-native', 'glibc-initial']
+        if self.distro == 'poky-tiny':
+            self.skipTest('Distro %s does not support building the following targets %s' % (self.distro, ','.join(targets)))
+        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1376)
     def test_cleansstate_task_distro_nonspecific(self):
-        self.run_test_cleansstate_task(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        # Execute the test in all distros expect poky-tiny where glibc-initial is not provided
+        targets = ['glibc-initial']
+        if self.distro == 'poky-tiny':
+            self.skipTest('Distro %s does not support building the following targets %s' % (self.distro, ','.join(targets)))
+        self.run_test_cleansstate_task(targets, distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1377)
     def test_cleansstate_task_distro_specific(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
-
+        # Execute the test in all distros expect poky-tiny where glibc-initial is not provided
+        targets = ['binutils-cross-'+ targetarch, 'binutils-native', 'glibc-initial']
+        if self.distro == 'poky-tiny':
+            self.skipTest('Distro %s does not support building the following targets %s' % (self.distro, ','.join(targets)))
+        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
     # Test rebuilding of distro-specific sstate files
     def run_test_rebuild_distro_specific_sstate(self, targets, temp_sstate_location=True):
@@ -228,6 +255,8 @@ class SStateTests(SStateBase):
         build machines and running a builds, override the variables calling uname()
         manually and check using bitbake -S.
         """
+        if self.distro == 'poky-tiny':
+            self.skipTest('core-image-sato not buildable for poky-tiny')
 
         topdir = get_bb_var('TOPDIR')
         targetvendor = get_bb_var('TARGET_VENDOR')
@@ -276,6 +305,8 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
         detected. Rather than requiring two different build machines and running
         builds, override the variables manually and check using bitbake -S.
         """
+        if self.distro == 'poky-tiny':
+            self.skipTest('core-image-sato not buildable for poky-tiny')
 
         topdir = get_bb_var('TOPDIR')
         self.write_config("""
@@ -310,6 +341,8 @@ NATIVELSBSTRING = \"DistroB\"
         Also, rather than duplicate the test, check nativesdk stamps are the same between
         the two MACHINE values.
         """
+        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
+            self.skipTest('Distro %s does not include opengl feature, required to build intended (bitbake) targets' % self.distro)
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
@@ -328,6 +361,8 @@ MACHINE = \"qemuarm\"
         Also, rather than duplicate the test, check nativesdk stamps are the same between
         the two MACHINE values.
         """
+        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
+            self.skipTest('Distro %s does not include opengl feature, required to build intended (bitbake) targets' % self.distro)
 
         configA = """
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
@@ -387,6 +422,9 @@ MULTILIBS = \"\"
         qemux86copy machine to test this. Also include multilibs in the test.
         """
 
+        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
+            self.skipTest('Distro %s does not include opengl feature, required to build intended (bitbake) targets' % self.distro)
+
         topdir = get_bb_var('TOPDIR')
         targetos = get_bb_var('TARGET_OS')
         targetvendor = get_bb_var('TARGET_VENDOR')
@@ -433,6 +471,9 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
         classes inherits should be the same.
         """
 
+        if 'opengl' not in get_bb_var('DISTRO_FEATURES'):
+            self.skipTest('Distro %s does not include opengl feature, required to build intended (bitbake) targets' % self.distro)
+
         topdir = get_bb_var('TOPDIR')
         targetvendor = get_bb_var('TARGET_VENDOR')
         self.write_config("""
-- 
2.1.4


