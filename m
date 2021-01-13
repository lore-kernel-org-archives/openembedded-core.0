Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [])
 by mx.groups.io with SMTP id smtpd.web09.7916.1610545082222254138
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 05:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: <nil>, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,344,1602518400"; 
   d="scan'208";a="103445257"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 13 Jan 2021 21:37:46 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id C72EA4CE602C
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 21:37:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 13 Jan 2021 21:37:46 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] gpgme: upgrade 1.15.0 -> 1.15.1
Date: Wed, 13 Jan 2021 21:37:39 +0800
Message-ID: <1610545059-22137-2-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1610545059-22137-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1610545059-22137-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: C72EA4CE602C.A6370
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0008-do-not-auto-check-var-PYTHON.patch
removed since it is not available in 1.15.1

refresh the followning patches:
0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
0001-pkgconfig.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...e-gpgme.m4-use-gpgrt-config-with-.pc.patch |  29 +-
 .../gpgme/gpgme/0001-pkgconfig.patch          | 364 ++++++++++++++++--
 .../0008-do-not-auto-check-var-PYTHON.patch   |  34 --
 .../{gpgme_1.15.0.bb => gpgme_1.15.1.bb}      |   3 +-
 4 files changed, 354 insertions(+), 76 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
 rename meta/recipes-support/gpgme/{gpgme_1.15.0.bb => gpgme_1.15.1.bb} (96%)

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
index 0ed4eb6818..d45beb620c 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch
@@ -10,12 +10,14 @@ The oe-core does not support gpgrt-config, so revert it
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 ---
- src/gpgme.m4 | 58 ++++++++++------------------------------------------------
- 1 file changed, 10 insertions(+), 48 deletions(-)
+ src/gpgme.m4 | 59 +++++++++-------------------------------------------
+ 1 file changed, 10 insertions(+), 49 deletions(-)
 
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 2a72f18..6c2be44 100644
+index c749a5d..529c4d0 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
 @@ -1,5 +1,5 @@
@@ -29,15 +31,16 @@ index 2a72f18..6c2be44 100644
  # WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
  # implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
  #
--# Last-changed: 2018-11-12
+-# Last-changed: 2020-11-20
 +# Last-changed: 2014-10-02
  
  
  AC_DEFUN([_AM_PATH_GPGME_CONFIG],
-@@ -36,24 +36,10 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+@@ -35,25 +35,10 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+        esac
       fi
    fi
- 
+-
 -  use_gpgrt_config=""
 -  if test x"${GPGME_CONFIG}" = x -a x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG gpgme --exists; then
@@ -61,7 +64,7 @@ index 2a72f18..6c2be44 100644
    fi
    gpgme_version_major=`echo $gpgme_version | \
                 sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\).*/\1/'`
-@@ -66,16 +52,12 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
+@@ -66,16 +51,12 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
  
  AC_DEFUN([_AM_PATH_GPGME_CONFIG_HOST_CHECK],
  [
@@ -80,7 +83,7 @@ index 2a72f18..6c2be44 100644
  *** built for $gpgme_config_host and thus may not match the
  *** used host $host.
  *** You may want to use the configure option --with-gpgme-prefix
-@@ -136,11 +118,7 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -136,11 +117,7 @@ AC_DEFUN([AM_PATH_GPGME],
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -89,11 +92,11 @@ index 2a72f18..6c2be44 100644
 -        else
 -          tmp=`$GPGME_CONFIG --variable=api_version 2>/dev/null || echo 0`
 -        fi
-+        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
++	tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -280,11 +258,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -280,11 +257,7 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
@@ -102,11 +105,11 @@ index 2a72f18..6c2be44 100644
 -        else
 -          tmp=`$GPGME_CONFIG --variable=api_version 2>/dev/null || echo 0`
 -        fi
-+        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
++	tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -293,20 +267,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -293,20 +266,8 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       fi
    fi
    if test $ok = yes; then
@@ -130,5 +133,5 @@ index 2a72f18..6c2be44 100644
      ifelse([$2], , :, [$2])
      _AM_PATH_GPGME_CONFIG_HOST_CHECK
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
index 827d95a151..3df79f4449 100644
--- a/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/0001-pkgconfig.patch
@@ -14,20 +14,200 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Rebase to 1.13.0
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
 ---
- configure.ac            |   1 +
- src/Makefile.am         |   4 +-
- src/gpgme-pthread.pc.in |  15 +++++++
- src/gpgme.m4            | 114 ++++--------------------------------------------
+ configure.ac            | 125 ++++++++++++++++++++--------------------
+ src/Makefile.am         |  80 ++++++++++++-------------
+ src/gpgme-pthread.pc.in |  15 +++++
+ src/gpgme.m4            | 114 +++---------------------------------
  src/gpgme.pc.in         |   4 +-
- 5 files changed, 28 insertions(+), 110 deletions(-)
+ 5 files changed, 128 insertions(+), 210 deletions(-)
  create mode 100644 src/gpgme-pthread.pc.in
 
 diff --git a/configure.ac b/configure.ac
-index 25184f4..1c0a386 100644
+index 628e5ff..24ae946 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -899,6 +899,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+@@ -48,10 +48,10 @@ m4_esyscmd([echo ]mym4_version[>VERSION])
+ AC_INIT([mym4_package],[mym4_version],[https://bugs.gnupg.org])
+ 
+ # LT Version numbers, remember to change them just *before* a release.
+-#   (Code changed:			REVISION++)
+-#   (Interfaces added/removed/changed:	CURRENT++, REVISION=0)
+-#   (Interfaces added:			AGE++)
+-#   (Interfaces removed:		AGE=0)
++#   (Code changed:                     REVISION++)
++#   (Interfaces added/removed/changed: CURRENT++, REVISION=0)
++#   (Interfaces added:                 AGE++)
++#   (Interfaces removed:               AGE=0)
+ #
+ LIBGPGME_LT_CURRENT=35
+ LIBGPGME_LT_AGE=24
+@@ -192,10 +192,10 @@ LT_LANG([Windows Resource])
+ have_ld_version_script=no
+ case "${host}" in
+     *-*-linux*)
+-	have_ld_version_script=yes
++       have_ld_version_script=yes
+         ;;
+     *-*-gnu*)
+-	have_ld_version_script=yes
++       have_ld_version_script=yes
+         ;;
+     *-apple-darwin*)
+         AC_DEFINE(_DARWIN_C_SOURCE, 900000L,
+@@ -233,27 +233,27 @@ case "${host}" in
+ esac
+ case "${host}" in
+     *-mingw32*)
+-	have_dosish_system=yes
++       have_dosish_system=yes
+         have_w32_system=yes
+         GPG_DEFAULT='c:\\gnupg\\gpg.exe'
+-	GPGSM_DEFAULT='c:\\gnupg\\gpgsm.exe'
++       GPGSM_DEFAULT='c:\\gnupg\\gpgsm.exe'
+         GPGCONF_DEFAULT='c:\\gnupg\\gpgconf.exe'
+         G13_DEFAULT='c:\\gnupg\\g13.exe'
+         #component_system='COM+'
+ 
+-	AM_PATH_GLIB_2_0
+-	AC_ARG_ENABLE(w32-glib,
+-	    AS_HELP_STRING([--enable-w32-glib],[build GPGME Glib for W32]),
+-	    		   build_w32_glib=$enableval)
++       AM_PATH_GLIB_2_0
++       AC_ARG_ENABLE(w32-glib,
++           AS_HELP_STRING([--enable-w32-glib],[build GPGME Glib for W32]),
++                          build_w32_glib=$enableval)
+        ;;
+     *)
+ 
+-	# XXX: Probably use exec-prefix here?
+-#	GPG_DEFAULT='/usr/bin/gpg'
+-#	GPGSM_DEFAULT='/usr/bin/gpgsm'
+-#	GPGCONF_DEFAULT='/usr/bin/gpgconf'
+-#	G13_DEFAULT='/usr/bin/g13'
+-	;;
++       # XXX: Probably use exec-prefix here?
++#      GPG_DEFAULT='/usr/bin/gpg'
++#      GPGSM_DEFAULT='/usr/bin/gpgsm'
++#      GPGCONF_DEFAULT='/usr/bin/gpgconf'
++#      G13_DEFAULT='/usr/bin/g13'
++       ;;
+ esac
+ 
+ if test "$have_dosish_system" = yes; then
+@@ -419,59 +419,59 @@ if test "$found_py" = "1"; then
+         fi
+     else
+         # Reset the version collecting vars.
+-	PYTHONS=
+-	PYTHON_VERSIONS=
++       PYTHONS=
++       PYTHON_VERSIONS=
+ 
+-	if test "$found_py" = "1" -o "$found_py3" = "1"; then
+-	  # Reset everything, so that we can look for another Python.
++       if test "$found_py" = "1" -o "$found_py3" = "1"; then
++         # Reset everything, so that we can look for another Python.
+           m4_foreach([mym4pythonver],
+                      [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[3.9],[all]],
+            [unset PYTHON
+-	    unset PYTHON_VERSION
+-	    unset PYTHON_CPPFLAGS
+-	    unset PYTHON_LDFLAGS
+-	    unset PYTHON_SITE_PKG
+-	    unset PYTHON_EXTRA_LIBS
+-	    unset PYTHON_EXTRA_LDFLAGS
+-	    unset ac_cv_path_PYTHON
+-	    unset am_cv_pathless_PYTHON
+-	    unset am_cv_python_version
+-	    unset am_cv_python_platform
+-	    unset am_cv_python_pythondir
+-	    unset am_cv_python_pyexecdir
+-	    AM_PATH_PYTHON(mym4pythonver, [
+-		AX_PYTHON_DEVEL
+-		if test "$PYTHON_VERSION"; then
+-			PYTHONS="$(echo $PYTHONS $PYTHON)"
+-			PYTHON_VERSIONS="$(echo $PYTHON_VERSIONS $PYTHON_VERSION)"
+-		fi
+-	    ], :, m4_if([mym4pythonver],[all],[],[python]mym4pythonver))
++           unset PYTHON_VERSION
++           unset PYTHON_CPPFLAGS
++           unset PYTHON_LDFLAGS
++           unset PYTHON_SITE_PKG
++           unset PYTHON_EXTRA_LIBS
++           unset PYTHON_EXTRA_LDFLAGS
++           unset ac_cv_path_PYTHON
++           unset am_cv_pathless_PYTHON
++           unset am_cv_python_version
++           unset am_cv_python_platform
++           unset am_cv_python_pythondir
++           unset am_cv_python_pyexecdir
++           AM_PATH_PYTHON(mym4pythonver, [
++               AX_PYTHON_DEVEL
++               if test "$PYTHON_VERSION"; then
++                       PYTHONS="$(echo $PYTHONS $PYTHON)"
++                       PYTHON_VERSIONS="$(echo $PYTHON_VERSIONS $PYTHON_VERSION)"
++               fi
++           ], :, m4_if([mym4pythonver],[all],[],[python]mym4pythonver))
+            ])
+-	fi
++       fi
+ 
+-	# Recover some values lost in the second attempt to find Python.
+-	PYTHON="$(echo $PYTHONS | cut -d ' ' -f 1)"
+-	PYTHON_VERSION="$(echo $PYTHON_VERSIONS | cut -d ' ' -f 1)"
++       # Recover some values lost in the second attempt to find Python.
++       PYTHON="$(echo $PYTHONS | cut -d ' ' -f 1)"
++       PYTHON_VERSION="$(echo $PYTHON_VERSIONS | cut -d ' ' -f 1)"
+ 
+-	# Remove duplicates.
+-	PYTHONS="$(echo $PYTHONS | tr '[[:space:]]' '\n' | sort | uniq | tr '\n' ' ' | sed -e 's/ $//')"
+-	PYTHON_VERSIONS="$(echo $PYTHON_VERSIONS | tr '[[:space:]]' '\n' | sort | uniq | tr '\n' ' ' | sed -e 's/ $//')"
++       # Remove duplicates.
++       PYTHONS="$(echo $PYTHONS | tr '[[:space:]]' '\n' | sort | uniq | tr '\n' ' ' | sed -e 's/ $//')"
++       PYTHON_VERSIONS="$(echo $PYTHON_VERSIONS | tr '[[:space:]]' '\n' | sort | uniq | tr '\n' ' ' | sed -e 's/ $//')"
+ 
+-	if test "$PYTHON_VERSIONS"; then
+-	   enabled_languages_v=$(echo $enabled_languages | sed -Ee "s/python[[23]]?/python ($PYTHON_VERSIONS)/")
+-	   enabled_languages=$(echo $enabled_languages | sed -Ee "s/python[[23]]?/python/")
+-	else
++       if test "$PYTHON_VERSIONS"; then
++          enabled_languages_v=$(echo $enabled_languages | sed -Ee "s/python[[23]]?/python ($PYTHON_VERSIONS)/")
++          enabled_languages=$(echo $enabled_languages | sed -Ee "s/python[[23]]?/python/")
++       else
+             if test "$explicit_languages" = "1"; then
+                 AC_MSG_ERROR([[
+ ***
+ *** Please install the python development packages.
+ ***]])
+-	    else
++           else
+                 enabled_languages=$(echo $enabled_languages | sed 's/python//')
+             fi
+-	fi
++       fi
+ 
+-	AC_SUBST(PYTHONS, $PYTHONS)
++       AC_SUBST(PYTHONS, $PYTHONS)
+     fi
+ fi
+ 
+@@ -893,17 +893,18 @@ fi
+ # Create config files
+ 
+ AC_CONFIG_FILES(Makefile src/Makefile
+-		tests/Makefile
++               tests/Makefile
+                 tests/gpg/Makefile
+                 tests/gpgsm/Makefile
+                 tests/opassuan/Makefile
+                 tests/json/Makefile
+-		doc/Makefile
++               doc/Makefile
+                 src/versioninfo.rc
+                 src/gpgme.pc
                  src/gpgme-glib.pc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -35,8 +215,25 @@ index 25184f4..1c0a386 100644
  AC_CONFIG_FILES(lang/cpp/Makefile lang/cpp/src/Makefile)
  AC_CONFIG_FILES(lang/cpp/tests/Makefile)
  AC_CONFIG_FILES(lang/cpp/src/GpgmeppConfig-w32.cmake.in)
+@@ -923,11 +924,11 @@ AC_CONFIG_FILES([lang/js/Makefile lang/js/src/Makefile
+                  lang/js/DemoExtension/Makefile])
+ AC_CONFIG_FILES(lang/qt/doc/Makefile)
+ AC_CONFIG_FILES([lang/python/Makefile
+-		 lang/python/version.py
+-		 lang/python/tests/Makefile
+-		 lang/python/src/Makefile
+-		 lang/python/examples/Makefile
+-		 lang/python/doc/Makefile])
++                lang/python/version.py
++                lang/python/tests/Makefile
++                lang/python/src/Makefile
++                lang/python/examples/Makefile
++                lang/python/doc/Makefile])
+ AC_CONFIG_FILES([lang/python/setup.py], [chmod a+x lang/python/setup.py])
+ AC_OUTPUT
+ 
 diff --git a/src/Makefile.am b/src/Makefile.am
-index d85a85c..d942f3e 100644
+index 35add9c..f86c98d 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
 @@ -20,11 +20,11 @@
@@ -47,12 +244,125 @@ index d85a85c..d942f3e 100644
 +pkgconfig_DATA = gpgme.pc gpgme-glib.pc gpgme-pthread.pc
  
  EXTRA_DIST = gpgme-config.in gpgme.m4 libgpgme.vers ChangeLog-2011 \
- 	     gpgme.h.in versioninfo.rc.in gpgme.def \
+-	     gpgme.h.in versioninfo.rc.in gpgme.def \
 -	     gpgme.pc.in gpgme-glib.pc.in
-+	     gpgme.pc.in gpgme-glib.pc.in gpgme-pthread.pc.in
++            gpgme.h.in versioninfo.rc.in gpgme.def \
++            gpgme.pc.in gpgme-glib.pc.in gpgme-pthread.pc.in
  
  bin_SCRIPTS = gpgme-config
  m4datadir = $(datadir)/aclocal
+@@ -66,32 +66,32 @@ endif
+ # correctly on all platforms (in particular, one can not specify the
+ # right linking order with libtool, as the non-installed version has
+ # unresolved symbols to the thread module.
+-main_sources =								\
+-	util.h conversion.c b64dec.c get-env.c context.h ops.h		\
+-	parsetlv.c parsetlv.h                                           \
+-	mbox-util.c mbox-util.h                                         \
+-	data.h data.c data-fd.c data-stream.c data-mem.c data-user.c	\
+-	data-estream.c                                                  \
+-	data-compat.c data-identify.c					\
+-	signers.c sig-notation.c					\
+-	wait.c wait-global.c wait-private.c wait-user.c wait.h		\
+-	op-support.c							\
+-	encrypt.c encrypt-sign.c decrypt.c decrypt-verify.c verify.c	\
+-	sign.c passphrase.c progress.c					\
+-	key.c keylist.c keysign.c trust-item.c trustlist.c tofupolicy.c	\
+-	revsig.c							\
+-	import.c export.c genkey.c delete.c edit.c getauditlog.c        \
+-	setexpire.c							\
+-	opassuan.c passwd.c spawn.c assuan-support.c                    \
+-	engine.h engine-backend.h engine.c engine-gpg.c status-table.c	\
+-	engine-gpgsm.c engine-assuan.c engine-gpgconf.c                 \
+-	$(uiserver_components)						\
+-	engine-g13.c vfs-mount.c vfs-create.c			        \
+-	engine-spawn.c 	                                                \
+-	gpgconf.c queryswdb.c						\
+-	sema.h priv-io.h $(system_components) sys-util.h dirinfo.c	\
+-	debug.c debug.h gpgme.c version.c error.c \
+-	ath.h ath.c
++main_sources =                                                         \
++       util.h conversion.c b64dec.c get-env.c context.h ops.h          \
++       parsetlv.c parsetlv.h                                           \
++       mbox-util.c mbox-util.h                                         \
++       data.h data.c data-fd.c data-stream.c data-mem.c data-user.c    \
++       data-estream.c                                                  \
++       data-compat.c data-identify.c                                   \
++       signers.c sig-notation.c                                        \
++       wait.c wait-global.c wait-private.c wait-user.c wait.h          \
++       op-support.c                                                    \
++       encrypt.c encrypt-sign.c decrypt.c decrypt-verify.c verify.c    \
++       sign.c passphrase.c progress.c                                  \
++       key.c keylist.c keysign.c trust-item.c trustlist.c tofupolicy.c \
++       revsig.c                                                        \
++       import.c export.c genkey.c delete.c edit.c getauditlog.c        \
++       setexpire.c                                                     \
++       opassuan.c passwd.c spawn.c assuan-support.c                    \
++       engine.h engine-backend.h engine.c engine-gpg.c status-table.c  \
++       engine-gpgsm.c engine-assuan.c engine-gpgconf.c                 \
++       $(uiserver_components)                                          \
++       engine-g13.c vfs-mount.c vfs-create.c                           \
++       engine-spawn.c                                                  \
++       gpgconf.c queryswdb.c                                           \
++       sema.h priv-io.h $(system_components) sys-util.h dirinfo.c      \
++       debug.c debug.h gpgme.c version.c error.c \
++       ath.h ath.c
+ 
+ libgpgme_la_SOURCES = $(main_sources) $(system_components_not_extra)
+ 
+@@ -122,7 +122,7 @@ LTRCCOMPILE = $(LIBTOOL) --mode=compile --tag=RC $(RCCOMPILE)
+ SUFFIXES = .rc .lo
+ 
+ .rc.lo:
+-	$(LTRCCOMPILE) -i "$<" -o "$@"
++       $(LTRCCOMPILE) -i "$<" -o "$@"
+ 
+ gpgme_res = versioninfo.lo
+ no_undefined = -no-undefined
+@@ -131,11 +131,11 @@ extra_ltoptions = -XCClinker -static-libgcc
+ gpgme_w32_extra_libs = -lws2_32
+ 
+ install-def-file:
+-	-$(INSTALL) -d $(DESTDIR)$(libdir)
+-	$(INSTALL) $(srcdir)/gpgme.def $(DESTDIR)$(libdir)/gpgme.def
++       -$(INSTALL) -d $(DESTDIR)$(libdir)
++       $(INSTALL) $(srcdir)/gpgme.def $(DESTDIR)$(libdir)/gpgme.def
+ 
+ uninstall-def-file:
+-	-rm $(DESTDIR)$(libdir)/gpgme.def
++       -rm $(DESTDIR)$(libdir)/gpgme.def
+ 
+ gpgme_deps = $(gpgme_res) gpgme.def
+ 
+@@ -151,21 +151,21 @@ gpgme_deps =
+ endif
+ 
+ libgpgme_la_LDFLAGS = $(no_undefined) $(export_symbols) $(extra_ltoptions) \
+-	$(libgpgme_version_script_cmd) -version-info \
+-	@LIBGPGME_LT_CURRENT@:@LIBGPGME_LT_REVISION@:@LIBGPGME_LT_AGE@
++       $(libgpgme_version_script_cmd) -version-info \
++       @LIBGPGME_LT_CURRENT@:@LIBGPGME_LT_REVISION@:@LIBGPGME_LT_AGE@
+ libgpgme_la_DEPENDENCIES = @LTLIBOBJS@ $(srcdir)/libgpgme.vers $(gpgme_deps)
+ libgpgme_la_LIBADD = $(gpgme_res) @LIBASSUAN_LIBS@ @LTLIBOBJS@ \
+-	             @GPG_ERROR_LIBS@ $(gpgme_w32_extra_libs)
++                    @GPG_ERROR_LIBS@ $(gpgme_w32_extra_libs)
+ 
+ if BUILD_W32_GLIB
+ libgpgme_glib_la_LDFLAGS = \
+         $(no_undefined) $(export_symbols) $(extra_ltoptions) \
+         $(libgpgme_version_script_cmd) -version-info \
+-	@LIBGPGME_LT_CURRENT@:@LIBGPGME_LT_REVISION@:@LIBGPGME_LT_AGE@
+-libgpgme_glib_la_DEPENDENCIES =	@LTLIBOBJS@ \
+-	$(srcdir)/libgpgme.vers $(gpgme_deps)
++       @LIBGPGME_LT_CURRENT@:@LIBGPGME_LT_REVISION@:@LIBGPGME_LT_AGE@
++libgpgme_glib_la_DEPENDENCIES =        @LTLIBOBJS@ \
++       $(srcdir)/libgpgme.vers $(gpgme_deps)
+ libgpgme_glib_la_LIBADD = $(gpgme_res) @LIBASSUAN_LIBS@ @LTLIBOBJS@ \
+-	@GPG_ERROR_LIBS@ @GLIB_LIBS@ $(gpgme_w32_extra_libs)
++       @GPG_ERROR_LIBS@ @GLIB_LIBS@ $(gpgme_w32_extra_libs)
+ endif
+ 
+ install-data-local: install-def-file
 diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
 new file mode 100644
 index 0000000..074bbf6
@@ -75,10 +385,10 @@ index 0000000..074bbf6
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
 diff --git a/src/gpgme.m4 b/src/gpgme.m4
-index 6c2be44..d8a75cb 100644
+index 529c4d0..a1f7584 100644
 --- a/src/gpgme.m4
 +++ b/src/gpgme.m4
-@@ -79,7 +79,7 @@ dnl config script does not match the host specification the script
+@@ -78,7 +78,7 @@ dnl config script does not match the host specification the script
  dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPGME],
@@ -87,7 +397,7 @@ index 6c2be44..d8a75cb 100644
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -89,36 +89,12 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -88,36 +88,12 @@ AC_DEFUN([AM_PATH_GPGME],
       min_gpgme_version="$tmp"
    fi
  
@@ -121,12 +431,12 @@ index 6c2be44..d8a75cb 100644
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
--        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
-+        tmp=`$PKG_CONFIG --variable=api_version gpgme 2>/dev/null || echo 0`
+-	tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
++	tmp=`$PKG_CONFIG --variable=api_version gpgme 2>/dev/null || echo 0`
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -127,19 +103,11 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -126,19 +102,11 @@ AC_DEFUN([AM_PATH_GPGME],
       fi
    fi
    if test $ok = yes; then
@@ -146,7 +456,7 @@ index 6c2be44..d8a75cb 100644
  ])
  
  dnl AM_PATH_GPGME_PTHREAD([MINIMUM-VERSION,
-@@ -148,7 +116,7 @@ dnl Test for libgpgme and define GPGME_PTHREAD_CFLAGS
+@@ -147,7 +115,7 @@ dnl Test for libgpgme and define GPGME_PTHREAD_CFLAGS
  dnl  and GPGME_PTHREAD_LIBS.
  dnl
  AC_DEFUN([AM_PATH_GPGME_PTHREAD],
@@ -155,7 +465,7 @@ index 6c2be44..d8a75cb 100644
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -158,38 +126,12 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+@@ -157,38 +125,12 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
       min_gpgme_version="$tmp"
    fi
  
@@ -186,17 +496,17 @@ index 6c2be44..d8a75cb 100644
 -      fi
 -    fi
 -  fi
-+  PKG_CHECK_MODULES(GPGME_PTHREAD, [gpgme-pthread >= $min_gpgme_version], [ok=yes], [ok=no])
++  PKG_CHECK_MODULES(GPGME, [gpgme >= $min_gpgme_version], [ok=yes], [ok=no])
    if test $ok = yes; then
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
 -        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
-+        tmp=`$PKG_CONFIG --variable=api_version gpgme-pthread 2>/dev/null || echo 0`
++	tmp=`$PKG_CONFIG --variable=api_version gpgme 2>/dev/null || echo 0`
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -198,19 +140,11 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+@@ -197,19 +139,11 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
       fi
    fi
    if test $ok = yes; then
@@ -216,7 +526,7 @@ index 6c2be44..d8a75cb 100644
  ])
  
  
-@@ -229,36 +163,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -228,36 +162,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       min_gpgme_version="$tmp"
    fi
  
@@ -245,17 +555,17 @@ index 6c2be44..d8a75cb 100644
 -        fi
 -    fi
 -  fi
-+  PKG_CHECK_MODULES(GPGME_GLIB, [gpgme >= $min_gpgme_version glib-2.0], [ok=yes], [ok=no])  
++  PKG_CHECK_MODULES(GPGME_PTHREAD, [gpgme-pthread >= $min_gpgme_version], [ok=yes], [ok=no])
    if test $ok = yes; then
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
       if test "$req_gpgme_api" -gt 0 ; then
--        tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
-+        tmp=`$PKG_CONFIG --variable=api_version gpgme 2>/dev/null || echo 0`
+-	tmp=`$GPGME_CONFIG --api-version 2>/dev/null || echo 0`
++	tmp=`$PKG_CONFIG --variable=api_version gpgme-pthread 2>/dev/null || echo 0`
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -267,17 +177,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -266,17 +176,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       fi
    fi
    if test $ok = yes; then
@@ -287,5 +597,5 @@ index be288b8..16f56ac 100644
 +Libs: -L${libdir} -lgpgme
  URL: https://www.gnupg.org/software/gpgme/index.html
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch b/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
deleted file mode 100644
index dfea1bf78a..0000000000
--- a/meta/recipes-support/gpgme/gpgme/0008-do-not-auto-check-var-PYTHON.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5bbf7a048b6d81d23186340e839f9f65b5b514b6 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Fri, 10 May 2019 16:19:54 +0800
-Subject: [PATCH] do not auto check var-PYTHON
-
-Upstream auto check the version of python rather than specify option
-[ff6ff61 python: Auto-check for all installed python versions.]
-
-In oe-core, don't check var-PYTHON, use the setting from recipe,
-only check specific python 2.7 and 3.7
-
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5ef00c0..bbcff93 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -425,8 +425,8 @@ if test "$found_py" = "1"; then
- 	if test "$found_py" = "1" -o "$found_py3" = "1"; then
- 	  # Reset everything, so that we can look for another Python.
-           m4_foreach([mym4pythonver],
--                     [[2.7],[3.4],[3.5],[3.6],[3.7],[3.8],[3.9],[all]],
--           [unset PYTHON
-+                     [[2.7],[3.7]],
-+           [
- 	    unset PYTHON_VERSION
- 	    unset PYTHON_CPPFLAGS
- 	    unset PYTHON_LDFLAGS
diff --git a/meta/recipes-support/gpgme/gpgme_1.15.0.bb b/meta/recipes-support/gpgme/gpgme_1.15.1.bb
similarity index 96%
rename from meta/recipes-support/gpgme/gpgme_1.15.0.bb
rename to meta/recipes-support/gpgme/gpgme_1.15.1.bb
index 9264af8c5d..d6b470503e 100644
--- a/meta/recipes-support/gpgme/gpgme_1.15.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.15.1.bb
@@ -19,10 +19,9 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch \
            file://0006-fix-build-path-issue.patch \
            file://0007-python-Add-variables-to-tests.patch \
-           file://0008-do-not-auto-check-var-PYTHON.patch \
           "
 
-SRC_URI[sha256sum] = "0b472bc12c7d455906c8a539ec56da0a6480ef1c3a87aa5b74d7125df68d0e5b"
+SRC_URI[sha256sum] = "eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad"
 
 DEPENDS = "libgpg-error libassuan"
 RDEPENDS_${PN}-cpp += "libstdc++"
-- 
2.25.1



