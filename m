Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAFDC77154
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:51:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAC8pfca020228
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 00:51:41 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 Nov 2015 00:51:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Nov 2015 00:51:39 -0800
Message-ID: <8d5508408ad7f619d8981aaf098592e2fa2244a8.1447318250.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1447318250.git.liezhi.yang@windriver.com>
References: <cover.1447318250.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] clutter-gst-3.0: add --enable/disable-gudev
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
X-List-Received-Date: Thu, 12 Nov 2015 08:51:42 -0000
Content-Type: text/plain

Fix dangling dependns on gudev, and systemd doesn't provide libgudev, so
it can't be enabled when systemd either.

Fixed:
libtool: error: cannot find the library 'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la' or unhandled argument
'tmp/sysroots/qemuarm64/usr/lib64/libgudev-1.0.la'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   15 ++++++-
 .../0001-configure.ac-add-enable-gudev.patch       |   45 ++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index d4fed71..c29bc7a 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -4,7 +4,12 @@ LICENSE = "LGPLv2+"
 
 inherit clutter
 
-SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
+SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch \
+            file://0001-configure.ac-add-enable-gudev.patch \
+            "
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gudev] = "--enable-gudev,--disable-gudev,udev"
 
 DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
 RDEPENDS_${PN} += "gstreamer1.0-meta-base"
@@ -12,6 +17,14 @@ PACKAGES  =+ "${PN}-examples"
 
 EXTRA_OECONF += "--disable-introspection"
 
+python () {
+    if bb.utils.contains('EXTRA_OECONF', '--enable-gudev', True, False, d) and \
+        bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
+            bb.warn("%s: gudev can't be enabled since systemd doesn't provide libgudev" % \
+                    d.getVar("PN", True))
+            d.appendVar('EXTRA_OECONF', ' --disable-gudev')
+}
+
 FILES_${PN}          += "${libdir}/gstreamer-1.0/lib*.so"
 FILES_${PN}-dev      += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-dbg      += "${libdir}/gstreamer-1.0/.debug/lib*.so"
diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch b/meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch
new file mode 100644
index 0000000..59f9fd8
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch
@@ -0,0 +1,45 @@
+From 3454c53e9d906ef7e39e82e81a446bcece566e53 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 11 Nov 2015 22:34:51 -0800
+Subject: [PATCH] configure.ac: add --enable-gudev
+
+So that we can enable/disable gudev support clearly
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.ac |   11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 92022cb..595c944 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -209,13 +209,22 @@ AS_IF([test "x$have_cogl_osx" = xyes],
+         AC_SUBST([GL_LDFLAGS])
+       ])
+ 
+-PKG_CHECK_MODULES(GUDEV,
++have_gudev=no
++AC_ARG_ENABLE([gudev],
++              [AC_HELP_STRING([--enable-gudev=@<:@no/yes@:>@],
++                              [Enable gudev support @<:@default=no@:>@])],
++              [],
++              enable_gudev=gudev)
++
++AS_IF([test "x$enable_gudev" = "xyes"], [
++    PKG_CHECK_MODULES(GUDEV,
+                  [gudev-1.0],
+                  [
+                    have_gudev=yes
+                    AC_DEFINE([HAVE_GUDEV], [1],
+                              ["Defined if gudev is available"])
+                  ],[ have_gudev=no ])
++])
+ 
+ dnl ========================================================================
+ dnl Experimental support for hardware accelerated decoders.
+-- 
+1.7.9.5
+
-- 
1.7.9.5


