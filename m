Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2CF28773DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:27:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 02:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703473"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:26:08 +0300
Message-Id: <d2fbdaedbe6e93e3c4b89c9afa4cb2bbf3a2a377.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/31] automake: drop the Python scriptlets to determine Python's directories
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
X-List-Received-Date: Thu, 02 Jun 2016 09:27:01 -0000

python.m4 has python scriptlets that determine where the system's library
directory is. For Python 2.x distutils.sysconfig is used (which works because
we patch it), for Python 3.x plain sysconfig is used (which doesn't work
for example on x32). There is also a hardcoded fallback if the scriptlets fail.

This commit removes the scriptlets altogether and just uses the hardcoded path always,
due to above mentioned issues with x32.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../automake/automake/python-libdir.patch          | 62 +++++++++++++++-------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-devtools/automake/automake/python-libdir.patch b/meta/recipes-devtools/automake/automake/python-libdir.patch
index 47541bd..2a48b13 100644
--- a/meta/recipes-devtools/automake/automake/python-libdir.patch
+++ b/meta/recipes-devtools/automake/automake/python-libdir.patch
@@ -1,3 +1,8 @@
+From 472a3d36c97ef7535f05d6c185edcbc22b0074c4 Mon Sep 17 00:00:00 2001
+From: Kumar Gala <galak@kernel.crashing.org>
+Date: Thu, 11 Aug 2011 01:26:33 -0500
+Subject: [PATCH 1/4] automake: Update for python.m4 to respect libdir
+
 Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
@@ -5,11 +10,17 @@ Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
 Updated for automake-1.12.6
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ m4/python.m4 | 27 +++++++--------------------
+ 1 file changed, 7 insertions(+), 20 deletions(-)
 
-diff -Nurd automake-1.12.6/m4/python.m4 automake-1.12.6/m4/python.m4
---- automake-1.12.6/m4/python.m4	2012-12-13 22:02:25.000000000 +0200
-+++ automake-1.12.6/m4/python.m4	2012-12-27 17:40:26.558164660 +0200
-@@ -91,12 +91,13 @@
+diff --git a/m4/python.m4 b/m4/python.m4
+index 5b2c695..ed19261 100644
+--- a/m4/python.m4
++++ b/m4/python.m4
+@@ -91,12 +91,13 @@ AC_DEFUN([AM_PATH_PYTHON],
      [am_cv_python_version=`$PYTHON -c "import sys; sys.stdout.write(sys.version[[:3]])"`])
    AC_SUBST([PYTHON_VERSION], [$am_cv_python_version])
  
@@ -25,17 +36,23 @@ diff -Nurd automake-1.12.6/m4/python.m4 automake-1.12.6/m4/python.m4
    AC_SUBST([PYTHON_EXEC_PREFIX], ['${exec_prefix}'])
  
    dnl At times (like when building shared libraries) you may want
-@@ -148,7 +149,8 @@
- else:
-     from distutils import sysconfig
-     sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
+@@ -141,14 +142,7 @@ except ImportError:
+      else
+        am_py_prefix=$prefix
+      fi
+-     am_cv_python_pythondir=`$PYTHON -c "
+-$am_python_setup_sysconfig
+-if can_use_sysconfig:
+-    sitedir = sysconfig.get_path('purelib', vars={'base':'$am_py_prefix'})
+-else:
+-    from distutils import sysconfig
+-    sitedir = sysconfig.get_python_lib(0, 0, prefix='$am_py_prefix')
 -sys.stdout.write(sitedir)"`
-+sys.stdout.write(sitedir)" ||
-+     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
++     am_cv_python_pythondir=`echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
       case $am_cv_python_pythondir in
       $am_py_prefix*)
         am__strip_prefix=`echo "$am_py_prefix" | sed 's|.|.|g'`
-@@ -158,7 +160,7 @@
+@@ -158,7 +152,7 @@ sys.stdout.write(sitedir)"`
         case $am_py_prefix in
           /usr|/System*) ;;
           *)
@@ -44,17 +61,23 @@ diff -Nurd automake-1.12.6/m4/python.m4 automake-1.12.6/m4/python.m4
  	  ;;
         esac
         ;;
-@@ -190,7 +192,8 @@
- else:
-     from distutils import sysconfig
-     sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_prefix')
+@@ -183,14 +177,7 @@ sys.stdout.write(sitedir)"`
+      else
+        am_py_exec_prefix=$exec_prefix
+      fi
+-     am_cv_python_pyexecdir=`$PYTHON -c "
+-$am_python_setup_sysconfig
+-if can_use_sysconfig:
+-    sitedir = sysconfig.get_path('platlib', vars={'platbase':'$am_py_prefix'})
+-else:
+-    from distutils import sysconfig
+-    sitedir = sysconfig.get_python_lib(1, 0, prefix='$am_py_prefix')
 -sys.stdout.write(sitedir)"`
-+sys.stdout.write(sitedir)" ||
-+     echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
++     am_cv_python_pyexecdir=`echo "$PYTHON_LIB_PREFIX/python$PYTHON_VERSION/site-packages"`
       case $am_cv_python_pyexecdir in
       $am_py_exec_prefix*)
         am__strip_prefix=`echo "$am_py_exec_prefix" | sed 's|.|.|g'`
-@@ -200,7 +203,7 @@
+@@ -200,7 +187,7 @@ sys.stdout.write(sitedir)"`
         case $am_py_exec_prefix in
           /usr|/System*) ;;
           *)
@@ -63,3 +86,6 @@ diff -Nurd automake-1.12.6/m4/python.m4 automake-1.12.6/m4/python.m4
  	   ;;
         esac
         ;;
+-- 
+2.8.1
+
-- 
2.8.1


