Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9EED073BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 17:00:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2015 10:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="651615526"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 24 Sep 2015 10:00:22 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 08:52:53 +0000
Message-Id: <58087c03b04e6fcd6988e77cc7c3886b397ad74c.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 3/3] prserv/serv: Close the DB connection out of class destructor
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
X-List-Received-Date: Thu, 24 Sep 2015 17:00:45 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

When launching the PR server daemon, the PRData __del__ function was being
called (no reason found yet) where the DB connection closed, thus following
PR updates were not getting into the DB. This patch closes the connection
explicitly, not relaying on the __del__ function execution.
Closing the connection in turn causes all WAL file transactions to be moved
into the database (checkpoint), thus effectively updating the database.

[YOCTO #8215]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 bitbake/lib/prserv/db.py   | 2 +-
 bitbake/lib/prserv/serv.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/prserv/db.py b/bitbake/lib/prserv/db.py
index 4379580..36c9f7b 100644
--- a/bitbake/lib/prserv/db.py
+++ b/bitbake/lib/prserv/db.py
@@ -248,7 +248,7 @@ class PRData(object):
         self.connection.execute("PRAGMA journal_mode = WAL;")
         self._tables={}
 
-    def __del__(self):
+    def disconnect(self):
         self.connection.close()
 
     def __getitem__(self,tblname):
diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
index 3558d4d..08298a6 100644
--- a/bitbake/lib/prserv/serv.py
+++ b/bitbake/lib/prserv/serv.py
@@ -141,7 +141,7 @@ class PRServer(SimpleXMLRPCServer):
         while not self.quit:
             self.handle_request()
         self.handlerthread.join()
-        self.table.sync()
+        self.db.disconnect()
         logger.info("PRServer: stopping...")
         self.server_close()
         return
-- 
1.8.4.5


