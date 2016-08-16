Return-Path: <william.c.randle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3FB8273177
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 23:08:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 16 Aug 2016 16:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="866582852"
Received: from wcrandle-mobl1.jf.intel.com ([10.7.199.73])
	by orsmga003.jf.intel.com with ESMTP; 16 Aug 2016 16:08:15 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2016 16:08:11 -0700
Message-Id: <1471388891-839-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH] testimage: allow using kvm when running qemux86* machines
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
X-List-Received-Date: Tue, 16 Aug 2016 23:08:27 -0000

Using kvm can provide significant speedups when running qemux86* machines
on an x86* host. Enabled by using the new QEMU_USE_KVM variable.

[YOCTO #9298]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/lib/oeqa/targetcontrol.py    |  7 +++++++
 meta/lib/oeqa/utils/qemurunner.py | 11 +++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 768c463..3209ef0 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -125,6 +125,12 @@ class QemuTarget(BaseTarget):
         dump_target_cmds = d.getVar("testimage_dump_target", True)
         dump_host_cmds = d.getVar("testimage_dump_host", True)
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR", True)
+        if d.getVar("QEMU_USE_KVM", False) is not None \
+           and d.getVar("QEMU_USE_KVM", False) == "True" \
+           and "x86" in d.getVar("MACHINE", True):
+            use_kvm = True
+        else:
+            use_kvm = False
 
         # Log QemuRunner log output to a file
         import oe.path
@@ -153,6 +159,7 @@ class QemuTarget(BaseTarget):
                             display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True),
                             logfile = self.qemulog,
                             boottime = int(d.getVar("TEST_QEMUBOOT_TIMEOUT", True)),
+                            use_kvm = use_kvm,
                             dump_dir = dump_dir,
                             dump_host_cmds = d.getVar("testimage_dump_host", True))
 
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index df73120..77e506f 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -29,7 +29,7 @@ re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
 class QemuRunner:
 
-    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds):
+    def __init__(self, machine, rootfs, display, tmpdir, deploy_dir_image, logfile, boottime, dump_dir, dump_host_cmds, use_kvm):
 
         # Popen object for runqemu
         self.runqemu = None
@@ -49,6 +49,7 @@ class QemuRunner:
         self.boottime = boottime
         self.logged = False
         self.thread = None
+        self.use_kvm = use_kvm
 
         self.runqemutime = 60
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
@@ -133,7 +134,13 @@ class QemuRunner:
         self.origchldhandler = signal.getsignal(signal.SIGCHLD)
         signal.signal(signal.SIGCHLD, self.handleSIGCHLD)
 
-        launch_cmd = 'runqemu tcpserial=%s %s %s %s' % (self.serverport, self.machine, self.rootfs, self.qemuparams)
+        launch_cmd = 'runqemu '
+        if self.use_kvm:
+            logger.info('Using kvm for runqemu')
+            launch_cmd += 'kvm '
+        else:
+            logger.info('Not using kvm for runqemu')
+        launch_cmd += 'tcpserial=%s %s %s %s' % (self.serverport, self.machine, self.rootfs, self.qemuparams)
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
         # oe-selftest (this makes stty error out immediately). There ought
-- 
2.5.5


