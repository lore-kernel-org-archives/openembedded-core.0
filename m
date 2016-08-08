Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 39E94771C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 20:41:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2016 13:41:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,491,1464678000"; d="scan'208";a="1031974587"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.36])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2016 13:41:23 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 15:41:28 -0500
Message-Id: <1470688888-15751-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] oeqa: start() add remaining args SimpleRemoteTarget and QemuTinyRunner
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
X-List-Received-Date: Mon, 08 Aug 2016 20:41:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now Runner's support extra_bootargs for the kernel so add
extra_bootparams to the start() methods to avoid exception.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py        | 4 ++--
 meta/lib/oeqa/utils/qemutinyrunner.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d3b49b7..768c463 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -66,7 +66,7 @@ class BaseTarget(object, metaclass=ABCMeta):
         bb.note("SSH log file: %s" %  self.sshlog)
 
     @abstractmethod
-    def start(self, params=None, ssh=True):
+    def start(self, params=None, ssh=True, extra_bootparams=None):
         pass
 
     @abstractmethod
@@ -230,7 +230,7 @@ class SimpleRemoteTarget(BaseTarget):
     def deploy(self):
         super(SimpleRemoteTarget, self).deploy()
 
-    def start(self, params=None, ssh=True):
+    def start(self, params=None, ssh=True, extra_bootparams=None):
         if ssh:
             self.connection = SSHControl(self.ip, logfile=self.sshlog, port=self.port)
 
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index c823157..7f7489d 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -60,7 +60,7 @@ class QemuTinyRunner(QemuRunner):
             with open(self.logfile, "a") as f:
                 f.write("%s" % msg)
 
-    def start(self, qemuparams = None):
+    def start(self, qemuparams = None, ssh=True, extra_bootparams=None):
 
         if self.display:
             os.environ["DISPLAY"] = self.display
@@ -167,4 +167,4 @@ class QemuTinyRunner(QemuRunner):
             basecmd = commands[p].split()[0]
             basecmd = os.path.basename(basecmd)
             if "qemu-system" in basecmd and "-serial unix" in commands[p]:
-                return [int(p),commands[p]]
\ No newline at end of file
+                return [int(p),commands[p]]
-- 
2.1.4


