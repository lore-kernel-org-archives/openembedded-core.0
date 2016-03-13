Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1B9FE6FF56
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 22:26:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 13 Mar 2016 15:26:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,333,1455004800"; d="scan'208";a="936207289"
Received: from tbcheng-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.252])
	by fmsmga002.fm.intel.com with ESMTP; 13 Mar 2016 15:26:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:25:56 +1300
Message-Id: <6a2a6f44d4692c15622db5bbe67fb5e34d0a2109.1457907892.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457907892.git.paul.eggleton@linux.intel.com>
References: <cover.1457907892.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457907892.git.paul.eggleton@linux.intel.com>
References: <cover.1457907892.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] Revert "selftest: Added MACHINE = "qemux86" to tests that use runqemu"
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
X-List-Received-Date: Sun, 13 Mar 2016 22:26:23 -0000

This is not the correct way to handle this - it significantly increases
the time taken to run oe-selftest anywhere MACHINE is set to some other
value (for example "qemux86-64"), because all of the artifacts for
qemux86 need to then be built as well when running the test. If we need
to skip these tests on non-QEMU machines, the devtool test already
demonstrates how to do that.

This reverts commit 169e1eaa4fc5ed03e2307b68686a7f5b1db37a36.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py       | 7 +++----
 meta/lib/oeqa/selftest/imagefeatures.py | 9 +++------
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index d41af2f..2e4b6da 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -979,11 +979,10 @@ class DevtoolTests(DevtoolBase):
         # Additionally we are testing build-time functionality as well, so
         # really this has to be done as an oe-selftest test.
         #
-
-        features = 'MACHINE = "qemux86"\n'
-        self.write_config(features)
-
         # Check preconditions
+        machine = get_bb_var('MACHINE')
+        if not machine.startswith('qemu'):
+            self.skipTest('This test only works with qemu machines')
         if not os.path.exists('/etc/runqemu-nosudo'):
             self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
         result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 1c08ce2..ac8c5ae 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -22,8 +22,7 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'MACHINE = "qemux86"\n'
-        features += 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
@@ -49,8 +48,7 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'MACHINE = "qemux86"\n'
-        features += 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
@@ -79,8 +77,7 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'MACHINE = "qemux86"\n'
-        features += 'PREFERRED_VERSION_rpm = "4.%"\n'
+        features = 'PREFERRED_VERSION_rpm = "4.%"\n'
         features += 'PREFERRED_VERSION_rpm-native = "4.%"\n'
         # Use openssh in IMAGE_INSTALL instead of ssh-server-openssh in EXTRA_IMAGE_FEATURES as a workaround for bug 8047
         features += 'IMAGE_INSTALL_append = " openssh"\n'
-- 
2.5.0


