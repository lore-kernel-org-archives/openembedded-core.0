Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D183A608B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109497956"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:53:50 +0300
Message-Id: <36a1b40dad949f56d357cfa5c99b9352c4d50b06.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/45] python-native, python3-native: remove the use of exported HOST_SYS and BUILD_SYS variables
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
X-List-Received-Date: Tue, 24 May 2016 11:53:53 -0000

The code that utilized them was superseded by the code (in the same patch!)
that is utilizing STAGING_LIBDIR/STAGING_INCDIR, and wasn't correct in the
first place as HOST_SYS is not necessarily the same as the sysroot directory
name.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/distutils-tools.bbclass               |  4 --
 meta/classes/distutils.bbclass                     |  4 --
 meta/classes/distutils3.bbclass                    | 24 --------
 meta/classes/gobject-introspection.bbclass         |  2 -
 meta/recipes-core/libxml/libxml2_2.9.3.bb          |  2 -
 meta/recipes-devtools/gdb/gdb-cross.inc            |  2 -
 meta/recipes-devtools/python/python-dbus_1.2.0.bb  |  3 -
 ...2-distutils-prefix-is-inside-staging-area.patch | 65 ----------------------
 .../python/python-native_2.7.11.bb                 |  4 +-
 .../recipes-devtools/python/python-numpy_1.10.4.bb |  1 -
 .../python/python-pycairo_1.10.0.bb                |  2 +-
 ...et-the-prefix-to-be-inside-staging-direct.patch | 51 +++++++++++++++++
 .../python/python3-native_3.5.1.bb                 |  2 -
 ...2-distutils-prefix-is-inside-staging-area.patch | 49 +++-------------
 meta/recipes-devtools/python/python3_3.5.1.bb      |  4 --
 meta/recipes-devtools/python/python_2.7.11.bb      |  3 -
 meta/recipes-extended/newt/libnewt_0.52.18.bb      |  3 -
 .../gobject-introspection_1.46.0.bb                |  2 -
 meta/recipes-kernel/perf/perf.bb                   |  2 -
 19 files changed, 62 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
 create mode 100644 meta/recipes-devtools/python/python/0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch

diff --git a/meta/classes/distutils-tools.bbclass b/meta/classes/distutils-tools.bbclass
index 8d9b3f7..3ef9cc5 100644
--- a/meta/classes/distutils-tools.bbclass
+++ b/meta/classes/distutils-tools.bbclass
@@ -8,14 +8,12 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
 distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
-         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
          bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
 }
@@ -25,7 +23,6 @@ distutils_stage_all() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
 }
@@ -37,7 +34,6 @@ distutils_do_install() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}/${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index da48a2e..857572d 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -10,14 +10,12 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
 distutils_do_compile() {
          STAGING_INCDIR=${STAGING_INCDIR} \
          STAGING_LIBDIR=${STAGING_LIBDIR} \
-         BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
          ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
          bbfatal_log "${PYTHON_PN} setup.py build execution failed."
 }
 
 distutils_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
 }
@@ -27,7 +25,6 @@ distutils_stage_all() {
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
 }
@@ -37,7 +34,6 @@ distutils_do_install() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
index 4f6ca44..a6720c5 100644
--- a/meta/classes/distutils3.bbclass
+++ b/meta/classes/distutils3.bbclass
@@ -9,14 +9,8 @@ DISTUTILS_INSTALL_ARGS ?= "--prefix=${D}/${prefix} \
     --install-data=${D}/${datadir}"
 
 distutils3_do_compile() {
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
         build ${DISTUTILS_BUILD_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py build_ext execution failed."
@@ -25,28 +19,16 @@ distutils3_do_compile[vardepsexclude] = "MACHINE"
 
 distutils3_stage_headers() {
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install_headers ${DISTUTILS_STAGE_HEADERS_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install_headers execution failed."
 }
 distutils3_stage_headers[vardepsexclude] = "MACHINE"
 
 distutils3_stage_all() {
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         install -d ${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR}
         PYTHONPATH=${STAGING_DIR_HOST}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install ${DISTUTILS_STAGE_ALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install (stage) execution failed."
 }
@@ -54,15 +36,9 @@ distutils3_stage_all[vardepsexclude] = "MACHINE"
 
 distutils3_do_install() {
         install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-        if [ ${BUILD_SYS} != ${HOST_SYS} ]; then
-                SYS=${MACHINE}
-        else
-                SYS=${HOST_SYS}
-        fi
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        BUILD_SYS=${BUILD_SYS} HOST_SYS=${SYS} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py install --install-lib=${D}/${PYTHON_SITEPACKAGES_DIR} ${DISTUTILS_INSTALL_ARGS} || \
         bbfatal_log "${PYTHON_PN} setup.py install execution failed."
 
diff --git a/meta/classes/gobject-introspection.bbclass b/meta/classes/gobject-introspection.bbclass
index 2d73e40..364c9d3 100644
--- a/meta/classes/gobject-introspection.bbclass
+++ b/meta/classes/gobject-introspection.bbclass
@@ -13,8 +13,6 @@ DEPENDS_append = " gobject-introspection gobject-introspection-native qemu-nativ
 
 # This is necessary for python scripts to succeed - distutils fails if these
 # are not set
-export BUILD_SYS
-export HOST_SYS
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.3.bb b/meta/recipes-core/libxml/libxml2_2.9.3.bb
index 481346c..ae65159 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.3.bb
@@ -49,8 +49,6 @@ EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook --with-c14n -
 EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook --with-c14n --without-lzma --with-zlib"
 
 # required for python binding
-export HOST_SYS
-export BUILD_SYS
 export STAGING_LIBDIR
 export STAGING_INCDIR
 
diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 2468d23..c62715f 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -10,8 +10,6 @@ PACKAGECONFIG[python] = "--with-python=${STAGING_BINDIR_NATIVE}/python-native/py
 PACKAGECONFIG[readline] = "--with-system-readline,--without-system-readline,readline-native"
 
 do_compile_prepend() {
-    export BUILD_SYS="${BUILD_SYS}"
-    export HOST_SYS="${HOST_SYS}"
     export STAGING_LIBDIR="${STAGING_LIBDIR_NATIVE}"
     export STAGING_INCDIR="${STAGING_INCDIR_NATIVE}"
 }
diff --git a/meta/recipes-devtools/python/python-dbus_1.2.0.bb b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
index b314dce..ccdb9ae 100644
--- a/meta/recipes-devtools/python/python-dbus_1.2.0.bb
+++ b/meta/recipes-devtools/python/python-dbus_1.2.0.bb
@@ -18,9 +18,6 @@ PACKAGECONFIG ?= ""
 PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python-docutils-native"
 PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python-docutils-native python-epydoc-native"
 
-export BUILD_SYS
-export HOST_SYS
-
 export STAGING_LIBDIR
 export STAGING_INCDIR
 
diff --git a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
deleted file mode 100644
index f89aaff..0000000
--- a/meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# The proper prefix is inside our staging area.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-# Signed-off-by: Phil Blundell <philb@gnu.org>
-
---- Python-2.6.6/Lib/distutils/sysconfig.py.orig	2012-01-03 14:02:03.027005296 +0000
-+++ Python-2.6.6/Lib/distutils/sysconfig.py	2012-01-03 14:02:31.517601081 +0000
-@@ -19,8 +19,8 @@
- from distutils.errors import DistutilsPlatformError
- 
- # These are needed in a couple of spots, so just compute them once.
--PREFIX = os.path.normpath(sys.prefix)
--EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
-+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
-+EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
-@@ -70,7 +70,7 @@
-     sys.exec_prefix -- i.e., ignore 'plat_specific'.
-     """
-     if prefix is None:
--        prefix = plat_specific and EXEC_PREFIX or PREFIX
-+        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
- 
-     if os.name == "posix":
-         if python_build:
-@@ -115,12 +115,16 @@
-     If 'prefix' is supplied, use it instead of sys.prefix or
-     sys.exec_prefix -- i.e., ignore 'plat_specific'.
-     """
-+    lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
-     if prefix is None:
--        prefix = plat_specific and EXEC_PREFIX or PREFIX
-+        if plat_specific:
-+            prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
-+        else:
-+            prefix = PREFIX
- 
-     if os.name == "posix":
-         libpython = os.path.join(prefix,
--                                 "lib", "python" + get_python_version())
-+                                 lib_basename, "python" + get_python_version())
-         if standard_lib:
-             return libpython
-         else:
-@@ -216,7 +220,7 @@
-     else:
-         # The name of the config.h file changed in 2.2
-         config_h = 'pyconfig.h'
--    return os.path.join(inc_dir, config_h)
-+    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- 
- def get_makefile_filename():
-@@ -225,7 +229,7 @@
-         return os.path.join(os.path.dirname(os.path.realpath(sys.executable)),
-                             "Makefile")
-     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
--    return os.path.join(lib_dir, "config", "Makefile")
-+    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- 
- def parse_config_h(fp, g=None):
diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb b/meta/recipes-devtools/python/python-native_2.7.11.bb
index abb69fc..31192ca 100644
--- a/meta/recipes-devtools/python/python-native_2.7.11.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.11.bb
@@ -8,7 +8,7 @@ SRC_URI += "\
             file://05-enable-ctypes-cross-build.patch \
             file://10-distutils-fix-swig-parameter.patch \
             file://11-distutils-never-modify-shebang-line.patch \
-            file://12-distutils-prefix-is-inside-staging-area.patch \
+            file://0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch \
             file://debug.patch \
             file://unixccompiler.patch \
             file://nohostlibs.patch \
@@ -30,8 +30,6 @@ RPROVIDES += "python-distutils-native python-compression-native python-textutils
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --with-system-expat=${STAGING_DIR_HOST}"
 
 EXTRA_OEMAKE = '\
-  BUILD_SYS="" \
-  HOST_SYS="" \
   LIBC="" \
   STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
diff --git a/meta/recipes-devtools/python/python-numpy_1.10.4.bb b/meta/recipes-devtools/python/python-numpy_1.10.4.bb
index 8a562dc..ca6a7ab 100644
--- a/meta/recipes-devtools/python/python-numpy_1.10.4.bb
+++ b/meta/recipes-devtools/python/python-numpy_1.10.4.bb
@@ -63,7 +63,6 @@ inherit distutils
 # Make the build fail and replace *config.h with proper one
 # This is a ugly, ugly hack - Koen
 do_compile_prepend_class-target() {
-    BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
     ${STAGING_BINDIR_NATIVE}/python-native/python setup.py build ${DISTUTILS_BUILD_ARGS} || \
     true
     cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
diff --git a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
index 70fe25c..78e8a4e 100644
--- a/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
+++ b/meta/recipes-devtools/python/python-pycairo_1.10.0.bb
@@ -23,7 +23,7 @@ inherit distutils pkgconfig
 BBCLASSEXTEND = "native"
 
 do_configure() {
-	BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} ./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
+	./waf configure --prefix=${D}${prefix} --libdir=${D}${libdir}
 }
 
 do_compile() {
diff --git a/meta/recipes-devtools/python/python/0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch b/meta/recipes-devtools/python/python/0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch
new file mode 100644
index 0000000..502f849
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch
@@ -0,0 +1,51 @@
+From 4cdf2e9df13c6327fcc94d53e4953005543aef3d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 6 Apr 2016 17:43:02 +0300
+Subject: [PATCH 01/10] distutils: set the prefix to be inside staging
+ directory
+
+The proper prefix is inside our staging area.
+
+Upstream-Status: Inappropriate [embedded specific]
+Signed-off-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Signed-off-by: Phil Blundell <philb@gnu.org>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Lib/distutils/sysconfig.py | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
+index de7da1d..f3aacf7 100644
+--- a/Lib/distutils/sysconfig.py
++++ b/Lib/distutils/sysconfig.py
+@@ -75,7 +75,7 @@ def get_python_inc(plat_specific=0, prefix=None):
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        prefix = os.environ['STAGING_INCDIR'].rstrip('include')
+ 
+     if os.name == "posix":
+         if python_build:
+@@ -115,12 +115,16 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+     If 'prefix' is supplied, use it instead of sys.prefix or
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
++    lib_basename = os.environ['STAGING_LIBDIR'].split('/')[-1]
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        if plat_specific:
++            prefix = os.environ['STAGING_LIBDIR'].rstrip(lib_basename)
++        else:
++            prefix = PREFIX
+ 
+     if os.name == "posix":
+         libpython = os.path.join(prefix,
+-                                 "lib", "python" + get_python_version())
++                                 lib_basename, "python" + get_python_version())
+         if standard_lib:
+             return libpython
+         else:
+-- 
+2.8.0.rc3
+
diff --git a/meta/recipes-devtools/python/python3-native_3.5.1.bb b/meta/recipes-devtools/python/python3-native_3.5.1.bb
index 7bad11a..e8d0f9b 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.1.bb
@@ -47,8 +47,6 @@ RPROVIDES += "python3-distutils-native python3-compression-native python3-textut
 EXTRA_OECONF_append = " --bindir=${bindir}/${PN} --without-ensurepip"
 
 EXTRA_OEMAKE = '\
-  BUILD_SYS="" \
-  HOST_SYS="" \
   LIBC="" \
   STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
diff --git a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
index 8b93c1c..c53ec0c 100644
--- a/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
+++ b/meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
@@ -1,4 +1,4 @@
-From d4dd67daa1555bf13272cc071706338572539bad Mon Sep 17 00:00:00 2001
+From 7630ab22578746d3d790d0598c0d279cf7afed97 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 14 May 2013 15:00:26 -0700
 Subject: [PATCH 01/20] python3: Add target and native recipes
@@ -14,27 +14,14 @@ Upstream-Status: Inappropriate [embedded specific]
 # Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
 ---
+ Lib/distutils/sysconfig.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
 diff --git a/Lib/distutils/sysconfig.py b/Lib/distutils/sysconfig.py
-index 573724d..418b478 100644
+index 573724d..390c485 100644
 --- a/Lib/distutils/sysconfig.py
 +++ b/Lib/distutils/sysconfig.py
-@@ -17,10 +17,11 @@ import sys
- from .errors import DistutilsPlatformError
- 
- # These are needed in a couple of spots, so just compute them once.
--PREFIX = os.path.normpath(sys.prefix)
--EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
--BASE_PREFIX = os.path.normpath(sys.base_prefix)
--BASE_EXEC_PREFIX = os.path.normpath(sys.base_exec_prefix)
-+PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
-+EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
-+BASE_PREFIX = os.path.normpath(sys.base_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
-+BASE_EXEC_PREFIX= os.path.normpath(sys.base_exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
-+
- 
- # Path to the base directory of the project. On Windows the binary may
- # live in project/PCBuild/win32 or project/PCBuild/amd64.
-@@ -84,7 +85,9 @@ def get_python_inc(plat_specific=0, prefix=None):
+@@ -84,7 +84,9 @@ def get_python_inc(plat_specific=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -45,7 +32,7 @@ index 573724d..418b478 100644
          prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
      if os.name == "posix":
          if python_build:
-@@ -125,6 +128,10 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -125,6 +127,10 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
      If 'prefix' is supplied, use it instead of sys.base_prefix or
      sys.base_exec_prefix -- i.e., ignore 'plat_specific'.
      """
@@ -56,7 +43,7 @@ index 573724d..418b478 100644
      if prefix is None:
          if standard_lib:
              prefix = plat_specific and BASE_EXEC_PREFIX or BASE_PREFIX
-@@ -133,7 +140,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
+@@ -133,7 +139,7 @@ def get_python_lib(plat_specific=0, standard_lib=0, prefix=None):
  
      if os.name == "posix":
          libpython = os.path.join(prefix,
@@ -65,24 +52,6 @@ index 573724d..418b478 100644
          if standard_lib:
              return libpython
          else:
-@@ -233,7 +240,7 @@ def get_config_h_filename():
-     else:
-         inc_dir = get_python_inc(plat_specific=1)
- 
--    return os.path.join(inc_dir, 'pyconfig.h')
-+    return os.path.join(inc_dir, 'pyconfig.h'.replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") ))
- 
- 
- def get_makefile_filename():
-@@ -242,7 +249,7 @@ def get_makefile_filename():
-         return os.path.join(_sys_home or project_base, "Makefile")
-     lib_dir = get_python_lib(plat_specific=0, standard_lib=1)
-     config_file = 'config-{}{}'.format(get_python_version(), build_flags)
--    return os.path.join(lib_dir, config_file, 'Makefile')
-+    return os.path.join(lib_dir, config_file, 'Makefile').replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
- 
- 
- def parse_config_h(fp, g=None):
 -- 
-2.7.0
+2.8.0.rc3
 
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 2fbb3cb..26d05c7 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -118,7 +118,6 @@ do_compile() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
 		OPT="${CFLAGS}" libpython3.so
@@ -128,7 +127,6 @@ do_compile() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
 		OPT="${CFLAGS}"
@@ -149,7 +147,6 @@ do_install() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
 		DESTDIR=${D} LIBDIR=${libdir}
@@ -159,7 +156,6 @@ do_install() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		LIB=${baselib} \
 		ARCH=${TARGET_ARCH} \
 		DESTDIR=${D} LIBDIR=${libdir} install
diff --git a/meta/recipes-devtools/python/python_2.7.11.bb b/meta/recipes-devtools/python/python_2.7.11.bb
index 606f153..7eced2d 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.11.bb
@@ -80,7 +80,6 @@ do_compile() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		OPT="${CFLAGS}"
 }
 
@@ -100,7 +99,6 @@ do_install() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		DESTDIR=${D} LIBDIR=${libdir}
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/python-native/pgen \
@@ -109,7 +107,6 @@ do_install() {
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		STAGING_BASELIBDIR=${STAGING_BASELIBDIR} \
-		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		DESTDIR=${D} LIBDIR=${libdir} install
 
 	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
diff --git a/meta/recipes-extended/newt/libnewt_0.52.18.bb b/meta/recipes-extended/newt/libnewt_0.52.18.bb
index 9a2964b..b6a9cd4 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.18.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.18.bb
@@ -40,9 +40,6 @@ export STAGING_INCDIR
 export STAGING_LIBDIR
 export CPPFLAGS
 
-export BUILD_SYS
-export HOST_SYS
-
 PACKAGES_prepend = "whiptail "
 
 do_configure_prepend() {
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
index 861af5f..b544f8c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
@@ -20,8 +20,6 @@ inherit autotools pkgconfig gtk-doc pythonnative qemu gobject-introspection-data
 BBCLASSEXTEND = "native"
 
 # necessary to let the call for python-config from configure.ac succeed
-export BUILD_SYS
-export HOST_SYS
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 3d6ffb3..d668300 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -42,8 +42,6 @@ inherit linux-kernel-base kernel-arch pythonnative
 inherit python-dir
 export STAGING_INCDIR
 export STAGING_LIBDIR
-export BUILD_SYS
-export HOST_SYS
 export PYTHON_SITEPACKAGES_DIR
 
 #kernel 3.1+ supports WERROR to disable warnings as errors
-- 
2.8.1


