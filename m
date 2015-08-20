Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF5776AC5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 23:46:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 20 Aug 2015 16:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="629381537"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 20 Aug 2015 16:46:17 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 16:46:11 -0700
Message-Id: <1440114373-4317-2-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1440114373-4317-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
	<1440114373-4317-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH V2 1/3] qemurunner.py: Move some class variables that should only be local
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
X-List-Received-Date: Thu, 20 Aug 2015 23:46:20 -0000

The bootlog and qemusock variables were set in the class as part of the
create_socket() routine. However those variables are never used outside
of the same function and thus serve no purpose as class variables.

This initializes those variables near where they are used.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 0458447..c5bb13c 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -43,9 +43,6 @@ class QemuRunner:
 
     def create_socket(self):
 
-        self.bootlog = ''
-        self.qemusock = None
-
         try:
             self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
             self.server_socket.setblocking(0)
@@ -145,22 +142,24 @@ class QemuRunner:
             socklist = [self.server_socket]
             reachedlogin = False
             stopread = False
+            qemusock = None
+            bootlog = ''
             while time.time() < endtime and not stopread:
                 sread, swrite, serror = select.select(socklist, [], [], 5)
                 for sock in sread:
                     if sock is self.server_socket:
-                        self.qemusock, addr = self.server_socket.accept()
-                        self.qemusock.setblocking(0)
-                        socklist.append(self.qemusock)
+                        qemusock, addr = self.server_socket.accept()
+                        qemusock.setblocking(0)
+                        socklist.append(qemusock)
                         socklist.remove(self.server_socket)
                         logger.info("Connection from %s:%s" % addr)
                     else:
                         data = sock.recv(1024)
                         if data:
                             self.log(data)
-                            self.bootlog += data
-                            if re.search(".* login:", self.bootlog):
-                                self.server_socket = self.qemusock
+                            bootlog += data
+                            if re.search(".* login:", bootlog):
+                                self.server_socket = qemusock
                                 stopread = True
                                 reachedlogin = True
                                 logger.info("Reached login banner")
@@ -171,7 +170,7 @@ class QemuRunner:
 
             if not reachedlogin:
                 logger.info("Target didn't reached login boot in %d seconds" % self.boottime)
-                lines = "\n".join(self.bootlog.splitlines()[-25:])
+                lines = "\n".join(bootlog.splitlines()[-25:])
                 logger.info("Last 25 lines of text:\n%s" % lines)
                 logger.info("Check full boot log: %s" % self.logfile)
                 self.stop()
-- 
2.4.3


