Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E99D5771AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:23:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,490,1464678000"; d="scan'208";a="1037316022"
Received: from yocto-ab03.ostc.intel.com ([10.54.69.73])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2016 09:23:19 -0700
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 09:22:56 -0700
Message-Id: <a7de4d49eab029758f9b520ffad5f3a0fd641feb.1470671417.git.jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
In-Reply-To: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
References: <cover.1470671417.git.jose.a.lamego@linux.intel.com>
Subject: [PATCH 08/20] oeqa.selftest.imagefeatures: Split configuration from code
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
X-List-Received-Date: Mon, 08 Aug 2016 16:23:21 -0000

Improve oeqa-selftest capabilities and UX by placing
test configuration features and variables into a separate
configuration file.

[Yocto 9389]

Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
---
 meta/lib/oeqa/selftest/conf/imagefeatures.conf | 19 +++++++++
 meta/lib/oeqa/selftest/imagefeatures.py        | 55 +++++++++++++++++---------
 2 files changed, 56 insertions(+), 18 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/conf/imagefeatures.conf

diff --git a/meta/lib/oeqa/selftest/conf/imagefeatures.conf b/meta/lib/oeqa/selftest/conf/imagefeatures.conf
new file mode 100644
index 0000000..23e9dd5
--- /dev/null
+++ b/meta/lib/oeqa/selftest/conf/imagefeatures.conf
@@ -0,0 +1,19 @@
+[imagefeatures]
+test_user = tester
+root_user = root
+test_non_root_user_can_connect_via_ssh_without_password_features = 
+    'EXTRA_IMAGE_FEATURES = \ 
+     "ssh-server-openssh empty-root-password allow-empty-password"\n\
+     INHERIT += "extrausers"\n'
+test_non_root_user_can_connect_via_ssh_without_password_image = core-image-minimal
+test_all_users_can_connect_via_ssh_without_password_features = 
+    'EXTRA_IMAGE_FEATURES = \
+     "ssh-server-openssh allow-empty-password"\n\
+     INHERIT += "extrausers"\n'
+test_all_users_can_connect_via_ssh_without_password_image = core-image-minimal 
+test_wayland_support_in_image_features = 
+    'DISTRO_FEATURES_append = " wayland"\n\
+     CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
+test_wayland_support_in_image_image = core-image-weston
+test_bmap_features = IMAGE_FSTYPES += " ext4 ext4.bmap"
+test_bmap_image = core-image-minimal
diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 08e382f..654a020 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -5,11 +5,17 @@ from oeqa.utils.sshcontrol import SSHControl
 import os
 import sys
 import logging
+from oeqa.utils.readconfig import conffile
+
 
 class ImageFeatures(oeSelfTest):
 
-    test_user = 'tester'
-    root_user = 'root'
+    @classmethod
+    def setUpClass(cls):
+        # Get test configurations from configuration file
+        cls.config = conffile(__file__)
+        cls.test_user = cls.config.get('imagefeatures', 'test_user')
+        cls.root_user = cls.config.get('imagefeatures', 'root_user')
 
     @testcase(1107)
     def test_non_root_user_can_connect_via_ssh_without_password(self):
@@ -22,15 +28,22 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh empty-root-password allow-empty-password"\n'
-        features += 'INHERIT += "extrausers"\n'
-        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
+        features = eval(
+                 self.config.get(
+                     'imagefeatures',
+                     'test_non_root_user_can_connect_via_ssh_without_password_\
+features'))
+        image = self.config.get(
+              'imagefeatures',
+              'test_non_root_user_can_connect_via_ssh_without_password_image')
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s \
+/bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
 
         # Build a core-image-minimal
-        bitbake('core-image-minimal')
+        bitbake(image)
 
-        with runqemu("core-image-minimal") as qemu:
+        with runqemu(image) as qemu:
             # Attempt to ssh with each user into qemu with empty password
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
@@ -48,15 +61,19 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'EXTRA_IMAGE_FEATURES = "ssh-server-openssh allow-empty-password"\n'
-        features += 'INHERIT += "extrausers"\n'
-        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
+        features = eval(
+                 self.config.get('imagefeatures', 'test_all_users_can_connect_\
+via_ssh_without_password_features'))
+        image = self.config.get('imagefeatures',  'test_all_users_can_connect_\
+via_ssh_without_password_image')
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s \
+/bin/sh {};"'.format(self.test_user, self.test_user)
         self.write_config(features)
 
         # Build a core-image-minimal
-        bitbake('core-image-minimal')
+        bitbake(image)
 
-        with runqemu("core-image-minimal") as qemu:
+        with runqemu(image) as qemu:
             # Attempt to ssh with each user into qemu with empty password
             for user in [self.root_user, self.test_user]:
                 ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
@@ -66,7 +83,6 @@ class ImageFeatures(oeSelfTest):
                 else:
                     self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
 
-
     @testcase(1116)
     def test_clutter_image_can_be_built(self):
         """
@@ -91,12 +107,15 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        features = 'DISTRO_FEATURES_append = " wayland"\n'
-        features += 'CORE_IMAGE_EXTRA_INSTALL += "wayland weston"'
+        features = eval(self.config.get(
+                        'imagefeatures',
+                        'test_wayland_support_in_image_features'))
+        image = self.config.get(
+                    'imagefeatures', 'test_wayland_support_in_image_image')
         self.write_config(features)
 
         # Build a core-image-weston
-        bitbake('core-image-weston')
+        bitbake(image)
 
     def test_bmap(self):
         """
@@ -107,10 +126,10 @@ class ImageFeatures(oeSelfTest):
         Author:      Ed Bartosh <ed.bartosh@linux.intel.com>
         """
 
-        features = 'IMAGE_FSTYPES += " ext4 ext4.bmap"'
+        features = self.config.get('imagefeatures', 'test_bmap_features')
+        image_name = self.config.get('imagefeatures', 'test_bmap_image')
         self.write_config(features)
 
-        image_name = 'core-image-minimal'
         bitbake(image_name)
 
         deploy_dir = get_bb_var('DEPLOY_DIR_IMAGE')
-- 
1.8.3.1


