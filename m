Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D78F27753E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 10:04:26 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 03:04:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5042810"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 03:04:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 22:03:29 +1200
Message-Id: <7a06628afd346f5f643fcb3a561fdac6befc231e.1473155977.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473155977.git.paul.eggleton@linux.intel.com>
References: <cover.1473155977.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/9] recipetool: create: support node.js code outside of npm
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
X-List-Received-Date: Tue, 06 Sep 2016 10:04:27 -0000

If you have your own node.js application you may not publish it (or at
least not immediately) in an npm registry - it might just be in a
repository on github or on your local machine. Add support to recipetool
create for creating recipes to build such applications - extract their
dependencies, fetch them, and add corresponding npm:// URLs to SRC_URI,
and ensure that LICENSE / LIC_FILES_CHKSUM are updated to match. For
example, you can now run:

  recipetool create https://github.com/diversario/node-ssdp

(I had to borrow some code from bitbake/lib/bb/fetch2/npm.py to
implement this functionality; this should be refactored out but now
isn't the time to do that refactoring.)

Part of the fix for [YOCTO #9537].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/npm.bbclass             |   4 ++
 scripts/lib/recipetool/create_npm.py | 111 ++++++++++++++++++++++++++++++++++-
 2 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 55c7c3e..fce4c11 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -16,6 +16,10 @@ def npm_oe_arch_map(target_arch, d):
 NPM_ARCH ?= "${@npm_oe_arch_map(d.getVar('TARGET_ARCH', True), d)}"
 
 npm_do_compile() {
+	# Copy in any additionally fetched modules
+	if [ -d ${WORKDIR}/node_modules ] ; then
+		cp -a ${WORKDIR}/node_modules ${S}/
+	fi
 	# changing the home directory to the working directory, the .npmrc will
 	# be created in this directory
 	export HOME=${WORKDIR}
diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index e5aaa60..e794614 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -21,7 +21,7 @@ import subprocess
 import tempfile
 import shutil
 import json
-from recipetool.create import RecipeHandler, split_pkg_licenses
+from recipetool.create import RecipeHandler, split_pkg_licenses, handle_license_vars
 
 logger = logging.getLogger('recipetool')
 
@@ -83,6 +83,66 @@ class NpmRecipeHandler(RecipeHandler):
         extravalues['extrafiles']['lockdown.json'] = tmpfile
         lines_before.append('NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"')
 
+    def _handle_dependencies(self, d, deps, lines_before, srctree):
+        import scriptutils
+        # If this isn't a single module we need to get the dependencies
+        # and add them to SRC_URI
+        def varfunc(varname, origvalue, op, newlines):
+            if varname == 'SRC_URI':
+                if not origvalue.startswith('npm://'):
+                    src_uri = origvalue.split()
+                    changed = False
+                    for dep, depdata in deps.items():
+                        version = self.get_node_version(dep, depdata, d)
+                        if version:
+                            url = 'npm://registry.npmjs.org;name=%s;version=%s;subdir=node_modules/%s' % (dep, version, dep)
+                            scriptutils.fetch_uri(d, url, srctree)
+                            src_uri.append(url)
+                            changed = True
+                    if changed:
+                        return src_uri, None, -1, True
+            return origvalue, None, 0, True
+        updated, newlines = bb.utils.edit_metadata(lines_before, ['SRC_URI'], varfunc)
+        if updated:
+            del lines_before[:]
+            for line in newlines:
+                # Hack to avoid newlines that edit_metadata inserts
+                if line.endswith('\n'):
+                    line = line[:-1]
+                lines_before.append(line)
+        return updated
+
+    def _replace_license_vars(self, srctree, lines_before, handled, extravalues, d):
+        for item in handled:
+            if isinstance(item, tuple):
+                if item[0] == 'license':
+                    del item
+                    break
+
+        calledvars = []
+        def varfunc(varname, origvalue, op, newlines):
+            if varname in ['LICENSE', 'LIC_FILES_CHKSUM']:
+                for i, e in enumerate(reversed(newlines)):
+                    if not e.startswith('#'):
+                        stop = i
+                        while stop > 0:
+                            newlines.pop()
+                            stop -= 1
+                        break
+                calledvars.append(varname)
+                if len(calledvars) > 1:
+                    # The second time around, put the new license text in
+                    insertpos = len(newlines)
+                    handle_license_vars(srctree, newlines, handled, extravalues, d)
+                return None, None, 0, True
+            return origvalue, None, 0, True
+        updated, newlines = bb.utils.edit_metadata(lines_before, ['LICENSE', 'LIC_FILES_CHKSUM'], varfunc)
+        if updated:
+            del lines_before[:]
+            lines_before.extend(newlines)
+        else:
+            raise Exception('Did not find license variables')
+
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         import bb.utils
         import oe
@@ -108,6 +168,12 @@ class NpmRecipeHandler(RecipeHandler):
                 if 'homepage' in data:
                     extravalues['HOMEPAGE'] = data['homepage']
 
+                deps = data.get('dependencies', {})
+                updated = self._handle_dependencies(tinfoil.config_data, deps, lines_before, srctree)
+                if updated:
+                    # We need to redo the license stuff
+                    self._replace_license_vars(srctree, lines_before, handled, extravalues, tinfoil.config_data)
+
                 # Shrinkwrap
                 localfilesdir = tempfile.mkdtemp(prefix='recipetool-npm')
                 self._shrinkwrap(srctree, localfilesdir, extravalues, lines_before)
@@ -148,9 +214,52 @@ class NpmRecipeHandler(RecipeHandler):
                             lines_before[i] = 'LICENSE = "%s"' % ' & '.join(all_licenses)
                             break
 
+                # Need to move S setting after inherit npm
+                for i, line in enumerate(lines_before):
+                    if line.startswith('S ='):
+                        lines_before.pop(i)
+                        lines_after.insert(0, '# Must be set after inherit npm since that itself sets S')
+                        lines_after.insert(1, line)
+                        break
+
                 return True
 
         return False
 
+    # FIXME this is duplicated from lib/bb/fetch2/npm.py
+    def _parse_view(self, output):
+        '''
+        Parse the output of npm view --json; the last JSON result
+        is assumed to be the one that we're interested in.
+        '''
+        pdata = None
+        outdeps = {}
+        datalines = []
+        bracelevel = 0
+        for line in output.splitlines():
+            if bracelevel:
+                datalines.append(line)
+            elif '{' in line:
+                datalines = []
+                datalines.append(line)
+            bracelevel = bracelevel + line.count('{') - line.count('}')
+        if datalines:
+            pdata = json.loads('\n'.join(datalines))
+        return pdata
+
+    # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
+    # (split out from _getdependencies())
+    def get_node_version(self, pkg, version, d):
+        import bb.fetch2
+        pkgfullname = pkg
+        if version != '*' and not '/' in version:
+            pkgfullname += "@'%s'" % version
+        logger.debug(2, "Calling getdeps on %s" % pkg)
+        runenv = dict(os.environ, PATH=d.getVar('PATH', True))
+        fetchcmd = "npm view %s --json" % pkgfullname
+        output, _ = bb.process.run(fetchcmd, stderr=subprocess.STDOUT, env=runenv, shell=True)
+        data = self._parse_view(output)
+        return data.get('version', None)
+
 def register_recipe_handlers(handlers):
     handlers.append((NpmRecipeHandler(), 60))
-- 
2.5.5


