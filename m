Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5C16970620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:59:15 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XAKUF-0000xR-FW from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jul 2014 07:59:15 -0700
Received: from SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 24 Jul 2014 07:59:15 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.2.247.3; Thu, 24 Jul 2014 07:59:14 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 10:59:10 -0400
Message-ID: <1406213951-11347-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <D4601E2D-F5E9-4AD3-AB6A-A67B0D4FD4E4@mentor.com>
References: <D4601E2D-F5E9-4AD3-AB6A-A67B0D4FD4E4@mentor.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 24 Jul 2014 14:59:15.0323 (UTC)
	FILETIME=[D618ACB0:01CFA74F]
Subject: [PATCH V2 1/2] Revert "libomxil-0.9.3: Remove versioning for .so files."
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
X-List-Received-Date: Thu, 24 Jul 2014 14:59:19 -0000
Content-Type: text/plain

The previous version of this fix was too aggressive and removed
versioning from too many of the .so files in the libomxil package.

This reverts commit 0ef3734c2f279bf463ba4d1aef5241cd4882d483.
---
 .../libomxil-0.9.3/disable-so-versioning.patch     | 69 ----------------------
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 17 ++----
 2 files changed, 6 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch

diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
deleted file mode 100644
index 9c63b4d..0000000
--- a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-Disable so versioning since they are really not a versioned shared lib.
-
-Upstream-Status: Submitted @ https://sourceforge.net/p/omxil/bugs/59/
-
-Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
-
-diff -rub libomxil-bellagio-0.9.3-orig/src/components/audio_effects/Makefile.am libomxil-bellagio-0.9.3/src/components/audio_effects/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/components/audio_effects/Makefile.am	2014-07-20 15:22:00.858425234 -0400
-+++ libomxil-bellagio-0.9.3/src/components/audio_effects/Makefile.am	2014-07-20 15:25:42.687525225 -0400
-@@ -10,4 +10,5 @@
- libomxaudio_effects_la_CFLAGS = -I$(top_srcdir)/include \
- 				-I$(top_srcdir)/src \
- 				-I$(top_srcdir)/src/base
-+libomxaudio_effects_la_LDFLAGS = -avoid-version
- 
-diff -rub libomxil-bellagio-0.9.3-orig/src/components/clocksrc/Makefile.am libomxil-bellagio-0.9.3/src/components/clocksrc/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/components/clocksrc/Makefile.am	2014-07-20 15:22:00.858425234 -0400
-+++ libomxil-bellagio-0.9.3/src/components/clocksrc/Makefile.am	2014-07-20 15:24:49.151259753 -0400
-@@ -10,4 +10,4 @@
-                              -I$(top_srcdir)/include \
-                              -I$(top_srcdir)/src \
-                              -I$(top_srcdir)/src/base
--
-+libomxclocksrc_la_LDFLAGS = -avoid-version
-diff -rub libomxil-bellagio-0.9.3-orig/src/components/videoscheduler/Makefile.am libomxil-bellagio-0.9.3/src/components/videoscheduler/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/components/videoscheduler/Makefile.am	2014-07-20 15:22:00.862425254 -0400
-+++ libomxil-bellagio-0.9.3/src/components/videoscheduler/Makefile.am	2014-07-20 15:22:36.462601786 -0400
-@@ -6,7 +6,7 @@
- 								library_entry_point.c
- 
- libomxvideosched_la_LIBADD = $(top_builddir)/src/libomxil-bellagio.la
--libomxvideosched_la_LDFLAGS = 
-+libomxvideosched_la_LDFLAGS = -avoid-version
- libomxvideosched_la_CFLAGS = -I$(top_srcdir)/include \
- 			-I$(top_srcdir)/src \
- 			-I$(top_srcdir)/src/base
-diff -rub libomxil-bellagio-0.9.3-orig/src/dynamic_loader/Makefile.am libomxil-bellagio-0.9.3/src/dynamic_loader/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/dynamic_loader/Makefile.am	2014-07-20 15:22:00.862425254 -0400
-+++ libomxil-bellagio-0.9.3/src/dynamic_loader/Makefile.am	2014-07-20 15:22:36.462601786 -0400
-@@ -3,7 +3,7 @@
- omxdynamicloader_LTLIBRARIES = libomxdynamicloader.la
- libomxdynamicloader_la_SOURCES = ste_dynamic_component_loader.c ste_dynamic_component_loader.h
- 
--libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(top_builddir)/src/.libs
-+libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(top_builddir)/src/.libs -avoid-version
- libomxdynamicloader_la_CFLAGS = -I$(top_srcdir)/include \
- 			-I$(top_srcdir)/src \
- 			-I$(top_srcdir)/src/base \
-diff -rub libomxil-bellagio-0.9.3-orig/src/Makefile.am libomxil-bellagio-0.9.3/src/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/Makefile.am	2014-07-20 15:22:00.862425254 -0400
-+++ libomxil-bellagio-0.9.3/src/Makefile.am	2014-07-20 15:22:36.462601786 -0400
-@@ -8,7 +8,7 @@
- omxregister_bellagio_CFLAGS = -DOMXILCOMPONENTSPATH=\"$(plugindir)/\" \
- 			      -I$(top_srcdir)/include
- omxregister_bellagio_LDADD = $(lib_LTLIBRARIES)
--omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir)
-+omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir) -avoid-version
- 
- lib_LTLIBRARIES = libomxil-bellagio.la
- libomxil_bellagio_la_SOURCES = component_loader.h \
-@@ -29,7 +29,7 @@
- libomxil_bellagio_la_CFLAGS = -I$(top_srcdir)/include -I$(srcdir)/base -I$(srcdir)/core_extensions \
-                               -DINSTALL_PATH_STR=\"$(plugindir)\" -DOMX_LOADERS_DIRNAME=\"$(libdir)/omxloaders\/\"
- libomxil_bellagio_la_LIBADD = base/libomxbase.la core_extensions/libomxcoreext.la -lpthread
--libomxil_bellagio_la_LDFLAGS = -version-info @SHARED_VERSION_INFO@
-+libomxil_bellagio_la_LDFLAGS = -avoid-version
- 
- include_extradir = $(includedir)/bellagio
- 
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index ba3d491..103d789 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -12,8 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
            file://configure-fix.patch \
            file://parallel-make.patch \
            file://makefile-docdir-fix.patch \
-           file://dynamicloader-linking.patch \
-           file://disable-so-versioning.patch"
+           file://dynamicloader-linking.patch"
 
 SRC_URI[md5sum] = "a1de827fdb75c02c84e55f740ca27cb8"
 SRC_URI[sha256sum] = "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
@@ -24,17 +23,13 @@ inherit autotools
 
 EXTRA_OECONF += "--disable-doc --disable-Werror"
 
-#
-# The .so files populated by libomxil are not intended to be versioned and symlinked.
-# Make sure they get packaged in the main package.
-#
-FILES_SOLIBSDEV = ""
-FILES_${PN} += "${libdir}/*.so \
-                ${libdir}/bellagio/*.so \
-                ${libdir}/omxloaders/*.so"
+FILES_${PN} += "${libdir}/bellagio/*${SOLIBS} \
+                ${libdir}/omxloaders/*${SOLIBS}"
 FILES_${PN}-staticdev += "${libdir}/bellagio/*.a \
                           ${libdir}/omxloaders/*.a"
 FILES_${PN}-dev += "${libdir}/bellagio/*.la \
-                    ${libdir}/omxloaders/*.la"
+                    ${libdir}/bellagio/*${SOLIBSDEV} \
+                    ${libdir}/omxloaders/*.la \
+                    ${libdir}/omxloaders/*${SOLIBSDEV}"
 FILES_${PN}-dbg += "${libdir}/bellagio/.debug/ \
                     ${libdir}/omxloaders/.debug/"
-- 
1.9.1


