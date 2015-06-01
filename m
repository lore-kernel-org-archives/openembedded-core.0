Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ABB6275681
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 21:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LFm7O007359 for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:15:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FuYkkjjc7KDk
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 22:15:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t51LFYnT007356
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jun 2015 22:15:45 +0100
Message-ID: <1433193334.404.178.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 01 Jun 2015 22:15:34 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oe/utils: Add simple threaded pool implementation
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
X-List-Received-Date: Mon, 01 Jun 2015 21:15:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Python 2.7 doesn't have a threaded pool implementation, just a multiprocessing
one. We have need of a threaded implementation so add some simple class code
to support this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 6a1a07f..014a9c4 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -209,3 +209,44 @@ def multiprocess_exec(commands, function):
 def squashspaces(string):
     import re
     return re.sub("\s+", " ", string).strip()
+
+#
+# Python 2.7 doesn't have threaded pools (just multiprocessing)
+# so implement a version here
+#
+
+from Queue import Queue
+from threading import Thread
+
+class ThreadedWorker(Thread):
+    """Thread executing tasks from a given tasks queue"""
+    def __init__(self, tasks):
+        Thread.__init__(self)
+        self.tasks = tasks
+        self.daemon = True
+        self.start()
+
+    def run(self):
+        while True:
+            func, args, kargs = self.tasks.get()
+            try:
+                func(*args, **kargs)
+            except Exception, e:
+                print e
+            finally:
+                self.tasks.task_done()
+
+class ThreadedPool:
+    """Pool of threads consuming tasks from a queue"""
+    def __init__(self, num_threads):
+        self.tasks = Queue(num_threads)
+        for _ in range(num_threads): ThreadedWorker(self.tasks)
+
+    def add_task(self, func, *args, **kargs):
+        """Add a task to the queue"""
+        self.tasks.put((func, args, kargs))
+
+    def wait_completion(self):
+        """Wait for completion of all the tasks in the queue"""
+        self.tasks.join()
+



