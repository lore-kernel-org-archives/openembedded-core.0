Return-Path: <jean-marie.lemetayer@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE0D7FA23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 16:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 399E29C047D;
	Fri, 17 Jan 2020 11:46:30 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id VMNEpqLPJPyr; Fri, 17 Jan 2020 11:46:28 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 6087D9C047F;
	Fri, 17 Jan 2020 11:46:28 -0500 (EST)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id nIdrf_jOIE72; Fri, 17 Jan 2020 11:46:28 -0500 (EST)
Received: from sulaco.example.com (40.73.12.109.rev.sfr.net [109.12.73.40])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 894BE9C047A;
	Fri, 17 Jan 2020 11:46:26 -0500 (EST)
From: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 17:46:03 +0100
Message-Id: <20200117164609.28400-8-jean-marie.lemetayer@savoirfairelinux.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200117164609.28400-1-jean-marie.lemetayer@savoirfairelinux.com>
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: [PATCH v4 07/13] recipetool/create_npm: refactor the npm recipe creation handler
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
X-List-Received-Date: Fri, 17 Jan 2020 16:46:29 -0000
Content-Transfer-Encoding: quoted-printable

This commit refactors the npm recipe creation handler to use the new npm
behavior. The process is kept as simple as possible and only generates
the shrinkwrap file.

To avoid naming issues the recipe name is now extracted from the npm
package name and not directly mapped.

Signed-off-by: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinu=
x.com>
---
 scripts/lib/recipetool/create_npm.py | 468 ++++++++++-----------------
 1 file changed, 178 insertions(+), 290 deletions(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetoo=
l/create_npm.py
index 39429ebad3..5eba7dcd7b 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -1,321 +1,209 @@
-# Recipe creation tool - node.js NPM module support plugin
-#
 # Copyright (C) 2016 Intel Corporation
+# Copyright (C) 2020 Savoir-Faire Linux
 #
 # SPDX-License-Identifier: GPL-2.0-only
 #
+"""Recipe creation tool - npm module support plugin"""
=20
+import json
 import os
+import re
 import sys
-import logging
-import subprocess
 import tempfile
-import shutil
-import json
-from recipetool.create import RecipeHandler, split_pkg_licenses, handle_=
license_vars
+import bb
+from bb.fetch2.npm import NpmEnvironment
+from recipetool.create import RecipeHandler
=20
-logger =3D logging.getLogger('recipetool')
+TINFOIL =3D None
=20
+def tinfoil_init(instance):
+    """Initialize tinfoil"""
+    global TINFOIL
+    TINFOIL =3D instance
=20
-tinfoil =3D None
+class NpmRecipeHandler(RecipeHandler):
+    """Class to handle the npm recipe creation"""
+
+    @staticmethod
+    def _npm_name(name):
+        """Generate a Yocto friendly npm name"""
+        name =3D re.sub("/", "-", name)
+        name =3D name.lower()
+        name =3D re.sub(r"[^\-a-z0-9]", "", name)
+        name =3D name.strip("-")
+        return name
+
+    @staticmethod
+    def _get_registry(lines):
+        """Get the registry value from the 'npm://registry' url"""
+        registry =3D None
+
+        def _handle_registry(varname, origvalue, op, newlines):
+            nonlocal registry
+            if origvalue.startswith("npm://"):
+                registry =3D re.sub(r"^npm://", "http://", origvalue.spl=
it(";")[0])
+            return origvalue, None, 0, True
=20
-def tinfoil_init(instance):
-    global tinfoil
-    tinfoil =3D instance
+        bb.utils.edit_metadata(lines, ["SRC_URI"], _handle_registry)
=20
+        return registry
=20
-class NpmRecipeHandler(RecipeHandler):
-    lockdownpath =3D None
+    @staticmethod
+    def _ensure_npm():
+        """Check if the 'npm' command is available in the recipes"""
+        if not TINFOIL.recipes_parsed:
+            TINFOIL.parse_recipes()
=20
-    def _ensure_npm(self, fixed_setup=3DFalse):
-        if not tinfoil.recipes_parsed:
-            tinfoil.parse_recipes()
         try:
-            rd =3D tinfoil.parse_recipe('nodejs-native')
+            d =3D TINFOIL.parse_recipe("nodejs-native")
         except bb.providers.NoProvider:
-            if fixed_setup:
-                msg =3D 'nodejs-native is required for npm but is not av=
ailable within this SDK'
-            else:
-                msg =3D 'nodejs-native is required for npm but is not av=
ailable - you will likely need to add a layer that provides nodejs'
-            logger.error(msg)
-            return None
-        bindir =3D rd.getVar('STAGING_BINDIR_NATIVE')
-        npmpath =3D os.path.join(bindir, 'npm')
+            bb.error("Nothing provides 'nodejs-native' which is required=
 for the build")
+            bb.note("You will likely need to add a layer that provides n=
odejs")
+            sys.exit(14)
+
+        bindir =3D d.getVar("STAGING_BINDIR_NATIVE")
+        npmpath =3D os.path.join(bindir, "npm")
+
         if not os.path.exists(npmpath):
-            tinfoil.build_targets('nodejs-native', 'addto_recipe_sysroot=
')
+            TINFOIL.build_targets("nodejs-native", "addto_recipe_sysroot=
")
+
             if not os.path.exists(npmpath):
-                logger.error('npm required to process specified source, =
but nodejs-native did not seem to populate it')
-                return None
+                bb.error("Failed to add 'npm' to sysroot")
+                sys.exit(14)
+
         return bindir
=20
-    def _handle_license(self, data):
-        '''
-        Handle the license value from an npm package.json file
-        '''
-        license =3D None
-        if 'license' in data:
-            license =3D data['license']
-            if isinstance(license, dict):
-                license =3D license.get('type', None)
-            if license:
-                if 'OR' in license:
-                    license =3D license.replace('OR', '|')
-                    license =3D license.replace('AND', '&')
-                    license =3D license.replace(' ', '_')
-                    if not license[0] =3D=3D '(':
-                        license =3D '(' + license + ')'
-                else:
-                    license =3D license.replace('AND', '&')
-                    if license[0] =3D=3D '(':
-                        license =3D license[1:]
-                    if license[-1] =3D=3D ')':
-                        license =3D license[:-1]
-                license =3D license.replace('MIT/X11', 'MIT')
-                license =3D license.replace('Public Domain', 'PD')
-                license =3D license.replace('SEE LICENSE IN EULA',
-                                          'SEE-LICENSE-IN-EULA')
-        return license
-
-    def _shrinkwrap(self, srctree, localfilesdir, extravalues, lines_bef=
ore, d):
-        try:
-            runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
-            bb.process.run('npm shrinkwrap', cwd=3Dsrctree, stderr=3Dsub=
process.STDOUT, env=3Drunenv, shell=3DTrue)
-        except bb.process.ExecutionError as e:
-            logger.warning('npm shrinkwrap failed:\n%s' % e.stdout)
-            return
-
-        tmpfile =3D os.path.join(localfilesdir, 'npm-shrinkwrap.json')
-        shutil.move(os.path.join(srctree, 'npm-shrinkwrap.json'), tmpfil=
e)
-        extravalues.setdefault('extrafiles', {})
-        extravalues['extrafiles']['npm-shrinkwrap.json'] =3D tmpfile
-        lines_before.append('NPM_SHRINKWRAP :=3D "${THISDIR}/${PN}/npm-s=
hrinkwrap.json"')
-
-    def _lockdown(self, srctree, localfilesdir, extravalues, lines_befor=
e, d):
-        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
-        if not NpmRecipeHandler.lockdownpath:
-            NpmRecipeHandler.lockdownpath =3D tempfile.mkdtemp('recipeto=
ol-npm-lockdown')
-            bb.process.run('npm install lockdown --prefix %s' % NpmRecip=
eHandler.lockdownpath,
-                           cwd=3Dsrctree, stderr=3Dsubprocess.STDOUT, en=
v=3Drunenv, shell=3DTrue)
-        relockbin =3D os.path.join(NpmRecipeHandler.lockdownpath, 'node_=
modules', 'lockdown', 'relock.js')
-        if not os.path.exists(relockbin):
-            logger.warning('Could not find relock.js within lockdown dir=
ectory; skipping lockdown')
-            return
-        try:
-            bb.process.run('node %s' % relockbin, cwd=3Dsrctree, stderr=3D=
subprocess.STDOUT, env=3Drunenv, shell=3DTrue)
-        except bb.process.ExecutionError as e:
-            logger.warning('lockdown-relock failed:\n%s' % e.stdout)
-            return
-
-        tmpfile =3D os.path.join(localfilesdir, 'lockdown.json')
-        shutil.move(os.path.join(srctree, 'lockdown.json'), tmpfile)
-        extravalues.setdefault('extrafiles', {})
-        extravalues['extrafiles']['lockdown.json'] =3D tmpfile
-        lines_before.append('NPM_LOCKDOWN :=3D "${THISDIR}/${PN}/lockdow=
n.json"')
-
-    def _handle_dependencies(self, d, deps, optdeps, devdeps, lines_befo=
re, srctree):
-        import scriptutils
-        # If this isn't a single module we need to get the dependencies
-        # and add them to SRC_URI
-        def varfunc(varname, origvalue, op, newlines):
-            if varname =3D=3D 'SRC_URI':
-                if not origvalue.startswith('npm://'):
-                    src_uri =3D origvalue.split()
-                    deplist =3D {}
-                    for dep, depver in optdeps.items():
-                        depdata =3D self.get_npm_data(dep, depver, d)
-                        if self.check_npm_optional_dependency(depdata):
-                            deplist[dep] =3D depdata
-                    for dep, depver in devdeps.items():
-                        depdata =3D self.get_npm_data(dep, depver, d)
-                        if self.check_npm_optional_dependency(depdata):
-                            deplist[dep] =3D depdata
-                    for dep, depver in deps.items():
-                        depdata =3D self.get_npm_data(dep, depver, d)
-                        deplist[dep] =3D depdata
-
-                    extra_urls =3D []
-                    for dep, depdata in deplist.items():
-                        version =3D depdata.get('version', None)
-                        if version:
-                            url =3D 'npm://registry.npmjs.org;name=3D%s;=
version=3D%s;subdir=3Dnode_modules/%s' % (dep, version, dep)
-                            extra_urls.append(url)
-                    if extra_urls:
-                        scriptutils.fetch_url(tinfoil, ' '.join(extra_ur=
ls), None, srctree, logger)
-                        src_uri.extend(extra_urls)
-                        return src_uri, None, -1, True
-            return origvalue, None, 0, True
-        updated, newlines =3D bb.utils.edit_metadata(lines_before, ['SRC=
_URI'], varfunc)
-        if updated:
-            del lines_before[:]
-            for line in newlines:
-                # Hack to avoid newlines that edit_metadata inserts
-                if line.endswith('\n'):
-                    line =3D line[:-1]
-                lines_before.append(line)
-        return updated
+    @staticmethod
+    def _npm_global_configs(dev):
+        """Get the npm global configuration"""
+        configs =3D []
+
+        if dev:
+            configs.append(("also", "development"))
+        else:
+            configs.append(("only", "production"))
+
+        configs.append(("save", "false"))
+        configs.append(("package-lock", "false"))
+        configs.append(("shrinkwrap", "false"))
+        return configs
+
+    def _run_npm_install(self, d, srctree, registry, dev):
+        """Run the 'npm install' command without building the addons"""
+        configs =3D self._npm_global_configs(dev)
+        configs.append(("ignore-scripts", "true"))
+
+        if registry:
+            configs.append(("registry", registry))
+
+        bb.utils.remove(os.path.join(srctree, "node_modules"), recurse=3D=
True)
+
+        env =3D NpmEnvironment(d, configs=3Dconfigs)
+        env.run("npm install", workdir=3Dsrctree)
+
+    def _generate_shrinkwrap(self, d, srctree, dev):
+        """Check and generate the 'npm-shrinkwrap.json' file if needed""=
"
+        configs =3D self._npm_global_configs(dev)
+
+        env =3D NpmEnvironment(d, configs=3Dconfigs)
+        env.run("npm shrinkwrap", workdir=3Dsrctree)
+
+        return os.path.join(srctree, "npm-shrinkwrap.json")
=20
     def process(self, srctree, classes, lines_before, lines_after, handl=
ed, extravalues):
-        import bb.utils
-        import oe.package
-        from collections import OrderedDict
+        """Handle the npm recipe creation"""
=20
-        if 'buildsystem' in handled:
+        if "buildsystem" in handled:
             return False
=20
-        def read_package_json(fn):
-            with open(fn, 'r', errors=3D'surrogateescape') as f:
-                return json.loads(f.read())
+        files =3D RecipeHandler.checkfiles(srctree, ["package.json"])
=20
-        files =3D RecipeHandler.checkfiles(srctree, ['package.json'])
-        if files:
-            d =3D bb.data.createCopy(tinfoil.config_data)
-            npm_bindir =3D self._ensure_npm()
-            if not npm_bindir:
-                sys.exit(14)
-            d.prependVar('PATH', '%s:' % npm_bindir)
-
-            data =3D read_package_json(files[0])
-            if 'name' in data and 'version' in data:
-                extravalues['PN'] =3D data['name']
-                extravalues['PV'] =3D data['version']
-                classes.append('npm')
-                handled.append('buildsystem')
-                if 'description' in data:
-                    extravalues['SUMMARY'] =3D data['description']
-                if 'homepage' in data:
-                    extravalues['HOMEPAGE'] =3D data['homepage']
-
-                fetchdev =3D extravalues['fetchdev'] or None
-                deps, optdeps, devdeps =3D self.get_npm_package_dependen=
cies(data, fetchdev)
-                self._handle_dependencies(d, deps, optdeps, devdeps, lin=
es_before, srctree)
-
-                # Shrinkwrap
-                localfilesdir =3D tempfile.mkdtemp(prefix=3D'recipetool-=
npm')
-                self._shrinkwrap(srctree, localfilesdir, extravalues, li=
nes_before, d)
-
-                # Lockdown
-                self._lockdown(srctree, localfilesdir, extravalues, line=
s_before, d)
-
-                # Split each npm module out to is own package
-                npmpackages =3D oe.package.npm_split_package_dirs(srctre=
e)
-                licvalues =3D None
-                for item in handled:
-                    if isinstance(item, tuple):
-                        if item[0] =3D=3D 'license':
-                            licvalues =3D item[1]
-                            break
-                if not licvalues:
-                    licvalues =3D handle_license_vars(srctree, lines_bef=
ore, handled, extravalues, d)
-                if licvalues:
-                    # Augment the license list with information we have =
in the packages
-                    licenses =3D {}
-                    license =3D self._handle_license(data)
-                    if license:
-                        licenses['${PN}'] =3D license
-                    for pkgname, pkgitem in npmpackages.items():
-                        _, pdata =3D pkgitem
-                        license =3D self._handle_license(pdata)
-                        if license:
-                            licenses[pkgname] =3D license
-                    # Now write out the package-specific license values
-                    # We need to strip out the json data dicts for this =
since split_pkg_licenses
-                    # isn't expecting it
-                    packages =3D OrderedDict((x,y[0]) for x,y in npmpack=
ages.items())
-                    packages['${PN}'] =3D ''
-                    pkglicenses =3D split_pkg_licenses(licvalues, packag=
es, lines_after, licenses)
-                    all_licenses =3D list(set([item.replace('_', ' ') fo=
r pkglicense in pkglicenses.values() for item in pkglicense]))
-                    if '&' in all_licenses:
-                        all_licenses.remove('&')
-                    extravalues['LICENSE'] =3D ' & '.join(all_licenses)
-
-                # Need to move S setting after inherit npm
-                for i, line in enumerate(lines_before):
-                    if line.startswith('S =3D'):
-                        lines_before.pop(i)
-                        lines_after.insert(0, '# Must be set after inher=
it npm since that itself sets S')
-                        lines_after.insert(1, line)
-                        break
-
-                return True
-
-        return False
-
-    # FIXME this is duplicated from lib/bb/fetch2/npm.py
-    def _parse_view(self, output):
-        '''
-        Parse the output of npm view --json; the last JSON result
-        is assumed to be the one that we're interested in.
-        '''
-        pdata =3D None
-        outdeps =3D {}
-        datalines =3D []
-        bracelevel =3D 0
-        for line in output.splitlines():
-            if bracelevel:
-                datalines.append(line)
-            elif '{' in line:
-                datalines =3D []
-                datalines.append(line)
-            bracelevel =3D bracelevel + line.count('{') - line.count('}'=
)
-        if datalines:
-            pdata =3D json.loads('\n'.join(datalines))
-        return pdata
-
-    # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
-    # (split out from _getdependencies())
-    def get_npm_data(self, pkg, version, d):
-        import bb.fetch2
-        pkgfullname =3D pkg
-        if version !=3D '*' and not '/' in version:
-            pkgfullname +=3D "@'%s'" % version
-        logger.debug(2, "Calling getdeps on %s" % pkg)
-        runenv =3D dict(os.environ, PATH=3Dd.getVar('PATH'))
-        fetchcmd =3D "npm view %s --json" % pkgfullname
-        output, _ =3D bb.process.run(fetchcmd, stderr=3Dsubprocess.STDOU=
T, env=3Drunenv, shell=3DTrue)
-        data =3D self._parse_view(output)
-        return data
-
-    # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
-    # (split out from _getdependencies())
-    def get_npm_package_dependencies(self, pdata, fetchdev):
-        dependencies =3D pdata.get('dependencies', {})
-        optionalDependencies =3D pdata.get('optionalDependencies', {})
-        dependencies.update(optionalDependencies)
-        if fetchdev:
-            devDependencies =3D pdata.get('devDependencies', {})
-            dependencies.update(devDependencies)
-        else:
-            devDependencies =3D {}
-        depsfound =3D {}
-        optdepsfound =3D {}
-        devdepsfound =3D {}
-        for dep in dependencies:
-            if dep in optionalDependencies:
-                optdepsfound[dep] =3D dependencies[dep]
-            elif dep in devDependencies:
-                devdepsfound[dep] =3D dependencies[dep]
-            else:
-                depsfound[dep] =3D dependencies[dep]
-        return depsfound, optdepsfound, devdepsfound
-
-    # FIXME this is effectively duplicated from lib/bb/fetch2/npm.py
-    # (split out from _getdependencies())
-    def check_npm_optional_dependency(self, pdata):
-        pkg_os =3D pdata.get('os', None)
-        if pkg_os:
-            if not isinstance(pkg_os, list):
-                pkg_os =3D [pkg_os]
-            blacklist =3D False
-            for item in pkg_os:
-                if item.startswith('!'):
-                    blacklist =3D True
-                    break
-            if (not blacklist and 'linux' not in pkg_os) or '!linux' in =
pkg_os:
-                pkg =3D pdata.get('name', 'Unnamed package')
-                logger.debug(2, "Skipping %s since it's incompatible wit=
h Linux" % pkg)
-                return False
-        return True
+        if not files:
+            return False
+
+        with open(files[0], "r") as f:
+            data =3D json.load(f)
=20
+        if "name" not in data or "version" not in data:
+            return False
+
+        extravalues["PN"] =3D self._npm_name(data["name"])
+        extravalues["PV"] =3D data["version"]
+
+        if "description" in data:
+            extravalues["SUMMARY"] =3D data["description"]
+
+        if "homepage" in data:
+            extravalues["HOMEPAGE"] =3D data["homepage"]
+
+        dev =3D bb.utils.to_boolean(str(extravalues.get("NPM_INSTALL_DEV=
", "0")), False)
+        registry =3D self._get_registry(lines_before)
+
+        bb.note("Checking if npm is available ...")
+        # The native npm is used here (and not the host one) to ensure t=
hat the
+        # npm version is high enough to ensure an efficient dependency t=
ree
+        # resolution and avoid issue with the shrinkwrap file format.
+        # Moreover the native npm is mandatory for the build.
+        bindir =3D self._ensure_npm()
+
+        d =3D bb.data.createCopy(TINFOIL.config_data)
+        d.prependVar("PATH", bindir + ":")
+        d.setVar("S", srctree)
+
+        bb.note("Generating shrinkwrap file ...")
+        # To generate the shrinkwrap file the dependencies have to be in=
stalled
+        # first. During the generation process some files may be updated=
 /
+        # deleted. By default devtool tracks the diffs in the srctree an=
d raises
+        # errors when finishing the recipe if some diffs are found.
+        git_exclude_file =3D os.path.join(srctree, ".git", "info", "excl=
ude")
+        if os.path.exists(git_exclude_file):
+            with open(git_exclude_file, "r+") as f:
+                lines =3D f.readlines()
+                for line in ["/node_modules/", "/npm-shrinkwrap.json"]:
+                    if line not in lines:
+                        f.write(line + "\n")
+
+        lock_file =3D os.path.join(srctree, "package-lock.json")
+        lock_copy =3D lock_file + ".copy"
+        if os.path.exists(lock_file):
+            bb.utils.copyfile(lock_file, lock_copy)
+
+        self._run_npm_install(d, srctree, registry, dev)
+        shrinkwrap_file =3D self._generate_shrinkwrap(d, srctree, dev)
+
+        if os.path.exists(lock_copy):
+            bb.utils.movefile(lock_copy, lock_file)
+
+        # Add the shrinkwrap file as 'extrafiles'
+        shrinkwrap_copy =3D shrinkwrap_file + ".copy"
+        bb.utils.copyfile(shrinkwrap_file, shrinkwrap_copy)
+        extravalues.setdefault("extrafiles", {})
+        extravalues["extrafiles"]["npm-shrinkwrap.json"] =3D shrinkwrap_=
copy
+
+        url_local =3D "npmsw://%s" % shrinkwrap_file
+        url_recipe=3D "npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json"
+
+        if dev:
+            url_local +=3D ";dev=3D1"
+            url_recipe +=3D ";dev=3D1"
+
+        # Add the npmsw url in the SRC_URI of the generated recipe
+        def _handle_srcuri(varname, origvalue, op, newlines):
+            """Update the version value and add the 'npmsw://' url"""
+            value =3D origvalue.replace("version=3D" + data["version"], =
"version=3D${PV}")
+            value =3D origvalue.replace("version=3Dlatest", "version=3D$=
{PV}")
+            values =3D [line.strip() for line in value.strip('\n').split=
lines()]
+            values.append(url_recipe)
+            return values, None, 4, False
+
+        (_, newlines) =3D bb.utils.edit_metadata(lines_before, ["SRC_URI=
"], _handle_srcuri)
+        lines_before[:] =3D [line.rstrip('\n') for line in newlines]
+
+        classes.append("npm")
+        handled.append("buildsystem")
+
+        return True
=20
 def register_recipe_handlers(handlers):
+    """Register the npm handler"""
     handlers.append((NpmRecipeHandler(), 60))
--=20
2.20.1


