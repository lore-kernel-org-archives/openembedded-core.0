Return-Path: <elliot.smith@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E57B777202
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 10:25:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 02 Feb 2016 02:25:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,384,1449561600"; d="scan'208";a="903732257"
Received: from unknown (HELO lp.ger.corp.intel.com) ([10.252.22.6])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 02:25:12 -0800
From: Elliot Smith <elliot.smith@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 10:25:03 +0000
Message-Id: <1454408703-27167-2-git-send-email-elliot.smith@intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1454408703-27167-1-git-send-email-elliot.smith@intel.com>
References: <1454408703-27167-1-git-send-email-elliot.smith@intel.com>
Subject: [PATCH 2/2] toaster.bbclass: reinstate scan for artifacts in the sdk directory
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
X-List-Received-Date: Tue, 02 Feb 2016 10:25:13 -0000

During refactoring of the SDK/artifact scan code in toaster.bbclass,
the code to find other non-image artifacts in the images/ directory
was incorrectly removed.

Reinstate that code and clean it up so it's clearer what's happening
and so that non-image artifacts are correctly reported.

[YOCTO #8956]

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
---
 meta/classes/toaster.bbclass | 38 ++++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
index e307014..51a4c74 100644
--- a/meta/classes/toaster.bbclass
+++ b/meta/classes/toaster.bbclass
@@ -143,23 +143,33 @@ python toaster_image_dumpdata() {
     image_types.bbclass will spell out IMAGE_CMD_xxx variables that actually
     have hardcoded ways to create image file names in them.
     So we look for files starting with the set name.
+
+    We also look for other files in the images/ directory which don't
+    match IMAGE_NAME, such as the kernel bzImage, modules tarball etc.
     """
 
-    deploy_dir_image = d.getVar('DEPLOY_DIR_IMAGE', True);
+    dir_to_walk = d.getVar('DEPLOY_DIR_IMAGE', True);
     image_name = d.getVar('IMAGE_NAME', True);
     image_info_data = {}
+    artifact_info_data = {}
 
-    # collect all images
-    for dirpath, dirnames, filenames in os.walk(deploy_dir_image):
-        for fn in filenames:
+    # collect all images and artifacts in the images directory
+    for dirpath, dirnames, filenames in os.walk(dir_to_walk):
+        for filename in filenames:
+            full_path = os.path.join(dirpath, filename)
             try:
-                if fn.startswith(image_name):
-                    image_output = os.path.join(dirpath, fn)
-                    image_info_data[image_output] = os.stat(image_output).st_size
+                if filename.startswith(image_name):
+                    # image
+                    image_info_data[full_path] = os.stat(full_path).st_size
+                else:
+                    # other non-image artifact
+                    if not os.path.islink(full_path):
+                        artifact_info_data[full_path] = os.stat(full_path).st_size
             except OSError as e:
                 bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
 
     bb.event.fire(bb.event.MetadataEvent("ImageFileSize", image_info_data), d)
+    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize", artifact_info_data), d)
 }
 
 python toaster_artifact_dumpdata() {
@@ -167,16 +177,16 @@ python toaster_artifact_dumpdata() {
     Dump data about artifacts in the SDK_DEPLOY directory
     """
 
-    artifact_dir = d.getVar("SDK_DEPLOY", True)
+    dir_to_walk = d.getVar("SDK_DEPLOY", True)
     artifact_info_data = {}
 
-    # collect all artifacts
-    for dirpath, dirnames, filenames in os.walk(artifact_dir):
-        for fn in filenames:
+    # collect all artifacts in the sdk directory
+    for dirpath, dirnames, filenames in os.walk(dir_to_walk):
+        for filename in filenames:
+            full_path = os.path.join(dirpath, filename)
             try:
-                artifact_path = os.path.join(dirpath, fn)
-                if not os.path.islink(artifact_path):
-                    artifact_info_data[artifact_path] = os.stat(artifact_path).st_size
+                if not os.path.islink(full_path):
+                    artifact_info_data[full_path] = os.stat(full_path).st_size
             except OSError as e:
                 bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
 
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


