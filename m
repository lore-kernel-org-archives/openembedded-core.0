Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BE1AB731A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEsE1L032695; Thu, 17 Dec 2015 14:54:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jBBFryvdPoAF; Thu, 17 Dec 2015 14:54:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEs8tl032691
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 14:54:09 GMT
Message-ID: <1450364048.13505.207.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 17 Dec 2015 14:54:08 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 3/7] buildstats: Clean up e.data and bb.data references
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
X-List-Received-Date: Thu, 17 Dec 2015 14:54:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Rather than bb.data and e.data, cleanup to use 'd' and match the
standard coding style.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 73e0b2a..4fa6981 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -20,7 +20,7 @@ def get_cputime():
         fields = f.readline().rstrip().split()[1:]
     return sum(int(field) for field in fields)
 
-def set_timedata(var, data, server_time=None):
+def set_timedata(var, d, server_time=None):
     import time
     if server_time:
         time = server_time
@@ -28,11 +28,11 @@ def set_timedata(var, data, server_time=None):
         time = time.time()
     cputime = get_cputime()
     proctime = get_process_cputime(os.getpid())
-    data.setVar(var, (time, cputime, proctime))
+    d.setVar(var, (time, cputime, proctime))
 
-def get_timedata(var, data, server_time=None):
+def get_timedata(var, d, server_time=None):
     import time
-    timedata = data.getVar(var, False)
+    timedata = d.getVar(var, False)
     if timedata is None:
         return
     oldtime, oldcpu, oldproc = timedata
@@ -49,15 +49,15 @@ def get_timedata(var, data, server_time=None):
         cpuperc = None
     return timediff, cpuperc
 
-def write_task_data(status, logfile, e):
-    bn = e.data.getVar('BUILDNAME', True)
-    bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
+def write_task_data(status, logfile, e, d):
+    bn = d.getVar('BUILDNAME', True)
+    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
     with open(os.path.join(logfile), "a") as f:
-        timedata = get_timedata("__timedata_task", e.data, e.time)
+        timedata = get_timedata("__timedata_task", d, e.time)
         if timedata:
             elapsedtime, cpu = timedata
-            f.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
-                                    (e.task, elapsedtime), e.data))
+            f.write(d.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
+                                    (e.task, elapsedtime)))
             if cpu:
                 f.write("CPU usage: %0.1f%% \n" % cpu)
         if status is "passed":
@@ -69,12 +69,11 @@ def write_task_data(status, logfile, e):
 python run_buildstats () {
     import bb.build
     import bb.event
-    import bb.data
     import time, subprocess, platform
 
-    bn = e.data.getVar('BUILDNAME', True)
-    bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-    taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
+    bn = d.getVar('BUILDNAME', True)
+    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE', True), bn)
+    taskdir = os.path.join(bsdir, d.getVar('PF', True))
 
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
@@ -82,7 +81,7 @@ python run_buildstats () {
         # set the buildname
         ########################################################################
         bb.utils.mkdirhier(bsdir)
-        set_timedata("__timedata_build", e.data)
+        set_timedata("__timedata_build", d)
         build_time = os.path.join(bsdir, "build_stats")
         # write start of build into build_time
         with open(build_time, "a") as f:
@@ -100,7 +99,7 @@ python run_buildstats () {
             ########################################################################
             # Write build statistics for the build
             ########################################################################
-            timedata = get_timedata("__timedata_build", e.data)
+            timedata = get_timedata("__timedata_build", d)
             if timedata:
                 time, cpu = timedata
                 # write end of build and cpu used into build_time
@@ -109,7 +108,7 @@ python run_buildstats () {
                     f.write("CPU usage: %0.1f%% \n" % cpu)
 
     if isinstance(e, bb.build.TaskStarted):
-        set_timedata("__timedata_task", e.data, e.time)
+        set_timedata("__timedata_task", d, e.time)
         bb.utils.mkdirhier(taskdir)
         # write into the task event file the name and start time
         with open(os.path.join(taskdir, e.task), "a") as f:
@@ -117,16 +116,16 @@ python run_buildstats () {
             f.write("Started: %0.2f \n" % e.time)
 
     elif isinstance(e, bb.build.TaskSucceeded):
-        write_task_data("passed", os.path.join(taskdir, e.task), e)
+        write_task_data("passed", os.path.join(taskdir, e.task), e, d)
         if e.task == "do_rootfs":
             bs = os.path.join(bsdir, "build_stats")
             with open(bs, "a") as f:
-                rootfs = e.data.getVar('IMAGE_ROOTFS', True)
+                rootfs = d.getVar('IMAGE_ROOTFS', True)
                 rootfs_size = subprocess.Popen(["du", "-sh", rootfs], stdout=subprocess.PIPE).stdout.read()
                 f.write("Uncompressed Rootfs size: %s" % rootfs_size)
 
     elif isinstance(e, bb.build.TaskFailed):
-        write_task_data("failed", os.path.join(taskdir, e.task), e)
+        write_task_data("failed", os.path.join(taskdir, e.task), e, d)
         ########################################################################
         # Lets make things easier and tell people where the build failed in
         # build_status. We do this here because BuildCompleted triggers no
@@ -134,7 +133,7 @@ python run_buildstats () {
         ########################################################################
         build_status = os.path.join(bsdir, "build_stats")
         with open(build_status, "a") as f:
-            f.write(e.data.expand("Failed at: ${PF} at task: %s \n" % e.task))
+            f.write(d.expand("Failed at: ${PF} at task: %s \n" % e.task))
 }
 
 addhandler run_buildstats



