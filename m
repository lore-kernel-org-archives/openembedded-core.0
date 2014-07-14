Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 35F537044B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 14:31:38 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ho1so2656575wib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 07:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VuJe7txCuiTbUips/vvpIJSnb81eNTnMq+CpvRiFJQY=;
	b=ITR40y1JmkSIeHGma9rs7dG+0H2u44gFA9BGw3Y1cmkT3/g02eNYIItG6VtWgHvY1o
	jlmFV1hk+VhmjVnuNU3aiMFzLll2UJiJ1ciQWi3DG/LiQSKFPFBWBz6aEH8HVSYI/aI4
	3EIQGJgkjl3fPDQdFO0zHVstzmXFXHeMz5MXNKpiesMC2iV+qrIz0vOSx1VaO1qqHQdi
	ZH2Pn9ct0VtF6oD89biDgVw33IrBsixIJyLrELDd74J+1xvNZ+j/cJA+891QgnyDrWCW
	44vIoTiZwplqb36p38huyrq6S+7FjK2tHfBu1pLj3ivHyPi3rrwOzYUhQFRQAP6tCZ+J
	wf8A==
X-Gm-Message-State: ALoCoQnM09Oscbydq6IcSwWAD6iN+o1RipllsAm8H5tUQaf2vdQuRxzIfsgD5bSGjN+Ce8ttIPC2
X-Received: by 10.180.74.11 with SMTP id p11mr8662025wiv.68.1405348293744;
	Mon, 14 Jul 2014 07:31:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	de5sm31767681wib.18.2014.07.14.07.31.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 07:31:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2014 15:31:26 +0100
Message-Id: <1405348287-30244-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] xf86-video-intel: upgrade to 2.99.912
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
X-List-Received-Date: Mon, 14 Jul 2014 14:31:41 -0000

Drop a backported patch that has been applied.

Apply a patch from upstream to add enable/disable options for each DRI level, as
.912 won't build if the X server doesn't support DRI3.  Add PACKAGECONFIG
options for each DRI level and enable DRI1 and DRI2.

Add a PACKAGECONFIG option for the client tools, disabled by default as they're
only useful on machines with hybrid discrete/integrated GPUs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xf86-video-intel/configure-dri.patch           |  166 ++++++++++++++++++++
 ...el_2.99.910.bb => xf86-video-intel_2.99.912.bb} |   19 ++-
 2 files changed, 178 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/configure-dri.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.99.910.bb => xf86-video-intel_2.99.912.bb} (59%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/configure-dri.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/configure-dri.patch
new file mode 100644
index 0000000..7fa9443
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/configure-dri.patch
@@ -0,0 +1,166 @@
+Add the ability to enable/disable specific versions of the DRI support.
+
+This is the following two commits from master squashed:
+  7bc669dd4b7e3e5978e95e4131d1f9215afbc041
+  5a0cb1049c2fa0586708719210a2d2cffa7a4491
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index b3b6e8e..bd654f3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -296,6 +296,21 @@ AC_ARG_ENABLE(dri,
+ 			     [Disable DRI support [[default=auto]]]),
+ 	      [DRI=$enableval],
+ 	      [DRI=auto])
++AC_ARG_ENABLE(dri1,
++	      AS_HELP_STRING([--disable-dri1],
++			     [Disable DRI1 support [[default=yes]]]),
++	      [DRI1=$enableval],
++	      [DRI1=yes])
++AC_ARG_ENABLE(dri2,
++	      AS_HELP_STRING([--disable-dri2],
++			     [Disable DRI2 support [[default=yes]]]),
++	      [DRI2=$enableval],
++	      [DRI2=yes])
++AC_ARG_ENABLE(dri3,
++	      AS_HELP_STRING([--disable-dri3],
++			     [Disable DRI3 support [[default=yes]]]),
++	      [DRI3=$enableval],
++	      [DRI3=yes])
+ 
+ AC_ARG_ENABLE(xvmc, AS_HELP_STRING([--disable-xvmc],
+                                   [Disable XvMC support [[default=yes]]]),
+@@ -461,15 +476,15 @@ if test "x$UMS" = "xyes"; then
+ 	AC_DEFINE(UMS,1,[Assume UMS support])
+ fi
+ 
+-DRI1=no
++have_dri1=no
+ XORG_DRIVER_CHECK_EXT(XF86DRI, xf86driproto)
+-if test "x$_EXT_CHECK" != "xno" -a "x$DRI" != "xno" -a "x$UMS" = "xyes"; then
+-	PKG_CHECK_MODULES(DRI1, [xf86driproto], [DRI1=$DRI], [DRI1=no])
++if test "x$_EXT_CHECK" != "xno" -a "x$DRI" != "xno" -a "x$DRI1" != "xno" -a "x$UMS" = "xyes"; then
++	PKG_CHECK_MODULES(DRI1, [xf86driproto], [have_dri1=$DRI], [have_dri1=no])
+         save_CFLAGS="$CFLAGS"
+         save_CPPFLAGS="$CPPFLAGS"
+         CFLAGS="$CFLAGS $XORG_CFLAGS $DRI1_CFLAGS $DRM_CFLAGS"
+         CPPFLAGS="$CPPFLAGS $XORG_CFLAGS $DRI1_CFLAGS $DRM_CFLAGS"
+-        AC_CHECK_HEADERS([dri.h sarea.h dristruct.h], [], [DRI1=no],
++        AC_CHECK_HEADERS([dri.h sarea.h dristruct.h], [], [have_dri1=no],
+                 [/* for dri.h */
+                  #include <xf86str.h>
+                  /* for dristruct.h */
+@@ -486,49 +501,55 @@ if test "x$_EXT_CHECK" != "xno" -a "x$DRI" != "xno" -a "x$UMS" = "xyes"; then
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI1 support])
+-AC_MSG_RESULT([$DRI1])
++AC_MSG_RESULT([$have_dri1])
+ 
+-AM_CONDITIONAL(DRI1, test "x$DRI1" != "xno")
+-if test "x$DRI1" != "xno"; then
++AM_CONDITIONAL(DRI1, test "x$have_dri1" != "xno")
++if test "x$have_dri1" != "xno"; then
+         AC_DEFINE(HAVE_DRI1,1,[Enable DRI1 driver support])
+ 	dri_msg="$dri_msg DRI1"
+ else
+         DRI1_CFLAGS=""
+         DRI1_LIBS=""
+ 
+-        if test "x$DRI" = "xyes" -a "x$UMS" = "xyes"; then
++        if test "x$DRI" = "xyes" -a "x$UMS" = "xyes" -a "x$DRI1" != "xno"; then
+                 AC_MSG_ERROR([DRI1 requested but prerequisites not found])
+         fi
+ fi
+ 
+-DRI2=no
+-DRI3=no
++have_dri2=no
++have_dri3=no
+ if test "x$DRI" != "xno"; then
+-	PKG_CHECK_MODULES(DRI2, [dri2proto >= 2.6], [DRI2=$DRI], [DRI2=no])
+-	dridriverdir=`$PKG_CONFIG --variable=dridriverdir dri`
+-	if test "x$dridriverdir" = "x"; then
+-		dridriverdir="$libdir/dri"
+-	fi
+-	AC_DEFINE_DIR(DRI_DRIVER_PATH, dridriverdir, [Default DRI2 driver path])
+ 	if test "x$DRI2" != "xno"; then
++		PKG_CHECK_MODULES(DRI2, [dri2proto >= 2.6], [have_dri2=$DRI], [have_dri2=no])
++	fi
++	if test "x$have_dri2" != "xno"; then
+ 		save_CFLAGS=$CFLAGS
+ 		CFLAGS="$XORG_CFLAGS $DRM_CFLAGS $DRI1_CFLAGS $DRI2_CFLAGS"
+-		AC_CHECK_HEADERS([dri2.h], [], [DRI2=no], [
++		AC_CHECK_HEADERS([dri2.h], [], [have_dri2=no], [
+ #include <dixstruct.h>
+ #include <drm.h>
+ ])
+ 		CFLAGS=$save_CFLAGS
+ 	fi
+-
+-	XORG_DRIVER_CHECK_EXT(DRI3, dri3proto)
+-	if test "x$_EXT_CHECK" != "xno"; then
+-		PKG_CHECK_MODULES(DRI3, [dri3proto], [DRI3=$DRI], [])
++	if test "x$have_dri2" != "xno"; then
++		dridriverdir=`$PKG_CONFIG --variable=dridriverdir dri`
++		if test "x$dridriverdir" = "x"; then
++			dridriverdir="$libdir/dri"
++		fi
++		AC_DEFINE_DIR(DRI_DRIVER_PATH, dridriverdir, [Default have_dri2 driver path])
+ 	fi
++
+ 	if test "x$DRI3" != "xno"; then
++		XORG_DRIVER_CHECK_EXT(DRI3, dri3proto)
++		if test "x$_EXT_CHECK" != "xno"; then
++			PKG_CHECK_MODULES(DRI3, [dri3proto], [have_dri3=$DRI], [])
++		fi
++	fi
++	if test "x$have_dri3" != "xno"; then
+ 		save_CFLAGS=$CFLAGS
+ 		CFLAGS="$XORG_CFLAGS $DRI3_CFLAGS"
+-		AC_CHECK_DECL(DRI3, [], [DRI3=no], [#include <xorg-server.h>])
+-		AC_CHECK_HEADERS([misyncstr.h misyncshm.h], [], [DRI3=no], [
++		AC_CHECK_DECL(DRI3, [], [have_dri3=no], [#include <xorg-server.h>])
++		AC_CHECK_HEADERS([misyncstr.h misyncshm.h], [], [have_dri3=no], [
+ #include <xorg-server.h>
+ #include <xf86str.h>
+ #include <misync.h>
+@@ -538,13 +559,13 @@ if test "x$DRI" != "xno"; then
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI2 support])
+-AM_CONDITIONAL(DRI2, test "x$DRI2" != "xno")
+-AC_MSG_RESULT([$DRI2])
+-if test "x$DRI2" != "xno"; then
++AM_CONDITIONAL(DRI2, test "x$have_dri2" != "xno")
++AC_MSG_RESULT([$have_dri2])
++if test "x$have_dri2" != "xno"; then
+         AC_DEFINE(HAVE_DRI2,1,[Enable DRI2 driver support])
+ 	dri_msg="$dri_msg DRI2"
+ else
+-	if test "x$DRI" = "xyes" -a "x$KMS" = "xyes"; then
++	if test "x$DRI" = "xyes" -a "x$DRI2" != "xno" -a "x$KMS" = "xyes"; then
+ 		AC_MSG_ERROR([DRI2 requested but prerequisites not found])
+ 	fi
+ 
+@@ -553,13 +574,13 @@ else
+ fi
+ 
+ AC_MSG_CHECKING([whether to include DRI3 support])
+-AM_CONDITIONAL(DRI3, test "x$DRI3" != "xno")
+-AC_MSG_RESULT([$DRI3])
+-if test "x$DRI3" != "xno"; then
++AM_CONDITIONAL(DRI3, test "x$have_dri3" != "xno")
++AC_MSG_RESULT([$have_dri3])
++if test "x$have_dri3" != "xno"; then
+         AC_DEFINE(HAVE_DRI3,1,[Enable DRI3 driver support])
+ 	dri_msg="$dri_msg DRI3"
+ else
+-	if test "x$DRI" = "xyes" -a "x$KMS" = "xyes"; then
++	if test "x$DRI" = "xyes" -a "x$DRI3" != "xno" -a "x$KMS" = "xyes"; then
+ 		AC_MSG_ERROR([DRI3 requested but prerequisites not found])
+ 	fi
+ fi
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
similarity index 59%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
index 60eace4..0777690 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.910.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
@@ -9,23 +9,28 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-DEPENDS += "virtual/libx11 drm libpciaccess pixman"
+SRC_URI += "file://configure-dri.patch"
+
+SRC_URI[md5sum] = "88d1a884f9b7bd07bf0755cfa34052d4"
+SRC_URI[sha256sum] = "7c8ffc492d59f34cac64093deb70717b4d9223cf416ecc6fa016ab2e8bde9501"
 
-SRC_URI += "file://compat-api-Map-changes-of-DamageUnregister-API-in-1..patch \
-           "
+DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
-PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri', '', d)}"
+PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri1 dri2', '', d)}"
 
-PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,xf86driproto dri2proto"
+PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
+PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1,xf86driproto"
+PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
+PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
 PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,libxinerama libxrandr libxdamage libxfixes libxcursor libxtst libxext libxrender"
 
 # --enable-kms-only option is required by ROOTLESS_X
 EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-SRC_URI[md5sum] = "a9a5c2c15766c06a024381efe0d724bb"
-SRC_URI[sha256sum] = "203d46064449da0e23a111418dfb189422ba96ea08707167c8dee463e2d745b1"
+FILES_${PN} += "${datadir}/polkit-1"
-- 
1.7.10.4


