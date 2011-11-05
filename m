Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3R-00065L-2A
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625118"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:39 -0700
Message-Id: <fe9fab78a4b79191f2795cbb9f3ee0fc6a36c76d.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 09/28] buildstats: Fix for buildstats on tmpfs
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
X-List-Received-Date: Sat, 05 Nov 2011 17:29:20 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

tmpfs/encryptfs/(and most likely, but not confirmed)ramfs TMPDIRs
cause diskstats to choke. No device entry ends up in /proc/diskstats
for these fs types, which ends up causing the failure.

The short term solution is to exclude these fs types from diskstat
collection. Longer term we will want to see if we can collect
meaningful diskio for each of these, and other, use cases, but for
this cleans up Bug 1700.

[YOCTO #1700]

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

Corrected YOCTO bug location and format

Signed-off-by: Saul Wold <sgw@linux.intel.com>
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
1.7.6.4



