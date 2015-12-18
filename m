Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6F4731B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 15:09:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 18 Dec 2015 07:09:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="620213678"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2015 07:09:40 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 28EF06A408D;
	Fri, 18 Dec 2015 07:57:40 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 17:12:16 +0200
Message-Id: <1450451536-25571-2-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1450451536-25571-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1450451536-25571-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCHv4 2/2] selftest: Added MACHINE = "qemux86" to tests that use runqemu
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
X-List-Received-Date: Fri, 18 Dec 2015 15:09:42 -0000

It makes sense for tests that use runqemu to have MACHINE set as qemu.
This also avoid issues when running oe-selftest with --arch random/all
option.

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py       | 7 ++++---
 meta/lib/oeqa/selftest/imagefeatures.py | 9 ++++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 0a44ae7..84665e4 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -875,10 +875,11 @@ class DevtoolTests(DevtoolBase):
         # Additionally we are testing build-time functionality as well, so
         # really this has to be done as an oe-selftest test.
         #
+
+        features = 'MACHINE = "qemux86"\n'
+        self.write_config(features)
+
         # Check preconditions
-        machine = get_bb_var('MACHINE')
-        if not machine.startswith('qemu'):
-            self.skipTest('This test only works with qemu machines')
         if not os.path.exists('/etc/runqemu-nosudo'):
             self.skipTest('You must set up tap devices with scripts/runqemu-gen-tapdevs before running this test')
         result = runCmd('PATH="$PATH:/sbin:/usr/sbin" ip tuntap show', ignore_status=True)
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 4efb0d9..62ddc52 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -22,7 +22,8 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
+        features = 'MACHINE = "qemux86"\n'
+        features += 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
@@ -48,7 +49,8 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
+        features = 'MACHINE = "qemux86"\n'
+        features += 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
@@ -77,7 +79,8 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'PREFERRED_VERSION_rpm = "4.%"\n'
+        features = 'MACHINE = "qemux86"\n'
+        features += 'PREFERRED_VERSION_rpm = "4.%"\n'
         features += 'PREFERRED_VERSION_rpm-native = "4.%"\n'
         # Use openssh in IMAGE_INSTALL instead of ssh-server-openssh in EXTRA_IMAGE_FEATURES as a workaround for bug 8047
         features += 'IMAGE_INSTALL_append = " openssh"\n'
-- 
2.1.0


