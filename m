Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 91F3F7723B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 20:34:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 23 Jan 2017 12:34:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,275,1477983600"; d="scan'208";a="1086413515"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2017 12:34:43 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 14:41:32 -0600
Message-Id: <d0a46721e1ce54b3446270dfc15ffa5e6fa896c7.1485203593.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485203593.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1485203593.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v4 2/2] selftest: sstatetests: skip glibc-initial tests in case of non-glibc distro
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
X-List-Received-Date: Mon, 23 Jan 2017 20:34:43 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Some distros uses non-glibc so skip those tests requiring glibc-initial as target

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/sstate.py      |  1 +
 meta/lib/oeqa/selftest/sstatetests.py | 25 +++++++++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

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
index 6642539..e3f819c 100644
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
-- 
2.1.4


