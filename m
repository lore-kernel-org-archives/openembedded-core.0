Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from mailhost.eurogiciel.fr (mailhost.eurogiciel.fr [86.64.47.76])
	by mail.openembedded.org (Postfix) with ESMTP id 1603F60FAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 12:23:45 +0000 (UTC)
Received: from (unknown [172.16.88.4]) by mailhost.eurogiciel.fr with smtp
	id 1717_711a_adf65110_31a7_11e3_b3fa_a4badbe01a3a;
	Thu, 10 Oct 2013 14:29:59 +0200
Received: from intel13.vannes ([172.16.100.253]) by 31l-syracuse.eurogiciel.fr
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 10 Oct 2013 14:23:31 +0200
From: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 14:23:21 +0200
Message-Id: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 10 Oct 2013 12:23:31.0269 (UTC)
	FILETIME=[880CEF50:01CEC5B3]
Subject: [PATCH v3 1/2] wayland : Bump to 1.2.0 version
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
X-List-Received-Date: Thu, 10 Oct 2013 12:23:48 -0000

Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
---
 .../wayland/wayland/just-scanner.patch             |   36 --------------------
 .../wayland/{wayland_1.1.0.bb => wayland_1.2.0.bb} |   18 ++--------
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/just-scanner.patch
 rename meta/recipes-graphics/wayland/{wayland_1.1.0.bb => wayland_1.2.0.bb} (59%)

diff --git a/meta/recipes-graphics/wayland/wayland/just-scanner.patch b/meta/recipes-graphics/wayland/wayland/just-scanner.patch
deleted file mode 100644
index 234a9c5..0000000
--- a/meta/recipes-graphics/wayland/wayland/just-scanner.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-We only build wayland-native for the scanner, so disable the bits we don't
-actually need.  This gives us a small speed up but importantly should allow
-wayland-native to compile on older hosts such as CentOS 5 which currently fails:
-
-| wayland-1.0.6/src/wayland-server.c:1245: error: 'O_CLOEXEC' undeclared (first use in this function)
-| wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or directory
-| wayland-1.0.6/src/event-loop.c:199: error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
-| wayland-1.0.6/src/event-loop.c:199: error: 'TFD_CLOEXEC' undeclared (first use in this function)
-| wayland-1.0.6/src/event-loop.c:268: error: 'SFD_CLOEXEC' undeclared (first use in this function)
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 306d7b3..571fe89 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2,7 +2,7 @@ if BUILD_DOCS
- doc_subdir = doc
- endif
- 
--SUBDIRS = src protocol $(doc_subdir) tests cursor
-+SUBDIRS = src protocol $(doc_subdir)
- 
- ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
- 
-diff --git a/src/Makefile.am b/src/Makefile.am
-index e1d04ea..702342e 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -1,4 +1,4 @@
--lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
-+#lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
- noinst_LTLIBRARIES = libwayland-util.la
- 
- include_HEADERS =				\
diff --git a/meta/recipes-graphics/wayland/wayland_1.1.0.bb b/meta/recipes-graphics/wayland/wayland_1.2.0.bb
similarity index 59%
rename from meta/recipes-graphics/wayland/wayland_1.1.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.2.0.bb
index a71402e..f001b43 100644
--- a/meta/recipes-graphics/wayland/wayland_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.2.0.bb
@@ -11,11 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d2dc9398a83692cafc16eba6e45f85d8"
-SRC_URI[sha256sum] = "2ef587cf1a0e52b6dee44eeb9c288110e8180819abf4e419d247dfe234867a5c"
-
-SRC_URI_append_class-native = " file://just-scanner.patch"
-
+SRC_URI[md5sum] = "48d375afb15f3e68a72cf7b4fd8f4a63"
+SRC_URI[sha256sum] = "6b0439a017185bc5b2fed96c178bed3abf7f19188f3078f4d69fd3ce222d654c"
 inherit autotools pkgconfig
 
 # We need wayland-native for the wayland-scanner utility
@@ -26,14 +23,3 @@ DEPENDS = "expat libffi wayland-native"
 
 EXTRA_OECONF_virtclass-native = "--disable-documentation"
 EXTRA_OECONF = "--disable-documentation --disable-scanner"
-
-# Wayland installs a M4 macro for other projects to use. This M4 macro includes
-# a path to a Makefile fragment to get the rules to generate stubs from protocol
-# description files.  The paths to the sysroot end up incorrect, so fix them.
-do_configure_append_class-native() {
-  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
-      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
-  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
-}
-- 
1.7.10.4


