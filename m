Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A7B527319D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 14:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHEs1su032682; Thu, 17 Dec 2015 14:54:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IZm--8Iujgno; Thu, 17 Dec 2015 14:54:01 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBHErt8u032679
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Dec 2015 14:53:57 GMT
Message-ID: <1450364035.13505.204.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	"Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
Date: Thu, 17 Dec 2015 14:53:55 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH 1/7] buildstats: Drop disk data from buildstats
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
X-List-Received-Date: Thu, 17 Dec 2015 14:54:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The existing diskstats data from buildstats simply isn't useful. It
gives stats on the total IO counts on some random disk within the
system. This means that the count includes data from all other tasks
running at the same time and from any other process running on the
system.

I've been unable to find any use for the data so as a start at
reworking the class, remove the related code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 22ec571..04307d8 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -1,6 +1,5 @@
 BUILDSTATS_BASE = "${TMPDIR}/buildstats/"
 BUILDSTATS_BNFILE = "${BUILDSTATS_BASE}/.buildname"
-BUILDSTATS_DEVFILE = "${BUILDSTATS_BASE}/.device"
 
 ################################################################################
 # Build statistics gathering.
@@ -36,78 +35,6 @@ def get_bn(e):
         bn = f.readline()
     return bn
 
-def set_device(e):
-    tmpdir = e.data.getVar('TMPDIR', True)
-    devfile = e.data.getVar('BUILDSTATS_DEVFILE', True)
-    try:
-        os.remove(devfile)
-    except:
-        pass
-    ############################################################################
-    # We look for the volume TMPDIR lives on. To do all disks would make little
-    # sense and not give us any particularly useful data. In theory we could do
-    # something like stick DL_DIR on a different partition and this would
-    # throw stats gathering off. The same goes with SSTATE_DIR. However, let's
-    # get the basics in here and work on the cornercases later.
-    # A note. /proc/diskstats does not contain info on encryptfs, tmpfs, etc.
-    # If we end up hitting one of these fs, we'll just skip diskstats collection.
-    ############################################################################
-    device = os.stat(tmpdir)
-    majordev = os.major(long(device.st_dev))
-    minordev = os.minor(long(device.st_dev))
-    ############################################################################
-    # Bug 1700:
-    # Because tmpfs/encryptfs/ramfs etc inserts no entry in /proc/diskstats
-    # we set rdev to NoLogicalDevice and search for it later. If we find NLD
-    # we do not collect diskstats as the method to collect meaningful statistics
-    # for these fs types requires a bit more research.
-    ############################################################################
-    rdev = "NoLogicalDevice"
-    try:
-        with open("/proc/diskstats", "r") as f:
-            for line in f:
-                if majordev == int(line.split()[0]) and minordev == int(line.split()[1]):
-                    rdev = line.split()[2]
-    except:
-        pass
-    with open(devfile, "w") as f:
-        f.write(rdev)
-
-def get_device(e):
-    with open(e.data.getVar('BUILDSTATS_DEVFILE', True)) as f:
-        device = f.readline()
-    return device
-
-def get_diskstats(dev):
-    import itertools
-    ############################################################################
-    # For info on what these are, see kernel doc file iostats.txt
-    ############################################################################
-    DSTAT_KEYS = ['ReadsComp', 'ReadsMerged', 'SectRead', 'TimeReads', 'WritesComp', 'SectWrite', 'TimeWrite', 'IOinProgress', 'TimeIO', 'WTimeIO']
-    try:
-        with open("/proc/diskstats", "r") as f:
-            for x in f:
-                if dev in x:
-                    diskstats_val = x.rstrip().split()[4:]
-    except IOError as e:
-        return
-    diskstats = dict(itertools.izip(DSTAT_KEYS, diskstats_val))
-    return diskstats
-
-def set_diskdata(var, dev, data):
-    data.setVar(var, get_diskstats(dev))
-
-def get_diskdata(var, dev, data):
-    olddiskdata = data.getVar(var, False)
-    diskdata = {}
-    if olddiskdata is None:
-        return
-    newdiskdata = get_diskstats(dev)
-    for key in olddiskdata.iterkeys():
-        diskdata["Start"+key] = str(int(olddiskdata[key]))
-        diskdata["End"+key] = str(int(newdiskdata[key]))
-    return diskdata
-
 def set_timedata(var, data, server_time=None):
     import time
     if server_time:
@@ -137,7 +64,7 @@ def get_timedata(var, data, server_time=None):
         cpuperc = None
     return timediff, cpuperc
 
-def write_task_data(status, logfile, dev, e):
+def write_task_data(status, logfile, e):
     bn = get_bn(e)
     bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
     with open(os.path.join(logfile), "a") as f:
@@ -148,19 +75,6 @@ def write_task_data(status, logfile, dev, e):
                                     (e.task, elapsedtime), e.data))
             if cpu:
                 f.write("CPU usage: %0.1f%% \n" % cpu)
-        ############################################################################
-        # Here we gather up disk data. In an effort to avoid lying with stats
-        # I do a bare minimum of analysis of collected data.
-        # The simple fact is, doing disk io collection on a per process basis
-        # without effecting build time would be difficult.
-        # For the best information, running things with BB_TOTAL_THREADS = "1"
-        # would return accurate per task results.
-        ############################################################################
-        if dev != "NoLogicalDevice":
-            diskdata = get_diskdata("__diskdata_task", dev, e.data)
-            if diskdata:
-                for key in sorted(diskdata.iterkeys()):
-                    f.write(key + ": " + diskdata[key] + "\n")
         if status is "passed":
             f.write("Status: PASSED \n")
         else:
@@ -181,13 +95,9 @@ python run_buildstats () {
         bb.utils.mkdirhier(e.data.getVar('BUILDSTATS_BASE', True))
         set_bn(e)
         bn = get_bn(e)
-        set_device(e)
-        device = get_device(e)
 
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         bb.utils.mkdirhier(bsdir)
-        if device != "NoLogicalDevice":
-            set_diskdata("__diskdata_build", device, e.data)
         set_timedata("__timedata_build", e.data)
         build_time = os.path.join(bsdir, "build_stats")
         # write start of build into build_time
@@ -202,7 +112,6 @@ python run_buildstats () {
 
     elif isinstance(e, bb.event.BuildCompleted):
         bn = get_bn(e)
-        device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         build_time = os.path.join(bsdir, "build_stats")
         with open(build_time, "a") as f:
@@ -216,19 +125,11 @@ python run_buildstats () {
                 f.write("Elapsed time: %0.2f seconds \n" % (time))
                 if cpu:
                     f.write("CPU usage: %0.1f%% \n" % cpu)
-            if device != "NoLogicalDevice":
-                diskio = get_diskdata("__diskdata_build", device, e.data)
-                if diskio:
-                    for key in sorted(diskio.iterkeys()):
-                        f.write(key + ": " + diskio[key] + "\n")
 
     if isinstance(e, bb.build.TaskStarted):
         bn = get_bn(e)
-        device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
-        if device != "NoLogicalDevice":
-            set_diskdata("__diskdata_task", device, e.data)
         set_timedata("__timedata_task", e.data, e.time)
         bb.utils.mkdirhier(taskdir)
         # write into the task event file the name and start time
@@ -238,10 +139,9 @@ python run_buildstats () {
 
     elif isinstance(e, bb.build.TaskSucceeded):
         bn = get_bn(e)
-        device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
-        write_task_data("passed", os.path.join(taskdir, e.task), device, e)
+        write_task_data("passed", os.path.join(taskdir, e.task), e)
         if e.task == "do_rootfs":
             bs = os.path.join(bsdir, "build_stats")
             with open(bs, "a") as f:
@@ -251,10 +151,9 @@ python run_buildstats () {
 
     elif isinstance(e, bb.build.TaskFailed):
         bn = get_bn(e)
-        device = get_device(e)
         bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
         taskdir = os.path.join(bsdir, e.data.getVar('PF', True))
-        write_task_data("failed", os.path.join(taskdir, e.task), device, e)
+        write_task_data("failed", os.path.join(taskdir, e.task), e)
         ########################################################################
         # Lets make things easier and tell people where the build failed in
         # build_status. We do this here because BuildCompleted triggers no



