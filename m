Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TC6aT-0001Bi-FH
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 12:23:57 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 13 Sep 2012 03:11:14 -0700
Received: by wgbdr1 with SMTP id dr1so1889650wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 03:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Pfd7OFLlm2XEbNJb0y+UaMtkklaQK3tFHHWDHPaq2+M=;
	b=NgmKH9rrqsbD+49AvibWf/nfxaFHbRdGMCyjwq73j06wkLkfJU3sOn7Eb5DT+GA/3z
	9/tp57+GpSAQtloV+2sTVm2on4mGwd/C5xAmmGBtDE9CTbApQ4dExA7sst7bAXhLvDJ/
	zEpaWFM0OfWq+d0GXz6segc1XJPjRtoen9YiormBOO7/1+Xq85CrdulI7xtLv0JYK3Ne
	gonSJBDctjJearv7hj80f6ow/IRqr9x9sS2nbwdpJ0uCZb/OjM9gQNDZRExrcDNfapaH
	rIGsIJ0KA7ta5LnwVuODDSZw+m6DCS3PgEMwZBWnk4ABWlOwyl55Hk/4jfIf2k0UaMT9
	fQiA==
Received: by 10.180.104.197 with SMTP id gg5mr3785492wib.9.1347531080972;
	Thu, 13 Sep 2012 03:11:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j6sm19384694wiy.4.2012.09.13.03.11.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 03:11:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 11:10:32 +0100
Message-Id: <1347531032-3493-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnDlBcXWfxpZcxIvJeBYr3VGeyq0mzdk62uEpdPo91x8O/U493mompHklXY4b+CpoB9fbD3
Subject: [PATCH] libx11: update patch to a backport from upstream git
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
X-List-Received-Date: Thu, 13 Sep 2012 10:23:57 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libx11/keysymdef_include.patch        |   35 +++++++++-----------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
index ba65319..8c50bb7 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
@@ -1,7 +1,7 @@
-From 547937d82084f2cce7e3f0849b5112a20c467146 Mon Sep 17 00:00:00 2001
+From d45b3fc19fbe95c41afc4e51d768df6d42332010 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 11 Sep 2012 17:39:12 +0100
-Subject: [PATCH] Allow overriding location of keysymdef.h
+Date: Wed, 12 Sep 2012 13:39:40 +0000
+Subject: Allow overriding location of keysymdef.h
 
 Currently keysymdef.h is found by using the includedir of xproto.  This doesn't
 work when cross-compiling with a sysroot as that ends up being /usr/include/X11,
@@ -12,36 +12,31 @@ and verify that the specified or found path exists.
 
 (original patch by Martin Jansa <martin.jansa@gmail.com>, revised by myself)
 
-Upstream-Status: Submitted [xorg-devel]
+Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+Reviewed-by: Dan Nicholson <dbn.lists@gmail.com>
+Reviewed-by: Daniel Stone <daniel@fooishbar.org>
 ---
- configure.ac |   13 ++++++++++++-
- 1 file changed, 12 insertions(+), 1 deletion(-)
-
 diff --git a/configure.ac b/configure.ac
-index 48a0c8a..200db15 100644
+index 48a0c8a..a45f9d9 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -306,7 +306,18 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
+@@ -306,7 +306,15 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
  # Find keysymdef.h
  #
  AC_MSG_CHECKING([keysym definitions])
 -KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)]),
-+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
-+
-+if test x$KEYSYMDEFDIR = x; then
-+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+fi
++AC_ARG_WITH([keysymdefdir],
++        [AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)])],
++        [KEYSYMDEFDIR=$withval],
++        [KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11])
 +
-+if test ! -d $KEYSYMDEFDIR; then
++if test ! -d "$KEYSYMDEFDIR"; then
 +	AC_MSG_ERROR([$KEYSYMDEFDIR doesn't exist or isn't a directory])
 +fi
 +
  FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
  for i in $FILES; do
      if test -f "$KEYSYMDEFDIR/$i"; then
--- 
-1.7.10.4
-
+--
+cgit v0.9.0.2-2-gbebe
-- 
1.7.10



