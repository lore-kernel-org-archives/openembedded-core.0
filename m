Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id C39776B747
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:40:19 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so4766818eek.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=i5Pjv8uPY25IdypjnT9mtiO04o5tLTFZfCnmqPsIcII=;
	b=YdSC8V/Vc2OxLHCSi5/OoYg2mVi7WWTQjagrSmXCyyQ4s55nMw+khq3icwaadUXKfN
	hC4YP1XmbieR7mlkqVEkJ9eLXx0hoxBWQ4L9VR7d7mlUJIff16pHh5/04mdoy2TkMxos
	Hh2Fvwvj4bM6GbMXV0AisU4GPxkvYvuMzLRFb32qkF3M2QgDKVThF8t+HRTvq5uNxchk
	BEAEH4m6Ge8/rBZmGb9Q48rnRAHMRtwuw7YeVDHsWR0pj1MIjNyse64vD9VxDI3c0sfi
	nmpWzwidI+9OsU6iYkZPxACkmKvext4WplL2dDlxv5xrE84Nj/YSuWgPzk3YA3URi6Gg
	2lXA==
X-Gm-Message-State: ALoCoQnTI0QJTYzn5ILU9A2hHjbV/hhfKoACn98v1XE53fYnq7Dl7RTs0MzruHDG2yQ9Q4peGVDE
X-Received: by 10.14.47.73 with SMTP id s49mr2532567eeb.71.1376480419413;
	Wed, 14 Aug 2013 04:40:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id k3sm74487130een.16.2013.08.14.04.40.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:40:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 12:40:11 +0100
Message-Id: <1376480412-26009-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] libmatchbox: upgrade to 1.11
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
X-List-Received-Date: Wed, 14 Aug 2013 11:40:20 -0000

Remove check.m4 as libmatchbox uses the check.pc instead of a m4 file now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/libmatchbox/files/check.m4   |  133 --------------------
 .../libmatchbox/libmatchbox_1.10.bb                |   28 -----
 .../libmatchbox/libmatchbox_1.11.bb                |   19 +++
 3 files changed, 19 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-graphics/libmatchbox/files/check.m4
 delete mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb
 create mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb

diff --git a/meta/recipes-graphics/libmatchbox/files/check.m4 b/meta/recipes-graphics/libmatchbox/files/check.m4
deleted file mode 100644
index 97bfd9c..0000000
--- a/meta/recipes-graphics/libmatchbox/files/check.m4
+++ /dev/null
@@ -1,133 +0,0 @@
-dnl AM_PATH_CHECK([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
-dnl Test for check, and define CHECK_CFLAGS and CHECK_LIBS
-dnl
-
-AC_DEFUN(AM_PATH_CHECK,
-[
-  AC_ARG_WITH(check,
-  [  --with-check=PATH       prefix where check is installed [default=auto]])
- 
-  min_check_version=ifelse([$1], ,0.8.2,$1)
-
-  AC_MSG_CHECKING(for check - version >= $min_check_version)
-
-  if test x$with_check = xno; then
-    AC_MSG_RESULT(disabled)
-    ifelse([$3], , AC_MSG_ERROR([disabling check is not supported]), [$3])
-  else
-    if test "x$with_check" != x; then
-      CHECK_CFLAGS="-I$with_check/include"
-      CHECK_LIBS="-L$with_check/lib -lcheck"
-    else
-      CHECK_CFLAGS=""
-      CHECK_LIBS="-lcheck"
-    fi
-
-    ac_save_CFLAGS="$CFLAGS"
-    ac_save_LIBS="$LIBS"
-
-    CFLAGS="$CFLAGS $CHECK_CFLAGS"
-    LIBS="$CHECK_LIBS $LIBS"
-
-    rm -f conf.check-test
-    AC_TRY_RUN([
-#include <stdio.h>
-#include <stdlib.h>
-
-#include <check.h>
-
-int main ()
-{
-  int major, minor, micro;
-  char *tmp_version;
-
-  system ("touch conf.check-test");
-
-  /* HP/UX 9 (%@#!) writes to sscanf strings */
-  tmp_version = strdup("$min_check_version");
-  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
-     printf("%s, bad version string\n", "$min_check_version");
-     return 1;
-   }
-    
-  if ((CHECK_MAJOR_VERSION != check_major_version) ||
-      (CHECK_MINOR_VERSION != check_minor_version) ||
-      (CHECK_MICRO_VERSION != check_micro_version))
-    {
-      printf("\n*** The check header file (version %d.%d.%d) does not match\n",
-	     CHECK_MAJOR_VERSION, CHECK_MINOR_VERSION, CHECK_MICRO_VERSION);
-      printf("*** the check library (version %d.%d.%d).\n",
-	     check_major_version, check_minor_version, check_micro_version);
-      return 1;
-    }
-
-  if ((check_major_version > major) ||
-      ((check_major_version == major) && (check_minor_version > minor)) ||
-      ((check_major_version == major) && (check_minor_version == minor) && (check_micro_version >= micro)))
-    {
-      return 0;
-    }
-  else
-    {
-      printf("\n*** An old version of check (%d.%d.%d) was found.\n",
-             check_major_version, check_minor_version, check_micro_version);
-      printf("*** You need a version of check being at least %d.%d.%d.\n", major, minor, micro);
-      printf("***\n"); 
-      printf("*** If you have already installed a sufficiently new version, this error\n");
-      printf("*** probably means that the wrong copy of the check library and header\n");
-      printf("*** file is being found. Rerun configure with the --with-check=PATH option\n");
-      printf("*** to specify the prefix where the correct version was installed.\n");
-    }
-
-  return 1;
-}
-],, no_check=yes, [echo $ac_n "cross compiling; assumed OK... $ac_c"])
-
-    CFLAGS="$ac_save_CFLAGS"
-    LIBS="$ac_save_LIBS"
-
-    if test "x$no_check" = x ; then
-      AC_MSG_RESULT(yes)
-      ifelse([$2], , :, [$2])
-    else
-      AC_MSG_RESULT(no)
-      if test -f conf.check-test ; then
-        :
-      else
-        echo "*** Could not run check test program, checking why..."
-        CFLAGS="$CFLAGS $CHECK_CFLAGS"
-        LIBS="$CHECK_LIBS $LIBS"
-        AC_TRY_LINK([
-#include <stdio.h>
-#include <stdlib.h>
-
-#include <check.h>
-], ,  [ echo "*** The test program compiled, but did not run. This usually means"
-        echo "*** that the run-time linker is not finding check. You'll need to set your"
-        echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
-        echo "*** to the installed location  Also, make sure you have run ldconfig if that"
-        echo "*** is required on your system"
-	echo "***"
-        echo "*** If you have an old version installed, it is best to remove it, although"
-        echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH"],
-      [ echo "*** The test program failed to compile or link. See the file config.log for"
-        echo "*** the exact error that occured." ])
-      
-        CFLAGS="$ac_save_CFLAGS"
-        LIBS="$ac_save_LIBS"
-      fi
-
-      CHECK_CFLAGS=""
-      CHECK_LIBS=""
-
-      rm -f conf.check-test
-      ifelse([$3], , AC_MSG_ERROR([check not found]), [$3])
-    fi
-
-    AC_SUBST(CHECK_CFLAGS)
-    AC_SUBST(CHECK_LIBS)
-
-    rm -f conf.check-test
-
-  fi
-])
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb
deleted file mode 100644
index a1531b8..0000000
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.10.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Matchbox window manager core library"
-SECTION = "x11/libs"
-HOMEPAGE = "http://matchbox-project.org/"
-BUGTRACKER = "http://bugzilla.yoctoproject.com/"
-
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
-                    file://libmb/mbdotdesktop.c;endline=21;md5=5a287156b3207e851c1d68d09c439b51"
-
-DEPENDS = "virtual/libx11 libxext expat libxft jpeg libpng zlib libxsettings-client startup-notification"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-           file://check.m4"
-SRC_URI[md5sum] = "042c5874631dfb95151aa793dc1434b8"
-SRC_URI[sha256sum] = "d14d4844840e3e1e4faa9f9e90060915d39b6033f6979464ab3ea3fe1c4f9293"
-
-PR = "r0"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/libmatchbox-${PV}"
-
-do_configure_prepend () {
-	cp ${WORKDIR}/check.m4 ${S}/
-}
-
-EXTRA_OECONF = "--enable-jpeg --enable-expat --enable-xsettings --enable-startup-notification"
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
new file mode 100644
index 0000000..244a495
--- /dev/null
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Matchbox window manager core library"
+SECTION = "x11/libs"
+HOMEPAGE = "http://matchbox-project.org/"
+BUGTRACKER = "http://bugzilla.yoctoproject.com/"
+
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
+                    file://libmb/mbdotdesktop.c;endline=21;md5=5a287156b3207e851c1d68d09c439b51"
+
+DEPENDS = "virtual/libx11 libxext expat libxft jpeg libpng zlib libxsettings-client startup-notification"
+
+SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "fc6cc807f55a3e7c752d8013176875d7"
+SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534217b53"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-jpeg --enable-expat --enable-xsettings --enable-startup-notification"
-- 
1.7.10.4


