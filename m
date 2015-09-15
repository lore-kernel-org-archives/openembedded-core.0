Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DCEDA769A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 23:07:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 15 Sep 2015 16:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,537,1437462000"; d="scan'208";a="790179029"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2015 16:07:08 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 14:59:39 +0000
Message-Id: <4071162f4a5c0b32224c8c87b9e0deab82011787.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1442328203.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 2/3] prserv/serv.py: Better messaging when starting/stopping the server with port=0
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
X-List-Received-Date: Tue, 15 Sep 2015 23:07:26 -0000

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
index 0d96963..8b000e6 100644
--- a/bitbake/lib/prserv/serv.py
+++ b/bitbake/lib/prserv/serv.py
@@ -278,9 +278,16 @@ def start_daemon(dbfile, host, port, logfile):
     server = PRServer(os.path.abspath(dbfile), os.path.abspath(logfile), (ip,port))
     server.start()
 
+    # Sometimes, the port (i.e. localhost:0) indicated by the user does not match with
+    # the one the server actually is listening, so at least warn the user about it
+    _,rport = server.getinfo()
+    if port != rport:
+        sys.stderr.write("WARNING: Server is listening at port %s instead of %s\n"
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


