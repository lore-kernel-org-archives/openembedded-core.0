Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 98DBA70620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 18:33:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2014 11:32:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,278,1413270000"; d="scan'208";a="627816987"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.154])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2014 11:33:53 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Oct 2014 12:34:14 -0600
Message-Id: <1414607656-12144-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
References: <1414607656-12144-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] license_class: Added support for INCOMPATIBLE_LICENSE into license_create_manifest
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
X-List-Received-Date: Wed, 29 Oct 2014 18:33:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now license_create_manifest handle INCOMPATIBLE_LICENSE to avoid
put them into license.manifest and copy them into target image.

Generalized license_ok(license) to license_ok(bad_licenses, license)
to avoid duplicate code.

[YOCTO #6765]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/license.bbclass | 60 ++++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 19 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c8a86ce..c11ef1c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -28,6 +28,15 @@ python write_package_manifest() {
 python license_create_manifest() {
     import shutil
     import re
+    import oe.license
+
+    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE", True) or "").split()
+    bad_licenses = map(lambda l: canonical_license(d, l), bad_licenses)
+
+    # Handles an "or" or two license sets provided by
+    # flattened_licenses(), pick one that works if possible.
+    def choose_lic_set(a, b):
+        return a if all(license_ok(bad_licenses, lic) for lic in a) else b
 
     build_images_from_feeds = d.getVar('BUILD_IMAGES_FROM_FEEDS', True)
     if build_images_from_feeds == "1":
@@ -70,9 +79,13 @@ python license_create_manifest() {
             license_file.write("RECIPE NAME: %s\n" % pkg_dic[pkg]["PN"])
             license_file.write("LICENSE:")
 
-            licenses = re.sub('[|&()*]', '', pkg_dic[pkg]["LICENSE"])
-            licenses = re.sub('  *', ' ', licenses)
-            for lic in licenses.split():
+            try:
+                licenses = oe.license.flattened_licenses(pkg_dic[pkg]["LICENSE"]
+                            , choose_lic_set)
+            except oe.license.LicenseError as exc:
+                bb.fatal('%s: %s' % (d.getVar('P', True), exc))
+
+            for lic in licenses:
                 lic = re.sub('\+', '', lic)
                 lic_file = os.path.join(d.getVar('LICENSE_DIRECTORY', True),
                                         pkg_dic[pkg]["PN"], "generic_%s" % lic)
@@ -110,11 +123,18 @@ python license_create_manifest() {
                     pkg_rootfs_license = os.path.join(pkg_rootfs_license_dir, lic)
 
                     if re.match("^generic_.*$", lic):
+                        generic_lic = re.search("^generic_(.*)$", lic).group(1)
+                        if not license_ok(bad_licenses, generic_lic):
+                            continue
+
                         if not os.path.exists(pkg_rootfs_license):
                             shutil.copyfile(pkg_license, rootfs_license)
 
                         os.symlink(os.path.join('..', lic), pkg_rootfs_license)
                     else:
+                        if not license_ok(bad_licenses, lic):
+                            continue
+
                         shutil.copyfile(pkg_license, pkg_rootfs_license)
 }
 
@@ -297,6 +317,21 @@ def canonical_license(d, license):
     """
     return d.getVarFlag('SPDXLICENSEMAP', license, True) or license
 
+def license_ok(dont_want_licenses, license):
+    import re
+    from fnmatch import fnmatchcase as fnmatch
+    for dwl in dont_want_licenses:
+        # If you want to exclude license named generically 'X', we
+        # surely want to exclude 'X+' as well.  In consequence, we
+        # will exclude a trailing '+' character from LICENSE in
+        # case INCOMPATIBLE_LICENSE is not a 'X+' license.
+        lic = license
+        if not re.search('\+$', dwl):
+            lic = re.sub('\+', '', license)
+        if fnmatch(lic, dwl):
+            return False
+    return True
+
 def incompatible_license(d, dont_want_licenses, package=None):
     """
     This function checks if a recipe has only incompatible licenses. It also
@@ -305,34 +340,21 @@ def incompatible_license(d, dont_want_licenses, package=None):
     """
     import re
     import oe.license
-    from fnmatch import fnmatchcase as fnmatch
     license = d.getVar("LICENSE_%s" % package, True) if package else None
     if not license:
         license = d.getVar('LICENSE', True)
 
-    def license_ok(license):
-        for dwl in dont_want_licenses:
-            # If you want to exclude license named generically 'X', we
-            # surely want to exclude 'X+' as well.  In consequence, we
-            # will exclude a trailing '+' character from LICENSE in
-            # case INCOMPATIBLE_LICENSE is not a 'X+' license.
-            lic = license
-            if not re.search('\+$', dwl):
-                lic = re.sub('\+', '', license)
-            if fnmatch(lic, dwl):
-                return False
-        return True
-
     # Handles an "or" or two license sets provided by
     # flattened_licenses(), pick one that works if possible.
     def choose_lic_set(a, b):
-        return a if all(license_ok(lic) for lic in a) else b
+        return a if all(license_ok(dont_want_licenses, lic) for lic in a) else b
 
     try:
         licenses = oe.license.flattened_licenses(license, choose_lic_set)
     except oe.license.LicenseError as exc:
         bb.fatal('%s: %s' % (d.getVar('P', True), exc))
-    return any(not license_ok(canonical_license(d, l)) for l in licenses)
+    return any(not license_ok(dont_want_licenses,canonical_license(d, l))
+                for l in licenses)
 
 def check_license_flags(d):
     """
-- 
1.9.1


