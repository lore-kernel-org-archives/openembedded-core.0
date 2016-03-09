Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 295E96FEF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 04:49:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 08 Mar 2016 20:49:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,310,1455004800"; d="scan'208";a="929876823"
Received: from mlim-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.143.14])
	by orsmga002.jf.intel.com with ESMTP; 08 Mar 2016 20:49:43 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:48:55 +1300
Message-Id: <672b983ba93bef3b2381ae3eafe28f39bc8bc9cd.1457498464.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457498464.git.paul.eggleton@linux.intel.com>
References: <cover.1457498464.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 8/8] recipetool: create: shrinkwrap and lockdown npm modules
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
X-List-Received-Date: Wed, 09 Mar 2016 04:49:52 -0000

"npm shrinkwrap" creates a file that ensures that the exact same
versions get fetched the next time the recipe is built. lockdown is
similar but also includes sha1sums of the modules thus validating they
haven't changed between builds. These ensure that the build is
reproducible.

Fixes [YOCTO #9225].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_npm.py | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 4bf6cae..b3ffcdb 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -15,14 +15,27 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
+import os
 import logging
+import subprocess
+import tempfile
+import shutil
 import json
 from recipetool.create import RecipeHandler, split_pkg_licenses
 
 logger = logging.getLogger('recipetool')
 
 
+tinfoil = None
+
+def tinfoil_init(instance):
+    global tinfoil
+    tinfoil = instance
+
+
 class NpmRecipeHandler(RecipeHandler):
+    lockdownpath = None
+
     def _handle_license(self, data):
         '''
         Handle the license value from an npm package.json file
@@ -34,7 +47,44 @@ class NpmRecipeHandler(RecipeHandler):
                 license = license.get('type', None)
         return None
 
+    def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_before):
+        try:
+            runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH', True))
+            bb.process.run('npm shrinkwrap', cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
+        except bb.process.ExecutionError as e:
+            logger.warn('npm shrinkwrap failed:\n%s' % e.stdout)
+            return
+
+        tmpfile = os.path.join(localfilesdir, 'npm-shrinkwrap.json')
+        shutil.move(os.path.join(srctree, 'npm-shrinkwrap.json'), tmpfile)
+        extravalues.setdefault('extrafiles', {})
+        extravalues['extrafiles']['npm-shrinkwrap.json'] = tmpfile
+        lines_before.append('NPM_SHRINKWRAP := "${THISDIR}/${PN}/npm-shrinkwrap.json"')
+
+    def _lockdown(self, srctree, localfilesdir, extravalues, lines_before):
+        runenv = dict(os.environ, PATH=tinfoil.config_data.getVar('PATH', True))
+        if not NpmRecipeHandler.lockdownpath:
+            NpmRecipeHandler.lockdownpath = tempfile.mkdtemp('recipetool-npm-lockdown')
+            bb.process.run('npm install lockdown --prefix %s' % NpmRecipeHandler.lockdownpath,
+                           cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
+        relockbin = os.path.join(NpmRecipeHandler.lockdownpath, 'node_modules', 'lockdown', 'relock.js')
+        if not os.path.exists(relockbin):
+            logger.warn('Could not find relock.js within lockdown directory; skipping lockdown')
+            return
+        try:
+            bb.process.run('node %s' % relockbin, cwd=srctree, stderr=subprocess.STDOUT, env=runenv, shell=True)
+        except bb.process.ExecutionError as e:
+            logger.warn('lockdown-relock failed:\n%s' % e.stdout)
+            return
+
+        tmpfile = os.path.join(localfilesdir, 'lockdown.json')
+        shutil.move(os.path.join(srctree, 'lockdown.json'), tmpfile)
+        extravalues.setdefault('extrafiles', {})
+        extravalues['extrafiles']['lockdown.json'] = tmpfile
+        lines_before.append('NPM_LOCKDOWN := "${THISDIR}/${PN}/lockdown.json"')
+
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
+        import bb.utils
         import oe
         from collections import OrderedDict
 
@@ -58,6 +108,13 @@ class NpmRecipeHandler(RecipeHandler):
                 if 'homepage' in data:
                     lines_before.append('HOMEPAGE = "%s"' % data['homepage'])
 
+                # Shrinkwrap
+                localfilesdir = tempfile.mkdtemp(prefix='recipetool-npm')
+                self._shrinkwrap(srctree, localfilesdir, extravalues, lines_before)
+
+                # Lockdown
+                self._lockdown(srctree, localfilesdir, extravalues, lines_before)
+
                 # Split each npm module out to is own package
                 npmpackages = oe.package.npm_split_package_dirs(srctree)
                 for item in handled:
-- 
2.5.0


