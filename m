Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 50F066BCB3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 15:27:38 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id z12so9159825wgg.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 08:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=f9txcKF1uTL/fVCfSm5Bd61hy7Icx4joQCT+mrEZQWE=;
	b=Nvm4vJhz9ONUM5sFs4Rc2ydp/+kdPlA91WK5fpsw4W+bfOjdOFDGUYk7nRzVOpgBhj
	S9pntAIgEUt4fTAOBBE2Js/1aQNjpLSkHoKC3Oq6RIDpGGhLL7bkXNuMrF8YHikx1S2q
	CjNWWpjsnetTapZmtKqjzZ3uUedk8i6YpO4SafsjBZlHtgW661AdB3sslsnserdg4byP
	P84NKJ6LXibGbHXq8GCrIt3Th7JWETwmQGnhsvhpuqFl3ulfidF+a8minSzKdkP1pFT+
	3YNGeCV3xxP1NXzRqXOOEfnt1/LCQ7CTmcbgjfZoSSyLrD7F8fuqEtxTyzKcn51HgD4s
	rZOw==
X-Gm-Message-State: ALoCoQm+cq3S13TvRx51mJhJV2HnkqHNCF4m1UxDrsR4T6+CEgoJgDGFPYO2pUM+e6e5PIHMhivB
X-Received: by 10.180.36.231 with SMTP id t7mr5997411wij.53.1378999659507;
	Thu, 12 Sep 2013 08:27:39 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e5sm18475863wiy.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 08:27:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2013 16:27:35 +0100
Message-Id: <1378999655-22327-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] xf86-video-vmware: disable VMWGFX
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
X-List-Received-Date: Thu, 12 Sep 2013 15:27:38 -0000

Our Mesa doesn't yet ship the XA Gallium state tracker that the VMWGFX
sub-driver needs, so just disable vmwgfx.

Also remove a spurious xvmc dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xf86-video-vmware/vmwgfx-option.patch          |   72 ++++++++++++++++++++
 .../xorg-driver/xf86-video-vmware_13.0.1.bb        |    7 +-
 2 files changed, 77 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch
new file mode 100644
index 0000000..4b3a309
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Submitted (http://lists.x.org/archives/xorg-devel/2013-September/037762.html)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 5ec0aae666feb88d01256cdebbf94a6b373bf4c4 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 11 Sep 2013 21:40:44 +0100
+Subject: [PATCH] build: add explicit option to enable/disable VMWGFX
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ configure.ac |   31 ++++++++++++++-----------------
+ 1 file changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0631bcc..3e14abd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -85,11 +85,6 @@ PKG_CHECK_EXISTS([xorg-server >= 1.4.99],
+                  [AC_DEFINE([HAVE_XORG_SERVER_1_5_0], 1,
+                  [Has version 1.5.0 or greater of the Xserver])])
+ 
+-PKG_CHECK_EXISTS([xorg-server >= 1.7.0],
+-                 [AC_DEFINE([HAVE_XORG_SERVER_1_7_0], 1,
+-                 [Has version 1.7.0 or greater of the Xserver])
+-		 BUILD_VMWGFX=yes],[BUILD_VMWGFX=no])
+-
+ PKG_CHECK_EXISTS([xorg-server >= 1.12.0],
+                  [AC_DEFINE([HAVE_XORG_SERVER_1_12_0], 1,
+                  [Has version 1.12.0 or greater of the Xserver])])
+@@ -114,25 +109,27 @@ AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
+ 
+ AC_SUBST([moduledir])
+ 
+-if test x$BUILD_VMWGFX = xyes; then
+-	PKG_CHECK_MODULES([LIBDRM], [libdrm],[],[BUILD_VMWGFX=no])
+-fi
+-if test x$BUILD_VMWGFX = xyes; then
+-	PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0],[],[BUILD_VMWGFX=no])
+-fi
+-
+ DRIVER_NAME=vmware
+ AC_SUBST([DRIVER_NAME])
+ 
++AC_ARG_ENABLE(vmwgfx,
++              AS_HELP_STRING([--disable-vmwgfx],
++                             [Disable vmwgfx driver (KMS/3D) (default: enabled)]),
++                             [VMWGFX="$enableval"], [VMWGFX="yes"])
++
+ AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
+-if test x$BUILD_VMWGFX = xyes; then
+-	AC_MSG_RESULT([yes])
++if test "x$VMWGFX" = xyes; then
++        AC_MSG_RESULT([yes])
++        PKG_CHECK_EXISTS([xorg-server >= 1.7.0],
++                         [AC_DEFINE([HAVE_XORG_SERVER_1_7_0], 1,
++                         [Has version 1.7.0 or greater of the Xserver])])
++        PKG_CHECK_MODULES([LIBDRM], [libdrm])
++        PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0])
+         AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
+ else
+-	AC_MSG_RESULT([no])
++        AC_MSG_RESULT([no])
+ fi
+-
+-AM_CONDITIONAL(BUILD_VMWGFX, test "x$BUILD_VMWGFX" = xyes)
++AM_CONDITIONAL(BUILD_VMWGFX, test "x$VMWGFX" = xyes)
+ 
+ AC_CONFIG_FILES([
+                 Makefile
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
index 0d8c8d2..7b48e0c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
@@ -6,10 +6,13 @@ DESCRIPTION = "vmware is an Xorg driver for VMware virtual video cards."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
-DEPENDS += "virtual/libx11 libxvmc xineramaproto libpciaccess \
-            ${@base_contains('DISTRO_FEATURES', 'opengl', 'drm virtual/libgl', '', d)}"
+DEPENDS += "virtual/libx11 xineramaproto videoproto libpciaccess"
+
+SRC_URI += "file://vmwgfx-option.patch"
 
 SRC_URI[md5sum] = "b08e0195ebf3f88a82129322cb93da08"
 SRC_URI[sha256sum] = "802dda415c22412edad6c3df44fe18a06e91d0f8456d9a58bac0d340fdf8fe3d"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
+
+EXTRA_OECONF += "--disable-vmwgfx"
-- 
1.7.10.4


