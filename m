Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6714160722
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 18:56:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 Nov 2015 10:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="604303880"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2015 10:56:23 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 10:44:50 +0000
Message-Id: <7b4fc9d4b4fe71ac343bbb5128525ee1d5e2bbb2.1448015777.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1447942163.git.mariano.lopez@linux.intel.com>
References: <cover.1447942163.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448015777.git.mariano.lopez@linux.intel.com>
References: <cover.1448015777.git.mariano.lopez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv4 2/6] license.bbclass: Split license create manifest
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
X-List-Received-Date: Fri, 20 Nov 2015 18:56:23 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This changes moves the writing of the licenses to a
separated function that could be called for other packages.

With these change it will be easier to reuse the writing of
the license for the packages deployed but not installed in
the rootfs.

[YOCTO #6772]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/license.bbclass | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 76f40c9..83ae771 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -26,14 +26,9 @@ python write_package_manifest() {
 }
 
 python license_create_manifest() {
-    import re
     import oe.packagedata
     from oe.rootfs import image_list_installed_packages
 
-    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
-    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
-    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
-
     build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
     if build_images_from_feeds == "1":
         return 0
@@ -49,8 +44,18 @@ python license_create_manifest() {
             pkg_lic_name = "LICENSE_" + pkg_name
             pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
 
-    license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
+    rootfs_license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                         d.getVar('IMAGE_NAME', True), 'license.manifest')
+    write_license_files(d, rootfs_license_manifest, pkg_dic)
+}
+
+def write_license_files(d, license_manifest, pkg_dic):
+    import re
+
+    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
+    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
+    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
+
     with open(license_manifest, "w") as license_file:
         for pkg in sorted(pkg_dic):
             if bad_licenses:
@@ -98,15 +103,16 @@ python license_create_manifest() {
     if copy_lic_manifest == "1":
         rootfs_license_dir = os.path.join(d.getVar('IMAGE_ROOTFS', 'True'), 
                                 'usr', 'share', 'common-licenses')
-        os.makedirs(rootfs_license_dir)
+        bb.utils.mkdirhier(rootfs_license_dir)
         rootfs_license_manifest = os.path.join(rootfs_license_dir,
-                                                'license.manifest')
-        os.link(license_manifest, rootfs_license_manifest)
+                os.path.split(license_manifest)[1])
+        if not os.path.exists(rootfs_license_manifest):
+            os.link(license_manifest, rootfs_license_manifest)
 
         if copy_lic_dirs == "1":
             for pkg in sorted(pkg_dic):
                 pkg_rootfs_license_dir = os.path.join(rootfs_license_dir, pkg)
-                os.makedirs(pkg_rootfs_license_dir)
+                bb.utils.mkdirhier(pkg_rootfs_license_dir)
                 pkg_license_dir = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                                             pkg_dic[pkg]["PN"]) 
                 licenses = os.listdir(pkg_license_dir)
@@ -124,14 +130,16 @@ python license_create_manifest() {
                         if not os.path.exists(rootfs_license):
                             os.link(pkg_license, rootfs_license)
 
-                        os.symlink(os.path.join('..', lic), pkg_rootfs_license)
+                        if not os.path.exists(pkg_rootfs_license):
+                            os.symlink(os.path.join('..', lic), pkg_rootfs_license)
                     else:
-                        if oe.license.license_ok(canonical_license(d,
-                            lic), bad_licenses) == False:
+                        if (oe.license.license_ok(canonical_license(d,
+                                lic), bad_licenses) == False or
+                                os.path.exists(pkg_rootfs_license)):
                             continue
 
                         os.link(pkg_license, pkg_rootfs_license)
-}
+
 
 python do_populate_lic() {
     """
-- 
1.8.4.5


