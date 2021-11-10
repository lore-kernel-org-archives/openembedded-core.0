Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 04/24] xserver-xorg: update 1.20.13 -> 21.1.1
Date: Wed, 10 Nov 2021 20:39:17 +0100
Message-Id: <20211110193937.2606747-4-alex@linutronix.de>
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Eric Anholt <eric@anholt.net>, =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>, Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@intel.com>

libxcvt is a new dependency (thanks Oleksandr!).

Include ${libdir}/xorg/modules/input/*.so into the main
package (if for someone separate packaging matters, please
investigate what they do).

Remove options no longer present upstream.

Remove patches available upstream; drop a chunk as well.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-xserver/xserver-xorg.inc             |  7 +--
 ...-duplicate-definitions-of-IOPortBase.patch | 24 ++-------
 ...probing-a-non-PCI-platform-device-on.patch | 34 -------------
 ...t-xtest-Initialize-array-with-braces.patch | 36 -------------
 .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 -------------
 .../xserver-xorg/sdksyms-no-build-path.patch  | 50 -------------------
 ...xorg_1.20.13.bb => xserver-xorg_21.1.1.bb} |  6 +--
 7 files changed, 7 insertions(+), 184 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_21.1.1.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index e1fc0a06dc..6a5f274046 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -28,7 +28,7 @@ inherit autotools pkgconfig
 inherit features_check
 REQUIRED_DISTRO_FEATURES = "x11"
 
-LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
+LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess libxcvt"
 DEPENDS = "xorgproto ${LIB_DEPS} font-util"
 
 # Split out some modules and extensions from the main package
@@ -78,7 +78,7 @@ RRECOMMENDS:${PN}-xwayland += "${XSERVER_RRECOMMENDS}"
 RDEPENDS:${PN}-xvfb += "xkeyboard-config"
 RDEPENDS:${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
-FILES:${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
+FILES:${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/input/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES:${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
 FILES:${PN}-doc += "${libdir}/X11/doc ${datadir}/X11/xkb/compiled/README.compiled ${localstatedir}/lib/xkb/README.compiled"
 FILES:${PN}-sdl = "${bindir}/Xsdl"
@@ -109,7 +109,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --with-pic \
                  --disable-static \
                  --disable-record \
-                 --disable-dmx \
                  --disable-xnest \
                  --enable-xvfb \
                  --enable-composite \
@@ -118,7 +117,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
                  --with-xkb-output=/var/lib/xkb \
-                 --with-os-name=Linux \
 "
 
 OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
@@ -141,7 +139,6 @@ PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-
 PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
 PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama"
-PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland wayland-native wayland-protocols libepoxy"
 
 # Xorg requires a SHA1 implementation, pick one
 XORG_CRYPTO ??= "openssl"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
index 4737040675..11d5546537 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
@@ -1,4 +1,4 @@
-From fc04acfd948ac99d04a5dc08c78f3b13bc0c5c41 Mon Sep 17 00:00:00 2001
+From ce3b8a230a3805c9b557c1f106795675bd034860 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 17 Aug 2020 10:50:51 -0700
 Subject: [PATCH] Avoid duplicate definitions of IOPortBase
@@ -10,26 +10,13 @@ compiler.h:528: multiple definition of `IOPortBase';
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- hw/xfree86/common/compiler.h            | 2 +-
  hw/xfree86/os-support/linux/lnx_video.c | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
+ 1 file changed, 1 insertion(+)
 
-diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
-index 2b2008b..c7d617e 100644
---- a/hw/xfree86/common/compiler.h
-+++ b/hw/xfree86/common/compiler.h
-@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsigned long offset,
- #define PORT_SIZE short
- #endif
- 
--_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
-+extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
- 
- static __inline__ void
- outb(unsigned PORT_SIZE port, unsigned char val)
 diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
-index 04e4509..9dc7316 100644
+index fd83022..1d0d96e 100644
 --- a/hw/xfree86/os-support/linux/lnx_video.c
 +++ b/hw/xfree86/os-support/linux/lnx_video.c
 @@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
@@ -40,6 +27,3 @@ index 04e4509..9dc7316 100644
  
  #if defined(__powerpc__)
  volatile unsigned char *ioBase = NULL;
--- 
-2.28.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
deleted file mode 100644
index 8b687d612d..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
-From: Eric Anholt <eric@anholt.net>
-Date: Fri, 26 Oct 2018 17:47:30 -0700
-Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a system
- with PCI.
-
-Some Broadcom set-top-box boards have PCI busses, but the GPU is still
-probed through DT.  We would dereference a null busid here in that
-case.
-
-Signed-off-by: Eric Anholt <eric@anholt.net>
-
-Upstream-Status: Backport [https://github.com/freedesktop/xorg-xserver/commit/e50c85f4e]
-Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
----
- hw/xfree86/common/xf86platformBus.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf86platformBus.c
-index cef47da03..dadbac6c8 100644
---- a/hw/xfree86/common/xf86platformBus.c
-+++ b/hw/xfree86/common/xf86platformBus.c
-@@ -289,7 +289,7 @@ xf86platformProbe(void)
-     for (i = 0; i < xf86_num_platform_devices; i++) {
-         char *busid = xf86_platform_odev_attributes(i)->busid;
- 
--        if (pci && (strncmp(busid, "pci:", 4) == 0)) {
-+        if (pci && busid && (strncmp(busid, "pci:", 4) == 0)) {
-             platform_find_pci_info(&xf86_platform_devices[i], busid);
-         }
- 
--- 
-2.28.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
deleted file mode 100644
index c0c242814b..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 1 Mar 2019 09:47:57 -0800
-Subject: [PATCH] test/xtest: Initialize array with braces
-
-Fixes an error when extra warnings are enabled, this is caught with clang
-
-test/xtest.c:64:23: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
-    WindowRec root = {0};
-                      ^
-                      {}
-1 error generated.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/xtest.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/xtest.c b/test/xtest.c
-index fc5e433..d7e6620 100644
---- a/test/xtest.c
-+++ b/test/xtest.c
-@@ -61,7 +61,7 @@ xtest_init_devices(void)
- {
-     ScreenRec screen = {0};
-     ClientRec server_client = {0};
--    WindowRec root = {0};
-+    WindowRec root = {{0}};
-     WindowOptRec optional = {0};
- 
-     /* random stuff that needs initialization */
--- 
-2.21.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
deleted file mode 100644
index 2ef9fa9fe4..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/22]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 5f65a6246fe752764045dd1e38912f1dccec71e4 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 20 Sep 2018 20:12:24 +0100
-Subject: [PATCH] xorg-server.m4: just all cflags instead of just sdkdir
-
-Instead of fetching just the sdkdir variable of xorg-server using pkg-config,
-simply get all of the CFLAGS.  Aside from completeness, this helps builds in
-sysroots as pkg-config knows what to do with --cflags but doesn't remap
-arbitrary variables.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- xorg-server.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/xorg-server.m4 b/xorg-server.m4
-index 18255b91a..195bda5d8 100644
---- a/xorg-server.m4
-+++ b/xorg-server.m4
-@@ -31,7 +31,7 @@ dnl
- AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
- 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 	SAVE_CFLAGS="$CFLAGS"
--	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
-+	CFLAGS="$CFLAGS `$PKG_CONFIG --cflags xorg-server`"
- 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
- #include "xorg-server.h"
- #if !defined $1
--- 
-2.11.0
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
deleted file mode 100644
index be198ece49..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/253]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Thu, 1 Aug 2019 15:24:51 +0100
-Subject: [PATCH] sdksyms.sh: don't embed the build path
-
-This script generates a header that has a comment containing the build path for
-no real reason.  As this source can end up deployed on targets in debug packages
-this means there is both potentially sensitive information leakage about the
-build environment, and a source of change for reproducible builds.
----
- hw/xfree86/sdksyms.sh | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
-index 39e33711d..bdf47a71a 100755
---- a/hw/xfree86/sdksyms.sh
-+++ b/hw/xfree86/sdksyms.sh
-@@ -302,13 +302,16 @@ LC_ALL=C
- export LC_ALL
- ${CPP:-cpp} "$@" sdksyms.c > /dev/null || exit $?
- ${CPP:-cpp} "$@" sdksyms.c | ${AWK:-awk} -v topdir=$topdir '
-+function basename(file) {
-+    sub(".*/", "", file)
-+    return file
-+}
- BEGIN {
-     sdk = 0;
-     print("/*");
-     print(" * These symbols are referenced to ensure they");
-     print(" * will be available in the X Server binary.");
-     print(" */");
--    printf("/* topdir=%s */\n", topdir);
-     print("_X_HIDDEN void *xorg_symbols[] = {");
- 
-     printf("sdksyms.c:") > "sdksyms.dep";
-@@ -337,7 +340,7 @@ BEGIN {
- 	# remove quotes
- 	gsub(/"/, "", $3);
- 	line = $2;
--	header = $3;
-+	header = basename($3);
- 	if (! headers[$3]) {
- 	    printf(" \\\n  %s", $3) >> "sdksyms.dep";
- 	    headers[$3] = 1;
--- 
-2.20.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
index 01a54070c7..5793e078ee 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.1.bb
@@ -1,14 +1,10 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
-           file://pkgconfig.patch \
-           file://0001-test-xtest-Initialize-array-with-braces.patch \
-           file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
            "
-SRC_URI[sha256sum] = "40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300"
+SRC_URI[sha256sum] = "782e7fef2ca0c7cbe60a937b8bf42dac69c904fb841950fd0363e1c2346ea755"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.20.1

