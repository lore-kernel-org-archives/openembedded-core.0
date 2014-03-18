Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC296F8FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 11:38:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Mar 2014 04:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,677,1389772800"; d="scan'208";a="494272094"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 18 Mar 2014 04:38:56 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Mar 2014 13:38:49 +0200
Message-Id: <5b61081abc7539b3884f09bf8e58517618b83a27.1395142153.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1395142153.git.laurentiu.palcu@intel.com>
References: <cover.1395142153.git.laurentiu.palcu@intel.com>
Subject: [PATCH 4/4] buildhistory.bbclass: create proper dependency files for SDK
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
X-List-Received-Date: Tue, 18 Mar 2014 11:38:56 -0000

The old functions were calling the list_installed_packages() wrapper
function that only listed the packages in an image rootfs. Even for
target/host SDK. Also, a python crash was possible if 'bitbake -c
populate_sdk core-image-*' was called without calling 'bitbake
core-image-*' first. That's because the wrapper was always looking into
the image rootfs...

This commit fixes the problem and calls the right wrapper for image/sdk.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/buildhistory.bbclass |   40 +++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 5d0a229..262095f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -313,22 +313,36 @@ def write_pkghistory(pkginfo, d):
             if os.path.exists(filevarpath):
                 os.unlink(filevarpath)
 
-python buildhistory_list_installed() {
-    from oe.rootfs import list_installed_packages
+#
+# rootfs_type can be: image, sdk_target, sdk_host
+#
+def buildhistory_list_installed(d, rootfs_type="image"):
+    from oe.rootfs import image_list_installed_packages
+    from oe.sdk import sdk_list_installed_packages
+
+    process_list = [('file', 'bh_installed_pkgs.txt'),\
+                    ('deps', 'bh_installed_pkgs_deps.txt')]
 
-    pkgs_list_file = os.path.join(d.getVar('WORKDIR', True),
-                                  "bh_installed_pkgs.txt")
+    for output_type, output_file in process_list:
+        output_file_full = os.path.join(d.getVar('WORKDIR', True), output_file)
 
-    with open(pkgs_list_file, 'w') as pkgs_list:
-        pkgs_list.write(list_installed_packages(d, 'file'))
+        with open(output_file_full, 'w') as output:
+            if rootfs_type == "image":
+                output.write(image_list_installed_packages(d, output_type))
+            else:
+                output.write(sdk_list_installed_packages(d, rootfs_type == "sdk_target", output_type))
 
-    pkgs_deps_file = os.path.join(d.getVar('WORKDIR', True),
-                                  "bh_installed_pkgs_deps.txt")
+python buildhistory_list_installed_image() {
+    buildhistory_list_installed(d)
+}
 
-    with open(pkgs_deps_file, 'w') as pkgs_deps:
-        pkgs_deps.write(list_installed_packages(d, 'deps'))
+python buildhistory_list_installed_sdk_target() {
+    buildhistory_list_installed(d, "sdk_target")
 }
 
+python buildhistory_list_installed_sdk_host() {
+    buildhistory_list_installed(d, "sdk_host")
+}
 
 buildhistory_get_installed() {
 	mkdir -p $1
@@ -471,15 +485,15 @@ END
 }
 
 # By prepending we get in before the removal of packaging files
-ROOTFS_POSTPROCESS_COMMAND =+ " buildhistory_list_installed ;\
+ROOTFS_POSTPROCESS_COMMAND =+ " buildhistory_list_installed_image ;\
                                 buildhistory_get_image_installed ; "
 
 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
 
 # We want these to be the last run so that we get called after complementary package installation
-POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed ;\
+POPULATE_SDK_POST_TARGET_COMMAND_append = " buildhistory_list_installed_sdk_target ;\
                                             buildhistory_get_sdk_installed_target ; "
-POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed ;\
+POPULATE_SDK_POST_HOST_COMMAND_append = " buildhistory_list_installed_sdk_host ;\
                                           buildhistory_get_sdk_installed_host ; "
 
 SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
-- 
1.7.9.5


