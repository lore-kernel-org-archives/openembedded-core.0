Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqL-0002aW-1U
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:01 +0200
Received: by mail-pz0-f50.google.com with SMTP id h32so4082870dak.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FGYdDXV/ktyqj8D8u6WR7yrlbLjn5ASRW56ByHAaNIM=;
	b=frpfv/04OS/GNoTweakowLAH/3/c9m5S7DGijEnQJXiC7pbLLEZQsnL7uAFkrAgmmj
	7/EMCXmjT0T0WSh3UfF/Fy4k3Pr+Ndz185KE8Ut2R8qGuq2tUT738i7u/9Yl0cSLwFwl
	BsOemhDxnGrZOGqw863/ObB6BtPuwCfcWP4wXyT4jumiOTY3XVM6O3x90Hcd7TDdVfyy
	yI/wFJv1R5MDzxwgEoRxwbMpIoEhAsmOuNXDxVmygzfAbg/p3q6ATRNPVvvrhFEpZ7Yi
	8jro8D5gtdBdDf3i8THNE4TxAmC0sYcXaH4EOrP/lQq7J4EguKEU6XLI2Gz+47KQzveb
	qq1A==
Received: by 10.68.75.45 with SMTP id z13mr21104799pbv.100.1335808040816;
	Mon, 30 Apr 2012 10:47:20 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:18 -0700
Message-Id: <552d57a3072a2dcb0eb0ff05924bb7e16551e281.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 03/10] glib-2.0: Dont disable iconv for uclibc
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
X-List-Received-Date: Mon, 30 Apr 2012 17:57:01 -0000

Currently we stub out iconv in glib when building
for uclibc which is not needed and infact results
in building systems with false hope of having
iconv and they misbehave during runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  106 --------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb      |    5 +-
 2 files changed, 1 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch b/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
deleted file mode 100644
index 9c06fe6..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-We provide dummy implementation of iconv functionality if it does not find
-iconv which will be case with uclibc. We remove the check for iconv in configure
-
-This is needed when libintl and libiconv is not available. It wont have any
-impact on case when they are available.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-
-Index: glib-2.26.1/glib/gconvert.c
-===================================================================
---- glib-2.26.1.orig/glib/gconvert.c
-+++ glib-2.26.1/glib/gconvert.c
-@@ -23,7 +23,7 @@
- #include "config.h"
- #include "glibconfig.h"
- 
--#ifndef G_OS_WIN32
-+#if !defined G_OS_WIN32 && defined HAVE_ICONV_H
- #include <iconv.h>
- #endif
- #include <errno.h>
-@@ -65,6 +65,28 @@
- #error GNU libiconv not in use but included iconv.h is from libiconv
- #endif
- 
-+#ifndef HAVE_ICONV_H
-+typedef void *iconv_t;
-+
-+iconv_t iconv_open(const char *tocode, const char *fromcode)
-+{
-+	return (iconv_t)(-1);
-+}
-+
-+int iconv_close(iconv_t cd)
-+{
-+	free(cd);
-+
-+	return 0;
-+}
-+size_t iconv (iconv_t __cd, char **__inbuf,
-+                     size_t *__inbytesleft,
-+                     char **__outbuf,
-+                     size_t *__outbytesleft)
-+{
-+	return 0;
-+}
-+#endif
- 
- /**
-  * SECTION:conversions
-Index: glib-2.26.1/configure.ac
-===================================================================
---- glib-2.26.1.orig/configure.ac
-+++ glib-2.26.1/configure.ac
-@@ -373,46 +373,8 @@ dnl *** Tests for iconv ***
- dnl ***********************
- dnl
- dnl We do this before the gettext checks, to avoid distortion
--
--dnl On Windows we use a native implementation
--
--if test x"$glib_native_win32" = xyes; then
--  with_libiconv=native
--else
--  AC_ARG_WITH(libiconv,
--	      [AC_HELP_STRING([--with-libiconv=@<:@no/gnu/native@:>@],
--			      [use the libiconv library])],,
--	      [with_libiconv=maybe])
--
--  found_iconv=no
--  case $with_libiconv in
--    maybe)
--      # Check in the C library first
--      AC_CHECK_FUNC(iconv_open, [with_libiconv=no; found_iconv=yes])
--      # Check if we have GNU libiconv
--      if test $found_iconv = "no"; then
--	AC_CHECK_LIB(iconv, libiconv_open, [with_libiconv=gnu; found_iconv=yes])
--      fi
--      # Check if we have a iconv in -liconv, possibly from vendor
--      if test $found_iconv = "no"; then
--	AC_CHECK_LIB(iconv, iconv_open, [with_libiconv=native; found_iconv=yes])
--      fi
--      ;;
--    no)
--      AC_CHECK_FUNC(iconv_open, [with_libiconv=no; found_iconv=yes])
--      ;;
--    gnu|yes)
--      AC_CHECK_LIB(iconv, libiconv_open, [with_libiconv=gnu; found_iconv=yes])
--      ;;
--    native)
--      AC_CHECK_LIB(iconv, iconv_open, [with_libiconv=native; found_iconv=yes])
--      ;;
--  esac
--
--  if test "x$found_iconv" = "xno" ; then
--     AC_MSG_ERROR([*** No iconv() implementation found in C library or libiconv])
--  fi
--fi
-+found_iconv=yes
-+with_libiconv=no
- 
- gl_GLIBC21
- AC_ARG_ENABLE(iconv-cache, 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
index f1f9217..405402e 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -19,9 +19,6 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 SRC_URI[md5sum] = "0f9fa329c6c1012d0fd861ad3d8a4520"
 SRC_URI[sha256sum] = "e6cbb27c71c445993346e785e8609cc75cea2941e32312e544872feba572dd27"
 
-# Only apply this patch for target recipe on uclibc
-SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BPN}']}"
-
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.5.4



