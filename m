Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A997065C75
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 11:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t16BkePH029042 for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Feb 2015 11:46:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NdS4AF5CVLo1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 11:46:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t16BkPwc029038
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Feb 2015 11:46:36 GMT
Message-ID: <1423223184.20217.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 06 Feb 2015 11:46:24 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [POC PATCH] Add shared make jobserver support
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
X-List-Received-Date: Fri, 06 Feb 2015 11:46:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This is a WIP to add a make job server into bitbake. This means the pool
of make tokens is central and shared by all tasks executed instead of the
current one job pool per task. Currently we can end up with many more
make subprocesses executing that is intended or optimal.

Implementation wise, make usually uses a pipe for this functionality. Here
we substitute a named pipe (fifo) and intercept the make commands, passing
in file descriptors to the central fifo. This assumes knowledge of make's
internal API, on the plus side it hasn't changed since 1999.

Looking to the future we could dynamically control the pool but one step
at a time.

TODO:
  * Remove hardcoded /tmp/makefifo and use something in TMPDIR or similar
    (alongside the lock file?)
  * Remove hardcoded make threads number and set from PARALLEL_MAKE
  * If PARALLEL_MAKE = "", don't set MAKEARGS (currently parallelism is
    set everywhere) (need to check for -j in make commandline)

I'm sending this out so at least the code is available to people. Its
not ready for merging in its current form but might be the basis for
someone else to finish this up, it also gives us something we can test
the performance implications with.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index a6da72b..8b1763e 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1029,6 +1029,21 @@ class RunQueue:
             cache[task] = iscurrent
         return iscurrent
 
+    def setup_make_fifo(self):
+        fifoname = "/tmp/makefifo"
+        threads = 20
+        if os.path.exists(fifoname):
+            os.remove(fifoname)
+        os.mkfifo(fifoname)
+ 
+        # Has to be open for read and writing
+        self.makereadfd = os.open(fifoname, os.O_RDONLY|os.O_NONBLOCK)
+        self.makewritefd = os.open(fifoname, os.O_WRONLY)
+        wfd = os.fdopen(self.makewritefd, 'w')
+
+        for x in range(0, threads):
+            wfd.write('+')
+
     def _execute_runqueue(self):
         """
         Run the tasks in a queue prepared by rqdata.prepare()
@@ -1050,6 +1065,8 @@ class RunQueue:
                     depgraph = self.cooker.buildDependTree(self, self.rqdata.taskData)
                     bb.event.fire(bb.event.DepTreeGenerated(depgraph), self.cooker.data)
 
+                self.setup_make_fifo()
+
         if self.state is runQueueSceneInit:
             dump = self.cooker.configuration.dump_signatures
             if dump:
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b84232a..0d28685 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -422,7 +422,7 @@ EXTRA_IMAGEDEPENDS = ""
 # Toolchain info.
 ##################################################################
 
-PATH_prepend = "${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
+PATH_prepend = "${COREBASE}/scripts/make-intercept:${COREBASE}/scripts:${STAGING_BINDIR_TOOLCHAIN}:${STAGING_BINDIR_CROSS}:${STAGING_DIR_NATIVE}${sbindir_native}:${STAGING_BINDIR_NATIVE}:${STAGING_DIR_NATIVE}${base_sbindir_native}:${STAGING_DIR_NATIVE}${base_bindir_native}:"
 export PATH
 
 ##################################################################
diff --git a/scripts/make-intercept/make b/scripts/make-intercept/make
new file mode 100755
index 0000000..5f04a13
--- /dev/null
+++ b/scripts/make-intercept/make
@@ -0,0 +1,24 @@
+#!/usr/bin/env python
+import sys
+import os
+import subprocess
+
+fifoname = "/tmp/makefifo"
+
+r = os.open(fifoname, os.O_RDONLY|os.O_NONBLOCK)
+w = os.open(fifoname, os.O_WRONLY)
+os.close(r)
+r = os.open(fifoname, os.O_RDONLY)
+
+newpath = []
+origpath = os.environ["PATH"].split(":")
+for p in origpath:
+    if "make-intercept" in p:
+         continue
+    newpath.append(p)
+os.environ["PATH"] = ":".join(newpath)
+os.environ["MAKEFLAGS"] = "-j --jobserver-fds=" + str(r) + "," + str(w)
+
+sys.argv[0] = "make"
+
+subprocess.call(sys.argv, shell=False)



