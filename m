Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 675B761642
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 04:17:45 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so1358401pad.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 21:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=DSyJ9FZFyMylTNrUM3iiAU5Fb1FK2OcgcwWglG0RSLA=;
	b=jVK112DCuYDBFc5KAloe12SCpbn3qZ+y6tVLnoNVqTUTOrouw3qBdF9nOqPJM53xf3
	zhfKtQd61zblsN6IVHz5ieu0EWiDL/Rr13mgcZuI1kWoWgy79zclkMnbUeuWiKLEz9sA
	1xbrNz9nFPCK37dMEkKutbBEGos0TTFhGTK2dGCAsquKBTVYxMKI3CU1GNOtXzV2GE6K
	WRqRQjXDCP9rX0f3x4+WjjgHybbrnpBs2tNzqMstGNC3qxNbuNj1gtp3uJPHXzbd9NG3
	A5lczTsCDBBEKSzsnoNSm0c7hvKA44MeQ2cUo1kJpNAZOPItSE8MnUvps1lrvPaGzi4r
	cSvg==
X-Received: by 10.68.217.34 with SMTP id ov2mr56255pbc.204.1378354667323;
	Wed, 04 Sep 2013 21:17:47 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	tr10sm32571783pbc.22.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 21:17:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Sep 2013 21:16:14 -0700
Message-Id: <181792d8775599b1ec0cb9d835de59d730c19363.1378354382.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
In-Reply-To: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
References: <01b4612b2453648a4b5f203acd8326b73ef293f3.1378354382.git.raj.khem@gmail.com>
In-Reply-To: <cover.1378354381.git.raj.khem@gmail.com>
References: <cover.1378354381.git.raj.khem@gmail.com>
Subject: [PATCH 09/13] python3: Add target and native recipes
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
X-List-Received-Date: Thu, 05 Sep 2013 04:17:45 -0000

3.3.2 is latest bugfix release in 3.3 series

License text is changed to reflect year and prev releases

+++ ../Python-3.3.2/LICENSE     2013-05-15 09:32:54.000000000 -0700
@@ -74,7 +74,9 @@
     3.2.1           3.2         2011        PSF         yes
     3.2.2           3.2.1       2011        PSF         yes
     3.2.3           3.2.2       2012        PSF         yes
+    3.2.4           3.2.3       2013        PSF         yes
     3.3.0           3.2         2012        PSF         yes
+    3.3.1           3.3.0       2013        PSF         yes

 Footnotes:

@@ -110,8 +112,8 @@
 distribute, and otherwise use Python alone or in any derivative
version,
 provided, however, that PSF's License Agreement and PSF's notice of
copyright,
 i.e., "Copyright (c) 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008,
2009, 2010,
-2011, 2012 Python Software Foundation; All Rights Reserved" are
retained in Python
-alone or in any derivative version prepared by Licensee.
+2011, 2012, 2013 Python Software Foundation; All Rights Reserved" are
retained
+in Python alone or in any derivative version prepared by Licensee.

We use native python in disutils bbclass and this needs
to peek into target sysroot when building plugins in cross
environment. Otherwise anything that inherits distutils3.bbclass
will not build.

Fix host include contamination issue

Let compiler append sysroot to include path if it can

Fix the compiler invocation and linker flags when cross compiling

The details are in patch header. This should fix the QA errors about
host contamination

Add virtual/libintl to dep list

There is use of libintl.h but we dont
express the dependency

Add lzma dependency for python3-misc

Fixes

and from test-dependencies.sh run there is undeterministic lzma
dependency:

WARN: packages/armv5te-oe-linux-gnueabi/python3/python3-misc/latest lost
dependency on  liblzma

Reported-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-native_3.3.2.bb                 |  70 +++++
 .../python/python3/000-cross-compile.patch         |  83 +++++
 ...sue-13032-where-it-fails-with-UnicodeDeco.patch |  37 +++
 .../python3/020-dont-compile-python-files.patch    |  37 +++
 .../python/python3/03-fix-tkinter-detection.patch  |  42 +++
 .../python/python3/030-fixup-include-dirs.patch    |  33 ++
 .../python/python3/04-default-is-optimized.patch   |  58 ++++
 .../python3/06-ctypes-libffi-fix-configure.patch   |  44 +++
 .../python3/070-dont-clean-ipkg-install.patch      |  36 +++
 .../python3/080-distutils-dont_adjust_files.patch  |  92 ++++++
 .../python/python3/110-enable-zlib.patch           |  21 ++
 ...2-distutils-prefix-is-inside-staging-area.patch |  78 +++++
 .../python/python3/130-readline-setup.patch        |  55 ++++
 .../python/python3/150-fix-setupterm.patch         |  17 ++
 .../python3/avoid_warning_about_tkinter.patch      |  25 ++
 meta/recipes-devtools/python/python3/cgi_py.patch  |  23 ++
 .../python3/fix_for_using_different_libdir.patch   |  54 ++++
 .../python3/host_include_contamination.patch       |  28 ++
 .../python/python3/python-3.3-multilib.patch       | 336 +++++++++++++++++++++
 .../python/python3/remove_sqlite_rpath.patch       |  19 ++
 .../python/python3/setuptweaks.patch               |  57 ++++
 .../python/python3/shutil-follow-symlink-fix.patch |  17 ++
 .../python/python3/sitecustomize.py                |  37 +++
 .../sys_platform_is_now_always_linux2.patch        |  29 ++
 .../python/python3/sysroot-include-headers.patch   |  35 +++
 .../python/python3/unixccompiler.patch             |  33 ++
 meta/recipes-devtools/python/python3_3.3.2.bb      | 205 +++++++++++++
 27 files changed, 1601 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-native_3.3.2.bb
 create mode 100644 meta/recipes-devtools/python/python3/000-cross-compile.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
 create mode 100644 meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
 create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
 create mode 100644 meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
 create mode 100644 meta/recipes-devtools/python/python3/04-default-is-optimized.patch
 create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
 create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
 create mode 100644 meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
 create mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch
 create mode 100644 meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
 create mode 100644 meta/recipes-devtools/python/python3/130-readline-setup.patch
 create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
 create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
 create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
 create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
 create mode 100644 meta/recipes-devtools/python/python3/host_include_contamination.patch
 create mode 100644 meta/recipes-devtools/python/python3/python-3.3-multilib.patch
 create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
 create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.patch
 create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
 create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.py
 create mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
 create mode 100644 meta/recipes-devtools/python/python3/sysroot-include-headers.patch
 create mode 100644 meta/recipes-devtools/python/python3/unixccompiler.patch
 create mode 100644 meta/recipes-devtools/python/python3_3.3.2.bb

diff --git a/meta/recipes-devtools/python/python3-native_3.3.2.bb b/meta/recipes-devtools/python/python3-native_3.3.2.bb
new file mode 100644
index 0000000..d11ec51
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-native_3.3.2.bb
@@ -0,0 +1,70 @@
+require recipes-devtools/python/python.inc
+
+PR = "${INC_PR}.0"
+PYTHON_MAJMIN = "3.3"
+DISTRO_SRC_URI ?= "file://sitecustomize.py"
+DISTRO_SRC_URI_linuxstdbase = ""
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+file://12-distutils-prefix-is-inside-staging-area.patch \
+file://000-cross-compile.patch \
+file://020-dont-compile-python-files.patch \
+file://030-fixup-include-dirs.patch \
+file://070-dont-clean-ipkg-install.patch \
+file://080-distutils-dont_adjust_files.patch \
+file://110-enable-zlib.patch \
+file://130-readline-setup.patch \
+file://150-fix-setupterm.patch \
+file://python-3.3-multilib.patch \
+file://03-fix-tkinter-detection.patch \
+file://avoid_warning_about_tkinter.patch \
+file://06-ctypes-libffi-fix-configure.patch \
+file://shutil-follow-symlink-fix.patch \
+file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+file://sysroot-include-headers.patch \
+file://unixccompiler.patch \
+${DISTRO_SRC_URI} \
+"
+SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
+SRC_URI[sha256sum] = "f77202fe2bbc203205d7bd6e8452567fa1d9bc97f6957c9ef753d9a36cdcbe9a"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a7e738bb078a33a825ce4a0282f8cb31"
+
+S = "${WORKDIR}/Python-${PV}"
+
+EXTRANATIVEPATH += "bzip2-native"
+DEPENDS = "openssl-native bzip2-replacement-native zlib-native readline-native sqlite3-native"
+
+inherit native
+
+RPROVIDES += "python3-distutils-native python3-compression-native python3-textutils-native python3-core-native"
+
+EXTRA_OECONF_append = " --bindir=${bindir}/${PN}"
+
+EXTRA_OEMAKE = '\
+  BUILD_SYS="" \
+  HOST_SYS="" \
+  LIBC="" \
+  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
+  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
+  LIB=${baselib} \
+  ARCH=${TARGET_ARCH} \
+'
+
+do_configure_prepend() {
+	autoreconf --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+}
+
+do_install() {
+	install -d ${D}${libdir}/pkgconfig
+	oe_runmake 'DESTDIR=${D}' install
+	if [ -e ${WORKDIR}/sitecustomize.py ]; then
+		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+	fi
+	install -d ${D}${bindir}/${PN}
+	install -m 0755 Parser/pgen ${D}${bindir}/${PN}
+
+	# Make sure we use /usr/bin/env python
+	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
+	done
+}
diff --git a/meta/recipes-devtools/python/python3/000-cross-compile.patch b/meta/recipes-devtools/python/python3/000-cross-compile.patch
new file mode 100644
index 0000000..2506a59
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/000-cross-compile.patch
@@ -0,0 +1,83 @@
+We cross compile python. This patch uses tools from host/native
+python instead of in-tree tools
+
+-Khem
+
+Upstream-Status: Inappropriate[Configuration Specific]
+
+---
+ Makefile.pre.in |   25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -193,6 +193,7 @@ LIBOBJS=	@LIBOBJS@
+ 
+ PYTHON=		python$(EXE)
+ BUILDPYTHON=	python$(BUILDEXE)
++HOSTPYTHON=	$(BUILDPYTHON)
+ 
+ PYTHON_FOR_BUILD=@PYTHON_FOR_BUILD@
+ _PYTHON_HOST_PLATFORM=@_PYTHON_HOST_PLATFORM@
+@@ -239,6 +240,7 @@ LIBFFI_INCLUDEDIR=	@LIBFFI_INCLUDEDIR@
+ ##########################################################################
+ # Parser
+ PGEN=		Parser/pgen$(EXE)
++HOSTPGEN=	$(PGEN)$(EXE)
+ 
+ PSRCS=		\
+ 		Parser/acceler.c \
+@@ -451,7 +453,7 @@ build_all_generate_profile:
+ 
+ run_profile_task:
+ 	: # FIXME: can't run for a cross build
+-	$(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK)
++	$(RUNSHARED) $(HOSTPYTHON) $(PROFILE_TASK)
+ 
+ build_all_use_profile:
+ 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-use -fprofile-correction"
+@@ -640,7 +642,7 @@ $(IO_OBJS): $(IO_H)
+ $(GRAMMAR_H): $(GRAMMAR_INPUT) $(PGENSRCS)
+ 		@$(MKDIR_P) Include
+ 		$(MAKE) $(PGEN)
+-		$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
+ $(GRAMMAR_C): $(GRAMMAR_H) $(GRAMMAR_INPUT) $(PGENSRCS)
+ 		$(MAKE) $(GRAMMAR_H)
+ 		touch $(GRAMMAR_C)
+@@ -820,7 +822,7 @@ $(LIBRARY_OBJS) $(MODOBJS) Modules/pytho
+ ######################################################################
+ 
+ TESTOPTS=	$(EXTRATESTOPTS)
+-TESTPYTHON=	$(RUNSHARED) ./$(BUILDPYTHON) $(TESTPYTHONOPTS)
++TESTPYTHON=	$(RUNSHARED) $(HOSTPYTHON) $(TESTPYTHONOPTS)
+ TESTRUNNER=	$(TESTPYTHON) $(srcdir)/Tools/scripts/run_tests.py
+ TESTTIMEOUT=	3600
+ 
+@@ -1229,7 +1231,7 @@ frameworkinstallstructure:	$(LDLIBRARY)
+ 		fi; \
+ 	done
+ 	$(LN) -fsn include/python$(LDVERSION) $(DESTDIR)$(prefix)/Headers
+-	sed 's/%VERSION%/'"`$(RUNSHARED) ./$(BUILDPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
++	sed 's/%VERSION%/'"`$(RUNSHARED) $(HOSTPYTHON) -c 'import platform; print(platform.python_version())'`"'/g' < $(RESSRCDIR)/Info.plist > $(DESTDIR)$(prefix)/Resources/Info.plist
+ 	$(LN) -fsn $(VERSION) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Versions/Current
+ 	$(LN) -fsn Versions/Current/$(PYTHONFRAMEWORK) $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/$(PYTHONFRAMEWORK)
+ 	$(LN) -fsn Versions/Current/Headers $(DESTDIR)$(PYTHONFRAMEWORKINSTALLDIR)/Headers
+@@ -1288,7 +1290,7 @@ config.status:	$(srcdir)/configure
+ 
+ # Run reindent on the library
+ reindent:
+-	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
++	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
+ 
+ # Rerun configure with the same options as it was run last time,
+ # provided the config.status script exists
+@@ -1414,7 +1416,7 @@ funny:
+ 
+ # Perform some verification checks on any modified files.
+ patchcheck:
+-	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
++	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
+ 
+ # Dependencies
+ 
diff --git a/meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch b/meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
new file mode 100644
index 0000000..dd6b24f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
@@ -0,0 +1,37 @@
+From 2f5a4c708d90fa8db21f446ae879cff79387448d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2013 21:03:16 -0700
+Subject: [PATCH] h2py: Fix issue 13032 where it fails with UnicodeDecodeError
+
+use utf-8 to open the files
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+---
+ Tools/scripts/h2py.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Tools/scripts/h2py.py b/Tools/scripts/h2py.py
+index 4f871d9..a53fbe0 100755
+--- a/Tools/scripts/h2py.py
++++ b/Tools/scripts/h2py.py
+@@ -69,13 +69,13 @@ def main():
+             sys.stdout.write('# Generated by h2py from stdin\n')
+             process(sys.stdin, sys.stdout)
+         else:
+-            fp = open(filename, 'r')
++            fp = open(filename, 'r', encoding='utf-8')
+             outfile = os.path.basename(filename)
+             i = outfile.rfind('.')
+             if i > 0: outfile = outfile[:i]
+             modname = outfile.upper()
+             outfile = modname + '.py'
+-            outfp = open(outfile, 'w')
++            outfp = open(outfile, 'w', encoding='utf-8')
+             outfp.write('# Generated by h2py from %s\n' % filename)
+             filedict = {}
+             for dir in searchdirs:
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
new file mode 100644
index 0000000..03ef286
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
@@ -0,0 +1,37 @@
+Dont cross compile site packages
+
+-Khem
+
+Upstream-Status: Inappropriate[Embedded-Specific]
+
+---
+ Makefile.pre.in |   16 ----------------
+ 1 file changed, 16 deletions(-)
+
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1078,24 +1078,6 @@ libinstall:	build_all $(srcdir)/Lib/$(PL
+ 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST) -f \
+-		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+-		$(DESTDIR)$(LIBDEST)
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		$(PYTHON_FOR_BUILD) -Wi -O $(DESTDIR)$(LIBDEST)/compileall.py \
+-		-d $(LIBDEST)/site-packages -f \
+-		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
diff --git a/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..fddfd2b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-3.3.0rc2/setup.py
+===================================================================
+--- Python-3.3.0rc2.orig/setup.py	2012-09-20 15:24:14.009124003 -0700
++++ Python-3.3.0rc2/setup.py	2012-09-20 15:25:08.449124963 -0700
+@@ -1620,7 +1620,7 @@
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1639,22 +1639,6 @@
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if host_platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if host_platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
new file mode 100644
index 0000000..6beac7b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
@@ -0,0 +1,33 @@
+Do not hardcode /usr into include paths when cross compiling
+
+-Khem
+
+Upstream-Status: Pending
+ 
+---
+ setup.py |   15 ++-------------
+ 1 file changed, 2 insertions(+), 13 deletions(-)
+
+Index: Python-3.3.2/setup.py
+===================================================================
+--- Python-3.3.2.orig/setup.py
++++ Python-3.3.2/setup.py
+@@ -444,7 +444,8 @@ class PyBuildExt(build_ext):
+         # only change this for cross builds for 3.3, issues on Mageia
+         if cross_compiling:
+             self.add_gcc_paths()
+-        self.add_multiarch_paths()
++        if not cross_compiling:
++            self.add_multiarch_paths()
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -480,7 +481,7 @@ class PyBuildExt(build_ext):
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.base_prefix) != '/usr' \
++        if not cross_compiling and os.path.normpath(sys.base_prefix) != '/usr' \
+                 and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
diff --git a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
new file mode 100644
index 0000000..d5afd40
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Updated original patch for python 2.7.3
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/01
+
+
+# when compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-3.2.3/Python/compile.c
+===================================================================
+--- Python-3.2.3.orig/Python/compile.c	2012-04-10 23:54:08.000000000 -0700
++++ Python-3.2.3/Python/compile.c	2012-09-19 15:58:46.649123998 -0700
+@@ -30,7 +30,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
+Index: Python-3.2.3/Modules/main.c
+===================================================================
+--- Python-3.2.3.orig/Modules/main.c	2012-04-10 23:54:07.000000000 -0700
++++ Python-3.2.3/Modules/main.c	2012-09-19 16:00:32.153124053 -0700
+@@ -46,7 +46,7 @@
+ static int  orig_argc;
+ 
+ /* command line options */
+-#define BASE_OPTS L"bBc:dEhiJm:OqRsStuvVW:xX:?"
++#define BASE_OPTS L"bBc:dEhiJm:NOqRsStuvVW:xX:?"
+ 
+ #define PROGRAM_OPTS BASE_OPTS
+ 
+@@ -71,6 +71,7 @@
+ -m mod : run library module as a script (terminates option list)\n\
+ -O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
+ -OO    : remove doc-strings in addition to the -O optimizations\n\
++-N     : do NOT optimize generated bytecode\n\
+ -q     : don't print version and copyright messages on interactive startup\n\
+ -R     : use a pseudo-random salt to make hash() values of various types be\n\
+          unpredictable between separate invocations of the interpreter, as\n\
+@@ -407,8 +408,8 @@
+ 
+         /* case 'J': reserved for Jython */
+ 
+-        case 'O':
+-            Py_OptimizeFlag++;
++        case 'N':
++            Py_OptimizeFlag=0;
+             break;
+ 
+         case 'B':
diff --git a/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch b/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
new file mode 100644
index 0000000..abd63d2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
@@ -0,0 +1,44 @@
+This fixes configure issues with recent autoconf, e.g:
+  autoreconf: Entering directory `Modules/_ctypes/libffi'
+  autoreconf: configure.ac: not using Gettext
+  autoreconf: running: aclocal --force
+  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
+  configure.ac:26: the top level
+
+The problem is still present in python-2.6.5 but fixed in python-svn.
+
+Upstream-Status: Accepted [python-svn]
+
+Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
+Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+
+2011/09/29
+Rebased for python 2.7.2
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+
+
+Index: Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
+===================================================================
+--- Python-2.7.2.orig/Modules/_ctypes/libffi/Makefile.am
++++ Python-2.7.2/Modules/_ctypes/libffi/Makefile.am
+@@ -2,7 +2,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+-SUBDIRS = include testsuite man
++SUBDIRS = include
+ 
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
+ 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -34,8 +34,6 @@ EXTRA_DIST = LICENSE ChangeLog.v1 Change
+ 	libtool-version ChangeLog.libffi m4/libtool.m4 \
+ 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
+ 
+-info_TEXINFOS = doc/libffi.texi
+-
+ ## ################################################################
+ 
+ ##
diff --git a/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
new file mode 100644
index 0000000..789929b
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
@@ -0,0 +1,36 @@
+consider opkg directories when cleaning up
+
+-Khem
+
+Upstream-Status: Inappropriate [OE specific]
+
+---
+ Makefile.pre.in |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1306,8 +1306,8 @@ touch:
+ # Sanitation targets -- clean leaves libraries, executables and tags
+ # files, which clobber removes as well
+ pycremoval:
+-	-find $(srcdir) -depth -name '__pycache__' -exec rm -rf {} ';'
+-	-find $(srcdir) -name '*.py[co]' -exec rm -f {} ';'
++	-find $(srcdir) ! -path './ipkg-install/*' -depth -name '__pycache__' -exec rm -rf {} ';'
++	-find $(srcdir) ! -path './ipkg-install/*' -name '*.py[co]' -exec rm -f {} ';'
+ 
+ rmtestturds:
+ 	-rm -f *BAD *GOOD *SKIPPED
+@@ -1321,9 +1321,9 @@ docclean:
+ 	-rm -rf Doc/tools/sphinx Doc/tools/pygments Doc/tools/docutils
+ 
+ clean: pycremoval
+-	find . -name '*.[oa]' -exec rm -f {} ';'
+-	find . -name '*.s[ol]' -exec rm -f {} ';'
+-	find . -name '*.so.[0-9]*.[0-9]*' -exec rm -f {} ';'
++	find . ! -path './ipkg-install/*' -name '*.[oa]' -exec rm -f {} ';'
++	find . ! -path './ipkg-install/*' -name '*.s[ol]' -exec rm -f {} ';'
++	find . ! -path './ipkg-install/*' -name '*.so.[0-9]*.[0-9]*' -exec rm -f {} ';'
+ 	find build -name 'fficonfig.h' -exec rm -f {} ';' || true
+ 	find build -name 'fficonfig.py' -exec rm -f {} ';' || true
+ 	-rm -f Lib/lib2to3/*Grammar*.pickle
diff --git a/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
new file mode 100644
index 0000000..b96419a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
@@ -0,0 +1,92 @@
+do not "adjust" python files before copying
+
+-Khem
+
+Upstream-Status: Inappropriate [Embedded-Specific]
+
+---
+ Lib/distutils/command/build_scripts.py |   43 +++------------------------------
+ 1 file changed, 4 insertions(+), 39 deletions(-)
+
+--- a/Lib/distutils/command/build_scripts.py
++++ b/Lib/distutils/command/build_scripts.py
+@@ -51,10 +51,7 @@ class build_scripts(Command):
+ 
+ 
+     def copy_scripts(self):
+-        """Copy each script listed in 'self.scripts'; if it's marked as a
+-        Python script in the Unix way (first line matches 'first_line_re',
+-        ie. starts with "\#!" and contains "python"), then adjust the first
+-        line to refer to the current Python interpreter as we copy.
++        """Copy each script listed in 'self.scripts'
+         """
+         self.mkpath(self.build_dir)
+         outfiles = []
+@@ -78,64 +75,10 @@ class build_scripts(Command):
+                 if not self.dry_run:
+                     raise
+                 f = None
+-            else:
+-                encoding, lines = tokenize.detect_encoding(f.readline)
+-                f.seek(0)
+-                first_line = f.readline()
+-                if not first_line:
+-                    self.warn("%s is an empty file (skipping)" % script)
+-                    continue
+-
+-                match = first_line_re.match(first_line)
+-                if match:
+-                    adjust = True
+-                    post_interp = match.group(1) or b''
+-
+-            if adjust:
+-                log.info("copying and adjusting %s -> %s", script,
+-                         self.build_dir)
+-                updated_files.append(outfile)
+-                if not self.dry_run:
+-                    if not sysconfig.python_build:
+-                        executable = self.executable
+-                    else:
+-                        executable = os.path.join(
+-                            sysconfig.get_config_var("BINDIR"),
+-                           "python%s%s" % (sysconfig.get_config_var("VERSION"),
+-                                           sysconfig.get_config_var("EXE")))
+-                    executable = os.fsencode(executable)
+-                    shebang = b"#!" + executable + post_interp + b"\n"
+-                    # Python parser starts to read a script using UTF-8 until
+-                    # it gets a #coding:xxx cookie. The shebang has to be the
+-                    # first line of a file, the #coding:xxx cookie cannot be
+-                    # written before. So the shebang has to be decodable from
+-                    # UTF-8.
+-                    try:
+-                        shebang.decode('utf-8')
+-                    except UnicodeDecodeError:
+-                        raise ValueError(
+-                            "The shebang ({!r}) is not decodable "
+-                            "from utf-8".format(shebang))
+-                    # If the script is encoded to a custom encoding (use a
+-                    # #coding:xxx cookie), the shebang has to be decodable from
+-                    # the script encoding too.
+-                    try:
+-                        shebang.decode(encoding)
+-                    except UnicodeDecodeError:
+-                        raise ValueError(
+-                            "The shebang ({!r}) is not decodable "
+-                            "from the script encoding ({})"
+-                            .format(shebang, encoding))
+-                    with open(outfile, "wb") as outf:
+-                        outf.write(shebang)
+-                        outf.writelines(f.readlines())
+-                if f:
+-                    f.close()
+-            else:
+-                if f:
++            if f:
+                     f.close()
+-                updated_files.append(outfile)
+-                self.copy_file(script, outfile)
++            updated_files.append(outfile)
++            self.copy_file(script, outfile)
+ 
+         if os.name == 'posix':
+             for file in outfiles:
diff --git a/meta/recipes-devtools/python/python3/110-enable-zlib.patch b/meta/recipes-devtools/python/python3/110-enable-zlib.patch
new file mode 100644
index 0000000..fb92a19
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/110-enable-zlib.patch
@@ -0,0 +1,21 @@
+Enable zlib in python
+
+-Khem
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+---
+ Modules/Setup.dist |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/Modules/Setup.dist
++++ b/Modules/Setup.dist
+@@ -354,7 +354,7 @@ _symtable symtablemodule.c
+ # Andrew Kuchling's zlib module.
+ # This require zlib 1.1.3 (or later).
+ # See http://www.gzip.org/zlib/
+-#zlib zlibmodule.c -I$(prefix)/include -L$(exec_prefix)/lib -lz
++zlib zlibmodule.c -lz
+ 
+ # Interface to the Expat XML parser
+ #
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
new file mode 100644
index 0000000..c5846a5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -0,0 +1,78 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+# The proper prefix is inside our staging area.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+# Signed-off-by: Phil Blundell <philb@gnu.org>
+# Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: Python-3.3.2/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-3.3.2.orig/Lib/distutils/sysconfig.py	2013-07-30 00:00:52.769749805 -0700
++++ Python-3.3.2/Lib/distutils/sysconfig.py	2013-07-30 00:16:22.545767248 -0700
+@@ -16,10 +16,11 @@
+ from .errors import DistutilsPlatformError
+ 
+ # These are needed in a couple of spots, so just compute them once.
+-PREFIX = os.path.normpath(sys.prefix)
+-EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
+-BASE_PREFIX = os.path.normpath(sys.base_prefix)
+-BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
++PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++BASE_PREFIX = os.path.normpath(sys.base_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++BASE_EXEC_PREFIX= os.path.normpath(sys.base_exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++
+ 
+ # Path to the base directory of the project. On Windows the binary may
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+@@ -93,7 +94,9 @@
+     If 'prefix' is supplied, use it instead of sys.base_prefix or
+     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+-    if prefix is None:
++    if prefix is None and os.environ['STAGING_INCDIR'] != "":
++        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
++    elif prefix is None:
+         prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
+     if os.name == "posix":
+         if python_build:
+@@ -136,6 +139,12 @@
+     If 'prefix' is supplied, use it instead of sys.base_prefix or
+     sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
+     """
++    if prefix is None and os.environ['STAGING_LIBDIR'] != "":
++        lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
++        prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
++    else:
++        lib_basename = sys.lib
++
+     if prefix is None:
+         if standard_lib:
+             prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
+@@ -144,7 +153,7 @@
+ 
+     if os.name == "posix":
+         libpython = os.path.join(prefix,
+-                                 "lib", "python" + get_python_version())
++                                 lib_basename, "python" + get_python_version())
+         if standard_lib:
+             return libpython
+         else:
+@@ -249,7 +258,7 @@
+     else:
+         # The name of the config.h file changed in 2.2
+         config_h = 'pyconfig.h'
+-    return os.path.join(inc_dir, config_h)
++    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def get_makefile_filename():
+@@ -258,7 +267,7 @@
+         return os.path.join(_sys_home or project_base, "Makefile")
+     lib_dir = get_python_lib(plat_specific=0, standard_lib=1)
+     config_file = 'config-{}{}'.format(get_python_version(), build_flags)
+-    return os.path.join(lib_dir, config_file, 'Makefile')
++    return os.path.join(lib_dir, config_file, 'Makefile').replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def parse_config_h(fp, g=None):
diff --git a/meta/recipes-devtools/python/python3/130-readline-setup.patch b/meta/recipes-devtools/python/python3/130-readline-setup.patch
new file mode 100644
index 0000000..c805652
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/130-readline-setup.patch
@@ -0,0 +1,55 @@
+package python-readline
+
+-Khem
+
+Upstream-Status: Inappropriate [Embedded Specific]
+
+--- a/setup.py
++++ b/setup.py
+@@ -666,45 +666,7 @@ class PyBuildExt(build_ext):
+         # readline
+         do_readline = self.compiler.find_library_file(lib_dirs, 'readline')
+         readline_termcap_library = ""
+-        curses_library = ""
+-        # Cannot use os.popen here in py3k.
+-        tmpfile = os.path.join(self.build_temp, 'readline_termcap_lib')
+-        if not os.path.exists(self.build_temp):
+-            os.makedirs(self.build_temp)
+-        # Determine if readline is already linked against curses or tinfo.
+-        if do_readline:
+-            if cross_compiling:
+-                ret = os.system("%s -d %s | grep '(NEEDED)' > %s" \
+-                                % (sysconfig.get_config_var('READELF'),
+-                                   do_readline, tmpfile))
+-            elif find_executable('ldd'):
+-                ret = os.system("ldd %s > %s" % (do_readline, tmpfile))
+-            else:
+-                ret = 256
+-            if ret >> 8 == 0:
+-                with open(tmpfile) as fp:
+-                    for ln in fp:
+-                        if 'curses' in ln:
+-                            readline_termcap_library = re.sub(
+-                                r'.*lib(n?cursesw?)\.so.*', r'\1', ln
+-                            ).rstrip()
+-                            break
+-                        # termcap interface split out from ncurses
+-                        if 'tinfo' in ln:
+-                            readline_termcap_library = 'tinfo'
+-                            break
+-            if os.path.exists(tmpfile):
+-                os.unlink(tmpfile)
+-        # Issue 7384: If readline is already linked against curses,
+-        # use the same library for the readline and curses modules.
+-        if 'curses' in readline_termcap_library:
+-            curses_library = readline_termcap_library
+-        elif self.compiler.find_library_file(lib_dirs, 'ncursesw'):
+-            curses_library = 'ncursesw'
+-        elif self.compiler.find_library_file(lib_dirs, 'ncurses'):
+-            curses_library = 'ncurses'
+-        elif self.compiler.find_library_file(lib_dirs, 'curses'):
+-            curses_library = 'curses'
++        curses_library = "ncurses"
+ 
+         if host_platform == 'darwin':
+             os_release = int(os.uname()[2].split('.')[0])
diff --git a/meta/recipes-devtools/python/python3/150-fix-setupterm.patch b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
new file mode 100644
index 0000000..78d7c78
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/150-fix-setupterm.patch
@@ -0,0 +1,17 @@
+Fix warning with newer compiler
+
+-Khem
+
+Upstream-Status: Pending
+
+--- a/Modules/_cursesmodule.c
++++ b/Modules/_cursesmodule.c
+@@ -116,7 +116,7 @@ char *PyCursesVersion = "2.2";
+     #defines many common symbols (such as "lines") which breaks the
+     curses module in other ways.  So the code will just specify
+     explicit prototypes here. */
+-extern int setupterm(char *,int,int *);
++//extern int setupterm(char *,int,int *);
+ #ifdef __sgi
+ #include <term.h>
+ #endif
diff --git a/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
new file mode 100644
index 0000000..208c57c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
@@ -0,0 +1,25 @@
+_tkinter module needs tk module along with tcl. tk is not yet integrated
+in yocto so we skip the check for this module.
+Avoid a warning by not adding this module to missing variable.
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-05 23:18:38.500136647 +0300
++++ Python-2.7.2/setup.py	2012-04-05 23:19:35.888134969 +0300
+@@ -1634,8 +1634,10 @@
+         # Call the method for detecting whether _tkinter can be compiled
+         self.detect_tkinter(inc_dirs, lib_dirs)
+ 
+-        if '_tkinter' not in [e.name for e in self.extensions]:
+-            missing.append('_tkinter')
++        # tkinter module will not be avalaible as yocto
++        # doesn't have tk integrated (yet)
++        #if '_tkinter' not in [e.name for e in self.extensions]:
++        #    missing.append('_tkinter')
+ 
+         return missing
+ 
diff --git a/meta/recipes-devtools/python/python3/cgi_py.patch b/meta/recipes-devtools/python/python3/cgi_py.patch
new file mode 100644
index 0000000..de504f9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/cgi_py.patch
@@ -0,0 +1,23 @@
+Lib/cgi.py: Update the script as mentioned in the comment
+
+Upstream-Status: Inappropriate [distribution]
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+--- Python-2.6.6/Lib/cgi.py.orig	2010-08-01 22:14:27.000000000 -0500
++++ Python-2.6.6/Lib/cgi.py	2011-09-21 15:28:40.478208631 -0500
+@@ -1,13 +1,4 @@
+-#! /usr/local/bin/python
+-
+-# NOTE: the above "/usr/local/bin/python" is NOT a mistake.  It is
+-# intentionally NOT "/usr/bin/env python".  On many systems
+-# (e.g. Solaris), /usr/local/bin is not in $PATH as passed to CGI
+-# scripts, and /usr/local/bin is the default directory where Python is
+-# installed, so /usr/bin/env would be unable to find python.  Granted,
+-# binary installations by Linux vendors often install Python in
+-# /usr/bin.  So let those vendors patch cgi.py to match their choice
+-# of installation.
++#! /usr/bin/env python
+ 
+ """Support module for CGI (Common Gateway Interface) scripts.
+ 
diff --git a/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch b/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
new file mode 100644
index 0000000..cd1a978
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Inappropriate [Embedded specific]
+
+This patch fixes issuing with different libdir like lib64.
+This patch makes the native python binary modules findable
+in the install process of the host python.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/03/14
+
+Updated for python 2.7.3
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: 2012/05/01
+
+Index: Python-3.3.0rc2/Lib/sysconfig.py
+===================================================================
+--- Python-3.3.0rc2.orig/Lib/sysconfig.py	2012-09-20 22:50:11.000000000 -0700
++++ Python-3.3.0rc2/Lib/sysconfig.py	2012-09-20 22:53:01.561123396 -0700
+@@ -21,9 +21,9 @@
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
++        'stdlib': '{base}/'+sys.lib+'/python{py_version_short}',
+         'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+-        'purelib': '{base}/lib/python{py_version_short}/site-packages',
++        'purelib': '{base}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+@@ -83,7 +83,7 @@
+     'posix_user': {
+         'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+-        'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'purelib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+Index: Python-3.3.0rc2/Makefile.pre.in
+===================================================================
+--- Python-3.3.0rc2.orig/Makefile.pre.in	2012-09-20 22:50:11.000000000 -0700
++++ Python-3.3.0rc2/Makefile.pre.in	2012-09-20 22:50:54.245123997 -0700
+@@ -1080,9 +1080,9 @@
+ 		$(INSTALL_DATA) $(srcdir)/Modules/xxmodule.c \
+ 			$(DESTDIR)$(LIBDEST)/distutils/tests ; \
+ 	fi
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/Grammar.txt
+-	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
++	-PYTHONPATH=$(DESTDIR)$(LIBDEST):${CROSSPYTHONPATH} $(RUNSHARED) \
+ 		$(PYTHON_FOR_BUILD) -m lib2to3.pgen2.driver $(DESTDIR)$(LIBDEST)/lib2to3/PatternGrammar.txt
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
diff --git a/meta/recipes-devtools/python/python3/host_include_contamination.patch b/meta/recipes-devtools/python/python3/host_include_contamination.patch
new file mode 100644
index 0000000..ef2054d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/host_include_contamination.patch
@@ -0,0 +1,28 @@
+when building python for qemux86-64 on ubuntu 11.10/64bit
+it gropes into host includes and then mixes them with cross
+includes and as a result some modules fail to compile and link
+one of the modules is python-elementtree which is then not
+found during image creation
+
+Proble is that setup.py tries to add native includes that newer
+ubuntu has introduced for multiarch support. But that should
+only happen for native builds and not cross building python
+so we add a check here.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: Python-3.3.0rc2/setup.py
+===================================================================
+--- Python-3.3.0rc2.orig/setup.py	2012-09-20 21:54:50.000000000 -0700
++++ Python-3.3.0rc2/setup.py	2012-09-20 21:57:35.029123858 -0700
+@@ -402,6 +402,9 @@
+ 
+         if not find_executable('dpkg-architecture'):
+             return
++        if cross_compiling:
++            return
++
+         opt = ''
+         if cross_compiling:
+             opt = '-t' + sysconfig.get_config_var('HOST_GNU_TYPE')
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
new file mode 100644
index 0000000..7d66a0e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -0,0 +1,336 @@
+get the sys.lib from python itself and do not use hardcoded value of 'lib'
+
+-Khem
+
+Upstream-Status: Pending
+
+Index: Python-3.3.2/Include/pythonrun.h
+===================================================================
+--- Python-3.3.2.orig/Include/pythonrun.h	2013-05-15 09:32:54.000000000 -0700
++++ Python-3.3.2/Include/pythonrun.h	2013-07-27 16:19:54.099877246 -0700
+@@ -181,6 +181,8 @@
+ /* In their own files */
+ PyAPI_FUNC(const char *) Py_GetVersion(void);
+ PyAPI_FUNC(const char *) Py_GetPlatform(void);
++PyAPI_FUNC(const char *) Py_GetArch(void);
++PyAPI_FUNC(const char *) Py_GetLib(void);
+ PyAPI_FUNC(const char *) Py_GetCopyright(void);
+ PyAPI_FUNC(const char *) Py_GetCompiler(void);
+ PyAPI_FUNC(const char *) Py_GetBuildInfo(void);
+Index: Python-3.3.2/Lib/distutils/command/install.py
+===================================================================
+--- Python-3.3.2.orig/Lib/distutils/command/install.py	2013-05-15 09:32:54.000000000 -0700
++++ Python-3.3.2/Lib/distutils/command/install.py	2013-07-27 16:19:54.099877246 -0700
+@@ -25,6 +25,8 @@
+     from site import USER_SITE
+     HAS_USER_SITE = True
+ 
++libname = sys.lib
++
+ if sys.version < "2.2":
+     WINDOWS_SCHEME = {
+         'purelib': '$base',
+@@ -45,7 +47,7 @@
+ INSTALL_SCHEMES = {
+     'unix_prefix': {
+         'purelib': '$base/lib/python$py_version_short/site-packages',
+-        'platlib': '$platbase/lib/python$py_version_short/site-packages',
++        'platlib': '$platbase/'+libname+'/python$py_version_short/site-packages',
+         'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
+         'scripts': '$base/bin',
+         'data'   : '$base',
+Index: Python-3.3.2/Lib/pydoc.py
+===================================================================
+--- Python-3.3.2.orig/Lib/pydoc.py	2013-05-15 09:32:55.000000000 -0700
++++ Python-3.3.2/Lib/pydoc.py	2013-07-27 16:19:54.103877246 -0700
+@@ -372,7 +372,7 @@
+ 
+         docloc = os.environ.get("PYTHONDOCS", self.PYTHONDOCS)
+ 
+-        basedir = os.path.join(sys.base_exec_prefix, "lib",
++        basedir = os.path.join(sys.base_exec_prefix, sys.lib,
+                                "python%d.%d" %  sys.version_info[:2])
+         if (isinstance(object, type(os)) and
+             (object.__name__ in ('errno', 'exceptions', 'gc', 'imp',
+Index: Python-3.3.2/Lib/site.py
+===================================================================
+--- Python-3.3.2.orig/Lib/site.py	2013-05-15 09:32:55.000000000 -0700
++++ Python-3.3.2/Lib/site.py	2013-07-27 16:19:54.103877246 -0700
+@@ -303,13 +303,19 @@
+         if sys.platform in ('os2emx', 'riscos'):
+             sitepackages.append(os.path.join(prefix, "Lib", "site-packages"))
+         elif os.sep == '/':
+-            sitepackages.append(os.path.join(prefix, "lib",
++            sitepackages.append(os.path.join(prefix, sys.lib,
+                                         "python" + sys.version[:3],
+                                         "site-packages"))
+-            sitepackages.append(os.path.join(prefix, "lib", "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib",
++                                        "python" + sys.version[:3],
++                                        "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-python"))
++            if sys.lib != "lib":
++                sitepackages.append(os.path.join(prefix, "lib", "site-python"))
+         else:
+             sitepackages.append(prefix)
+-            sitepackages.append(os.path.join(prefix, "lib", "site-packages"))
++            sitepackages.append(os.path.join(prefix, sys.lib, "site-packages"))
+         if sys.platform == "darwin":
+             # for framework builds *only* we add the standard Apple
+             # locations.
+Index: Python-3.3.2/Lib/trace.py
+===================================================================
+--- Python-3.3.2.orig/Lib/trace.py	2013-05-15 09:32:56.000000000 -0700
++++ Python-3.3.2/Lib/trace.py	2013-07-27 16:19:54.103877246 -0700
+@@ -751,10 +751,10 @@
+                 # should I also call expanduser? (after all, could use $HOME)
+ 
+                 s = s.replace("$prefix",
+-                              os.path.join(sys.base_prefix, "lib",
++                              os.path.join(sys.base_prefix, sys.lib,
+                                            "python" + sys.version[:3]))
+                 s = s.replace("$exec_prefix",
+-                              os.path.join(sys.base_exec_prefix, "lib",
++                              os.path.join(sys.base_exec_prefix, sys.lib,
+                                            "python" + sys.version[:3]))
+                 s = os.path.normpath(s)
+                 ignore_dirs.append(s)
+Index: Python-3.3.2/Makefile.pre.in
+===================================================================
+--- Python-3.3.2.orig/Makefile.pre.in	2013-07-27 16:19:16.000000000 -0700
++++ Python-3.3.2/Makefile.pre.in	2013-07-27 16:19:54.103877246 -0700
+@@ -96,6 +96,8 @@
+ 
+ # Machine-dependent subdirectories
+ MACHDEP=	@MACHDEP@
++LIB=		@LIB@
++ARCH=		@ARCH@
+ 
+ # Multiarch directory (may be empty)
+ MULTIARCH=	@MULTIARCH@
+@@ -115,7 +117,7 @@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
+-SCRIPTDIR=	$(prefix)/lib
++SCRIPTDIR=	@libdir@
+ ABIFLAGS=	@ABIFLAGS@
+ 
+ # Detailed destination directories
+@@ -635,6 +637,7 @@
+ 		-DEXEC_PREFIX='"$(exec_prefix)"' \
+ 		-DVERSION='"$(VERSION)"' \
+ 		-DVPATH='"$(VPATH)"' \
++		-DARCH='"$(ARCH)"' -DLIB='"$(LIB)"' \
+ 		-o $@ $(srcdir)/Modules/getpath.c
+ 
+ Modules/python.o: $(srcdir)/Modules/python.c
+@@ -701,7 +704,7 @@
+ Python/compile.o Python/symtable.o Python/ast.o: $(GRAMMAR_H) $(AST_H)
+ 
+ Python/getplatform.o: $(srcdir)/Python/getplatform.c
+-		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -o $@ $(srcdir)/Python/getplatform.c
++		$(CC) -c $(PY_CORE_CFLAGS) -DPLATFORM='"$(MACHDEP)"' -DARCH='"$(ARCH)"' -DLIB='"$(LIB)"' -o $@ $(srcdir)/Python/getplatform.c
+ 
+ Python/importdl.o: $(srcdir)/Python/importdl.c
+ 		$(CC) -c $(PY_CORE_CFLAGS) -I$(DLINCLDIR) -o $@ $(srcdir)/Python/importdl.c
+Index: Python-3.3.2/Modules/getpath.c
+===================================================================
+--- Python-3.3.2.orig/Modules/getpath.c	2013-05-15 09:32:59.000000000 -0700
++++ Python-3.3.2/Modules/getpath.c	2013-07-27 16:19:54.107877246 -0700
+@@ -121,9 +121,11 @@
+ #define EXEC_PREFIX PREFIX
+ #endif
+ 
++#define LIB_PYTHON LIB "/python" VERSION
++
+ #ifndef PYTHONPATH
+-#define PYTHONPATH PREFIX "/lib/python" VERSION ":" \
+-              EXEC_PREFIX "/lib/python" VERSION "/lib-dynload"
++#define PYTHONPATH PREFIX "/" LIB_PYTHON ":" \
++              EXEC_PREFIX "/" LIB_PYTHON "/lib-dynload"
+ #endif
+ 
+ #ifndef LANDMARK
+@@ -135,7 +137,7 @@
+ static wchar_t progpath[MAXPATHLEN+1];
+ static wchar_t *module_search_path = NULL;
+ static int module_search_path_malloced = 0;
+-static wchar_t *lib_python = L"lib/python" VERSION;
++static wchar_t *lib_python = L"" LIB_PYTHON;
+ 
+ static void
+ reduce(wchar_t *dir)
+Index: Python-3.3.2/Python/getplatform.c
+===================================================================
+--- Python-3.3.2.orig/Python/getplatform.c	2013-05-15 09:33:00.000000000 -0700
++++ Python-3.3.2/Python/getplatform.c	2013-07-27 16:19:54.107877246 -0700
+@@ -10,3 +10,23 @@
+ {
+ 	return PLATFORM;
+ }
++
++#ifndef ARCH
++#define ARCH "unknown"
++#endif
++
++const char *
++Py_GetArch(void)
++{
++	return ARCH;
++}
++
++#ifndef LIB
++#define LIB "lib"
++#endif
++
++const char *
++Py_GetLib(void)
++{
++	return LIB;
++}
+Index: Python-3.3.2/Python/sysmodule.c
+===================================================================
+--- Python-3.3.2.orig/Python/sysmodule.c	2013-05-15 09:33:00.000000000 -0700
++++ Python-3.3.2/Python/sysmodule.c	2013-07-27 16:19:54.107877246 -0700
+@@ -1612,6 +1612,10 @@
+                         PyUnicode_FromString(Py_GetCopyright()));
+     SET_SYS_FROM_STRING("platform",
+                         PyUnicode_FromString(Py_GetPlatform()));
++    SET_SYS_FROM_STRING("arch",
++                        PyUnicode_FromString(Py_GetArch()));
++    SET_SYS_FROM_STRING("lib",
++                        PyUnicode_FromString(Py_GetLib()));
+     SET_SYS_FROM_STRING("executable",
+                         PyUnicode_FromWideChar(
+                                Py_GetProgramFullPath(), -1));
+Index: Python-3.3.2/setup.py
+===================================================================
+--- Python-3.3.2.orig/setup.py	2013-07-27 16:19:17.000000000 -0700
++++ Python-3.3.2/setup.py	2013-07-27 16:19:54.107877246 -0700
+@@ -439,7 +439,7 @@
+         # directories (i.e. '.' and 'Include') must be first.  See issue
+         # 10520.
+         if not cross_compiling:
+-            add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++            add_dir_to_list(self.compiler.library_dirs, os.path.join('/usr/local', sys.lib))
+             add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+         # only change this for cross builds for 3.3, issues on Mageia
+         if cross_compiling:
+@@ -497,8 +497,7 @@
+         # be assumed that no additional -I,-L directives are needed.
+         if not cross_compiling:
+             lib_dirs = self.compiler.library_dirs + [
+-                '/lib64', '/usr/lib64',
+-                '/lib', '/usr/lib',
++                '/' + sys.lib, '/usr/' + sys.lib,
+                 ]
+             inc_dirs = self.compiler.include_dirs + ['/usr/include']
+         else:
+@@ -675,11 +674,11 @@
+             elif curses_library:
+                 readline_libs.append(curses_library)
+             elif self.compiler.find_library_file(lib_dirs +
+-                                                     ['/usr/lib/termcap'],
++                                                     ['/usr/'+sys.lib+'/termcap'],
+                                                      'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+-                                   library_dirs=['/usr/lib/termcap'],
++                                   library_dirs=['/usr/'+sys.lib+'/termcap'],
+                                    extra_link_args=readline_extra_link_args,
+                                    libraries=readline_libs) )
+         else:
+Index: Python-3.3.2/Lib/sysconfig.py
+===================================================================
+--- Python-3.3.2.orig/Lib/sysconfig.py	2013-05-15 09:32:55.000000000 -0700
++++ Python-3.3.2/Lib/sysconfig.py	2013-07-27 16:19:54.111877246 -0700
+@@ -21,10 +21,10 @@
+ 
+ _INSTALL_SCHEMES = {
+     'posix_prefix': {
+-        'stdlib': '{installed_base}/lib/python{py_version_short}',
+-        'platstdlib': '{platbase}/lib/python{py_version_short}',
++        'stdlib': '{installed_base}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{platbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{base}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{platbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{platbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include':
+             '{installed_base}/include/python{py_version_short}{abiflags}',
+         'platinclude':
+@@ -33,10 +33,10 @@
+         'data': '{base}',
+         },
+     'posix_home': {
+-        'stdlib': '{installed_base}/lib/python',
+-        'platstdlib': '{base}/lib/python',
++        'stdlib': '{installed_base}/'+sys.lib+'/python',
++        'platstdlib': '{base}/'+sys.lib+'/python',
+         'purelib': '{base}/lib/python',
+-        'platlib': '{base}/lib/python',
++        'platlib': '{base}/'+sys.lib+'/python',
+         'include': '{installed_base}/include/python',
+         'platinclude': '{installed_base}/include/python',
+         'scripts': '{base}/bin',
+@@ -81,10 +81,10 @@
+         'data': '{userbase}',
+         },
+     'posix_user': {
+-        'stdlib': '{userbase}/lib/python{py_version_short}',
+-        'platstdlib': '{userbase}/lib/python{py_version_short}',
++        'stdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
++        'platstdlib': '{userbase}/'+sys.lib+'/python{py_version_short}',
+         'purelib': '{userbase}/lib/python{py_version_short}/site-packages',
+-        'platlib': '{userbase}/lib/python{py_version_short}/site-packages',
++        'platlib': '{userbase}/'+sys.lib+'/python{py_version_short}/site-packages',
+         'include': '{userbase}/include/python{py_version_short}',
+         'scripts': '{userbase}/bin',
+         'data': '{userbase}',
+Index: Python-3.3.2/configure.ac
+===================================================================
+--- Python-3.3.2.orig/configure.ac	2013-05-15 09:33:00.000000000 -0700
++++ Python-3.3.2/configure.ac	2013-07-27 16:19:54.111877246 -0700
+@@ -769,6 +769,41 @@
+ MULTIARCH=$($CC --print-multiarch 2>/dev/null)
+ AC_SUBST(MULTIARCH)
+ 
++AC_SUBST(ARCH)
++AC_MSG_CHECKING(ARCH)
++ARCH=`uname -m`
++case $ARCH in
++i?86) ARCH=i386;;
++esac
++AC_MSG_RESULT($ARCH)
++
++AC_SUBST(LIB)
++AC_MSG_CHECKING(LIB)
++case $ac_sys_system in
++Linux*)
++  # Test if the compiler is 64bit
++  echo 'int i;' > conftest.$ac_ext
++  python_cv_cc_64bit_output=no
++  if AC_TRY_EVAL(ac_compile); then
++    case `/usr/bin/file conftest.$ac_objext` in
++    *"ELF 64"*)
++      python_cv_cc_64bit_output=yes
++      ;;
++    esac
++  fi
++  rm -rf conftest*
++  ;;
++esac
++
++case $ARCH:$python_cv_cc_64bit_output in
++ppc64:yes | powerpc64:yes | s390x:yes | sparc64:yes | x86_64:yes)
++  LIB="lib64"
++  ;;
++*:*)
++  LIB="lib"
++  ;;
++esac
++AC_MSG_RESULT($LIB)
+ 
+ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
diff --git a/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch b/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
new file mode 100644
index 0000000..4ec627e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
@@ -0,0 +1,19 @@
+This patch removes the RPATH setting which contains a pointer to
+the target relocated sysroot, which is incorrect.
+
+Upstream-Status: Inappropriate [Embedded Specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: Python-2.6.6/setup.py
+===================================================================
+--- Python-2.6.6.orig/setup.py	2011-09-28 14:22:57.000000000 -0700
++++ Python-2.6.6/setup.py	2011-09-28 16:11:25.147279633 -0700
+@@ -1079,7 +1079,6 @@
+                                   include_dirs=["Modules/_sqlite",
+                                                 sqlite_incdir],
+                                   library_dirs=sqlite_libdir,
+-                                  runtime_library_dirs=sqlite_libdir,
+                                   extra_link_args=sqlite_extra_link_args,
+                                   libraries=["sqlite3",]))
+         else:
diff --git a/meta/recipes-devtools/python/python3/setuptweaks.patch b/meta/recipes-devtools/python/python3/setuptweaks.patch
new file mode 100644
index 0000000..c34ef16
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/setuptweaks.patch
@@ -0,0 +1,57 @@
+This patch removes various ways native system options can pass into the python 
+compilation and somehow break C modules.
+
+Upstream-Status: Configuration [OE Specific]
+
+RP 2012/04/23
+
+Index: Python-2.7.2/setup.py
+===================================================================
+--- Python-2.7.2.orig/setup.py	2012-04-23 20:03:47.295582553 +0000
++++ Python-2.7.2/setup.py	2012-04-23 20:03:15.000000000 +0000
+@@ -231,7 +231,13 @@
+         # compilers
+         if compiler is not None:
+             (ccshared,cflags) = sysconfig.get_config_vars('CCSHARED','CFLAGS')
+-            args['compiler_so'] = compiler + ' ' + ccshared + ' ' + cflags
++            # Need to filter out -isysroot from the flags. Ideally should 
++            # figure out target flags here.
++            flags = []
++            for f in cflags.split():
++                if not f.startswith("-isystem"):
++                    flags.append(f)
++            args['compiler_so'] = compiler + ' ' + ccshared + ' ' + ' '.join(flags)
+         self.compiler.set_executables(**args)
+ 
+         build_ext.build_extensions(self)
+@@ -393,7 +399,6 @@
+         # into configure and stored in the Makefile (issue found on OS X 10.3).
+         for env_var, arg_name, dir_list in (
+                 ('LDFLAGS', '-R', self.compiler.runtime_library_dirs),
+-                ('LDFLAGS', '-L', self.compiler.library_dirs),
+                 ('CPPFLAGS', '-I', self.compiler.include_dirs)):
+             env_val = sysconfig.get_config_var(env_var)
+             if env_val:
+@@ -419,16 +424,16 @@
+                     for directory in reversed(options.dirs):
+                         add_dir_to_list(dir_list, directory)
+ 
+-        if os.path.normpath(sys.prefix) != '/usr' \
+-                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
++#        if os.path.normpath(sys.prefix) != '/usr' \
++#                and not sysconfig.get_config_var('PYTHONFRAMEWORK'):
+             # OSX note: Don't add LIBDIR and INCLUDEDIR to building a framework
+             # (PYTHONFRAMEWORK is set) to avoid # linking problems when
+             # building a framework with different architectures than
+             # the one that is currently installed (issue #7473)
+-            add_dir_to_list(self.compiler.library_dirs,
+-                            sysconfig.get_config_var("LIBDIR"))
+-            add_dir_to_list(self.compiler.include_dirs,
+-                            sysconfig.get_config_var("INCLUDEDIR"))
++#            add_dir_to_list(self.compiler.library_dirs,
++#                            sysconfig.get_config_var("LIBDIR"))
++#            add_dir_to_list(self.compiler.include_dirs,
++#                            sysconfig.get_config_var("INCLUDEDIR"))
+ 
+         try:
+             have_unicode = unicode
diff --git a/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch b/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
new file mode 100644
index 0000000..802b1c7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
@@ -0,0 +1,17 @@
+shutils should consider symlinks
+
+-Khem
+
+Upstream-Status: Pending
+
+--- a/Lib/shutil.py	2013-01-29 12:31:06.926555779 -0800
++++ b/Lib/shutil.py	2013-01-29 16:31:39.097554182 -0800
+@@ -132,7 +132,7 @@ def copymode(src, dst, *, follow_symlink
+     st = stat_func(src)
+     chmod_func(dst, stat.S_IMODE(st.st_mode))
+ 
+-if hasattr(os, 'listxattr'):
++if hasattr(os, 'listxattr') and os.listxattr in os.supports_follow_symlinks:
+     def _copyxattr(src, dst, *, follow_symlinks=True):
+         """Copy extended filesystem attributes from `src` to `dst`.
+ 
diff --git a/meta/recipes-devtools/python/python3/sitecustomize.py b/meta/recipes-devtools/python/python3/sitecustomize.py
new file mode 100644
index 0000000..4c8b5e2
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/sitecustomize.py
@@ -0,0 +1,37 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch b/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
new file mode 100644
index 0000000..506210f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Accepted [http://hg.python.org/cpython/rev/c816479f6aaf/]
+Bugtracker: http://bugs.python.org/issue12326
+
+[Removed "Misc/NEWS" hunk]
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+
+# HG changeset patch
+# User Victor Stinner <victor.stinner@haypocalc.com>
+# Date 1313841758 -7200
+# Node ID c816479f6aaf71dbd3f3fe4b239186d60c55ce48
+# Parent  3e093590ac57fdda428c7da3f72ddf0c475ecf2b
+Issue #12326: sys.platform is now always 'linux2' on Linux
+
+Even if Python is compiled on Linux 3.
+
+Index: Python-3.3.0rc2/configure.ac
+===================================================================
+--- Python-3.3.0rc2.orig/configure.ac	2012-09-09 02:11:14.000000000 -0700
++++ Python-3.3.0rc2/configure.ac	2012-09-20 00:44:03.317124001 -0700
+@@ -366,7 +366,7 @@
+     MACHDEP="$ac_md_system$ac_md_release"
+ 
+     case $MACHDEP in
+-	linux*) MACHDEP="linux";;
++	linux*) MACHDEP="linux2";;
+ 	cygwin*) MACHDEP="cygwin";;
+ 	darwin*) MACHDEP="darwin";;
+ 	irix646) MACHDEP="irix6";;
diff --git a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
new file mode 100644
index 0000000..785b556
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
@@ -0,0 +1,35 @@
+Dont search hardcoded paths, we might be doing a cross-build
+Use '=' in-front to let compiler append sysroot, if it can
+
+Should fix things like
+
+configure:6972: arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 -DNDEBUG -fno-inline -D__SOFTFP__ --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -c -O2 -pipe -g -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
+cc1: warning: include location "/usr/include/ncursesw" is unsafe for cross-compilation [-Wpoison-system-directories]
+
+
+Signed-off-by: Khem Raj
+Upstream-Status: Pending
+
+
+Index: Python-3.3.2/setup.py
+===================================================================
+--- Python-3.3.2.orig/setup.py	2013-07-30 01:30:48.000000000 -0700
++++ Python-3.3.2/setup.py	2013-07-30 01:41:11.697862723 -0700
+@@ -1210,7 +1210,7 @@
+         panel_library = 'panel'
+         if curses_library == 'ncursesw':
+             curses_defines.append(('HAVE_NCURSESW', '1'))
+-            curses_includes.append('/usr/include/ncursesw')
++            curses_includes.append('=/usr/include/ncursesw')
+             # Bug 1464056: If _curses.so links with ncursesw,
+             # _curses_panel.so must link with panelw.
+             panel_library = 'panelw'
+@@ -1819,7 +1819,7 @@
+         if host_platform == 'darwin':
+             # OS X 10.5 comes with libffi.dylib; the include files are
+             # in /usr/include/ffi
+-            inc_dirs.append('/usr/include/ffi')
++            inc_dirs.append('=/usr/include/ffi')
+ 
+         ffi_inc = [sysconfig.get_config_var("LIBFFI_INCLUDEDIR")]
+         if not ffi_inc or ffi_inc[0] == '':
diff --git a/meta/recipes-devtools/python/python3/unixccompiler.patch b/meta/recipes-devtools/python/python3/unixccompiler.patch
new file mode 100644
index 0000000..b2229b4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/unixccompiler.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Pending
+
+The CC variable,sometimes like:"x86_64-poky-linux-gcc   -m64 --sysroot=/${TMPDIR}/sysroots/qemux86-64", contains option information. 
+This will lead to wrong compiler name "qemux86-64" rather than "x86_64-poky-linux-gcc" when python finding the compiler name.
+
+Secondly add -L=<path> this way linker will be able to resolve /usr/lib w.r.t sysroot and not
+use hardcoded /usr/lib to look for libs which is wrong in cross compile environment and this will work
+ok on native systems too since sysroot for native compilers is /
+
+Signed-off-by: Mei Lei <lei.mei@intel.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: Python-3.3.2/Lib/distutils/unixccompiler.py
+===================================================================
+--- Python-3.3.2.orig/Lib/distutils/unixccompiler.py	2013-05-15 09:32:54.000000000 -0700
++++ Python-3.3.2/Lib/distutils/unixccompiler.py	2013-08-01 00:58:18.629056286 -0700
+@@ -202,7 +202,7 @@
+     # ccompiler.py.
+ 
+     def library_dir_option(self, dir):
+-        return "-L" + dir
++        return "-L=" + dir
+ 
+     def _is_gcc(self, compiler_name):
+         return "gcc" in compiler_name or "g++" in compiler_name
+@@ -221,7 +221,7 @@
+         # this time, there's no way to determine this information from
+         # the configuration data stored in the Python installation, so
+         # we use this hack.
+-        compiler = os.path.basename(sysconfig.get_config_var("CC"))
++        compiler = sysconfig.get_config_var("CC")
+         if sys.platform[:6] == "darwin":
+             # MacOSX's linker doesn't understand the -R flag at all
+             return "-L" + dir
diff --git a/meta/recipes-devtools/python/python3_3.3.2.bb b/meta/recipes-devtools/python/python3_3.3.2.bb
new file mode 100644
index 0000000..e77ad49
--- /dev/null
+++ b/meta/recipes-devtools/python/python3_3.3.2.bb
@@ -0,0 +1,205 @@
+require recipes-devtools/python/python.inc
+
+DEPENDS = "python3-native libffi bzip2 db gdbm openssl readline sqlite3 zlib virtual/libintl xz"
+PR = "${INC_PR}.0"
+PYTHON_MAJMIN = "3.3"
+PYTHON_BINABI= "${PYTHON_MAJMIN}m"
+DISTRO_SRC_URI ?= "file://sitecustomize.py"
+DISTRO_SRC_URI_linuxstdbase = ""
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+file://12-distutils-prefix-is-inside-staging-area.patch \
+file://000-cross-compile.patch \
+file://020-dont-compile-python-files.patch \
+file://030-fixup-include-dirs.patch \
+file://070-dont-clean-ipkg-install.patch \
+file://080-distutils-dont_adjust_files.patch \
+file://110-enable-zlib.patch \
+file://130-readline-setup.patch \
+file://150-fix-setupterm.patch \
+file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+${DISTRO_SRC_URI} \
+"
+
+SRC_URI += "\
+            file://03-fix-tkinter-detection.patch \
+            file://04-default-is-optimized.patch \
+            file://avoid_warning_about_tkinter.patch \
+            file://06-ctypes-libffi-fix-configure.patch \
+            file://remove_sqlite_rpath.patch \
+            file://cgi_py.patch \
+            file://host_include_contamination.patch \
+            file://python-3.3-multilib.patch \
+            file://shutil-follow-symlink-fix.patch \
+            file://sysroot-include-headers.patch \
+            file://unixccompiler.patch \
+           "
+SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
+SRC_URI[sha256sum] = "f77202fe2bbc203205d7bd6e8452567fa1d9bc97f6957c9ef753d9a36cdcbe9a"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a7e738bb078a33a825ce4a0282f8cb31"
+
+S = "${WORKDIR}/Python-${PV}"
+
+inherit autotools multilib_header python3native pkgconfig
+
+CONFIGUREOPTS += " --with-system-ffi "
+
+CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
+                ac_cv_have_lchflags=no \
+                ac_cv_have_long_long_format=yes \
+                ac_cv_buggy_getaddrinfo=no \
+                ac_cv_file__dev_ptmx=yes \
+                ac_cv_file__dev_ptc=no \
+"
+# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
+#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
+TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
+TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
+EXTRA_OEMAKE += "CROSS_COMPILE=yes"
+
+do_configure_prepend() {
+	rm -f ${S}/Makefile.orig
+	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+}
+
+do_compile() {
+        # regenerate platform specific files, because they depend on system headers
+        cd Lib/plat-linux*
+        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+                ${S}/Tools/scripts/h2py.py -i '(u_long)' \
+                ${STAGING_INCDIR}/dlfcn.h \
+                ${STAGING_INCDIR}/linux/cdrom.h \
+                ${STAGING_INCDIR}/netinet/in.h \
+                ${STAGING_INCDIR}/sys/types.h
+        sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
+        cd -
+
+	#
+	# Copy config.h and an appropriate Makefile for distutils.sysconfig,
+	# which laters uses the information out of these to compile extensions
+	#
+	# The following part (until python compilation) should probably moved to an
+	# -initial recipe to handle staging better
+	#
+	install -d ${STAGING_INCDIR}/python${PYTHON_BINABI}/
+	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_BINABI}/
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', Makefile
+
+	# remove any bogus LD_LIBRARY_PATH
+	sed -i -e s,RUNSHARED=.*,RUNSHARED=, Makefile
+
+	if [ ! -f Makefile.orig ]; then
+		install -m 0644 Makefile Makefile.orig
+	fi
+	sed -i -e 's,^LDFLAGS=.*,LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
+		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
+		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
+		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
+		-e 's,includedir=${includedir},includedir=${STAGING_INCDIR},g' \
+		-e 's,^INCLUDEDIR=.*,INCLUDE=${STAGING_INCDIR},g' \
+		-e 's,^CONFINCLUDEDIR=.*,CONFINCLUDE=${STAGING_INCDIR},g' \
+		Makefile
+	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	# save copy of it now, because if we do it in do_install and 
+	# then call do_install twice we get Makefile.orig == Makefile.sysroot
+	install -m 0644 Makefile Makefile.sysroot
+
+	export CROSS_COMPILE="${TARGET_PREFIX}"
+	export PYTHONBUILDDIR="${S}"
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		OPT="${CFLAGS}" libpython3.so
+
+	oe_libinstall -so libpython${PYTHON_BINABI} ${STAGING_LIBDIR}
+
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		OPT="${CFLAGS}"
+}
+
+do_install() {
+	# make install needs the original Makefile, or otherwise the inclues would
+	# go to ${D}${STAGING...}/...
+	install -m 0644 Makefile.orig Makefile
+
+	export CROSS_COMPILE="${TARGET_PREFIX}"
+	export PYTHONBUILDDIR="${S}"
+	install -d ${D}${libdir}/pkgconfig
+	install -d ${D}${libdir}/python${PYTHON_MAJMIN}/config
+	
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native3/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python-native3/python3 \
+		CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		LIB=${baselib} \
+		ARCH=${TARGET_ARCH} \
+		DESTDIR=${D} LIBDIR=${libdir} install
+
+	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+
+	if [ -e ${WORKDIR}/sitecustomize.py ]; then
+		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+	fi
+
+	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+}
+
+SSTATE_SCAN_FILES += "Makefile"
+PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
+
+py_package_preprocess () {
+	# copy back the old Makefile to fix target package
+	install -m 0644 Makefile.orig ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+require python-${PYTHON_MAJMIN}-manifest.inc
+
+# manual dependency additions
+RPROVIDES_${PN}-core = "${PN}"
+RRECOMMENDS_${PN}-core = "${PN}-readline"
+RRECOMMENDS_${PN}-crypt = "openssl"
+RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
+
+FILES_${PN}-2to3 += "${bindir}/2to3-${PYTHON_MAJMIN}"
+FILES_${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
+FILES_${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
+
+PACKAGES =+ "${PN}-pyvenv"
+FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
+
+# package libpython3
+PACKAGES =+ "libpython3 libpython3-staticdev"
+FILES_libpython3 = "${libdir}/libpython*.so.*"
+FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
+
+# catch debug extensions (isn't that already in python-core-dbg?)
+FILES_${PN}-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+
+# catch all the rest (unsorted)
+PACKAGES += "${PN}-misc"
+FILES_${PN}-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "${PN}-man"
+FILES_${PN}-man = "${datadir}/man"
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.8.4


