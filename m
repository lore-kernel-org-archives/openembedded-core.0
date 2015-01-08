Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id A020772859
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 18:24:20 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fl12so12583655pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jan 2015 10:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hyTmT/HiAx2ro5/UDzrFrt5PIIn9T6QFoLKBx0WnNWo=;
	b=ZiceqYQogHjY7S2tp6HlsOU+J1q9wST+GMm4MldqbNXDlIsWsHHFSFEao1mffufdyH
	o9tCSnlHORReY7J1kmcDU1REc/yYlG8Xljd7uG3jYmcjf21P2xuqe2tukiCTbyhi33Xb
	y0lNbSLDMJFnUfI1HljSYFZCa/9Z9MoyYJRZ+DTjrv5EQHgrlT7EY6s4vKBDUF3y22oQ
	lVzEFaWloekn9KlrmIUXNrnJdhsZUvV4DIeJ9DUG/iQkR9KgJwTCLHcf4JLElYuYDUhu
	BX/f3/psrtZufR8sop7wT0kMes1vxV4BZA4XZMTOD3pML/2KW4T4szKrwHLKUK9Ti+PH
	vwMQ==
X-Received: by 10.69.26.130 with SMTP id iy2mr17165685pbd.93.1420741460966;
	Thu, 08 Jan 2015 10:24:20 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	rl10sm5011251pbb.67.2015.01.08.10.24.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 08 Jan 2015 10:24:19 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jan 2015 11:24:10 -0700
Message-Id: <1420741450-28220-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1420741450-28220-1-git-send-email-kergoth@gmail.com>
References: <1420741450-28220-1-git-send-email-kergoth@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: add python dependency scanning support
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
X-List-Received-Date: Thu, 08 Jan 2015 18:24:20 -0000

This uses a standalone python script named `pythondeps` which now lives in
scripts. It supports scanning for provided packages and imported
modules/packages, the latter via the python ast. It's not perfect, and
obviously conditional imports and try/except import blocks are handled
naively, listing all the imports even if they aren't all used at once, but it
gives the user a solid starting point for the recipe.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 147 +++++++++++++
 scripts/pythondeps                               | 250 +++++++++++++++++++++++
 2 files changed, 397 insertions(+)
 create mode 100755 scripts/pythondeps

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 3cdcafd..d651749 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -40,6 +40,11 @@ def tinfoil_init(instance):
 
 
 class PythonRecipeHandler(RecipeHandler):
+    base_pkgdeps = ['python-core']
+    excluded_pkgdeps = ['python-dbg']
+    # os.path is provided by python-core
+    excluded_modules = ['builtins', 'os.path']
+
     bbvar_map = {
         'Name': 'PN',
         'Version': 'PV',
@@ -240,14 +245,41 @@ class PythonRecipeHandler(RecipeHandler):
         if bbinfo:
             lines_before.append('')
 
+        mapped_deps, unmapped_deps = self.scan_setup_python_deps(srctree, setup_info, setup_non_literals)
+
         inst_reqs = set()
         if 'Install-requires' in info:
             inst_reqs |= set(info['Install-requires'])
             if inst_reqs:
+                # Naive attempt to avoid listing things in unmapped deps which
+                # are already in install_requires. Only of any use if the
+                # python package name matches the project name.
+                unmapped_deps.difference_update(inst_reqs)
+
                 lines_after.append('# WARNING: the following rdepends are from setuptools install_requires. These')
                 lines_after.append('# upstream names may not correspond exactly to bitbake package names.')
                 lines_after.append('RDEPENDS_${{PN}} += "{}"'.format(' '.join(r.lower() for r in sorted(inst_reqs))))
 
+        if mapped_deps:
+            name = info.get('Name')
+            if name and name[0] in mapped_deps:
+                # Attempt to avoid self-reference
+                mapped_deps.remove(name[0])
+            mapped_deps -= set(self.excluded_pkgdeps)
+            if inst_reqs:
+                lines_after.append('')
+            lines_after.append('# WARNING: the following rdepends are determined through basic analysis of the')
+            lines_after.append('# python sources, and might not be 100% accurate. It is your responsibility to')
+            lines_after.append('# verify that the values are complete and correct.')
+            lines_after.append('RDEPENDS_${{PN}} += "{}"'.format(' '.join(sorted(mapped_deps))))
+
+        if unmapped_deps:
+            if mapped_deps:
+                lines_after.append('')
+            lines_after.append('# WARNING: We were unable to map the following python package/module')
+            lines_after.append('# dependencies to the bitbake packages which include them:')
+            lines_after.extend('#    {}'.format(d) for d in sorted(unmapped_deps))
+
         handled.append('buildsystem')
 
     def get_pkginfo(self, pkginfo_fn):
@@ -333,6 +365,70 @@ class PythonRecipeHandler(RecipeHandler):
                 info[fields[lineno]] = line
         return info
 
+    def scan_setup_python_deps(self, srctree, setup_info, setup_non_literals):
+        if 'package_dir' in setup_info:
+            package_dir = setup_info['Package-dir']
+        else:
+            package_dir = {}
+
+        class PackageDir(distutils.command.build_py.build_py):
+            def __init__(self, package_dir):
+                self.package_dir = package_dir
+
+        pd = PackageDir(package_dir)
+        to_scan = []
+        if not any(v in setup_non_literals for v in ['Py-modules', 'Scripts', 'Packages']):
+            if 'Py-modules' in setup_info:
+                for module in setup_info['Py-modules']:
+                    to_scan.append(pd.get_package_dir(module) + '.py')
+
+            if 'Packages' in setup_info:
+                for package in setup_info['Packages']:
+                    to_scan.append(pd.get_package_dir(package))
+
+            if 'Scripts' in setup_info:
+                to_scan.extend(setup_info['Scripts'])
+
+        if not to_scan:
+            to_scan = ['.']
+
+        provided_packages = self.parse_pkgdata_for_python_packages()
+        scanned_deps = self.scan_python_dependencies([os.path.join(srctree, p) for p in to_scan])
+        scanned_deps -= set(self.excluded_modules)
+        mapped_deps, unmapped_deps = set(self.base_pkgdeps), set()
+        for dep in scanned_deps:
+            mapped = provided_packages.get(dep)
+            if mapped:
+                mapped_deps.add(mapped)
+            else:
+                unmapped_deps.add(dep)
+        return mapped_deps, unmapped_deps
+
+    def scan_python_dependencies(self, paths):
+        deps = set()
+        try:
+            dep_output = self.run_command(['pythondeps', '-d'] + paths)
+        except (OSError, subprocess.CalledProcessError):
+            pass
+        else:
+            for line in dep_output.splitlines():
+                line = line.rstrip()
+                dep, filename = line.split('\t', 1)
+                if filename.endswith('/setup.py'):
+                    continue
+                deps.add(dep)
+
+        try:
+            provides_output = self.run_command(['pythondeps', '-p'] + paths)
+        except (OSError, subprocess.CalledProcessError):
+            pass
+        else:
+            provides_lines = (l.rstrip() for l in provides_output.splitlines())
+            provides = set(l for l in provides_lines if l and l != 'setup')
+            deps -= provides
+
+        return deps
+
     def apply_info_replacements(self, info):
         for variable, search, replace in self.replacements:
             if variable not in info:
@@ -365,6 +461,57 @@ class PythonRecipeHandler(RecipeHandler):
                 if value != new_list:
                     info[variable] = new_list
 
+    def parse_pkgdata_for_python_packages(self):
+        suffixes = [t[0] for t in imp.get_suffixes()]
+        pkgdata_dir = tinfoil.config_data.getVar('PKGDATA_DIR', True)
+
+        ldata = tinfoil.config_data.createCopy()
+        bb.parse.handle('classes/python-dir.bbclass', ldata, True)
+        python_sitedir = ldata.getVar('PYTHON_SITEPACKAGES_DIR', True)
+
+        dynload_dir = os.path.join(os.path.dirname(python_sitedir), 'lib-dynload')
+        python_dirs = [python_sitedir + os.sep,
+                       os.path.join(os.path.dirname(python_sitedir), 'dist-packages') + os.sep,
+                       os.path.dirname(python_sitedir) + os.sep]
+        packages = {}
+        for pkgdatafile in glob.glob('{}/runtime/*'.format(pkgdata_dir)):
+            files_info = None
+            with open(pkgdatafile, 'r') as f:
+                for line in f.readlines():
+                    field, value = line.split(': ', 1)
+                    if field == 'FILES_INFO':
+                        files_info = ast.literal_eval(value)
+                        break
+                else:
+                    continue
+
+            for fn in files_info.iterkeys():
+                for suffix in suffixes:
+                    if fn.endswith(suffix):
+                        break
+                else:
+                    continue
+
+                if fn.startswith(dynload_dir + os.sep):
+                    base = os.path.basename(fn)
+                    provided = base.split('.', 1)[0]
+                    packages[provided] = os.path.basename(pkgdatafile)
+                    continue
+
+                for python_dir in python_dirs:
+                    if fn.startswith(python_dir):
+                        relpath = fn[len(python_dir):]
+                        base, _ = os.path.splitext(relpath)
+
+                        if '/.debug/' in base:
+                            continue
+                        if os.path.basename(base) == '__init__':
+                            base = os.path.dirname(base)
+                        base = base.replace(os.sep + os.sep, os.sep)
+                        provided = base.replace(os.sep, '.')
+                        packages[provided] = os.path.basename(pkgdatafile)
+        return packages
+
     @classmethod
     def run_command(cls, cmd, **popenargs):
         if 'stderr' not in popenargs:
diff --git a/scripts/pythondeps b/scripts/pythondeps
new file mode 100755
index 0000000..ff92e74
--- /dev/null
+++ b/scripts/pythondeps
@@ -0,0 +1,250 @@
+#!/usr/bin/env python
+#
+# Determine dependencies of python scripts or available python modules in a search path.
+#
+# Given the -d argument and a filename/filenames, returns the modules imported by those files.
+# Given the -d argument and a directory/directories, recurses to find all
+# python packages and modules, returns the modules imported by these.
+# Given the -p argument and a path or paths, scans that path for available python modules/packages.
+
+import argparse
+import ast
+import imp
+import logging
+import os.path
+import sys
+
+
+logger = logging.getLogger('pythondeps')
+
+suffixes = []
+for triple in imp.get_suffixes():
+    suffixes.append(triple[0])
+
+
+class PythonDepError(Exception):
+    pass
+
+
+class DependError(PythonDepError):
+    def __init__(self, path, error):
+        self.path = path
+        self.error = error
+        PythonDepError.__init__(self, error)
+
+    def __str__(self):
+        return "Failure determining dependencies of {}: {}".format(self.path, self.error)
+
+
+class ImportVisitor(ast.NodeVisitor):
+    def __init__(self):
+        self.imports = set()
+        self.importsfrom = []
+
+    def visit_Import(self, node):
+        for alias in node.names:
+            self.imports.add(alias.name)
+
+    def visit_ImportFrom(self, node):
+        self.importsfrom.append((node.module, [a.name for a in node.names], node.level))
+
+
+def walk_up(path):
+    while path:
+        yield path
+        path, _, _ = path.rpartition(os.sep)
+
+
+def get_provides(path):
+    path = os.path.realpath(path)
+
+    def get_fn_name(fn):
+        for suffix in suffixes:
+            if fn.endswith(suffix):
+                return fn[:-len(suffix)]
+
+    isdir = os.path.isdir(path)
+    if isdir:
+        pkg_path = path
+        walk_path = path
+    else:
+        pkg_path = get_fn_name(path)
+        if pkg_path is None:
+            return
+        walk_path = os.path.dirname(path)
+
+    for curpath in walk_up(walk_path):
+        if not os.path.exists(os.path.join(curpath, '__init__.py')):
+            libdir = curpath
+            break
+    else:
+        libdir = ''
+
+    package_relpath = pkg_path[len(libdir)+1:]
+    package = '.'.join(package_relpath.split(os.sep))
+    if not isdir:
+        yield package, path
+    else:
+        if os.path.exists(os.path.join(path, '__init__.py')):
+            yield package, path
+
+        for dirpath, dirnames, filenames in os.walk(path):
+            relpath = dirpath[len(path)+1:]
+            if relpath:
+                if '__init__.py' not in filenames:
+                    dirnames[:] = []
+                    continue
+                else:
+                    context = '.'.join(relpath.split(os.sep))
+                    if package:
+                        context = package + '.' + context
+                    yield context, dirpath
+            else:
+                context = package
+
+            for fn in filenames:
+                adjusted_fn = get_fn_name(fn)
+                if not adjusted_fn or adjusted_fn == '__init__':
+                    continue
+
+                fullfn = os.path.join(dirpath, fn)
+                if context:
+                    yield context + '.' + adjusted_fn, fullfn
+                else:
+                    yield adjusted_fn, fullfn
+
+
+def get_code_depends(code_string, path=None, provide=None, ispkg=False):
+    try:
+        code = ast.parse(code_string, path)
+    except TypeError as exc:
+        raise DependError(path, exc)
+    except SyntaxError as exc:
+        raise DependError(path, exc)
+
+    visitor = ImportVisitor()
+    visitor.visit(code)
+    for builtin_module in sys.builtin_module_names:
+        if builtin_module in visitor.imports:
+            visitor.imports.remove(builtin_module)
+
+    if provide:
+        provide_elements = provide.split('.')
+        if ispkg:
+            provide_elements.append("__self__")
+        context = '.'.join(provide_elements[:-1])
+        package_path = os.path.dirname(path)
+    else:
+        context = None
+        package_path = None
+
+    levelzero_importsfrom = (module for module, names, level in visitor.importsfrom
+                             if level == 0)
+    for module in visitor.imports | set(levelzero_importsfrom):
+        if context and path:
+            module_basepath = os.path.join(package_path, module.replace('.', '/'))
+            if os.path.exists(module_basepath):
+                # Implicit relative import
+                yield context + '.' + module, path
+                continue
+
+            for suffix in suffixes:
+                if os.path.exists(module_basepath + suffix):
+                    # Implicit relative import
+                    yield context + '.' + module, path
+                    break
+            else:
+                yield module, path
+        else:
+            yield module, path
+
+    for module, names, level in visitor.importsfrom:
+        if level == 0:
+            continue
+        elif not provide:
+            raise DependError("Error: ImportFrom non-zero level outside of a package: {0}".format((module, names, level)), path)
+        elif level > len(provide_elements):
+            raise DependError("Error: ImportFrom level exceeds package depth: {0}".format((module, names, level)), path)
+        else:
+            context = '.'.join(provide_elements[:-level])
+            if module:
+                if context:
+                    yield context + '.' + module, path
+                else:
+                    yield module, path
+
+
+def get_file_depends(path):
+    try:
+        code_string = open(path, 'r').read()
+    except (OSError, IOError) as exc:
+        raise DependError(path, exc)
+
+    return get_code_depends(code_string, path)
+
+
+def get_depends_recursive(directory):
+    directory = os.path.realpath(directory)
+
+    provides = dict((v, k) for k, v in get_provides(directory))
+    for filename, provide in provides.iteritems():
+        if os.path.isdir(filename):
+            filename = os.path.join(filename, '__init__.py')
+            ispkg = True
+        elif not filename.endswith('.py'):
+            continue
+        else:
+            ispkg = False
+
+        with open(filename, 'r') as f:
+            source = f.read()
+
+        depends = get_code_depends(source, filename, provide, ispkg)
+        for depend, by in depends:
+            yield depend, by
+
+
+def get_depends(path):
+    if os.path.isdir(path):
+        return get_depends_recursive(path)
+    else:
+        return get_file_depends(path)
+
+
+def main():
+    logging.basicConfig()
+
+    parser = argparse.ArgumentParser(description='Determine dependencies and provided packages for python scripts/modules')
+    parser.add_argument('path', nargs='+', help='full path to content to be processed')
+    group = parser.add_mutually_exclusive_group()
+    group.add_argument('-p', '--provides', action='store_true',
+                       help='given a path, display the provided python modules')
+    group.add_argument('-d', '--depends', action='store_true',
+                       help='given a filename, display the imported python modules')
+
+    args = parser.parse_args()
+    if args.provides:
+        modules = set()
+        for path in args.path:
+            for provide, fn in get_provides(path):
+                modules.add(provide)
+
+        for module in sorted(modules):
+            print(module)
+    elif args.depends:
+        for path in args.path:
+            try:
+                modules = get_depends(path)
+            except PythonDepError as exc:
+                logger.error(str(exc))
+                sys.exit(1)
+
+            for module, imp_by in modules:
+                print("{}\t{}".format(module, imp_by))
+    else:
+        parser.print_help()
+        sys.exit(2)
+
+
+if __name__ == '__main__':
+    main()
-- 
1.8.3.4


