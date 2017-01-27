Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B1D5E77390
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:13:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 Jan 2017 02:13:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,294,1477983600"; d="scan'208";a="36227337"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2017 02:13:34 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 12:13:24 +0200
Message-Id: <20170127101331.14389-4-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170127101331.14389-1-markus.lehtonen@linux.intel.com>
References: <20170127101331.14389-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH RFC 03/10] python3: add python-profile-opt3 recipe
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
X-List-Received-Date: Fri, 27 Jan 2017 10:13:34 -0000

Similar to python-profile-opt for Python 2.7, this is a special version
of Python3 used for profile guided optimization. It is used for
generating profile data on the target device. Libpython3 is renamed to
libpython-profile-opt3 in order to prevent soname clash with "normal"
libpython3.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/python/python-profile-opt3   |   1 +
 .../python/python-profile-opt3_3.5.2.bb            |  15 +++
 ...efile-add-install_generate_profile-target.patch |  25 +++++
 ...name-libpython3-to-libpython-profile-opt3.patch | 111 +++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.2.bb      |  46 +++++----
 5 files changed, 178 insertions(+), 20 deletions(-)
 create mode 120000 meta/recipes-devtools/python/python-profile-opt3
 create mode 100644 meta/recipes-devtools/python/python-profile-opt3_3.5.2.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch

diff --git a/meta/recipes-devtools/python/python-profile-opt3 b/meta/recipes-devtools/python/python-profile-opt3
new file mode 120000
index 0000000..b8a0adb
--- /dev/null
+++ b/meta/recipes-devtools/python/python-profile-opt3
@@ -0,0 +1 @@
+python3
\ No newline at end of file
diff --git a/meta/recipes-devtools/python/python-profile-opt3_3.5.2.bb b/meta/recipes-devtools/python/python-profile-opt3_3.5.2.bb
new file mode 100644
index 0000000..e85807f
--- /dev/null
+++ b/meta/recipes-devtools/python/python-profile-opt3_3.5.2.bb
@@ -0,0 +1,15 @@
+require python3_${PV}.bb
+
+SRC_URI += "file://rename-libpython3-to-libpython-profile-opt3.patch \
+            file://Makefile-add-install_generate_profile-target.patch \
+           "
+
+# Use special prefix in order to prevent clash with the normal python3 package
+STAGING_INCDIR_DEFAULT = "${STAGING_DIR_HOST}/usr/include"
+STAGING_LIBDIR_DEFAULT = "${STAGING_DIR_HOST}/usr/${baselib}"
+TARGET_CFLAGS += "-I${STAGING_INCDIR_DEFAULT}"
+TARGET_CPPFLAGS += "-I${STAGING_INCDIR_DEFAULT}"
+prefix = "/opt"
+exec_prefix = "/opt"
+
+PYTHON3_MAKE_TARGET = "build_all_generate_profile"
diff --git a/meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch b/meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
new file mode 100644
index 0000000..7aee7fb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
@@ -0,0 +1,25 @@
+Makefile: add install_generate_profile target
+
+Making it possible to install the binaries with profile generation
+enabled. We need this as linking is also performed at the install stage.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 2b87614..826155b 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -1046,6 +1046,8 @@ QUICKTESTOPTS=	$(TESTOPTS) -x test_subprocess test_io test_lib2to3 \
+ quicktest:	all platform
+ 		$(TESTRUNNER) $(QUICKTESTOPTS)
+ 
++install_generate_profile:
++	$(MAKE) install LDFLAGS="$(LDFLAGS) $(PGO_PROF_GEN_FLAG) @LTOFLAGS@" LIBS="$(LIBS)"
+ 
+ install: @FRAMEWORKINSTALLFIRST@ commoninstall bininstall maninstall @FRAMEWORKINSTALLLAST@
+ 	if test "x$(ENSUREPIP)" != "xno"  ; then \
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch b/meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
new file mode 100644
index 0000000..4ba5531
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
@@ -0,0 +1,111 @@
+rename libpython3 to libpython-profile-opt3
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+
+diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
+index f03a4e3..4c65aff 100644
+--- a/Lib/distutils/command/build_ext.py
++++ b/Lib/distutils/command/build_ext.py
+@@ -746,7 +746,7 @@ class build_ext(Command):
+         else:
+             from distutils import sysconfig
+             if sysconfig.get_config_var('Py_ENABLE_SHARED'):
+-                pythonlib = 'python{}.{}{}'.format(
++                pythonlib = 'python-profile-opt{}.{}{}'.format(
+                     sys.hexversion >> 24, (sys.hexversion >> 16) & 0xff,
+                     sysconfig.get_config_var('ABIFLAGS'))
+                 return ext.libraries + [pythonlib]
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index bace00e..2b87614 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -622,7 +622,7 @@ $(LIBRARY): $(LIBRARY_OBJS)
+ 	$(AR) $(ARFLAGS) $@ $(MODOBJS)
+ 	$(RANLIB) $@
+ 
+-libpython$(LDVERSION).so: $(LIBRARY_OBJS)
++libpython-profile-opt$(LDVERSION).so: $(LIBRARY_OBJS)
+ 	if test $(INSTSONAME) != $(LDLIBRARY); then \
+ 		$(BLDSHARED) -Wl,-h$(INSTSONAME) -o $(INSTSONAME) $(LIBRARY_OBJS) $(MODLIBS) $(SHLIBS) $(LIBC) $(LIBM) $(LDLAST); \
+ 		$(LN) -f $(INSTSONAME) $@; \
+@@ -630,7 +630,7 @@ libpython$(LDVERSION).so: $(LIBRARY_OBJS)
+ 		$(BLDSHARED) -o $@ $(LIBRARY_OBJS) $(MODLIBS) $(SHLIBS) $(LIBC) $(LIBM) $(LDLAST); \
+ 	fi
+ 
+-libpython3.so:	libpython$(LDVERSION).so
++libpython-profile-opt3.so:	libpython-profile-opt$(LDVERSION).so
+ 	$(BLDSHARED) $(NO_AS_NEEDED) -o $@ -Wl,-h$@ $^
+ 
+ libpython$(LDVERSION).dylib: $(LIBRARY_OBJS)
+diff --git a/Misc/python-config.in b/Misc/python-config.in
+index a808f1a..0dcc615 100644
+--- a/Misc/python-config.in
++++ b/Misc/python-config.in
+@@ -47,7 +47,7 @@ for opt in opt_flags:
+         print(' '.join(flags))
+ 
+     elif opt in ('--libs', '--ldflags'):
+-        libs = ['-lpython' + pyver + sys.abiflags]
++        libs = ['-lpython-profile-opt' + pyver + sys.abiflags]
+         libs += getvar('LIBS').split()
+         libs += getvar('SYSLIBS').split()
+         # add the prefix/lib/pythonX.Y/config dir, but only if there is no
+diff --git a/Misc/python-config.sh.in b/Misc/python-config.sh.in
+index 30c6927..efad748 100644
+--- a/Misc/python-config.sh.in
++++ b/Misc/python-config.sh.in
+@@ -40,7 +40,7 @@ LIBM="@LIBM@"
+ LIBC="@LIBC@"
+ SYSLIBS="$LIBM $LIBC"
+ ABIFLAGS="@ABIFLAGS@"
+-LIBS="-lpython${VERSION}${ABIFLAGS} @LIBS@ $SYSLIBS"
++LIBS="-lpython-profile-opt${VERSION}${ABIFLAGS} @LIBS@ $SYSLIBS"
+ BASECFLAGS="@BASECFLAGS@"
+ LDLIBRARY="@LDLIBRARY@"
+ LINKFORSHARED="@LINKFORSHARED@"
+diff --git a/Misc/python.pc.in b/Misc/python.pc.in
+index ae69867..b73d027 100644
+--- a/Misc/python.pc.in
++++ b/Misc/python.pc.in
+@@ -9,5 +9,5 @@ Description: Python library
+ Requires: 
+ Version: @VERSION@
+ Libs.private: @LIBS@
+-Libs: -L${libdir} -lpython@VERSION@@ABIFLAGS@
++Libs: -L${libdir} -lpython-profile-opt@VERSION@@ABIFLAGS@
+ Cflags: -I${includedir}/python@VERSION@@ABIFLAGS@
+diff --git a/configure.ac b/configure.ac
+index 6bd9322..4bf3dc2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -990,7 +990,7 @@ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
+ if test -z "$LIBRARY"
+ then
+-	LIBRARY='libpython$(VERSION)$(ABIFLAGS).a'
++	LIBRARY='libpython-profile-opt$(VERSION)$(ABIFLAGS).a'
+ fi
+ AC_MSG_RESULT($LIBRARY)
+ 
+@@ -1151,13 +1151,13 @@ if test $enable_shared = "yes"; then
+ 	  fi
+           ;;
+     Linux*|GNU*|NetBSD*|FreeBSD*|DragonFly*|OpenBSD*)
+-	  LDLIBRARY='libpython$(LDVERSION).so'
+-	  BLDLIBRARY='-L. -lpython$(LDVERSION)'
++	  LDLIBRARY='libpython-profile-opt$(LDVERSION).so'
++	  BLDLIBRARY='-L. -lpython-profile-opt$(LDVERSION)'
+ 	  RUNSHARED=LD_LIBRARY_PATH=`pwd`${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
+ 	  INSTSONAME="$LDLIBRARY".$SOVERSION
+ 	  if test "$with_pydebug" != yes
+           then
+-	      PY3LIBRARY=libpython3.so
++	      PY3LIBRARY=libpython-profile-opt3.so
+ 	  fi
+ 	  ;;
+     hp*|HP*)
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index bde9c95..609c28f 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -69,6 +69,10 @@ export _PYTHON_PROJECT_BASE = "${B}"
 export _PYTHON_PROJECT_SRC = "${S}"
 export CCSHARED = "-fPIC"
 
+# These enable build with modified prefix (used in python3-prorile-opt recipe)
+STAGING_INCDIR_DEFAULT ?= "${STAGING_INCDIR}"
+STAGING_LIBDIR_DEFAULT ?= "${STAGING_LIBDIR}"
+
 # Fix cross compilation of different modules
 export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/:${B}/build/lib.linux-${TARGET_ARCH}-${PYTHON_MAJMIN}:${S}/Lib:${S}/Lib/plat-linux"
 
@@ -83,12 +87,12 @@ do_configure_append() {
 do_compile() {
         # regenerate platform specific files, because they depend on system headers
         cd ${S}/Lib/plat-linux*
-        include=${STAGING_INCDIR} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+        include=${STAGING_INCDIR_DEFAULT} ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
                 ${S}/Tools/scripts/h2py.py -i '(u_long)' \
-                ${STAGING_INCDIR}/dlfcn.h \
-                ${STAGING_INCDIR}/linux/cdrom.h \
-                ${STAGING_INCDIR}/netinet/in.h \
-                ${STAGING_INCDIR}/sys/types.h
+                ${STAGING_INCDIR_DEFAULT}/dlfcn.h \
+                ${STAGING_INCDIR_DEFAULT}/linux/cdrom.h \
+                ${STAGING_INCDIR_DEFAULT}/netinet/in.h \
+                ${STAGING_INCDIR_DEFAULT}/sys/types.h
         sed -e 's,${STAGING_DIR_HOST},,g' -i *.py
         cd -
 
@@ -99,7 +103,7 @@ do_compile() {
 	if [ ! -f Makefile.orig ]; then
 		install -m 0644 Makefile Makefile.orig
 	fi
-	sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L. -L${STAGING_LIBDIR},g' \
+	sed -i -e 's,^CONFIGURE_LDFLAGS=.*,CONFIGURE_LDFLAGS=-L. -L${STAGING_LIBDIR_DEFAULT},g' \
 		-e 's,libdir=${libdir},libdir=${STAGING_LIBDIR},g' \
 		-e 's,libexecdir=${libexecdir},libexecdir=${STAGING_DIR_HOST}${libexecdir},g' \
 		-e 's,^LIBDIR=.*,LIBDIR=${STAGING_LIBDIR},g' \
@@ -111,14 +115,10 @@ do_compile() {
 	# then call do_install twice we get Makefile.orig == Makefile.sysroot
 	install -m 0644 Makefile Makefile.sysroot
 
-	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
-		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
-		STAGING_LIBDIR=${STAGING_LIBDIR} \
-		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		STAGING_INCDIR=${STAGING_INCDIR} \
-		LIB=${baselib} \
-		ARCH=${TARGET_ARCH} \
-		OPT="${CFLAGS}" libpython3.so
+    if [ "${PYTHON3_MAKE_TARGET}" = "build_all_generate_profile" ]; then
+        # This is only used in PGO profiling by python-profile-opt package
+        export EXTRA_CFLAGS="-fprofile-dir=./python3-pgo-profiles/"
+    fi
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
@@ -127,7 +127,7 @@ do_compile() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
-		OPT="${CFLAGS}"
+		OPT="${CFLAGS}" ${PYTHON3_MAKE_TARGET}
 }
 
 do_install() {
@@ -147,8 +147,14 @@ do_install() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
-		DESTDIR=${D} LIBDIR=${libdir}
+		DESTDIR=${D} LIBDIR=${libdir} ${PYTHON3_MAKE_TARGET}
 	
+    if [ "${PYTHON3_MAKE_TARGET}" = "build_all_generate_profile" ]; then
+        # Need special make install if pgo generation is enabled
+        _PYTHON3_MAKE_INSTALL_TARGET="install_generate_profile"
+    else
+        _PYTHON3_MAKE_INSTALL_TARGET="install"
+    fi
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python3-native/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -156,7 +162,7 @@ do_install() {
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
-		DESTDIR=${D} LIBDIR=${libdir} install
+		DESTDIR=${D} LIBDIR=${libdir} ${_PYTHON3_MAKE_INSTALL_TARGET}
 
 	# avoid conflict with 2to3 from Python 2
 	rm -f ${D}/${bindir}/2to3
@@ -205,9 +211,9 @@ PACKAGES =+ "${PN}-pyvenv"
 FILES_${PN}-pyvenv += "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyvenv"
 
 # package libpython3
-PACKAGES =+ "libpython3 libpython3-staticdev"
-FILES_libpython3 = "${libdir}/libpython*.so.*"
-FILES_libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/libpython${PYTHON_BINABI}.a"
+PACKAGES =+ "lib${BPN} lib${BPN}-staticdev"
+FILES_lib${BPN} = "${libdir}/libpython*.so.*"
+FILES_lib${BPN}-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_BINABI}/lib${BPN}*.a"
 INSANE_SKIP_${PN}-dev += "dev-elf"
 
 # catch all the rest (unsorted)
-- 
2.10.2


