Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB9C6E242
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 12:13:42 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so4825449wes.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 04:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=CQ1Z8gg5OSXdaklBglHa6ZbvWY58AO5nGyq2jfLorH0=;
	b=RZbW8pANhUdzd+s/xl0Xgs2XtY0JDQ5Yasv34fQ7Z2xG3fwIRAATM0vrv45z552X6s
	64XLXUUdptgJkcRO4Pu9CzqzMw51FjWOBrn0bY71wPUmVT64SmArl3bzbXgSgoZCZjLc
	IGIQKMWSlMV+RskLXI6dpHsrS/I9H01KKckcZchOLK7gPFsQFIcW6/zHHqBnRvIV/LCH
	O/RKV0JUAonwHthDHSubIsCGgZdQfdiyTROkDuyfz/QPEIr9UDkBHVnqAyclQeoLthQ5
	keqKDnkP6aIj9BOh+iF9lVB5uPYh6Qm6AS++Hn9fhVeQP0gugqGR4MAqIN+cFsCjljNy
	52bw==
X-Gm-Message-State: ALoCoQnFUFHKli3jVgcCgC5JXmRiyXIw5VNFIewyPheQBFpdXn4seR5A+3P+fYIZMgMuHNmKbz7a
X-Received: by 10.180.108.132 with SMTP id hk4mr19310242wib.12.1386677621574; 
	Tue, 10 Dec 2013 04:13:41 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d2sm4549038wik.11.2013.12.10.04.13.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 04:13:40 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Dec 2013 12:13:36 +0000
Message-Id: <1386677617-20952-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] libmatchbox: fix libpng detection
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
X-List-Received-Date: Tue, 10 Dec 2013 12:13:43 -0000

The configure script looks for libpng12 though pkg-config and if that fails
falls back to looking for library files directly.  The result of this is that
the linkage can change between libpng12 or libpng16 depending on what is
installed in the sysroot.

To resolve this, take a patch from upstream to just link using pkg-config.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libmatchbox/libmatchbox/libpng.patch           |   69 ++++++++++++++++++++
 .../libmatchbox/libmatchbox_1.11.bb                |    4 +-
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch b/meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch
new file mode 100644
index 0000000..8cd507f
--- /dev/null
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox/libpng.patch
@@ -0,0 +1,69 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 19c3d242034748b3c60765683e1ff4e2df970205 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 10 Dec 2013 11:37:32 +0000
+Subject: [PATCH] configure: improve libpng detection
+
+Instead of looking for "libpng12" explicitly though pkg-config and then falling
+back to library hunting, just use pkg-config to find "libpng" which is provided
+by both libpng12 and libpng16.
+
+This also makes the libpng detection deterministic.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure.ac | 29 +++++------------------------
+ 1 file changed, 5 insertions(+), 24 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8a28076..65d7c79 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,7 +34,7 @@ AC_ARG_ENABLE(jpeg,
+   enable_jpeg=$enableval, enable_jpeg=no)
+ 
+ AC_ARG_ENABLE(png,
+-  [  --disable-png           disable png support [default=no]],
++  [  --disable-png           disable PNG support [default=enabled]],
+      enable_png=$enableval, enable_png=yes )
+ 
+ AC_ARG_ENABLE(doxygen-docs,     
+@@ -156,29 +156,10 @@ fi
+ dnl ------ Check for PNG ---------------------------------------------------
+ 
+ if test x$enable_png != xno; then
+-  AC_MSG_CHECKING(for libpng12)
+-  if test x$PKG_CONFIG != xno && $PKG_CONFIG --exists libpng12; then 
+-        AC_MSG_RESULT(yes)
+-        PNG_LIBS=`$PKG_CONFIG --libs libpng12`
+-	PNG_CFLAGS=`$PKG_CONFIG --cflags libpng12`
+-        AC_DEFINE(USE_PNG, [1], [Use Png])
+-	SUPPORTS_PNG=1
+-	PNG_REQUIRED="libpng12"
+-  else
+-	AC_MSG_RESULT(no)
+-        # AC_CHECK_HEADERS(png.h, [ have_png_h="yes" ], [ have_png_h="no" ] )
+-        AC_CHECK_LIB([png], [png_create_read_struct], [have_png="yes"], [have_png="no"])
+-
+-        if test x$have_png=xyes && test x$have_png_h=xyes; then 
+-            AC_DEFINE(USE_PNG, [1], [Use Png])
+-	    SUPPORTS_PNG=1
+-            PNG_LIBS="-lpng -lz"
+-            MB_EXTRA_LIBS="$MB_EXTRA_LIBS $PNG_LIBS"
+-        else
+-	    AC_MSG_WARN([*** Cannot find PNG, disabling support])
+-            enable_png=no
+-	fi
+-  fi
++  PKG_CHECK_MODULES(PNG, libpng)
++  AC_DEFINE(USE_PNG, [1], [Use PNG])
++  SUPPORTS_PNG=1
++  PNG_REQUIRED="libpng"
+ fi
+ 
+ 
+-- 
+1.8.5
+
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
index d162a78..118c808 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.11.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext expat libxft jpeg libpng zlib libxsettings-client startup-notification"
 
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/${BPN}/${PV}/${BPN}-${PV}.tar.bz2 \
+           file://libpng.patch"
+
 SRC_URI[md5sum] = "fc6cc807f55a3e7c752d8013176875d7"
 SRC_URI[sha256sum] = "254cab52e304a3512c8df4be59d690cf3921bbb68a28ede7fe26b93534217b53"
 
-- 
1.7.10.4


