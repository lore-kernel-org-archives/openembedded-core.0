Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9C9B07831C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 15:39:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 13 Jun 2017 08:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="1140826696"
Received: from pkuronen-mobl2.ger.corp.intel.com (HELO
	summit.ger.corp.intel.com) ([10.252.20.198])
	by orsmga001.jf.intel.com with ESMTP; 13 Jun 2017 08:39:16 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 18:39:09 +0300
Message-Id: <20170613153909.28112-1-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] runqemu: change terminal settings for valid tty's
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
X-List-Received-Date: Tue, 13 Jun 2017 15:39:18 -0000

runqemu uses stty to change terminal settings to give users
better control to qemu. However, stty does not work when
runqemu is run directly or indirectly via oe-selftest in
a Docker container (presumably some problems with Docker's
pseudo-tty implementation).

The error reported is:
stty: 'standard input': Inappropriate ioctl for device

As runqemu recently moved to subprocess.check_call() for
stty calls we now get thrown an error and all runqemu
runs fail.

sys.stdin.isatty() does proper job in detecting if the stty
calls can work so we use that check before running the stty
subprocess operations.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 scripts/runqemu | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 311fbebdf4..26328e5b51 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -955,8 +955,8 @@ class BaseConfig(object):
     def setup_network(self):
         if self.get('QB_NET') == 'none':
             return
-        cmd = "stty -g"
-        self.saved_stty = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        if sys.stdin.isatty():
+            self.saved_stty = subprocess.check_output("stty -g", shell=True).decode('utf-8')
         self.network_device = self.get('QB_NETWORK_DEVICE') or self.network_device
         if self.slirp_enabled:
             self.setup_slirp()
@@ -1096,9 +1096,9 @@ class BaseConfig(object):
             self.qemu_opt += " -snapshot"
 
         if self.serialstdio:
-            logger.info("Interrupt character is '^]'")
-            cmd = "stty intr ^]"
-            subprocess.check_call(cmd, shell=True)
+            if sys.stdin.isatty():
+                subprocess.check_call("stty intr ^]", shell=True)
+                logger.info("Interrupt character is '^]'")
 
             first_serial = ""
             if not re.search("-nographic", self.qemu_opt):
-- 
2.11.0


