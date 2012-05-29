Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SZNx0-0006QA-2D
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 17:03:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4TEqnAu005378
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 07:52:52 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 29 May 2012 07:52:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 May 2012 22:53:07 +0800
Message-ID: <a32f1f619d2d181d166b99eda05e267e57048eef.1338302685.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1338302685.git.liezhi.yang@windriver.com>
References: <cover.1338302685.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/4] scripts: replace os.system with subprocess.call
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2012 15:03:18 -0000
Content-Type: text/plain

Replace os.system with subprocess.call since the older function would
fail (more or less) silently if the executed program cannot be found

More info:
http://docs.python.org/library/subprocess.html#subprocess-replacements

[YOCTO #2454]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/rpm-createsolvedb.py  |    5 +++--
 scripts/swabber-strace-attach |    3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/rpm-createsolvedb.py b/scripts/rpm-createsolvedb.py
index 0d5f219..a5b61ba 100755
--- a/scripts/rpm-createsolvedb.py
+++ b/scripts/rpm-createsolvedb.py
@@ -14,6 +14,7 @@
 import sys, os
 import hashlib
 import stat
+import subprocess
 
 if len(sys.argv) < 1:
     print("Error, rpm command not specified")
@@ -44,7 +45,7 @@ for path in paths:
         continue
 
     if os.path.exists(path + "/solvedb"):
-        os.system("rm -rf %s" % (path + "/solvedb"))
+        subprocess.call("rm -rf %s" % (path + "/solvedb"), shell=True)
     os.mkdir(path + "/solvedb")
     m = open(path + "/solvedb/manifest", "w")
     m.write("# Dynamically generated solve manifest\n")
@@ -56,7 +57,7 @@ for path in paths:
 			--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
 			--ignoresize --nosignature --nodigest -D "__dbi_txn create nofsync" \
 			' + path + '/solvedb/manifest'
-    os.system(cmd)
+    subprocess.call(cmd, shell=True)
 
     open(path + "/solvedb.checksum", "w").write(checksum)
     open(path + "/solvedb.done", "w")
diff --git a/scripts/swabber-strace-attach b/scripts/swabber-strace-attach
index d4f80e4..bb0391a 100755
--- a/scripts/swabber-strace-attach
+++ b/scripts/swabber-strace-attach
@@ -1,6 +1,7 @@
 #!/usr/bin/env python
 import os
 import sys
+import subprocess
 
 # Detach from the controlling terminal and parent process by forking twice to daemonize ourselves,
 # then run the command passed as argv[1]. Send log data to argv[2].
@@ -24,7 +25,7 @@ os.dup2(si.fileno(), sys.stdin.fileno())
 os.dup2(so.fileno(), sys.stdout.fileno())
 os.dup2(se.fileno(), sys.stderr.fileno())
 
-ret = os.system(sys.argv[1])
+ret = subprocess.call(sys.argv[1], shell=True)
 
 os._exit(ret)
 
-- 
1.7.1



