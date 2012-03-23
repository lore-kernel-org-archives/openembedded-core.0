Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SBEQZ-0000au-FT
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 01:01:52 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 16:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144370024"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.233])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 16:51:49 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:51:42 -0700
Message-Id: <a455f24986a67550a5495cc77d7073e044c7499f.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
References: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1332546190.git.elizabeth.flanagan@intel.com>
References: <cover.1332546190.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 3/8] INCOMPATIBLE_LICENSE: support for spdx and pkg licenses
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Mar 2012 00:01:52 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

This adds a few things to the incompatible license functionality

1. INCOMPATIBLE_LICENSE was unable to distinguish any variation
within LICENSE (e.g. GPLv3 v. GPLv3.0). This now utilizes the
SPDXLICENSEMAP of the license indicated as INCOMPATIBLE_LICENSE

2. Given a recipe where the main LICENSE was incompatible but
a package of the recipe was compatible, the entire recipe would
be excluded. This allows us some finer grained control over what
exactly gets excluded.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/base.bbclass    |   40 +++++++++++++++++++++++++++++++++-------
 meta/classes/license.bbclass |   39 +++++++++++++++++++++++++--------------
 meta/classes/package.bbclass |   17 +++++++++++------
 3 files changed, 69 insertions(+), 27 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index c8ed544..ef9267a 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -389,17 +389,43 @@ python () {
 
 
         dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', True)
-        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial"):
-            hosttools_whitelist = (d.getVar('HOSTTOOLS_WHITELIST_%s' % dont_want_license, True) or "").split()
-            lgplv2_whitelist = (d.getVar('LGPLv2_WHITELIST_%s' % dont_want_license, True) or "").split()
-            dont_want_whitelist = (d.getVar('WHITELIST_%s' % dont_want_license, True) or "").split()
-            if pn not in hosttools_whitelist and pn not in lgplv2_whitelist and pn not in dont_want_whitelist:
 
+        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and not pn.endswith("-nativesdk"):
+        # Internally, we'll use the license mapping. This way INCOMPATIBLE_LICENSE = "GPLv2" and
+        # INCOMPATIBLE_LICENSE = "GPLv2.0" will pick up all variations of GPL-2.0
+            spdx_license = return_spdx(d, dont_want_license)
+            hosttools_whitelist = (d.getVar('HOSTTOOLS_WHITELIST_%s' % dont_want_license, True) or d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split()
+            lgplv2_whitelist = (d.getVar('LGPLv2_WHITELIST_%s' % dont_want_license, True) or d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split()
+            dont_want_whitelist = (d.getVar('WHITELIST_%s' % dont_want_license, True) or d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split()
+            if pn not in hosttools_whitelist and pn not in lgplv2_whitelist and pn not in dont_want_whitelist:
                 this_license = d.getVar('LICENSE', True)
-                if incompatible_license(d,dont_want_license):
-                    bb.note("SKIPPING %s because it's %s" % (pn, this_license))
+                # At this point we know the recipe contains an INCOMPATIBLE_LICENSE, however it may contain packages that do not.
+                packages = d.getVar('PACKAGES', True).split()
+                dont_skip_recipe = False
+                skipped_packages = {}
+                unskipped_packages = []
+                for pkg in packages:
+                    if incompatible_license(d, dont_want_license, pkg):
+                            skipped_packages[pkg] = this_license
+                            dont_skip_recipe = True
+                    else:
+                        unskipped_packages.append(pkg)
+                if not unskipped_packages:
+                    # if we hit here and have excluded all packages, then we can just exclude the recipe
+                    dont_skip_recipe = False
+                elif skipped_packages and unskipped_packages:
+                    for pkg, license in skipped_packages.iteritems():
+                        bb.note("SKIPPING the package " + pkg + " at do_rootfs because it's " + this_license)
+                        d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
+                    for index, pkg in enumerate(unskipped_packages):
+                        bb.note("INCLUDING the package " + pkg)
+
+                if dont_skip_recipe is False and incompatible_license(d, dont_want_license):
+                    bb.note("SKIPPING recipe %s because it's %s" % (pn, this_license))
                     raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
 
+
+
     srcuri = d.getVar('SRC_URI', True)
     # Svn packages should DEPEND on subversion-native
     if "svn://" in srcuri:
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 4b392ce..eab630e 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -81,7 +81,7 @@ license_create_manifest() {
     INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
     # list of installed packages is broken for deb
     for pkg in ${INSTALLED_PKGS}; do
-        # not the best way to do this but licenses are not arch-dependent iirc
+        # not the best way to do this but licenses are not arch dependant iirc
         files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
         for filename in $files; do
             pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
@@ -135,7 +135,6 @@ license_create_manifest() {
 
 }
 
-
 python do_populate_lic() {
     """
     Populate LICENSE_DIRECTORY with licenses.
@@ -254,27 +253,40 @@ python do_populate_lic() {
 
 }
 
-def incompatible_license(d,dont_want_license):
+def return_spdx(d, license):
+    """
+    This function returns the spdx mapping of a license.
     """
-    This function checks if a package has only incompatible licenses. It also take into consideration 'or'
+    if d.getVarFlag('SPDXLICENSEMAP', license) != None:
+        return license
+    else:
+        return d.getVarFlag('SPDXLICENSEMAP', license_type)
+
+def incompatible_license(d, dont_want_license, package=""):
+    """
+    This function checks if a recipe has only incompatible licenses. It also take into consideration 'or'
     operand.
     """
     import re
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
-
+    pn = d.getVar('PN', True)
     dont_want_licenses = []
     dont_want_licenses.append(d.getVar('INCOMPATIBLE_LICENSE', True))
-    if d.getVarFlag('SPDXLICENSEMAP', dont_want_license):
-        dont_want_licenses.append(d.getVarFlag('SPDXLICENSEMAP', dont_want_license))
+    recipe_license = d.getVar('LICENSE', True)
+    if package != "":
+        if d.getVar('LICENSE_' + pn + '-' + package, True):
+            license = d.getVar('LICENSE_' + pn + '-' + package, True)
+        else:
+            license = recipe_license
+    else:
+        license = recipe_license
+    spdx_license = return_spdx(d, dont_want_license)
+    dont_want_licenses.append(spdx_license)
 
     def include_license(license):
         if any(fnmatch(license, pattern) for pattern in dont_want_licenses):
             return False
-    else:
-        spdx_license = d.getVarFlag('SPDXLICENSEMAP', license)
-        if spdx_license and any(fnmatch(spdx_license, pattern) for pattern in dont_want_licenses):
-            return False
         else:
             return True
 
@@ -290,16 +302,15 @@ def incompatible_license(d,dont_want_license):
     is not a 'X+' license.
     """
     if not re.search(r'[+]',dont_want_license):
-        licenses=oe.license.flattened_licenses(re.sub(r'[+]', '', d.getVar('LICENSE', True)), choose_licenses)
+        licenses=oe.license.flattened_licenses(re.sub(r'[+]', '', license), choose_licenses)
     else:
-        licenses=oe.license.flattened_licenses(d.getVar('LICENSE', True), choose_licenses)
+        licenses=oe.license.flattened_licenses(license, choose_licenses)
 
     for onelicense in licenses:
         if not include_license(onelicense):
             return True
     return False
 
-
 def check_license_flags(d):
     """
     This function checks if a recipe has any LICENSE_FLAGs that
diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index bdc4d37..20af8b7 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -887,15 +887,20 @@ python populate_packages () {
 	bb.mkdirhier(outdir)
 	os.chdir(dvar)
 
-	# Sanity check PACKAGES for duplicates - should be moved to 
-	# sanity.bbclass once we have the infrastucture
+	# Sanity check PACKAGES for duplicates and for LICENSE_EXCLUSION 
+	# Sanity should be moved to sanity.bbclass once we have the infrastucture
 	package_list = []
+
 	for pkg in packages.split():
-		if pkg in package_list:
-			bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
+		if d.getVar('LICENSE_EXCLUSION-' + pkg, True):
+			bb.warn("%s has an incompatible license. Excluding from packaging." % pkg)
+			packages.remove(pkg)
 		else:
-			package_list.append(pkg)
-
+			if pkg in package_list:
+				bb.error("%s is listed in PACKAGES multiple times, this leads to packaging errors." % pkg)
+			else:
+				package_list.append(pkg)
+	d.setVar('PACKAGES', ' '.join(package_list))
 	pkgdest = d.getVar('PKGDEST', True)
 	os.system('rm -rf %s' % pkgdest)
 
-- 
1.7.1



