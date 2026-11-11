Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10405.1794406652451998298
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 06:17:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=U0/9PB3i;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0C0B1576
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:28 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F6BA3F632
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794406651; bh=oMIWQ7tXVMzW6YfC0G5uU6Kui6kzaz7n+ZGhOZ33o8I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U0/9PB3iYWLpVq5yXQFxUXV4O1vpjg/W2AGPDb82Ag9dXEaWwRFTNPnSz5nQqUUlj
	 8XSq9apTB1atAVr+sDY24z9xigca7WCm/NlcHqeWYoz29DaTmpdoUI637PvbMZTUzb
	 Ux5WfcbRtS/+62feFFa0f4R8+gOCC5rifvzy8bZE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/6] python3: compile .pyc at packaging time, remove from manifest
Date: Wed, 11 Nov 2026 14:17:22 +0000
Message-ID: <20261111141726.1496785-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111141726.1496785-1-ross.burton@arm.com>
References: <20261111141726.1496785-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 14:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250031
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
 .../python/python3/get_module_deps3.py        |  29 --
 .../python/python3/no-compile-pyc.patch       |  26 ++
 .../python/python3/python3-manifest.json      | 301 ++----------------
 .../python/python3_3.14.10.bb                 |  63 ++--
 5 files changed, 87 insertions(+), 387 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/no-compile-pyc.p=
atch

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/m=
eta/recipes-devtools/python/python3/create_manifest3.py
index 288d5ede3a2..5dda382de8f 100644
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
@@ -77,12 +71,6 @@ def isFolder(value):
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
@@ -123,12 +111,8 @@ print_indent('Getting dependencies for package: core=
', 0)
 output =3D subprocess.check_output([sys.executable, 'get_module_deps3.py=
', 'python-core-package', '%s' % debugFlag]).decode('utf8')
 for coredep in output.split():
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
@@ -139,12 +123,8 @@ for coredep in output.split():
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
@@ -175,12 +155,8 @@ for filedep in old_manifest['core']['files']:
     for pymodule_dep in output.split():
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
@@ -223,12 +199,10 @@ for pypkg in old_manifest:
     new_manifest[pypkg]['summary'] =3D old_manifest[pypkg]['summary']
     new_manifest[pypkg]['rdepends'] =3D []
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
@@ -334,7 +308,7 @@ for pypkg in old_manifest:
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
@@ -351,16 +325,13 @@ for pypkg in old_manifest:
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
@@ -378,7 +349,7 @@ for pypkg in old_manifest:
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
@@ -393,10 +364,7 @@ for pypkg in old_manifest:
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
@@ -423,7 +391,6 @@ print(hasfolders)
 # Sort it just so it looks nicer
 for pypkg in new_manifest:
     new_manifest[pypkg]['files'].sort()
-    new_manifest[pypkg]['cached'].sort()
     new_manifest[pypkg]['rdepends'].sort()
=20
 # Create the manifest from the data structure that was built
diff --git a/meta/recipes-devtools/python/python3/get_module_deps3.py b/m=
eta/recipes-devtools/python/python3/get_module_deps3.py
index 8e432b49af8..9b4251af485 100644
--- a/meta/recipes-devtools/python/python3/get_module_deps3.py
+++ b/meta/recipes-devtools/python/python3/get_module_deps3.py
@@ -141,34 +141,5 @@ for item in dif:
     print (dep_path)
=20
=20
-    cpython_tag =3D sys.implementation.cache_tag
-    cached =3D ''
-    # Theres no naive way to find *.pyc files on python3
-    try:
-        if debug =3D=3D True:
-            log.write('\nCalling: sys.modules[' + '%s' % item + '].__cac=
hed__\n')
-        cached =3D sys.modules['%s' % item].__cached__
-    except AttributeError as e:
-        # Deals with thread (builtin module) not having __cached__ attri=
bute
-        if debug =3D=3D True:
-            log.write(item + ' ')
-            log.write(str(e))
-            log.write('\n')
-        pass
-    except NameError as e:
-        # Deals with NameError: name 'cached' is not defined
-        if debug =3D=3D True:
-            log.write(item+' ')=20
-            log.write(str(e))                                           =
  =20
-        pass
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
index 00000000000..e95458f8a51
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
+index 3d12153cb6c..b32eef4810a 100644
+--- i/Makefile.pre.in
++++ w/Makefile.pre.in
+@@ -2829,16 +2829,6 @@ libinstall:	all $(srcdir)/Modules/xxmodule.c
+ 		echo "Applying app store compliance patch"; \
+ 		patch --force --reject-file "$(abs_builddir)/app-store-compliance.rej=
" --strip 2 --directory "$(DESTDIR)$(LIBDEST)" --input "$(abs_srcdir)/$(A=
PP_STORE_COMPLIANCE_PATCH)" || true ; \
+ 	fi
+-	@ # Build PYC files for the 3 optimization levels (0, 1, 2)
+-	-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=3D$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-o 0 -o 1 -o 2 $(COMPILEALL_OPTS) -d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+=20
+ # bpo-21536: Misc/python-config.sh is generated in the build directory
+ # from $(srcdir)Misc/python-config.sh.in.
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 50fdf5d0eae..4cfbbf978d1 100644
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
             "${libdir}/python${PYTHON_MAJMIN}/concurrent",
             "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_asyncio.*.so"
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
@@ -170,10 +159,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/zipfile/",
             "${libdir}/python${PYTHON_MAJMIN}/compression/",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zstd.*.so"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc"
         ]
     },
     "core": {
@@ -322,112 +307,6 @@
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
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
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
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
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
@@ -443,9 +322,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha1.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha2.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
         ]
     },
     "ctypes": {
@@ -459,8 +335,7 @@
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
@@ -471,8 +346,7 @@
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
@@ -484,11 +358,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
             "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so=
"
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
@@ -499,8 +368,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/dbm",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
-        ],
-        "cached": []
+        ]
     },
     "debugger": {
         "summary": "Python debugger",
@@ -513,14 +381,9 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
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
@@ -546,9 +409,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
         ]
     },
     "doctest": {
@@ -564,9 +424,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
         ]
     },
     "email": {
@@ -583,9 +440,6 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/email",
             "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
         ]
     },
     "ensurepip": {
@@ -595,8 +449,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ensurepip/"
-        ],
-        "cached": []
+        ]
     },
     "fcntl": {
         "summary": "Python's fcntl interface",
@@ -605,8 +458,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
-        ],
-        "cached": []
+        ]
     },
     "gdbm": {
         "summary": "Python GNU database support",
@@ -615,8 +467,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
-        ],
-        "cached": []
+        ]
     },
     "html": {
         "summary": "Python HTML processing support",
@@ -625,8 +476,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/html"
-        ],
-        "cached": []
+        ]
     },
     "idle": {
         "summary": "Python Integrated Development Environment",
@@ -636,8 +486,7 @@
         "files": [
             "${bindir}/idle*",
             "${libdir}/python${PYTHON_MAJMIN}/idlelib"
-        ],
-        "cached": []
+        ]
     },
     "image": {
         "summary": "Python graphical image handling",
@@ -646,9 +495,6 @@
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
@@ -666,12 +512,6 @@
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
@@ -682,8 +522,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/json",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
-        ],
-        "cached": []
+        ]
     },
     "logging": {
         "summary": "Python logging support",
@@ -697,8 +536,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/logging"
-        ],
-        "cached": []
+        ]
     },
     "mailbox": {
         "summary": "Python mailbox format support",
@@ -714,9 +552,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
         ]
     },
     "math": {
@@ -728,9 +563,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/random.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
         ]
     },
     "mime": {
@@ -740,9 +572,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/quopri.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc"
         ]
     },
     "mmap": {
@@ -752,11 +581,9 @@
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
@@ -832,8 +659,7 @@
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
@@ -860,16 +686,6 @@
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
@@ -880,9 +696,6 @@
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
@@ -898,13 +711,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*=
.so",
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
@@ -918,12 +724,6 @@
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
     "pkgutil": {
@@ -931,8 +731,7 @@
         "rdepends": [
             "core"
         ],
-        "files": [],
-        "cached": []
+        "files": []
     },
     "plistlib": {
         "summary": "Generate and parse Mac OS X .plist files",
@@ -943,9 +742,6 @@
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
@@ -955,9 +751,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
         ]
     },
     "profile": {
@@ -970,11 +763,6 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc=
",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc"=
,
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
         ]
     },
     "pydoc": {
@@ -986,9 +774,6 @@
             "${bindir}/pydoc*",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
         ]
     },
     "resource": {
@@ -998,8 +783,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
-        ],
-        "cached": []
+        ]
     },
     "shell": {
         "summary": "Python shell-like functionality",
@@ -1010,10 +794,6 @@
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
@@ -1025,8 +805,7 @@
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
@@ -1038,9 +817,6 @@
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
@@ -1051,8 +827,7 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/string",
             "${libdir}/python${PYTHON_MAJMIN}/string/__pycache__"
-        ],
-        "cached": []
+        ]
     },
     "syslog": {
         "summary": "Python syslog interface",
@@ -1061,8 +836,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
-        ],
-        "cached": []
+        ]
     },
     "terminal": {
         "summary": "Python terminal controlling support",
@@ -1073,10 +847,6 @@
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
@@ -1088,10 +858,6 @@
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
@@ -1101,8 +867,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
-        ],
-        "cached": []
+        ]
     },
     "tomllib": {
         "summary": "Provides an interface for parsing TOML",
@@ -1111,8 +876,7 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/tomllib/"
-        ],
-        "cached": []
+        ]
     },
     "unittest": {
         "summary": "Python unit testing framework",
@@ -1131,8 +895,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/unittest",
             "${libdir}/python${PYTHON_MAJMIN}/unittest/",
             "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
-        ],
-        "cached": []
+        ]
     },
     "unixadmin": {
         "summary": "Python Unix administration support",
@@ -1142,9 +905,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/getpass.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
         ]
     },
     "venv": {
@@ -1157,8 +917,7 @@
         "files": [
             "${bindir}/pyvenv*",
             "${libdir}/python${PYTHON_MAJMIN}/venv"
-        ],
-        "cached": []
+        ]
     },
     "xml": {
         "summary": "Python basic XML support",
@@ -1169,8 +928,7 @@
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
@@ -1192,8 +950,7 @@
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
@@ -1203,9 +960,6 @@
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/zipapp.py"
-        ],
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipapp.*.pyc"
         ]
     },
     "zoneinfo": {
@@ -1217,7 +971,6 @@
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_zoneinfo.*.so=
",
             "${libdir}/python${PYTHON_MAJMIN}/zoneinfo"
-        ],
-        "cached": []
+        ]
     }
 }
diff --git a/meta/recipes-devtools/python/python3_3.14.10.bb b/meta/recip=
es-devtools/python/python3_3.14.10.bb
index 28e67330d1a..c57868bf709 100644
--- a/meta/recipes-devtools/python/python3_3.14.10.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch \
            file://0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.pa=
tch \
            file://0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_g=
ot_eof.patch \
+           file://no-compile-pyc.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
@@ -135,24 +136,10 @@ EOF
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
@@ -192,15 +179,6 @@ do_install:append:class-native() {
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
@@ -213,8 +191,6 @@ do_install:append:class-native() {
 }
=20
 do_install:append() {
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfi=
gdata*.cpython*
-
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=3D`find ${D} -name _sysconfig*.py`
         sed -i  \
@@ -229,11 +205,6 @@ do_install:append() {
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
@@ -353,6 +324,9 @@ provide_target_config_script() {
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
@@ -385,11 +359,6 @@ py_package_preprocess () {
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
@@ -399,9 +368,28 @@ py_package_preprocess () {
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
     import collections, json
@@ -452,11 +440,6 @@ python(){
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

