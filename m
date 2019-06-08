Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 1800 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 08 Jun 2019 19:52:23 UTC
Received: from 8.mo3.mail-out.ovh.net (8.mo3.mail-out.ovh.net [87.98.172.249])
	by mail.openembedded.org (Postfix) with ESMTP id 27ED57E527
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 19:52:23 +0000 (UTC)
Received: from player797.ha.ovh.net (unknown [10.108.57.53])
	by mo3.mail-out.ovh.net (Postfix) with ESMTP id C3664215DEC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 21:13:17 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player797.ha.ovh.net (Postfix) with ESMTPSA id 438106BF28A9;
	Sat,  8 Jun 2019 19:13:15 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jun 2019 21:13:03 +0200
Message-Id: <20190608191303.20583-1-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 634163125164125889
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudegkedgudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [PATCH v2] recipetool: add python3 support
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
X-List-Received-Date: Sat, 08 Jun 2019 19:52:23 -0000
Content-Transfer-Encoding: 8bit

Add support for generating python3 recipes using the recipetool / devtool.
Drop python2 support at the same time.

Tested with:

oe-selftest -r recipetool.RecipetoolTest

Fixes Bug 13264

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py    | 42 ++++++++++++++++++-
 .../lib/recipetool/create_buildsys_python.py  | 22 +++++-----
 2 files changed, 51 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index f1cb37b53f8b..e3f5c71666f3 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -435,7 +435,45 @@ class RecipetoolTests(RecipetoolBase):
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
         checkvars['SRC_URI'] = 'git://github.com/mesonbuild/meson;protocol=https'
-        inherits = ['setuptools']
+        inherits = ['setuptools3']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_python3_setuptools(self):
+        # Test creating python3 package from tarball (using setuptools3 class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'python-magic'
+        pv = '0.4.15'
+        recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['MIT'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://LICENSE;md5=16a934f165e8c3245f241e77d401bb88'
+        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = 'e384c95a47218f66c6501cd6dd45ff59'
+        checkvars['SRC_URI[sha256sum]'] = 'f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5'
+        inherits = ['setuptools3']
+        self._test_recipe_contents(recipefile, checkvars, inherits)
+
+    def test_recipetool_create_python3_distutils(self):
+        # Test creating python3 package from tarball (using distutils3 class)
+        temprecipe = os.path.join(self.tempdir, 'recipe')
+        os.makedirs(temprecipe)
+        pn = 'docutils'
+        pv = '0.14'
+        recipefile = os.path.join(temprecipe, '%s_%s.bb' % (pn, pv))
+        srcuri = 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-%s.tar.gz' % pv
+        result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
+        self.assertTrue(os.path.isfile(recipefile))
+        checkvars = {}
+        checkvars['LICENSE'] = set(['PSF', '&', 'BSD', 'GPL'])
+        checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING.txt;md5=35a23d42b615470583563132872c97d6'
+        checkvars['SRC_URI'] = 'https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-${PV}.tar.gz'
+        checkvars['SRC_URI[md5sum]'] = 'c53768d63db3873b7d452833553469de'
+        checkvars['SRC_URI[sha256sum]'] = '51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274'
+        inherits = ['distutils3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_github_tarball(self):
@@ -450,7 +488,7 @@ class RecipetoolTests(RecipetoolBase):
         checkvars = {}
         checkvars['LICENSE'] = set(['Apache-2.0'])
         checkvars['SRC_URI'] = 'https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz'
-        inherits = ['setuptools']
+        inherits = ['setuptools3']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
     def test_recipetool_create_git_http(self):
diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 1a38bd0b14ef..ac9bc9237ce0 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -31,11 +31,11 @@ def tinfoil_init(instance):
 
 
 class PythonRecipeHandler(RecipeHandler):
-    base_pkgdeps = ['python-core']
-    excluded_pkgdeps = ['python-dbg']
-    # os.path is provided by python-core
+    base_pkgdeps = ['python3-core']
+    excluded_pkgdeps = ['python3-dbg']
+    # os.path is provided by python3-core
     assume_provided = ['builtins', 'os.path']
-    # Assumes that the host python builtin_module_names is sane for target too
+    # Assumes that the host python3 builtin_module_names is sane for target too
     assume_provided = assume_provided + list(sys.builtin_module_names)
 
     bbvar_map = {
@@ -215,9 +215,9 @@ class PythonRecipeHandler(RecipeHandler):
         self.apply_info_replacements(info)
 
         if uses_setuptools:
-            classes.append('setuptools')
+            classes.append('setuptools3')
         else:
-            classes.append('distutils')
+            classes.append('distutils3')
 
         if license_str:
             for i, line in enumerate(lines_before):
@@ -282,7 +282,7 @@ class PythonRecipeHandler(RecipeHandler):
                 for feature, feature_reqs in extras_req.items():
                     unmapped_deps.difference_update(feature_reqs)
 
-                    feature_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
+                    feature_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
                     lines_after.append('PACKAGECONFIG[{}] = ",,,{}"'.format(feature.lower(), ' '.join(feature_req_deps)))
 
         inst_reqs = set()
@@ -293,7 +293,7 @@ class PythonRecipeHandler(RecipeHandler):
             if inst_reqs:
                 unmapped_deps.difference_update(inst_reqs)
 
-                inst_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
+                inst_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
                 lines_after.append('# WARNING: the following rdepends are from setuptools install_requires. These')
                 lines_after.append('# upstream names may not correspond exactly to bitbake package names.')
                 lines_after.append('RDEPENDS_${{PN}} += "{}"'.format(' '.join(inst_req_deps)))
@@ -356,7 +356,7 @@ class PythonRecipeHandler(RecipeHandler):
         return info, 'setuptools' in imported_modules, non_literals, extensions
 
     def get_setup_args_info(self, setupscript='./setup.py'):
-        cmd = ['python', setupscript]
+        cmd = ['python3', setupscript]
         info = {}
         keys = set(self.bbvar_map.keys())
         keys |= set(self.setuparg_list_fields)
@@ -390,7 +390,7 @@ class PythonRecipeHandler(RecipeHandler):
     def get_setup_byline(self, fields, setupscript='./setup.py'):
         info = {}
 
-        cmd = ['python', setupscript]
+        cmd = ['python3', setupscript]
         cmd.extend('--' + self.setuparg_map.get(f, f.lower()) for f in fields)
         try:
             info_lines = self.run_command(cmd, cwd=os.path.dirname(setupscript)).splitlines()
@@ -527,7 +527,7 @@ class PythonRecipeHandler(RecipeHandler):
         pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
 
         ldata = tinfoil.config_data.createCopy()
-        bb.parse.handle('classes/python-dir.bbclass', ldata, True)
+        bb.parse.handle('classes/python3-dir.bbclass', ldata, True)
         python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR')
 
         dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
-- 
2.20.1


