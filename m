Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/0VKpgU0+XYfKE9q/1+lwM0F4xaKzC30o=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QrOnI-0005ra-Pw
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 08:31:05 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p7B6QYGM022558
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 01:26:34 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 01:26:33 -0500
Message-Id: <1313043994-28945-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH 1/2] automake: Update for python.m4 to respect libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 06:31:05 -0000

As we tweak libdir we need python libs that utilize configure to respect
it setting.  By updating the python.m4 template, when we regen automake
files they will than respect the setting of libdir which is standard for
any autotools based recipe.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/automake/automake.inc        |    2 +-
 .../automake/automake/python-libdir.patch          |   60 ++++++++++++++++++++
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    3 +-
 3 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/automake/automake/python-libdir.patch

diff --git a/meta/recipes-devtools/automake/automake.inc b/meta/recipes-devtools/automake/automake.inc
index 96d797f..f217e14 100644
--- a/meta/recipes-devtools/automake/automake.inc
+++ b/meta/recipes-devtools/automake/automake.inc
@@ -4,7 +4,7 @@ Standards. Automake requires the use of Autoconf."
 LICENSE = "GPLv2"
 HOMEPAGE = "http://www.gnu.org/software/automake/"
 SECTION = "devel"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/automake/automake-${PV}.tar.bz2 "
 
diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch b/meta/recipes-devtools/automake/automake/python-libdir.patch
new file mode 100644
index 0000000..63dafca
--- /dev/null
+++ b/meta/recipes-devtools/automake/automake/python-libdir.patch
@@ -0,0 +1,60 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+
+Index: automake-1.11.1/m4/python.m4
+===================================================================
+--- automake-1.11.1.orig/m4/python.m4
++++ automake-1.11.1/m4/python.m4
+@@ -88,12 +88,13 @@ python2.1 python2.0])
+     [am_cv_python_version=`$PYTHON -c "import sys; sys.stdout.write(sys.version[[:3]])"`])
+   AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
+ 
+-  dnl Use the values of $prefix and $exec_prefix for the corresponding
+-  dnl values of PYTHON_PREFIX and PYTHON_EXEC_PREFIX.  These are made
++  dnl Use the values of $prefix, $libdir and $exec_prefix for the corresponding
++  dnl values of PYTHON_PREFIX PYTHON_LIB_PREFIX, and PYTHON_EXEC_PREFIX.  These are made
+   dnl distinct variables so they can be overridden if need be.  However,
+   dnl general consensus is that you shouldn't need this ability.
+ 
+   AC_SUBST([PYTHON_PREFIX], ['${prefix}'])
++  AC_SUBST([PYTHON_LIB_PREFIX], ['${libdir}'])
+   AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
+ 
+   dnl At times (like when building shared libraries) you may want
+@@ -122,7 +123,7 @@ python2.1 python2.0])
+        am_py_prefix=$prefix
+      fi
+      am_cv_python_pythondir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(0,0,prefix='$am_py_prefix'))" 2>/dev/null ||
+-     echo "$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
++     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
+      case $am_cv_python_pythondir in
+      $am_py_prefix*)
+        am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
+@@ -132,7 +133,7 @@ python2.1 python2.0])
+        case $am_py_prefix in
+          /usr|/System*) ;;
+          *)
+-	  am_cv_python_pythondir=$PYTHON_PREFIX/lib/python$PYTHON_VERSION/site-packages
++	  am_cv_python_pythondir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
+ 	  ;;
+        esac
+        ;;
+@@ -160,7 +161,7 @@ python2.1 python2.0])
+        am_py_exec_prefix=$exec_prefix
+      fi
+      am_cv_python_pyexecdir=`$PYTHON -c "import sys; from distutils import sysconfig; sys.stdout.write(sysconfig.get_python_lib(1,0,prefix='$am_py_exec_prefix'))" 2>/dev/null ||
+-     echo "$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages"`
++     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
+      case $am_cv_python_pyexecdir in
+      $am_py_exec_prefix*)
+        am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
+@@ -170,7 +171,7 @@ python2.1 python2.0])
+        case $am_py_exec_prefix in
+          /usr|/System*) ;;
+          *)
+-	   am_cv_python_pyexecdir=$PYTHON_EXEC_PREFIX/lib/python$PYTHON_VERSION/site-packages
++	   am_cv_python_pyexecdir=$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages
+ 	   ;;
+        esac
+        ;;
diff --git a/meta/recipes-devtools/automake/automake_1.11.1.bb b/meta/recipes-devtools/automake/automake_1.11.1.bb
index c66155f..fee9597 100644
--- a/meta/recipes-devtools/automake/automake_1.11.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.11.1.bb
@@ -33,7 +33,8 @@ PATHFIXPATCH = "file://path_prog_fixes.patch;patch=1"
 PATHFIXPATCH_virtclass-native = ""
 
 SRC_URI += "${PATHFIXPATCH} \
-	    file://prefer-cpio-over-pax-for-ustar-archives.patch"
+	    file://prefer-cpio-over-pax-for-ustar-archives.patch \
+	    file://python-libdir.patch"
 
 SRC_URI[md5sum] = "c2972c4d9b3e29c03d5f2af86249876f"
 SRC_URI[sha256sum] = "5b159d3c0e0a1f87de71b68bcb9f1a1c49e9e71749c9b723f17e2e1e0295c7ae"
-- 
1.7.3.4



