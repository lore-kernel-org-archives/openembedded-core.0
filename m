Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A73BB771DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:13:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GADZ3u020214
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 03:13:35 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 03:13:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 03:13:27 -0700
Message-ID: <751ae73c98c1280f2b5ada3b442cf3f5828ed437.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1489657029.git.liezhi.yang@windriver.com>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] oeqa/targetcontrol.py: modify it to test runqemu
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
X-List-Received-Date: Thu, 16 Mar 2017 10:13:33 -0000
Content-Type: text/plain

Modify the following files to test runqemu:
    targetcontrol.py
    utils/commands.py
    utils/qemurunner.py

We need simulate how "runqemu" works in command line, so when test
"runqemu", the targetcontrol.py, utils/commands.py and
utils/qemurunner.py don't have to find the rootfs or set env vars.

[YOCTO #10249]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/targetcontrol.py    | 20 +++++++++++++++-----
 meta/lib/oeqa/utils/commands.py   | 13 +++++++++++--
 meta/lib/oeqa/utils/qemurunner.py | 28 +++++++++++++++++-----------
 3 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 0ad3a6b..8d11cf0 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -117,10 +117,15 @@ class QemuTarget(BaseTarget):
 
         super(QemuTarget, self).__init__(d)
 
-        self.image_fstype = image_fstype or self.get_image_fstype(d)
+        self.rootfs = ''
+        self.kernel = ''
+        self.image_fstype = ''
+
+        if d.getVar('FIND_ROOTFS') == '1':
+            self.image_fstype = image_fstype or self.get_image_fstype(d)
+            self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
+            self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
-        self.rootfs = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"),  d.getVar("IMAGE_LINK_NAME") + '.' + self.image_fstype)
-        self.kernel = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), d.getVar("KERNEL_IMAGETYPE", False) + '-' + d.getVar('MACHINE', False) + '.bin')
         dump_target_cmds = d.getVar("testimage_dump_target")
         dump_host_cmds = d.getVar("testimage_dump_host")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
@@ -176,8 +181,13 @@ class QemuTarget(BaseTarget):
         bb.note("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
-    def start(self, params=None, ssh=True, extra_bootparams=None, runqemuparams=''):
-        if self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams):
+    def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd=''):
+        if launch_cmd:
+            start = self.runner.launch(get_ip=ssh, launch_cmd=launch_cmd)
+        else:
+            start = self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams)
+
+        if start:
             if ssh:
                 self.ip = self.runner.ip
                 self.server_ip = self.runner.server_ip
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 82c5908..6528a98 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -218,7 +218,10 @@ def create_temp_layer(templayerdir, templayername, priority=999, recipepathspec=
 
 
 @contextlib.contextmanager
-def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None):
+def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None, launch_cmd=None):
+    """
+    launch_cmd means directly run the command, don't need set rootfs or env vars.
+    """
 
     import bb.tinfoil
     import bb.build
@@ -230,6 +233,12 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None):
         import oeqa.targetcontrol
         tinfoil.config_data.setVar("TEST_LOG_DIR", "${WORKDIR}/testimage")
         tinfoil.config_data.setVar("TEST_QEMUBOOT_TIMEOUT", "1000")
+        # Tell QemuTarget() whether need find rootfs/kernel or not
+        if launch_cmd:
+            tinfoil.config_data.setVar("FIND_ROOTFS", '0')
+        else:
+            tinfoil.config_data.setVar("FIND_ROOTFS", '1')
+
         recipedata = tinfoil.parse_recipe(pn)
 
         # The QemuRunner log is saved out, but we need to ensure it is at the right
@@ -260,7 +269,7 @@ def runqemu(pn, ssh=True, runqemuparams='', image_fstype=None):
     try:
         qemu.deploy()
         try:
-            qemu.start(ssh=ssh, runqemuparams=runqemuparams)
+            qemu.start(ssh=ssh, runqemuparams=runqemuparams, launch_cmd=launch_cmd)
         except bb.build.FuncFailed:
             raise Exception('Failed to start QEMU - see the logs in %s' % logdir)
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 59dc11d..aebeaaf 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -95,7 +95,7 @@ class QemuRunner:
                 self._dump_host()
                 raise SystemExit
 
-    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams=''):
+    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None, runqemuparams='', launch_cmd=None):
         if self.display:
             os.environ["DISPLAY"] = self.display
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
@@ -115,6 +115,20 @@ class QemuRunner:
         else:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
+        if not launch_cmd:
+            launch_cmd = 'runqemu snapshot'
+            if self.use_kvm:
+                logger.info('Using kvm for runqemu')
+                launch_cmd += ' kvm'
+            else:
+                logger.info('Not using kvm for runqemu')
+            if not self.display:
+                launch_cmd += ' nographic'
+            launch_cmd += ' %s %s' % (self.machine, self.rootfs)
+
+        return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, runqemuparams=runqemuparams)
+
+    def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, runqemuparams=''):
         try:
             threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
@@ -122,27 +136,19 @@ class QemuRunner:
             logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
-
         bootparams = 'console=tty1 console=ttyS0,115200n8 printk.time=1'
         if extra_bootparams:
             bootparams = bootparams + ' ' + extra_bootparams
 
         self.qemuparams = 'bootparams="{0}" qemuparams="-serial tcp:127.0.0.1:{1}"'.format(bootparams, threadport)
-        if not self.display:
-            self.qemuparams = 'nographic ' + self.qemuparams
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
+        launch_cmd += ' tcpserial=%s %s' % (self.serverport, self.qemuparams)
+
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        launch_cmd = 'runqemu snapshot %s ' % runqemuparams
-        if self.use_kvm:
-            logger.info('Using kvm for runqemu')
-            launch_cmd += 'kvm '
-        else:
-            logger.info('Not using kvm for runqemu')
-        launch_cmd += 'tcpserial=%s %s %s %s' % (self.serverport, self.machine, self.rootfs, self.qemuparams)
         logger.info('launchcmd=%s'%(launch_cmd))
 
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
-- 
2.9.0


