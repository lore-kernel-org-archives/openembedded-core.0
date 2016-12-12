Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CCA2D71A8C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 10:12:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 12 Dec 2016 02:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,334,1477983600"; d="scan'208";a="1071021825"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 12 Dec 2016 02:12:09 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id B2DF96A4082;
	Mon, 12 Dec 2016 02:11:22 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 12:11:48 +0200
Message-Id: <5d73631a88cf6584dabd520a98c924334a37f27d.1481536730.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481536730.git.jussi.kukkonen@intel.com>
References: <cover.1481536730.git.jussi.kukkonen@intel.com>
Subject: [PATCH 11/12] xf86-video-vmware: Upgrade 13.1.0 -> 13.2.1
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
X-List-Received-Date: Mon, 12 Dec 2016 10:12:08 -0000

Bug fixes, ABI 23 support.
Rebase the add-option-for-vmwgfx patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0002-add-option-for-vmwgfx.patch               | 37 ++++++++++++----------
 ...mware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} |  4 +--
 2 files changed, 23 insertions(+), 18 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.1.0.bb => xf86-video-vmware_13.2.1.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
index 6039d08..5bda720 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
@@ -1,17 +1,18 @@
-Upstream-Status:Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
+From da6612659a279bcb02f70622b53a3894fbc11052 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 9 Dec 2016 14:35:45 +0200
+Subject: [PATCH] Add option for vmwgfx
 
-From f103d6f570671c649ccd7b225e6d6c9f14371888 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 25 Jun 2014 16:16:44 +0100
-Subject: [PATCH 2/2] add option for vmwgfx
+Upstream-Status:Submitted
 
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- configure.ac |   49 ++++++++++++++++++++-----------------------------
- 1 file changed, 20 insertions(+), 29 deletions(-)
+ configure.ac | 51 +++++++++++++++++++++------------------------------
+ 1 file changed, 21 insertions(+), 30 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index be40ed7..8e15307 100644
+index 9f259ce..f3fec57 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -64,6 +64,13 @@ AC_ARG_ENABLE(vmwarectrl-client,
@@ -40,7 +41,7 @@ index be40ed7..8e15307 100644
  PKG_CHECK_EXISTS([xorg-server >= 1.12.0],
                   [AC_DEFINE([HAVE_XORG_SERVER_1_12_0], 1,
                   [Has version 1.12.0 or greater of the Xserver])])
-@@ -114,39 +116,28 @@ AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
+@@ -114,34 +116,22 @@ AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
  
  AC_SUBST([moduledir])
  
@@ -62,6 +63,7 @@ index be40ed7..8e15307 100644
 -#
 +AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
 +if test x$VMWGFX = xyes; then
++	AC_MSG_RESULT([yes])
 +	PKG_CHECK_MODULES([LIBDRM], [libdrm])
 +	# Check for prime.
  	PKG_CHECK_EXISTS([libdrm >= 2.4.38],
@@ -75,15 +77,18 @@ index be40ed7..8e15307 100644
 -AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
 -if test x$BUILD_VMWGFX = xyes; then
 -	AC_MSG_RESULT([yes])
+-        AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
 +	# Early versions of mesa 10 forgot to bump the XA major version number
 +	# in the xa_tracker.h header
 +	PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0],
 +			  [PKG_CHECK_EXISTS([xatracker = 2.0.0],
-+	                  [AC_DEFINE([HAVE_XA_2], 1,
-+               		  [Has version 2 of XA])])])
-         AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
-+	AC_MSG_RESULT([yes])
- else
++			  [AC_DEFINE([HAVE_XA_2], 1,
++				     [Has version 2 of XA])])])
++	AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
+ 	libudev_check=yes
+ 	AC_ARG_WITH([libudev],
+ 		[AS_HELP_STRING([--without-libudev],
+@@ -158,7 +148,8 @@ else
  	AC_MSG_RESULT([no])
  fi
  
@@ -94,5 +99,5 @@ index be40ed7..8e15307 100644
  AC_CONFIG_FILES([
                  Makefile
 -- 
-1.7.10.4
+2.1.4
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
index 8c891e6..706d35d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.1.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.2.1.bb
@@ -10,8 +10,8 @@ DEPENDS += "virtual/libx11 xineramaproto videoproto libpciaccess"
 
 SRC_URI += "file://0002-add-option-for-vmwgfx.patch"
 
-SRC_URI[md5sum] = "0cba22fed4cb639d5c4276f7892c543d"
-SRC_URI[sha256sum] = "3c1d244e4b1b77e92126957965cdc9fb82de4c215c0706a3a8aaff6939e4a0cc"
+SRC_URI[md5sum] = "4c3912e4d8947f6c2fc1ee9e2f211d74"
+SRC_URI[sha256sum] = "e2f7f7101fba7f53b268e7a25908babbf155b3984fb5268b3d244eb6c11bf62b"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-- 
2.1.4


