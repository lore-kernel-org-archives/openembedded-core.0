Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E48EE7713E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 07:50:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w577oMsY019849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2018 00:50:37 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 7 Jun 2018 00:50:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jun 2018 15:52:46 +0800
Message-ID: <a8f5811e20518ee8ec3a2e85916ec8f1cc04427b.1528357628.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528357628.git.Qi.Chen@windriver.com>
References: <cover.1528357628.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] runqemu: add SIGTERM handler to make sure things are cleaned up
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
X-List-Received-Date: Thu, 07 Jun 2018 07:50:47 -0000
Content-Type: text/plain

Add SIGTERM handler so that runqemu could clean things up correctly
when receving such signal.

This problem was originally observed when running testimage. On
some hosts, after running testimage task, the user has to manually
operate on the tap interface (e.g. `sudo ip link del tap0') in order
for the next runqemu command to launch successfully.

The problem is about runqemu, SIGTERM and network manager on the host.

In testimage task, the runqemu process will receive SIGTERM. In such
situation, its cleanup() function is not run, resulting in tap interface
not cleaned up. On some hosts, the network manager will bring down the
tap interface automatically, thus this problem. I saw this problem on
Fedora21.

I think we'd better just clean up the tap interface ourselves.

So this patch adds to runqemu a SIGTERM handler, in which the actual
qemu process is terminated and other things cleaned up.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/runqemu | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d998494..de42d0f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -27,6 +27,7 @@ import fcntl
 import shutil
 import glob
 import configparser
+import signal
 
 class RunQemuError(Exception):
     """Custom exception to raise on known errors."""
@@ -233,6 +234,10 @@ class BaseConfig(object):
         # slirp qemus are running.
         self.mac_tap = "52:54:00:12:34:"
         self.mac_slirp = "52:54:00:12:35:"
+        # pid of the actual qemu process
+        self.qemupid = None
+        # avoid cleanup twice
+        self.cleaned = False
 
     def acquire_lock(self, error=True):
         logger.debug("Acquiring lockfile %s..." % self.lock)
@@ -1200,10 +1205,18 @@ class BaseConfig(object):
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
         logger.info('Running %s\n' % cmd)
         process = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
+        self.qemupid = process.pid
         if process.wait():
             logger.error("Failed to run qemu: %s", process.stderr.read().decode())
 
     def cleanup(self):
+        if self.cleaned:
+            return
+
+        # avoid dealing with SIGTERM when cleanup function is running
+        signal.signal(signal.SIGTERM, signal.SIG_IGN)
+
+        logger.info("Cleaning up")
         if self.cleantap:
             cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % cmd)
@@ -1227,6 +1240,8 @@ class BaseConfig(object):
             shutil.rmtree(self.rootfs)
             shutil.rmtree('%s.pseudo_state' % self.rootfs)
 
+        self.cleaned = True
+
     def load_bitbake_env(self, mach=None):
         if self.bitbake_e:
             return
@@ -1282,6 +1297,13 @@ def main():
         return 0
     try:
         config = BaseConfig()
+
+        def sigterm_handler(signum, frame):
+            logger.info("SIGTERM received")
+            os.kill(config.qemupid, signal.SIGTERM)
+            config.cleanup()
+        signal.signal(signal.SIGTERM, sigterm_handler)
+
         config.check_args()
         config.read_qemuboot()
         config.check_and_set()
@@ -1300,7 +1322,6 @@ def main():
         traceback.print_exc()
         return 1
     finally:
-        print("Cleanup")
         config.cleanup()
 
 if __name__ == "__main__":
-- 
1.9.1


