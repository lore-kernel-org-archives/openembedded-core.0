Return-Path: <maciej.pijanowski@3mdeb.com>
X-Greylist: delayed 1128 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Jun 2019 07:55:38 UTC
Received: from 20.mo4.mail-out.ovh.net (20.mo4.mail-out.ovh.net [46.105.33.73])
	by mail.openembedded.org (Postfix) with ESMTP id DF6897CFF6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 07:55:38 +0000 (UTC)
Received: from player772.ha.ovh.net (unknown [10.109.143.24])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id DEDF21F5F6F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 09:36:50 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player772.ha.ovh.net (Postfix) with ESMTPSA id 6597D691D87F;
	Fri,  7 Jun 2019 07:36:48 +0000 (UTC)
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 09:36:24 +0200
Message-Id: <1559892984-24780-1-git-send-email-maciej.pijanowski@3mdeb.com>
X-Mailer: git-send-email 2.7.4
X-Ovh-Tracer-Id: 1446218432233615041
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudeghedguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
Cc: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>, piotr.krol@3mdeb.com
Subject: [PATCH] recipetool: support python3 instead of python2
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
X-List-Received-Date: Fri, 07 Jun 2019 07:55:39 -0000

Add support for generating python3 recipes using the recipetool / devtool.
Drop python2 support at the same time.

Tested with:

devtool add --also-native python3-python-magic \
https://files.pythonhosted.org/packages/84/30/\
  80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/\
  python-magic-0.4.15.tar.gz

No python2 dependencies were pulled in

Fixes Bug 13264

Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index ec5449bee99f..f24dce23918a 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -41,11 +41,11 @@ def tinfoil_init(instance):
 
 
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
@@ -225,9 +225,9 @@ class PythonRecipeHandler(RecipeHandler):
         self.apply_info_replacements(info)
 
         if uses_setuptools:
-            classes.append('setuptools')
+            classes.append('setuptools3')
         else:
-            classes.append('distutils')
+            classes.append('distutils3')
 
         if license_str:
             for i, line in enumerate(lines_before):
@@ -292,7 +292,7 @@ class PythonRecipeHandler(RecipeHandler):
                 for feature, feature_reqs in extras_req.items():
                     unmapped_deps.difference_update(feature_reqs)
 
-                    feature_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
+                    feature_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
                     lines_after.append('PACKAGECONFIG[{}] = ",,,{}"'.format(feature.lower(), ' '.join(feature_req_deps)))
 
         inst_reqs = set()
@@ -303,7 +303,7 @@ class PythonRecipeHandler(RecipeHandler):
             if inst_reqs:
                 unmapped_deps.difference_update(inst_reqs)
 
-                inst_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
+                inst_req_deps = ('python3-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
                 lines_after.append('# WARNING: the following rdepends are from setuptools install_requires. These')
                 lines_after.append('# upstream names may not correspond exactly to bitbake package names.')
                 lines_after.append('RDEPENDS_${{PN}} += "{}"'.format(' '.join(inst_req_deps)))
@@ -364,7 +364,7 @@ class PythonRecipeHandler(RecipeHandler):
         return info, 'setuptools' in imported_modules, non_literals, extensions
 
     def get_setup_args_info(self, setupscript='./setup.py'):
-        cmd = ['python', setupscript]
+        cmd = ['python3', setupscript]
         info = {}
         keys = set(self.bbvar_map.keys())
         keys |= set(self.setuparg_list_fields)
@@ -398,7 +398,7 @@ class PythonRecipeHandler(RecipeHandler):
     def get_setup_byline(self, fields, setupscript='./setup.py'):
         info = {}
 
-        cmd = ['python', setupscript]
+        cmd = ['python3', setupscript]
         cmd.extend('--' + self.setuparg_map.get(f, f.lower()) for f in fields)
         try:
             info_lines = self.run_command(cmd, cwd=os.path.dirname(setupscript)).splitlines()
@@ -535,7 +535,7 @@ class PythonRecipeHandler(RecipeHandler):
         pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR')
 
         ldata = tinfoil.config_data.createCopy()
-        bb.parse.handle('classes/python-dir.bbclass', ldata, True)
+        bb.parse.handle('classes/python3-dir.bbclass', ldata, True)
         python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR')
 
         dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
-- 
2.7.4


