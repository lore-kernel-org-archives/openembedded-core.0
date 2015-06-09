Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4445F75695
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59Epx7S012262
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:51:59 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:51:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:50 -0700
Message-ID: <d4e284abb75ca672805dc59c016fcd1b3dd98d27.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/12] gpgme: 1.4.3 -> 1.5.4
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* Update pkgconfig.patch
* Remove gpgme-fix-CVE-2014-3564.patch since it is a backport patch
* The license checksum of src/gpgme.h.in is changed because it added the
  year 2014, the conten are the same.
* Remove --without-gpgsm --with-g13 --with-gpgconf --with-gpg from
  EXTRA_OECONF, it doesn't have these options any more, and the values will
  checked located at runtime.
---
 .../gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch      |   56 ----------
 .../gpgme/{gpgme-1.4.3 => gpgme}/gpgme.pc          |    0
 .../gpgme/{gpgme-1.4.3 => gpgme}/pkgconfig.patch   |  117 ++++++++++----------
 .../gpgme/{gpgme_1.4.3.bb => gpgme_1.5.4.bb}       |   10 +-
 4 files changed, 63 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch
 rename meta/recipes-support/gpgme/{gpgme-1.4.3 => gpgme}/gpgme.pc (100%)
 rename meta/recipes-support/gpgme/{gpgme-1.4.3 => gpgme}/pkgconfig.patch (84%)
 rename meta/recipes-support/gpgme/{gpgme_1.4.3.bb => gpgme_1.5.4.bb} (74%)

diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch b/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch
deleted file mode 100644
index c728f58..0000000
--- a/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme-fix-CVE-2014-3564.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix CVE-2014-3564.
-
-http://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=2cbd76f7911fc215845e89b50d6af5ff4a83dd77
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 2cbd76f7911fc215845e89b50d6af5ff4a83dd77 Mon Sep 17 00:00:00 2001
-From: Werner Koch <wk@gnupg.org>
-Date: Wed, 30 Jul 2014 11:04:55 +0200
-Subject: [PATCH 1/1] Fix possible realloc overflow for gpgsm and uiserver
- engines.
-
-After a realloc (realloc is also used for initial alloc) the allocated
-size if the buffer is not correctly recorded.  Thus an overflow can be
-introduced by receiving data with different line lengths in a specific
-order.  This is not easy exploitable because libassuan constructs the
-line.  However a crash has been reported and thus it might be possible
-to constructs an exploit.
-
-CVE-id: CVE-2014-3564
-Reported-by: TomÃ¡Å¡ Trnka
----
- src/engine-gpgsm.c    | 2 +-
- src/engine-uiserver.c | 2 +-
- 3 files changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/src/engine-gpgsm.c b/src/engine-gpgsm.c
-index 8ec1598..3a83757 100644
---- a/src/engine-gpgsm.c
-+++ b/src/engine-gpgsm.c
-@@ -836,7 +836,7 @@ status_handler (void *opaque, int fd)
- 	      else
- 		{
- 		  *aline = newline;
--		  gpgsm->colon.attic.linesize += linelen + 1;
-+		  gpgsm->colon.attic.linesize = *alinelen + linelen + 1;
- 		}
- 	    }
- 	  if (!err)
-diff --git a/src/engine-uiserver.c b/src/engine-uiserver.c
-index 2738c36..a7184b7 100644
---- a/src/engine-uiserver.c
-+++ b/src/engine-uiserver.c
-@@ -698,7 +698,7 @@ status_handler (void *opaque, int fd)
- 	      else
- 		{
- 		  *aline = newline;
--		  uiserver->colon.attic.linesize += linelen + 1;
-+		  uiserver->colon.attic.linesize = *alinelen + linelen + 1;
- 		}
- 	    }
- 	  if (!err)
--- 
-2.1.4
diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc b/meta/recipes-support/gpgme/gpgme/gpgme.pc
similarity index 100%
rename from meta/recipes-support/gpgme/gpgme-1.4.3/gpgme.pc
rename to meta/recipes-support/gpgme/gpgme/gpgme.pc
diff --git a/meta/recipes-support/gpgme/gpgme-1.4.3/pkgconfig.patch b/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
similarity index 84%
rename from meta/recipes-support/gpgme/gpgme-1.4.3/pkgconfig.patch
rename to meta/recipes-support/gpgme/gpgme/pkgconfig.patch
index b29cd70..f79e865 100644
--- a/meta/recipes-support/gpgme/gpgme-1.4.3/pkgconfig.patch
+++ b/meta/recipes-support/gpgme/gpgme/pkgconfig.patch
@@ -4,11 +4,11 @@ simpler and less error prone when cross compiling.
 Upstream-Status: Rejected [Upstream not interested in pkg-config support]
 RP 2015/4/17
 
-Index: gpgme-1.4.3/configure.ac
-===================================================================
---- gpgme-1.4.3.orig/configure.ac
-+++ gpgme-1.4.3/configure.ac
-@@ -1058,6 +1058,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
+diff --git a/configure.ac b/configure.ac
+index 298a22b..c778b61 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -622,6 +622,7 @@ AC_CONFIG_FILES(Makefile src/Makefile
                  src/versioninfo.rc
                  src/gpgme.h)
  AC_CONFIG_FILES(src/gpgme-config, chmod +x src/gpgme-config)
@@ -16,13 +16,13 @@ Index: gpgme-1.4.3/configure.ac
  AC_CONFIG_FILES([lang/Makefile lang/cl/Makefile lang/cl/gpgme.asd])
  AC_OUTPUT
  
-Index: gpgme-1.4.3/src/Makefile.am
-===================================================================
---- gpgme-1.4.3.orig/src/Makefile.am
-+++ gpgme-1.4.3/src/Makefile.am
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 58922f9..40d0dca 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
 @@ -20,11 +20,13 @@
  
- # Note: moc_kdpipeiodevice should actually be a dependcy below.
+ # Note: moc_kdpipeiodevice should actually be a dependecy below.
  EXTRA_DIST = gpgme-config.in gpgme.m4 libgpgme.vers ChangeLog-2011 \
 -	     gpgme.h.in versioninfo.rc.in gpgme.def moc_kdpipeiodevice.cpp
 +	     gpgme.h.in versioninfo.rc.in gpgme.def moc_kdpipeiodevice.cpp gpgme.pc.in gpgme-pthread.pc.in
@@ -34,32 +34,12 @@ Index: gpgme-1.4.3/src/Makefile.am
 +pkgconfig_DATA = gpgme.pc gpgme-pthread.pc
  nodist_include_HEADERS = gpgme.h
  
- if HAVE_PTHREAD
-Index: gpgme-1.4.3/src/gpgme.pc.in
-===================================================================
+ bin_PROGRAMS = gpgme-tool
+diff --git a/src/gpgme-pthread.pc.in b/src/gpgme-pthread.pc.in
+new file mode 100644
+index 0000000..980a48e
 --- /dev/null
-+++ gpgme-1.4.3/src/gpgme.pc.in
-@@ -0,0 +1,15 @@
-+prefix=@prefix@
-+exec_prefix=@exec_prefix@
-+libdir=@libdir@
-+includedir=@includedir@
-+
-+# API info
-+api_version=@GPGME_CONFIG_API_VERSION@
-+host=@GPGME_CONFIG_HOST@
-+
-+Name: gpgme
-+Description: GnuPG Made Easy (GPGME) is a C language library that allows to addsupport for cryptography to a program.
-+Version: @VERSION@
-+Libs: -L${libdir} -lgpgme
-+Cflags: -I${includedir}
-+Requires: libassuan gpg-error
-\ No newline at end of file
-Index: gpgme-1.4.3/src/gpgme-pthread.pc.in
-===================================================================
---- /dev/null
-+++ gpgme-1.4.3/src/gpgme-pthread.pc.in
++++ b/src/gpgme-pthread.pc.in
 @@ -0,0 +1,15 @@
 +prefix=@prefix@
 +exec_prefix=@exec_prefix@
@@ -76,12 +56,12 @@ Index: gpgme-1.4.3/src/gpgme-pthread.pc.in
 +Libs: -L${libdir} -lgpgme-pthread -lpthread
 +Cflags: -I${includedir}
 +Requires: libassuan gpg-error
-Index: gpgme-1.4.3/src/gpgme.m4
-===================================================================
---- gpgme-1.4.3.orig/src/gpgme.m4
-+++ gpgme-1.4.3/src/gpgme.m4
-@@ -36,7 +36,7 @@ dnl               [ACTION-IF-FOUND [, AC
- dnl Test for libgpgme and define GPGME_CFLAGS and GPGME_LIBS.
+diff --git a/src/gpgme.m4 b/src/gpgme.m4
+index 6c2be44..d8a75cb 100644
+--- a/src/gpgme.m4
++++ b/src/gpgme.m4
+@@ -79,7 +79,7 @@ dnl config script does not match the host specification the script
+ dnl is added to the gpg_config_script_warn variable.
  dnl
  AC_DEFUN([AM_PATH_GPGME],
 -[ AC_REQUIRE([_AM_PATH_GPGME_CONFIG])dnl
@@ -89,11 +69,10 @@ Index: gpgme-1.4.3/src/gpgme.m4
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -45,37 +45,12 @@ AC_DEFUN([AM_PATH_GPGME],
-      req_gpgme_api=0
+@@ -89,36 +89,12 @@ AC_DEFUN([AM_PATH_GPGME],
       min_gpgme_version="$tmp"
    fi
--
+ 
 -  AC_MSG_CHECKING(for GPGME - version >= $min_gpgme_version)
 -  ok=no
 -  if test "$GPGME_CONFIG" != "no" ; then
@@ -105,7 +84,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
 -    if test "$gpgme_version_major" -gt "$req_major"; then
 -        ok=yes
--    else 
+-    else
 -        if test "$gpgme_version_major" -eq "$req_major"; then
 -            if test "$gpgme_version_minor" -gt "$req_minor"; then
 -               ok=yes
@@ -119,7 +98,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -        fi
 -    fi
 -  fi
-+  PKG_CHECK_MODULES(GPGME, [gpgme >= $min_gpgme_version], [ok=yes], [ok=no])  
++  PKG_CHECK_MODULES(GPGME, [gpgme >= $min_gpgme_version], [ok=yes], [ok=no])
    if test $ok = yes; then
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
@@ -129,7 +108,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -84,18 +59,10 @@ AC_DEFUN([AM_PATH_GPGME],
+@@ -127,19 +103,11 @@ AC_DEFUN([AM_PATH_GPGME],
       fi
    fi
    if test $ok = yes; then
@@ -137,6 +116,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -    GPGME_LIBS=`$GPGME_CONFIG --libs`
 -    AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
+     _AM_PATH_GPGME_CONFIG_HOST_CHECK
    else
 -    GPGME_CFLAGS=""
 -    GPGME_LIBS=""
@@ -148,7 +128,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
  ])
  
  dnl AM_PATH_GPGME_PTHREAD([MINIMUM-VERSION,
-@@ -104,7 +71,7 @@ dnl Test for libgpgme and define GPGME_P
+@@ -148,7 +116,7 @@ dnl Test for libgpgme and define GPGME_PTHREAD_CFLAGS
  dnl  and GPGME_PTHREAD_LIBS.
  dnl
  AC_DEFUN([AM_PATH_GPGME_PTHREAD],
@@ -157,7 +137,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
    tmp=ifelse([$1], ,1:0.4.2,$1)
    if echo "$tmp" | grep ':' >/dev/null 2>/dev/null ; then
       req_gpgme_api=`echo "$tmp"     | sed 's/\(.*\):\(.*\)/\1/'`
-@@ -114,38 +81,13 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+@@ -158,38 +126,12 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
       min_gpgme_version="$tmp"
    fi
  
@@ -173,7 +153,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
 -      if test "$gpgme_version_major" -gt "$req_major"; then
 -        ok=yes
--      else 
+-      else
 -        if test "$gpgme_version_major" -eq "$req_major"; then
 -          if test "$gpgme_version_minor" -gt "$req_minor"; then
 -            ok=yes
@@ -188,8 +168,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -      fi
 -    fi
 -  fi
-+  PKG_CHECK_MODULES(GPGME_PTHREAD, [gpgme-pthread >= $min_gpgme_version], [ok=yes], [ok=no])  
-+
++  PKG_CHECK_MODULES(GPGME_PTHREAD, [gpgme-pthread >= $min_gpgme_version], [ok=yes], [ok=no])
    if test $ok = yes; then
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
@@ -199,7 +178,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -154,18 +96,10 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
+@@ -198,19 +140,11 @@ AC_DEFUN([AM_PATH_GPGME_PTHREAD],
       fi
    fi
    if test $ok = yes; then
@@ -207,6 +186,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -    GPGME_PTHREAD_LIBS=`$GPGME_CONFIG --thread=pthread --libs`
 -    AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
+     _AM_PATH_GPGME_CONFIG_HOST_CHECK
    else
 -    GPGME_PTHREAD_CFLAGS=""
 -    GPGME_PTHREAD_LIBS=""
@@ -218,7 +198,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
  ])
  
  
-@@ -184,36 +118,13 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -229,36 +163,12 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       min_gpgme_version="$tmp"
    fi
  
@@ -233,7 +213,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -               sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\.\([[0-9]]*\)/\3/'`
 -    if test "$gpgme_version_major" -gt "$req_major"; then
 -        ok=yes
--    else 
+-    else
 -        if test "$gpgme_version_major" -eq "$req_major"; then
 -            if test "$gpgme_version_minor" -gt "$req_minor"; then
 -               ok=yes
@@ -248,7 +228,6 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -    fi
 -  fi
 +  PKG_CHECK_MODULES(GPGME_GLIB, [gpgme >= $min_gpgme_version glib-2.0], [ok=yes], [ok=no])  
-+
    if test $ok = yes; then
       # If we have a recent GPGME, we should also check that the
       # API is compatible.
@@ -258,7 +237,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
          if test "$tmp" -gt 0 ; then
             if test "$req_gpgme_api" -ne "$tmp" ; then
               ok=no
-@@ -222,17 +133,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
+@@ -267,17 +177,9 @@ AC_DEFUN([AM_PATH_GPGME_GLIB],
       fi
    fi
    if test $ok = yes; then
@@ -266,6 +245,7 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -    GPGME_GLIB_LIBS=`$GPGME_CONFIG --glib --libs`
 -    AC_MSG_RESULT(yes)
      ifelse([$2], , :, [$2])
+     _AM_PATH_GPGME_CONFIG_HOST_CHECK
    else
 -    GPGME_GLIB_CFLAGS=""
 -    GPGME_GLIB_LIBS=""
@@ -275,4 +255,25 @@ Index: gpgme-1.4.3/src/gpgme.m4
 -  AC_SUBST(GPGME_GLIB_CFLAGS)
 -  AC_SUBST(GPGME_GLIB_LIBS)
  ])
- 
+diff --git a/src/gpgme.pc.in b/src/gpgme.pc.in
+new file mode 100644
+index 0000000..b69539f
+--- /dev/null
++++ b/src/gpgme.pc.in
+@@ -0,0 +1,15 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++# API info
++api_version=@GPGME_CONFIG_API_VERSION@
++host=@GPGME_CONFIG_HOST@
++
++Name: gpgme
++Description: GnuPG Made Easy (GPGME) is a C language library that allows to addsupport for cryptography to a program.
++Version: @VERSION@
++Libs: -L${libdir} -lgpgme
++Cflags: -I${includedir}
++Requires: libassuan gpg-error
+\ No newline at end of file
diff --git a/meta/recipes-support/gpgme/gpgme_1.4.3.bb b/meta/recipes-support/gpgme/gpgme_1.5.4.bb
similarity index 74%
rename from meta/recipes-support/gpgme/gpgme_1.4.3.bb
rename to meta/recipes-support/gpgme/gpgme_1.5.4.bb
index f804578..1598377 100644
--- a/meta/recipes-support/gpgme/gpgme_1.4.3.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.5.4.bb
@@ -6,22 +6,20 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LESSER;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://src/gpgme.h.in;endline=23;md5=dccb4bb624011e36513c61ef0422d054 \
+                    file://src/gpgme.h.in;endline=23;md5=71ba2ae8d6ca034ed10bd099a8cf473c \
                     file://src/engine.h;endline=22;md5=4b6d8ba313d9b564cc4d4cfb1640af9d"
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/${BP}.tar.bz2 \
            file://gpgme.pc \
            file://pkgconfig.patch \
-           file://gpgme-fix-CVE-2014-3564.patch \
           "
 
-SRC_URI[md5sum] = "334e524cffa8af4e2f43ae8afe585672"
-SRC_URI[sha256sum] = "2d1cc12411753752d9c5b9037e6fd3fd363517af720154768cc7b46b60120496"
+SRC_URI[md5sum] = "feafa03ea064e1d1dc11bc2b88404623"
+SRC_URI[sha256sum] = "bb38c0ec8815c9e94e6047b484984808a8dad9d6bec8df33dc5339fd55ffea6c"
 
 DEPENDS = "libgpg-error libassuan"
 
 BINCONFIG = "${bindir}/gpgme-config"
-EXTRA_OECONF = "--with-gpg=${bindir}/gpg --without-gpgsm --with-gpgconf=no --with-g13=no"
 
 inherit autotools texinfo binconfig-disabled pkgconfig
 
-- 
1.7.9.5


