Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBWBg-0001or-Bk
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 21:31:56 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 12:19:15 -0700
Received: by mail-wg0-f43.google.com with SMTP id dr1so617841wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 12:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=gvkCVbzS4C0kprpIRvQ98zEESbTRsGyAIZuSroVh4Cw=;
	b=JleFYDGu8MpBGuilwCSYaeHEIlB+nKsEdtW14Yqz3NJKANWZdud94EY3Prggq2o8fZ
	F78eOhlTsor3GLU9Kawu3jFTRAuJ1llLJsZwi2ujksvPnTx21QrQqpF+t2o7qviG6UTK
	9GpM8BwF6kqDHTdThsxopIjRANfXzROJGDgex+L5mrYSsHDANx1BTD6GW7aJCFntsInf
	G10MTjzsYa99VVg1a4EZ2QxPsgzxVDAfTNJe7Hs9ceVzh+XVvy/b8Yh3CbpOWMnE0LTo
	szQ7kzIEwbTYmWsBCJNhwko3CzcJysx6d8U7UdQwhvn4ifHiY/DfMH5tSvqQhzbnNwTo
	GV1A==
Received: by 10.217.1.195 with SMTP id n45mr9603961wes.179.1347391163702;
	Tue, 11 Sep 2012 12:19:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t7sm5953150wix.6.2012.09.11.12.19.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 12:19:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 20:18:08 +0100
Message-Id: <1347391088-30390-18-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
References: <1347391088-30390-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmbzV/3IATzIgQwP5pkhegYWnB6CF4y1Q8N008N8G9GRzBr57rzeMHzrxFKadBd6MtnR72V
Subject: [RFC 18/18] libx11: revise keysymdef patch based on submission upstream
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
X-List-Received-Date: Tue, 11 Sep 2012 19:31:56 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-lib/libx11/keysymdef_include.patch        |   38 ++++++++++++++++----
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |    2 +-
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
index d1bdab9..ba65319 100644
--- a/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
@@ -1,23 +1,47 @@
-Upstream-Status: Inappropriate [configuration]
+From 547937d82084f2cce7e3f0849b5112a20c467146 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 11 Sep 2012 17:39:12 +0100
+Subject: [PATCH] Allow overriding location of keysymdef.h
 
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Currently keysymdef.h is found by using the includedir of xproto.  This doesn't
+work when cross-compiling with a sysroot as that ends up being /usr/include/X11,
+not a path into the cross-build environment.
 
-diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
---- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
-+++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
-@@ -355,7 +355,14 @@
+So, add an option to allow explicitly specifying the location of keysymdef.h,
+and verify that the specified or found path exists.
+
+(original patch by Martin Jansa <martin.jansa@gmail.com>, revised by myself)
+
+Upstream-Status: Submitted [xorg-devel]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure.ac |   13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 48a0c8a..200db15 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -306,7 +306,18 @@ AC_CHECK_FUNC(poll, [AC_DEFINE(USE_POLL, 1, [poll() function is available])], )
  # Find keysymdef.h
  #
  AC_MSG_CHECKING([keysym definitions])
 -KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
 +AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h (defaults to xproto include dir)]),
 +        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
 +
 +if test x$KEYSYMDEFDIR = x; then
 +	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
 +fi
 +
++if test ! -d $KEYSYMDEFDIR; then
++	AC_MSG_ERROR([$KEYSYMDEFDIR doesn't exist or isn't a directory])
++fi
++
  FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
  for i in $FILES; do
      if test -f "$KEYSYMDEFDIR/$i"; then
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
index 793496c..94e2051 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
@@ -1,7 +1,7 @@
 require libx11.inc
 inherit gettext
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.10



