Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 88D2772C62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 18:52:38 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so40432632pad.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=posk70k+qd0IKZUUcYxP6lzS3o9xUaTn+8P/YTMAIPk=;
	b=XDvER0thPs0mDwO1nstMAXkazzk1U+iIFv3i+CVvTGOksN9WAmoQBa/dZNSxKP+IU5
	7Kcd/RvqflwjiFdn+6iq/+WFExjcuxI6sK9yDJ1+MicphMxZ6IMTgHHZkRwDiFbvNfTj
	9c3NqvYuDDINgFjbOa5mqheyjuNzuYMDRBTIFIx+Z0oE5Qj8UfzWlDFQzK93h8uXZbX7
	yOh3BKAZPYPkgcYYM6GwO7svIuBK70euPIPov7hcKXfq2FJicxFH9nGvGfapgWq9S31p
	Qj703jNi6w0r57r9Uxa5klVIl0xDxSR+KZEAXyYYiCJGgnd9/jGhreQRVgiStmZdBwk7
	1GSw==
X-Received: by 10.70.118.202 with SMTP id ko10mr47413990pdb.48.1421693558844; 
	Mon, 19 Jan 2015 10:52:38 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id tr8sm796508pbc.30.2015.01.19.10.52.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Jan 2015 10:52:37 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jan 2015 11:52:31 -0700
Message-Id: <1421693551-17611-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1421693551-17611-1-git-send-email-kergoth@gmail.com>
References: <1421693551-17611-1-git-send-email-kergoth@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCHv2 2/2] recipetool: add python dependency scanning support
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
X-List-Received-Date: Mon, 19 Jan 2015 18:52:38 -0000

This uses a standalone python script named `pythondeps` which now lives in
scripts. It supports scanning for provided packages and imported
modules/packages, the latter via the python ast. It's not perfect, and
obviously conditional imports and try/except import blocks are handled
naively, listing all the imports even if they aren't all used at once, but it
gives the user a solid starting point for the recipe.

Currently `python_dir` from setup.py isn't being handled in an ideal way. This
is easily seen when testing the python-async package. There, the root of the
project is the async package, so the root has __init__.py and friends, and the
python provides scanning currently just assumes the basedir of that dir is the
package name in this case, which is not correct. Forthcoming patches will
resolve this.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 160 +++++++++++++++
 scripts/pythondeps                               | 250 +++++++++++++++++++++++
 2 files changed, 410 insertions(+)
 create mode 100755 scripts/pythondeps

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 9e4e1eb..f4f4212 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -41,6 +41,13 @@ def tinfoil_init(instance):
 
 
 class PythonRecipeHandler(RecipeHandler):
+    base_pkgdeps = ['python-core']
+    excluded_pkgdeps = ['python-dbg']
+    # os.path is provided by python-core
+    assume_provided = ['builtins', 'os.path']
+    # Assumes that the host python builtin_module_names is sane for target too
+    assume_provided = assume_provided + list(sys.builtin_module_names)
+
     bbvar_map = {
         'Name': 'PN',
         'Version': 'PV',
@@ -273,6 +280,8 @@ class PythonRecipeHandler(RecipeHandler):
                 mdinfo.append('{} = "{}"'.format(k, v))
             lines_before[src_uri_line-1:src_uri_line-1] = mdinfo
 
+        mapped_deps, unmapped_deps = self.scan_setup_python_deps(srctree, setup_info, setup_non_literals)
+
         extras_req = set()
         if 'Extras-require' in info:
             extras_req = info['Extras-require']
@@ -284,6 +293,8 @@ class PythonRecipeHandler(RecipeHandler):
                 lines_after.append('# Uncomment this line to enable all the optional features.')
                 lines_after.append('#PACKAGECONFIG ?= "{}"'.format(' '.join(k.lower() for k in extras_req.iterkeys())))
                 for feature, feature_reqs in extras_req.iteritems():
+                    unmapped_deps.difference_update(feature_reqs)
+
                     feature_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(feature_reqs))
                     lines_after.append('PACKAGECONFIG[{}] = ",,,{}"'.format(feature.lower(), ' '.join(feature_req_deps)))
 
@@ -293,11 +304,34 @@ class PythonRecipeHandler(RecipeHandler):
                 lines_after.append('')
             inst_reqs = info['Install-requires']
             if inst_reqs:
+                unmapped_deps.difference_update(inst_reqs)
+
                 inst_req_deps = ('python-' + r.replace('.', '-').lower() for r in sorted(inst_reqs))
                 lines_after.append('# WARNING: the following rdepends are from setuptools install_requires. These')
                 lines_after.append('# upstream names may not correspond exactly to bitbake package names.')
                 lines_after.append('RDEPENDS_${{PN}} += "{}"'.format(' '.join(inst_req_deps)))
 
+        if mapped_deps:
+            name = info.get('Name')
+            if name and name[0] in mapped_deps:
+                # Attempt to avoid self-reference
+                mapped_deps.remove(name[0])
+            mapped_deps -= set(self.excluded_pkgdeps)
+            if inst_reqs or extras_req:
+                lines_after.append('')
+            lines_after.append('# WARNING: the following rdepends are determined through basic analysis of the')
+            lines_after.append('# python sources, and might not be 100% accurate.')
+            lines_after.append('RDEPENDS_${{PN}} += "{}"'.format(' '.join(sorted(mapped_deps))))
+
+        unmapped_deps -= set(extensions)
+        unmapped_deps -= set(self.assume_provided)
+        if unmapped_deps:
+            if mapped_deps:
+                lines_after.append('')
+            lines_after.append('# WARNING: We were unable to map the following python package/module')
+            lines_after.append('# dependencies to the bitbake packages which include them:')
+            lines_after.extend('#    {}'.format(d) for d in sorted(unmapped_deps))
+
         handled.append('buildsystem')
 
     def get_pkginfo(self, pkginfo_fn):
@@ -425,6 +459,132 @@ class PythonRecipeHandler(RecipeHandler):
                 if value != new_list:
                     info[variable] = new_list
 
+    def scan_setup_python_deps(self, srctree, setup_info, setup_non_literals):
+        if 'Package-dir' in setup_info:
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
+                    try:
+                        package, module = module.rsplit('.', 1)
+                    except ValueError:
+                        package, module = '.', module
+                    module_path = os.path.join(pd.get_package_dir(package), module + '.py')
+                    to_scan.append(module_path)
+
+            if 'Packages' in setup_info:
+                for package in setup_info['Packages']:
+                    to_scan.append(pd.get_package_dir(package))
+
+            if 'Scripts' in setup_info:
+                to_scan.extend(setup_info['Scripts'])
+        else:
+            logger.info("Scanning the entire source tree, as one or more of the following setup keywords are non-literal: py_modules, scripts, packages.")
+
+        if not to_scan:
+            to_scan = ['.']
+
+        logger.info("Scanning paths for packages & dependencies: %s", ', '.join(to_scan))
+
+        provided_packages = self.parse_pkgdata_for_python_packages()
+        scanned_deps = self.scan_python_dependencies([os.path.join(srctree, p) for p in to_scan])
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
+                        relstart, _, relremaining = relpath.partition(os.sep)
+                        if relstart.endswith('.egg'):
+                            relpath = relremaining
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
2.2.1


