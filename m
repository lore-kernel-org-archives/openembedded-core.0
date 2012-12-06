Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TggbW-0008EA-G8
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 19:55:26 +0100
Received: from [0.0.0.0] (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 6244621336;
	Thu,  6 Dec 2012 10:41:01 -0800 (PST)
Message-ID: <50C0E6BC.2010702@windriver.com>
Date: Thu, 06 Dec 2012 10:41:00 -0800
From: Andy Ross <andy.ross@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1354208369.git.elizabeth.flanagan@intel.com>
	<037305f0450c08ec555f5588ad6f3600d2d4a2c8.1354208369.git.elizabeth.flanagan@intel.com>
	<50C02651.30201@linux.intel.com> <50C032B1.90501@windriver.com>
In-Reply-To: <50C032B1.90501@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs
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
X-List-Received-Date: Thu, 06 Dec 2012 18:55:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2012 09:52 PM, Andy Ross wrote:
> On 12/05/2012 09:00 PM, Saul Wold wrote:
>> This patch is still having problems, see the Autobuilder recently build (link below).  This is on MUT with the updated binutils, I am not sure if that is part of the problem or not, but binutils was working before.
>
> Ah, fun fun.  It's not binutils.  Something (I'm not sure what -- is
> "yocto-autobuild" a recipe?)  is pulling in the cross-canadian
> toolchain, and I had missed the appended architecture in the
> license.bbclass test.  I'll get you a fixed and tested patch tomorrow
> morning.

Take 3:

 From 2eda90739df7b2b474ef79e00563e190272051a3 Mon Sep 17 00:00:00 2001
From: Andy Ross <andy.ross@windriver.com>
Date: Thu, 29 Nov 2012 11:08:47 -0800
Subject: [PATCH] base/license.bbclass: handle multiple INCOMPATIBLE_LICENSEs

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
  meta/classes/base.bbclass    | 69 ++++++++++++++++++++++----------------------
  meta/classes/license.bbclass | 68 ++++++++++++++++---------------------------
  2 files changed, 60 insertions(+), 77 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 0ee9d2e..43794af 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -524,43 +524,44 @@ python () {
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
+        check_license = False if pn.startswith("nativesdk-") else True
+        for t in ["-native", "-cross", "-cross-initial", "-cross-intermediate",
+	          "-crosssdk-intermediate", "-crosssdk", "-crosssdk-initial",
+	          "-cross-canadian-" + d.getVar('TRANSLATED_TARGET_ARCH', True)]:
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
index 66cde1c..7783820 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -208,14 +208,11 @@ python do_populate_lic() {

  def return_spdx(d, license):
      """
-    This function returns the spdx mapping of a license.
-    """
-    if d.getVarFlag('SPDXLICENSEMAP', license) != None:
-        return license
-    else:
-        return d.getVarFlag('SPDXLICENSEMAP', license_type)
+    This function returns the spdx mapping of a license if it exists.
+     """
+    return d.getVarFlag('SPDXLICENSEMAP', license, True)

-def incompatible_license(d, dont_want_license, package=""):
+def incompatible_license(d, dont_want_licenses, package=None):
      """
      This function checks if a recipe has only incompatible licenses. It also take into consideration 'or'
      operand.
@@ -224,45 +221,30 @@ def incompatible_license(d, dont_want_license, package=""):
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
1.7.11.7



