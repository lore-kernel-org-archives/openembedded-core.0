Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1QomkJ-00013U-QX
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 03:29:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Aug 2011 18:23:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,313,1309762800"; d="scan'208";a="34156095"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 03 Aug 2011 18:23:46 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 18:18:32 -0700
Message-Id: <772afee1fbb527c1f1e549c04836d0875934699f.1312419802.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312419801.git.elizabeth.flanagan@intel.com>
References: <cover.1312419801.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] buildstats.bbclass: Adding disk io measurement
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
X-List-Received-Date: Thu, 04 Aug 2011 01:29:12 -0000

This commit adds disk-io statistics functionality on a build
and per-task basis.

It pulls measurements for whatever partition TMPDIR exists on.
This data could be off if SSTATE_DIR and DL_DIR exist on
a different partition/volume.

Notes on what this pulls:

ReadsComp: Total number of reads complete
ReadsMerged: Total number of adjacent reads merged
SectRead: Total number of sectors read
TimeReads: Total number of m/s spent reading
WritesComp: Total number of writes completed
SectWrite: Total number of sectors written
TimeWrite: Total number of m/s spent writing
IOinProgress: Total amount of IO in progress at the time of
              we look at /proc/diskstats.
TimeIO: Total number of m/s spent doing IO
WTimeIO: Weighted time doing I/O. From iostats.txt:

"This field is incremented at each I/O start, I/O completion, I/O
 merge, or read of these stats by the number of I/Os in progress
 (field 9) times the number of milliseconds spent doing I/O since the
 last update of this field.  This can provide an easy measure of both
 I/O completion time and the backlog that may be accumulating."

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/buildstats.bbclass |  220 +++++++++++++++++++++++++--------------
 1 files changed, 142 insertions(+), 78 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 8077035..939e3af 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -1,5 +1,6 @@
 BUILDSTATS_BASE = ${TMPDIR}/buildstats/
 BNFILE = ${BUILDSTATS_BASE}/.buildname
+DEVFILE = ${BUILDSTATS_BASE}/.device
 
 ################################################################################
 # Build statistics gathering. 
@@ -19,9 +20,79 @@ def get_cputime():
     fields = open("/proc/stat", "r").readline().rstrip().split()[1:]
     return sum(int(field) for field in fields)
 
+def set_bn(e):
+    bn = e.getPkgs()[0] + "-" + bb.data.getVar('MACHINE',e.data, True)
+    try:
+        os.remove(bb.data.getVar('BNFILE', e.data, True))
+    except:
+        pass
+    file = open(bb.data.getVar('BNFILE', e.data, True), "w")
+    file.write(os.path.join(bn, bb.data.getVar('BUILDNAME', e.data, True)))
+    file.close()
+
+def get_bn(e):
+    file = open(bb.data.getVar('BNFILE', e.data, True))
+    bn = file.readline()
+    file.close()
+    return bn
+
+def set_device(e):
+    tmpdir = bb.data.getVar('TMPDIR', e.data, True)
+    try:
+        os.remove(bb.data.getVar('DEVFILE', e.data, True))
+    except:
+        pass
+    ############################################################################
+    # We look for the volume TMPDIR lives on. To do all disks would make little 
+    # sense and not give us any particularly useful data. In theory we could do
+    # something like stick DL_DIR on a different partition and this would
+    # throw stats gathering off. The same goes with SSTATE_DIR. However, let's
+    # get the basics in here and work on the cornercases later. 
+    ############################################################################
+    device=os.stat(tmpdir)
+    majordev=os.major(device.st_dev)
+    minordev=os.minor(device.st_dev)
+    for line in open("/proc/diskstats", "r"):
+        if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
+           rdev=line.split()[2]
+    file = open(bb.data.getVar('DEVFILE', e.data, True), "w")
+    file.write(rdev)
+    file.close()
+    
+def get_device(e):
+    file = open(bb.data.getVar('DEVFILE', e.data, True))
+    device = file.readline()
+    file.close()
+    return device
+
+def get_diskstats(dev):
+    import itertools
+    ############################################################################
+    # For info on what these are, see kernel doc file iostats.txt
+    ############################################################################
+    DSTAT_KEYS = ['ReadsComp', 'ReadsMerged', 'SectRead', 'TimeReads', 'WritesComp', 'SectWrite', 'TimeWrite', 'IOinProgress', 'TimeIO', 'WTimeIO']  
+    for x in open("/proc/diskstats", "r"):
+        if dev in x:
+            diskstats_val = x.rstrip().split()[4:]
+    diskstats = dict(itertools.izip(DSTAT_KEYS, diskstats_val))        
+    return diskstats
+    
+def set_diskdata(var, dev, data):
+    data.setVar(var, get_diskstats(dev))
+
+def get_diskdata(var, dev, data):
+    olddiskdata = data.getVar(var, False)
+    diskdata = {}
+    if olddiskdata is None:
+       return
+    newdiskdata = get_diskstats(dev)
+    for key in olddiskdata.iterkeys():
+        diskdata["Start"+key] = str(int(olddiskdata[key]))        
+        diskdata["End"+key] = str(int(newdiskdata[key]))    
+    return diskdata
+    
 def set_timedata(var, data):
     import time
-
     time = time.time()
     cputime = get_cputime()
     proctime = get_process_cputime(os.getpid())
@@ -42,26 +113,35 @@ def get_timedata(var, data):
         cpuperc = None
     return timediff, cpuperc
     
-##############################################
-# We need to set the buildname to a file since
-# BUILDNAME changes throughout a build
-##############################################
-
-def set_bn(e):
-    bn = e.getPkgs()[0] + "-" + bb.data.getVar('MACHINE',e.data, True)
-    try:
-        os.remove(bb.data.getVar('BNFILE',e.data, True))
-    except:
-        pass
-    file = open(bb.data.getVar('BNFILE',e.data, True), "w")
-    file.write(os.path.join(bn, bb.data.getVar('BUILDNAME', e.data, True)))
-    file.close()
-
-def get_bn(e):
-    file = open(bb.data.getVar('BNFILE',e.data, True))
-    bn = file.readline()
+def write_task_data(status, logfile, dev, e):
+    bn = get_bn(e)
+    bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
+    taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
+    file = open(os.path.join(logfile), "a")
+    timedata = get_timedata("__timedata_task", e.data)
+    if timedata:
+        elapsedtime, cpu = timedata
+        file.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
+                                 (e.task, elapsedtime), e.data))
+        if cpu:
+            file.write("CPU usage: %0.1f%% \n" % cpu)
+    ############################################################################
+    # Here we gather up disk data. In an effort to avoid lying with stats
+    # I do a bare minimum of analysis of collected data.
+    # The simple fact is, doing disk io collection on a per process basis
+    # without effecting build time would be difficult.
+    # For the best information, running things with BB_TOTAL_THREADS = "1"
+    # would return accurate per task results.
+    ############################################################################
+    diskdata = get_diskdata("__diskdata_task", dev, e.data)
+    if diskdata:
+        for key in sorted(diskdata.iterkeys()):
+            file.write(key + ": " + diskdata[key] + "\n")
+    if status is "passed":
+	    file.write("Status: PASSED")
+    else:
+        file.write("Status: FAILED")
     file.close()
-    return bn
 
 python run_buildstats () {
     import bb.build
@@ -69,22 +149,27 @@ python run_buildstats () {
     import bb.data
     import time, subprocess, platform
 
+
     if isinstance(e, bb.event.BuildStarted):
-        ##############################################
+        ########################################################################
         # at first pass make the buildstats heriarchy and then
         # set the buildname
-        ##############################################
+        ########################################################################
         try:
             bb.mkdirhier(bb.data.getVar('BUILDSTATS_BASE', e.data, True))
         except:
             pass
         set_bn(e)
         bn = get_bn(e)
+        set_device(e)
+        device = get_device(e)
+        
         bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
         try:
             bb.mkdirhier(bsdir)
         except:
             pass
+        set_diskdata("__diskdata_build", device, e.data)
         set_timedata("__timedata_build", e.data)
         build_time = os.path.join(bsdir, "build_stats")
         # write start of build into build_time
@@ -99,27 +184,36 @@ python run_buildstats () {
         file.close()
                 
     elif isinstance(e, bb.event.BuildCompleted):
-        bn=get_bn(e)
-        timedata = get_timedata("__timedata_build", e.data)
-        if not timedata:
-            return
-        time, cpu = timedata
+        bn = get_bn(e)
+        dev = get_device(e)
         bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
+        taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
         build_time = os.path.join(bsdir, "build_stats")
-        # write end of build and cpu used into build_time
         file = open(build_time, "a")
-        file.write("Elapsed time: %0.2f seconds \n" % (time))
-        if cpu:
-            file.write("CPU usage: %0.1f%% \n" % cpu)
+        ########################################################################
+        # Write build statistics for the build
+        ########################################################################
+        timedata = get_timedata("__timedata_build", e.data)
+        if timedata:
+            time, cpu = timedata
+            # write end of build and cpu used into build_time
+            file = open(build_time, "a")
+            file.write("Elapsed time: %0.2f seconds \n" % (time))
+            if cpu:
+                file.write("CPU usage: %0.1f%% \n" % cpu)
+        diskio = get_diskdata("__diskdata_build", dev, e.data)
+        if diskio:
+            for key in sorted(diskio.iterkeys()):
+                file.write(key + ": " + diskio[key] + "\n")
         file.close()
 
-
     if isinstance(e, bb.build.TaskStarted):
-        bn=get_bn(e)
-        set_timedata("__timedata_task", e.data)
-        
+        bn = get_bn(e)
+        device = get_device(e)
         bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
         taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
+        set_diskdata("__diskdata_task", device, e.data)
+        set_timedata("__timedata_task", e.data)
         try:
             bb.mkdirhier(taskdir)
         except:
@@ -131,29 +225,13 @@ python run_buildstats () {
         file.close()
 
     elif isinstance(e, bb.build.TaskSucceeded):
-        bn=get_bn(e)
-        timedata = get_timedata("__timedata_task", e.data)
-        if not timedata:
-            return
-        elapsedtime, cpu = timedata
+        bn = get_bn(e)
+        device = get_device(e)
         bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
         taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
-        file = open(os.path.join(taskdir, e.task), "a")
-        file.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
-                               (e.task, elapsedtime), e.data))
-        file.write("Ended: %0.2f \n" % time.time())
-        if cpu:
-            file.write("CPU usage: %0.1f%% \n" % cpu)
-    	
-    	file.write("Status: PASSED")
-        file.close()
-
-        ##############################################
-        # Alot of metric gathering occurs here. 
-        # Reminder: I stripped out some in process stuff here
-        ##############################################
-
+        write_task_data("passed", os.path.join(taskdir, e.task), device, e)
         if e.task == "do_rootfs":
+            bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
             bs=os.path.join(bsdir, "build_stats")
             file = open(bs,"a") 
             rootfs = bb.data.getVar('IMAGE_ROOTFS', e.data, True)
@@ -162,35 +240,21 @@ python run_buildstats () {
             file.close()
 
     elif isinstance(e, bb.build.TaskFailed):
-        bn=get_bn(e)
-        timedata = get_timedata("__timedata_task", e.data)
-        if not timedata:
-            return
-        time, cpu = timedata
+        bn = get_bn(e)
+        device = get_device(e)
         bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
         taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
-        ##############################################
-        # If the task fails dump the regular data. 
-        # fgrep -R "FAILED" <bsdir> 
-        # will grep all the events that failed. 
-        ##############################################
-        file = open(os.path.join(taskdir, e.task), "a")
-        file.write(bb.data.expand("${PF}: %s: Elapsed time: %0.2f seconds \n" %
-                               (e.task, time), e.data))
-        if cpu:
-            file.write("CPU usage: %0.1f%% \n" % cpu)
-        file.write("Status: FAILED")
-        file.close()
-        ##############################################
-        # Lets make things easier and tell people where the build failed in build_status
-        # We do this here because BuildCompleted triggers no matter what the status of the
-        # build actually is
-        ##############################################
+        write_task_data("failed", os.path.join(taskdir, e.task), device, e)
+        ########################################################################
+        # Lets make things easier and tell people where the build failed in 
+        # build_status. We do this here because BuildCompleted triggers no 
+        # matter what the status of the build actually is
+        ########################################################################
         build_status = os.path.join(bsdir, "build_stats")
         file = open(build_status,"a")
         file.write(bb.data.expand("Failed at: ${PF} at task: %s \n" % e.task, e.data))
         file.close()
-
+        
 }
 
 addhandler run_buildstats
-- 
1.7.1



