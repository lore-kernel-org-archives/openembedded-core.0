Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 689536D750
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 09:17:41 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Nov 2013 01:17:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,773,1378882800"; d="scan'208";a="323654234"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Nov 2013 01:17:39 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 4AD076A4009
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 01:17:38 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 11:18:21 +0200
Message-Id: <20d436ed2213a4c26ab6fcc5c604c58128fb4928.1385457142.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1385457142.git.stefanx.stanacar@intel.com>
References: <cover.1385457142.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1385457142.git.stefanx.stanacar@intel.com>
References: <cover.1385457142.git.stefanx.stanacar@intel.com>
Subject: [PATCH v2 1/2] lib/oeqa: targetcontrol.py: add abstraction for running tests on different targets
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
X-List-Received-Date: Tue, 26 Nov 2013 09:17:41 -0000

Add a new module which abstracts the target object used by testimage.bbclass

The purpose of this module is to move the deployment of a target from testimage.bbclass,
basically abstracting different implementations of how we setup a target and how it runs commands.
It allows to select one implementation or another by setting TEST_TARGET (currently to: "qemu" and "simpleremote").

QemuTarget is used to start a qemu instance (as it's currently done in testimage.bbclass)
SimpleRemoteTarget is meant for a remote machine (by setting TEST_TARGET_IP) that's already up and running
with network and ssh.
Simply put, it opens the door for running the tests on different types of targets by adding new classes
(maybe qemu-nfsroot or remote-special etc.). One could also override BaseTarget which currently uses
the existing SSHControl module and add a serial implementation.

[ YOCTO #5554 ]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 137 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 meta/lib/oeqa/targetcontrol.py

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
new file mode 100644
index 0000000..dee38ec
--- /dev/null
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -0,0 +1,137 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# This module is used by testimage.bbclass for setting up and controlling a target machine.
+
+import os
+import shutil
+import subprocess
+import bb
+
+from oeqa.utils.sshcontrol import SSHControl
+from oeqa.utils.qemurunner import QemuRunner
+
+
+def get_target_controller(d):
+    if d.getVar("TEST_TARGET", True) == "qemu":
+        return QemuTarget(d)
+    elif d.getVar("TEST_TARGET", True) == "simpleremote":
+        return SimpleRemoteTarget(d)
+    else:
+        bb.fatal("Please set a valid TEST_TARGET")
+
+
+class BaseTarget(object):
+
+    def __init__(self, d):
+        self.connection = None
+        self.ip = None
+        self.server_ip = None
+        self.datetime = d.getVar('DATETIME', True)
+        self.testdir = d.getVar("TEST_LOG_DIR", True)
+        self.pn = d.getVar("PN", True)
+
+    def deploy(self):
+
+        self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
+        sshloglink = os.path.join(self.testdir, "ssh_target_log")
+        if os.path.islink(sshloglink):
+            os.unlink(sshloglink)
+        os.symlink(self.sshlog, sshloglink)
+        bb.note("SSH log file: %s" %  self.sshlog)
+
+    def run(self, cmd, timeout=None):
+        return self.connection.run(cmd, timeout)
+
+    def copy_to(self, localpath, remotepath):
+        return self.connection.copy_to(localpath, remotepath)
+
+    def copy_from(self, remotepath, localpath):
+        return self.connection.copy_from(remotepath, localpath)
+
+
+
+class QemuTarget(BaseTarget):
+
+    def __init__(self, d):
+
+        super(QemuTarget, self).__init__(d)
+
+        self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
+        self.origrootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True),  d.getVar("IMAGE_LINK_NAME", True) + '.ext3')
+        self.rootfs = os.path.join(self.testdir, d.getVar("IMAGE_LINK_NAME", True) + '-testimage.ext3')
+
+        self.runner = QemuRunner(machine=d.getVar("MACHINE", True),
+                        rootfs=self.rootfs,
+                        tmpdir = d.getVar("TMPDIR", True),
+                        deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE", True),
+                        display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
+                        logfile = self.qemulog,
+                        boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)))
+
+    def deploy(self):
+        try:
+            shutil.copyfile(self.origrootfs, self.rootfs)
+        except Exception as e:
+            bb.fatal("Error copying rootfs: %s" % e)
+
+        qemuloglink = os.path.join(self.testdir, "qemu_boot_log")
+        if os.path.islink(qemuloglink):
+            os.unlink(qemuloglink)
+        os.symlink(self.qemulog, qemuloglink)
+
+        bb.note("rootfs file: %s" %  self.rootfs)
+        bb.note("Qemu log file: %s" % self.qemulog)
+        super(QemuTarget, self).deploy()
+
+    def start(self, params=None):
+        if self.runner.start(params):
+            self.ip = self.runner.ip
+            self.server_ip = self.runner.server_ip
+            self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
+        else:
+            raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)
+
+    def stop(self):
+        self.runner.stop()
+        self.connection = None
+        self.ip = None
+        self.server_ip = None
+
+    def restart(self, params=None):
+        if self.runner.restart(params):
+            self.ip = self.runner.ip
+            self.server_ip = self.runner.server_ip
+            self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
+        else:
+            raise bb.build.FuncFailed("%s - FAILED to re-start qemu - check the task log and the boot log" % self.pn)
+
+
+class SimpleRemoteTarget(BaseTarget):
+
+    def __init__(self, d):
+        super(SimpleRemoteTarget, self).__init__(d)
+        self.ip = d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        bb.note("Target IP: %s" % self.ip)
+        self.server_ip = d.getVar("TEST_SERVER_IP", True)
+        if not self.server_ip:
+            try:
+                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split()[6]
+            except Exception as e:
+                bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
+        bb.note("Server IP: %s" % self.server_ip)
+
+    def deploy(self):
+        super(SimpleRemoteTarget, self).deploy()
+
+    def start(self, params=None):
+        self.connection = SSHControl(self.ip, logfile=self.sshlog)
+
+    def stop(self):
+        self.connection = None
+        self.ip = None
+        self.server_ip = None
+
+    def restart(self, params=None):
+        pass
-- 
1.8.3.1


