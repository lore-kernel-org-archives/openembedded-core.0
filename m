Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4376F8AE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 15:47:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Mar 2014 08:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,761,1389772800"; d="scan'208";a="510767245"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 30 Mar 2014 08:47:42 -0700
Received: from sstanacx-mobl1.ger.corp.intel.com (sstanacx-mobl1.rb.intel.com
	[10.237.105.81])
	by linux.intel.com (Postfix) with ESMTP id 8E4E86A4087
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Mar 2014 08:47:27 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Mar 2014 17:47:35 +0300
Message-Id: <9cb171e28db88010de943c8d981800444dc92795.1396188987.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1396188987.git.stefanx.stanacar@intel.com>
References: <cover.1396188987.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1396188987.git.stefanx.stanacar@intel.com>
References: <cover.1396188987.git.stefanx.stanacar@intel.com>
Subject: [PATCH 3/3] lib/oeqa: add a test target controller for EFI targets
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
X-List-Received-Date: Sun, 30 Mar 2014 15:47:44 -0000

The purpose of this module is to deploy a test image on a EFI-enabled hardware
and run our runtime tests. A bit of background:
 - testimage.bbclass uses the concept of TEST_TARGET which is a class name
that is responsible for target deploying. A layer can provide
it's own TEST_TARGET. Right now has OE-core has a QemuTarget and a SimpleRemoteTarget
(ssh into an already up and running machine and run tests), the default one being qemu.
 - basically testimage does something like:
    target.deploy()
    try:
	target.start()
        runTests()
    finally:
	target.stop()

This module assumes a running EFI machine with gummiboot as bootloader and
core-image-testmaster installed (or similar). Also your hardware under test has
to be in a DHCP-enabled network that gives it the same IP for each reboot.

One time setup (master image):
 - build core-image-testmaster with EFI_PROVIDER = "gummiboot"
 - install the image on the target

Test image setup:
 - build your test image, e.g core-image-sato as you usually do, but with these in local.conf:
    IMAGE_FSTYPES += "tar.gz"
 - Now run the tests:
    INHERIT += "testimage"
    TEST_TARGET = "GummibootTarget"
    TEST_TARGET_IP = "192.168.2.3"
    bitbake core-image-sato -c testimage

Other notes:
 - TEST_POWERCONTROL_CMD (togheter with TEST_POWERCONTROL_EXTRA_ARGS) can be a command that runs on the host and does power cycling.
The test code passes one argument to that command: off, on or cycle (off then on). In my case I use something like
TEST_POWERCONTROL_CMD="powercontrol.exp test 10.11.12.1 nuc1" in local.conf.
Basically my expect script does: 'ssh test@10.11.12.1 "pyctl nuc1 <arg>" and runs a python script there that controls power for a label called nuc1'.
The reason why my expect script has to ssh into another machine is because of network topology, and that machine is the one actually connected
to the test rack and the power strip. That's why TEST_POWERCONTROL_CMD and _ARGS need to be customized for one's setup, the only requirement being
that it accepts: on/off/cycle as the last argument.
 - if no command is defined it would use classic reboot. This is fine as long as the machine
actually reboots (as in the ssh test hasn't failed), but it's useful for "simple-setup-with-one-board-on-the-desk" scenario, where
some manual interaction is okay from time to time.

[YOCTO #5614]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 133 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/ssh.py             |   2 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/lib/oeqa/controllers/masterimage.py

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
new file mode 100644
index 0000000..188c630
--- /dev/null
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -0,0 +1,133 @@
+import os
+import bb
+import traceback
+import time
+
+import oeqa.targetcontrol
+import oeqa.utils.sshcontrol as sshcontrol
+import oeqa.utils.commands as commands
+
+class GummibootTarget(oeqa.targetcontrol.SimpleRemoteTarget):
+
+    def __init__(self, d):
+        # let our base class do the ip thing
+        super(GummibootTarget, self).__init__(d)
+
+        # test rootfs + kernel
+        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("IMAGE_LINK_NAME", True) + '.tar.gz')
+        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE", True), d.getVar("KERNEL_IMAGETYPE"))
+        if not os.path.isfile(self.rootfs):
+            # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
+            # the same as the config with which the image was build, ie
+            # you bitbake core-image-sato with IMAGE_FSTYPES += "tar.gz"
+            # and your autobuilder overwrites the config, adds the test bits and runs bitbake core-image-sato -c testimage
+            bb.fatal("No rootfs found. Did you build the image ?\nIf yes, did you build it with IMAGE_FSTYPES += \"tar.gz\" ? \
+                      \nExpected path: %s" % self.rootfs)
+        if not os.path.isfile(self.kernel):
+            bb.fatal("No kernel found. Expected path: %s" % self.kernel)
+
+        # if the user knows what he's doing, then by all means...
+        # test-rootfs.tar.gz and test-kernel are hardcoded names in other places
+        # they really have to be used like that in commands though
+        cmds = d.getVar("TEST_DEPLOY_CMDS", True)
+
+        # this the value we need to set in the LoaderEntryOneShot EFI variable
+        # so the system boots the 'test' bootloader label and not the default
+        # The first four bytes are EFI bits, and the rest is an utf-16le string
+        # (EFI vars values need to be utf-16)
+        # $ echo -en "test\0" | iconv -f ascii -t utf-16le | hexdump -C
+        # 00000000  74 00 65 00 73 00 74 00  00 00                    |t.e.s.t...|
+        self.efivarvalue = r'\x07\x00\x00\x00\x74\x00\x65\x00\x73\x00\x74\x00\x00\x00'
+
+        if cmds:
+            self.deploy_cmds = cmds.split("\n")
+        else:
+            self.deploy_cmds = [
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
+        # master ssh connection
+        self.master = None
+
+        # this is the name of the command that controls the power for a board
+        # e.g: TEST_POWERCONTROL_CMD = "/home/user/myscripts/powercontrol.py ${MACHINE} what-ever-other-args-the-script-wants"
+        # the command should take as the last argument "off" and "on" and "cycle" (off, on)
+        self.powercontrol_cmd = d.getVar("TEST_POWERCONTROL_CMD", True) or None
+        self.powercontrol_args = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS") or ""
+        self.origenv = os.environ
+        if self.powercontrol_cmd:
+            if self.powercontrol_args:
+                self.powercontrol_cmd = "%s %s" % (self.powercontrol_cmd, self.powercontrol_args)
+            # the external script for controlling power might use ssh
+            # ssh + keys means we need the original user env
+            bborigenv = d.getVar("BB_ORIGENV", False) or {}
+            for key in bborigenv:
+                val = bborigenv.getVar(key, True)
+                if val is not None:
+                    self.origenv[key] = str(val)
+            self.power_ctl("on")
+
+    def power_ctl(self, msg):
+        if self.powercontrol_cmd:
+            cmd = "%s %s" % (self.powercontrol_cmd, msg)
+            commands.runCmd(cmd, preexec_fn=os.setsid, env=self.origenv)
+
+    def power_cycle(self, conn):
+        if self.powercontrol_cmd:
+            # be nice, don't just cut power
+            conn.run("shutdown -h now")
+            time.sleep(10)
+            self.power_ctl("cycle")
+        else:
+            status, output = conn.run("reboot")
+            if status != 0:
+                bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
+
+    def deploy(self):
+        bb.plain("%s - deploying image on target" % self.pn)
+        # base class just sets the ssh log file for us
+        super(GummibootTarget, self).deploy()
+        self.master = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
+        try:
+            self._deploy()
+        except Exception as e:
+            bb.fatal("Failed deploying test image: %s" % e)
+
+    def _deploy(self):
+        # make sure we are in the right image
+        status, output = self.master.run("cat /etc/masterimage")
+        if status != 0:
+            raise Exception("No ssh connectivity or target isn't running a master image.\n%s" % output)
+
+        # make sure these aren't mounted
+        self.master.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
+
+        # from now on, every deploy cmd should return 0
+        # else an exception will be thrown by sshcontrol
+        self.master.ignore_status = False
+        self.master.copy_to(self.rootfs, "~/test-rootfs.tar.gz")
+        self.master.copy_to(self.kernel, "~/test-kernel")
+        for cmd in self.deploy_cmds:
+            self.master.run(cmd)
+
+
+    def start(self, params=None):
+        bb.plain("%s - boot test image on target" % self.pn)
+        self.power_cycle(self.master)
+        # there are better ways than a timeout but this should work for now
+        time.sleep(120)
+        # set the ssh object for the target/test image
+        self.connection = sshcontrol.SSHControl(self.ip, logfile=self.sshlog, port=self.port)
+        bb.plain("%s - start running tests" % self.pn)
+
+    def stop(self):
+        bb.plain("%s - reboot/powercycle target" % self.pn)
+        self.power_cycle(self.connection)
diff --git a/meta/lib/oeqa/runtime/ssh.py b/meta/lib/oeqa/runtime/ssh.py
index 8c96020..e648660 100644
--- a/meta/lib/oeqa/runtime/ssh.py
+++ b/meta/lib/oeqa/runtime/ssh.py
@@ -14,3 +14,5 @@ class SshTest(oeRuntimeTest):
     def test_ssh(self):
         (status, output) = self.target.run('uname -a')
         self.assertEqual(status, 0, msg="SSH Test failed: %s" % output)
+        (status, output) = self.target.run('cat /etc/masterimage')
+        self.assertEqual(status, 1, msg="This isn't the right image  - /etc/masterimage shouldn't be here %s" % output)
-- 
1.8.5.3


