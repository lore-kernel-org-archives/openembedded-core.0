Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6251D78262
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:07:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 03:07:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236012577"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 03:07:58 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 13:07:47 +0300
Message-Id: <92e7d0eecce53d23b50456c972c07d3ffe6b050c.1509094533.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v5 04/10] python3-profile-opt: rename libpython3
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
X-List-Received-Date: Fri, 27 Oct 2017 10:07:57 -0000

Prevents soname clash with "normal" libpython3. The python library
needs to be renamed so that the automatic ndency generation/checking
mechanism in bitbake does not get confused. Otherwise
python3-profile-opt will depend on libpython3 from the "normal" python3
package.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 .../python/python3-profile-opt_3.5.3.bb            |   1 +
 ...name-libpython3-to-libpython-profile-opt3.patch | 108 +++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch

diff --git a/meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb b/meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
index 6940480546..3ad427117f 100644
--- a/meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
@@ -1,6 +1,7 @@
 require python3_${PV}.bb
 
 SRC_URI += "file://Makefile-add-install_generate_profile-target.patch \
+            file://rename-libpython3-to-libpython-profile-opt3.patch \
            "
 
 PYTHON3_MAKE_TARGET = "build_all_generate_profile"
diff --git a/meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch b/meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
new file mode 100644
index 0000000000..2e5f9302fc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
@@ -0,0 +1,108 @@
+rename libpython3 to libpython-profile-opt3
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+
+diff --git a/Lib/distutils/command/build_ext.py b/Lib/distutils/command/build_ext.py
+index 7c278ef..78613d8 100644
+--- a/Lib/distutils/command/build_ext.py
++++ b/Lib/distutils/command/build_ext.py
+@@ -747,7 +747,7 @@ class build_ext(Command):
+         else:
+             from distutils import sysconfig
+             if sysconfig.get_config_var('Py_ENABLE_SHARED'):
+-                pythonlib = 'python{}.{}{}'.format(
++                pythonlib = 'python-profile-opt{}.{}{}'.format(
+                     sys.hexversion >> 24, (sys.hexversion >> 16) & 0xff,
+                     sysconfig.get_config_var('ABIFLAGS'))
+                 return ext.libraries + [pythonlib]
+diff --git a/Makefile.pre.in b/Makefile.pre.in
+index 0327385..f744ce1 100644
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -623,7 +623,7 @@ $(LIBRARY): $(LIBRARY_OBJS)
+ 	$(AR) $(ARFLAGS) $@ $(MODOBJS)
+ 	$(RANLIB) $@
+ 
+-libpython$(LDVERSION).so: $(LIBRARY_OBJS)
++libpython-profile-opt$(LDVERSION).so: $(LIBRARY_OBJS)
+ 	if test $(INSTSONAME) != $(LDLIBRARY); then \
+ 		$(BLDSHARED) -Wl,-h$(INSTSONAME) -o $(INSTSONAME) $(LIBRARY_OBJS) $(MODLIBS) $(SHLIBS) $(LIBC) $(LIBM) $(LDLAST); \
+ 		$(LN) -f $(INSTSONAME) $@; \
+@@ -631,7 +631,7 @@ libpython$(LDVERSION).so: $(LIBRARY_OBJS)
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
+index d8c2847..ad63e4e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1001,7 +1001,7 @@ AC_SUBST(LIBRARY)
+ AC_MSG_CHECKING(LIBRARY)
+ if test -z "$LIBRARY"
+ then
+-	LIBRARY='libpython$(VERSION)$(ABIFLAGS).a'
++	LIBRARY='libpython-profile-opt$(VERSION)$(ABIFLAGS).a'
+ fi
+ AC_MSG_RESULT($LIBRARY)
+ 
+@@ -1162,13 +1162,13 @@ if test $enable_shared = "yes"; then
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
-- 
2.13.6


