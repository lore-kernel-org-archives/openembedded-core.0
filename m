Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AEF5373F47
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 20:41:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2015 13:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,393,1427785200"; d="scan'208";a="491228636"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by FMSMGA003.fm.intel.com with ESMTP; 08 May 2015 13:41:30 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 May 2015 20:41:32 +0000
Message-Id: <b5cfc1bb70bf88f8b0c4ffe8d55ee4c3cb73ab9c.1431117450.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1431117450.git.anibal.limon@linux.intel.com>
References: <cover.1431117450.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1431117450.git.anibal.limon@linux.intel.com>
References: <cover.1431117450.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 5/5] license_class: license_create_manifest improvment
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
X-List-Received-Date: Fri, 08 May 2015 20:41:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use image_list_installed_packges instead of open manually the package
manifest and iterate over it.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 54ab123..7972c79 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -28,6 +28,7 @@ python write_package_manifest() {
 python license_create_manifest() {
     import re
     import oe.packagedata
+    from oe.rootfs import image_list_installed_packages
 
     bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
     bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
@@ -38,19 +39,15 @@ python license_create_manifest() {
         return 0
 
     pkg_dic = {}
-    package_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
-                        d.getVar('IMAGE_NAME', True), 'package.manifest')
-    with open(package_manifest, "r") as package_file:
-        pkg_list = package_file.read().split()
-        for pkg in pkg_list:
-            pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
-                                    'runtime-reverse', pkg)
-            pkg_name = os.path.basename(os.readlink(pkg_info))
-
-            pkg_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
-            if not "LICENSE" in pkg_dic[pkg_name].keys():
-                pkg_lic_name = "LICENSE_" + pkg_name
-                pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
+    for pkg in image_list_installed_packages(d).split("\n"):
+        pkg_info = os.path.join(d.getVar('PKGDATA_DIR', True),
+                                'runtime-reverse', pkg)
+        pkg_name = os.path.basename(os.readlink(pkg_info))
+
+        pkg_dic[pkg_name] = oe.packagedata.read_pkgdatafile(pkg_info)
+        if not "LICENSE" in pkg_dic[pkg_name].keys():
+            pkg_lic_name = "LICENSE_" + pkg_name
+            pkg_dic[pkg_name]["LICENSE"] = pkg_dic[pkg_name][pkg_lic_name]
 
     license_manifest = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                         d.getVar('IMAGE_NAME', True), 'license.manifest')
-- 
1.8.4.5


