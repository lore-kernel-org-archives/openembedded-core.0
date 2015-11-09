Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BC1F8766EB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 22:15:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 09 Nov 2015 14:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,267,1444719600"; d="scan'208";a="597159092"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 14:15:58 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:04:43 +0000
Message-Id: <99b6fb84c9cff5cb2cb9656e2b17260a76b5cafc.1447077439.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447077439.git.mariano.lopez@linux.intel.com>
References: <cover.1447077439.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1447077439.git.mariano.lopez@linux.intel.com>
References: <cover.1447077439.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv2 6/6] license.bbclass: Create image license manifest
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
X-List-Received-Date: Mon, 09 Nov 2015 22:15:58 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change adds the license_deployed_manifest function
that will create the manifest for the packages deployed
in the image but not installed in rootfs.

This new function was added to ROOTFS_POSTPROCESS_COMMAND
so it will run after every rootfs task. Because of this
it could run few times for a single build and get different
dependencies. Sometimes this dependencies won't include all
the deployed packages, in order to avoid missing licenses a
tmp file is create during the build and deleted after the
build (LICENSE_TMP_JSON).

This change also modify the write_license_files because
the image manifest is different from the root manifest.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 78 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 5 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 463dd54..fa8807e 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -11,6 +11,7 @@ LICENSE_CREATE_PACKAGE[type] = "boolean"
 LICENSE_CREATE_PACKAGE ??= "0"
 LICENSE_PACKAGE_SUFFIX ??= "-lic"
 LICENSE_FILES_DIRECTORY ??= "${datadir}/licenses/"
+LICENSE_TMP_JSON ?= "${LICENSE_DIRECTORY}/deploy_packages.json"
 
 addtask populate_lic after do_patch before do_build
 do_populate_lic[dirs] = "${LICSSTATEDIR}/${PN}"
@@ -49,6 +50,59 @@ python license_create_manifest() {
     write_license_files(d, rootfs_license_manifest, pkg_dic)
 }
 
+python license_deployed_manifest_task() {
+    license_deployed_manifest(d)
+}
+
+def license_deployed_manifest(d):
+    """ Write the license manifest for the deployed packages.
+        The deployed packages usually includes the bootloader
+        and extra files to boot the target.
+    """
+    import json
+
+    packages = ""
+    dep_dic = {}
+    pkg_dic = {}
+    info_dir = os.path.join(d.getVar("PKGDATA_DIR",True), "runtime")
+
+    # Sometimes the initramfs image is build and it doesn't have
+    # the boot dependencies. In order to overcome this it is
+    # necessary to get save previous dependencies found. This is
+    # why the json_file is used (and deleted once the build is done)
+    json_file = d.getVar("LICENSE_TMP_JSON", True)
+    json_lock = bb.utils.lockfile("%s.lock" % json_file)
+    if os.path.exists(json_file):
+        with open(json_file) as f:
+            pkg_dic = json.loads(f.read())
+
+    dep_dic = get_deployed_dependencies(d)
+    for dep in dep_dic.keys():
+        # At least one package of the deployed dependency is needed
+        # to get the version.
+        pkg = get_package_from_deployed(d, dep)
+        if pkg and pkg not in pkg_dic.keys():
+            data_file = os.path.join(info_dir, pkg)
+            pkg_dic[pkg] = oe.packagedata.read_pkgdatafile(data_file)
+            # It is necessary to mark this will be used for image manifest
+            pkg_dic[pkg]["IMAGE_MANIFEST"] = True
+            pkg_dic[pkg]["FILES"] = \
+                    get_deployed_files(d, dep_dic[dep])
+            if not "LICENSE" in pkg_dic[pkg].keys():
+                pkg_lic = "LICENSE_" + pkg
+                pkg_dic[pkg]["LICENSE"] = pkg_dic[pkg][pkg_lic]
+
+    with open(json_file, "w") as f:
+        json.dump(pkg_dic, f, indent=4)
+    bb.utils.unlockfile(json_lock)
+
+    # Because it might be called several times we lock the license file
+    image_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+            d.getVar('IMAGE_NAME', True), 'image_license.manifest')
+    manifest_lock = bb.utils.lockfile("%s.lock" % image_license_manifest)
+    write_license_files(d, image_license_manifest, pkg_dic)
+    bb.utils.unlockfile(manifest_lock)
+
 def get_deployed_dependencies(d):
     """ Get all the deployed dependencies of an image """
 
@@ -154,6 +208,11 @@ def get_deployed_files(d, man_file):
             dep_files = "%s %s" % (dep_files, os.path.basename(f))
     return dep_files
 
+python license_delete_tmp_files () {
+    json_file = d.getVar("LICENSE_TMP_JSON", True)
+    os.remove(json_file)
+}
+
 def write_license_files(d, license_manifest, pkg_dic):
     import re
 
@@ -175,10 +234,18 @@ def write_license_files(d, license_manifest, pkg_dic):
                 pkg_dic[pkg]["LICENSES"] = re.sub('  *', ' ', pkg_dic[pkg]["LICENSES"])
                 pkg_dic[pkg]["LICENSES"] = pkg_dic[pkg]["LICENSES"].split()
 
-            license_file.write("PACKAGE NAME: %s\n" % pkg)
-            license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
-            license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
-            license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE"])
+            if not "IMAGE_MANIFEST" in pkg_dic[pkg]:
+                # Rootfs manifest
+                license_file.write("PACKAGE NAME: %s\n" % pkg)
+                license_file.write("PACKAGE VERSION: %s\n" % pkg_dic[pkg]["PV"])
+                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
+                license_file.write("LICENSE: %s\n\n" % pkg_dic[pkg]["LICENSE"])
+            else:
+                # Image manifest
+                license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
+                license_file.write("VERSION: %s\n" % pkg_dic[pkg]["PV"])
+                license_file.write("LICENSE: %s\n" % pkg_dic[pkg]["LICENSE"])
+                license_file.write("FILES:%s\n\n" % pkg_dic[pkg]["FILES"])
 
             # If the package doesn't contain any file, that is, its size is 0, the license
             # isn't relevant as far as the final image is concerned. So doing license check
@@ -586,7 +653,8 @@ SSTATETASKS += "do_populate_lic"
 do_populate_lic[sstate-inputdirs] = "${LICSSTATEDIR}"
 do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
 
-ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
+ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; license_deployed_manifest_task; "
+IMAGE_POSTPROCESS_COMMAND_prepend = " license_delete_tmp_files; "
 
 do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
 do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
-- 
1.8.4.5


