Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ABD09607F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 22:53:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2016 15:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,354,1464678000"; d="scan'208";a="845145072"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga003.jf.intel.com with ESMTP; 12 Jul 2016 15:53:13 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 15:54:27 -0700
Message-Id: <3579e2e48364aef2f63e9fc8b4bc04dbfa07bc5d.1468363460.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468363460.git.brian.avery@intel.com>
References: <cover.1468363460.git.brian.avery@intel.com>
Subject: [PATCH 1/2] toaster.bbclass: remove directory scan logic for detecting artifacts
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
X-List-Received-Date: Tue, 12 Jul 2016 22:53:15 -0000

From: Elliot Smith <elliot.smith@intel.com>

toaster.bbclass does a scan of the image deploy and SDK directories
when a build finishes. However, this brings no benefit and could be
better managed and made easier to modify if moved to toasterui and
carried out when the BuildCompleted event occurs.

Remove the image scan code from toaster.bbclass, prior to moving it
to toasterui and buildinfohelper.

Also remove the license manifest update code, as this can also be
done from toasterui.

The postfuncs for do_populate_sdk are retained, but no longer
do the directory scan for SDK artifacts. Instead, they fire
an event with the value of the TOOLCHAIN_OUTPUTNAME variable,
as this is only accessible at the point when the do_populate_sdk
and do_populate_sdk_ext tasks are run. The value of this can then
be used by buildinfohelper to find the SDK artifacts produced by a
target.

[YOCTO #9002]

Signed-off-by: Elliot Smith <elliot.smith@intel.com>
Signed-off-by: bavery <brian.avery@intel.com>
---
 classes/toaster.bbclass | 74 ++++++-------------------------------------------
 1 file changed, 8 insertions(+), 66 deletions(-)

diff --git a/classes/toaster.bbclass b/classes/toaster.bbclass
index 1878fe0..90ea563 100644
--- a/classes/toaster.bbclass
+++ b/classes/toaster.bbclass
@@ -136,60 +136,16 @@ python toaster_package_dumpdata() {
 
 # 2. Dump output image files information
 
-python toaster_image_dumpdata() {
-    """
-    Image filename for output images is not standardized.
-    image_types.bbclass will spell out IMAGE_CMD_xxx variables that actually
-    have hardcoded ways to create image file names in them.
-    So we look for files starting with the set name.
-
-    We also look for other files in the images/ directory which don't
-    match IMAGE_NAME, such as the kernel bzImage, modules tarball etc.
-    """
-
-    dir_to_walk = d.getVar('DEPLOY_DIR_IMAGE', True);
-    image_name = d.getVar('IMAGE_NAME', True);
-    image_info_data = {}
-    artifact_info_data = {}
-
-    # collect all images and artifacts in the images directory
-    for dirpath, dirnames, filenames in os.walk(dir_to_walk):
-        for filename in filenames:
-            full_path = os.path.join(dirpath, filename)
-            try:
-                if filename.startswith(image_name):
-                    # image
-                    image_info_data[full_path] = os.stat(full_path).st_size
-                else:
-                    # other non-image artifact
-                    if not os.path.islink(full_path):
-                        artifact_info_data[full_path] = os.stat(full_path).st_size
-            except OSError as e:
-                bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
-
-    bb.event.fire(bb.event.MetadataEvent("ImageFileSize", image_info_data), d)
-    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize", artifact_info_data), d)
-}
-
 python toaster_artifact_dumpdata() {
     """
-    Dump data about artifacts in the SDK_DEPLOY directory
+    Dump data about SDK variables
     """
 
-    dir_to_walk = d.getVar("SDK_DEPLOY", True)
-    artifact_info_data = {}
-
-    # collect all artifacts in the sdk directory
-    for dirpath, dirnames, filenames in os.walk(dir_to_walk):
-        for filename in filenames:
-            full_path = os.path.join(dirpath, filename)
-            try:
-                if not os.path.islink(full_path):
-                    artifact_info_data[full_path] = os.stat(full_path).st_size
-            except OSError as e:
-                bb.event.fire(bb.event.MetadataEvent("OSErrorException", e), d)
+    event_data = {
+      "TOOLCHAIN_OUTPUTNAME": d.getVar("TOOLCHAIN_OUTPUTNAME", True)
+    }
 
-    bb.event.fire(bb.event.MetadataEvent("ArtifactFileSize", artifact_info_data), d)
+    bb.event.fire(bb.event.MetadataEvent("SDKArtifactInfo", event_data), d)
 }
 
 # collect list of buildstats files based on fired events; when the build completes, collect all stats and fire an event with collected data
@@ -361,17 +317,6 @@ python toaster_buildhistory_dump() {
 
 }
 
-# dump information related to license manifest path
-
-python toaster_licensemanifest_dump() {
-    deploy_dir = d.getVar('DEPLOY_DIR', True);
-    image_name = d.getVar('IMAGE_NAME', True);
-
-    data = { 'deploy_dir' : deploy_dir, 'image_name' : image_name }
-
-    bb.event.fire(bb.event.MetadataEvent("LicenseManifestPath", data), d)
-}
-
 # set event handlers
 addhandler toaster_layerinfo_dumpdata
 toaster_layerinfo_dumpdata[eventmask] = "bb.event.TreeDataPreparationCompleted"
@@ -388,11 +333,8 @@ do_packagedata_setscene[vardepsexclude] += "toaster_package_dumpdata "
 do_package[postfuncs] += "toaster_package_dumpdata "
 do_package[vardepsexclude] += "toaster_package_dumpdata "
 
-do_image_complete[postfuncs] += "toaster_image_dumpdata "
-do_image_complete[vardepsexclude] += "toaster_image_dumpdata "
-
-do_rootfs[postfuncs] += "toaster_licensemanifest_dump "
-do_rootfs[vardepsexclude] += "toaster_licensemanifest_dump "
-
 do_populate_sdk[postfuncs] += "toaster_artifact_dumpdata "
 do_populate_sdk[vardepsexclude] += "toaster_artifact_dumpdata "
+
+do_populate_sdk_ext[postfuncs] += "toaster_artifact_dumpdata "
+do_populate_sdk_ext[vardepsexclude] += "toaster_artifact_dumpdata "
\ No newline at end of file
-- 
1.9.1


