Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9BD876167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jul 2015 12:54:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 21 Jul 2015 05:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,516,1432623600"; d="scan'208";a="527692846"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jul 2015 05:54:03 -0700
Received: from localhost.localdomain (unknown [10.237.112.249])
	by linux.intel.com (Postfix) with ESMTP id 4C5166A4083;
	Tue, 21 Jul 2015 05:53:20 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jul 2015 15:54:40 +0300
Message-Id: <1437483280-4333-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest: Fix imagefeature testcases not to interfere with testimage on AB
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
X-List-Received-Date: Tue, 21 Jul 2015 12:54:04 -0000

[YOCTO #8017] - selftest does not use pkill qemu
[YOCTO #7976] - tests do not touch .ssh/known_hosts
              - don't hardcode qemu IP
[YOCTO #8027] - use qemu nographic
Extra: removed unnecessary assert for bitbake and runCmd status

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 148 +++++++++++---------------------
 1 file changed, 48 insertions(+), 100 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index e0e424d..70ebbe4 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -2,13 +2,20 @@ from oeqa.selftest.base import oeSelfTest
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.utils.decorators import testcase
 import pexpect
-from os.path import expanduser, isfile
-from os import system
+from os.path import isfile
+from os import system, killpg
 import glob
+import signal
 
 
 class ImageFeatures(oeSelfTest):
 
+    test_user = 'tester'
+    root_user = 'root'
+    prompt = r'qemux86:\S+[$#]\s+'
+    ssh_cmd = "ssh {} -l {} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
+    get_ip_patt = r'\s+ip=(?P<qemu_ip>(\d+.){3}\d+)::'
+
     @testcase(1107)
     def test_non_root_user_can_connect_via_ssh_without_password(self):
         """
@@ -20,69 +27,45 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        test_user = 'tester'
-        root_user = 'root'
-        prompt = r'qemux86:\S+[$#]\s+'
-        tap_inf_ip = '192.168.7.2'
-
         features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh empty-root-password"\n'
         features += 'INHERIT += "extrausers"\n'
-        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(test_user, test_user)
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
 
         # Append 'features' to local.conf
         self.append_config(features)
 
         # Build a core-image-minimal
-        ret = bitbake('core-image-minimal')
-        self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
-
-        rm_ssh_keys_cmd = 'ssh-keygen -f "{}/.ssh/known_hosts" -R {}'.format(expanduser('~'), tap_inf_ip)
-        # Delete the ssh keys for 192.168.7.2 (qemu)
-        ret = runCmd(rm_ssh_keys_cmd)
-        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host.')
+        bitbake('core-image-minimal')
 
         # Boot qemu image
         proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
         try:
+            proc_qemu.expect(self.get_ip_patt, timeout=100)
+            qemu_ip = proc_qemu.match.group('qemu_ip')
             proc_qemu.expect('qemux86 login:', timeout=100)
         except:
-            system('pkill qemu')
-            proc_qemu.close()
+            killpg(proc_qemu.pid, signal.SIGTERM)
             self.fail('Failed to start qemu.')
 
         # Attempt to ssh with each user into qemu with empty password
-        for user in [root_user, test_user]:
-            proc_ssh = pexpect.spawn('ssh {} -l {}'.format(tap_inf_ip, user))
-            index = proc_ssh.expect(['Are you sure you want to continue connecting', prompt, pexpect.TIMEOUT, pexpect.EOF])
+        for user in [self.root_user, self.test_user]:
+            proc_ssh = pexpect.spawn(self.ssh_cmd.format(qemu_ip, user))
+            index = proc_ssh.expect([self.prompt, pexpect.TIMEOUT, pexpect.EOF])
             if index == 0:
-                proc_ssh.sendline('yes')
-                try:
-                    proc_ssh.expect(prompt)
-                except:
-                    system('pkill qemu')
-                    proc_qemu.close()
-                    proc_ssh.terminate()
-                    self.fail('Failed to ssh with {} user into qemu.'.format(user))
-            elif index == 1:
                 # user successfully logged in with empty password
                 pass
-            elif index == 2:
-                system('pkill qemu')
-                proc_qemu.close()
+            elif index == 1:
+                killpg(proc_qemu.pid, signal.SIGTERM)
                 proc_ssh.terminate()
                 self.fail('Failed to ssh with {} user into qemu (timeout).'.format(user))
             else:
-                system('pkill qemu')
-                proc_qemu.close()
+                killpg(proc_qemu.pid, signal.SIGTERM)
                 proc_ssh.terminate()
                 self.fail('Failed to ssh with {} user into qemu (eof).'.format(user))
+            proc_ssh.terminate()
 
         # Cleanup
-        system('pkill qemu')
-        proc_qemu.close()
-        proc_ssh.terminate()
-        ret = runCmd(rm_ssh_keys_cmd)
-        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host (at cleanup).')
+        killpg(proc_qemu.pid, signal.SIGTERM)
 
     @testcase(1115)
     def test_all_users_can_connect_via_ssh_without_password(self):
@@ -93,69 +76,46 @@ class ImageFeatures(oeSelfTest):
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
-        test_user = 'tester'
-        root_user = 'root'
-        prompt = r'qemux86:\S+[$#]\s+'
-        tap_inf_ip = '192.168.7.2'
 
         features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
-        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(test_user, test_user)
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
 
         # Append 'features' to local.conf
         self.append_config(features)
 
         # Build a core-image-minimal
-        ret = bitbake('core-image-minimal')
-        self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
-
-        rm_ssh_keys_cmd = 'ssh-keygen -f "{}/.ssh/known_hosts" -R {}'.format(expanduser('~'), tap_inf_ip)
-        # Delete the ssh keys for 192.168.7.2 (qemu)
-        ret = runCmd(rm_ssh_keys_cmd)
-        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host.')
+        bitbake('core-image-minimal')
 
         # Boot qemu image
         proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
         try:
+            proc_qemu.expect(self.get_ip_patt, timeout=100)
+            qemu_ip = proc_qemu.match.group('qemu_ip')
             proc_qemu.expect('qemux86 login:', timeout=100)
         except:
-            system('pkill qemu')
-            proc_qemu.close()
+            killpg(proc_qemu.pid, signal.SIGTERM)
             self.fail('Failed to start qemu.')
 
         # Attempt to ssh with each user into qemu with empty password
-        for user in [root_user, test_user]:
-            proc_ssh = pexpect.spawn('ssh {} -l {}'.format(tap_inf_ip, user))
-            index = proc_ssh.expect(['Are you sure you want to continue connecting', prompt, pexpect.TIMEOUT, pexpect.EOF])
+        for user in [self.root_user, self.test_user]:
+            proc_ssh = pexpect.spawn(self.ssh_cmd.format(qemu_ip, user))
+            index = proc_ssh.expect([self.prompt, pexpect.TIMEOUT, pexpect.EOF])
             if index == 0:
-                proc_ssh.sendline('yes')
-                try:
-                    proc_ssh.expect(prompt)
-                except:
-                    system('pkill qemu')
-                    proc_qemu.close()
-                    proc_ssh.terminate()
-                    self.fail('Failed to ssh with {} user into qemu.'.format(user))
-            elif index == 1:
                 # user successfully logged in with empty password
                 pass
-            elif index == 2:
-                system('pkill qemu')
-                proc_qemu.close()
+            elif index == 1:
+                killpg(proc_qemu.pid, signal.SIGTERM)
                 proc_ssh.terminate()
                 self.fail('Failed to ssh with {} user into qemu (timeout).'.format(user))
             else:
-                system('pkill qemu')
-                proc_qemu.close()
+                killpg(proc_qemu.pid, signal.SIGTERM)
                 proc_ssh.terminate()
                 self.fail('Failed to ssh with {} user into qemu (eof).'.format(user))
+            proc_ssh.terminate()
 
         # Cleanup
-        system('pkill qemu')
-        proc_qemu.close()
-        proc_ssh.terminate()
-        ret = runCmd(rm_ssh_keys_cmd)
-        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host (at cleanup).')
+        killpg(proc_qemu.pid, signal.SIGTERM)
 
     @testcase(1114)
     def test_rpm_version_4_support_on_image(self):
@@ -167,8 +127,6 @@ class ImageFeatures(oeSelfTest):
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
 
-        root_user = 'root'
-        prompt = '{}@qemux86:~# '.format(root_user)
         rpm_version = '4.11.2'
         features = 'IMAGE_INSTALL_append = " rpm"\n'
         features += 'PREFERRED_VERSION_rpm = "{}"\n'.format(rpm_version)
@@ -179,33 +137,28 @@ class ImageFeatures(oeSelfTest):
         self.append_config(features)
 
         # Build a core-image-minimal
-        ret = bitbake('core-image-minimal')
-        self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
+        bitbake('core-image-minimal')
 
         # Boot qemu image & get rpm version
         proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
         try:
             proc_qemu.expect('qemux86 login:', timeout=100)
-            proc_qemu.sendline(root_user)
-            proc_qemu.expect(prompt)
+            proc_qemu.sendline(self.root_user)
+            proc_qemu.expect(self.prompt)
             proc_qemu.sendline('rpm --version')
-            proc_qemu.expect(prompt)
+            proc_qemu.expect(self.prompt)
         except:
-            system('pkill qemu')
-            proc_qemu.close()
+            killpg(proc_qemu.pid, signal.SIGTERM)
             self.fail('Failed to boot qemu.')
 
         found_rpm_version = proc_qemu.before
 
         # Make sure the retrieved rpm version is the expected one
-        if rpm_version not in found_rpm_version:
-            system('pkill qemu')
-            proc_qemu.close()
-            self.fail('RPM version is not {}, found instead {}.'.format(rpm_version, found_rpm_version))
+        self.assertIn(rpm_version, found_rpm_version,
+                      'RPM version is not {}, found instead {}.'.format(rpm_version, found_rpm_version))
 
         # Cleanup (close qemu)
-        system('pkill qemu')
-        proc_qemu.close()
+        killpg(proc_qemu.pid, signal.SIGTERM)
 
     @testcase(1116)
     def test_clutter_image_can_be_built(self):
@@ -218,8 +171,7 @@ class ImageFeatures(oeSelfTest):
         """
 
         # Build a core-image-clutter
-        ret = bitbake('core-image-clutter')
-        self.assertEqual(0, ret.status, 'Failed to build core-image-clutter')
+        bitbake('core-image-clutter')
 
     @testcase(1117)
     def test_wayland_support_in_image(self):
@@ -239,8 +191,7 @@ class ImageFeatures(oeSelfTest):
         self.append_config(features)
 
         # Build a core-image-weston
-        ret = bitbake('core-image-weston')
-        self.assertEqual(0, ret.status, 'Failed to build a core-image-weston')
+        bitbake('core-image-weston')
 
 
 class Gummiboot(oeSelfTest):
@@ -263,8 +214,7 @@ class Gummiboot(oeSelfTest):
         self.add_command_to_tearDown('rm -rf ' + self.meta_intel_dir)
 
         # Clone meta-intel
-        ret = runCmd('git clone ' + meta_intel_repo + ' ' + self.meta_intel_dir)
-        self.assertEqual(0, ret.status, 'Failed to clone meta-intel.')
+        runCmd('git clone ' + meta_intel_repo + ' ' + self.meta_intel_dir)
 
         # Add meta-intel and meta-nuc layers in conf/bblayers.conf
         features = 'BBLAYERS += "' + self.meta_intel_dir + ' ' + meta_nuc_dir + '"'
@@ -278,8 +228,7 @@ class Gummiboot(oeSelfTest):
         # Run "bitbake syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal "
         # to build a nuc/efi gummiboot image
 
-        ret = bitbake('syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal')
-        self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
+        bitbake('syslinux syslinux-native parted-native dosfstools-native mtools-native core-image-minimal')
 
     @testcase(1101)
     def test_efi_gummiboot_images_can_be_build(self):
@@ -310,8 +259,7 @@ class Gummiboot(oeSelfTest):
 
         # Create efi/gummiboot installation images
         wic_create_cmd = 'wic create mkgummidisk -e core-image-minimal'
-        ret = runCmd(wic_create_cmd)
-        self.assertEqual(0, ret.status, 'Failed to create efi/gummiboot installation images.')
+        runCmd(wic_create_cmd)
 
         # Verify that a .direct file was created
         direct_file = '/var/tmp/wic/build/*.direct'
-- 
2.1.4


