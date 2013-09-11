Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id AB59F62273
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:47:13 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id x55so6889347wes.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 06:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Ug+vnAzOsZfu9I9MoTMcMhyqL/ZlB/hGgTi69xDqzGI=;
	b=DF0bScsjsreWBzf/n+cGyZHFeJOq/mRtUDlJgh+rI6bhefJUGTSW8/wv4CXkJ+vYl1
	BKofYo8WUVUpKQgR/1Co0Mvbx9TuBc7Sm/A8uqSCcBFxzkFZ4TkcZj0UaXQTxl+eP4YS
	/hZRHmDevAYzFfGxq/bW0bKEiA9lVqJQxsfX4bJiipMTPCnYJreEPWXslpGtHdMU4AuG
	7Ck/fls5EGWPRVRboAO1/iBPrHYzxiDRWUnvYI5Lu6+P77A2sgcesXE0KsupMjxKxwiK
	92/OqFNEn2aOAIDXSP5CORgEGWuuqMwawr2K62B5XjUPf8u59jR+0c1CHBVE32WTg2Ff
	p3gw==
X-Gm-Message-State: ALoCoQlWp1FMk4NqRAIblPddvA8jXnQgEy/adqSdvbk2NYDCw7HefXLaHYuZPyicKZo2ubbf2N3A
X-Received: by 10.180.107.167 with SMTP id hd7mr1513596wib.13.1378907235059;
	Wed, 11 Sep 2013 06:47:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id mw9sm4151575wib.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 06:47:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 14:47:11 +0100
Message-Id: <1378907231-15458-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] clutter: fix compilation when building without X11 backend
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
X-List-Received-Date: Wed, 11 Sep 2013 13:47:15 -0000

If Clutter is building the Wayland backend but not the X11 backend, the Cogl
support doesn't get enabled so the Wayland backend (which uses it) fails to
compile.

Backport a fix from upstream to fix this situation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc      |    3 +-
 .../clutter/clutter-1.14/fix-wayland-deps.patch    |   57 ++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.14/fix-wayland-deps.patch

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index edc6081..1356586 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -4,7 +4,8 @@ LICENSE = "LGPLv2.1+"
 
 inherit clutter
 
-SRC_URI += "file://enable_tests.patch"
+SRC_URI += "file://enable_tests.patch \
+            file://fix-wayland-deps.patch"
 
 DEPENDS = "pango glib-2.0 json-glib atk udev cogl-1.0"
 PACKAGES =+ "${PN}-examples"
diff --git a/meta/recipes-graphics/clutter/clutter-1.14/fix-wayland-deps.patch b/meta/recipes-graphics/clutter/clutter-1.14/fix-wayland-deps.patch
new file mode 100644
index 0000000..f5af73c
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-1.14/fix-wayland-deps.patch
@@ -0,0 +1,57 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 74f9d8a597acf0fd8458e3d6cb0475b8d9a0a6ba Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Thu, 27 Jun 2013 16:42:40 +0100
+Subject: [PATCH] build: Enable Cogl support with Wayland
+
+The Wayland backend is based on Cogl, so we need to turn on the
+SUPPORT_COGL flag to avoid breaking the build; this always went
+unnoticed because we usually build the Wayland client backend
+with the X11 backend.
+
+Reported-by: Ross Burton <ross.burton@intel.com>
+(cherry picked from commit 1fb0295ba162507fb798b2b7030f0f45ff252f27)
+
+Signed-off-by: Emmanuele Bassi <ebassi@gnome.org>
+---
+ configure.ac |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index f5afe12..355c95b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -310,6 +310,7 @@ AS_IF([test "x$enable_wayland" = "xyes"],
+         experimental_backend="yes"
+ 
+         SUPPORT_WAYLAND=1
++        SUPPORT_COGL=1
+ 
+         PKG_CHECK_EXISTS([wayland-client wayland-cursor xkbcommon gdk-pixbuf-2.0],
+                          [
+@@ -337,7 +338,10 @@ AS_IF([test "x$enable_wayland_compositor" = "xyes"],
+       [
+         PKG_CHECK_EXISTS([wayland-server],
+ 			 [BACKEND_PC_FILES="$BACKEND_PC_FILES wayland-server"], [])
++
+         SUPPORT_WAYLAND_COMPOSITOR=1
++        SUPPORT_COGL=1
++
+ 	CLUTTER_CONFIG_DEFINES="$CLUTTER_CONFIG_DEFINES
+ #define CLUTTER_HAS_WAYLAND_COMPOSITOR_SUPPORT 1"
+         AC_DEFINE([HAVE_CLUTTER_WAYLAND_COMPOSITOR], [1], [Have Wayland compositor support])
+@@ -359,8 +363,8 @@ AS_IF([test "x$enable_cex100" = "xyes"],
+ 
+         experimental_backend="yes"
+ 
+-        SUPPORT_COGL=1
+         SUPPORT_CEX100=1
++        SUPPORT_COGL=1
+ 
+         have_gdl=no
+         AC_CHECK_HEADERS([libgdl.h], [have_gdl=yes])
+-- 
+1.7.10.4
+
-- 
1.7.10.4


