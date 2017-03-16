Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2578D771DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:13:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GADaaR003347
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 03:13:36 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 03:13:35 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Mar 2017 03:13:29 -0700
Message-ID: <e9e16b966e553248c8e3ba7e453d748a5d44ec80.1489657029.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1489657029.git.liezhi.yang@windriver.com>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] targetcontrol.py: use logger.info to replace of bb.note
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
X-List-Received-Date: Thu, 16 Mar 2017 10:13:35 -0000
Content-Type: text/plain

The bb.note prints multiple same lines when invoke this class again, but
if we set mainlogger.propagate = False, nothing would be printed,
according to logging's document:

https://docs.python.org/3/library/logging.html
Note
If you attach a handler to a logger and one or more of its ancestors, it
may emit the same record multiple times. In general, you should not need
to attach a handler to more than one logger - if you just attach it to
the appropriate logger which is highest in the logger hierarchy, then it
will see all events logged by all descendant loggers, provided that
their propagate setting is left set to True. A common scenario is to
attach handlers only to the root logger, and to let propagation take
care of the rest.

We may need avoid using bb.note or bb.warn in oeqa since it attaches
multiple log handlers which may cause confusions

This patch only sets "mainlogger.propagate = False" in
selftest/runqemu.py and use logger.info to replace bb.note in
targetcontrol.py to minimize the impact.

[YOCTO #10249]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/runqemu.py |  4 ++++
 meta/lib/oeqa/targetcontrol.py    | 13 +++++++------
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/runqemu.py b/meta/lib/oeqa/selftest/runqemu.py
index c1d5c16..58c6f96 100644
--- a/meta/lib/oeqa/selftest/runqemu.py
+++ b/meta/lib/oeqa/selftest/runqemu.py
@@ -21,6 +21,10 @@ class RunqemuTests(oeSelfTest):
         self.fstypes = "ext4 iso hddimg vmdk qcow2 vdi"
         self.cmd_common = "runqemu nographic"
 
+        # Avoid emit the same record multiple times.
+        mainlogger = logging.getLogger("BitBake.Main")
+        mainlogger.propagate = False
+
         self.write_config(
 """
 MACHINE = "%s"
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 8d11cf0..82aaf2f 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -18,6 +18,8 @@ from oeqa.utils.dump import TargetDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
+logger = logging.getLogger('BitBake.QemuRunner')
+
 def get_target_controller(d):
     testtarget = d.getVar("TEST_TARGET")
     # old, simple names
@@ -63,7 +65,7 @@ class BaseTarget(object, metaclass=ABCMeta):
         if os.path.islink(sshloglink):
             os.unlink(sshloglink)
         os.symlink(self.sshlog, sshloglink)
-        bb.note("SSH log file: %s" %  self.sshlog)
+        logger.info("SSH log file: %s" %  self.sshlog)
 
     @abstractmethod
     def start(self, params=None, ssh=True, extra_bootparams=None):
@@ -140,7 +142,6 @@ class QemuTarget(BaseTarget):
         import oe.path
         bb.utils.mkdirhier(self.testdir)
         self.qemurunnerlog = os.path.join(self.testdir, 'qemurunner_log.%s' % self.datetime)
-        logger = logging.getLogger('BitBake.QemuRunner')
         loggerhandler = logging.FileHandler(self.qemurunnerlog)
         loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
         logger.addHandler(loggerhandler)
@@ -177,8 +178,8 @@ class QemuTarget(BaseTarget):
             os.unlink(qemuloglink)
         os.symlink(self.qemulog, qemuloglink)
 
-        bb.note("rootfs file: %s" %  self.rootfs)
-        bb.note("Qemu log file: %s" % self.qemulog)
+        logger.info("rootfs file: %s" %  self.rootfs)
+        logger.info("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
     def start(self, params=None, ssh=True, extra_bootparams='', runqemuparams='', launch_cmd=''):
@@ -230,14 +231,14 @@ class SimpleRemoteTarget(BaseTarget):
             self.port = addr.split(":")[1]
         except IndexError:
             self.port = None
-        bb.note("Target IP: %s" % self.ip)
+        logger.info("Target IP: %s" % self.ip)
         self.server_ip = d.getVar("TEST_SERVER_IP")
         if not self.server_ip:
             try:
                 self.server_ip = subprocess.check_output(['ip', 'route', 'get', self.ip ]).split("\n")[0].split()[-1]
             except Exception as e:
                 bb.fatal("Failed to determine the host IP address (alternatively you can set TEST_SERVER_IP with the IP address of this machine): %s" % e)
-        bb.note("Server IP: %s" % self.server_ip)
+        logger.info("Server IP: %s" % self.server_ip)
 
     def deploy(self):
         super(SimpleRemoteTarget, self).deploy()
-- 
2.9.0


