Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4872A734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 17:00:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2015 10:00:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="651615524"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 24 Sep 2015 10:00:22 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 08:52:51 +0000
Message-Id: <dd8f0cd54df04854359ea31ba7b523a64d4ba033.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 1/3] prserv/serv: Start/Stop daemon using ip instead of host
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
X-List-Received-Date: Thu, 24 Sep 2015 17:00:44 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

In cases where hostname is given instead of an IP (i.e. localhost
instead of 127.0.0.1) when stopping the server with bitbake-prserv --stop,
the server shows a misleading message indicating that the daemon was not
found, where it is actually stopped. This patch converts host to IP values
before starting/stopping the daemon, so it will always work on IP, not on
hostnames, avoiding problems like the latter.

[YOCTO #8258]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 bitbake/lib/prserv/serv.py | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
index 0507485..0d96963 100644
--- a/bitbake/lib/prserv/serv.py
+++ b/bitbake/lib/prserv/serv.py
@@ -3,6 +3,7 @@ import signal, time
 from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
 import threading
 import Queue
+import socket
 
 try:
     import sqlite3
@@ -37,7 +38,6 @@ singleton = None
 class PRServer(SimpleXMLRPCServer):
     def __init__(self, dbfile, logfile, interface, daemon=True):
         ''' constructor '''
-        import socket
         try:
             SimpleXMLRPCServer.__init__(self, interface,
                                         logRequests=False, allow_none=True)
@@ -261,7 +261,8 @@ class PRServerConnection(object):
         return self.host, self.port
 
 def start_daemon(dbfile, host, port, logfile):
-    pidfile = PIDPREFIX % (host, port)
+    ip = socket.gethostbyname(host)
+    pidfile = PIDPREFIX % (ip, port)
     try:
         pf = file(pidfile,'r')
         pid = int(pf.readline().strip())
@@ -274,12 +275,14 @@ def start_daemon(dbfile, host, port, logfile):
                             % pidfile)
         return 1
 
-    server = PRServer(os.path.abspath(dbfile), os.path.abspath(logfile), (host,port))
+    server = PRServer(os.path.abspath(dbfile), os.path.abspath(logfile), (ip,port))
     server.start()
+
     return 0
 
 def stop_daemon(host, port):
-    pidfile = PIDPREFIX % (host, port)
+    ip = socket.gethostbyname(host)
+    pidfile = PIDPREFIX % (ip, port)
     try:
         pf = file(pidfile,'r')
         pid = int(pf.readline().strip())
@@ -292,7 +295,7 @@ def stop_daemon(host, port):
                         % pidfile)
 
     try:
-        PRServerConnection(host, port).terminate()
+        PRServerConnection(ip, port).terminate()
     except:
         logger.critical("Stop PRService %s:%d failed" % (host,port))
 
-- 
1.8.4.5


