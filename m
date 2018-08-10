Return-Path: <ptsneves@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id 17F0B744EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 19:38:03 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id r13-v6so8001995ljg.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2018 12:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VgPftqrobs1eLXSppI0lnQrC1vkfjiNeqeTytiHauYg=;
	b=MIGmLPigVPcSrEYKJxY16sLxVug90mN98lLrb5szwyQ0sSk3zx9YuiM0L1TtdL3NfG
	5wNejQx5RqAVkxA4fmH0w8C3W8XBPGy2+zWHJQQqNwWcdJo7gqweDdxgyNomHdOcXKpf
	TwMQx6jV8s5zJ3DukozxIk6j75o0slqzsCbSCwA8CCH2nadoH7SWPYu9lfJJxrT7yHor
	QDPeaYf91UqAoZeNmlg8GdnvtMm4orFujEmjWxbsdDOL56fDW7SEGg5n6QJpVJf3Qt3w
	6BDmkO+LslXJEE1ZBDDTjTfg0iMfEhLDZ/nIyhboqiJqtpSYIRIRYrSI+qJc7RiS+V29
	nzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VgPftqrobs1eLXSppI0lnQrC1vkfjiNeqeTytiHauYg=;
	b=pDYsaQdDYOusvLw/CK3RHdR3d9PZuE1BajOIer4ynetB8u5d9R2KHzBU3+N4qbG4St
	QTJrcAFYLC6mIiYMTkF0XGJVYE4yGqiX6G4BX4jQ1TonKszGGgCVlm5sLW+uiLDgXZZ2
	V2HrnhFg0Ymf+DAIcWUFjgeEoDfuJZNqw/e36tE3mPdbdKSPr3FQG/6AvZ3aMxnctMHS
	3iQ23sTYjc2tkez+DeZVYbnv6PGLTTtKAr9JW5+d0u/Io+kVSjKaN1YRctUozsDPCp7C
	//TCR/Rq56ooyxtx/LVCEpBrGdCWvpZ+N01skIpdlI1YrP+5upEG8xHLfMm1LWww+pPm
	Zqtw==
X-Gm-Message-State: AOUpUlGVDKBvOKKAsRy+Ei9C8iBhiIYNkinifEpRSDdr0H3G/jP06A3U
	zt0pftatXQ0uv6WbH7R5jfPZmzN1Tq2o
X-Google-Smtp-Source: AA+uWPzJL7vTUjvffMFnYtGmW3bdTqSvJ3gPY33scD98H60gZ7VbDP6garifUu2bG0s5PE37+JK3Dg==
X-Received: by 2002:a2e:5c07:: with SMTP id
	q7-v6mr5414892ljb.119.1533929883927; 
	Fri, 10 Aug 2018 12:38:03 -0700 (PDT)
Received: from pneves-XPS-15-9550.home ([78.8.180.157])
	by smtp.gmail.com with ESMTPSA id
	z7-v6sm1972460lfg.89.2018.08.10.12.38.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Aug 2018 12:38:02 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Aug 2018 21:37:57 +0200
Message-Id: <1533929879-22972-1-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/3] testimage: Refactoring and fixing.
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
X-List-Received-Date: Fri, 10 Aug 2018 19:38:05 -0000

The testimage.bbclass invocation of controllers besides
simpletarget and qemutarget was broken.  Setting TEST_TARGET
to class names did not work, only hardcoded values set in
context.py were allowed.  On the other hand the other
TEST_TARGETs available were supposedly available through the
class name convetion but none of them were working. See:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12842

In this commit qemuwrapper and simpletarget TEST_TARGETS are
now not available through these names, but through the
common convention of class names.

The code for layer defined controllers was outdated and
broken because the example controllers in meta-yocto-bsp as
well as the controllers available in masterimage were
dependent only on the datastore d being available for
__init__ contruction, when the testimage.bbclass and
context.py, which initialize test controllers never passed
the datastore. This commit fixes all the openembedded
controllers to not use the datastore, but the testdata json
file that is loaded by the testimage.bbclass. This way the
tests can still be exported to be ran outside bitbake. The
kwargs and logger is still passed in the constructor and
there maybe some redundancies between the kwargs and the td
test datstore, but this is not addressed in this commit.

In masterimage.py there was a duplicate SystemdbootTarget
which was removed. It is my opinion that all targets should
go to meta-yocto-bsp or meta/ and should not get special
treatment whether they come from poky or other layer.

In this commit functionality that was lost in masterimage
about retrieving a fresh BB_ORIGENV. The test data json file
does not store this variable, so the build-time enviromental
variables cannot be retrieved later on, when running the
tests.

The deploy() method invocation of the test cases was removed
in the refactoring and this commit re-adds it in the same
logical place. The deploy method was added as an abstract
method so that all Test controller classes have this method.
This method had been lost and was not used in the
simpleremote and qemuwrapper, because these controllers do
not need the functionality, but almost any real board
requires certain steps to deploy the new images, before the
tests can be ran. An example of this need was visible in the
master image and subclasses in meta-yocto-bsp.

A dependency on images fstypes of qemu was removed from
testimage.  The allowed file system types were not relevant
for other controllers, and made it so that there was an
import of the OEQemuTarget python class applicable to all
possible controllers, including non qemu.

The SimpleRemoteTarget, OEQemuTarget and a custom
controller, developed according to the manual were
successfully tested.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/classes/testimage.bbclass                     |  18 +---
 meta/lib/oeqa/controllers/masterimage.py           | 107 ++++++---------------
 .../target/qemu.py => controllers/qemutarget.py}   |  30 ++++--
 meta/lib/oeqa/controllers/simpleremote.py          |  33 +++++++
 .../target/ssh.py => controllers/sshtarget.py}     |   9 +-
 meta/lib/oeqa/core/target/__init__.py              |   4 +
 meta/lib/oeqa/runtime/context.py                   |  32 +-----
 meta/lib/oeqa/targetcontrol.py                     |  97 ++++++-------------
 8 files changed, 137 insertions(+), 193 deletions(-)
 rename meta/lib/oeqa/{core/target/qemu.py => controllers/qemutarget.py} (58%)
 create mode 100644 meta/lib/oeqa/controllers/simpleremote.py
 rename meta/lib/oeqa/{core/target/ssh.py => controllers/sshtarget.py} (98%)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6fa901b..2aa59b0 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -75,7 +75,7 @@ DEFAULT_TEST_SUITES_remove_qemumips64 = "${MIPSREMOVE}"
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
-TEST_TARGET ?= "qemu"
+TEST_TARGET ?= "OEQemuTarget"
 
 TESTIMAGEDEPENDS = ""
 TESTIMAGEDEPENDS_qemuall = "qemu-native:do_populate_sysroot qemu-helper-native:do_populate_sysroot qemu-helper-native:do_addto_recipe_sysroot"
@@ -147,7 +147,6 @@ def testimage_main(d):
     from oeqa.core.utils.misc import updateTestData
     from oeqa.runtime.context import OERuntimeTestContext
     from oeqa.runtime.context import OERuntimeTestContextExecutor
-    from oeqa.core.target.qemu import supported_fstypes
     from oeqa.core.utils.test import getSuiteCases
     from oeqa.utils import make_logger_bitbake_compatible
 
@@ -189,15 +188,6 @@ def testimage_main(d):
     # Get machine
     machine = d.getVar("MACHINE")
 
-    # Get rootfs
-    fstypes = [fs for fs in d.getVar('IMAGE_FSTYPES').split(' ')
-                  if fs in supported_fstypes]
-    if not fstypes:
-        bb.fatal('Unsupported image type built. Add a comptible image to '
-                 'IMAGE_FSTYPES. Supported types: %s' %
-                 ', '.join(supported_fstypes))
-    rootfs = '%s.%s' % (image_name, fstypes[0])
-
     # Get tmpdir (not really used, just for compatibility)
     tmpdir = d.getVar("TMPDIR")
 
@@ -230,7 +220,6 @@ def testimage_main(d):
     # TODO: We use the current implementatin of qemu runner because of
     # time constrains, qemu runner really needs a refactor too.
     target_kwargs = { 'machine'     : machine,
-                      'rootfs'      : rootfs,
                       'tmpdir'      : tmpdir,
                       'dir_image'   : dir_image,
                       'display'     : display,
@@ -253,9 +242,7 @@ def testimage_main(d):
         d.getVar("TESTIMAGE_DUMP_DIR"))
 
     # the robot dance
-    target = OERuntimeTestContextExecutor.getTarget(
-        d.getVar("TEST_TARGET"), logger, d.getVar("TEST_TARGET_IP"),
-        d.getVar("TEST_SERVER_IP"), **target_kwargs)
+    target = OERuntimeTestContextExecutor.getTarget(d.getVar("TEST_TARGET"), td, logger, **target_kwargs)
 
     # test context
     tc = OERuntimeTestContext(td, logger, target, host_dumper,
@@ -282,6 +269,7 @@ def testimage_main(d):
         # Add systemd.log_level=debug to enable systemd debug logging
         bootparams = 'systemd.log_target=console'
 
+    tc.target.deploy()
     results = None
     orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
     try:
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index a2912fc..26e3870 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -28,18 +28,18 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
     supported_image_fstypes = ['tar.gz', 'tar.bz2']
 
-    def __init__(self, d):
-        super(MasterImageHardwareTarget, self).__init__(d)
+    def __init__(self, td, logger, **kwargs):
+        super(MasterImageHardwareTarget, self).__init__(td, logger, **kwargs)
 
         # target ip
-        addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        addr = td['TEST_TARGET_IP'] or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
         self.ip = addr.split(":")[0]
         try:
             self.port = addr.split(":")[1]
         except IndexError:
             self.port = None
         bb.note("Target IP: %s" % self.ip)
-        self.server_ip = d.getVar("TEST_SERVER_IP")
+        self.server_ip = td['TEST_SERVER_IP']
         if not self.server_ip:
             try:
                 self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
@@ -48,50 +48,47 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         bb.note("Server IP: %s" % self.server_ip)
 
         # test rootfs + kernel
-        self.image_fstype = self.get_image_fstype(d)
-        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
-        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
+        self.image_fstype = self.get_image_fstype(td)
+        self.rootfs = os.path.join(td['DEPLOY_DIR_IMAGE'], td['IMAGE_LINK_NAME'] + '.' + self.image_fstype)
+        self.kernel = os.path.join(td['DEPLOY_DIR_IMAGE'], td["KERNEL_IMAGETYPE"] + '-' + td['MACHINE'] + '.bin')
         if not os.path.isfile(self.rootfs):
             # we could've checked that IMAGE_FSTYPES contains tar.gz but the config for running testimage might not be
             # the same as the config with which the image was build, ie
             # you bitbake core-image-sato with IMAGE_FSTYPES += "tar.gz"
             # and your autobuilder overwrites the config, adds the test bits and runs bitbake core-image-sato -c testimage
-            bb.fatal("No rootfs found. Did you build the image ?\nIf yes, did you build it with IMAGE_FSTYPES += \"tar.gz\" ? \
-                      \nExpected path: %s" % self.rootfs)
+            bb.fatal("No rootfs found. Did you build the image ?\n"  \
+              "If yes, did you build it with IMAGE_FSTYPES += \"{}\" ?"  \
+              "\nExpected path: {}".format(" ".join(self.supported_image_fstypes), self.rootfs))
         if not os.path.isfile(self.kernel):
             bb.fatal("No kernel found. Expected path: %s" % self.kernel)
 
         # master ssh connection
         self.master = None
+
         # if the user knows what they are doing, then by all means...
-        self.user_cmds = d.getVar("TEST_DEPLOY_CMDS")
+        self.user_cmds = td['TEST_DEPLOY_CMDS'] if 'TEST_DEPLOY_CMDS' in td else None
         self.deploy_cmds = None
 
-        # this is the name of the command that controls the power for a board
-        # e.g: TEST_POWERCONTROL_CMD = "/home/user/myscripts/powercontrol.py ${MACHINE} what-ever-other-args-the-script-wants"
-        # the command should take as the last argument "off" and "on" and "cycle" (off, on)
-        self.powercontrol_cmd = d.getVar("TEST_POWERCONTROL_CMD") or None
-        self.powercontrol_args = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS", False) or ""
-
-        self.serialcontrol_cmd = d.getVar("TEST_SERIALCONTROL_CMD") or None
-        self.serialcontrol_args = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS", False) or ""
-
         self.origenv = os.environ
-        if self.powercontrol_cmd or self.serialcontrol_cmd:
-            # the external script for controlling power might use ssh
-            # ssh + keys means we need the original user env
-            bborigenv = d.getVar("BB_ORIGENV", False) or {}
-            for key in bborigenv:
-                val = bborigenv.getVar(key)
-                if val is not None:
-                    self.origenv[key] = str(val)
 
-        if self.powercontrol_cmd:
-            if self.powercontrol_args:
-                self.powercontrol_cmd = "%s %s" % (self.powercontrol_cmd, self.powercontrol_args)
-        if self.serialcontrol_cmd:
-            if self.serialcontrol_args:
-                self.serialcontrol_cmd = "%s %s" % (self.serialcontrol_cmd, self.serialcontrol_args)
+        # TEST_POWERCONTROL_CMD is the name of the command that controls the power for a board.
+        # the command should take as the last argument "off" and "on" and "cycle" (off, on)
+        self.powercontrol_cmd = None
+        self.powercontrol_args = None
+        self.serialcontrol_cmd = None
+        self.serialcontrol_args = None
+
+        if 'TEST_POWERCONTROL_CMD' in td:
+            self.powercontrol_cmd = td['TEST_POWERCONTROL_CMD']
+            if 'TEST_POWERCONTROL_EXTRA_ARGS' in td:
+                powercontrol_args = td['TEST_POWERCONTROL_EXTRA_ARGS']
+                self.powercontrol_cmd = "%s %s" % (self.powercontrol_cmd, powercontrol_args)
+
+        if 'TEST_SERIALCONTROL_CMD' in td:
+            self.serialcontrol_cmd = td['TEST_SERIALCONTROL_CMD']
+            if 'TEST_SERIALCONTROL_EXTRA_ARGS' in td:
+                serialcontrol_args = td['TEST_SERIALCONTROL_EXTRA_ARGS']
+                self.serialcontrol_cmd = "%s %s" % (self.serialcontrol_cmd, serialcontrol_args)
 
     def power_ctl(self, msg):
         if self.powercontrol_cmd:
@@ -161,48 +158,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
 
 class SystemdbootTarget(MasterImageHardwareTarget):
 
-    def __init__(self, d):
-        super(SystemdbootTarget, self).__init__(d)
-        # this the value we need to set in the LoaderEntryOneShot EFI variable
-        # so the system boots the 'test' bootloader label and not the default
-        # The first four bytes are EFI bits, and the rest is an utf-16le string
-        # (EFI vars values need to be utf-16)
-        # $ echo -en "test\0" | iconv -f ascii -t utf-16le | hexdump -C
-        # 00000000  74 00 65 00 73 00 74 00  00 00                    |t.e.s.t...|
-        self.efivarvalue = r'\x07\x00\x00\x00\x74\x00\x65\x00\x73\x00\x74\x00\x00\x00'
-        self.deploy_cmds = [
-                'mount -L boot /boot',
-                'mkdir -p /mnt/testrootfs',
-                'mount -L testrootfs /mnt/testrootfs',
-                'modprobe efivarfs',
-                'mount -t efivarfs efivarfs /sys/firmware/efi/efivars',
-                'cp ~/test-kernel /boot',
-                'rm -rf /mnt/testrootfs/*',
-                'tar xvf ~/test-rootfs.%s -C /mnt/testrootfs' % self.image_fstype,
-                'printf "%s" > /sys/firmware/efi/efivars/LoaderEntryOneShot-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f' % self.efivarvalue
-                ]
-
-    def _deploy(self):
-        # make sure these aren't mounted
-        self.master.run("umount /boot; umount /mnt/testrootfs; umount /sys/firmware/efi/efivars;")
-        # from now on, every deploy cmd should return 0
-        # else an exception will be thrown by sshcontrol
-        self.master.ignore_status = False
-        self.master.copy_to(self.rootfs, "~/test-rootfs." + self.image_fstype)
-        self.master.copy_to(self.kernel, "~/test-kernel")
-        for cmd in self.deploy_cmds:
-            self.master.run(cmd)
-
-    def _start(self, params=None):
-        self.power_cycle(self.master)
-        # there are better ways than a timeout but this should work for now
-        time.sleep(120)
-
-
-class SystemdbootTarget(MasterImageHardwareTarget):
-
-    def __init__(self, d):
-        super(SystemdbootTarget, self).__init__(d)
+    def __init__(self, td, logger, **kwargs):
+        super(SystemdbootTarget, self).__init__(td, logger, **kwargs)
         # this the value we need to set in the LoaderEntryOneShot EFI variable
         # so the system boots the 'test' bootloader label and not the default
         # The first four bytes are EFI bits, and the rest is an utf-16le string
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/controllers/qemutarget.py
similarity index 58%
rename from meta/lib/oeqa/core/target/qemu.py
rename to meta/lib/oeqa/controllers/qemutarget.py
index bf3b633..a867dfb 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/controllers/qemutarget.py
@@ -6,24 +6,37 @@ import sys
 import signal
 import time
 
-from .ssh import OESSHTarget
+from oeqa.controllers.sshtarget import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
 
-supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
 class OEQemuTarget(OESSHTarget):
-    def __init__(self, logger, ip, server_ip, timeout=300, user='root',
+    supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
+    def __init__(self, td, logger, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
             tmpdir='', dir_image='', boottime=60, **kwargs):
 
-        super(OEQemuTarget, self).__init__(logger, ip, server_ip, timeout,
-                user, port)
+        super(OEQemuTarget, self).__init__(td, logger, timeout, user, port)
 
-        self.ip = ip
-        self.server_ip = server_ip
+        self.ip = td['TEST_TARGET_IP']
+        self.server_ip = td['TEST_SERVER_IP']
         self.machine = machine
+
+
+        image_name = ("%s/%s" % (td['DEPLOY_DIR_IMAGE'], td['IMAGE_LINK_NAME']))
+
+        # Get rootfs
+        if not rootfs:
+            fstypes = [fs for fs in td['IMAGE_FSTYPES'].split(' ')
+                          if fs in self.supported_fstypes]
+            if not fstypes:
+                bb.fatal('Unsupported image type built. Add a comptible image to '
+                         'IMAGE_FSTYPES. Supported types: %s' %
+                         ', '.join(self.supported_fstypes))
+            rootfs = '%s.%s' % (image_name, fstypes[0])
         self.rootfs = rootfs
+
         self.kernel = kernel
         self.kvm = kvm
 
@@ -41,5 +54,8 @@ class OEQemuTarget(OESSHTarget):
             self.stop()
             raise RuntimeError("FAILED to start qemu - check the task log and the boot log")
 
+    def deploy(self):
+        pass
+
     def stop(self):
         self.runner.stop()
diff --git a/meta/lib/oeqa/controllers/simpleremote.py b/meta/lib/oeqa/controllers/simpleremote.py
new file mode 100644
index 0000000..5f945d0
--- /dev/null
+++ b/meta/lib/oeqa/controllers/simpleremote.py
@@ -0,0 +1,33 @@
+from oeqa.targetcontrol import BaseTarget
+from oeqa.utils.sshcontrol import SSHControl
+
+class SimpleRemoteTarget(BaseTarget):
+
+    def __init__(self, td, logger, **kwargs):
+        super(SimpleRemoteTarget, self).__init__(td, logger, **kwargs)
+        addr = td['TEST_TARGET_IP'] or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
+        self.ip = addr.split(":")[0]
+        try:
+            self.port = addr.split(":")[1]
+        except IndexError:
+            self.port = None
+        self.logger.info("Target IP: %s" % self.ip)
+        self.server_ip = td['TEST_SERVER_IP']
+        if not self.server_ip:
+            try:
+                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
+            except Exception as e:
+                bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
+        self.logger.info("Server IP: %s" % self.server_ip)
+
+    def deploy(self):
+        super(SimpleRemoteTarget, self).deploy()
+
+    def start(self, params=None, ssh=True, extra_bootparams=None):
+        if ssh:
+            self.connection = SSHControl(self.ip, logfile=self.sshlog, port=self.port)
+
+    def stop(self):
+        self.connection = None
+        self.ip = None
+        self.server_ip = None
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/controllers/sshtarget.py
similarity index 98%
rename from meta/lib/oeqa/core/target/ssh.py
rename to meta/lib/oeqa/controllers/sshtarget.py
index 8ff1f6c..fd1c0b2 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/controllers/sshtarget.py
@@ -8,10 +8,10 @@ import logging
 import subprocess
 import codecs
 
-from . import OETarget
+from oeqa.core.target import OETarget
 
 class OESSHTarget(OETarget):
-    def __init__(self, logger, ip, server_ip, timeout=300, user='root',
+    def __init__(self, td, logger, timeout=300, user='root',
                  port=None, **kwargs):
         if not logger:
             logger = logging.getLogger('target')
@@ -25,8 +25,9 @@ class OESSHTarget(OETarget):
             logger.addHandler(fileHandler)
 
         super(OESSHTarget, self).__init__(logger)
-        self.ip = ip
-        self.server_ip = server_ip
+        self.ip = td['TEST_TARGET_IP']
+        self.server_ip = td['TEST_SERVER_IP']
+
         self.timeout = timeout
         self.user = user
         ssh_options = [
diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/target/__init__.py
index d2468bc..081a30e 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -21,6 +21,10 @@ class OETarget(object):
         pass
 
     @abstractmethod
+    def deploy(self):
+        pass
+
+    @abstractmethod
     def copyTo(self, localSrc, remoteDst):
         pass
 
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index a7f3823..b886435 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -4,8 +4,6 @@
 import os
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
-from oeqa.core.target.ssh import OESSHTarget
-from oeqa.core.target.qemu import OEQemuTarget
 from oeqa.utils.dump import HostDumper
 
 from oeqa.runtime.loader import OERuntimeTestLoader
@@ -89,32 +87,12 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 help="Qemu boot configuration, only needed when target_type is QEMU.")
 
     @staticmethod
-    def getTarget(target_type, logger, target_ip, server_ip, **kwargs):
+    def getTarget(target_type, td, logger, **kwargs):
         target = None
 
-        if target_ip:
-            target_ip_port = target_ip.split(':')
-            if len(target_ip_port) == 2:
-                target_ip = target_ip_port[0]
-                kwargs['port'] = target_ip_port[1]
-
-        if target_type == 'simpleremote':
-            target = OESSHTarget(logger, target_ip, server_ip, **kwargs)
-        elif target_type == 'qemu':
-            target = OEQemuTarget(logger, target_ip, server_ip, **kwargs)
-        else:
-            # XXX: This code uses the old naming convention for controllers and
-            # targets, the idea it is to leave just targets as the controller
-            # most of the time was just a wrapper.
-            # XXX: This code tries to import modules from lib/oeqa/controllers
-            # directory and treat them as controllers, it will less error prone
-            # to use introspection to load such modules.
-            # XXX: Don't base your targets on this code it will be refactored
-            # in the near future.
-            # Custom target module loading
-            target_modules_path = kwargs.get('target_modules_path', '')
-            controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
-            target = controller(logger, target_ip, server_ip, **kwargs)
+        target_modules_path = kwargs.get('target_modules_path', '')
+        controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
+        target = controller(td, logger, **kwargs)
 
         return target
 
@@ -176,7 +154,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         try:
             obj = getattr(module, target)
         except:
-            obj = None
+            pass
         return obj
         
     @staticmethod
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 59a9c35..109d90b 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -22,18 +22,17 @@ class BaseTarget(object, metaclass=ABCMeta):
 
     supported_image_fstypes = []
 
-    def __init__(self, d, logger):
+    def __init__(self, td, logger, **kwargs):
         self.connection = None
         self.ip = None
         self.server_ip = None
-        self.datetime = d.getVar('DATETIME')
-        self.testdir = d.getVar("TEST_LOG_DIR")
-        self.pn = d.getVar("PN")
+        self.datetime = td['DATETIME']
+        self.testdir = td['TEST_LOG_DIR']
+        self.pn = td['PN']
         self.logger = logger
 
     @abstractmethod
     def deploy(self):
-
         self.sshlog = os.path.join(self.testdir, "ssh_target_log.%s" % self.datetime)
         sshloglink = os.path.join(self.testdir, "ssh_target_log")
         if os.path.islink(sshloglink):
@@ -54,17 +53,17 @@ class BaseTarget(object, metaclass=ABCMeta):
         return None
 
     @classmethod
-    def match_image_fstype(self, d, image_fstypes=None):
+    def match_image_fstype(self, td, image_fstypes=None):
         if not image_fstypes:
-            image_fstypes = d.getVar('IMAGE_FSTYPES').split(' ')
+            image_fstypes = td['IMAGE_FSTYPES'].split(' ')
         possible_image_fstypes = [fstype for fstype in self.supported_image_fstypes if fstype in image_fstypes]
         if possible_image_fstypes:
             return possible_image_fstypes[0]
         else:
             return None
 
-    def get_image_fstype(self, d):
-        image_fstype = self.match_image_fstype(d)
+    def get_image_fstype(self, td):
+        image_fstype = self.match_image_fstype(td)
         if image_fstype:
             return image_fstype
         else:
@@ -89,28 +88,28 @@ class QemuTarget(BaseTarget):
 
     supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
-    def __init__(self, d, logger, image_fstype=None):
+    def __init__(self, td, logger, image_fstype=None, **kwargs):
 
         import oe.types
 
-        super(QemuTarget, self).__init__(d, logger)
+        super(QemuTarget, self).__init__(td, logger, **kwargs)
 
         self.rootfs = ''
         self.kernel = ''
         self.image_fstype = ''
 
-        if d.getVar('FIND_ROOTFS') == '1':
-            self.image_fstype = image_fstype or self.get_image_fstype(d)
-            self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
-            self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
+        if td['FIND_ROOTFS'] == '1':
+            self.image_fstype = image_fstype or self.get_image_fstype(td)
+            self.rootfs = os.path.join(td['DEPLOY_DIR_IMAGE'],  td['IMAGE_LINK_NAME'] + '.' + self.image_fstype)
+            self.kernel = os.path.join(td['DEPLOY_DIR_IMAGE'], td["KERNEL_IMAGETYPE"] + '-' + td['MACHINE'] + '.bin')
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
-        dump_target_cmds = d.getVar("testimage_dump_target")
-        dump_host_cmds = d.getVar("testimage_dump_host")
-        dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
-        qemu_use_kvm = d.getVar("QEMU_USE_KVM")
+        dump_target_cmds = td['testimage_dump_target']
+        dump_host_cmds = td['testimage_dump_host']
+        dump_dir = td['TESTIMAGE_DUMP_DIR']
+        qemu_use_kvm = td['QEMU_USE_KVM']
         if qemu_use_kvm and \
-           (oe.types.boolean(qemu_use_kvm) and "x86" in d.getVar("MACHINE") or \
-            d.getVar("MACHINE") in qemu_use_kvm.split()):
+           (oe.types.boolean(qemu_use_kvm) and "x86" in td['MACHINE'] or \
+            td['MACHINE'] in qemu_use_kvm.split()):
             use_kvm = True
         else:
             use_kvm = False
@@ -124,27 +123,27 @@ class QemuTarget(BaseTarget):
         self.logger.addHandler(loggerhandler)
         oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.join(self.testdir, 'qemurunner_log'), force=True)
 
-        if d.getVar("DISTRO") == "poky-tiny":
-            self.runner = QemuTinyRunner(machine=d.getVar("MACHINE"),
+        if td['DISTRO'] == "poky-tiny":
+            self.runner = QemuTinyRunner(machine=td['MACHINE'],
                             rootfs=self.rootfs,
-                            tmpdir = d.getVar("TMPDIR"),
-                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE"),
-                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
+                            tmpdir = td['TMPDIR'],
+                            deploy_dir_image = td['DEPLOY_DIR_IMAGE'],
+                            display = td['DISPLAY'],
                             logfile = self.qemulog,
                             kernel = self.kernel,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
+                            boottime = int(td['TEST_QEMUBOOT_TIMEOUT']),
                             logger = logger)
         else:
-            self.runner = QemuRunner(machine=d.getVar("MACHINE"),
+            self.runner = QemuRunner(machine=td['MACHINE'],
                             rootfs=self.rootfs,
-                            tmpdir = d.getVar("TMPDIR"),
-                            deploy_dir_image = d.getVar("DEPLOY_DIR_IMAGE"),
-                            display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
+                            tmpdir = td['TMPDIR'],
+                            deploy_dir_image = td['DEPLOY_DIR_IMAGE'],
+                            display = td['DISPLAY'],
                             logfile = self.qemulog,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
+                            boottime = int(td['TEST_QEMUBOOT_TIMEOUT']),
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
-                            dump_host_cmds = d.getVar("testimage_dump_host"),
+                            dump_host_cmds = td['testimage_dump_host'],
                             logger = logger)
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
@@ -198,35 +197,3 @@ class QemuTarget(BaseTarget):
 
     def run_serial(self, command, timeout=5):
         return self.runner.run_serial(command, timeout=timeout)
-
-
-class SimpleRemoteTarget(BaseTarget):
-
-    def __init__(self, d):
-        super(SimpleRemoteTarget, self).__init__(d)
-        addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
-        self.ip = addr.split(":")[0]
-        try:
-            self.port = addr.split(":")[1]
-        except IndexError:
-            self.port = None
-        self.logger.info("Target IP: %s" % self.ip)
-        self.server_ip = d.getVar("TEST_SERVER_IP")
-        if not self.server_ip:
-            try:
-                self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
-            except Exception as e:
-                bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
-        self.logger.info("Server IP: %s" % self.server_ip)
-
-    def deploy(self):
-        super(SimpleRemoteTarget, self).deploy()
-
-    def start(self, params=None, ssh=True, extra_bootparams=None):
-        if ssh:
-            self.connection = SSHControl(self.ip, logfile=self.sshlog, port=self.port)
-
-    def stop(self):
-        self.connection = None
-        self.ip = None
-        self.server_ip = None
-- 
2.7.4


