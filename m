Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id B933D60DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:37 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so53481wev.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=uAMRyzMKy5LWdsw8wPRwhr5FW183n9ordjwizw5y68w=;
	b=L+LgWdlgswmtSe/At3GE6GWsjivAY4ZppQznXNYpwW1psCJuuVV0rOv9JT86DXOfhi
	dx6PpqdfEMB3dBUhT0xq3UWxkkRH8Vik+ih57nbHJ8LmqLvEUS/AoF2Ro0ZOevmQ9HZK
	Bf4WNJ0QZwImuszv7gLKT6I+zBeV9KRhQSV1Cl/FhvnSq54z0Qk+UqAGZI6yE3ExJmlc
	R/Mtmb8kR2Gwkt2XDQd8ERbZHj7ecRKsK18G2+D0IzXMkLInwZW2LY+zKsFXYwxJNV3t
	u1S7KTXg8tC9V9GHZHFmg0/CmW6B9kDguG7oeCUd22Hgt12/DWW4RPsa44HQsyqqdRwR
	hZug==
X-Gm-Message-State: ALoCoQlF9PqhCzAL6xuCiZ1g+QE+tveB6hxY0qiQNzcf8NFU0DIDHeUTmyuhXsOaWMKijMqJInQO
X-Received: by 10.194.89.168 with SMTP id bp8mr37078505wjb.73.1406054318346;
	Tue, 22 Jul 2014 11:38:38 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:18 +0100
Message-Id: <1406054301-9027-8-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 08/11] xf86-video-vmware: update to 13.0.2
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:38 -0000

Rebase the patch to add an option to disable vmwgfx, and add a patch from
upstream git to fix builds without xatracker.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...001-configure-fix-build-without-xatracker.patch |   37 ++++++++
 .../0002-add-option-for-vmwgfx.patch               |   98 ++++++++++++++++++++
 .../xf86-video-vmware/vmwgfx-option.patch          |   72 --------------
 ...mware_13.0.1.bb => xf86-video-vmware_13.0.2.bb} |    7 +-
 4 files changed, 139 insertions(+), 75 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.0.1.bb => xf86-video-vmware_13.0.2.bb} (59%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch
new file mode 100644
index 0000000..cf66403
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0001-configure-fix-build-without-xatracker.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From bdaa9de44a197ba1297b990422ed9e515289f141 Mon Sep 17 00:00:00 2001
+From: Julien Cristau <jcristau@debian.org>
+Date: Tue, 1 Apr 2014 10:11:13 +0200
+Subject: [PATCH 1/2] configure: fix build without xatracker
+
+ACTION-IF-NOT-FOUND is the fourth argument to PKG_CHECK_MODULES, not the
+fifth.
+
+Debian bug#743239 <https://bugs.debian.org/743239>
+
+Reviewed-by: Thomas Klausner <wiz@NetBSD.org>
+Reviewed-by: Jakob Bornecrantz <jakob@vmware.com>
+Signed-off-by: Julien Cristau <jcristau@debian.org>
+Signed-off-by: Jakob Bornecrantz <jakob@vmware.com>
+---
+ configure.ac |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index dd3ad4e..be40ed7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -126,7 +126,7 @@ if test x$BUILD_VMWGFX = xyes; then
+ 			  [PKG_CHECK_EXISTS([xatracker = 2.0.0],
+ 	                  [AC_DEFINE([HAVE_XA_2], 1,
+                		  [Has version 2 of XA])])],
+-			  [],[BUILD_VMWGFX=no])
++			  [BUILD_VMWGFX=no])
+ #
+ # Check for prime.
+ #
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
new file mode 100644
index 0000000..6039d08
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/0002-add-option-for-vmwgfx.patch
@@ -0,0 +1,98 @@
+Upstream-Status:Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From f103d6f570671c649ccd7b225e6d6c9f14371888 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 25 Jun 2014 16:16:44 +0100
+Subject: [PATCH 2/2] add option for vmwgfx
+
+---
+ configure.ac |   49 ++++++++++++++++++++-----------------------------
+ 1 file changed, 20 insertions(+), 29 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index be40ed7..8e15307 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -64,6 +64,13 @@ AC_ARG_ENABLE(vmwarectrl-client,
+                              [VMWARECTRL=$enableval], [VMWARECTRL=no])
+ AM_CONDITIONAL(BUILD_VMWARECTRL, [test "x$VMWARECTRL" = xyes])
+ 
++# Define a configure option to build the vmwgfx driver
++AC_ARG_ENABLE(vmwgfx,
++              AS_HELP_STRING([--disable-vmwgfx],
++                             [Disable vmwgfx driver (KMS/3D) (default: enabled)]),
++                             [VMWGFX="$enableval"], [VMWGFX="yes"])
++AM_CONDITIONAL(BUILD_VMWGFX, test "x$VMWGFX" = xyes)
++
+ # Store the list of server defined optional extensions in REQUIRED_MODULES
+ XORG_DRIVER_CHECK_EXT(RANDR, randrproto)
+ XORG_DRIVER_CHECK_EXT(RENDER, renderproto)
+@@ -85,11 +92,6 @@ PKG_CHECK_EXISTS([xorg-server >= 1.4.99],
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
+@@ -114,39 +116,28 @@ AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
+ 
+ AC_SUBST([moduledir])
+ 
+-if test x$BUILD_VMWGFX = xyes; then
+-	PKG_CHECK_MODULES([LIBDRM], [libdrm],[],[BUILD_VMWGFX=no])
+-fi
+-if test x$BUILD_VMWGFX = xyes; then
+-#
+-# Early versions of mesa 10 forgot to bump the XA major version number in
+-# the xa_tracker.h header
+-#
+-	PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0],
+-			  [PKG_CHECK_EXISTS([xatracker = 2.0.0],
+-	                  [AC_DEFINE([HAVE_XA_2], 1,
+-               		  [Has version 2 of XA])])],
+-			  [BUILD_VMWGFX=no])
+-#
+-# Check for prime.
+-#
++AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
++if test x$VMWGFX = xyes; then
++	PKG_CHECK_MODULES([LIBDRM], [libdrm])
++	# Check for prime.
+ 	PKG_CHECK_EXISTS([libdrm >= 2.4.38],
+ 			 [AC_DEFINE([HAVE_LIBDRM_2_4_38], 1,
+ 			 [Has version 2.4.38 or greater of libdrm])])
+-fi
+ 
+-DRIVER_NAME=vmware
+-AC_SUBST([DRIVER_NAME])
+-
+-AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
+-if test x$BUILD_VMWGFX = xyes; then
+-	AC_MSG_RESULT([yes])
++	# Early versions of mesa 10 forgot to bump the XA major version number
++	# in the xa_tracker.h header
++	PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0],
++			  [PKG_CHECK_EXISTS([xatracker = 2.0.0],
++	                  [AC_DEFINE([HAVE_XA_2], 1,
++               		  [Has version 2 of XA])])])
+         AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
++	AC_MSG_RESULT([yes])
+ else
+ 	AC_MSG_RESULT([no])
+ fi
+ 
+-AM_CONDITIONAL(BUILD_VMWGFX, test "x$BUILD_VMWGFX" = xyes)
++DRIVER_NAME=vmware
++AC_SUBST([DRIVER_NAME])
+ 
+ AC_CONFIG_FILES([
+                 Makefile
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch
deleted file mode 100644
index 4b3a309..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/vmwgfx-option.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Upstream-Status: Submitted (http://lists.x.org/archives/xorg-devel/2013-September/037762.html)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 5ec0aae666feb88d01256cdebbf94a6b373bf4c4 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 11 Sep 2013 21:40:44 +0100
-Subject: [PATCH] build: add explicit option to enable/disable VMWGFX
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- configure.ac |   31 ++++++++++++++-----------------
- 1 file changed, 14 insertions(+), 17 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0631bcc..3e14abd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -85,11 +85,6 @@ PKG_CHECK_EXISTS([xorg-server >= 1.4.99],
-                  [AC_DEFINE([HAVE_XORG_SERVER_1_5_0], 1,
-                  [Has version 1.5.0 or greater of the Xserver])])
- 
--PKG_CHECK_EXISTS([xorg-server >= 1.7.0],
--                 [AC_DEFINE([HAVE_XORG_SERVER_1_7_0], 1,
--                 [Has version 1.7.0 or greater of the Xserver])
--		 BUILD_VMWGFX=yes],[BUILD_VMWGFX=no])
--
- PKG_CHECK_EXISTS([xorg-server >= 1.12.0],
-                  [AC_DEFINE([HAVE_XORG_SERVER_1_12_0], 1,
-                  [Has version 1.12.0 or greater of the Xserver])])
-@@ -114,25 +109,27 @@ AM_CONDITIONAL(XSERVER_LIBPCIACCESS, test "x$XSERVER_LIBPCIACCESS" = xyes)
- 
- AC_SUBST([moduledir])
- 
--if test x$BUILD_VMWGFX = xyes; then
--	PKG_CHECK_MODULES([LIBDRM], [libdrm],[],[BUILD_VMWGFX=no])
--fi
--if test x$BUILD_VMWGFX = xyes; then
--	PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0],[],[BUILD_VMWGFX=no])
--fi
--
- DRIVER_NAME=vmware
- AC_SUBST([DRIVER_NAME])
- 
-+AC_ARG_ENABLE(vmwgfx,
-+              AS_HELP_STRING([--disable-vmwgfx],
-+                             [Disable vmwgfx driver (KMS/3D) (default: enabled)]),
-+                             [VMWGFX="$enableval"], [VMWGFX="yes"])
-+
- AC_MSG_CHECKING([whether to build Kernel Mode Setting and 3D])
--if test x$BUILD_VMWGFX = xyes; then
--	AC_MSG_RESULT([yes])
-+if test "x$VMWGFX" = xyes; then
-+        AC_MSG_RESULT([yes])
-+        PKG_CHECK_EXISTS([xorg-server >= 1.7.0],
-+                         [AC_DEFINE([HAVE_XORG_SERVER_1_7_0], 1,
-+                         [Has version 1.7.0 or greater of the Xserver])])
-+        PKG_CHECK_MODULES([LIBDRM], [libdrm])
-+        PKG_CHECK_MODULES([XATRACKER], [xatracker >= 0.4.0])
-         AC_DEFINE([BUILD_VMWGFX], 1, [Building the vmwgfx driver path])
- else
--	AC_MSG_RESULT([no])
-+        AC_MSG_RESULT([no])
- fi
--
--AM_CONDITIONAL(BUILD_VMWGFX, test "x$BUILD_VMWGFX" = xyes)
-+AM_CONDITIONAL(BUILD_VMWGFX, test "x$VMWGFX" = xyes)
- 
- AC_CONFIG_FILES([
-                 Makefile
--- 
-1.7.10.4
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
similarity index 59%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
index 7b48e0c..24041b5 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.2.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
 DEPENDS += "virtual/libx11 xineramaproto videoproto libpciaccess"
 
-SRC_URI += "file://vmwgfx-option.patch"
+SRC_URI += "file://0001-configure-fix-build-without-xatracker.patch \
+            file://0002-add-option-for-vmwgfx.patch"
 
-SRC_URI[md5sum] = "b08e0195ebf3f88a82129322cb93da08"
-SRC_URI[sha256sum] = "802dda415c22412edad6c3df44fe18a06e91d0f8456d9a58bac0d340fdf8fe3d"
+SRC_URI[md5sum] = "91d1d7d33181766714405ab013d31244"
+SRC_URI[sha256sum] = "c8ba3d2cead3620dba2cbf5defb7f1759b2b96f4fe209f4bf6976832b6763c54"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-- 
1.7.10.4


