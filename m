Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9549.1795191704671734021
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 08:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=V9vlLLpw;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B5851575
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 08:21:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C0AF3F882
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 08:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795191704; bh=dMM5kPS06Bp7T0Q7sqX+Oj7GGpLmXLAisAewKhOE+9U=;
	h=From:To:Subject:Date:From;
	b=V9vlLLpwofmLJBsOgFJNTDP+yfn5m/P/hKY4nR2gDuO8DXsPIl5qk+HXKnHgGYqYt
	 Rm1DGgPjO252r57D/S0E9Rf5jk6Q+YBd5JGnysI2kdwYxCzYAW1Qi1IkEwHG54vWzD
	 bRX2RJ0DDSFuq9SkY10CBg5T8Mu74OrEc96giC7U=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: compile .pyc at packaging time, remove from manifest
Date: Fri, 20 Nov 2026 16:21:42 +0000
Message-ID: <20261120162142.3530035-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 16:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250815
Content-Type: text/plain; charset="utf-8"

Currently, the manifest lists both .py files and compiled .pyc files.
This results in a large amount of duplication and potential for files to
end up in the wrong package.

Improve this by not installing the .pyc files directly, and instead
using python's compileall module (as upstream's 'make install' does) to
build them at packaging time.  We can do this after the packages have
been split, so the .pyc files are always in the right package.

This means we can remove the cache file logic from create_manifest, and
all of the cached file lists in the manifest itself.

We patch out the standard library compilation at install time to avoid
doing that twice, this is important as the compilation takes ~30s on my
build machine. There is work upstream to make this optional, so we don't
need to carry a patch in the future.

The only change to the end result is that the target sysroot for Python
is now missing the .pyc files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3/create_manifest3.py        |  55 +---
 .../python/python3/get_module_deps3.py        |  15 -
 .../python/python3/no-compile-pyc.patch       |  26 ++
 .../python/python3/python3-manifest.json      | 301 ++----------------
 .../recipes-devtools/python/python3_3.15.2.bb |  68 ++--
 5 files changed, 90 insertions(+), 375 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/no-compile-pyc.p=
atch

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/m=
eta/recipes-devtools/python/python3/create_manifest3.py
index 8ba51a2a0c3..ec8ffa16148 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -30,12 +30,6 @@
 # Its also important to note that this method only works for python file=
s, and shared
 # libraries. Static libraries, header files and binaries need to be deal=
t with manually.
 #
-# This script differs from its python2 version mostly on how shared libr=
aries are handled
-# The manifest file for python3 has an extra field which contains the ca=
ched files for
-# each package.
-# Tha method to handle cached files does not work when a module includes=
 a folder which
-# itself contains the pycache folder, gladly this is almost never the ca=
se.
-#
 # Author: Alejandro Enedino Hernandez Samaniego <alejandro at enedino do=
t org>
=20
=20
@@ -76,12 +70,6 @@ def isFolder(value):
     else:
         return False
=20
-def isCached(item):
-    if '__pycache__' in item:
-        return True
-    else:
-        return False
-
 def prepend_comments(comments, json_manifest):
     with open(json_manifest, 'r+') as manifest:
         json_contents =3D manifest.read()
@@ -132,12 +120,8 @@ for coredep in output.split():
     if is_dependency_skipped(old_manifest['core'], "core", coredep):
         continue
     coredep =3D coredep.replace(pyversion,'${PYTHON_MAJMIN}')
-    if isCached(coredep):
-        if coredep not in old_manifest['core']['cached']:
-            old_manifest['core']['cached'].append(coredep)
-    else:
-        if coredep not in old_manifest['core']['files']:
-            old_manifest['core']['files'].append(coredep)
+    if coredep not in old_manifest['core']['files']:
+        old_manifest['core']['files'].append(coredep)
=20
=20
 # The second step is to loop through the existing files contained in the=
 core package
@@ -148,12 +132,8 @@ for coredep in output.split():
=20
 for filedep in old_manifest['core']['files']:
     if isFolder(filedep):
-        if isCached(filedep):
-            if filedep not in old_manifest['core']['cached']:
-                old_manifest['core']['cached'].append(filedep)
-        else:
-            if filedep not in old_manifest['core']['files']:
-                old_manifest['core']['files'].append(filedep)
+        if filedep not in old_manifest['core']['files']:
+            old_manifest['core']['files'].append(filedep)
         continue
     if '${bindir}' in filedep:
         if filedep not in old_manifest['core']['files']:
@@ -186,12 +166,8 @@ for filedep in old_manifest['core']['files']:
             continue
         pymodule_dep =3D pymodule_dep.replace(pyversion,'${PYTHON_MAJMIN=
}')
=20
-        if isCached(pymodule_dep):
-            if pymodule_dep not in old_manifest['core']['cached']:
-                old_manifest['core']['cached'].append(pymodule_dep)
-        else:
-            if pymodule_dep not in old_manifest['core']['files']:
-                old_manifest['core']['files'].append(pymodule_dep)
+        if pymodule_dep not in old_manifest['core']['files']:
+            old_manifest['core']['files'].append(pymodule_dep)
=20
=20
 # At this point we are done with the core package.
@@ -247,12 +223,10 @@ for pypkg in old_manifest:
     if "skip_depends" in old_manifest[pypkg]:
         new_manifest[pypkg]['skip_depends'] =3D old_manifest[pypkg]['ski=
p_depends']
     new_manifest[pypkg]['files'] =3D []
-    new_manifest[pypkg]['cached'] =3D old_manifest[pypkg]['cached']
=20
     # All packages should depend on core
     if pypkg !=3D 'core':
         new_manifest[pypkg]['rdepends'].append('core')
-        new_manifest[pypkg]['cached'] =3D []
=20
     print('\n')
     print('--------------------------')
@@ -352,7 +326,7 @@ for pypkg in old_manifest:
                     for pypkg_with_folder in hasfolders:
                         if (folderFound =3D=3D False):
                             # print('Checking folder %s on package %s' %=
 (pymodule_dep,pypkg_with_folder))
-                            for folder_dep in old_manifest[pypkg_with_fo=
lder]['files'] or folder_dep in old_manifest[pypkg_with_folder]['cached']=
:
+                            for folder_dep in old_manifest[pypkg_with_fo=
lder]['files']:
                                 if folder_dep =3D=3D folder:
                                     print ('%s directory found in %s' % =
(folder, pypkg_with_folder))
                                     folderFound =3D True
@@ -369,16 +343,13 @@ for pypkg in old_manifest:
=20
             # No directories beyond this point
             # We might already have this module on the dictionary since =
it could depend on a (previously checked) module
-            if pymodule_dep not in new_manifest[pypkg]['files'] and pymo=
dule_dep not in new_manifest[pypkg]['cached']:
+            if pymodule_dep not in new_manifest[pypkg]['files']:
                 # Handle core as a special package, we already did it so=
 we pass it to NEW data structure directly
                 if pypkg =3D=3D 'core':
                     print('Adding %s to %s FILES' % (pymodule_dep, pypkg=
))
                     if pymodule_dep.endswith('*'):
                         wildcards.append(pymodule_dep)
-                    if isCached(pymodule_dep):
-                        new_manifest[pypkg]['cached'].append(pymodule_de=
p)
-                    else:
-                        new_manifest[pypkg]['files'].append(pymodule_dep=
)
+                    new_manifest[pypkg]['files'].append(pymodule_dep)
=20
                     # Check for repeated files
                     if pymodule_dep not in allfiles:
@@ -396,7 +367,7 @@ for pypkg in old_manifest:
                     for possible_rdep in old_manifest:
                         # Debug
                         # print('Checking %s ' % pymodule_dep + ' in %s'=
 % possible_rdep)
-                        if pymodule_dep in old_manifest[possible_rdep]['=
files'] or pymodule_dep in old_manifest[possible_rdep]['cached']:
+                        if pymodule_dep in old_manifest[possible_rdep]['=
files']:
                             # Since were nesting, we need to check its n=
ot the same pypkg
                             if(possible_rdep !=3D pypkg):
                                 if possible_rdep not in new_manifest[pyp=
kg]['rdepends']:
@@ -411,10 +382,7 @@ for pypkg in old_manifest:
                       # A module shouldn't contain itself (${libdir}/pyt=
hon3/sqlite3 shouldnt be on sqlite3 files)
                       if os.path.basename(pymodule_dep) !=3D pypkg:
                         reportFILES.append(('Adding %s to %s FILES\n' % =
(pymodule_dep, pypkg)))
-                        if isCached(pymodule_dep):
-                            new_manifest[pypkg]['cached'].append(pymodul=
e_dep)
-                        else:
-                            new_manifest[pypkg]['files'].append(pymodule=
_dep)
+                        new_manifest[pypkg]['files'].append(pymodule_dep=
)
                         if pymodule_dep.endswith('*'):
                             wildcards.append(pymodule_dep)
                         if pymodule_dep not in allfiles:
@@ -441,7 +409,6 @@ print(hasfolders)
 # Sort it just so it looks nicer
 for pypkg in new_manifest:
     new_manifest[pypkg]['files'].sort()
-    new_manifest[pypkg]['cached'].sort()
     new_manifest[pypkg]['rdepends'].sort()
     new_manifest[pypkg]['rprovides'].sort()
     # Remove empty sections
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/m=
eta/recipes-devtools/python/python3/get_module_deps3.py
index 28b5d22c458..f26d9b20b4b 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -140,20 +140,5 @@ for item in dif:
     # Prints out result, which is what will be used by create_manifest
     print (dep_path)
=20
-
-    cpython_tag =3D sys.implementation.cache_tag
-    cached =3D ''
-    if debug =3D=3D True:
-        log.write('\nGetting cached attribute for %s\n' % item)
-    cached =3D sys.modules['%s' % item].__spec__.cached
-    if cached is not None:
-        if debug =3D=3D True:
-            log.write(cached + '\n')
-        cached =3D fix_path(cached)
-        cached =3D cached.replace(cpython_tag,'*')
-        if "_sysconfigdata" in cached:
-            cached =3D cached.replace(sysconfig._get_sysconfigdata_name(=
), "_sysconfigdata*")
-        print (cached)
-
 if debug =3D=3D True:
     log.close()
diff --git a/meta/recipes-devtools/python/python3/no-compile-pyc.patch b/=
meta/recipes-devtools/python/python3/no-compile-pyc.patch
new file mode 100644
index 00000000000..dfaa417f2f6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/no-compile-pyc.patch
@@ -0,0 +1,26 @@
+Don't compile the standard library to .pyc files, we'll do that at packa=
ging instead.
+
+Upstream-Status: Inappropriate [https://github.com/python/cpython/issues=
/160835]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/Makefile.pre.in w/Makefile.pre.in
+index 243959a..89c4805 100644
+--- i/Makefile.pre.in
++++ w/Makefile.pre.in
+@@ -2922,16 +2922,6 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c liba=
install
+ 		echo "Applying app store compliance patch"; \
+ 		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej=
" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(A=
PP_STORE_COMPLIANCE_PATCH)" || true ; \
+ 	fi
+-	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
+-	-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED_FOR_BUILD) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED_FOR_BUILD) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+=20
+ # bpo-21536: Misc/python-config.sh is generated in the build directory
+ # from $(srcdir)Misc/python-config.sh.in.
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 7a7f7db9b20..47f4056da40 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -100,8 +100,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/*/tests",
             "${libdir}/python${PYTHON_MAJMIN}/idlelib/idle_test/",
             "${libdir}/python${PYTHON_MAJMIN}/test"
-        ],
-        "cached": []
+        ]
     },
     "asyncio": {
         "summary": "Python Asynchronous I/O",
@@ -118,8 +117,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/asyncio",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
-        ],
-        "cached": []
+        ]
     },
     "audio": {
         "summary": "Python Audio Handling",
@@ -128,9 +126,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/wave.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
         ]
     },
     "codecs": {
@@ -140,8 +135,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecode=
c.*.so"
-        ],
-        "cached": []
+        ]
     },
     "compile": {
         "summary": "Python bytecode compilation support",
@@ -152,11 +146,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
             "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
             "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.p=
yc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.p=
yc"
         ]
     },
     "compression": {
@@ -175,12 +164,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lzma.py",
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
             "${libdir}/python${PYTHON_MAJMIN}/zipfile"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
         ]
     },
     "core": {
@@ -344,113 +327,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py",
             "${libdir}/python${PYTHON_MAJMIN}/zipimport.py",
             "${prefix}/lib/python${PYTHON_MAJMIN}/config*/*[!.a]"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.p=
yc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_ast_unparse.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_a=
bc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_colorize.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_missing_stdli=
b_info.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_opcode_metada=
ta.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_py_warnings.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.=
*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata=
*.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/annotationlib.=
*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.p=
yc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ntpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pathlib.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.=
*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.p=
yc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.p=
yc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipimport.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__/pager.=
*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/ab=
c.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/alia=
ses.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/lati=
n_1.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_=
8.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/_abc=
.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.=
*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/mach=
inery.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util=
.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_abc.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_local=
.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/_os.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/pathlib/__pycache__/types.=
*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_casefix.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_compiler.*=
.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_constants.=
*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/re/__pycache__/_parser.*.p=
yc",
-            "${libdir}/python${PYTHON_MAJMIN}/sysconfig/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__/parse.*=
.pyc"
         ]
     },
     "crypt": {
@@ -466,9 +342,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
         ]
     },
     "ctypes": {
@@ -483,8 +356,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/ctypes",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes_test.*=
.so"
-        ],
-        "cached": []
+        ]
     },
     "curses": {
         "summary": "Python curses support",
@@ -495,8 +367,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/curses",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses_panel.=
*.so"
-        ],
-        "cached": []
+        ]
     },
     "datetime": {
         "summary": "Python calendar and time support",
@@ -507,11 +378,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
             "${libdir}/python${PYTHON_MAJMIN}/datetime.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc=
"
         ]
     },
     "db": {
@@ -522,8 +388,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/dbm",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
-        ],
-        "cached": []
+        ]
     },
     "debugger": {
         "summary": "Python debugger",
@@ -545,14 +410,9 @@
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_remote_debugg=
ing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
         ]
     },
     "dev": {
-        "cached": [],
         "files": [
             "${base_libdir}/*.a",
             "${base_libdir}/*.o",
@@ -578,9 +438,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
         ]
     },
     "doctest": {
@@ -604,9 +461,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
         ]
     },
     "email": {
@@ -623,9 +477,6 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
             "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
         ]
     },
     "ensurepip": {
@@ -635,8 +486,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ensurepip/"
-        ],
-        "cached": []
+        ]
     },
     "gdbm": {
         "summary": "Python GNU database support",
@@ -645,8 +495,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
-        ],
-        "cached": []
+        ]
     },
     "html": {
         "summary": "Python HTML processing support",
@@ -655,8 +504,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/html"
-        ],
-        "cached": []
+        ]
     },
     "idle": {
         "summary": "Python Integrated Development Environment",
@@ -666,8 +514,7 @@
         "files": [
             "${bindir}/idle*",
             "${libdir}/python${PYTHON_MAJMIN}/idlelib"
-        ],
-        "cached": []
+        ]
     },
     "image": {
         "summary": "Python graphical image handling",
@@ -676,9 +523,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/colorsys.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc=
"
         ]
     },
     "io": {
@@ -697,12 +541,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/socket.py",
             "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
             "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc=
"
         ]
     },
     "json": {
@@ -713,8 +551,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/json",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
-        ],
-        "cached": []
+        ]
     },
     "logging": {
         "summary": "Python logging support",
@@ -728,8 +565,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/logging"
-        ],
-        "cached": []
+        ]
     },
     "mailbox": {
         "summary": "Python mailbox format support",
@@ -745,9 +581,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
         ]
     },
     "math": {
@@ -759,9 +592,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/random.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
         ]
     },
     "mime": {
@@ -771,9 +601,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/quopri.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc"
         ]
     },
     "mmap": {
@@ -783,11 +610,9 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/mmap.*.so"
-        ],
-        "cached": []
+        ]
     },
     "modules": {
-        "cached": [],
         "files": [],
         "rdepends": [
             "asyncio",
@@ -863,8 +688,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessi=
ng.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_posixshmem.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
-        ],
-        "cached": []
+        ]
     },
     "netclient": {
         "summary": "Python Internet Protocol clients",
@@ -892,16 +716,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/smtplib.py",
             "${libdir}/python${PYTHON_MAJMIN}/urllib",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/secrets.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
         ]
     },
     "netserver": {
@@ -912,9 +726,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*=
.pyc"
         ]
     },
     "numbers": {
@@ -929,13 +740,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/fractions.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.p=
yc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.py=
c",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
         ]
     },
     "pickle": {
@@ -949,12 +753,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/pickle.py",
             "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
             "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle=
.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.=
pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
         ]
     },
     "plistlib": {
@@ -966,9 +764,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc=
"
         ]
     },
     "pprint": {
@@ -978,9 +773,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
         ]
     },
     "profile": {
@@ -996,14 +788,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing",
             "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing/_utils.p=
y",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/profiling/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing/__pycach=
e__",
-            "${libdir}/python${PYTHON_MAJMIN}/profiling/tracing/__pycach=
e__/_utils.*.pyc"
         ]
     },
     "pydoc": {
@@ -1015,9 +799,6 @@
             "${bindir}/pydoc*",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
         ]
     },
     "resource": {
@@ -1027,8 +808,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
-        ],
-        "cached": []
+        ]
     },
     "shell": {
         "summary": "Python shell-like functionality",
@@ -1038,10 +818,6 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
             "${libdir}/python${PYTHON_MAJMIN}/shlex.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc"
         ]
     },
     "sqlite3": {
@@ -1053,8 +829,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so"=
,
             "${libdir}/python${PYTHON_MAJMIN}/sqlite3"
-        ],
-        "cached": []
+        ]
     },
     "statistics": {
         "summary": "Basic statistics module",
@@ -1066,9 +841,6 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_statistics.*.=
so",
             "${libdir}/python${PYTHON_MAJMIN}/statistics.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/statistics.*.p=
yc"
         ]
     },
     "stringold": {
@@ -1079,8 +851,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/string",
             "${libdir}/python${PYTHON_MAJMIN}/string/__pycache__"
-        ],
-        "cached": []
+        ]
     },
     "syslog": {
         "summary": "Python syslog interface",
@@ -1089,8 +860,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
-        ],
-        "cached": []
+        ]
     },
     "terminal": {
         "summary": "Python terminal controlling support",
@@ -1101,10 +871,6 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pty.py",
             "${libdir}/python${PYTHON_MAJMIN}/tty.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
         ]
     },
     "threading": {
@@ -1116,10 +882,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/queue.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_loc=
al.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
         ]
     },
     "tkinter": {
@@ -1129,8 +891,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
-        ],
-        "cached": []
+        ]
     },
     "tomllib": {
         "summary": "Provides an interface for parsing TOML",
@@ -1139,8 +900,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/tomllib/"
-        ],
-        "cached": []
+        ]
     },
     "unittest": {
         "summary": "Python unit testing framework",
@@ -1159,8 +919,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/unittest",
             "${libdir}/python${PYTHON_MAJMIN}/unittest/",
             "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
-        ],
-        "cached": []
+        ]
     },
     "unixadmin": {
         "summary": "Python Unix administration support",
@@ -1170,9 +929,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/getpass.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ]
     },
     "venv": {
@@ -1187,8 +943,7 @@
         "files": [
             "${bindir}/pyvenv*",
             "${libdir}/python${PYTHON_MAJMIN}/venv"
-        ],
-        "cached": []
+        ]
     },
     "xml": {
         "summary": "Python basic XML support",
@@ -1199,8 +954,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_elementtree.*=
.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/pyexpat.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/xml"
-        ],
-        "cached": []
+        ]
     },
     "xmlrpc": {
         "summary": "Python XML-RPC support",
@@ -1222,8 +976,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
             "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
-        ],
-        "cached": []
+        ]
     },
     "zipapp": {
         "summary": "Tools to manage the creation of zip files containing=
 Python code",
@@ -1233,9 +986,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/zipapp.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipapp.*.pyc"
         ]
     },
     "zoneinfo": {
@@ -1247,7 +997,6 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zoneinfo.*.so=
",
             "${libdir}/python${PYTHON_MAJMIN}/zoneinfo"
-        ],
-        "cached": []
+        ]
     }
 }
diff --git a/meta/recipes-devtools/python/python3_3.15.2.bb b/meta/recipe=
s-devtools/python/python3_3.15.2.bb
index da59f0e8bb2..74b053eb746 100644
--- a/meta/recipes-devtools/python/python3_3.15.2.bb
+++ b/meta/recipes-devtools/python/python3_3.15.2.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-3.15-gh-158097-Make-test_staggered_race_with_eage=
r_t.patch \
            file://0001-3.15-gh-160924-Don-t-run-the-build-Python-with-RU=
NSH.patch \
            file://0001-gh-160881-Fix-test_is_python_process_non_python_s=
ubp.patch \
+           file://no-compile-pyc.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
@@ -136,24 +137,10 @@ EOF
=20
 CPPFLAGS +=3D "-I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
=20
-# COMPILEALL_OPTS=3D ensures that .pyc are not compiled in parallel
-# This was found to lock up builds, break reproducibility, and produce s=
trange file ownership
-# races.
-#
-# The upstream commit introducing the change was:
-# https://github.com/python/cpython/commit/1a2dd82f56bd813aacc570e172cef=
e55a8a41504
-#
-# The build lock up issue is reported here:
-# https://bugs.python.org/issue45945
-#
-# The repro failures are documented here:
-# https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211130-y=
r_o1a8d/packages/diff-html/
-
 EXTRA_OEMAKE =3D '\
   STAGING_LIBDIR=3D${STAGING_LIBDIR} \
   STAGING_INCDIR=3D${STAGING_INCDIR} \
   LIB=3D${baselib} \
-  COMPILEALL_OPTS=3D \
 '
=20
 # Generate a Profile Guided Optimisation wrapper script that uses qemu-u=
ser for
@@ -193,15 +180,6 @@ do_install:append:class-native() {
         # buffer is 128 bytes long).
         ln -s python3-native/python3 ${D}${bindir}/nativepython3
=20
-        # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000=
 of them
-        # and the overhead in each recipe-sysroot-native isn't worth it,=
 particularly
-        # when they're only used for python called with -O or -OO.
-        #find ${D} -name *opt-*.pyc -delete
-        # Remove all pyc files. There are a ton of them and it is probab=
ly faster to let
-        # python create the ones it wants at runtime rather than manage =
in the sstate
-        # tarballs and sysroot creation.
-        find ${D} -name *.pyc -delete
-
         # Nothing should be looking into ${B} for python3-native
         sed -i -e 's:${B}:/build/path/unavailable/:g' \
                 ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MA=
JMIN}${PYTHON_ABI}*/Makefile
@@ -214,8 +192,6 @@ do_install:append:class-native() {
 }
=20
 do_install:append() {
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfi=
gdata*.cpython*
-
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=3D"${D}${libdir}/python${PYTHON_MAJMIN}/_sysconfig=
*.py"
         sed -i \
@@ -230,11 +206,6 @@ do_install:append() {
                 -e "s,${B},/build/path/unavailable/,g" \
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigd=
ata.py
-
-        # Remove the opt-1.pyc and opt-2.pyc files. They effectively was=
te space on embedded
-        # style targets as they're only used when python is called with =
the -O or -OO options
-        # which is rare.
-        find ${D} -name *opt-*.pyc -delete
 }
=20
 do_install:append:class-nativesdk () {
@@ -345,6 +316,9 @@ provide_target_config_script() {
         install -d ${SYSROOT_DESTDIR}${prefix}/python-target-config/
         install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${prefi=
x}/python-target-config/
         install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_D=
ESTDIR}/${prefix}/python-target-config/
+        # Compile the sysconfigdata in the target sysroot as it will be =
generated if
+        # python3targetconfig is inherited.
+        python3 -mcompileall ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_=
MAJMIN}/_sysconfigdata*.py -s ${SYSROOT_DESTDIR} -p /
 }
 SYSROOT_DIRS +=3D "${prefix}/python-target-config/"
=20
@@ -377,11 +351,6 @@ py_package_preprocess () {
                 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars=
*.json \
                 ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
=20
-        # Recompile _sysconfigdata after modifying it
-        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata=
*.py; do
-            python3 -mcompileall $c -s ${PKGD} -p /
-        done
-
         mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bin=
dir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
=20
         #Remove the unneeded copy of target sysconfig data
@@ -391,9 +360,33 @@ py_package_preprocess () {
         sed -i -e 's:${BUILD_ARCH}-${HOST_OS}:${HOST_ARCH}-${HOST_OS}:g'=
 ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/build-details.json
 }
=20
+# Compile the .py files in PKGDEST to .pyc. This is done during do_packa=
ge so the .pyc files
+# are always packaged with the .py.
+py_compile_py() {
+        if [ "${INCLUDE_PYCS}" !=3D "0" ]; then
+            bbnote Compiling python bytecode...
+            # Need to do each package individually so we can strip the c=
orrect path prefix
+            for dir in $(find ${PKGDEST} -type d -maxdepth 1); do
+                # Currently compileall isn't deterministic when ran
+                # in parallel so we can't yet pass -j.
+                # https://github.com/python/cpython/issues/129724
+                nativepython3 -mcompileall \
+                    -f -s $dir -p / -x 'bad_coding|badsyntax' \
+                    $dir
+
+                # the rpm packaging class reads file _lists_ from packag=
es-split/ but file _content_ from package/
+                cd $dir
+                find . -type f -name '*.pyc' -print -exec cp --target-di=
rectory=3D${PKGD} --link --parents {} +
+                cd -
+            done
+        fi
+}
+PACKAGESPLITFUNCS +=3D "py_compile_py"
+
 # We want bytecode precompiled .py files (.pyc's) by default
 # but the user may set it on their own conf
 INCLUDE_PYCS ?=3D "1"
+INCLUDE_PYCS:class-native =3D "0"
=20
 python(){
     import json
@@ -448,11 +441,6 @@ python(){
         for value in python_manifest[key]['files']:
             d.appendVar('FILES:' + pypackage, ' ' + value)
=20
-        # Add cached files
-        if include_pycs =3D=3D '1':
-            for value in python_manifest[key]['cached']:
-                    d.appendVar('FILES:' + pypackage, ' ' + value)
-
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
             if '${PN}' in value:
--=20
2.43.0

