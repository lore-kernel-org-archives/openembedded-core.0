Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D513C7866D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 16:28:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vADGSbNf018018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 08:28:37 -0800 (PST)
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 08:28:37 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Nov 2017 11:28:30 -0500
Message-ID: <1510590512-17590-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] utils: qemurunner.py: Add wall clock to 'timeout' logging
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
X-List-Received-Date: Mon, 13 Nov 2017 16:28:37 -0000
Content-Type: text/plain

When debugging issues when timeouts are involved it is always best to
have wall clock times included. This helps give confidence that the
timeout is in fact run down at the right rate and that no unexpected
events were the true cause of a premature running down of the
timeout. Having these times in old logs also helps when debugging
issues as we have a historic record as to what is a 'typical' time to
complete an action.

In addition to adding the wall clock times the time to 'login' is now
printed making it consistent with the time to 'qemu pid'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 82335d8..2121a0d 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -194,7 +194,8 @@ class QemuRunner:
             sys.exit(0)
 
         self.logger.debug("runqemu started, pid is %s" % self.runqemu.pid)
-        self.logger.debug("waiting at most %s seconds for qemu pid" % self.runqemutime)
+        self.logger.debug("waiting at most %s seconds for qemu pid (%s)" %
+                          (self.runqemutime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.runqemutime
         while not self.is_alive() and time.time() < endtime:
             if self.runqemu.poll():
@@ -208,7 +209,8 @@ class QemuRunner:
             time.sleep(0.5)
 
         if not self.is_alive():
-            self.logger.error("Qemu pid didn't appear in %s seconds" % self.runqemutime)
+            self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
+                              (self.runqemutime, time.strftime("%D %H:%M:%S")))
             # Dump all processes to help us to figure out what is going on...
             ps = subprocess.Popen(['ps', 'axww', '-o', 'pid,ppid,command '], stdout=subprocess.PIPE).communicate()[0]
             processes = ps.decode("utf-8")
@@ -225,7 +227,9 @@ class QemuRunner:
         # We are alive: qemu is running
         out = self.getOutput(output)
         netconf = False # network configuration is not required by default
-        self.logger.debug("qemu started in %s seconds - qemu procces pid is %s" % (time.time() - (endtime - self.runqemutime), self.qemupid))
+        self.logger.debug("qemu started in %s seconds - qemu procces pid is %s (%s)" %
+                          (time.time() - (endtime - self.runqemutime),
+                           self.qemupid, time.strftime("%D %H:%M:%S")))
         if get_ip:
             cmdline = ''
             with open('/proc/%s/cmdline' % self.qemupid) as p:
@@ -269,7 +273,8 @@ class QemuRunner:
             return False
 
         self.logger.debug("Output from runqemu:\n%s", out)
-        self.logger.debug("Waiting at most %d seconds for login banner" % self.boottime)
+        self.logger.debug("Waiting at most %d seconds for login banner (%s)" %
+                          (self.boottime, time.strftime("%D %H:%M:%S")))
         endtime = time.time() + self.boottime
         socklist = [self.server_socket]
         reachedlogin = False
@@ -300,7 +305,9 @@ class QemuRunner:
                                 self.server_socket = qemusock
                                 stopread = True
                                 reachedlogin = True
-                                self.logger.debug("Reached login banner")
+                                self.logger.debug("Reached login banner in %s seconds (%s)" %
+                                                  (time.time() - (endtime - self.boottime),
+                                                  time.strftime("%D %H:%M:%S")))
                         except UnicodeDecodeError:
                             continue
                     else:
@@ -310,7 +317,8 @@ class QemuRunner:
 
 
         if not reachedlogin:
-            self.logger.debug("Target didn't reached login boot in %d seconds" % self.boottime)
+            self.logger.debug("Target didn't reached login boot in %d seconds (%s)" %
+                              (self.boottime, time.strftime("%D %H:%M:%S")))
             tail = lambda l: "\n".join(l.splitlines()[-25:])
             # in case bootlog is empty, use tail qemu log store at self.msg
             lines = tail(bootlog if bootlog else self.msg)
-- 
2.7.4


