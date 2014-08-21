Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 519B970EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKkW55021634 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:46:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id C-PO-vosQaAy
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:46:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKkRYY021631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 21:46:28 +0100
Message-ID: <1408653988.1669.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 21:46:28 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] lib/oe/package_manager: Add utils function for multiprocess execution
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
X-List-Received-Date: Thu, 21 Aug 2014 20:46:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Our usage of multitprocessing is problematic. In particular, there is a bug
in python 2.7 multiprocessing where signals are not handled until command
completion instead of immediately.

This factors the multiprocess code into a function which is enhanced with
a workaround to ensure immediate signal handling and also better SIGINT
handling which should happen in the parent, not the children to ensure
clean exits. The workaround for the signals is being added to the core
bb.utils function so it can benefit all users.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 8be3d41..f8fc3c2 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -7,6 +7,7 @@ import multiprocessing
 import re
 import bb
 import tempfile
+import oe.utils
 
 
 # this can be used by all PM backends to create the index files in parallel
@@ -116,16 +117,7 @@ class RpmIndexer(Indexer):
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        results = list(pool.imap(create_index, index_cmds))
-        pool.close()
-        pool.join()
-
-        for result in results:
-            if result is not None:
-                return(result)
-
+        oe.utils.multiprocess_exec(index_cmds, create_index)
 
 class OpkgIndexer(Indexer):
     def write_index(self):
@@ -161,15 +153,7 @@ class OpkgIndexer(Indexer):
             bb.note("There are no packages in %s!" % self.deploy_dir)
             return
 
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        results = list(pool.imap(create_index, index_cmds))
-        pool.close()
-        pool.join()
-
-        for result in results:
-            if result is not None:
-                return(result)
+        oe.utils.multiprocess_exec(index_cmds, create_index)
 
 
 class DpkgIndexer(Indexer):
@@ -210,15 +194,7 @@ class DpkgIndexer(Indexer):
             bb.note("There are no packages in %s" % self.deploy_dir)
             return
 
-        nproc = multiprocessing.cpu_count()
-        pool = bb.utils.multiprocessingpool(nproc)
-        results = list(pool.imap(create_index, index_cmds))
-        pool.close()
-        pool.join()
-
-        for result in results:
-            if result is not None:
-                return(result)
+        oe.utils.multiprocess_exec(index_cmds, create_index)
 
 
 class PkgsList(object):
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 0a1d108..92e21a4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -151,3 +151,32 @@ def execute_pre_post_process(d, cmds):
         if cmd != '':
             bb.note("Executing %s ..." % cmd)
             bb.build.exec_func(cmd, d)
+
+def multiprocess_exec(commands, function):
+    import signal
+    import multiprocessing
+
+    if not commands:
+        return []
+
+    def init_worker():
+        signal.signal(signal.SIGINT, signal.SIG_IGN)
+
+    nproc = min(multiprocessing.cpu_count(), len(commands))
+    pool = bb.utils.multiprocessingpool(nproc, init_worker)
+    imap = pool.imap(function, commands)
+
+    try:
+        results = list(imap)
+        pool.close()
+        pool.join()
+        results = []
+        for result in results:
+            if result is not None:
+                results.append(result)
+        return results
+
+    except KeyboardInterrupt:
+        pool.terminate()
+        pool.join()
+        raise



