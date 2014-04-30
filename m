Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2E860144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:42:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267763"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:31:57 +0100
Message-Id: <055a14290b1d1d9e581c7f5a301174e1290351d1.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/8] oeqa/controllers/masterimage: add a base class for hw targets
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
X-List-Received-Date: Wed, 30 Apr 2014 12:42:02 -0000

From: Stefan Stanacar <stefanx.stanacar@intel.com>

Right now GummibootTarget is the only hardware TEST_TARGET with deployment,
but we will add more, so let's make an abstract base class, that will
do the common thing for all the hw targets.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 137 ++++++++++++++++++++-----------
 1 file changed, 91 insertions(+), 46 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 188c630..1bd0ab4 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -1,17 +1,50 @@
+# Copyright (C) 2014 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# This module adds support to testimage.bbclass to deploy images and run
+# tests using a "master image" - this is a "known good" image that is
+# installed onto the device as part of initial setup and will be booted into
+# with no interaction; we can then use it to deploy the image to be tested
+# to a second partition before running the tests.
+#
+# For an example master image, see core-image-testmaster
+# (meta/recipes-extended/images/core-image-testmaster.bb)
+
 import os
 import bb
 import traceback
 import time
+import subprocess
 
 import oeqa.targetcontrol
 import oeqa.utils.sshcontrol as sshcontrol
 import oeqa.utils.commands as commands
 
-class GummibootTarget(oeqa.targetcontrol.SimpleRemoteTarget):
+from abc import ABCMeta, abstractmethod
+
+class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
+
+    __metaclass__ = ABCMeta
 
     def __init__(self, d):
-        # let our base class do the ip thing
-        super(GummibootTarget, self).__init__(d)
+        super(MasterImageHardwareTarget, self).__init__(d)
+
+        # target ip
+        addr = d.getVar("TEST_TARGET_IP", True) or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        self.ip = addr.split(":")[0]
+        try:
+            self.port = addr.split(":")[1]
+        except IndexError:
+            self.port = None
+        bb.note("Target IP: %s" % self.ip)
+        self.server_ip = d.getVar("TEST_SERVER_IP", True)
+        if not self.server_ip:
+            try:
+                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
+            except Exception as e:
+                bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
+        bb.note("Server IP: %s" % self.server_ip)
 
         # test rootfs + kernel
         self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.tar.gz')
@@ -26,36 +59,11 @@ class GummibootTarget(oeqa.targetcontrol.SimpleRemoteTarget):
         if not os.path.isfile(self.kernel):
             bb.fatal("No kernel found. Expected path: %s" % self.kernel)
 
-        # if the user knows what he's doing, then by all means...
-        # test-rootfs.tar.gz and test-kernel are hardcoded names in other places
-        # they really have to be used like that in commands though
-        cmds = d.getVar("TEST_DEPLOY_CMDS", True)
-
-        # this the value we need to set in the LoaderEntryOneShot EFI variable
-        # so the system boots the 'test' bootloader label and not the default
-        # The first four bytes are EFI bits, and the rest is an utf-16le string
-        # (EFI vars values need to be utf-16)
-        # $ echo -en "test\0" | iconv -f ascii -t utf-16le | hexdump -C
-        # 00000000  74 00 65 00 73 00 74 00  00 00                    |t.e.s.t...|
-        self.efivarvalue = r'\x07\x00\x00\x00\x74\x00\x65\x00\x73\x00\x74\x00\x00\x00'
-
-        if cmds:
-            self.deploy_cmds = cmds.split("\n")
-        else:
-            self.deploy_cmds = [
-                'mount -L boot /boot',
-                'mkdir -p /mnt/testrootfs',
-                'mount -L testrootfs /mnt/testrootfs',
-                'modprobe efivarfs',
-                'mount -t efivarfs efivarfs /sys/firmware/efi/efivars',
-                'cp ~/test-kernel /boot',
-                'rm -rf /mnt/testrootfs/*',
-                'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
-                'printf "%s" > /sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f' % self.efivarvalue
-                ]
-
         # master ssh connection
         self.master = None
+        # if the user knows what they are doing, then by all means...
+        self.user_cmds = d.getVar("TEST_DEPLOY_CMDS", True)
+        self.deploy_cmds = None
 
         # this is the name of the command that controls the power for a board
         # e.g: TEST_POWERCONTROL_CMD = "/home/user/myscripts/powercontrol.py ${MACHINE} what-ever-other-args-the-script-wants"
@@ -94,22 +102,67 @@ class GummibootTarget(oeqa.targetcontrol.SimpleRemoteTarget):
     def deploy(self):
         bb.plain("%s - deploying image on target" % self.pn)
         # base class just sets the ssh log file for us
-        super(GummibootTarget, self).deploy()
+        super(MasterImageHardwareTarget, self).deploy()
         self.master = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
+        status, output = self.master.run("cat /etc/masterimage")
+        if status != 0:
+            bb.fatal("No ssh connectivity or target isn't running a master image.\n%s" % output)
+        if self.user_cmds:
+            self.deploy_cmds = self.user_cmds.split("\n")
         try:
             self._deploy()
         except Exception as e:
             bb.fatal("Failed deploying test image: %s" % e)
 
+    @abstractmethod
     def _deploy(self):
-        # make sure we are in the right image
-        status, output = self.master.run("cat /etc/masterimage")
-        if status != 0:
-            raise Exception("No ssh connectivity or target isn't running a master image.\n%s" % output)
+        pass
+
+    def start(self, params=None):
+        bb.plain("%s - boot test image on target" % self.pn)
+        self._start()
+        # set the ssh object for the target/test image
+        self.connection = sshcontrol.SSHControl(self.ip, logfile=self.sshlog, port=self.port)
+        bb.plain("%s - start running tests" % self.pn)
+
+    @abstractmethod
+    def _start(self):
+        pass
 
+    def stop(self):
+        bb.plain("%s - reboot/powercycle target" % self.pn)
+        self.power_cycle(self.connection)
+
+    def restart(self):
+        pass
+
+
+class GummibootTarget(MasterImageHardwareTarget):
+
+    def __init__(self, d):
+        super(GummibootTarget, self).__init__(d)
+        # this the value we need to set in the LoaderEntryOneShot EFI variable
+        # so the system boots the 'test' bootloader label and not the default
+        # The first four bytes are EFI bits, and the rest is an utf-16le string
+        # (EFI vars values need to be utf-16)
+        # $ echo -en "test\0" | iconv -f ascii -t utf-16le | hexdump -C
+        # 00000000  74 00 65 00 73 00 74 00  00 00                    |t.e.s.t...|
+        self.efivarvalue = r'\x07\x00\x00\x00\x74\x00\x65\x00\x73\x00\x74\x00\x00\x00'
+        self.deploy_cmds = [
+                'mount -L boot /boot',
+                'mkdir -p /mnt/testrootfs',
+                'mount -L testrootfs /mnt/testrootfs',
+                'modprobe efivarfs',
+                'mount -t efivarfs efivarfs /sys/firmware/efi/efivars',
+                'cp ~/test-kernel /boot',
+                'rm -rf /mnt/testrootfs/*',
+                'tar xzvf ~/test-rootfs.tar.gz -C /mnt/testrootfs',
+                'printf "%s" > /sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f' % self.efivarvalue
+                ]
+
+    def _deploy(self):
         # make sure these aren't mounted
         self.master.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
-
         # from now on, every deploy cmd should return 0
         # else an exception will be thrown by sshcontrol
         self.master.ignore_status = False
@@ -118,16 +171,8 @@ class GummibootTarget(oeqa.targetcontrol.SimpleRemoteTarget):
         for cmd in self.deploy_cmds:
             self.master.run(cmd)
 
-
-    def start(self, params=None):
-        bb.plain("%s - boot test image on target" % self.pn)
+    def _start(self, params=None):
         self.power_cycle(self.master)
         # there are better ways than a timeout but this should work for now
         time.sleep(120)
-        # set the ssh object for the target/test image
-        self.connection = sshcontrol.SSHControl(self.ip, logfile=self.sshlog, port=self.port)
-        bb.plain("%s - start running tests" % self.pn)
 
-    def stop(self):
-        bb.plain("%s - reboot/powercycle target" % self.pn)
-        self.power_cycle(self.connection)
-- 
1.9.0


