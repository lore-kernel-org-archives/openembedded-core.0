Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A8A1477E22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711789"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:18:58 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:34 +0300
Message-Id: <48b8649296a998b3514f3f79489d6b1d68c08a9f.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 04/20] python-profile-opt: rename libpython
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
X-List-Received-Date: Tue, 16 May 2017 13:19:01 -0000

The python library needs to be renamed so that the automatic dependency
generation/checking mechanism in bitbake does not get confused.
Otherwise python-profile-opt will depend on libpython from the "normal"
python package.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 .../python/python-profile-opt_2.7.13.bb            |  6 +-
 ...rename-libpython-to-libpython-profile-opt.patch | 94 ++++++++++++++++++++++
 2 files changed, 95 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/rename-libpython-to-libpython-profile-opt.patch

diff --git a/meta/recipes-devtools/python/python-profile-opt_2.7.13.bb b/meta/recipes-devtools/python/python-profile-opt_2.7.13.bb
index 058cc63bc9..df5eee89c8 100644
--- a/meta/recipes-devtools/python/python-profile-opt_2.7.13.bb
+++ b/meta/recipes-devtools/python/python-profile-opt_2.7.13.bb
@@ -1,7 +1,6 @@
 require python_${PV}.bb
 
-PROVIDES += "libpython2"
-RPROVIDES_${PN}-core += "libpython2"
+SRC_URI += "file://rename-libpython-to-libpython-profile-opt.patch"
 
 # Use special prefix in order to prevent clash with normal python
 STAGING_INCDIR_DEFAULT = "${STAGING_DIR_HOST}/usr/include"
@@ -12,6 +11,3 @@ prefix = "/opt"
 exec_prefix = "/opt"
 
 PYTHON_MAKE_TARGET = "build_all_generate_profile"
-
-# Force pkgdata not to clash with python recipe
-PKG_libpython-profile-opt2 = "libpython-profile-opt2.7-1.0"
diff --git a/meta/recipes-devtools/python/python/rename-libpython-to-libpython-profile-opt.patch b/meta/recipes-devtools/python/python/rename-libpython-to-libpython-profile-opt.patch
new file mode 100644
index 0000000000..06bb4c02b3
--- /dev/null
+++ b/meta/recipes-devtools/python/python/rename-libpython-to-libpython-profile-opt.patch
@@ -0,0 +1,94 @@
+From bc4690886248d87c019cf3c955d5349327f6fdfc Mon Sep 17 00:00:00 2001
+From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+Date: Mon, 17 Oct 2016 15:58:21 +0300
+Subject: [PATCH] rename libpython to libpython-profile-opt
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ Lib/distutils/command/build_ext.py | 2 +-
+ Makefile.pre.in                    | 2 +-
+ Misc/python-config.in              | 2 +-
+ Misc/python.pc.in                  | 2 +-
+ configure.ac                       | 6 +++---
+ 5 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
+index 3a49454..56cabce 100644
+--- a/Lib/distutils/command/build_ext.py
++++ b/Lib/distutils/command/build_ext.py
+@@ -758,7 +758,7 @@ class build_ext (Command):
+         else:
+             from distutils import sysconfig
+             if sysconfig.get_config_var('Py_ENABLE_SHARED'):
+-                template = "python%d.%d"
++                template = "python-profile-opt%d.%d"
+                 pythonlib = (template %
+                              (sys.hexversion >> 24, (sys.hexversion >> 16) & 0xff))
+                 return ext.libraries + [pythonlib]
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index d4b81dc..43fe5fe 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -562,7 +562,7 @@ $(LIBRARY): $(LIBRARY_OBJS)
+ 	$(AR) $(ARFLAGS) $@ $(MODOBJS)
+ 	$(RANLIB) $@
+ 
+-libpython$(VERSION).so: $(LIBRARY_OBJS)
++libpython-profile-opt$(VERSION).so: $(LIBRARY_OBJS)
+ 	if test $(INSTSONAME) != $(LDLIBRARY); then \
+ 		$(BLDSHARED) -Wl,-h$(INSTSONAME) -o $(INSTSONAME) $(LIBRARY_OBJS) $(MODLIBS) $(SHLIBS) $(LIBC) $(LIBM) $(LDLAST); \
+ 		$(LN) -f $(INSTSONAME) $@; \
+diff --git a/Misc/python-config.in b/Misc/python-config.in
+index 9ee0fdf..9fb149d 100644
+--- a/Misc/python-config.in
++++ b/Misc/python-config.in
+@@ -44,7 +44,7 @@ for opt in opt_flags:
+         print ' '.join(flags)
+ 
+     elif opt in ('--libs', '--ldflags'):
+-        libs = ['-lpython' + pyver]
++        libs = ['-lpython-profile-opt' + pyver]
+         libs += getvar('LIBS').split()
+         libs += getvar('SYSLIBS').split()
+         # add the prefix/lib/pythonX.Y/config dir, but only if there is no
+diff --git a/Misc/python.pc.in b/Misc/python.pc.in
+index 08481a9..0822e54 100644
+--- a/Misc/python.pc.in
++++ b/Misc/python.pc.in
+@@ -8,6 +8,6 @@ Description: Python library
+ Requires: 
+ Version: @VERSION@
+ Libs.private: @LIBS@
+-Libs: -L${libdir} -lpython@VERSION@
++Libs: -L${libdir} -lpython-profile-opt@VERSION@
+ Cflags: -I${includedir}/python@VERSION@ 
+ 
+diff --git a/configure.ac b/configure.ac
+index 353b533..0b8e399 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -765,7 +765,7 @@ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
+ if test -z "$LIBRARY"
+ then
+-	LIBRARY='libpython$(VERSION).a'
++	LIBRARY='libpython-profile-opt$(VERSION).a'
+ fi
+ AC_MSG_RESULT($LIBRARY)
+ 
+@@ -911,8 +911,8 @@ if test $enable_shared = "yes"; then
+ 	  INSTSONAME="$LDLIBRARY".$SOVERSION
+           ;;
+     Linux*|GNU*|NetBSD*|FreeBSD*|DragonFly*|OpenBSD*)
+-	  LDLIBRARY='libpython$(VERSION).so'
+-	  BLDLIBRARY='-L. -lpython$(VERSION)'
++	  LDLIBRARY='libpython-profile-opt$(VERSION).so'
++	  BLDLIBRARY='-L. -lpython-profile-opt$(VERSION)'
+ 	  RUNSHARED=LD_LIBRARY_PATH=`pwd`${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
+ 	  case $ac_sys_system in
+ 	      FreeBSD*)
+-- 
+2.6.6
+
-- 
2.12.0


