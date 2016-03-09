Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC926FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:07:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083645"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:24 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:56 +0200
Message-Id: <2787832bbe88795f7c427151fe0897f9a345c64a.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 10/24] python-pygtk: remove the recipe
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
X-List-Received-Date: Wed, 09 Mar 2016 15:07:22 -0000

python-pygtk hasn't been updated in several years, is incompatible
with the current version of pygobject, and is generally obsolete as
all modern python gtk apps use introspection directly.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 .../packagegroups/packagegroup-self-hosted.bb      |  1 -
 .../python/python-pygtk/acinclude.m4               | 90 ----------------------
 .../add-gtk-types.defs-into-gdk.c-dependence.patch | 32 --------
 .../python/python-pygtk/fix-gtkunixprint.patch     | 20 -----
 .../python/python-pygtk/fix-pygtk-2.0.pc.patch     | 13 ----
 .../python/python-pygtk/nodocs.patch               | 15 ----
 .../prevent_to_get_display_during_import.patch     | 16 ----
 .../python/python-pygtk/python-pygtk2/acinclude.m4 | 90 ----------------------
 .../update-dependences-of-defs.c.patch             | 38 ---------
 .../recipes-devtools/python/python-pygtk_2.24.0.bb | 55 -------------
 11 files changed, 371 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/acinclude.m4
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/nodocs.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk_2.24.0.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index d37aefb..c8f9395 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -343,7 +343,6 @@ DISTRO_PN_ALIAS_pn-python-mako = "Fedora=python-mako Opensuse=python-Mako"
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
 DISTRO_PN_ALIAS_pn-python-pycurl = "Debian=python-pycurl Ubuntu=python-pycurl"
 DISTRO_PN_ALIAS_pn-python-pygobject = "Meego=pygobject2 Fedora=pygobject2 Ubuntu=pygobject Debian=pygobject"
-DISTRO_PN_ALIAS_pn-python-pygtk = "Debian=python-gtk2 Fedora=pygtk2 OpenSuSE=python-gtk"
 DISTRO_PN_ALIAS_pn-python-pyrex = "Mandriva=python-pyrex Ubuntu=python-pyrex"
 DISTRO_PN_ALIAS_pn-python-scons = "Fedora=scons OpenSuSE=scons Ubuntu=scons Mandriva=scons Debian=scons"
 DISTRO_PN_ALIAS_pn-python-setuptools = "Mandriva=python-setup OpenSuSE=python-setup-git"
diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 15024cf..68949b7 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -189,7 +189,6 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     libsdl \
     libsdl-dev \
     libx11-dev \
-    python-pygtk \
     gtk-theme-clearlooks \
     xdg-utils \
     epiphany \
diff --git a/meta/recipes-devtools/python/python-pygtk/acinclude.m4 b/meta/recipes-devtools/python/python-pygtk/acinclude.m4
deleted file mode 100644
index 53518fb..0000000
--- a/meta/recipes-devtools/python/python-pygtk/acinclude.m4
+++ /dev/null
@@ -1,90 +0,0 @@
-## this one is commonly used with AM_PATH_PYTHONDIR ...
-dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND [,ACTION-IF-NOT-FOUND]]])
-dnl Check if a module containing a given symbol is visible to python.
-AC_DEFUN(AM_CHECK_PYMOD,
-[AC_REQUIRE([AM_PATH_PYTHON])
-py_mod_var=`echo $1['_']$2 | sed 'y%./+-%__p_%'`
-AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)
-AC_CACHE_VAL(py_cv_mod_$py_mod_var, [
-ifelse([$2],[], [prog="
-import sys
-try:
-        import $1
-except ImportError:
-        sys.exit(1)
-except:
-        sys.exit(0)
-sys.exit(0)"], [prog="
-import $1
-$1.$2"])
-if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC
-  then
-    eval "py_cv_mod_$py_mod_var=yes"
-  else
-    eval "py_cv_mod_$py_mod_var=no"
-  fi
-])
-py_val=`eval "echo \`echo '$py_cv_mod_'$py_mod_var\`"`
-if test "x$py_val" != xno; then
-  AC_MSG_RESULT(yes)
-  ifelse([$3], [],, [$3
-])dnl
-else
-  AC_MSG_RESULT(no)
-  ifelse([$4], [],, [$4
-])dnl
-fi
-])
-
-dnl a macro to check for ability to create python extensions
-dnl  AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE], [ACTION-IF-NOT-POSSIBLE])
-dnl function also defines PYTHON_INCLUDES
-AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
-[AC_REQUIRE([AM_PATH_PYTHON])
-AC_MSG_CHECKING(for headers required to compile python extensions)
-dnl deduce PYTHON_INCLUDES
-AC_ARG_WITH(python-includes,
-	[  --with-python-includes=DIR  path to Python includes], py_exec_prefix=$withval)
-if test x$py_exec_prefix != x; then
-PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-else
-py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
-py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
-PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
-if test "$py_prefix" != "$py_exec_prefix"; then
-  PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-fi
-fi
-AC_SUBST(PYTHON_INCLUDES)
-dnl check if the headers exist:
-save_CPPFLAGS="$CPPFLAGS"
-CPPFLAGS="$CPPFLAGS $PYTHON_INCLUDES"
-AC_TRY_CPP([#include <Python.h>],dnl
-[AC_MSG_RESULT(found)
-$1],dnl
-[AC_MSG_RESULT(not found)
-$2])
-CPPFLAGS="$save_CPPFLAGS"
-])
-
-dnl
-dnl JH_ADD_CFLAG(FLAG)
-dnl checks whether the C compiler supports the given flag, and if so, adds
-dnl it to $CFLAGS.  If the flag is already present in the list, then the
-dnl check is not performed.
-AC_DEFUN([JH_ADD_CFLAG],
-[
-case " $CFLAGS " in
-*@<:@\	\ @:>@$1@<:@\	\ @:>@*)
-  ;;
-*)
-  save_CFLAGS="$CFLAGS"
-  CFLAGS="$CFLAGS $1"
-  AC_MSG_CHECKING([whether [$]CC understands $1])
-  AC_TRY_COMPILE([], [], [jh_has_option=yes], [jh_has_option=no])
-  AC_MSG_RESULT($jh_has_option)
-  if test $jh_has_option = no; then
-    CFLAGS="$save_CFLAGS"
-  fi
-  ;;
-esac])
diff --git a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch b/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
deleted file mode 100644
index df0f9cd..0000000
--- a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted
-
-add gtk-types.defs into gdk.c dependence
-
-gdk.c depends on gtk-types.defs but
-gdk/Makefile.am miss this. This will cause
-build error sometimes when built
-with multi-jobbing, so add gtk-types.defs into
-gdk.c dependence.
-
-Signed-off-by: Song.Li <Song.Li@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- gtk/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 7bb5d0c..4a88351 100644
---- a/gtk/Makefile.am
-+++ b/gtk/Makefile.am
-@@ -214,7 +214,7 @@ gtkunixprint.defs: $(GTKUNIXPRINT_DEFS) Makefile
- gtkunixprint-types.defs: $(GTKUNIXPRINT_TYPES_DEFS) Makefile
- 	$(CREATEDEFS) $@ $(GTKUNIXPRINT_TYPES_DEFS)
- 
--gdk.c: gdk-types.defs gdk.defs $(GDK_OVERRIDES)
-+gdk.c: gdk-types.defs gtk-types.defs gdk.defs $(GDK_OVERRIDES)
- gtk.c: gdk-types.defs gtk-types.defs gtk.defs gdk-types.defs $(GTK_OVERRIDES)
- _gtk_la_CFLAGS = $(PYCAIRO_CFLAGS) $(GTK_CFLAGS)
- _gtk_la_LDFLAGS = $(common_ldflags) -export-symbols-regex init_gtk
--- 
-1.7.4
-
diff --git a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch b/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
deleted file mode 100644
index 16c0e8e..0000000
--- a/meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: pygtk-2.24.0/gtk/gtkunixprint.override
-===================================================================
---- pygtk-2.24.0.orig/gtk/gtkunixprint.override
-+++ pygtk-2.24.0/gtk/gtkunixprint.override
-@@ -102,11 +102,6 @@ _wrap_gtk_print_job_get_surface(PyGObjec
-     if (pyg_error_check(&error))
-         return NULL;
- 
--#if PYCAIRO_VERSION_HEX >= 0x1010600
--    return PycairoSurface_FromSurface(cairo_surface_reference(surface), NULL);
--#else
--    return PycairoSurface_FromSurface(cairo_surface_reference(surface), NULL, NULL);
--#endif
- }
- %%
- override gtk_print_job_send kwargs
diff --git a/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch b/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
deleted file mode 100644
index b6156540..0000000
--- a/meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: pygtk-2.24.0/pygtk-2.0.pc.in
-===================================================================
---- pygtk-2.24.0.orig/pygtk-2.0.pc.in
-+++ pygtk-2.24.0/pygtk-2.0.pc.in
-@@ -1,5 +1,6 @@
- prefix=@prefix@
- exec_prefix=@exec_prefix@
-+libdir=@libdir@
- includedir=@includedir@
- datarootdir=@datarootdir@
- datadir=@datadir@
diff --git a/meta/recipes-devtools/python/python-pygtk/nodocs.patch b/meta/recipes-devtools/python/python-pygtk/nodocs.patch
deleted file mode 100644
index f07309a..0000000
--- a/meta/recipes-devtools/python/python-pygtk/nodocs.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: pygtk-2.17.0/Makefile.am
-===================================================================
---- pygtk-2.17.0.orig/Makefile.am
-+++ pygtk-2.17.0/Makefile.am
-@@ -4,7 +4,7 @@ if BUILD_GTK
-   GTK_SUBDIR = gtk
- endif
- 
--SUBDIRS = . $(GTK_SUBDIR) examples tests docs
-+SUBDIRS = . $(GTK_SUBDIR) examples tests
- 
- PLATFORM_VERSION = 2.0
- 
diff --git a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch b/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
deleted file mode 100644
index 833038e..0000000
--- a/meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-Index: pygtk-2.10.4/gtk/__init__.py
-===================================================================
---- pygtk-2.10.4.orig/gtk/__init__.py	2007-11-27 19:27:05.000000000 -0300
-+++ pygtk-2.10.4/gtk/__init__.py	2007-11-27 19:28:22.000000000 -0300
-@@ -78,7 +78,8 @@
- 
- keysyms = LazyModule('keysyms', locals())
- 
--_init()
-+if not hasattr(sys.modules['__main__'], 'python_launcher_enabled'):
-+    _init()
- 
- # CAPI
- _PyGtk_API = _gtk._PyGtk_API
diff --git a/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4 b/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
deleted file mode 100644
index 53518fb..0000000
--- a/meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
+++ /dev/null
@@ -1,90 +0,0 @@
-## this one is commonly used with AM_PATH_PYTHONDIR ...
-dnl AM_CHECK_PYMOD(MODNAME [,SYMBOL [,ACTION-IF-FOUND [,ACTION-IF-NOT-FOUND]]])
-dnl Check if a module containing a given symbol is visible to python.
-AC_DEFUN(AM_CHECK_PYMOD,
-[AC_REQUIRE([AM_PATH_PYTHON])
-py_mod_var=`echo $1['_']$2 | sed 'y%./+-%__p_%'`
-AC_MSG_CHECKING(for ifelse([$2],[],,[$2 in ])python module $1)
-AC_CACHE_VAL(py_cv_mod_$py_mod_var, [
-ifelse([$2],[], [prog="
-import sys
-try:
-        import $1
-except ImportError:
-        sys.exit(1)
-except:
-        sys.exit(0)
-sys.exit(0)"], [prog="
-import $1
-$1.$2"])
-if $PYTHON -c "$prog" 1>&AC_FD_CC 2>&AC_FD_CC
-  then
-    eval "py_cv_mod_$py_mod_var=yes"
-  else
-    eval "py_cv_mod_$py_mod_var=no"
-  fi
-])
-py_val=`eval "echo \`echo '$py_cv_mod_'$py_mod_var\`"`
-if test "x$py_val" != xno; then
-  AC_MSG_RESULT(yes)
-  ifelse([$3], [],, [$3
-])dnl
-else
-  AC_MSG_RESULT(no)
-  ifelse([$4], [],, [$4
-])dnl
-fi
-])
-
-dnl a macro to check for ability to create python extensions
-dnl  AM_CHECK_PYTHON_HEADERS([ACTION-IF-POSSIBLE], [ACTION-IF-NOT-POSSIBLE])
-dnl function also defines PYTHON_INCLUDES
-AC_DEFUN([AM_CHECK_PYTHON_HEADERS],
-[AC_REQUIRE([AM_PATH_PYTHON])
-AC_MSG_CHECKING(for headers required to compile python extensions)
-dnl deduce PYTHON_INCLUDES
-AC_ARG_WITH(python-includes,
-	[  --with-python-includes=DIR  path to Python includes], py_exec_prefix=$withval)
-if test x$py_exec_prefix != x; then
-PYTHON_INCLUDES="-I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-else
-py_prefix=`$PYTHON -c "import sys; print sys.prefix"`
-py_exec_prefix=`$PYTHON -c "import sys; print sys.exec_prefix"`
-PYTHON_INCLUDES="-I${py_prefix}/include/python${PYTHON_VERSION}"
-if test "$py_prefix" != "$py_exec_prefix"; then
-  PYTHON_INCLUDES="$PYTHON_INCLUDES -I${py_exec_prefix}/include/python${PYTHON_VERSION}"
-fi
-fi
-AC_SUBST(PYTHON_INCLUDES)
-dnl check if the headers exist:
-save_CPPFLAGS="$CPPFLAGS"
-CPPFLAGS="$CPPFLAGS $PYTHON_INCLUDES"
-AC_TRY_CPP([#include <Python.h>],dnl
-[AC_MSG_RESULT(found)
-$1],dnl
-[AC_MSG_RESULT(not found)
-$2])
-CPPFLAGS="$save_CPPFLAGS"
-])
-
-dnl
-dnl JH_ADD_CFLAG(FLAG)
-dnl checks whether the C compiler supports the given flag, and if so, adds
-dnl it to $CFLAGS.  If the flag is already present in the list, then the
-dnl check is not performed.
-AC_DEFUN([JH_ADD_CFLAG],
-[
-case " $CFLAGS " in
-*@<:@\	\ @:>@$1@<:@\	\ @:>@*)
-  ;;
-*)
-  save_CFLAGS="$CFLAGS"
-  CFLAGS="$CFLAGS $1"
-  AC_MSG_CHECKING([whether [$]CC understands $1])
-  AC_TRY_COMPILE([], [], [jh_has_option=yes], [jh_has_option=no])
-  AC_MSG_RESULT($jh_has_option)
-  if test $jh_has_option = no; then
-    CFLAGS="$save_CFLAGS"
-  fi
-  ;;
-esac])
diff --git a/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch b/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
deleted file mode 100644
index 3ed954e..0000000
--- a/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From dc024e9079bbffbb44436ba3e70a758ebad5520f Mon Sep 17 00:00:00 2001
-From: "Song.Li" <Song.Li@windriver.com>
-Date: Sat, 5 Jan 2013 14:55:59 +0800
-Subject: [PATCH] update dependences of defs.c in Makefile.am
-
-In gtk/Makefile.am, defs.c should dependes on gdk-types.defs and
-gtk-types.defs, otherwise it fails occasionally when parallel compile.
-The error message:
-"IOError: [Errno 2] No such file or directory: 'gtk-types.defs'"
-
-Add them to dependences of defs.c to fix this issue.
-
-Upstream-Status: Submitted
-https://bugzilla.gnome.org/show_bug.cgi?id=702706
-
-Signed-off-by: Song.Li <Song.Li@windriver.com>
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- gtk/Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 7bb5d0c..91826cb 100644
---- a/gtk/Makefile.am
-+++ b/gtk/Makefile.am
-@@ -289,7 +289,7 @@ if HAVE_GIO_TYPES_DEFS
- extra_codegen_args += --register $(PYGOBJECT_DEFSDIR)/gio-types.defs
- endif
- 
--.defs.c: 
-+.defs.c: gdk-types.defs gtk-types.defs
- 	($(PYTHON) $(CODEGENDIR)/codegen.py \
- 	   $(PYGTK_CODEGEN_DEFINES) \
- 	    -I $(srcdir) \
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
deleted file mode 100644
index 79b3110..0000000
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "Python bindings for the GTK+ UI toolkit"
-SECTION = "devel/python"
-# needs gtk+ 2.17.x
-DEPENDS = "gtk+ libglade python-pycairo python-pygobject"
-RDEPENDS_${PN} = "python-shell python-pycairo python-pygobject"
-PROVIDES = "python-pygtk2"
-SRCNAME = "pygtk"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
-
-PR = "r1"
-
-SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar.bz2 \
-           file://add-gtk-types.defs-into-gdk.c-dependence.patch \
-           file://fix-gtkunixprint.patch \
-           file://prevent_to_get_display_during_import.patch \
-           file://nodocs.patch \
-	   file://fix-pygtk-2.0.pc.patch \
-           file://acinclude.m4 \
-           file://update-dependences-of-defs.c.patch"
-
-SRC_URI[md5sum] = "a1051d5794fd7696d3c1af6422d17a49"
-SRC_URI[sha256sum] = "cd1c1ea265bd63ff669e92a2d3c2a88eb26bcd9e5363e0f82c896e649f206912"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-EXTRA_OECONF = "--disable-docs --with-python-includes=${STAGING_INCDIR}/../"
-
-inherit autotools pkgconfig distutils-base distro_features_check
-
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-do_configure_prepend() {
-	install -m 0644 ${WORKDIR}/acinclude.m4 ${S}/
-	sed -i \
-		-e s:'`$PKG_CONFIG --variable defsdir pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/2.0/defs\":g \
-		-e s:'`$PKG_CONFIG --variable=pygtkincludedir pygobject-2.0`':\"${STAGING_INCDIR}/pygtk-2.0\":g \
-		-e s:'`$PKG_CONFIG --variable=datadir pygobject-2.0`':\"${STAGING_DATADIR}\":g \
-		-e s:'`$PKG_CONFIG --variable codegendir pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/2.0/codegen\":g \
-		-e s:'`$PKG_CONFIG --variable=fixxref pygobject-2.0`':\"${STAGING_DATADIR}/pygobject/xsl/fixxref.py\":g \
-		${S}/configure.ac
-}
-
-# dirty fix #2: fix build system paths leaking in
-do_install_append() {
-	sed -i -e '1s|^#!.*python|#!/usr/bin/env python|' ${D}${bindir}/pygtk-demo
-}
-
-PACKAGES =+ "${PN}-demo"
-FILES_${PN}-demo = " ${bindir}/pygtk-demo ${libdir}/pygtk "
-RDEPENDS_${PN}-demo = "python-pygtk python-stringold python-lang"
-
-# todo: revamp packaging, package demo seperatly
-FILES_${PN}-dev += " ${libdir}/pygtk/2.0 ${bindir}/pygtk-* ${datadir}/pygtk/2.0"
-
-- 
2.7.0


