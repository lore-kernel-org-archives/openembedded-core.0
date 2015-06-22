Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DAD9475A0E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 09:29:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2015 02:29:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,658,1427785200"; d="scan'208";a="748037114"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2015 02:29:19 -0700
Received: from ubuntu-ws.rb.intel.com (ubuntu-ws.rb.intel.com [10.237.105.32])
	by linux.intel.com (Postfix) with ESMTP id A7ED46A4005;
	Mon, 22 Jun 2015 02:28:41 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 12:28:41 +0300
Message-Id: <1434965322-16583-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] oeqa/selftest: Added 3 new selftest testcases.
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
X-List-Received-Date: Mon, 22 Jun 2015 09:29:24 -0000

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 206 ++++++++++++++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/imagefeatures.py

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
new file mode 100644
index 0000000..f697956
--- /dev/null
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -0,0 +1,206 @@
+from oeqa.selftest.base import oeSelfTest
+from oeqa.utils.commands import runCmd, bitbake 
+from oeqa.utils.decorators import testcase
+import pexpect
+from os.path import expanduser
+from os import system
+
+class ImageFeatures(oeSelfTest):
+
+    @testcase(1107)
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
+        test_user = 'tester'
+        root_user = 'root'
+        prompt = r'qemux86:\S+[$#]\s+'
+        tap_inf_ip = '192.168.7.2'
+
+        features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh empty-root-password"\n'
+        features += 'INHERIT += "extrausers"\n'
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(test_user, test_user)
+
+        # Append 'features' to local.conf
+        self.append_config(features)
+
+        # Build a core-image-minimal
+        ret = bitbake('core-image-minimal')
+        self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
+
+        rm_ssh_keys_cmd = 'ssh-keygen -f "{}/.ssh/known_hosts" -R {}'.format(expanduser('~'), tap_inf_ip)
+        # Delete the ssh keys for 192.168.7.2 (qemu)
+        ret = runCmd(rm_ssh_keys_cmd)
+        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host.')
+
+        # Boot qemu image
+        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
+        try:
+            proc_qemu.expect('qemux86 login:', timeout=100)
+        except:
+            system('pkill qemu')
+            proc_qemu.close()
+            self.fail('Failed to start qemu.')
+
+        # Attempt to ssh with each user into qemu with empty password
+        for user in [root_user, test_user]:
+            proc_ssh = pexpect.spawn('ssh {} -l {}'.format(tap_inf_ip, user))
+            index = proc_ssh.expect(['Are you sure you want to continue connecting', prompt, pexpect.TIMEOUT, pexpect.EOF])
+            if index == 0:
+                proc_ssh.sendline('yes')
+                try:
+                    proc_ssh.expect(prompt)
+                except:
+                    system('pkill qemu')
+                    proc_qemu.close()
+                    proc_ssh.terminate()
+                    self.fail('Failed to ssh with {} user into qemu.'.format(user))
+            elif index == 1:
+                # user successfully logged in with empty password
+                pass
+            elif index == 2:
+                system('pkill qemu')
+                proc_qemu.close()
+                proc_ssh.terminate()
+                self.fail('Failed to ssh with {} user into qemu (timeout).'.format(user))
+            else:
+                system('pkill qemu')
+                proc_qemu.close()
+                proc_ssh.terminate()
+                self.fail('Failed to ssh with {} user into qemu (eof).'.format(user))
+
+        # Cleanup
+        system('pkill qemu')
+        proc_qemu.close()
+        proc_ssh.terminate()
+        ret = runCmd(rm_ssh_keys_cmd)
+        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host (at cleanup).')
+
+    @testcase(1115)
+    def test_all_users_can_connect_via_ssh_without_password(self):
+        """
+        Summary:     Check if all users can connect via ssh without password
+        Expected:    1. Connection to the image via ssh using root or tester user without providing a password should be allowed.
+        Product:     oe-core
+        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+        test_user = 'tester'
+        root_user = 'root'
+        prompt = r'qemux86:\S+[$#]\s+'
+        tap_inf_ip = '192.168.7.2'
+
+        features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh allow-empty-password"\n'
+        features += 'INHERIT += "extrausers"\n'
+        features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(test_user, test_user)
+
+        # Append 'features' to local.conf
+        self.append_config(features)
+
+        # Build a core-image-minimal
+        ret = bitbake('core-image-minimal')
+        self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
+
+        rm_ssh_keys_cmd = 'ssh-keygen -f "{}/.ssh/known_hosts" -R {}'.format(expanduser('~'), tap_inf_ip)
+        # Delete the ssh keys for 192.168.7.2 (qemu)
+        ret = runCmd(rm_ssh_keys_cmd)
+        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host.')
+
+        # Boot qemu image
+        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
+        try:
+            proc_qemu.expect('qemux86 login:', timeout=100)
+        except:
+            system('pkill qemu')
+            proc_qemu.close()
+            self.fail('Failed to start qemu.')
+
+        # Attempt to ssh with each user into qemu with empty password
+        for user in [root_user, test_user]:
+            proc_ssh = pexpect.spawn('ssh {} -l {}'.format(tap_inf_ip, user))
+            index = proc_ssh.expect(['Are you sure you want to continue connecting', prompt, pexpect.TIMEOUT, pexpect.EOF])
+            if index == 0:
+                proc_ssh.sendline('yes')
+                try:
+                    proc_ssh.expect(prompt)
+                except:
+                    system('pkill qemu')
+                    proc_qemu.close()
+                    proc_ssh.terminate()
+                    self.fail('Failed to ssh with {} user into qemu.'.format(user))
+            elif index == 1:
+                # user successfully logged in with empty password
+                pass
+            elif index == 2:
+                system('pkill qemu')
+                proc_qemu.close()
+                proc_ssh.terminate()
+                self.fail('Failed to ssh with {} user into qemu (timeout).'.format(user))
+            else:
+                system('pkill qemu')
+                proc_qemu.close()
+                proc_ssh.terminate()
+                self.fail('Failed to ssh with {} user into qemu (eof).'.format(user))
+
+        # Cleanup
+        system('pkill qemu')
+        proc_qemu.close()
+        proc_ssh.terminate()
+        ret = runCmd(rm_ssh_keys_cmd)
+        self.assertEqual(0, ret.status, 'Failed to delete ssh keys for qemu host (at cleanup).')
+
+    @testcase(1114)
+    def test_rpm_version_4_support_on_image(self):
+        """
+        Summary:     Check rpm version 4 support on image
+        Expected:    Rpm version must be 4.11.2
+        Product:     oe-core
+        Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
+        AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
+        """
+
+        root_user = 'root'
+        prompt = '{}@qemux86:~# '.format(root_user)
+        rpm_version = '4.11.2'
+        features = 'IMAGE_INSTALL_append = " rpm"\n'
+        features += 'PREFERRED_VERSION_rpm = "{}"\n'.format(rpm_version)
+        features += 'PREFERRED_VERSION_rpm-native = "{}"\n'.format(rpm_version)
+        features += 'RPMROOTFSDEPENDS_remove = "rpmresolve-native:do_populate_sysroot"'
+
+        # Append 'features' to local.conf
+        self.append_config(features)
+
+        # Build a core-image-minimal
+        ret = bitbake('core-image-minimal')
+        self.assertEqual(0, ret.status, 'Failed to build a core-image-minimal')
+
+        # Boot qemu image & get rpm version
+        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
+        try:
+            proc_qemu.expect('qemux86 login:', timeout=100)
+            proc_qemu.sendline(root_user)
+            proc_qemu.expect(prompt)
+            proc_qemu.sendline('rpm --version')
+            proc_qemu.expect(prompt)
+        except:
+            system('pkill qemu')
+            proc_qemu.close()
+            self.fail('Failed to boot qemu.')
+
+        found_rpm_version = proc_qemu.before
+
+        # Make sure the retrieved rpm version is the expected one
+        if rpm_version not in found_rpm_version:
+            system('pkill qemu')
+            proc_qemu.close()
+            self.fail('RPM version is not {}, found instead {}.'.format(rpm_version, found_rpm_version))
+
+        # Cleanup (close qemu)
+        system('pkill qemu')
+        proc_qemu.close()
\ No newline at end of file
-- 
2.1.4


