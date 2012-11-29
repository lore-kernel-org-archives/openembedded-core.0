Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Te9iW-0007SY-DA
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 20:24:13 +0100
Received: from mail-pb0-f69.google.com ([209.85.160.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 29 Nov 2012 11:08:11 -0800
Received: by mail-pb0-f69.google.com with SMTP id un15so20971018pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 11:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=2Db8bnRXgBCsC41V4cnYyyx30PC85hUFgDFg1bP0LAY=;
	b=efFFYuOr6S6d871nPmfwXTpAVJ1ljVcf7czEOL7MY7ZK/JUSql8ECb2zENOKPlfJvF
	SYHZfp4GqT9xI16q2q06C1v4qcBiFdn4Jr3QAKHhz96a+LoStAKb6cY6nRHjLb34Etwb
	/YGpnIxlew+tBwcy4hylq0W126OFrLIJ06MWM7686NcbMb121OgEBJzFyW7R1G8A/faP
	Gjb3u7SbTs4ALY7gBgng6KK2eWNN15+HMQARsUH/o8sFy2UB3Jx347A1G4TN8AEKu1a7
	A/wj96k3+WhIjX3DvCaOBORDKXxHrQmeKKIQMbCbpO2Gbw1WeCbMS5s4+vDeE+V8QK5+
	3pGA==
Received: by 10.66.73.132 with SMTP id l4mr64190972pav.48.1354216134581;
	Thu, 29 Nov 2012 11:08:54 -0800 (PST)
Received: by 10.66.73.132 with SMTP id l4mr64190966pav.48.1354216134511;
	Thu, 29 Nov 2012 11:08:54 -0800 (PST)
Received: from avartita.hsd1.or.comcast.net.
	(c-71-236-152-235.hsd1.or.comcast.net. [71.236.152.235])
	by mx.google.com with ESMTPS id nv2sm1638041pbc.44.2012.11.29.11.08.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Nov 2012 11:08:53 -0800 (PST)
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2012 11:08:47 -0800
Message-Id: <037305f0450c08ec555f5588ad6f3600d2d4a2c8.1354208369.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354208369.git.elizabeth.flanagan@intel.com>
References: <cover.1354208369.git.elizabeth.flanagan@intel.com>
X-Gm-Message-State: ALoCoQkgLj5TVQSHqdfYqXi7KZJGY1pmlwX/adbcYxvL454V9NojbIWl8GGth/AAdeSrsqkgohzuCWxZ7CvBTNAKmlDCYyYOS6AApgIzcq1y4QshdcJD/NghgqVCcikhZv6VjhVyo4D5mORHrxZxbVdrGK6U44mBjQM7w7XTUGXenmuZ9AnW75vIb0u/9BxuC4qy/pAXBsuS
Subject: [PATCH 1/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2012 19:24:13 -0000

From: Andy Ross <andy.ross@windriver.com>

Allow INCOMPATIBLE_LICENSE to be a whitespace-separated list of
incompatible license strings and/or glob patterns.

Also fix wildcarding: the string in INCOMPATIBLE_LICENSE was clearly
intended to match with wildcards (e.g. "*GPLv3" to match both GPLv3
and LGPLv3), but this was broken because of a bug in return_spdx()
which would die with a runtime error when there was no SPDXLICENSEMAP
entry for the string.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/base.bbclass    |   67 ++++++++++++++++++++--------------------
 meta/classes/license.bbclass |   70 ++++++++++++++++--------------------------
 2 files changed, 59 insertions(+), 78 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0ee9d2e..4fc0559 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -524,43 +524,42 @@ python () {
                     raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % this_machine)
 
 
-        dont_want_license = d.getVar('INCOMPATIBLE_LICENSE', True)
-
-        if dont_want_license and not pn.endswith("-native") and not pn.endswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and not pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and not pn.endswith("-cross-canadian-%s" % d.getVar('TRANSLATED_TARGET_ARCH', True)) and not pn.startswith("nativesdk-"):
-        # Internally, we'll use the license mapping. This way INCOMPATIBLE_LICENSE = "GPLv2" and
-        # INCOMPATIBLE_LICENSE = "GPLv2.0" will pick up all variations of GPL-2.0
-            spdx_license = return_spdx(d, dont_want_license)
-            hosttools_whitelist = (d.getVar('HOSTTOOLS_WHITELIST_%s' % dont_want_license, True) or d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split()
-            lgplv2_whitelist = (d.getVar('LGPLv2_WHITELIST_%s' % dont_want_license, True) or d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split()
-            dont_want_whitelist = (d.getVar('WHITELIST_%s' % dont_want_license, True) or d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split()
-            if pn not in hosttools_whitelist and pn not in lgplv2_whitelist and pn not in dont_want_whitelist:
-                this_license = d.getVar('LICENSE', True)
-                # At this point we know the recipe contains an INCOMPATIBLE_LICENSE, however it may contain packages that do not.
-                packages = d.getVar('PACKAGES', True).split()
-                dont_skip_recipe = False
-                skipped_packages = {}
-                unskipped_packages = []
-                for pkg in packages:
-                    if incompatible_license(d, dont_want_license, pkg):
-                            skipped_packages[pkg] = this_license
-                            dont_skip_recipe = True
+        bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
+
+        check_license = True
+        for t in ["-native", "-cross", "-cross-initial", "-cross-intermediate", "-crosssdk-intermediate", "-crosssdk", "-crosssdk-initial", "-nativesdk"]:
+            if pn.endswith(t):
+                check_license = False
+
+        if check_license and bad_licenses:
+            whitelist = []
+            for lic in bad_licenses:
+                for w in ["HOSTTOOLS_WHITELIST_", "LGPLv2_WHITELIST_", "WHITELIST_"]:
+                    whitelist.extend((d.getVar(w + lic, True) or "").split())
+                spdx_license = return_spdx(d, lic)
+                if spdx_license:
+                    whitelist.extend((d.getVar('HOSTTOOLS_WHITELIST_%s' % spdx_license, True) or "").split())
+            if not pn in whitelist:
+                recipe_license = d.getVar('LICENSE', True)
+                pkgs = d.getVar('PACKAGES', True).split()
+                skipped_pkgs = []
+                unskipped_pkgs = []
+                for pkg in pkgs:
+                    if incompatible_license(d, bad_licenses, pkg):
+                        skipped_pkgs.append(pkg)
                     else:
-                        unskipped_packages.append(pkg)
-                if not unskipped_packages:
-                    # if we hit here and have excluded all packages, then we can just exclude the recipe
-                    dont_skip_recipe = False
-                elif skipped_packages and unskipped_packages:
-                    for pkg, license in skipped_packages.iteritems():
-                        bb.note("SKIPPING the package " + pkg + " at do_rootfs because it's " + this_license)
+                        unskipped_pkgs.append(pkg)
+                some_skipped = skipped_pkgs and unskipped_pkgs
+                all_skipped = skipped_pkgs and not unskipped_pkgs
+                if some_skipped:
+                    for pkg in skipped_pkgs:
+                        bb.note("SKIPPING the package " + pkg + " at do_rootfs because it's " + recipe_license)
                         d.setVar('LICENSE_EXCLUSION-' + pkg, 1)
-                    for index, pkg in enumerate(unskipped_packages):
+                    for pkg in unskipped_pkgs:
                         bb.note("INCLUDING the package " + pkg)
-
-                if dont_skip_recipe is False and incompatible_license(d, dont_want_license):
-                    bb.note("SKIPPING recipe %s because it's %s" % (pn, this_license))
-                    raise bb.parse.SkipPackage("incompatible with license %s" % this_license)
-
-
+                elif all_skipped or incompatible_license(d, bad_licenses):
+                    bb.note("SKIPPING recipe %s because it's %s" % (pn, recipe_license))
+                    raise bb.parse.SkipPackage("incompatible with license %s" % recipe_license)
 
     srcuri = d.getVar('SRC_URI', True)
     # Svn packages should DEPEND on subversion-native
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c7ca4a6..9205cde 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -207,14 +207,11 @@ python do_populate_lic() {
 
 def return_spdx(d, license):
     """
-    This function returns the spdx mapping of a license.
-    """
-    if d.getVarFlag('SPDXLICENSEMAP', license) != None:
-        return license
-    else:
-        return d.getVarFlag('SPDXLICENSEMAP', license_type)
-
-def incompatible_license(d, dont_want_license, package=""):
+    This function returns the spdx mapping of a license if it exists.
+     """
+    return d.getVarFlag('SPDXLICENSEMAP', license, True)
+ 
+def incompatible_license(d, dont_want_licenses, package=None):
     """
     This function checks if a recipe has only incompatible licenses. It also take into consideration 'or'
     operand.
@@ -223,45 +220,30 @@ def incompatible_license(d, dont_want_license, package=""):
     import oe.license
     from fnmatch import fnmatchcase as fnmatch
     pn = d.getVar('PN', True)
-    dont_want_licenses = []
-    dont_want_licenses.append(d.getVar('INCOMPATIBLE_LICENSE', True))
-    recipe_license = d.getVar('LICENSE', True)
-    if package != "":
-        if d.getVar('LICENSE_' + pn + '-' + package, True):
-            license = d.getVar('LICENSE_' + pn + '-' + package, True)
-        else:
-            license = recipe_license
-    else:
-        license = recipe_license
-    spdx_license = return_spdx(d, dont_want_license)
-    dont_want_licenses.append(spdx_license)
-
-    def include_license(license):
-        if any(fnmatch(license, pattern) for pattern in dont_want_licenses):
+    license = d.getVar("LICENSE_%s-%s" % (pn, package), True) if package else None
+    if not license:
+        license = d.getVar('LICENSE', True)
+
+    def license_ok(license):
+        for dwl in dont_want_licenses:
+            # If you want to exclude license named generically 'X', we
+            # surely want to exclude 'X+' as well.  In consequence, we
+            # will exclude a trailing '+' character from LICENSE in
+            # case INCOMPATIBLE_LICENSE is not a 'X+' license.
+            lic = license
+        if not re.search('\+$', dwl):
+            lic = re.sub('\+', '', license)
+        if fnmatch(lic, dwl):
             return False
-        else:
-            return True
+        return True
 
-    def choose_licenses(a, b):
-        if all(include_license(lic) for lic in a):
-            return a
-        else:
-            return b
+    # Handles an "or" or two license sets provided by
+    # flattened_licenses(), pick one that works if possible.
+    def choose_lic_set(a, b):
+        return a if all(license_ok(lic) for lic in a) else b
 
-    """
-    If you want to exlude license named generically 'X', we surely want to exlude 'X+' as well.
-    In consequence, we will exclude the '+' character from LICENSE in case INCOMPATIBLE_LICENSE
-    is not a 'X+' license.
-    """
-    if not re.search(r'[+]',dont_want_license):
-        licenses=oe.license.flattened_licenses(re.sub(r'[+]', '', license), choose_licenses)
-    else:
-        licenses=oe.license.flattened_licenses(license, choose_licenses)
-
-    for onelicense in licenses:
-        if not include_license(onelicense):
-            return True
-    return False
+    licenses=oe.license.flattened_licenses(license, choose_lic_set)
+    return any(not license_ok(l) for l in licenses)
 
 def check_license_flags(d):
     """
-- 
1.7.9.5



