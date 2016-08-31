Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 54D1173243
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 11:04:18 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 31 Aug 2016 04:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,261,1470726000"; 
   d="scan'208";a="3332770"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 31 Aug 2016 04:04:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.68])
	by linux.intel.com (Postfix) with ESMTP id 516446A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 04:03:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 14:02:55 +0300
Message-Id: <ca3f6fc977432a60eec3fad70563d044ceb780a2.1472641071.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1472641071.git.ed.bartosh@linux.intel.com>
References: <cover.1472641071.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1472641071.git.ed.bartosh@linux.intel.com>
References: <cover.1472641071.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 6/6] toaster: fire TaskArtifacts event
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
X-List-Received-Date: Wed, 31 Aug 2016 11:04:18 -0000

Fire TaskArtifact MetaData event for deployment tasks when task
either completed or skipped. Event contains full task id
(recipe+task) and list of deployment artifacts from sstate
manifest.

This should allow Toaster to always get notified about deployment
artifacts produced by the build.

[YOCTO #9869]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/toaster.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index 972efb9..4bddf34 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -324,6 +324,20 @@ python toaster_buildhistory_dump() {
 
 }
 
+# get list of artifacts from sstate manifest
+python toaster_artifacts() {
+    if e.taskname in ["do_deploy", "do_image_complete", "do_populate_sdk", "do_populate_sdk_ext"]:
+        d2 = d.createCopy()
+        d2.setVar('FILE', e.taskfile)
+        d2.setVar('SSTATE_MANMACH', d2.expand("${MACHINE}"))
+        manifest = oe.sstatesig.sstate_get_manifest_filename(e.taskname[3:], d2)[0]
+        if os.access(manifest, os.R_OK):
+            with open(manifest) as fmanifest:
+                artifacts = [fname.strip() for fname in fmanifest]
+                data = {"task": e.taskid, "artifacts": artifacts}
+                bb.event.fire(bb.event.MetadataEvent("TaskArtifacts", data), d2)
+}
+
 # set event handlers
 addhandler toaster_layerinfo_dumpdata
 toaster_layerinfo_dumpdata[eventmask] = "bb.event.TreeDataPreparationCompleted"
@@ -334,6 +348,9 @@ toaster_collect_task_stats[eventmask] = "bb.event.BuildCompleted bb.build.TaskSu
 addhandler toaster_buildhistory_dump
 toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
 
+addhandler toaster_artifacts
+toaster_artifacts[eventmask] = "bb.runqueue.runQueueTaskSkipped bb.runqueue.runQueueTaskCompleted"
+
 do_packagedata_setscene[postfuncs] += "toaster_package_dumpdata "
 do_packagedata_setscene[vardepsexclude] += "toaster_package_dumpdata "
 
-- 
2.1.4


