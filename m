Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2EECF6FFFB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 05:36:49 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 07 Mar 2016 21:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,555,1449561600"; d="scan'208";a="919077684"
Received: from jlee45-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.164.131])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2016 21:36:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 18:36:04 +1300
Message-Id: <d2ce2cd9949a5943435de76bd87a0d333d586f9f.1457415260.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457415260.git.paul.eggleton@linux.intel.com>
References: <cover.1457415260.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/6] recipetool: create: split npm module dependencies into packages
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
X-List-Received-Date: Tue, 08 Mar 2016 05:36:49 -0000

Rather than rolling all of an npm module's dependencies into the same
package, split them into one module per package. Additionally, mark each
package with the appropriate license using the license scanning we
already do, falling back to the license stated in the package.json file
for the module if unknown. This means that the modules and their
licenses can now show up in the manifests for the image.

Additionally we set the main LICENSE value more concretely once we've
calculated the per-package licenses, since we have more information at
that point.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/npm.bbclass             | 12 +++++++++++
 meta/lib/oe/package.py               | 24 +++++++++++++++++++++
 scripts/lib/recipetool/create.py     | 28 ++++++++++++++++++++++++
 scripts/lib/recipetool/create_npm.py | 42 +++++++++++++++++++++++++++++++++---
 4 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index be76056..e7f2212 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -18,6 +18,18 @@ npm_do_install() {
 	cp -a ${S}/* ${D}${libdir}/node_modules/${PN}/ --no-preserve=ownership
 }
 
+python populate_packages_prepend () {
+    instdir = d.expand('${D}${libdir}/node_modules/${PN}')
+    extrapackages = oe.package.npm_split_package_dirs(instdir)
+    pkgnames = extrapackages.keys()
+    d.prependVar('PACKAGES', '%s ' % ' '.join(pkgnames))
+    for pkgname in pkgnames:
+        pkgpath = '${libdir}/node_modules/${PN}/' + extrapackages[pkgname]
+        expanded_pkgname = d.expand(pkgname)
+        d.setVar('FILES_%s' % expanded_pkgname, pkgpath)
+    d.appendVar('RDEPENDS_%s' % d.getVar('PN', True), ' %s' % ' '.join(pkgnames))
+}
+
 FILES_${PN} += " \
     ${libdir}/node_modules/${PN} \
 "
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index f176446..7747c5c 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -123,3 +123,27 @@ def read_shlib_providers(d):
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
     return shlib_provider
+
+
+def npm_split_package_dirs(pkgdir):
+    """
+    Work out the packages fetched and unpacked by BitBake's npm fetcher
+    """
+    from collections import OrderedDict
+    packages = {}
+    for root, dirs, files in os.walk(pkgdir):
+        if os.path.basename(root) == 'node_modules':
+            for d in dirs:
+                relpth = os.path.relpath(os.path.join(root, d), pkgdir)
+                pkgitems = ['${PN}']
+                for pathitem in relpth.split('/'):
+                    if pathitem == 'node_modules':
+                        continue
+                    pkgitems.append(pathitem)
+                pkgname = '-'.join(pkgitems)
+                packages[pkgname] = relpth
+    # We want the main package for a module sorted *after* its subpackages
+    # (so that it doesn't otherwise steal the files for the subpackage), so
+    # this is a cheap way to do that whilst still having an otherwise
+    # alphabetical sort
+    return OrderedDict((key, packages[key]) for key in sorted(packages, key=lambda pkg: pkg + '~'))
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 718f2aa..43c0784 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -544,6 +544,7 @@ def create_recipe(args):
 
     # Apply the handlers
     handled = []
+    handled.append(('license', licvalues))
 
     if args.binary:
         classes.append('bin_package')
@@ -815,6 +816,33 @@ def guess_license(srctree):
 
     return licenses
 
+def split_pkg_licenses(licvalues, packages, outlines, fallback_licenses=None, pn='${PN}'):
+    """
+    Given a list of (license, path, md5sum) as returned by guess_license(),
+    a dict of package name to path mappings, write out a set of
+    package-specific LICENSE values.
+    """
+    pkglicenses = {pn: []}
+    for license, licpath, _ in licvalues:
+        for pkgname, pkgpath in packages.iteritems():
+            if licpath.startswith(pkgpath + '/'):
+                if pkgname in pkglicenses:
+                    pkglicenses[pkgname].append(license)
+                else:
+                    pkglicenses[pkgname] = [license]
+                break
+        else:
+            # Accumulate on the main package
+            pkglicenses[pn].append(license)
+    outlicenses = {}
+    for pkgname in packages:
+        license = ' '.join(list(set(pkglicenses.get(pkgname, ['Unknown']))))
+        if license == 'Unknown' and pkgname in fallback_licenses:
+            license = fallback_licenses[pkgname]
+        outlines.append('LICENSE_%s = "%s"' % (pkgname, license))
+        outlicenses[pkgname] = license.split()
+    return outlicenses
+
 def read_pkgconfig_provides(d):
     pkgdatadir = d.getVar('PKGDATA_DIR', True)
     pkgmap = {}
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 0e33cc9..9e18a22 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -17,20 +17,25 @@
 
 import logging
 import json
-from recipetool.create import RecipeHandler
+from recipetool.create import RecipeHandler, split_pkg_licenses
 
 logger = logging.getLogger('recipetool')
 
 
 class NpmRecipeHandler(RecipeHandler):
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        import oe
+
         if 'buildsystem' in handled:
             return False
 
+        def read_package_json(fn):
+            with open(fn, 'r') as f:
+                return json.loads(f.read())
+
         files = RecipeHandler.checkfiles(srctree, ['package.json'])
         if files:
-            with open(files[0], 'r') as f:
-                data = json.loads(f.read())
+            data = read_package_json(files[0])
             if 'name' in data and 'version' in data:
                 extravalues['PN'] = data['name']
                 extravalues['PV'] = data['version']
@@ -40,6 +45,37 @@ class NpmRecipeHandler(RecipeHandler):
                     lines_before.append('SUMMARY = "%s"' % data['description'])
                 if 'homepage' in data:
                     lines_before.append('HOMEPAGE = "%s"' % data['homepage'])
+
+                # Split each npm module out to is own package
+                packages = oe.package.npm_split_package_dirs(srctree)
+                for item in handled:
+                    if isinstance(item, tuple):
+                        if item[0] == 'license':
+                            licvalues = item[1]
+                            break
+                if licvalues:
+                    # Augment the license list with information we have in the packages
+                    licenses = {}
+                    if 'license' in data:
+                        licenses['${PN}'] = data['license']
+                    for pkgname, pkgpath in packages.iteritems():
+                        pkgfn = os.path.join(srctree, pkgpath, 'package.json')
+                        if os.path.exists(pkgfn):
+                            pdata = read_package_json(pkgfn)
+                            if 'license' in pdata:
+                                licenses[pkgname] = pdata['license']
+                    # Now write out the package-specific license values
+                    packages['${PN}'] = ''
+                    pkglicenses = split_pkg_licenses(licvalues, packages, lines_after, licenses)
+                    all_licenses = list(set([item for pkglicense in pkglicenses.values() for item in pkglicense]))
+                    # Go back and update the LICENSE value since we have a bit more
+                    # information than when that was written out (and we know all apply
+                    # vs. there being a choice, so we can join them with &)
+                    for i, line in enumerate(lines_before):
+                        if line.startswith('LICENSE = '):
+                            lines_before[i] = 'LICENSE = "%s"' % ' & '.join(all_licenses)
+                            break
+
                 return True
 
         return False
-- 
2.5.0


