Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DD97D71BA0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:39:29 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 09 Jan 2017 09:39:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="51794792"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2017 09:39:29 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:45:54 -0600
Message-Id: <aef76aaebfb78d7e724d695d6702d55a962992d1.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH V3 4/4] selftest: sstatetests: skip glibc-initial tests and use a more generic image
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
X-List-Received-Date: Mon, 09 Jan 2017 17:39:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are mainly two changes: 1) Some distros uses non-glibc so skip
those tests requiring glibc-initial as target 2) instead of using core-image-sato,
use a more generic image (core-image-minimal) for hash tests.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/sstate.py      |  1 +
 meta/lib/oeqa/selftest/sstatetests.py | 36 ++++++++++++++++++++++++-----------
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstate.py b/meta/lib/oeqa/selftest/sstate.py
index d27a45c..742f4d0 100644
--- a/meta/lib/oeqa/selftest/sstate.py
+++ b/meta/lib/oeqa/selftest/sstate.py
@@ -16,6 +16,7 @@ class SStateBase(oeSelfTest):
         self.sstate_path = get_bb_var('SSTATE_DIR')
         self.hostdistro = get_bb_var('NATIVELSBSTRING')
         self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
+        self.tclibc = get_bb_var('TCLIBC')
 
     # Creates a special sstate configuration with the option to add sstate mirrors
     def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 6642539..2f2b942 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -51,12 +51,15 @@ class SStateTests(SStateBase):
 
     @testcase(976)
     def test_sstate_creation_distro_nonspecific_pass(self):
-        self.run_test_sstate_creation(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        # glibc-initial is intended only for the glibc C library
+        if self.tclibc == 'glibc':
+            self.run_test_sstate_creation(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1375)
     def test_sstate_creation_distro_nonspecific_fail(self):
-        self.run_test_sstate_creation(['glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
-
+        # glibc-initial is intended only for the glibc C library
+        if self.tclibc == 'glibc':
+            self.run_test_sstate_creation(['glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
 
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
@@ -78,16 +81,26 @@ class SStateTests(SStateBase):
     @testcase(977)
     def test_cleansstate_task_distro_specific_nonspecific(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_cleansstate_task(['binutils-cross-' + targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
+        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
+        # glibc-initial is intended only for the glibc C library
+        if self.tclibc == 'glibc':
+            targets.append('glibc-initial')
+        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1376)
     def test_cleansstate_task_distro_nonspecific(self):
-        self.run_test_cleansstate_task(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+        # glibc-initial is intended only for the glibc C library
+        if self.tclibc == 'glibc':
+            self.run_test_cleansstate_task(['glibc-initial'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
 
     @testcase(1377)
     def test_cleansstate_task_distro_specific(self):
         targetarch = get_bb_var('TUNE_ARCH')
-        self.run_test_cleansstate_task(['binutils-cross-'+ targetarch, 'binutils-native', 'glibc-initial'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
+        # glibc-initial is intended only for the glibc C library
+        if self.tclibc == 'glibc':
+            targets.append('glibc-initial')
+        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
 
 
     # Test rebuilding of distro-specific sstate files
@@ -240,7 +253,7 @@ SDKMACHINE = "x86_64"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-minimal -S none")
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
@@ -250,16 +263,17 @@ SDKMACHINE = "i686"
 PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-minimal -S none")
 
         def get_files(d):
             f = []
             for root, dirs, files in os.walk(d):
-                if "core-image-sato" in root:
+                if "core-image-minimal" in root:
                     # SDKMACHINE changing will change
                     # do_rootfs/do_testimage/do_build stamps of images which
                     # is safe to ignore.
                     continue
+
                 f.extend(os.path.join(root, name) for name in files)
             return f
         files1 = get_files(topdir + "/tmp-sstatesamehash/stamps/")
@@ -283,13 +297,13 @@ TMPDIR = \"${TOPDIR}/tmp-sstatesamehash\"
 NATIVELSBSTRING = \"DistroA\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-minimal -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 NATIVELSBSTRING = \"DistroB\"
 """)
         self.track_for_cleanup(topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-minimal -S none")
 
         def get_files(d):
             f = []
-- 
2.1.4


