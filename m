Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 144A86DDD6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 16:58:32 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t61so3702861wes.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 08:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1G31RtDlteyvn45xAnZ6G89J7GG634wRDbvZVIUbSmM=;
	b=GJt2af9qQhWvayBTFYxv+IsW2syeuA4UiphcdFX/9SB16kp4sKZh0nWypDioTY9cPF
	QGMyGM6oi9vbPP4MDbiQJWNtdrkApflTie/KqGkz2fIkkt+n1y6rqtCGF3NwwVBDh3Hd
	V84TEsbhGL+qC9x/2ZzRX+6iC9wU3ybLGytbWi1e44z5DOAe4TlLoBVCmB0wmVJqn6l7
	eCx2K5kbDQDgG5k16ZwD3NTROeX0sdbYDJlF1UFOsXnIpB7Dt7QcTtgNq4VenE59ZzDx
	Crjp6y7MXIgi7G3291BZw7CSR/oDVG2RkhQyorpi351mJQ9mBcM9pmygrZBrM7wjmGm0
	uRQw==
X-Gm-Message-State: ALoCoQmszmnmSu5CEFX8Q5nSyMFC9U/Yq9kKu8hVp+ue/bcNTW8uz+km/OPVJedQYNHmKYuDk538
X-Received: by 10.180.78.165 with SMTP id c5mr15310967wix.3.1386608311737;
	Mon, 09 Dec 2013 08:58:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id xl18sm7076611wib.9.2013.12.09.08.58.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Dec 2013 08:58:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 16:58:27 +0000
Message-Id: <1386608307-4348-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libxcb: fix rebuild when MACHINE changes
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
X-List-Received-Date: Mon, 09 Dec 2013 16:58:33 -0000

This recipe was patching the sysroot path directly into configure.ac, which
fails when the same source tree is re-used for another machine.

Instead, patch in $PKG_CONFIG_SYSROOT_DIR which is already exported for use by
pkg-config.

Also remove some commented-out lines that have no purpose.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libxcb.inc          |   16 ++------------
 .../xorg-lib/libxcb/xcbincludedir.patch            |   23 ++++++++++++++++----
 2 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
index 91df1be..7f9b0af 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -12,10 +12,9 @@ LICENSE = "MIT-X"
 
 PARALLEL_MAKE = ""
 DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native libpthread-stubs"
-# DEPENDS += "xsltproc-native gperf-native"
 
-SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2"
-#           file://xcbincludedir.patch"
+SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2 \
+           file://xcbincludedir.patch"
 
 PACKAGES =+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
              libxcb-randr libxcb-record libxcb-render libxcb-res \
@@ -25,7 +24,6 @@ PACKAGES =+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
              libxcb-dri2 libxcb-dri3 libxcb-present"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
-#FILES_${PN}-dev = "${libdir}/libxcb.* ${libdir}/pkgconfig/*.pc ${includedir}/xcb/*.h"
 FILES_libxcb-dri2 = "${libdir}/libxcb-dri2.so.*"
 FILES_libxcb-dri3 = "${libdir}/libxcb-dri3.so.*"
 FILES_libxcb-composite = "${libdir}/libxcb-composite.so.*"
@@ -52,13 +50,3 @@ FILES_libxcb-xvmc = "${libdir}/libxcb-xvmc.so.*"
 FILES_libxcb-present = "${libdir}/libxcb-present.so.*"
 
 inherit autotools pkgconfig pythonnative
-
-# XCBPROTO_XCBINCLUDEDIR is set based on `pkg-config --variable=xcbincludedir xcb-proto`
-# but the xcbincludedir variable doesn't point into the staging area, so it needs some
-# tweaking here:
-do_configure_prepend () {
-    sed -i "s|XCBPROTO_XCBINCLUDEDIR=\`|XCBPROTO_XCBINCLUDEDIR=${STAGING_DIR_HOST}/\`|" \
-        ${S}/configure.ac
-    sed -i "s|XCBPROTO_XCBPYTHONDIR=\`|XCBPROTO_XCBPYTHONDIR=${STAGING_DIR_HOST}/\`|" \
-        ${S}/configure.ac
-}
diff --git a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch b/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
index d858a63..46297c3 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
+++ b/meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
@@ -1,8 +1,14 @@
-Upstream-Status: Inappropriate [configuration]
+As pkg-config --variable doesn't respect the sysroot, add the pkg-config sysroot
+to the beginning of variables that are used later on the host.
 
---- libxcb-1.0.orig/configure.ac	2006-11-23 15:33:01.000000000 +0000
-+++ libxcb-1.0/configure.ac	2008-09-10 20:29:12.000000000 +0100
-@@ -50,7 +50,7 @@
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 94da4f7..d29cd6a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,7 +64,7 @@ AC_SUBST(NEEDED)
  
  # Find the xcb-proto protocol descriptions
  AC_MSG_CHECKING(XCBPROTO_XCBINCLUDEDIR)
@@ -11,3 +17,12 @@ Upstream-Status: Inappropriate [configuration]
  AC_MSG_RESULT($XCBPROTO_XCBINCLUDEDIR)
  AC_SUBST(XCBPROTO_XCBINCLUDEDIR)
  
+@@ -74,7 +74,7 @@ AC_SUBST(XCBPROTO_VERSION)
+ 
+ # Find the xcbgen Python package
+ AC_MSG_CHECKING(XCBPROTO_XCBPYTHONDIR)
+-XCBPROTO_XCBPYTHONDIR=`$PKG_CONFIG --variable=pythondir xcb-proto`
++XCBPROTO_XCBPYTHONDIR=$PKG_CONFIG_SYSROOT_DIR/`$PKG_CONFIG --variable=pythondir xcb-proto`
+ AC_MSG_RESULT($XCBPROTO_XCBPYTHONDIR)
+ AC_SUBST(XCBPROTO_XCBPYTHONDIR)
+ 
-- 
1.7.10.4


