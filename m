Return-Path: <elliot.smith@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A8B44731C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 08:56:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jan 2016 00:56:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,288,1449561600"; d="scan'208";a="632673949"
Received: from mblaszak-mobl2.ger.corp.intel.com (HELO lp.ger.corp.intel.com)
	([10.252.10.17])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jan 2016 00:56:05 -0800
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jan 2016 08:55:36 +0000
Message-Id: <1452675336-28886-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] toaster.bbclass: Separate artifact dump from image file dump
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
X-List-Received-Date: Wed, 13 Jan 2016 08:56:27 -0000

SDK artifacts were being dumped alongside the image file dump.
However, the dump was not being triggered correctly, as it
should be attached as a postfunc to do_populate_sdk, rather than
do_rootfs, as do_rootfs doesn't always fire when populating
the SDK directory.

By adding a postfunc to do_populate_sdk, the postfunc is fired
in the correct situations.

Also fixes the directory which is scanned for SDK artifacts, as
this is different from the image file directory.

[YOCTO #7603]

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/classes/toaster.bbclass | 38 +++++++++++++++++++++++++++-----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index bbda2f8..fba9067 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -147,31 +147,43 @@ python toaster_image_dumpdata() {
 
     deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE', True);
     image_name = d.getVar('IMAGE_NAME', True);
-
     image_info_data = {}
-    artifact_info_data = {}
 
-    # collect all artifacts
+    # collect all images
     for dirpath, dirnames, filenames in os.walk(deploy_dir_image):
         for fn in filenames:
             try:
                 if fn.startswith(image_name):
                     image_output = os.path.join(dirpath, fn)
                     image_info_data[image_output] = os.stat(image_output).st_size
-                else:
-                    import stat
-                    artifact_path = os.path.join(dirpath, fn)
-                    filestat = os.stat(artifact_path)
-                    if not os.path.islink(artifact_path):
-                        artifact_info_data[artifact_path] = filestat.st_size
             except OSError as e:
                 bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
 
     bb.event.fire(bb.event.MetadataEvent("ImageFileSize",image_info_data), d)
-    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize",artifact_info_data), d)
 }
 
+python toaster_artifact_dumpdata() {
+    """
+    Dump data about artifacts in the SDK_DEPLOY directory
+    """
+
+    artifact_dir = d.getVar("SDK_DEPLOY", True)
+    artifact_info_data = {}
+
+    # collect all artifacts
+    for dirpath, dirnames, filenames in os.walk(artifact_dir):
+        for fn in filenames:
+            try:
+                artifact_path = os.path.join(dirpath, fn)
+                filestat = os.stat(artifact_path)
+                if not os.path.islink(artifact_path):
+                    artifact_info_data[artifact_path] = filestat.st_size
+            except OSError as e:
+                import sys
+                bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
 
+    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize",artifact_info_data), d)
+}
 
 # collect list of buildstats files based on fired events; when the build completes, collect all stats and fire an event with collected data
 
@@ -341,9 +353,13 @@ toaster_collect_task_stats[eventmask] = "bb.event.BuildCompleted bb.build.TaskSu
 
 addhandler toaster_buildhistory_dump
 toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
+
 do_package[postfuncs] += "toaster_package_dumpdata "
 do_package[vardepsexclude] += "toaster_package_dumpdata "
 
 do_rootfs[postfuncs] += "toaster_image_dumpdata "
 do_rootfs[postfuncs] += "toaster_licensemanifest_dump "
-do_rootfs[vardepsexclude] += "toaster_image_dumpdata toaster_licensemanifest_dump"
+do_rootfs[vardepsexclude] += "toaster_image_dumpdata toaster_licensemanifest_dump "
+
+do_populate_sdk[postfuncs] += "toaster_artifact_dumpdata "
+do_populate_sdk[vardepsexclude] += "toaster_artifact_dumpdata "
-- 
1.9.3

---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


