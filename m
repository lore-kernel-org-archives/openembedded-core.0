Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B19E2766DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 22:24:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 15:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="629341551"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 20 Aug 2015 15:24:12 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 15:24:09 -0700
Message-Id: <1440109450-9173-3-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
Subject: [PATCH 2/3] qemurunner: Make create_socket() return data and use exceptions
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
X-List-Received-Date: Thu, 20 Aug 2015 22:24:12 -0000

So that create_socket() can be called more than once to create sockets,
it now returns the socket and port rather than setting class variables
directly.

create_socket() now only uses exceptions for errors, not the return
value from the function.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c5bb13c..c8d6899 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -42,20 +42,18 @@ class QemuRunner:
         self.runqemutime = 60
 
     def create_socket(self):
-
         try:
-            self.server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
-            self.server_socket.setblocking(0)
-            self.server_socket.bind(("127.0.0.1",0))
-            self.server_socket.listen(2)
-            self.serverport = self.server_socket.getsockname()[1]
-            logger.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % self.serverport)
-            return True
-        except socket.error, msg:
-            self.server_socket.close()
-            logger.error("Failed to create listening socket: %s" % msg[1])
-            return False
-
+            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+            sock.setblocking(0)
+            sock.bind(("127.0.0.1",0))
+            sock.listen(2)
+            port = sock.getsockname()[1]
+            logger.info("Created listening socket for qemu serial console on: 127.0.0.1:%s" % port)
+            return (sock, port)
+
+        except socket.error:
+            sock.close()
+            raise
 
     def log(self, msg):
         if self.logfile:
@@ -82,7 +80,10 @@ class QemuRunner:
         else:
             os.environ["DEPLOY_DIR_IMAGE"] = self.deploy_dir_image
 
-        if not self.create_socket():
+        try:
+            self.server_socket, self.serverport = self.create_socket()
+        except socket.error, msg:
+            logger.error("Failed to create listening socket: %s" % msg[1])
             return False
 
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
-- 
2.4.3


