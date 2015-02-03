Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECD1A6E65B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t131CIB1012982
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:18 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:11:57 -0800
Message-ID: <450e26052cd1a01d283693ab5c03d186cabc63fc.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/21] matchbox-desktop: remove 0.9.1 and 2.0 version
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:17 -0000
Content-Type: text/plain

For 0.9.1:
ERROR: matchbox-wm: Recipe file does not have license file information (LIC_FILES_CHKSUM)
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix

For 2.0:
| /path/to/matchbox-desktop-2.0/configure: line 2488: syntax error near unexpected token `build_old_libs,'
| /path/to/matchbox-desktop-2.0/configure: line 2488: `    _LT_DECL(build_old_libs, enable_static, 0,'

And there is a matchbox-desktop_git.bb which is "GPLv2+ & LGPLv2+", so remove them.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../files/dso_linking_change_build_fix.patch       |   28 --------------------
 .../matchbox-desktop/matchbox-desktop_0.9.1.bb     |   27 -------------------
 .../matchbox-desktop/matchbox-desktop_2.0.bb       |   15 -----------
 3 files changed, 70 deletions(-)
 delete mode 100644 meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
 delete mode 100644 meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb

diff --git a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch b/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
deleted file mode 100644
index 388f51f..0000000
--- a/meta/recipes-sato/matchbox-desktop/files/dso_linking_change_build_fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-after gcc linking has changed, all the libraries must be explicitely specified to for linking. 
-This patch avoids this linking error:
-
-| make[2]: Entering directory `/disk0/pokybuild/build1/tmp/work/i586-poky-linux/matchbox-desktop-2.0+svnr2096-r0/matchbox-desktop-2/src'^M
-| ccache i586-poky-linux-gcc -march=i586 --sysroot=/disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux -Wall -fexpensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o matchbox-desktop main.o taku-category-bar.o desktop.o ../libtaku/libtaku.a -pthread -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lgdk_pixbuf-2.0 -lpangocairo-1.0 -lcairo -lpango-1.0 -lfreetype -lfontconfig -lgobject-2.0 -lgmodule-2.0 -lgthread-2.0 -lrt -lglib-2.0   -ldbus-1 -lpthread -lrt   -lstartup-notification-1   ../libtaku/libinotify.a^M
-| /disk0/pokybuild/build1/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.5.1/ld: F^A: invalid DSO for symbol `XFree' definition^M
-| /disk0/pokybuild/build1/tmp/sysroots/i586-poky-linux/usr/lib/libX11.so.6: could not read symbols: Bad value^M
-| collect2: ld returned 1 exit status^M
-| make[2]: *** [matchbox-desktop] Error 1
-
-Nitin A Kamble <nitin.a.kamble@intel.com>
-Date: 2011/01/11
-
-Upstream-Status: Accepted
-
-Index: matchbox-desktop-2/configure.ac
-===================================================================
---- matchbox-desktop-2.orig/configure.ac
-+++ matchbox-desktop-2/configure.ac
-@@ -14,7 +14,7 @@ if test x$inotify_support = xyes; then
-         AC_DEFINE(WITH_INOTIFY, [1], [If inotify is enabled])
- fi
- 
--PKG_CHECK_MODULES(GTK, gtk+-2.0)
-+PKG_CHECK_MODULES(GTK, [gtk+-2.0 x11])
- 
- AC_ARG_ENABLE(startup_notification,
-         AC_HELP_STRING([--disable-startup-notification], [disable startup notification support]),
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
deleted file mode 100644
index 120f086..0000000
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_0.9.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Matchbox Window Manager Desktop"
-LICENSE = "GPLv2.0+"
-DEPENDS = "libmatchbox startup-notification"
-SECTION = "x11/wm"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/0.9/matchbox-desktop-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "3335a30b1a1aacfb39f23b505254765c"
-SRC_URI[sha256sum] = "ecb025d3660d80a9850973111b4fdfffaa50b47cbf0c5467b508d28d65146793"
-
-EXTRA_OECONF = "--enable-startup-notification --enable-dnotify"
-
-inherit autotools pkgconfig
-
-FILES_${PN} = "${bindir}/* \
-	       ${datadir}/applications \
-	       ${libdir}/matchbox/desktop/*.so \
-	       ${datadir}/matchbox-desktop \
-	       ${datadir}/pixmaps \
-	       ${sysconfdir}/matchbox"
-
-FILES_${PN}-dev += "${libdir}/matchbox-desktop \
-		    ${includedir}/matchbox-desktop \
-                    ${libdir}/matchbox/desktop/*.*a \
-		    ${datadir}/matchbox/desktop/modules/*a"
-
-FILES_${PN}-dbg += "${libdir}/matchbox/desktop/.debug/"
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
deleted file mode 100644
index c52e7f2..0000000
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Matchbox Window Manager Desktop"
-LICENSE = "GPLv2.0+"
-DEPENDS = "gtk+ startup-notification"
-SECTION = "x11/wm"
-PR = "r2"
-
-SRC_URI = "http://downloads.yoctoproject.org/releases/matchbox/matchbox-desktop/2.0/matchbox-desktop-${PV}.tar.bz2 \
-	file://dso_linking_change_build_fix.patch"
-
-SRC_URI[md5sum] = "b0a4a47130272e2adab4e9feb43a6c9c"
-SRC_URI[sha256sum] = "be33ff0bc8a9b1eee6af360a5118e470e69a6292ecc9e154ec6f349fce5c5f75"
-
-EXTRA_OECONF = "--enable-startup-notification"
-
-inherit autotools pkgconfig
-- 
1.7.9.5


