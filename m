Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09F1CA1017
	for <webhook@archiver.kernel.org>; Sun,  7 Sep 2025 19:20:16 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.2364.1757272813834082468
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Sep 2025 12:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W/HzSAHr;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b02c719a117so662802966b.1
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 12:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757272812; x=1757877612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+hsYioQpfE485yD8d4dBsXJjG2HaCNAT7qa749NQx4=;
        b=W/HzSAHrDKeHOZxn9WDHpyjdxmSfG6MFklGpu3FjlQMAp7dmkV/nYplbRnDJwZ9AJC
         MhOx9+eDV8jVfTIDWIZVEgSWfE26IqKvMJscYV8VwLFkoiibxROUIT4TDobqep70xA+x
         BDYEcvG9XXMxYQLm/cWtgNAWUocGRr6ttODGfE/zk5pEM9gZSYx0Fk9kc2g8aDxJtLXB
         X+pSpXJi79BU1tw+EaSU7k3Pa7ilbTR+ieVRk2Rj3PamIUk5gbHqFNUo5SvQF09vf/Ll
         XTP0LmbAZ7o/1DrieFPTEf/d/SZsHo87jar+c86C/HhgLcvcYvw39oiZBq6MZlnHMgCK
         9saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757272812; x=1757877612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+hsYioQpfE485yD8d4dBsXJjG2HaCNAT7qa749NQx4=;
        b=uOIZubrzmxCxbw5t7WeznjoqgS9C6Q0KIF59FX0NSuXJyVUNrEkaXwYb2Ywr6gGec0
         k5jiFuN3tu4TRQilx9pjsl3pia59CBPwFAD2zb6U5S+7rh8ljc+L8Hv44b8dG0rI4WUe
         mDdt9TwYQY+aXJXyipQNHZMe0bJ2ii5RqUcKxY4L4BRIw+pn5S6bR6dDxeY6VjdIlayy
         youCYpJegncTp8ljQHq0ZqgQH8YC5y7GLjy/gwRatXzPWy6pKIhGLUYAECr8AuHnbxI9
         jvoTUA2NCboy82Aq86UBAYTdHtIn+wQt3bmchsqCBCcJX7IynVU+lrhJaeEzs4JvC1l/
         PAbQ==
X-Gm-Message-State: AOJu0YzaHsjpSCqEoBSoi8LI3CCvtwEMuWslMZWMxgesE2QcyzUYdSIz
	oBa0yfIY6b4RPAgnZgLDkSLAyyJjRfmT8bd6Ac/kjOSRUOgXbdzdki/xM+9jGQ==
X-Gm-Gg: ASbGncuXHS1gufO2fzS8YzSM9S/9emw+A2FMIwxefvA4Q8mBA7fZ8VsuzPTuyCWTy0Y
	3hIJB/rWMKlJOmrnZuPWiyRQK7WVy9rGknHjPm2usvKVAG4U/DtG/RtbAapxZ3axHVI85b1itJD
	NtOnH1duj3UgJ4Y3Fl85wivUPttkSIQW3Qe7d7QgfSiecTuTG5cR7e5vCNPg/yLKsPAHjoni7D/
	kXQfM6nSjvHbgPuzQTyIYHKIMwDeQdZhZPYZyTQMZCzUM53N7QSaLGFNE+fBM/USZgODBvK+GRR
	nXtCqXuDT/RTCBSsMhqM9+EbmXPO9yL3QluTIaRhL6R54Mn13sTAALeAzEOydjRuXij0QllNRCE
	ltzTB5RXsXv/epe1/jUGYyKcCUuozyHI=
X-Google-Smtp-Source: AGHT+IEcFMNojLJT4BSmq1AHLbB8aIpwoVvuTQSWZyM55CVEEA8SvSG+LRuQxtrMFwAxbrylOG813Q==
X-Received: by 2002:a17:907:9414:b0:b04:a302:d1ed with SMTP id a640c23a62f3a-b04b1687be0mr555939466b.41.1757272811747;
        Sun, 07 Sep 2025 12:20:11 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b04279a59ffsm1771633566b.60.2025.09.07.12.20.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 12:20:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gettext, gettext-minimal-native: upgrade 0.23.1 -> 0.26
Date: Sun,  7 Sep 2025 21:20:10 +0200
Message-ID: <20250907192010.3470676-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Sep 2025 19:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223055

From: "Gyorgy Sarvari" <skandigraun@gmail.com>

Changelog:
0.24: https://lists.gnu.org/archive/html/info-gnu/2025-02/msg00010.html
0.25: https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00000.html
0.26: https://lists.gnu.org/archive/html/info-gnu/2025-07/msg00007.html

- gettext-minimal-native recipe adapted to the new macro name (aclocal_DATA -> macros_DATA)
- install Makevars.template to gettext-minimal-native to be able to update missing variables
  The file is renamed in the desitanion to Makevars.template.minimal, to avoid clashing
  with the full gettext package (some recipes have both as dependency).
- autotools.bbclass: search for all po folders, and update the Makefile.in.in file
  in each of them. This is required, because without this the old Makefile.in.in
  files in these non ${S}/po folders are not updated with the new version of gettext, and
  the compilation routinely fails due to this.
  As part of the same change, also concatenate the source's Makevars files with the gettext
  Makevars.template: this allows all variables to be defined, even the new ones that the
  source didn't contain originally. First set the gettext template, and then append
  the source's original Makevars to it, so it should override the variables that it was
  setting originally, and keep the new variables at their default value.
- Add new PACKAGECONFIG to use libselinux, and also fix libselinux discovery in autotools
  (use pkg-config instead of autotools discovery, because autotools' library search doesn't
  respect custom sysroot)

Ptest results:

=======================
All 626 tests passed
(40 tests were not run)
=======================
DURATION: 36
END: /usr/lib/gettext/ptest
2025-08-30T17:49
STOP: ptest-runner
TOTAL: 1 FAIL: 0

With the previous version:
All 545 tests passed
(34 tests were not run)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

This patch is identical to RFC v2:
https://lists.openembedded.org/g/openembedded-core/message/222852

RFC v1: https://lists.openembedded.org/g/openembedded-core/message/222968

 meta/classes-recipe/autotools.bbclass         | 31 ++++++++++++---
 ...23.1.bb => gettext-minimal-native_0.26.bb} |  4 +-
 meta/recipes-core/gettext/gettext-sources.inc |  5 +--
 ...01-tests-autopoint-3-unset-MAKEFLAGS.patch |  8 ++--
 .../gettext/gettext/serial-tests-config.patch | 28 ++++++-------
 .../gettext/gettext/use-pkgconfig.patch       | 39 +++++++++++++++++++
 .../{gettext_0.23.1.bb => gettext_0.26.bb}    | 11 ++++--
 7 files changed, 95 insertions(+), 31 deletions(-)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.23.1.bb => gettext-minimal-native_0.26.bb} (87%)
 rename meta/recipes-core/gettext/{gettext_0.23.1.bb => gettext_0.26.bb} (94%)

diff --git a/meta/classes-recipe/autotools.bbclass b/meta/classes-recipe/autotools.bbclass
index 948f8c183a..bd477dc60f 100644
--- a/meta/classes-recipe/autotools.bbclass
+++ b/meta/classes-recipe/autotools.bbclass
@@ -186,13 +186,34 @@ autotools_do_configure() {
 				echo "no" | glib-gettextize --force --copy
 			fi
 		elif [ "${BPN}" != "gettext" ] && grep -q "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC; then
-			# We'd call gettextize here if it wasn't so broken...
+			# Gettextize could be called here, however it doesn't make the job much easier:
+			# It doesn't discover relevant po folders on its own, so they still need to be
+			# found by some heurestics. Also, it would require always the full gettext
+			# package always, instead of gettext-minimal-native.
 			cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUXDIR}/
-			if [ -d ${S}/po/ ]; then
-				cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
-				if [ ! -e ${S}/po/remove-potcdate.sed ]; then
-					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${S}/po/
+			if [ -d ${S}/po ]; then
+				# Copy the latest Makefile.in.in to the /po folder, regardless if it exists or not
+				# If it exists, then also look for identical Makefile.in.in files, and update them too
+				makefiles_to_update="./po/Makefile.in.in"
+				if [ -f ${S}/po/Makefile.in.in ]; then
+					# search for all Makefile.in.in files that are identical to ./po/Makefile.in.in, by md5sum
+					base_makefile_hash=`md5sum ${S}/po/Makefile.in.in | tr -s ' ' | cut -f1 -d' '`
+					makefiles_to_update=`find ${S} -name Makefile.in.in -exec md5sum {} \+ | grep $base_makefile_hash | tr -s ' ' | cut -d' ' -f2`
 				fi
+				bbnote List of Makefile.in.ins to update: $makefiles_to_update
+				for makefile in ${makefiles_to_update}; do
+					makefile_dir=$(dirname $makefile)
+					bbnote Executing: cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${makefile_dir}/
+					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${makefile_dir}/
+					if [ ! -e ${makefile_dir}/remove-potcdate.sed ]; then
+						cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sed ${makefile_dir}/
+					fi
+				done
+				for makevars in `find ${S} -name Makevars`; do
+					bbnote Concatenating Makevars: $makevars
+					cat ${STAGING_DATADIR_NATIVE}/gettext/po/Makevars.template.minimal ${makevars} >> ${makevars}.yocto_temp
+					mv ${makevars}.yocto_temp ${makevars}
+				done
 			fi
 			PRUNE_M4="$PRUNE_M4 gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 nls.m4 po.m4 progtest.m4"
 		fi
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
similarity index 87%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
index 941896ec48..b5c32d0786 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.23.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.26.bb
@@ -24,7 +24,7 @@ python get_aclocal_files() {
     with open(fpath) as f:
         content = f.read()
         for l in content.replace("\\\n","").split("\n"):
-            if l.startswith("aclocal_DATA"):
+            if l.startswith("macros_DATA"):
                 aclocal_files = l.split("=")[1]
                 with open(oe.path.join(d.getVar("WORKDIR"),"aclocal-files"),'w') as outf:
                     outf.write(aclocal_files)
@@ -43,4 +43,6 @@ do_install () {
 	cp ${S}/build-aux/config.rpath ${D}${datadir}/gettext/
 	cp ${S}/gettext-runtime/po/Makefile.in.in ${D}${datadir}/gettext/po/
 	cp ${S}/gettext-runtime/po/remove-potcdate.sed ${D}${datadir}/gettext/po/
+	# The gettext recipe also installs the same Makevars.template at the same place, rename it
+	cp ${S}/gettext-tools/po/Makevars.template ${D}${datadir}/gettext/po/Makevars.template.minimal
 }
diff --git a/meta/recipes-core/gettext/gettext-sources.inc b/meta/recipes-core/gettext/gettext-sources.inc
index 5d90d81b58..2ddf47334d 100644
--- a/meta/recipes-core/gettext/gettext-sources.inc
+++ b/meta/recipes-core/gettext/gettext-sources.inc
@@ -1,4 +1,3 @@
 HOMEPAGE = "http://www.gnu.org/software/gettext/gettext.html"
-SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
-           "
-SRC_URI[sha256sum] = "52a578960fe308742367d75cd1dff8552c5797bd0beba7639e12bdcda28c0e49"
+SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz"
+SRC_URI[sha256sum] = "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
diff --git a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
index a8f6684bd7..f14d8df689 100644
--- a/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
+++ b/meta/recipes-core/gettext/gettext/0001-tests-autopoint-3-unset-MAKEFLAGS.patch
@@ -16,10 +16,10 @@ diff --git a/gettext-tools/tests/autopoint-3 b/gettext-tools/tests/autopoint-3
 index af2e17f..46cf3f7 100755
 --- a/gettext-tools/tests/autopoint-3
 +++ b/gettext-tools/tests/autopoint-3
-@@ -137,6 +137,7 @@ ${CONFIG_SHELL} ./configure >/dev/null 2>autopoint.err
- test $? = 0 || { cat autopoint.err; Exit 1; }
- 
- : ${MAKE=make}
+@@ -149,6 +149,7 @@
+     *) MAKE=make ;;
+   esac
+ fi
 +unset MAKEFLAGS
  ${MAKE} >/dev/null 2>autopoint.err
  test $? = 0 || { cat autopoint.err; Exit 1; }
diff --git a/meta/recipes-core/gettext/gettext/serial-tests-config.patch b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
index 3baf549795..88bd33951a 100644
--- a/meta/recipes-core/gettext/gettext/serial-tests-config.patch
+++ b/meta/recipes-core/gettext/gettext/serial-tests-config.patch
@@ -18,23 +18,23 @@ diff --git a/configure.ac b/configure.ac
 index 5106676..3114998 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -22,7 +22,7 @@ AC_INIT([gettext],
- 	[bug-gettext@gnu.org])
- AC_CONFIG_SRCDIR([gettext-tools/src/msgfmt.c])
- AC_CONFIG_AUX_DIR([build-aux])
+@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([build-aux])
+ VERSION_NUMBER=`cd $srcdir \
+                 && build-aux/git-version-gen .tarball-version`
+ gl_INIT_PACKAGE_VERSION([$VERSION_NUMBER])
 -AM_INIT_AUTOMAKE([1.13 silent-rules parallel-tests tar-ustar])
 +AM_INIT_AUTOMAKE([1.13 silent-rules serial-tests tar-ustar])
  
- dnl Override automake's tar command used for creating distributions.
- am__tar='${AMTAR} chf - --format=ustar --owner=root --group=root "$$tardir"'
+ dnl Override automake's tar command used for creating distributions:
+ dnl - Sort the files by basename, not by dirname, to achieve higher compression
 diff --git a/gettext-runtime/configure.ac b/gettext-runtime/configure.ac
 index e128f5b..9f7447c 100644
 --- a/gettext-runtime/configure.ac
 +++ b/gettext-runtime/configure.ac
-@@ -22,7 +22,7 @@ AC_INIT([gettext-runtime],
- 	[bug-gettext@gnu.org])
- AC_CONFIG_SRCDIR([intl/dcigettext.c])
- AC_CONFIG_AUX_DIR([../build-aux])
+@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([../build-aux])
+ VERSION_NUMBER=`cd $srcdir/.. \
+                 && build-aux/git-version-gen .tarball-version`
+ gl_INIT_PACKAGE_VERSION([$VERSION_NUMBER])
 -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
 +AM_INIT_AUTOMAKE([1.11.1 silent-rules serial-tests])
  AC_CONFIG_HEADERS([config.h])
@@ -44,10 +44,10 @@ diff --git a/gettext-tools/configure.ac b/gettext-tools/configure.ac
 index 3b1f461..14510a9 100644
 --- a/gettext-tools/configure.ac
 +++ b/gettext-tools/configure.ac
-@@ -22,7 +22,7 @@ AC_INIT([gettext-tools],
- 	[bug-gettext@gnu.org])
- AC_CONFIG_SRCDIR([src/msgfmt.c])
- AC_CONFIG_AUX_DIR([../build-aux])
+@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR([../build-aux])
+ VERSION_NUMBER=`cd $srcdir/.. \
+                 && build-aux/git-version-gen .tarball-version`
+ gl_INIT_PACKAGE_VERSION([$VERSION_NUMBER])
 -AM_INIT_AUTOMAKE([1.11.1 silent-rules parallel-tests])
 +AM_INIT_AUTOMAKE([1.11.1 silent-rules serial-tests])
  AC_CONFIG_HEADERS([config.h])
diff --git a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
index 9774c4cce0..2b9fef1e94 100644
--- a/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
+++ b/meta/recipes-core/gettext/gettext/use-pkgconfig.patch
@@ -12,6 +12,11 @@ Simply delete all the crazy, and replace with a single call to pkg-config.
 
 Upstream-Status: Inappropriate [upstream still refuse to consider pkg-config]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Added also selinux discovery.
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
 ---
  gettext-tools/gnulib-m4/libxml.m4       | 105 ++---------------------
  libtextstyle/gnulib-local/m4/libglib.m4 | 106 +++---------------------
@@ -389,3 +394,37 @@ index baa2cf4..b287c5b 100644
    AC_SUBST([LIBGLIB])
    AC_SUBST([LTLIBGLIB])
    AC_SUBST([INCGLIB])
+
+diff --git a/gettext-tools/gnulib-m4/selinux-selinux-h.m4 b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
+index e2613fa..2a733a7 100644
+--- a/gettext-tools/gnulib-m4/selinux-selinux-h.m4
++++ b/gettext-tools/gnulib-m4/selinux-selinux-h.m4
+@@ -71,6 +71,7 @@ AC_DEFUN([gl_LIBSELINUX],
+ [
+   AC_REQUIRE([AC_CANONICAL_HOST])
+   AC_REQUIRE([AC_CANONICAL_BUILD])
++  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+ 
+   AC_ARG_WITH([selinux],
+     AS_HELP_STRING([[--without-selinux]], [do not use SELinux, even on systems with SELinux]),
+@@ -79,19 +80,8 @@ AC_DEFUN([gl_LIBSELINUX],
+   LIB_SELINUX=
+   if test "$with_selinux" != no; then
+     gl_saved_LIBS=$LIBS
+-    AC_SEARCH_LIBS([setfilecon], [selinux],
+-                   [test "$ac_cv_search_setfilecon" = "none required" ||
+-                    LIB_SELINUX=$ac_cv_search_setfilecon])
++    PKG_CHECK_MODULES([SELINUX], [libselinux], [LIB_SELINUX=$SELINUX_LIBS])
+     LIBS=$gl_saved_LIBS
+   fi
+   AC_SUBST([LIB_SELINUX])
+-
+-  # Warn if SELinux is found but libselinux is absent;
+-  if test "$ac_cv_search_setfilecon" = no; then
+-    if test "$host" = "$build" && test -d /selinux; then
+-      AC_MSG_WARN([This system supports SELinux but libselinux is missing.])
+-      AC_MSG_WARN([AC_PACKAGE_NAME will be compiled without SELinux support.])
+-    fi
+-    with_selinux=no
+-  fi
+ ])
diff --git a/meta/recipes-core/gettext/gettext_0.23.1.bb b/meta/recipes-core/gettext/gettext_0.26.bb
similarity index 94%
rename from meta/recipes-core/gettext/gettext_0.23.1.bb
rename to meta/recipes-core/gettext/gettext_0.26.bb
index 509438c2a7..b99b301af4 100644
--- a/meta/recipes-core/gettext/gettext_0.23.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.26.bb
@@ -37,7 +37,6 @@ EXTRA_OECONF += "--without-lispdir \
                  --disable-java \
                  --disable-native-java \
                  --disable-openmp \
-                 --disable-acl \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
@@ -56,7 +55,7 @@ EXTRA_OECONF:append:libc-musl = "\
                  --enable-threads=posix \
                  gt_cv_func_printf_posix=yes \
 "
-PACKAGECONFIG ??= "glib libxml"
+PACKAGECONFIG ??= "glib libxml ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
 PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
 
@@ -66,6 +65,7 @@ PACKAGECONFIG[libxml] = "--without-included-libxml,--with-included-libxml,libxml
 # or problems if $libdir isn't $prefix/lib.
 PACKAGECONFIG[libunistring] = "--with-libunistring-prefix=${STAGING_LIBDIR}/..,--with-included-libunistring,libunistring"
 PACKAGECONFIG[msgcat-curses] = "--with-libncurses-prefix=${STAGING_LIBDIR}/..,--disable-curses,ncurses,"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux --disable-acl,attr libselinux"
 
 do_install:append:libc-musl () {
 	rm -f ${D}${libdir}/charset.alias
@@ -94,7 +94,8 @@ FILES:${PN} += "${libdir}/${BPN}/"
 # The its/Makefile.am has defined:
 # itsdir = $(pkgdatadir)$(PACKAGE_SUFFIX)/its
 # not itsdir = $(pkgdatadir), so use wildcard to match the version.
-FILES:${PN} += "${datadir}/${BPN}-*/*"
+FILES:${PN} += "${datadir}/${BPN}-*/* \
+                ${datadir}/${BPN}/m4/*"
 
 FILES:gettext-runtime = "${bindir}/gettext \
                          ${bindir}/ngettext \
@@ -175,7 +176,9 @@ do_install_ptest() {
         find ${D}${PTEST_PATH}/ -name "*.o" -exec rm {} \;
         chmod 0755 ${D}${PTEST_PATH}/tests/lang-vala ${D}${PTEST_PATH}/tests/plural-1 ${D}${PTEST_PATH}/tests/xgettext-tcl-4 \
                    ${D}${PTEST_PATH}/tests/xgettext-vala-1  ${D}${PTEST_PATH}/tests/xgettext-po-2 ${D}${PTEST_PATH}/tests/xgettext-vala-6 \
-                   ${D}${PTEST_PATH}/tests/plural-3 ${D}${PTEST_PATH}/tests/plural-4 ${D}${PTEST_PATH}/tests/xgettext-java-8 ${D}${PTEST_PATH}/tests/xgettext-java-9
+                   ${D}${PTEST_PATH}/tests/plural-3 ${D}${PTEST_PATH}/tests/plural-4 ${D}${PTEST_PATH}/tests/xgettext-java-8 ${D}${PTEST_PATH}/tests/xgettext-java-9 \
+                   ${D}${PTEST_PATH}/tests/msgfmt-21 ${D}${PTEST_PATH}/tests/format-modula2-1 ${D}${PTEST_PATH}/tests/format-modula2-2 \
+                   ${D}${PTEST_PATH}/tests/lang-go ${D}${PTEST_PATH}/tests/lang-ruby ${D}${PTEST_PATH}/tests/lang-modula2 ${D}${PTEST_PATH}/tests/lang-d
         sed -i -e 's|${DEBUG_PREFIX_MAP}||g' ${D}${PTEST_PATH}/tests/init-env
 }
 

