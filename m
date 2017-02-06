Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 674016093C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:45:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 12:45:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,342,1477983600"; d="scan'208";a="817761513"
Received: from mmurr6x-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.252.199.82])
	by FMSMGA003.fm.intel.com with ESMTP; 06 Feb 2017 12:45:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2017 09:45:41 +1300
Message-Id: <5d1f23f2205be024f43facc76f69ad0a9b2bb154.1486413875.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1486413875.git.paul.eggleton@linux.intel.com>
References: <cover.1486413875.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] recipetool: create: properly handle npm optional dependencies
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
X-List-Received-Date: Mon, 06 Feb 2017 20:45:49 -0000

npm's package.json supports two types of dependencies -
optionalDependencies and dependencies; in the code for creating a recipe
from a non-npm source (e.g. a git repository) we were not handling
optionalDependencies and thus when pointed at a node.js application
outside of npm we weren't taking care of all dependencies.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_npm.py | 56 +++++++++++++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 888aa2b..3ba6de0 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -83,7 +83,7 @@ class NpmRecipeHandler(RecipeHandler):
         extravalues['extrafiles']['lockdown.json'] = tmpfile
         lines_before.append('NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"')
 
-    def _handle_dependencies(self, d, deps, lines_before, srctree):
+    def _handle_dependencies(self, d, deps, optdeps, lines_before, srctree):
         import scriptutils
         # If this isn't a single module we need to get the dependencies
         # and add them to SRC_URI
@@ -92,8 +92,17 @@ class NpmRecipeHandler(RecipeHandler):
                 if not origvalue.startswith('npm://'):
                     src_uri = origvalue.split()
                     changed = False
-                    for dep, depdata in deps.items():
-                        version = self.get_node_version(dep, depdata, d)
+                    deplist = {}
+                    for dep, depver in optdeps.items():
+                        depdata = self.get_npm_data(dep, depver, d)
+                        if self.check_npm_optional_dependency(depdata):
+                            deplist[dep] = depdata
+                    for dep, depver in deps.items():
+                        depdata = self.get_npm_data(dep, depver, d)
+                        deplist[dep] = depdata
+
+                    for dep, depdata in deplist.items():
+                        version = depdata.get('version', None)
                         if version:
                             url = 'npm://registry.npmjs.org;name=%s;version=%s;subdir=node_modules/%s' % (dep, version, dep)
                             scriptutils.fetch_uri(d, url, srctree)
@@ -170,8 +179,8 @@ class NpmRecipeHandler(RecipeHandler):
                 if 'homepage' in data:
                     extravalues['HOMEPAGE'] = data['homepage']
 
-                deps = data.get('dependencies', {})
-                updated = self._handle_dependencies(tinfoil.config_data, deps, lines_before, srctree)
+                deps, optdeps = self.get_npm_package_dependencies(data)
+                updated = self._handle_dependencies(tinfoil.config_data, deps, optdeps, lines_before, srctree)
                 if updated:
                     # We need to redo the license stuff
                     self._replace_license_vars(srctree, lines_before, handled, extravalues, tinfoil.config_data)
@@ -251,7 +260,7 @@ class NpmRecipeHandler(RecipeHandler):
 
     # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
     # (split out from _getdependencies())
-    def get_node_version(self, pkg, version, d):
+    def get_npm_data(self, pkg, version, d):
         import bb.fetch2
         pkgfullname = pkg
         if version != '*' and not '/' in version:
@@ -261,7 +270,40 @@ class NpmRecipeHandler(RecipeHandler):
         fetchcmd = "npm view %s --json" % pkgfullname
         output, _ = bb.process.run(fetchcmd, stderr=subprocess.STDOUT, env=runenv, shell=True)
         data = self._parse_view(output)
-        return data.get('version', None)
+        return data
+
+    # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
+    # (split out from _getdependencies())
+    def get_npm_package_dependencies(self, pdata):
+        dependencies = pdata.get('dependencies', {})
+        optionalDependencies = pdata.get('optionalDependencies', {})
+        dependencies.update(optionalDependencies)
+        depsfound = {}
+        optdepsfound = {}
+        for dep in dependencies:
+            if dep in optionalDependencies:
+                optdepsfound[dep] = dependencies[dep]
+            else:
+                depsfound[dep] = dependencies[dep]
+        return depsfound, optdepsfound
+
+    # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
+    # (split out from _getdependencies())
+    def check_npm_optional_dependency(self, pdata):
+        pkg_os = pdata.get('os', None)
+        if pkg_os:
+            if not isinstance(pkg_os, list):
+                pkg_os = [pkg_os]
+            blacklist = False
+            for item in pkg_os:
+                if item.startswith('!'):
+                    blacklist = True
+                    break
+            if (not blacklist and 'linux' not in pkg_os) or '!linux' in pkg_os:
+                logger.debug(2, "Skipping %s since it's incompatible with Linux" % pkg)
+                return False
+        return True
+
 
 def register_recipe_handlers(handlers):
     handlers.append((NpmRecipeHandler(), 60))
-- 
2.9.3


