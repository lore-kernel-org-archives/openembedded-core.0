Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TbKJO-000283-J9
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 01:06:34 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Nov 2012 15:52:27 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so301916wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 15:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=G6x6GcKfKCz1wae+88UhVjKPmn8F1Ka2hLOi8ZoKo0o=;
	b=hKtTDA90DLFs4LaAp0fsWYqmIJVbvUy4r8ZRt4j106KCQDMaJ2VWkgGlHGUGcLWbUj
	dMLiosG6nYDRbDeSFdOeU11IyrRoYeA7XwysGwZ02L3H5f4+jKbiKHs1PxXQBOfQqJmI
	KqiuXdAKU19Ghwj8EnQsBGsFktMFXyZqRSTPdt+jgF6vZSUxMZ+Pgyf3vAqeHBd6tF48
	qdCynoZZpuNNKbonz3/FqO5tiR0nsgN91avkacF8010y7RW+c8bYbCqqJgLWJlMGbp09
	aCQYDmkzMQI7K0oEBh0K9YuGqFUrb4hcZi+e1t9T5De7tu6KKzI/yvwDQ2MyjdrdzXDY
	6jxA==
Received: by 10.180.78.161 with SMTP id c1mr1708235wix.4.1353541944932;
	Wed, 21 Nov 2012 15:52:24 -0800 (PST)
Received: by 10.180.78.161 with SMTP id c1mr1708223wix.4.1353541944714;
	Wed, 21 Nov 2012 15:52:24 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t17sm937327wiv.6.2012.11.21.15.52.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 15:52:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2012 23:50:59 +0000
Message-Id: <1353541859-14089-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQl2130eY3Cxp3F9NsPYvoACIRma/kVIokqVljxJsMRlKmThQGyfL7ezHr8+XKTYQp57pYv+qYWITfmtDxNHD5X5hRkIQo3x4KNxp63FlyhS0UZWFZaSPMo3ayxhS0+e2TE374p59CLTXcsrsJdF1BLj/heL+cprBk3KYT6zZEYdJRgW/oA9vX7FzM4WOZhBOOeL+wk9
Subject: [PATCH] xf86-video-omap: don't use AC_CHECK_FILE
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
X-List-Received-Date: Thu, 22 Nov 2012 00:06:35 -0000

Upstream uses AC_CHECK_FILE to find dri.h, but that errors out when
cross-compiling.  Until oe-core 1b0d9cb1801a8eb68c82dfcda5a1da420ac8dd83 this
wasn't a problem because we patched AC_CHECK_FILE to always pass, which was a
nasty hack.

Patch configure.ac to use pkg-config like it should, and not AC_CHECK_FILE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-driver/xf86-video-omap/configure.patch    |   74 ++++++++++++++++++++
 .../xorg-driver/xf86-video-omap_git.bb             |    3 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
new file mode 100644
index 0000000..d298d5d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap/configure.patch
@@ -0,0 +1,74 @@
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=57386]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From fc7b6045aaec583c7e29021bd23c20a877b20546 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 21 Nov 2012 23:39:18 +0000
+Subject: [PATCH] build: rationalise DRI checks
+
+The existing logic around DRI was complicated and defined a number of variables
+that were not used, when in reality DRI is required.
+
+Move the glproto check to the main pkg-config check, and remove everything else.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure.ac |   33 +--------------------------------
+ 1 file changed, 1 insertion(+), 32 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 11238b1..c321b98 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -44,47 +44,16 @@ XORG_DRIVER_CHECK_EXT(XV, videoproto)
+ XORG_DRIVER_CHECK_EXT(DPMSExtension, xextproto)
+ 
+ # Checks for pkg-config packages
+-PKG_CHECK_MODULES(XORG, [xorg-server >= 1.3] xproto fontsproto [libdrm >= 2.4.36] libdrm_omap xf86driproto $REQUIRED_MODULES)
+-sdkdir=$(pkg-config --variable=sdkdir xorg-server)
++PKG_CHECK_MODULES(XORG, [xorg-server >= 1.3] xproto fontsproto [libdrm >= 2.4.36] libdrm_omap xf86driproto glproto $REQUIRED_MODULES)
+ 
+ # Checks for header files.
+ AC_HEADER_STDC
+ 
+-save_CFLAGS="$CFLAGS"
+-CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
+-CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
+-AC_MSG_CHECKING([whether to include DRI support])
+-if test x$DRI != xno; then
+-        AC_CHECK_FILE([${sdkdir}/dri.h],
+-                      [have_dri_h="yes"], [have_dri_h="no"])
+-        AC_CHECK_FILE([${sdkdir}/dristruct.h],
+-                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
+-fi
+-AC_MSG_CHECKING([whether to include DRI support])
+-if test x$DRI = xauto; then
+-        if test "$have_dri_h" = yes -a \
+-                "$have_dristruct_h" = yes; then
+-                DRI="yes"
+-        else
+-                DRI="no"
+-        fi
+-fi
+-AC_MSG_RESULT([$DRI])
+-CFLAGS="$save_CFLAGS $DEBUGFLAGS"
+-
+-AM_CONDITIONAL(DRI, test x$DRI = xyes)
+-if test "$DRI" = yes; then
+-        PKG_CHECK_MODULES(DRI, [xf86driproto glproto])
+-        AC_DEFINE(XF86DRI,1,[Enable DRI driver support])
+-        AC_DEFINE(XF86DRI_DEVEL,1,[Enable developmental DRI driver support])
+-fi
+-
+ AM_CONDITIONAL(VIDEO_DEBUG, test x$VIDEO_DEBUG = xyes)
+ if test "$VIDEO_DEBUG" = yes; then
+ 	AC_DEFINE(VIDEO_DEBUG,1,[Enable debug support])
+ fi
+ 
+-AC_SUBST([DRI_CFLAGS])
+ 
+ DRIVER_NAME=omap
+ AC_SUBST([DRIVER_NAME])
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index b3177eb..2371f96 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -14,10 +14,11 @@ RCONFLICTS = "xf86-video-omapfb"
 RREPLACES = "xf86-video-omapfb"
 
 SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 PV = "0.4.2+gitr${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git \
+           file://configure.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.7.10



