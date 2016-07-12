Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 269666AC4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:29:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2016 14:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,353,1464678000"; d="scan'208";a="138057037"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.159])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2016 14:29:30 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 16:29:49 -0500
Message-Id: <1468358990-14377-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
References: <1468358990-14377-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] utils/qemurunner.py: QemuRunner.start() add support for specify extra kernel cmdline
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
X-List-Received-Date: Tue, 12 Jul 2016 21:29:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add ability to specify extra_bootargs (kernel cmdline) in order to enable systemd
debug log in images that enables systemd init.

[YOCTO #9299]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py    | 4 ++--
 meta/lib/oeqa/utils/qemurunner.py | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 1c57efa..d3b49b7 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -174,8 +174,8 @@ class QemuTarget(BaseTarget):
         bb.note("Qemu log file: %s" % self.qemulog)
         super(QemuTarget, self).deploy()
 
-    def start(self, params=None, ssh=True):
-        if self.runner.start(params, get_ip=ssh):
+    def start(self, params=None, ssh=True, extra_bootparams=None):
+        if self.runner.start(params, get_ip=ssh, extra_bootparams=extra_bootparams):
             if ssh:
                 self.ip = self.runner.ip
                 self.server_ip = self.runner.server_ip
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index b8ac3f0..df73120 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -92,7 +92,7 @@ class QemuRunner:
                 self._dump_host()
                 raise SystemExit
 
-    def start(self, qemuparams = None, get_ip = True):
+    def start(self, qemuparams = None, get_ip = True, extra_bootparams = None):
         if self.display:
             os.environ["DISPLAY"] = self.display
             # Set this flag so that Qemu doesn't do any grabs as SDL grabs
@@ -120,7 +120,11 @@ class QemuRunner:
             return False
 
 
-        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8 printk.time=1" qemuparams="-serial tcp:127.0.0.1:{}"'.format(threadport)
+        bootparams = 'console=tty1 console=ttyS0,115200n8 printk.time=1'
+        if extra_bootparams:
+            bootparams = bootparams + ' ' + extra_bootparams
+
+        self.qemuparams = 'bootparams="{0}" qemuparams="-serial tcp:127.0.0.1:{1}"'.format(bootparams, threadport)
         if not self.display:
             self.qemuparams = 'nographic ' + self.qemuparams
         if qemuparams:
-- 
2.1.4


