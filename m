Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 568A773EC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 16:19:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 May 2015 09:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,380,1427785200"; d="scan'208";a="706182377"
Received: from jashore-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.219])
	by fmsmga001.fm.intel.com with ESMTP; 06 May 2015 09:19:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 17:19:27 +0100
Message-Id: <0e17206a4f88da58fa69584e3d6cb87e2bcf2ca5.1430929064.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430929064.git.paul.eggleton@linux.intel.com>
References: <cover.1430929064.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430929064.git.paul.eggleton@linux.intel.com>
References: <cover.1430929064.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] classes/buildstats: misc cleanups
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
X-List-Received-Date: Wed, 06 May 2015 16:19:42 -0000

* Rename BNFILE and DEVFILE so that they are clearly specific to this
  class, since they end up in the global scope
* Use "with open" when opening files consistently
* Use getVar('PF', True) instead of expand('${PF}')
* Drop some unnecessary assignments

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildstats.bbclass | 156 +++++++++++++++++++---------------------
 1 file changed, 73 insertions(+), 83 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 54d9f72..22ec571 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -1,6 +1,6 @@
 BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
-BNFILE = "${BUILDSTATS_BASE}/.buildname"
-DEVFILE = "${BUILDSTATS_BASE}/.device"
+BUILDSTATS_BNFILE = "${BUILDSTATS_BASE}/.buildname"
+BUILDSTATS_DEVFILE = "${BUILDSTATS_BASE}/.device"
 
 ################################################################################
 # Build statistics gathering.
@@ -25,21 +25,22 @@ def get_cputime():
 def set_bn(e):
     bn = e.getPkgs()[0] + "-" + e.data.getVar('MACHINE', True)
     try:
-        os.remove(e.data.getVar('BNFILE', True))
+        os.remove(e.data.getVar('BUILDSTATS_BNFILE', True))
     except:
         pass
-    with open(e.data.getVar('BNFILE', True), "w") as f:
+    with open(e.data.getVar('BUILDSTATS_BNFILE', True), "w") as f:
         f.write(os.path.join(bn, e.data.getVar('BUILDNAME', True)))
 
 def get_bn(e):
-    with open(e.data.getVar('BNFILE', True)) as f:
+    with open(e.data.getVar('BUILDSTATS_BNFILE', True)) as f:
         bn = f.readline()
     return bn
 
 def set_device(e):
     tmpdir = e.data.getVar('TMPDIR', True)
+    devfile = e.data.getVar('BUILDSTATS_DEVFILE', True)
     try:
-        os.remove(e.data.getVar('DEVFILE', True))
+        os.remove(devfile)
     except:
         pass
     ############################################################################
@@ -69,14 +70,12 @@ def set_device(e):
                     rdev = line.split()[2]
     except:
         pass
-    file = open(e.data.getVar('DEVFILE', True), "w")
-    file.write(rdev)
-    file.close()
+    with open(devfile, "w") as f:
+        f.write(rdev)
 
 def get_device(e):
-    file = open(e.data.getVar('DEVFILE', True))
-    device = file.readline()
-    file.close()
+    with open(e.data.getVar('BUILDSTATS_DEVFILE', True)) as f:
+        device = f.readline()
     return device
 
 def get_diskstats(dev):
@@ -141,34 +140,32 @@ def get_timedata(var, data, server_time=None):
 def write_task_data(status, logfile, dev, e):
     bn = get_bn(e)
     bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-    taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
-    file = open(os.path.join(logfile), "a")
-    timedata = get_timedata("__timedata_task", e.data, e.time)
-    if timedata:
-        elapsedtime, cpu = timedata
-        file.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
-                                 (e.task, elapsedtime), e.data))
-        if cpu:
-            file.write("CPU usage: %0.1f%% \n" % cpu)
-    ############################################################################
-    # Here we gather up disk data. In an effort to avoid lying with stats
-    # I do a bare minimum of analysis of collected data.
-    # The simple fact is, doing disk io collection on a per process basis
-    # without effecting build time would be difficult.
-    # For the best information, running things with BB_TOTAL_THREADS = "1"
-    # would return accurate per task results.
-    ############################################################################
-    if dev != "NoLogicalDevice":
-        diskdata = get_diskdata("__diskdata_task", dev, e.data)
-        if diskdata:
-            for key in sorted(diskdata.iterkeys()):
-                file.write(key + ": " + diskdata[key] + "\n")
-    if status is "passed":
-        file.write("Status: PASSED \n")
-    else:
-        file.write("Status: FAILED \n")
-    file.write("Ended: %0.2f \n" % e.time)
-    file.close()
+    with open(os.path.join(logfile), "a") as f:
+        timedata = get_timedata("__timedata_task", e.data, e.time)
+        if timedata:
+            elapsedtime, cpu = timedata
+            f.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
+                                    (e.task, elapsedtime), e.data))
+            if cpu:
+                f.write("CPU usage: %0.1f%% \n" % cpu)
+        ############################################################################
+        # Here we gather up disk data. In an effort to avoid lying with stats
+        # I do a bare minimum of analysis of collected data.
+        # The simple fact is, doing disk io collection on a per process basis
+        # without effecting build time would be difficult.
+        # For the best information, running things with BB_TOTAL_THREADS = "1"
+        # would return accurate per task results.
+        ############################################################################
+        if dev != "NoLogicalDevice":
+            diskdata = get_diskdata("__diskdata_task", dev, e.data)
+            if diskdata:
+                for key in sorted(diskdata.iterkeys()):
+                    f.write(key + ": " + diskdata[key] + "\n")
+        if status is "passed":
+            f.write("Status: PASSED \n")
+        else:
+            f.write("Status: FAILED \n")
+        f.write("Ended: %0.2f \n" % e.time)
 
 python run_buildstats () {
     import bb.build
@@ -194,75 +191,69 @@ python run_buildstats () {
         set_timedata("__timedata_build", e.data)
         build_time = os.path.join(bsdir, "build_stats")
         # write start of build into build_time
-        file = open(build_time,"a")
-        host_info = platform.uname()
-        file.write("Host Info: ")
-        for x in host_info:
-            if x:
-                file.write(x + " ")
-        file.write("\n")
-        file.write("Build Started: %0.2f \n" % time.time())
-        file.close()
+        with open(build_time, "a") as f:
+            host_info = platform.uname()
+            f.write("Host Info: ")
+            for x in host_info:
+                if x:
+                    f.write(x + " ")
+            f.write("\n")
+            f.write("Build Started: %0.2f \n" % time.time())
 
     elif isinstance(e, bb.event.BuildCompleted):
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
         build_time = os.path.join(bsdir, "build_stats")
-        file = open(build_time, "a")
-        ########################################################################
-        # Write build statistics for the build
-        ########################################################################
-        timedata = get_timedata("__timedata_build", e.data)
-        if timedata:
-            time, cpu = timedata
-            # write end of build and cpu used into build_time
-            file.write("Elapsed time: %0.2f seconds \n" % (time))
-            if cpu:
-                file.write("CPU usage: %0.1f%% \n" % cpu)
-        if device != "NoLogicalDevice":
-            diskio = get_diskdata("__diskdata_build", device, e.data)
-            if diskio:
-                for key in sorted(diskio.iterkeys()):
-                    file.write(key + ": " + diskio[key] + "\n")
-        file.close()
+        with open(build_time, "a") as f:
+            ########################################################################
+            # Write build statistics for the build
+            ########################################################################
+            timedata = get_timedata("__timedata_build", e.data)
+            if timedata:
+                time, cpu = timedata
+                # write end of build and cpu used into build_time
+                f.write("Elapsed time: %0.2f seconds \n" % (time))
+                if cpu:
+                    f.write("CPU usage: %0.1f%% \n" % cpu)
+            if device != "NoLogicalDevice":
+                diskio = get_diskdata("__diskdata_build", device, e.data)
+                if diskio:
+                    for key in sorted(diskio.iterkeys()):
+                        f.write(key + ": " + diskio[key] + "\n")
 
     if isinstance(e, bb.build.TaskStarted):
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
+        taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
         if device != "NoLogicalDevice":
             set_diskdata("__diskdata_task", device, e.data)
         set_timedata("__timedata_task", e.data, e.time)
         bb.utils.mkdirhier(taskdir)
         # write into the task event file the name and start time
-        file = open(os.path.join(taskdir, e.task), "a")
-        file.write("Event: %s \n" % bb.event.getName(e))
-        file.write("Started: %0.2f \n" % e.time)
-        file.close()
+        with open(os.path.join(taskdir, e.task), "a") as f:
+            f.write("Event: %s \n" % bb.event.getName(e))
+            f.write("Started: %0.2f \n" % e.time)
 
     elif isinstance(e, bb.build.TaskSucceeded):
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
+        taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
         write_task_data("passed", os.path.join(taskdir, e.task), device, e)
         if e.task == "do_rootfs":
-            bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
             bs = os.path.join(bsdir, "build_stats")
-            file = open(bs,"a")
-            rootfs = e.data.getVar('IMAGE_ROOTFS', True)
-            rootfs_size = subprocess.Popen(["du", "-sh", rootfs], stdout=subprocess.PIPE).stdout.read()
-            file.write("Uncompressed Rootfs size: %s" % rootfs_size)
-            file.close()
+            with open(bs, "a") as f:
+                rootfs = e.data.getVar('IMAGE_ROOTFS', True)
+                rootfs_size = subprocess.Popen(["du", "-sh", rootfs], stdout=subprocess.PIPE).stdout.read()
+                f.write("Uncompressed Rootfs size: %s" % rootfs_size)
 
     elif isinstance(e, bb.build.TaskFailed):
         bn = get_bn(e)
         device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
-        taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
+        taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
         write_task_data("failed", os.path.join(taskdir, e.task), device, e)
         ########################################################################
         # Lets make things easier and tell people where the build failed in
@@ -270,9 +261,8 @@ python run_buildstats () {
         # matter what the status of the build actually is
         ########################################################################
         build_status = os.path.join(bsdir, "build_stats")
-        file = open(build_status,"a")
-        file.write(e.data.expand("Failed at: ${PF} at task: %s \n" % e.task))
-        file.close()
+        with open(build_status, "a") as f:
+            f.write(e.data.expand("Failed at: ${PF} at task: %s \n" % e.task))
 }
 
 addhandler run_buildstats
-- 
2.1.0


