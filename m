Return-Path: <mfe@pengutronix.de>
X-Greylist: delayed 1005 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Apr 2019 12:10:09 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id CCC1A7DC62
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 12:10:09 +0000 (UTC)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28]
	helo=dude02.lab.pengutronix.de)
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>) id 1hLRK9-000487-4W
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2019 13:53:25 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
	(envelope-from <mfe@pengutronix.de>) id 1hLRK8-0007DY-Sh
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2019 13:53:24 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 13:53:22 +0200
Message-Id: <20190430115323.25661-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] mesa: fix imx gallium driver
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
X-List-Received-Date: Tue, 30 Apr 2019 12:10:10 -0000
Content-Transfer-Encoding: 8bit

Since commit [1] the imx-drm driver is covered by the generic kmsro
driver. Unfortunatly we need to patch the autotools path too since the
switch commit [1] missed some dependencies.

[1] https://gitlab.freedesktop.org/mesa/mesa/commit/ \
	41a0acd6a149ec9f47ea527ad08a2b29bf1ee6b2

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 ...Fix-imx-autotools-build-dependencies.patch | 46 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  4 +-
 meta/recipes-graphics/mesa/mesa_19.0.1.bb     |  1 +
 3 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch

diff --git a/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch b/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch
new file mode 100644
index 0000000000..6cefe70bd8
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0005-Fix-imx-autotools-build-dependencies.patch
@@ -0,0 +1,46 @@
+From 3e2aeab89fdbd0572d635d3a57a54f3fb99af254 Mon Sep 17 00:00:00 2001
+From: Marco Felsch <m.felsch@pengutronix.de>
+Date: Tue, 30 Apr 2019 09:45:26 +0200
+Subject: [PATCH] Fix imx autotools build dependencies
+
+Since commit 41a0acd6 ("Switch imx to kmsro and remove the imx winsys")
+the imx-drm is covered by kmsro. During the switch some autotools
+dependencies are missed. Autotools are marked as deprecated but since
+yocto still uses them we need to cover this.
+
+Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
+---
+ configure.ac                           | 4 ++--
+ src/gallium/drivers/kmsro/Automake.inc | 1 +
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1ef68fe68e6..1623976ab5c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2861,8 +2861,8 @@ AM_CONDITIONAL(HAVE_SWR_BUILTIN, test "x$HAVE_SWR_BUILTIN" = xyes)
+ 
+ dnl We need to validate some needed dependencies for renderonly drivers.
+ 
+-if test "x$HAVE_GALLIUM_VC4" != xyes -a "x$HAVE_GALLIUM_KMSRO" = xyes  ; then
+-    AC_MSG_ERROR([Building with kmsro requires vc4])
++if test "x$HAVE_GALLIUM_VC4" != xyes -a "x$HAVE_GALLIUM_ETNAVIV" != xyes -a "x$HAVE_GALLIUM_KMSRO" = xyes  ; then
++    AC_MSG_ERROR([Building with kmsro requires vc4 or etnaviv])
+ fi
+ 
+ if test "x$HAVE_GALLIUM_NOUVEAU" != xyes -a "x$HAVE_GALLIUM_TEGRA" = xyes; then
+diff --git a/src/gallium/drivers/kmsro/Automake.inc b/src/gallium/drivers/kmsro/Automake.inc
+index d5961c90765..ebed42408c2 100644
+--- a/src/gallium/drivers/kmsro/Automake.inc
++++ b/src/gallium/drivers/kmsro/Automake.inc
+@@ -2,6 +2,7 @@ if HAVE_GALLIUM_KMSRO
+ 
+ TARGET_DRIVERS += pl111
+ TARGET_DRIVERS += hx8357d
++TARGET_DRIVERS += imx-drm
+ TARGET_CPPFLAGS += -DGALLIUM_KMSRO
+ TARGET_LIB_DEPS += \
+     $(top_builddir)/src/gallium/winsys/kmsro/drm/libkmsrodrm.la \
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ece74974b5..b3339dce33 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -87,11 +87,11 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-
 PACKAGECONFIG[egl] = "--enable-egl, --disable-egl"
 
 PACKAGECONFIG[etnaviv] = ""
-PACKAGECONFIG[imx] = ""
+PACKAGECONFIG[kmsro] = ""
 
 GALLIUMDRIVERS = "swrast"
 GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'imx', ',imx', '', d)}"
+GALLIUMDRIVERS_append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
 
 # radeonsi requires LLVM
 GALLIUMDRIVERS_LLVM33 = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.1.bb
index d90be8a074..753fd5328a 100644
--- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_19.0.1.bb
@@ -5,6 +5,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-winsys-svga-drm-Include-sys-types.h.patch \
            file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch \
            file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
+           file://0005-Fix-imx-autotools-build-dependencies.patch \
 "
 
 SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
-- 
2.20.1


