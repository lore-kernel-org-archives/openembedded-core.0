Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7907260DF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 22:36:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2015 14:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,319,1444719600"; d="scan'208";a="855244986"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga002.fm.intel.com with ESMTP; 19 Nov 2015 14:36:56 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:25:19 +0000
Message-Id: <39ab7eca78de74d61bfbf70b03a61370c559bf0e.1447942163.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv3 6/6] license.bbclass: Create image license manifest
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
X-List-Received-Date: Thu, 19 Nov 2015 22:36:55 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change adds the license_deployed_manifest function
that will create the manifest for the packages deployed
next to the image but not installed in rootfs. Some
examples of these recipes would be the bootloaders, or
the kernel.

This new function was added to ROOTFS_POSTPROCESS_COMMAND
so it will run after every rootfs task.

This change also modify the write_license_files because
the image manifest is different from the root manifest.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 63 +++++++++++++++++++++++++++++++++++---------
 1 file changed, 51 insertions(+), 12 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index dbec4d7..8d2bc0d 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -25,6 +25,10 @@ python write_package_manifest() {
         'w+').write(image_list_installed_packages(d))
 }
 
+python write_deploy_manifest() {
+    license_deployed_manifest(d)
+}
+
 python license_create_manifest() {
     import oe.packagedata
     from oe.rootfs import image_list_installed_packages
@@ -70,16 +74,24 @@ def write_license_files(d, license_manifest, pkg_dic):
                 pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
                 pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
 
-            license_file.write("PACKAGE NAME: %s\n" % pkg)
-            license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
-            license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
-            license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE"])
-
-            # If the package doesn't contain any file, that is, its size is 0, the license
-            # isn't relevant as far as the final image is concerned. So doing license check
-            # doesn't make much sense, skip it.
-            if pkg_dic[pkg]["PKGSIZE_%s" % pkg] == "0":
-                continue
+            if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
+                # Rootfs manifest
+                license_file.write("PACKAGE NAME: %s\n" % pkg)
+                license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
+                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
+                license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE"])
+
+                # If the package doesn't contain any file, that is, its size is 0, the license
+                # isn't relevant as far as the final image is concerned. So doing license check
+                # doesn't make much sense, skip it.
+                if pkg_dic[pkg]["PKGSIZE_%s" % pkg] == "0":
+                    continue
+            else:
+                # Image manifest
+                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
+                license_file.write("VERSION: %s\n" % pkg_dic[pkg]["PV"])
+                license_file.write("LICENSE: %s\n" % pkg_dic[pkg]["LICENSE"])
+                license_file.write("FILES:%s\n\n" % pkg_dic[pkg]["FILES"])
 
             for lic in pkg_dic[pkg]["LICENSES"]:
                 lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
@@ -141,6 +153,33 @@ def write_license_files(d, license_manifest, pkg_dic):
                         os.link(pkg_license, pkg_rootfs_license)
 
 
+def license_deployed_manifest(d):
+    """
+    Write the license manifest for the deployed recipes.
+    The deployed recipes usually includes the bootloader
+    and extra files to boot the target.
+    """
+
+    dep_dic = {}
+    man_dic = {}
+    lic_dir = d.getVar("LICENSE_DIRECTORY", True)
+
+    dep_dic = get_deployed_dependencies(d)
+    for dep in dep_dic.keys():
+        man_dic[dep] = {}
+        # It is necessary to mark this will be used for image manifest
+        man_dic[dep]["IMAGE_MANIFEST"] = True
+        man_dic[dep]["PN"] = dep
+        man_dic[dep]["FILES"] = get_deployed_files(dep_dic[dep])
+        with open(os.path.join(lic_dir, dep, "recipeinfo"), "r") as f:
+            for line in f.readlines():
+                key,val = line.split(": ", 1)
+                man_dic[dep][key] = val[:-1]
+
+    image_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+            d.getVar('IMAGE_NAME', True), 'image_license.manifest')
+    write_license_files(d, image_license_manifest, man_dic)
+
 def get_deployed_dependencies(d):
     """
     Get all the deployed dependencies of an image
@@ -227,7 +266,7 @@ def get_boot_dependencies(d):
 
 def get_deployed_files(man_file):
     """
-    This will get the files deployed from the sstate manifest
+    Get the files deployed from the sstate manifest
     """
 
     dep_files = ""
@@ -591,7 +630,7 @@ SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
-ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
+ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; write_deploy_manifest; license_create_manifest; "
 
 do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
-- 
1.8.4.5


