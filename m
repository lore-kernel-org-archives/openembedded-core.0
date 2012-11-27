Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TdOO4-0004mn-8Y
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Nov 2012 17:51:59 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 27 Nov 2012 08:37:41 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so4897211wib.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=yEeTMwWqmSFYeKVB1coKWlnp9uw6e5ldfvQNat+zbkw=;
	b=JHS4aX3slpdo/LPmXzGRysol4m7Y40I8bMG1TfnE8/yOqx653lgXz2u9B8W6x360Pg
	xTSMx9+HZj/DzEsMwhATF4z6zBbLir+gLA3273dA81eNttlO2M4XLPeaQ2SSlq512Dd6
	YP9xVrG2M8fmGvZ823zqIMEjMs/sItbB1EzvhBECmQcbBFlo2BdcWiXOowrSPMnHITMP
	mLeeTVOubpJ55blqkAMDtZL7sHgDrNzPzsO8LdOYr5VvgjFOTHGOt2wcmat6Wd8RnXoS
	DbJk7CcGutYOV0y5h3gKV3CJB5r9RTgMVrJ6nZoDDf8B/T8S7lHijGOSWC/dal6vzPzE
	fK+Q==
Received: by 10.180.72.232 with SMTP id g8mr28069535wiv.0.1354034250855;
	Tue, 27 Nov 2012 08:37:30 -0800 (PST)
Received: by 10.180.72.232 with SMTP id g8mr28069513wiv.0.1354034250675;
	Tue, 27 Nov 2012 08:37:30 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dd4sm3640124wib.2.2012.11.27.08.37.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 08:37:29 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2012 16:35:58 +0000
Message-Id: <1354034158-1364-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmC1ifZMnxeXywdR0q8OqjOZAmui5xdiUzqcx/BZi5Qomxi9cRRSQKt22ED2mp5kWSS+Hmje32+05RbGsCHXZawI2gKEgmJuukOxea7XhwK0zgqysXKZxybVtrQ7LmDG0LLqvgRElQD9Xb5YkM0jRjzbffY8yBPsz3ZSRozsTzsSv0lwS9xMrt5IGhxgG/rgOzRIJxe
Subject: [PATCH] autogen: use pkg-config directly instead of guile-config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Nov 2012 16:51:59 -0000

The autoconf macros in autogen use dpkg (!) and guile-config to determine
what/where Guile is.

If the build host has an installed guile, these can produce conflicting results.

More interestingly, if the Guile library source and compiled form have bad
timestamps (source newer than compiled) the configure scripts knows that Guile
is present but doesn't know what version it is, resulting in compile errors.

[ YOCTO #3370 (partially) ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../autogen/autogen-native_5.12.bb                 |    5 +-
 meta/recipes-devtools/autogen/files/guile.patch    |  177 ++++++++++++++++++++
 2 files changed, 180 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/autogen/files/guile.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
index eb3721d..d13af08 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.12.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
@@ -8,12 +8,13 @@ SECTION = "devel"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" 
 
-SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
+           file://guile.patch"
 
 SRC_URI[md5sum] = "6c6671b76021fb30dd43b0d5fdb7180b"
 SRC_URI[sha256sum] = "37e885d6c8a58f33ab198d38bb972fa4c14236f951d628161dde6e20527d0df2"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "guile-native libtool-native libxml2-native"
 RDEPENDS = "automake pkgconfig"
diff --git a/meta/recipes-devtools/autogen/files/guile.patch b/meta/recipes-devtools/autogen/files/guile.patch
new file mode 100644
index 0000000..f485bba
--- /dev/null
+++ b/meta/recipes-devtools/autogen/files/guile.patch
@@ -0,0 +1,177 @@
+Disable the autoconf macros that use dpkg (!) and guile-config to determine what
+version and where guile is installed, and just use pkg-config directly (guile-config is a deprecated wrapper around pkg-config).
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Upstream-Status: Pending (should be submitted)
+
+Index: a/config/ag_macros.m4
+===================================================================
+--- a/config/ag_macros.m4	2012-11-27 14:53:24.336205621 +0000
++++ b/config/ag_macros.m4	2012-11-27 16:16:42.968271120 +0000
+@@ -163,146 +162,20 @@
+ 
+ 
+ AC_DEFUN([AG_WITHLIB_GUILE],[
+-  AC_ARG_WITH([libguile],
+-    AS_HELP_STRING([--with-libguile], [libguile installation prefix]),
+-    [ag_cv_with_libguile_root=${with_libguile}],
+-    AC_CACHE_CHECK([whether with-libguile was specified], ag_cv_with_libguile_root,
+-      ag_cv_with_libguile_root=no)
+-  ) # end of AC_ARG_WITH libguile
+-
+-  if test "${with_libguile+set}" = set && \
+-     test "${withval}" = no
+-  then ## disabled by request
+-    ag_cv_with_libguile_root=no
+-    ag_cv_with_libguile_cflags=no
+-    ag_cv_with_libguile_libs=no
+-  else
+-
+-  AC_ARG_WITH([libguile-cflags],
+-    AS_HELP_STRING([--with-libguile-cflags], [libguile compile flags]),
+-    [ag_cv_with_libguile_cflags=${with_guile_cflags}],
+-    AC_CACHE_CHECK([whether with-libguile-cflags was specified], ag_cv_with_libguile_cflags,
+-      ag_cv_with_libguile_cflags=no)
+-  ) # end of AC_ARG_WITH libguile-cflags
+-
+-  AC_ARG_WITH([libguile-libs],
+-    AS_HELP_STRING([--with-libguile-libs], [libguile link command arguments]),
+-    [ag_cv_with_libguile_libs=${with_guile_libs}],
+-    AC_CACHE_CHECK([whether with-libguile-libs was specified], ag_cv_with_libguile_libs,
+-      ag_cv_with_libguile_libs=no)
+-  ) # end of AC_ARG_WITH libguile-libs
+-
+-  case "X${ag_cv_with_libguile_cflags}" in
+-  Xyes|Xno|X )
+-    case "X${ag_cv_with_libguile_root}" in
+-    Xyes|Xno|X ) ag_cv_with_libguile_cflags=no ;;
+-    * )        ag_cv_with_libguile_cflags=-I${ag_cv_with_libguile_root}/include ;;
+-    esac
+-  esac
+-  case "X${ag_cv_with_libguile_libs}" in
+-  Xyes|Xno|X )
+-    case "X${ag_cv_with_libguile_root}" in
+-    Xyes|Xno|X ) ag_cv_with_libguile_libs=no ;;
+-    * )        ag_cv_with_libguile_libs="-L${ag_cv_with_libguile_root}/lib -lguile";;
+-    esac
+-  esac
+-  ag_save_CPPFLAGS="${CPPFLAGS}"
+-  ag_save_LIBS="${LIBS}"
+-  case "X${ag_cv_with_libguile_cflags}" in
+-  Xyes|Xno|X )
+-    f=`guile-config compile 2>/dev/null` || f=''
+-    test -n "${f}" && ag_cv_with_libguile_cflags="${f}" && \
+-      AC_MSG_NOTICE([guile-config used for CFLAGS: $f]) ;;
+-  esac
+-  case "X${ag_cv_with_libguile_libs}" in
+-  Xyes|Xno|X )
+-    f=`guile-config link 2>/dev/null` || f=''
+-    test -n "${f}" && ag_cv_with_libguile_libs="${f}" && \
+-      AC_MSG_NOTICE([guile-config used for LIBS: $f]) ;;
+-  esac
+-  fi ## disabled by request
+-
+-  case "X${ag_cv_with_libguile_cflags}" in
+-  Xyes|Xno|X )
+-    ag_cv_with_libguile_cflags="" ;;
+-  * ) CPPFLAGS="${CPPFLAGS} ${ag_cv_with_libguile_cflags}" ;;
+-  esac
+-  case "X${ag_cv_with_libguile_libs}" in
+-  Xyes|Xno|X )
+-    LIBS="${LIBS} -lguile"
+-    ag_cv_with_libguile_libs="-lguile" ;;
+-  * )
+-    LIBS="${LIBS} ${ag_cv_with_libguile_libs}" ;;
+-  esac
+-  LIBGUILE_CFLAGS=""
+-  LIBGUILE_LIBS=""
+-  AC_MSG_CHECKING([whether libguile can be linked with])
+-  AC_CACHE_VAL([ag_cv_with_libguile],[
+-  AC_LINK_IFELSE(
+-    [AC_LANG_SOURCE([[@%:@include <libguile.h>
+-@%:@if ((SCM_MAJOR_VERSION * 100) + SCM_MINOR_VERSION) > 200
+-This has not been tested with Guile 2.1.  Remove this line to proceed.
+-@%:@endif
+-int main () {
+-  SCM fumble = SCM_UNDEFINED;
+-  SCM bumble = SCM_UNDEFINED;
+-  SCM stumble= SCM_UNDEFINED;
+-  long lstumble;
+-  stumble = scm_cons( fumble, bumble );
+-  stumble = scm_display( fumble, bumble );
+-  lstumble = scm_ilength( fumble );
+-  /* stumble = scm_c_make_string( 1, SCM_UNDEFINED); */
+-  stumble = scm_c_eval_string( "stumble" );
+-  scm_misc_error( "oops", "bad", bumble );
+-  stumble = scm_num_eq_p( fumble, bumble );
+-  scm_wrong_type_arg( "oops", 1, bumble );
+-  return 0; }]])],
+-    [ag_cv_with_libguile=yes],
+-    [ag_cv_with_libguile=no]) # end of AC_LINK_IFELSE 
+-  ]) # end of AC_CACHE_VAL for ag_cv_with_libguile
+-  AC_MSG_RESULT([${ag_cv_with_libguile}])
+-    AC_SUBST([LIBGUILE_CFLAGS])
+-    AC_SUBST([LIBGUILE_LIBS])
+-    AC_SUBST([LIBGUILE_PATH])
+-  if test "X${ag_cv_with_libguile}" != Xno
+-  then[
+-      LIBGUILE_CFLAGS="${ag_cv_with_libguile_cflags}"
+-      LIBGUILE_LIBS="${ag_cv_with_libguile_libs}"
+-      case "${LIBGUILE_LIBS}" in *-L* )
+-        LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[ 	]*//;s/[ 	].*//'`
+-      ;; * ) LIBGUILE_PATH='' ;; esac]
+-      CPPFLAGS="@S|@{ag_save_CPPFLAGS}"
+-  LIBS="@S|@{ag_save_LIBS}"
+-  else
+-    CPPFLAGS="${ag_save_CPPFLAGS}"
+-    LIBS="${ag_save_LIBS}"
+-      LIBGUILE_CFLAGS=''
+-      LIBGUILE_LIBS=''
+-      LIBGUILE_PATH=''
+-      AC_MSG_ERROR([Cannot find libguile.  libguile is required.])
+-  fi
++  PKG_PROG_PKG_CONFIG
++  PKG_CHECK_MODULES(LIBGUILE, [guile-2.0])
++  case "${LIBGUILE_LIBS}" in *-L* )
++    LIBGUILE_PATH=`echo ,${LIBGUILE_LIBS} |           sed 's/.*[, ]-L[ 	]*//;s/[ 	].*//'`
++  ;; * ) LIBGUILE_PATH='' ;; esac
+   AC_SUBST([AG_GUILE])
+-  
+ ]) # end of AC_DEFUN of AG_WITHLIB_GUILE
+ 
+ 
+ AC_DEFUN([AG_TEST_GUILE_VERSION],[
+-  AC_MSG_CHECKING([whether the guile version])
++  PKG_PROG_PKG_CONFIG
++  AC_MSG_CHECKING([the guile version])
+   AC_CACHE_VAL([ag_cv_test_guile_version],[
+-    ag_cv_test_guile_version=`exec 2> /dev/null
+-pkginfo=\`dpkg --list 2>/dev/null | egrep 'guile-[0-9.]-dev'\`
+-if test -n "${pkginfo}"
+-then echo ${pkginfo} | sed -e 's/.*guile-//' -e 's/-dev.*//'
+-else
+-  v=\`( guile-config --version 2>&1 ) | sed 's/.*Guile version *//'\`
+-  test -z "${v}" && v=\`guile --version | sed 's/.*Guile *//;1q'\`
+-  test -z "${v}" && exit 1
+-  echo ${v}
+-fi`
+-    if test $? -ne 0 || test -z "$ag_cv_test_guile_version"
+-    then ag_cv_test_guile_version=no
+-    fi
+-  ]) # end of CACHE_VAL of ag_cv_test_guile_version
++    ag_cv_test_guile_version=`exec $PKG_CONFIG --modversion guile-2.0`])
+   AC_MSG_RESULT([${ag_cv_test_guile_version}])
+   if test "X${ag_cv_test_guile_version}" != Xno
+   then
+@@ -324,9 +197,9 @@
+   AC_MSG_CHECKING([whether scm_primitive_eval_x links])
+   AC_CACHE_VAL([ag_cv_link_eval_string],[
+     ag_save_CPPFLAGS="${CPPFLAGS}"
+-    CPPFLAGS="${ag_cv_with_libguile_cflags} ${CPPFLAGS}"
++    CPPFLAGS="${LIBGUILE_CFLAGS} ${CPPFLAGS}"
+     ag_save_LIBS="${LIBS}"
+-    LIBS="${ag_cv_with_libguile_libs} ${LIBS}"
++    LIBS="${LIBGUILE_LIBS} ${LIBS}"
+   AC_TRY_LINK([@%:@include <libguile.h>],
+     [SCM res = scm_primitive_eval_x( SCM_UNDEFINED );],
+     [ag_cv_link_eval_string=yes],[ag_cv_link_eval_string=no]
-- 
1.7.10



