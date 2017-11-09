Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6399778419
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:55:53 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vA9Btqpv007429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 9 Nov 2017 11:55:53 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eClR2-00030t-Il; Thu, 09 Nov 2017 11:55:52 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 11:55:50 +0000
Message-Id: <1510228551-11516-6-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1510228551-11516-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 6/7] oeqa: Clean up logger handling
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
X-List-Received-Date: Thu, 09 Nov 2017 11:55:55 -0000

The logger handling in oeqa was confused at best. This patch:

a) Passes in a logger through various qemu runner pieces
b) Uses that logger consistently in the code
c) Creates a logger for QemuRunner outside the bitbake namespace
   meaning we don't conflict with the tinfoil logging changes

The result of this is more consistency. For runtime tests in testimage,
the logs always contain the debug info, nothing is shwon on the console.
For the oe-selftests, logs are intercepted and only shown if the test
fails.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/target/qemu.py       |  2 +-
 meta/lib/oeqa/selftest/cases/runqemu.py |  5 -----
 meta/lib/oeqa/targetcontrol.py          | 25 +++++++++++++------------
 meta/lib/oeqa/utils/commands.py         | 25 ++++++++-----------------
 meta/lib/oeqa/utils/qemurunner.py       |  7 ++-----
 meta/lib/oeqa/utils/qemutinyrunner.py   |  3 ++-
 6 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 2dc521c..d359bf9 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -31,7 +31,7 @@ class OEQemuTarget(OESSHTarget):
                                  deploy_dir_image=dir_image, display=display,
                                  logfile=bootlog, boottime=boottime,
                                  use_kvm=kvm, dump_dir=dump_dir,
-                                 dump_host_cmds=dump_host_cmds)
+                                 dump_host_cmds=dump_host_cmds, logger=logger)
 
     def start(self, params=None, extra_bootparams=None):
         if self.runner.start(params, extra_bootparams=extra_bootparams):
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 1a8d121..47d41f5 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -3,7 +3,6 @@
 #
 
 import re
-import logging
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var
@@ -24,10 +23,6 @@ class RunqemuTests(OESelftestTestCase):
         self.fstypes = "ext4 iso hddimg wic.vmdk wic.qcow2 wic.vdi"
         self.cmd_common = "runqemu nographic"
 
-        # Avoid emit the same record multiple times.
-        mainlogger = logging.getLogger("BitBake.Main")
-        mainlogger.propagate = False
-
         self.write_config(
 """
 MACHINE = "%s"
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index e17c895..f63936c 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -18,19 +18,18 @@ from oeqa.utils.dump import TargetDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
-logger = logging.getLogger('BitBake.QemuRunner')
-
 class BaseTarget(object, metaclass=ABCMeta):
 
     supported_image_fstypes = []
 
-    def __init__(self, d):
+    def __init__(self, d, logger):
         self.connection = None
         self.ip = None
         self.server_ip = None
         self.datetime = d.getVar('DATETIME')
         self.testdir = d.getVar("TEST_LOG_DIR")
         self.pn = d.getVar("PN")
+        self.logger = logger
 
     @abstractmethod
     def deploy(self):
@@ -40,7 +39,7 @@ class BaseTarget(object, metaclass=ABCMeta):
         if os.path.islink(sshloglink):
             os.unlink(sshloglink)
         os.symlink(self.sshlog, sshloglink)
-        logger.info("SSH log file: %s" %  self.sshlog)
+        self.logger.info("SSH log file: %s" %  self.sshlog)
 
     @abstractmethod
     def start(self, params=None, ssh=True, extra_bootparams=None):
@@ -90,7 +89,7 @@ class QemuTarget(BaseTarget):
 
     supported_image_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
 
-    def __init__(self, d, image_fstype=None, logger=None):
+    def __init__(self, d, logger, image_fstype=None):
 
         super(QemuTarget, self).__init__(d, logger)
 
@@ -120,7 +119,7 @@ class QemuTarget(BaseTarget):
         self.qemurunnerlog = os.path.join(self.testdir, 'qemurunner_log.%s' % self.datetime)
         loggerhandler = logging.FileHandler(self.qemurunnerlog)
         loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
-        logger.addHandler(loggerhandler)
+        self.logger.addHandler(loggerhandler)
         oe.path.symlink(os.path.basename(self.qemurunnerlog), os.path.join(self.testdir, 'qemurunner_log'), force=True)
 
         if d.getVar("DISTRO") == "poky-tiny":
@@ -131,7 +130,8 @@ class QemuTarget(BaseTarget):
                             display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY"),
                             logfile = self.qemulog,
                             kernel = self.kernel,
-                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")))
+                            boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
+                            logger = logger)
         else:
             self.runner = QemuRunner(machine=d.getVar("MACHINE"),
                             rootfs=self.rootfs,
@@ -142,7 +142,8 @@ class QemuTarget(BaseTarget):
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT")),
                             use_kvm = use_kvm,
                             dump_dir = dump_dir,
-                            dump_host_cmds = d.getVar("testimage_dump_host"))
+                            dump_host_cmds = d.getVar("testimage_dump_host"),
+                            logger = logger)
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
 
@@ -154,8 +155,8 @@ class QemuTarget(BaseTarget):
             os.unlink(qemuloglink)
         os.symlink(self.qemulog, qemuloglink)
 
-        logger.info("rootfs file: %s" %  self.rootfs)
-        logger.info("Qemu log file: %s" % self.qemulog)
+        self.logger.info("rootfs file: %s" %  self.rootfs)
+        self.logger.info("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
     def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd='', discard_writes=True):
@@ -207,14 +208,14 @@ class SimpleRemoteTarget(BaseTarget):
             self.port = addr.split(":")[1]
         except IndexError:
             self.port = None
-        logger.info("Target IP: %s" % self.ip)
+        self.logger.info("Target IP: %s" % self.ip)
         self.server_ip = d.getVar("TEST_SERVER_IP")
         if not self.server_ip:
             try:
                 self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
             except Exception as e:
                 bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
-        logger.info("Server IP: %s" % self.server_ip)
+        self.logger.info("Server IP: %s" % self.server_ip)
 
     def deploy(self):
         super(SimpleRemoteTarget, self).deploy()
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 5e53454..0bb9002 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -296,6 +296,12 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
     import bb.tinfoil
     import bb.build
 
+    # Need a non-'BitBake' logger to capture the runner output
+    targetlogger = logging.getLogger('TargetRunner')
+    targetlogger.setLevel(logging.DEBUG)
+    handler = logging.StreamHandler(sys.stdout)
+    targetlogger.addHandler(handler)
+
     tinfoil = bb.tinfoil.Tinfoil()
     tinfoil.prepare(config_only=False, quiet=True)
     try:
@@ -313,31 +319,15 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
         for key, value in overrides.items():
             recipedata.setVar(key, value)
 
-        # The QemuRunner log is saved out, but we need to ensure it is at the right
-        # log level (and then ensure that since it's a child of the BitBake logger,
-        # we disable propagation so we don't then see the log events on the console)
-        logger = logging.getLogger('BitBake.QemuRunner')
-        logger.setLevel(logging.DEBUG)
-        logger.propagate = False
         logdir = recipedata.getVar("TEST_LOG_DIR")
 
-        qemu = oeqa.targetcontrol.QemuTarget(recipedata, image_fstype)
+        qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, image_fstype)
     finally:
         # We need to shut down tinfoil early here in case we actually want
         # to run tinfoil-using utilities with the running QEMU instance.
         # Luckily QemuTarget doesn't need it after the constructor.
         tinfoil.shutdown()
 
-    # Setup bitbake logger as console handler is removed by tinfoil.shutdown
-    bblogger = logging.getLogger('BitBake')
-    bblogger.setLevel(logging.INFO)
-    console = logging.StreamHandler(sys.stdout)
-    bbformat = bb.msg.BBLogFormatter("%(levelname)s: %(message)s")
-    if sys.stdout.isatty():
-        bbformat.enable_color()
-    console.setFormatter(bbformat)
-    bblogger.addHandler(console)
-
     try:
         qemu.deploy()
         try:
@@ -352,6 +342,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None,
             qemu.stop()
         except:
             pass
+    targetlogger.removeHandler(handler)
 
 def updateEnv(env_file):
     """
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 3214887..82335d8 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -28,7 +28,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds, use_kvm):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds, use_kvm, logger):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -57,9 +57,7 @@ class QemuRunner:
         self.qemu_pidfile = 'pidfile_'+str(os.getpid())
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
 
-        self.logger = logging.getLogger("BitBake.QemuRunner")
-        self.handler = logging.StreamHandler(sys.stdout)
-        self.logger.addHandler(self.handler)
+        self.logger = logger
 
     def create_socket(self):
         try:
@@ -371,7 +369,6 @@ class QemuRunner:
         self.ip = None
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
-        self.logger.removeHandler(self.handler)
 
     def stop_qemu_system(self):
         if self.qemupid:
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 1bf5900..63b5d16 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -17,7 +17,7 @@ from .qemurunner import QemuRunner
 
 class QemuTinyRunner(QemuRunner):
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, kernel, boottime, logger):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -40,6 +40,7 @@ class QemuTinyRunner(QemuRunner):
         self.socketfile = "console.sock"
         self.server_socket = None
         self.kernel = kernel
+        self.logger = logger
 
 
     def create_socket(self):
-- 
2.7.4


