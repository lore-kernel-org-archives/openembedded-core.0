Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0F07028C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 13:40:54 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id n15so16025199wiw.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jul 2014 06:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5kE/+k9mXyU2BqJqOgLDds6eoJYXMvaH436jVV7lLRw=;
	b=WxF3k+SuO33OLtUmKwsBdxrgUUoTAaooZE3LsvDy3/7BlwaDd2BREoOdZDBArAcLm4
	qDRGM/CGyYKghvbyEr3H+6s8bRu5EpF7upFAGCF8swFfQEUL53W3meiBbzx5F9b6zhN4
	NoIlLIl3MWRP0X2r49AbUAgMq6z6tkk2KDqMVcr9odYn7LIiUBY0kP0tBTlK2oNt7uyt
	XHOIaeZOoJPL2YsphE4D6XgI1xK5Prtb4cRgS8bsIvAfVTBWrN1lMCEHYsaftBPKDwkY
	PXVopqf4uN5mqLOfuc4mjpgVmDpv6ZDW+8zkyGkGAilIGE63H7a0cGG26mC5aD6rHP17
	Ftsg==
X-Gm-Message-State: ALoCoQlwcfNPo3r3/h7J43pb3BO8AXc35i03bbcd4t3jJlad8/GsCCrjyLduLH10XRAegJFMYhAG
X-Received: by 10.180.20.112 with SMTP id m16mr37757077wie.6.1404740455134;
	Mon, 07 Jul 2014 06:40:55 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	jb16sm115349396wic.10.2014.07.07.06.40.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jul 2014 06:40:54 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jul 2014 14:40:49 +0100
Message-Id: <1404740449-28121-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1404740449-28121-1-git-send-email-ross.burton@intel.com>
References: <1404740449-28121-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][xserver 2/2] xserver-xorg: fix xshmfence autodetection
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
X-List-Received-Date: Mon, 07 Jul 2014 13:40:58 -0000

Add a PACKAGECONFIG for xshmfence.  If DRI3 is enabled, xshmfence also needs to
be enabled.

[ YOCTO #6507 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    4 +-
 .../xserver-xorg/xshmfence-option.patch            |   55 ++++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.15.1.bb            |    1 +
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 48ab347..8b5747e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -120,9 +120,11 @@ PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri d
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
-PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto libxshmfence"
+# DRI3 requires xshmfence to also be enabled
+PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
 PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtual/libgl virtual/libx11"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
+PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch
new file mode 100644
index 0000000..55e0913
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/xshmfence-option.patch
@@ -0,0 +1,55 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+commit 1affe20d5c82befc3b1626e557409dab5343c47b
+Author: Ross Burton <ross.burton@intel.com>
+Date:   Mon Jul 7 12:53:35 2014 +0100
+
+    configure.ac: add option for xshmfence
+    
+    xshmfence is usable outside of DRI3, and is currently autodetected which isn't
+    good for distributions where deterministic builds are aspired to.
+    
+    Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index 2daa6be..fd1cf3f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -648,6 +648,7 @@ AC_ARG_ENABLE(kdrive-kbd,     AS_HELP_STRING([--enable-kdrive-kbd], [Build kbd d
+ AC_ARG_ENABLE(kdrive-mouse,   AS_HELP_STRING([--enable-kdrive-mouse], [Build mouse driver for kdrive (default: auto)]), [KDRIVE_MOUSE=$enableval], [KDRIVE_MOUSE=auto])
+ AC_ARG_ENABLE(kdrive-evdev,   AS_HELP_STRING([--enable-kdrive-evdev], [Build evdev driver for kdrive (default: auto)]), [KDRIVE_EVDEV=$enableval], [KDRIVE_EVDEV=auto])
+ AC_ARG_ENABLE(libunwind,      AS_HELP_STRING([--enable-libunwind], [Use libunwind for backtracing (default: auto)]), [LIBUNWIND="$enableval"], [LIBUNWIND="auto"])
++AC_ARG_ENABLE(xshmfence,      AS_HELP_STRING([--disable-xshmfence], [Disable xshmfence (default: auto)]), [WANT_XSHMFENCE="$enableval"], [WANT_XSHMFENCE="auto"])
+ 
+ 
+ dnl chown/chmod to be setuid root as part of build
+@@ -1235,18 +1236,19 @@ esac
+ 
+ AM_CONDITIONAL(BUSFAULT, test x"$BUSFAULT" = xyes)
+ 
+-PKG_CHECK_MODULES([XSHMFENCE], $XSHMFENCE,
+-		  [HAVE_XSHMFENCE=yes], [HAVE_XSHMFENCE=no])
++HAVE_XSHMFENCE=no
++if test "x$WANT_XSHMFENCE" != "xno"; then
++	PKG_CHECK_MODULES([XSHMFENCE], $XSHMFENCE,
++			  [HAVE_XSHMFENCE=yes], [HAVE_XSHMFENCE=no])
+ 
++	if test "$WANT_XSHMFENCE,$HAVE_XSHMFENCE" = "yes,no"; then
++		AC_MSG_ERROR([libxshmfence requested but not found.])
++	fi
++	AC_DEFINE(HAVE_XSHMFENCE, 1, [Have X Shared Memory Fence library])
++	REQUIRED_LIBS="$REQUIRED_LIBS xshmfence"
++fi
+ AM_CONDITIONAL(XSHMFENCE, test "x$HAVE_XSHMFENCE" = xyes)
+ 
+-case x"$HAVE_XSHMFENCE" in
+-	xyes)
+-		AC_DEFINE(HAVE_XSHMFENCE, 1, [Have X Shared Memory Fence library])
+-		REQUIRED_LIBS="$REQUIRED_LIBS xshmfence"
+-		;;
+-esac
+-
+ 
+ case "$DRI3,$HAVE_XSHMFENCE" in
+ 	yes,yes | auto,yes)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
index 6a4168e..22ac604 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
@@ -6,6 +6,7 @@ SRC_URI += "file://crosscompile.patch \
             file://mips64-compiler.patch \
             file://aarch64.patch \
             file://xorg-CVE-2013-6424.patch \
+            file://xshmfence-option.patch \
            "
 
 SRC_URI[md5sum] = "e4c70262ed89764be8f8f5d699ed9227"
-- 
1.7.10.4


