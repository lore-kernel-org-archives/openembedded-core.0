Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF5677ECB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467657"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:31 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:27 -0500
Message-Id: <d987568424576773a4d856c75bd64acd53a50138.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 19/30] oeqa/selftest/cases: imagefeatures enable threaded runs
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Change to use wrapper methos from OESelfTestCase.
- Move tests that use runqemu to its own module because
  it needs tinfoil and run in the main thread.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/imagefeatures.py      | 78 +++-------------------
 meta/lib/oeqa/selftest/cases/imagefeatures_boot.py | 63 +++++++++++++++++
 2 files changed, 73 insertions(+), 68 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/imagefeatures_boot.py

diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 91d8e9b5017..7a8e00605b1 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -1,69 +1,11 @@
+import os
+
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.utils.sshcontrol import SSHControl
-import os
 
 class ImageFeatures(OESelftestTestCase):
-
-    test_user = 'tester'
-    root_user = 'root'
-
-    @OETestID(1107)
-    def test_non_root_user_can_connect_via_ssh_without_password(self):
-        """
-        Summary: Check if non root user can connect via ssh without password
-        Expected: 1. Connection to the image via ssh using root user without providing a password should be allowed.
-                  2. Connection to the image via ssh using tester user without providing a password should be allowed.
-        Product: oe-core
-        Author: Ionut Chisanovici <ionutx.chisanovici@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
-        features += 'INHERIT += "extrausers"\n'
-        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
-        self.write_config(features)
-
-        # Build a core-image-minimal
-        bitbake('core-image-minimal')
-
-        with runqemu("core-image-minimal") as qemu:
-            # Attempt to ssh with each user into qemu with empty password
-            for user in [self.root_user, self.test_user]:
-                ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
-                status, output = ssh.run("true")
-                self.assertEqual(status, 0, 'ssh to user %s failed with %s' % (user, output))
-
-    @OETestID(1115)
-    def test_all_users_can_connect_via_ssh_without_password(self):
-        """
-        Summary:     Check if all users can connect via ssh without password
-        Expected: 1. Connection to the image via ssh using root user without providing a password should NOT be allowed.
-                  2. Connection to the image via ssh using tester user without providing a password should be allowed.
-        Product:     oe-core
-        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
-        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
-        """
-
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
-        features += 'INHERIT += "extrausers"\n'
-        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
-        self.write_config(features)
-
-        # Build a core-image-minimal
-        bitbake('core-image-minimal')
-
-        with runqemu("core-image-minimal") as qemu:
-            # Attempt to ssh with each user into qemu with empty password
-            for user in [self.root_user, self.test_user]:
-                ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
-                status, output = ssh.run("true")
-                if user == 'root':
-                    self.assertNotEqual(status, 0, 'ssh to user root was allowed when it should not have been')
-                else:
-                    self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
-
+    _use_own_builddir = True
+    _main_thread = False
 
     @OETestID(1116)
     def test_clutter_image_can_be_built(self):
@@ -76,7 +18,7 @@ class ImageFeatures(OESelftestTestCase):
         """
 
         # Build a core-image-clutter
-        bitbake('core-image-clutter')
+        self.bitbake('core-image-clutter')
 
     @OETestID(1117)
     def test_wayland_support_in_image(self):
@@ -89,12 +31,12 @@ class ImageFeatures(OESelftestTestCase):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        distro_features = get_bb_var('DISTRO_FEATURES')
+        distro_features = self.get_bb_var('DISTRO_FEATURES')
         if not ('opengl' in distro_features and 'wayland' in distro_features):
             self.skipTest('neither opengl nor wayland present on DISTRO_FEATURES so core-image-weston cannot be built')
 
         # Build a core-image-weston
-        bitbake('core-image-weston')
+        self.bitbake('core-image-weston')
 
     @OETestID(1497)
     def test_bmap(self):
@@ -110,10 +52,10 @@ class ImageFeatures(OESelftestTestCase):
         self.write_config(features)
 
         image_name = 'core-image-minimal'
-        bitbake(image_name)
+        self.bitbake(image_name)
 
-        deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-        link_name = get_bb_var('IMAGE_LINK_NAME', image_name)
+        deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
+        link_name = self.get_bb_var('IMAGE_LINK_NAME', image_name)
         image_path = os.path.join(deploy_dir_image, "%s.ext4" % link_name)
         bmap_path = "%s.bmap" % image_path
 
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures_boot.py b/meta/lib/oeqa/selftest/cases/imagefeatures_boot.py
new file mode 100644
index 00000000000..2cdf4adee4f
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures_boot.py
@@ -0,0 +1,63 @@
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.utils.commands import runqemu
+from oeqa.utils.sshcontrol import SSHControl
+
+class ImageFeaturesBoot(OESelftestTestCase):
+    test_user = 'tester'
+    root_user = 'root'
+
+    @OETestID(1107)
+    def test_non_root_user_can_connect_via_ssh_without_password(self):
+        """
+        Summary: Check if non root user can connect via ssh without password
+        Expected: 1. Connection to the image via ssh using root user without providing a password should be allowed.
+                  2. Connection to the image via ssh using tester user without providing a password should be allowed.
+        Product: oe-core
+        Author: Ionut Chisanovici <ionutx.chisanovici@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
+        features += 'INHERIT += "extrausers"\n'
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
+        self.write_config(features)
+
+        # Build a core-image-minimal
+        self.bitbake('core-image-minimal')
+
+        with runqemu("core-image-minimal") as qemu:
+            # Attempt to ssh with each user into qemu with empty password
+            for user in [self.root_user, self.test_user]:
+                ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
+                status, output = ssh.run("true")
+                self.assertEqual(status, 0, 'ssh to user %s failed with %s' % (user, output))
+
+    @OETestID(1115)
+    def test_all_users_can_connect_via_ssh_without_password(self):
+        """
+        Summary:     Check if all users can connect via ssh without password
+        Expected: 1. Connection to the image via ssh using root user without providing a password should NOT be allowed.
+                  2. Connection to the image via ssh using tester user without providing a password should be allowed.
+        Product:     oe-core
+        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
+        features += 'INHERIT += "extrausers"\n'
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
+        self.write_config(features)
+
+        # Build a core-image-minimal
+        self.bitbake('core-image-minimal')
+
+        with runqemu("core-image-minimal") as qemu:
+            # Attempt to ssh with each user into qemu with empty password
+            for user in [self.root_user, self.test_user]:
+                ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
+                status, output = ssh.run("true")
+                if user == 'root':
+                    self.assertNotEqual(status, 0, 'ssh to user root was allowed when it should not have been')
+                else:
+                    self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
-- 
2.11.0


