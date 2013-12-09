Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3366E274
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 19:07:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2013 11:03:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,859,1378882800"; d="scan'208";a="421821793"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.25])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2013 11:07:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 19:06:55 +0000
Message-Id: <9204ea3768b1e7612f8093b131e2453e3f0203e7.1386615914.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386615914.git.paul.eggleton@linux.intel.com>
References: <cover.1386615914.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386615914.git.paul.eggleton@linux.intel.com>
References: <cover.1386615914.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] toaster.bbclass: read build stats
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
X-List-Received-Date: Mon, 09 Dec 2013 19:07:03 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

In the process of removing the local system
accesses from toaster UI (which must be able to
run remotely), the code to read build stats
is moved from Bitbake Toaster UI
to the server-side toaster.bbclass

The code will accumulate a list of stat files
to be read at build completion. When the
build completes, the whole data list is read and
sent through in a single event.

    [YOCTO #5604]

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/toaster.bbclass | 73 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index ec9b6c5..59c61c5 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -153,6 +153,79 @@ python toaster_image_dumpdata() {
 }
 
 
+
+# collect list of buildstats files based on fired events; when the build completes, collect all stats and fire an event with collected data
+
+python toaster_collect_task_stats() {
+    import bb.build
+    import bb.event
+    import bb.data
+    import bb.utils
+    import os
+
+    def _append_read_list(v):
+        lock = bb.utils.lockfile(e.data.expand("${TOPDIR}/toaster.lock"), False, True)
+
+        with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "a") as fout:
+            bn = get_bn(e)
+            bsdir = os.path.join(e.data.getVar('BUILDSTATS_BASE', True), bn)
+            taskdir = os.path.join(bsdir, e.data.expand("${PF}"))
+            fout.write("%s:%s:%s\n" % (e.taskfile, e.taskname, os.path.join(taskdir, e.task)))
+
+        bb.utils.unlockfile(lock)
+
+    def _read_stats(filename):
+        cpu_usage = 0
+        disk_io = 0
+        startio = ''
+        endio = ''
+        pn = ''
+        taskname = ''
+        statinfo = {}
+
+        with open(filename, 'r') as task_bs:
+            for line in task_bs.readlines():
+                k,v = line.strip().split(": ", 1)
+                statinfo[k] = v
+
+        try:
+            cpu_usage = statinfo["CPU usage"]
+            endio = statinfo["EndTimeIO"]
+            startio = statinfo["StartTimeIO"]
+        except KeyError:
+            pass    # we may have incomplete data here
+
+        if startio and endio:
+            disk_io = int(endio.strip('\n ')) - int(startio.strip('\n '))
+
+        if cpu_usage:
+            cpu_usage = float(cpu_usage.strip('% \n'))
+
+        return {'cpu_usage': cpu_usage, 'disk_io': disk_io}
+
+
+    if isinstance(e, (bb.build.TaskSucceeded, bb.build.TaskFailed)):
+        _append_read_list(e)
+        pass
+
+
+    if isinstance(e, bb.event.BuildCompleted):
+        events = []
+        with open(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"), "r") as fin:
+            for line in fin:
+                (taskfile, taskname, filename) = line.strip().split(":")
+                events.append((taskfile, taskname, _read_stats(filename)))
+        bb.event.fire(bb.event.MetadataEvent("BuildStatsList", events), e.data)
+        os.unlink(os.path.join(e.data.getVar('BUILDSTATS_BASE', True), "toasterstatlist"))
+}
+
+
+# set event handlers
+addhandler toaster_layerinfo_dumpdata
+toaster_layerinfo_dumpdata[eventmask] = "bb.event.TreeDataPreparationCompleted"
+
+addhandler toaster_collect_task_stats
+toaster_collect_task_stats[eventmask] = "bb.event.BuildCompleted bb.build.TaskSucceeded bb.build.TaskFailed"
 do_package[postfuncs] += "toaster_package_dumpdata "
 
 do_rootfs[postfuncs] += "toaster_image_dumpdata "
-- 
1.8.1.2


