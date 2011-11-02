Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RLUfm-0008Hi-Ib
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 07:51:43 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Nov 2011 23:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,442,1315206000"; d="scan'208";a="80327855"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.252])
	by fmsmga001.fm.intel.com with ESMTP; 01 Nov 2011 23:41:44 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Nov 2011 23:41:42 -0700
Message-Id: <ac412c93c681ef335970a678465aa015164f1015.1320190748.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1320190748.git.elizabeth.flanagan@intel.com>
References: <cover.1320190748.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] [Yocto Bug 1700] Fix for buildstats on tmpfs
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
X-List-Received-Date: Wed, 02 Nov 2011 06:51:43 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

tmpfs/encryptfs/(and most likely, but not confirmed)ramfs TMPDIRs
cause diskstats to choke. No device entry ends up in /proc/diskstats
for these fs types, which ends up causing the failure.

The short term solution is to exclude these fs types from diskstat
collection. Longer term we will want to see if we can collect
meaningful diskio for each of these, and other, use cases, but for
this cleans up Bug 1700.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/buildstats.bbclass |   37 ++++++++++++++++++++++++++-----------
 1 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 55cbb3c..96c98d4 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -48,13 +48,24 @@ def set_device(e):
     # something like stick DL_DIR on a different partition and this would
     # throw stats gathering off. The same goes with SSTATE_DIR. However, let's
     # get the basics in here and work on the cornercases later. 
+    # A note. /proc/diskstats does not contain info on encryptfs, tmpfs, etc.
+    # If we end up hitting one of these fs, we'll just skip diskstats collection.
     ############################################################################
     device=os.stat(tmpdir)
     majordev=os.major(device.st_dev)
     minordev=os.minor(device.st_dev)
+    ############################################################################
+    # Bug 1700: 
+    # Because tmpfs/encryptfs/ramfs etc inserts no entry in /proc/diskstats
+    # we set rdev to NoLogicalDevice and search for it later. If we find NLD
+    # we do not collect diskstats as the method to collect meaningful statistics
+    # for these fs types requires a bit more research. 
+    ############################################################################
     for line in open("/proc/diskstats", "r"):
         if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
            rdev=line.split()[2]
+        else:
+           rdev="NoLogicalDevice"
     file = open(bb.data.getVar('DEVFILE', e.data, True), "w")
     file.write(rdev)
     file.close()
@@ -133,10 +144,11 @@ def write_task_data(status, logfile, dev, e):
     # For the best information, running things with BB_TOTAL_THREADS = "1"
     # would return accurate per task results.
     ############################################################################
-    diskdata = get_diskdata("__diskdata_task", dev, e.data)
-    if diskdata:
-        for key in sorted(diskdata.iterkeys()):
-            file.write(key + ": " + diskdata[key] + "\n")
+    if dev != "NoLogicalDevice":
+        diskdata = get_diskdata("__diskdata_task", dev, e.data)
+        if diskdata:
+            for key in sorted(diskdata.iterkeys()):
+                file.write(key + ": " + diskdata[key] + "\n")
     if status is "passed":
 	    file.write("Status: PASSED \n")
     else:
@@ -169,7 +181,8 @@ python run_buildstats () {
             bb.mkdirhier(bsdir)
         except:
             pass
-        set_diskdata("__diskdata_build", device, e.data)
+        if device != "NoLogicalDevice":
+            set_diskdata("__diskdata_build", device, e.data)
         set_timedata("__timedata_build", e.data)
         build_time = os.path.join(bsdir, "build_stats")
         # write start of build into build_time
@@ -185,7 +198,7 @@ python run_buildstats () {
                 
     elif isinstance(e, bb.event.BuildCompleted):
         bn = get_bn(e)
-        dev = get_device(e)
+        device = get_device(e)
         bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
         taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
         build_time = os.path.join(bsdir, "build_stats")
@@ -201,10 +214,11 @@ python run_buildstats () {
             file.write("Elapsed time: %0.2f seconds \n" % (time))
             if cpu:
                 file.write("CPU usage: %0.1f%% \n" % cpu)
-        diskio = get_diskdata("__diskdata_build", dev, e.data)
-        if diskio:
-            for key in sorted(diskio.iterkeys()):
-                file.write(key + ": " + diskio[key] + "\n")
+        if device != "NoLogicalDevice":
+            diskio = get_diskdata("__diskdata_build", device, e.data)
+            if diskio:
+                for key in sorted(diskio.iterkeys()):
+                    file.write(key + ": " + diskio[key] + "\n")
         file.close()
 
     if isinstance(e, bb.build.TaskStarted):
@@ -212,7 +226,8 @@ python run_buildstats () {
         device = get_device(e)
         bsdir = os.path.join(bb.data.getVar('BUILDSTATS_BASE', e.data, True), bn)
         taskdir = os.path.join(bsdir, bb.data.expand("${PF}", e.data))
-        set_diskdata("__diskdata_task", device, e.data)
+        if device != "NoLogicalDevice":
+            set_diskdata("__diskdata_task", device, e.data)
         set_timedata("__timedata_task", e.data)
         try:
             bb.mkdirhier(taskdir)
-- 
1.7.1



