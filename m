Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7105276330
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926391"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:04:02 +0100
Message-Id: <5c2a2d5d655ac603635f5e734befca13e87053b6.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1438001581.git.paul.eggleton@linux.intel.com>
References: <cover.1438001581.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/11] oeqa/selftest/imagefeatures: Use QemuTarget code
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:14 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Create a runqemu function which uses the QemuTarget() code from
oeqa.targetcontrol to setup the QEMU instance, with all of the added
robustness that that gives us. To do this, a datastore is needed for the
recipe in question (core-image-minimal) so we do the work needed to set
this up. We then use this runqemu function within the imagefeatures
tests instead of a hand-rolled implementation.

We can then use SSHControl to run the SSH tests rather than rolling our
own code to do that as an added bonus.

Fixed and extended by Paul Eggleton <paul.eggleton@linux.intel.com>.

Part of the fix for [YOCTO #7994].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/imagefeatures.py | 96 +++++++--------------------------
 meta/lib/oeqa/utils/commands.py         | 49 +++++++++++++++++
 2 files changed, 67 insertions(+), 78 deletions(-)

diff --git a/meta/lib/oeqa/selftest/imagefeatures.py b/meta/lib/oeqa/selftest/imagefeatures.py
index 1795b7b..d48435f 100644
--- a/meta/lib/oeqa/selftest/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/imagefeatures.py
@@ -1,20 +1,18 @@
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 from oeqa.utils.decorators import testcase
-import pexpect
+from oeqa.utils.sshcontrol import SSHControl
 from os.path import isfile
-from os import system, killpg
+from os import system
 import glob
-import signal
-
+import os
+import sys
+import logging
 
 class ImageFeatures(oeSelfTest):
 
     test_user = 'tester'
     root_user = 'root'
-    prompt = r'qemux86:\S+[$#]\s+'
-    ssh_cmd = "ssh {} -l {} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
-    get_ip_patt = r'\s+ip=(?P<qemu_ip>(\d+.){3}\d+)::'
 
     @testcase(1107)
     def test_non_root_user_can_connect_via_ssh_without_password(self):
@@ -37,41 +35,12 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        # Boot qemu image
-        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
-        try:
-            proc_qemu.expect(self.get_ip_patt, timeout=100)
-            qemu_ip = proc_qemu.match.group('qemu_ip')
-            proc_qemu.expect('qemux86 login:', timeout=100)
-        except Exception as e:
-            try:
-                killpg(proc_qemu.pid, signal.SIGTERM)
-            except:
-                pass
-            self.fail('Failed to start qemu: %s' % e)
-
-        # Attempt to ssh with each user into qemu with empty password
-        for user in [self.root_user, self.test_user]:
-            proc_ssh = pexpect.spawn(self.ssh_cmd.format(qemu_ip, user))
-            index = proc_ssh.expect([self.prompt, pexpect.TIMEOUT, pexpect.EOF])
-            if index == 0:
-                # user successfully logged in with empty password
-                pass
-            elif index == 1:
-                killpg(proc_qemu.pid, signal.SIGTERM)
-                proc_ssh.terminate()
-                self.fail('Failed to ssh with {} user into qemu (timeout).'.format(user))
-            else:
-                killpg(proc_qemu.pid, signal.SIGTERM)
-                proc_ssh.terminate()
-                self.fail('Failed to ssh with {} user into qemu (eof).'.format(user))
-            proc_ssh.terminate()
-
-        # Cleanup
-        try:
-            killpg(proc_qemu.pid, signal.SIGTERM)
-        except:
-            pass
+        with runqemu("core-image-minimal", self) as qemu:
+            # Attempt to ssh with each user into qemu with empty password
+            for user in [self.root_user, self.test_user]:
+                ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
+                status, output = ssh.run("true")
+                self.assertEqual(status, 0, 'ssh to user %s failed with %s' % (user, output))
 
     @testcase(1115)
     def test_all_users_can_connect_via_ssh_without_password(self):
@@ -82,7 +51,6 @@ class ImageFeatures(oeSelfTest):
         Author:      Ionut Chisanovici <ionutx.chisanovici@intel.com>
         AutomatedBy: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
         """
-
         features = 'EXTRA_IMAGE_FEATURES += "ssh-server-openssh allow-empty-password"\n'
         features += 'INHERIT += "extrausers"\n'
         features += 'EXTRA_USERS_PARAMS = "useradd -p \'\' {}; usermod -s /bin/sh {};"'.format(self.test_user, self.test_user)
@@ -93,41 +61,13 @@ class ImageFeatures(oeSelfTest):
         # Build a core-image-minimal
         bitbake('core-image-minimal')
 
-        # Boot qemu image
-        proc_qemu = pexpect.spawn('runqemu qemux86 nographic')
-        try:
-            proc_qemu.expect(self.get_ip_patt, timeout=100)
-            qemu_ip = proc_qemu.match.group('qemu_ip')
-            proc_qemu.expect('qemux86 login:', timeout=100)
-        except Exception as e:
-            try:
-                killpg(proc_qemu.pid, signal.SIGTERM)
-            except:
-                pass
-            self.fail('Failed to start qemu: %s' % e)
-
-        # Attempt to ssh with each user into qemu with empty password
-        for user in [self.root_user, self.test_user]:
-            proc_ssh = pexpect.spawn(self.ssh_cmd.format(qemu_ip, user))
-            index = proc_ssh.expect([self.prompt, pexpect.TIMEOUT, pexpect.EOF])
-            if index == 0:
-                # user successfully logged in with empty password
-                pass
-            elif index == 1:
-                killpg(proc_qemu.pid, signal.SIGTERM)
-                proc_ssh.terminate()
-                self.fail('Failed to ssh with {} user into qemu (timeout).'.format(user))
-            else:
-                killpg(proc_qemu.pid, signal.SIGTERM)
-                proc_ssh.terminate()
-                self.fail('Failed to ssh with {} user into qemu (eof).'.format(user))
-            proc_ssh.terminate()
+        with runqemu("core-image-minimal", self) as qemu:
+            # Attempt to ssh with each user into qemu with empty password
+            for user in [self.root_user, self.test_user]:
+                ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog, user=user)
+                status, output = ssh.run("true")
+                self.assertEqual(status, 0, 'ssh to user tester failed with %s' % output)
 
-        # Cleanup
-        try:
-            killpg(proc_qemu.pid, signal.SIGTERM)
-        except:
-            pass
 
     @testcase(1114)
     def test_rpm_version_4_support_on_image(self):
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 1be7bed..50a08dc 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -17,6 +17,7 @@ import logging
 from oeqa.utils import CommandError
 from oeqa.utils import ftools
 import re
+import contextlib
 
 class Command(object):
     def __init__(self, command, bg=False, timeout=None, data=None, **options):
@@ -173,3 +174,51 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
         f.write('BBFILE_PATTERN_%s = "^${LAYERDIR}/"\n' % templayername)
         f.write('BBFILE_PRIORITY_%s = "%d"\n' % (templayername, priority))
         f.write('BBFILE_PATTERN_IGNORE_EMPTY_%s = "1"\n' % templayername)
+
+
+@contextlib.contextmanager
+def runqemu(pn, test):
+
+    import bb.tinfoil
+    import bb.build
+
+    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil.prepare(False)
+    try:
+        tinfoil.logger.setLevel(logging.WARNING)
+        import oeqa.targetcontrol
+        tinfoil.config_data.setVar("TEST_LOG_DIR", "${WORKDIR}/testimage")
+        tinfoil.config_data.setVar("TEST_QEMUBOOT_TIMEOUT", "90")
+        import oe.recipeutils
+        recipefile = oe.recipeutils.pn_to_recipe(tinfoil.cooker, pn)
+        recipedata = oe.recipeutils.parse_recipe(recipefile, [], tinfoil.config_data)
+
+        # The QemuRunner log is saved out, but we need to ensure it is at the right
+        # log level (and then ensure that since it's a child of the BitBake logger,
+        # we disable propagation so we don't then see the log events on the console)
+        logger = logging.getLogger('BitBake.QemuRunner')
+        logger.setLevel(logging.DEBUG)
+        logger.propagate = False
+        logdir = recipedata.getVar("TEST_LOG_DIR", True)
+
+        qemu = oeqa.targetcontrol.QemuTarget(recipedata)
+    finally:
+        # We need to shut down tinfoil early here in case we actually want
+        # to run tinfoil-using utilities with the running QEMU instance.
+        # Luckily QemuTarget doesn't need it after the constructor.
+        tinfoil.shutdown()
+
+    try:
+        qemu.deploy()
+        try:
+            qemu.start()
+        except bb.build.FuncFailed:
+            raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
+
+        yield qemu
+
+    finally:
+        try:
+            qemu.stop()
+        except:
+            pass
-- 
2.1.0


