Return-Path: <elliot.smith@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 229F9771CF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:25:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 02 Feb 2016 02:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="903732232"
Received: from unknown (HELO lp.ger.corp.intel.com) ([10.252.22.6])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 02:25:09 -0800
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 10:25:02 +0000
Message-Id: <1454408703-27167-1-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 1/2] toaster.bbclass: attach image file scan postfunc to do_image_complete
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
X-List-Received-Date: Tue, 02 Feb 2016 10:25:10 -0000

The postfunc for finding image files after completion of a build
fails, as the image files we're interested in don't exist at the
point when the scan is currently done (following do_rootfs).

Attach the postfunc for scanning for image files to the new
do_image_complete task, which definitely runs after the image files
have been created.

[YOCTO #8956]

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/classes/toaster.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index fba9067..e307014 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -159,7 +159,7 @@ python toaster_image_dumpdata() {
             except OSError as e:
                 bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
 
-    bb.event.fire(bb.event.MetadataEvent("ImageFileSize",image_info_data), d)
+    bb.event.fire(bb.event.MetadataEvent("ImageFileSize", image_info_data), d)
 }
 
 python toaster_artifact_dumpdata() {
@@ -175,14 +175,12 @@ python toaster_artifact_dumpdata() {
         for fn in filenames:
             try:
                 artifact_path = os.path.join(dirpath, fn)
-                filestat = os.stat(artifact_path)
                 if not os.path.islink(artifact_path):
-                    artifact_info_data[artifact_path] = filestat.st_size
+                    artifact_info_data[artifact_path] = os.stat(artifact_path).st_size
             except OSError as e:
-                import sys
                 bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
 
-    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize",artifact_info_data), d)
+    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize", artifact_info_data), d)
 }
 
 # collect list of buildstats files based on fired events; when the build completes, collect all stats and fire an event with collected data
@@ -357,9 +355,11 @@ toaster_buildhistory_dump[eventmask] = "bb.event.BuildCompleted"
 do_package[postfuncs] += "toaster_package_dumpdata "
 do_package[vardepsexclude] += "toaster_package_dumpdata "
 
-do_rootfs[postfuncs] += "toaster_image_dumpdata "
+do_image_complete[postfuncs] += "toaster_image_dumpdata "
+do_image_complete[vardepsexclude] += "toaster_image_dumpdata "
+
 do_rootfs[postfuncs] += "toaster_licensemanifest_dump "
-do_rootfs[vardepsexclude] += "toaster_image_dumpdata toaster_licensemanifest_dump "
+do_rootfs[vardepsexclude] += "toaster_licensemanifest_dump "
 
 do_populate_sdk[postfuncs] += "toaster_artifact_dumpdata "
 do_populate_sdk[vardepsexclude] += "toaster_artifact_dumpdata "
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


