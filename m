Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6408173BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 17:00:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2015 10:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="651615525"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 24 Sep 2015 10:00:22 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 08:52:52 +0000
Message-Id: <b21c91143e91d546b7349451cc5be427c7061db2.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1443072637.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 2/3] prserv/serv.py: Better messaging when starting/stopping the server with port=0
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

When starting the server using port=0, the server actually starts with a
different port, so print a message with this new value. When stopping the
server with port=0, advise the user which ports the server is listening to,
so next time it tries to close it, user can pick up the correct one.

[YOCTO #8560]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 bitbake/lib/prserv/serv.py | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/prserv/serv.py b/bitbake/lib/prserv/serv.py
index 0d96963..3558d4d 100644
--- a/bitbake/lib/prserv/serv.py
+++ b/bitbake/lib/prserv/serv.py
@@ -278,9 +278,16 @@ def start_daemon(dbfile, host, port, logfile):
     server = PRServer(os.path.abspath(dbfile), os.path.abspath(logfile), (ip,port))
     server.start()
 
+    # Sometimes, the port (i.e. localhost:0) indicated by the user does not match with
+    # the one the server actually is listening, so at least warn the user about it
+    _,rport = server.getinfo()
+    if port != rport:
+        sys.stdout.write("Server is listening at port %s instead of %s\n"
+                         % (rport,port))
     return 0
 
 def stop_daemon(host, port):
+    import glob
     ip = socket.gethostbyname(host)
     pidfile = PIDPREFIX % (ip, port)
     try:
@@ -291,8 +298,20 @@ def stop_daemon(host, port):
         pid = None
 
     if not pid:
-        sys.stderr.write("pidfile %s does not exist. Daemon not running?\n"
-                        % pidfile)
+        # when server starts at port=0 (i.e. localhost:0), server actually takes another port,
+        # so at least advise the user which ports the corresponding server is listening
+        ports = []
+        portstr = ""
+        for pf in glob.glob(PIDPREFIX % (ip,'*')):
+            bn = os.path.basename(pf)
+            root, _ = os.path.splitext(bn)
+            ports.append(root.split('_')[-1])
+        if len(ports):
+            portstr = "Wrong port? Other ports listening at %s: %s" % (host, ' '.join(ports))
+
+        sys.stderr.write("pidfile %s does not exist. Daemon not running? %s\n"
+                         % (pidfile,portstr))
+        return 1
 
     try:
         PRServerConnection(ip, port).terminate()
-- 
1.8.4.5


