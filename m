Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 720226FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 May 2016 00:21:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,609,1455004800"; d="scan'208";a="974144495"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 12 May 2016 00:20:45 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:20:24 +0300
Message-Id: <93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/13] xserver-xorg: Upgrade 1.18.0 -> 1.18.3
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
X-List-Received-Date: Thu, 12 May 2016 07:21:04 -0000

Remove two patches that are now upstream.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ....ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch | 50 ----------------------
 .../modesetting_libdrm_requirements.patch          | 30 -------------
 ...erver-xorg_1.18.0.bb => xserver-xorg_1.18.3.bb} |  8 ++--
 3 files changed, 3 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.18.0.bb => xserver-xorg_1.18.3.bb} (72%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
deleted file mode 100644
index cd30999..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 0c2153d468229f56e6fef71d2f002e0cae14aa55 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 16 Nov 2015 16:18:40 +0200
-Subject: [PATCH] configure.ac: Use libsystemd in REQUIRED_LIBS check
-
-REQUIRED_LIBS needs to be set to the correct systemd library,
-otherwise the later check will either fail or use the wrong
-pc file.
-
-Upstream-Status: Submitted [xorg-devel@lists.x.org]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac | 13 ++++++++++---
- 1 file changed, 10 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 96c0242..f63eca1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -837,9 +837,16 @@ AC_ARG_WITH([systemd-daemon],
- 		[support systemd socket activation (default: auto)]),
- 	[WITH_SYSTEMD_DAEMON=$withval], [WITH_SYSTEMD_DAEMON=auto])
- PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd-daemon],
--                  [HAVE_SYSTEMD_DAEMON=yes],
-+                  [REQUIRED_SYSTEMD_DAEMON=libsystemd-daemon],
-                   [PKG_CHECK_MODULES([SYSTEMD_DAEMON], [libsystemd],
--                                     [HAVE_SYSTEMD_DAEMON=yes], [HAVE_SYSTEMD_DAEMON=no])])
-+                                     [REQUIRED_SYSTEMD_DAEMON=libsystemd],
-+                                     [REQUIRED_SYSTEMD_DAEMON=])])
-+if test "x$REQUIRED_SYSTEMD_DAEMON" = x; then
-+        HAVE_SYSTEMD_DAEMON=no
-+else
-+        HAVE_SYSTEMD_DAEMON=yes
-+fi
-+
- if test "x$WITH_SYSTEMD_DAEMON" = xauto; then
- 	WITH_SYSTEMD_DAEMON="$HAVE_SYSTEMD_DAEMON"
- fi
-@@ -848,7 +855,7 @@ if test "x$WITH_SYSTEMD_DAEMON" = xyes; then
- 		AC_MSG_ERROR([systemd support requested but no library has been found])
- 	fi
- 	AC_DEFINE(HAVE_SYSTEMD_DAEMON, 1, [Define to 1 if libsystemd-daemon is available])
--	REQUIRED_LIBS="$REQUIRED_LIBS libsystemd-daemon"
-+	REQUIRED_LIBS="$REQUIRED_LIBS $REQUIRED_SYSTEMD_DAEMON"
- fi
- AM_CONDITIONAL([HAVE_SYSTEMD_DAEMON], [test "x$HAVE_SYSTEMD_DAEMON" = "xyes"])
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
deleted file mode 100644
index 5f186cb..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/modesetting_libdrm_requirements.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From bf23db42a4e5943129501223a47b48884cdeb62f Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Wed, 27 Jan 2016 11:50:13 -0500
-Subject: modesetting: Require sufficiently new libdrm
-
-Bugzilla: https://bugs.freedesktop.org/93883
-Signed-off-by: Adam Jackson <ajax@redhat.com>
-Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
-Reviewed-by: Julien Cristau <jcristau@debian.org>
-
-Upstream-Status: Backport
-Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
-
-diff --git a/configure.ac b/configure.ac
-index ac3bb64..312fc69 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2035,8 +2035,7 @@ if test "x$XORG" = xyes; then
- 
- 	if test "x$DRM" = xyes; then
- 		dnl 2.4.46 is required for cursor hotspot support.
--		PKG_CHECK_EXISTS(libdrm >= 2.4.46)
--		XORG_DRIVER_MODESETTING=yes
-+		PKG_CHECK_EXISTS(libdrm >= 2.4.46, XORG_DRIVER_MODESETTING=yes, XORG_DRIVER_MODESETTING=no)
- 	fi
- 
- 	AC_SUBST([XORG_LIBS])
--- 
-cgit v0.10.2
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
similarity index 72%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
index eb79b40..cdd2aa8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.0.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.18.3.bb
@@ -1,11 +1,9 @@
 require xserver-xorg.inc
 
-SRC_URI += "file://configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch \
-            file://musl-arm-inb-outb.patch \
-            file://modesetting_libdrm_requirements.patch \
+SRC_URI += "file://musl-arm-inb-outb.patch \
            "
-SRC_URI[md5sum] = "3c1c1057d3ad27380d8dd87ffcc182cd"
-SRC_URI[sha256sum] = "195670819695d9cedd8dde95fbe069be0d0f488a77797a2d409f9f702daf312e"
+SRC_URI[md5sum] = "043d720bf2472a65bb8f0daa97f83dfa"
+SRC_URI[sha256sum] = "ea739c22517cdbe2b5f7c0a5fd05fe8a10ac0629003e71c0c7862f4bb60142cd"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.1.4


