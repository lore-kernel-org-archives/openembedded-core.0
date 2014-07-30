Return-Path: <dmtkatsa@gmail.com>
Received: from mail-lb0-f193.google.com (mail-lb0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDF5D60CFC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 22:28:43 +0000 (UTC)
Received: by mail-lb0-f193.google.com with SMTP id v6so420505lbi.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 15:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=YO/6uhgmEq0ezfwNy2GGJxcQDa/ADR7D+xqmfZ10ZY4=;
	b=fmoHdOtTbmwthgKcwUvBIqax2il1R4WqRshnNjoH8ZdVAaHeWHyT5vYMyoYswGtbbn
	xDvMjwCscBU63iBmxcJ9rVVeUiLmI+mO113aGdWyrKCrj9QgppLQCW2LapR2MwBDef7D
	O2rEYbaX+DSGzKu4w7+v2ahkarAjw4CuWGqIgLZH6QtpcHITNmUfemvGq+zQc3q/w/kH
	n1ImWhjbKZYFq7B4whSzN3K4enttGDtexvpI4QqSSs4u2It3m2qkD+b/IPzKME63YI9N
	2X/mSg6cMKRjDaIG1QH+sZB929VmwnDXuSCZPxQNaGjNNFmU544LaiotVHxB8vWdtN2M
	ShJw==
X-Received: by 10.152.184.234 with SMTP id ex10mr7778179lac.53.1406759324785; 
	Wed, 30 Jul 2014 15:28:44 -0700 (PDT)
Received: from localhost (cpe.xe-3-0-0-452.vbynqu1.dk.customer.tdc.net.
	[93.167.196.226])
	by mx.google.com with ESMTPSA id pz3sm5297523lbb.1.2014.07.30.15.28.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jul 2014 15:28:44 -0700 (PDT)
Sender: Dimitrios Katsaros <patcherwork@gmail.com>
From: Dimitrios Katsaros <dmtkatsa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2014 00:27:58 +0200
Message-Id: <1406759278-3258-1-git-send-email-dmtkatsa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] PR_Service: Improvement of persistance of PR service
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
X-List-Received-Date: Wed, 30 Jul 2014 22:28:45 -0000

The current implementation only commits database changes
after database exceptions or daemon shutdown. This patch adds
a delayed commit after every request finish, defaulting to 20 seconds.
I chose to make the sync on the consumer thread rather than the
producer. This is to avoid simultaneous access to the database.
I chose to use a separate timeout than the timeout defined for handle_request
in work_forever. This is because the consumer thread would reach the
handle_request before the quit flag was set. Thus for long timeouts
the stop_daemon function would have to wait for an equally long
amount of time.

This solution is based on this discussion :
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg52932.html

Signed-off-by: Dimitrios Katsaros <dmtkatsa@gmail.com>
---
 bitbake/lib/prserv/serv.py | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
index 1e170ce..9c37339 100644
--- a/bitbake/lib/prserv/serv.py
+++ b/bitbake/lib/prserv/serv.py
@@ -1,4 +1,4 @@
-import os,sys,logging
+import os,sys,logging, time
 import signal, time, atexit, threading
 from SimpleXMLRPCServer import SimpleXMLRPCServer, SimpleXMLRPCRequestHandler
 import xmlrpclib
@@ -36,7 +36,7 @@ singleton = None
 
 
 class PRServer(SimpleXMLRPCServer):
-    def __init__(self, dbfile, logfile, interface, daemon=True):
+    def __init__(self, dbfile, logfile, interface, daemon=True, sync_timeout=20):
         ''' constructor '''
         SimpleXMLRPCServer.__init__(self, interface,
                                     logRequests=False, allow_none=True)
@@ -46,6 +46,8 @@ class PRServer(SimpleXMLRPCServer):
         self.working_thread=None
         self.host, self.port = self.socket.getsockname()
         self.pidfile=PIDPREFIX % (self.host, self.port)
+        self.dirty = False
+        self.sync_timeout = sync_timeout
 
         self.register_function(self.getPR, "getPR")
         self.register_function(self.quit, "quit")
@@ -70,8 +72,13 @@ class PRServer(SimpleXMLRPCServer):
         while True:
             (request, client_address) = self.requestqueue.get()
             try:
-                self.finish_request(request, client_address)
-                self.shutdown_request(request)
+                if request == "Sync":
+                    self.table.sync()
+                else:
+                    self.finish_request(request, client_address)
+                    self.shutdown_request(request)
+                    self.time_from_dirty = time.time()
+                    self.dirty = True
             except:
                 self.handle_error(request, client_address)
                 self.shutdown_request(request)
@@ -126,6 +133,13 @@ class PRServer(SimpleXMLRPCServer):
         self.server_close()
         return
 
+    def handle_timeout(self):
+        if self.dirty:
+            # making the consumer thead perform sync to ensure thread safty
+            if time.time() - self.time_from_dirty > self.sync_timeout:
+                self.requestqueue.put(("Sync", None))
+                self.dirty = False
+
     def start(self):
         pid = self.daemonize()
         # Ensure both the parent sees this and the child from the work_forever log entry above
-- 
1.9.1


