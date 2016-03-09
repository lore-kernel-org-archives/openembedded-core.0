Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9276B6FEF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 04:49:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 08 Mar 2016 20:49:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,310,1455004800"; d="scan'208";a="929876800"
Received: from mlim-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.14])
	by orsmga002.jf.intel.com with ESMTP; 08 Mar 2016 20:49:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:48:52 +1300
Message-Id: <e2aed04da16046c8ad6facc71db5136dcac2bbc6.1457498464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 5/8] recipetool: create: split npm module dependencies into packages
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
X-List-Received-Date: Wed, 09 Mar 2016 04:49:51 -0000

Rather than rolling all of an npm module's dependencies into the same
package, split them into one module per package, setting the SUMMARY and
PKGV values from the package.json file for each package. Additionally,
mark each package with the appropriate license using the license
scanning we already do, falling back to the license stated in the
package.json file for the module if unknown. All of this is mostly in
aid of ensuring all modules and their licenses now show up in the
manifests for the image.

Additionally we set the main LICENSE value more concretely once we've
calculated the per-package licenses, since we have more information at
that point.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/npm.bbclass             | 20 +++++++++++++
 meta/lib/oe/package.py               | 32 ++++++++++++++++++++
 scripts/lib/recipetool/create.py     | 28 ++++++++++++++++++
 scripts/lib/recipetool/create_npm.py | 57 ++++++++++++++++++++++++++++++++++--
 4 files changed, 134 insertions(+), 3 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index be76056..b5db99d 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -18,6 +18,26 @@ npm_do_install() {
 	cp -a ${S}/* ${D}${libdir}/node_modules/${PN}/ --no-preserve=ownership
 }
 
+python populate_packages_prepend () {
+    instdir = d.expand('${D}${libdir}/node_modules/${PN}')
+    extrapackages = oe.package.npm_split_package_dirs(instdir)
+    pkgnames = extrapackages.keys()
+    d.prependVar('PACKAGES', '%s ' % ' '.join(pkgnames))
+    for pkgname in pkgnames:
+        pkgrelpath, pdata = extrapackages[pkgname]
+        pkgpath = '${libdir}/node_modules/${PN}/' + pkgrelpath
+        expanded_pkgname = d.expand(pkgname)
+        d.setVar('FILES_%s' % expanded_pkgname, pkgpath)
+        if pdata:
+            version = pdata.get('version', None)
+            if version:
+                d.setVar('PKGV_%s' % expanded_pkgname, version.encode("utf8"))
+            description = pdata.get('description', None)
+            if description:
+                d.setVar('SUMMARY_%s' % expanded_pkgname, description.replace(u"\u2018", "'").replace(u"\u2019", "'").encode("utf8"))
+    d.appendVar('RDEPENDS_%s' % d.getVar('PN', True), ' %s' % ' '.join(pkgnames))
+}
+
 FILES_${PN} += " \
     ${libdir}/node_modules/${PN} \
 "
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index f176446..dea443d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -123,3 +123,35 @@ def read_shlib_providers(d):
                         shlib_provider[s[0]] = {}
                     shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
     return shlib_provider
+
+
+def npm_split_package_dirs(pkgdir):
+    """
+    Work out the packages fetched and unpacked by BitBake's npm fetcher
+    Returns a dict of packagename -> (relpath, package.json) ordered
+    such that it is suitable for use in PACKAGES and FILES
+    """
+    from collections import OrderedDict
+    import json
+    packages = {}
+    for root, dirs, files in os.walk(pkgdir):
+        if os.path.basename(root) == 'node_modules':
+            for dn in dirs:
+                relpth = os.path.relpath(os.path.join(root, dn), pkgdir)
+                pkgitems = ['${PN}']
+                for pathitem in relpth.split('/'):
+                    if pathitem == 'node_modules':
+                        continue
+                    pkgitems.append(pathitem)
+                pkgname = '-'.join(pkgitems)
+                pkgfile = os.path.join(root, dn, 'package.json')
+                data = None
+                if os.path.exists(pkgfile):
+                    with open(pkgfile, 'r') as f:
+                        data = json.loads(f.read())
+                packages[pkgname] = (relpth, data)
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
index 0e33cc9..4bf6cae 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -17,20 +17,37 @@
 
 import logging
 import json
-from recipetool.create import RecipeHandler
+from recipetool.create import RecipeHandler, split_pkg_licenses
 
 logger = logging.getLogger('recipetool')
 
 
 class NpmRecipeHandler(RecipeHandler):
+    def _handle_license(self, data):
+        '''
+        Handle the license value from an npm package.json file
+        '''
+        license = None
+        if 'license' in data:
+            license = data['license']
+            if isinstance(license, dict):
+                license = license.get('type', None)
+        return None
+
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        import oe
+        from collections import OrderedDict
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
@@ -40,6 +57,40 @@ class NpmRecipeHandler(RecipeHandler):
                     lines_before.append('SUMMARY = "%s"' % data['description'])
                 if 'homepage' in data:
                     lines_before.append('HOMEPAGE = "%s"' % data['homepage'])
+
+                # Split each npm module out to is own package
+                npmpackages = oe.package.npm_split_package_dirs(srctree)
+                for item in handled:
+                    if isinstance(item, tuple):
+                        if item[0] == 'license':
+                            licvalues = item[1]
+                            break
+                if licvalues:
+                    # Augment the license list with information we have in the packages
+                    licenses = {}
+                    license = self._handle_license(data)
+                    if license:
+                        licenses['${PN}'] = license
+                    for pkgname, pkgitem in npmpackages.iteritems():
+                        _, pdata = pkgitem
+                        license = self._handle_license(pdata)
+                        if license:
+                            licenses[pkgname] = license
+                    # Now write out the package-specific license values
+                    # We need to strip out the json data dicts for this since split_pkg_licenses
+                    # isn't expecting it
+                    packages = OrderedDict((x,y[0]) for x,y in npmpackages.iteritems())
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


