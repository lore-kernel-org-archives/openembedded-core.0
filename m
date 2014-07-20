Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C2B72705A2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Jul 2014 20:13:38 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1X8xUJ-00061J-9u from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Jul 2014 13:13:39 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Sun, 20 Jul 2014 13:13:39 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-04.mgc.mentorg.com (147.34.97.41) with Microsoft SMTP
	Server id 14.2.247.3; Sun, 20 Jul 2014 13:13:00 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 20 Jul 2014 16:13:36 -0400
Message-ID: <1405887216-24658-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CAJTo0LaZJzF1y=jp2ZV+sNV+6Kr9G9ez-BNvT6gUY3sgNvBrQw@mail.gmail.com>
References: <CAJTo0LaZJzF1y=jp2ZV+sNV+6Kr9G9ez-BNvT6gUY3sgNvBrQw@mail.gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Jul 2014 20:13:39.0126 (UTC)
	FILETIME=[18259560:01CFA457]
Subject: [PATCH v2] libomxil-0.9.3: Remove versioning for .so files.
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
X-List-Received-Date: Sun, 20 Jul 2014 20:13:43 -0000
Content-Type: text/plain

The so files installed by libomxil are not versioned and should
be installed without version-based symlinks so that omxregister-bellagio
can properly find and register them.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../libomxil-0.9.3/disable-so-versioning.patch     | 69 ++++++++++++++++++++++
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 17 ++++--
 2 files changed, 80 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch

diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
new file mode 100644
index 0000000..9c63b4d
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
@@ -0,0 +1,69 @@
+Disable so versioning since they are really not a versioned shared lib.
+
+Upstream-Status: Submitted @ https://sourceforge.net/p/omxil/bugs/59/
+
+Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
+
+diff -rub libomxil-bellagio-0.9.3-orig/src/components/audio_effects/Makefile.am libomxil-bellagio-0.9.3/src/components/audio_effects/Makefile.am
+--- libomxil-bellagio-0.9.3-orig/src/components/audio_effects/Makefile.am	2014-07-20 15:22:00.858425234 -0400
++++ libomxil-bellagio-0.9.3/src/components/audio_effects/Makefile.am	2014-07-20 15:25:42.687525225 -0400
+@@ -10,4 +10,5 @@
+ libomxaudio_effects_la_CFLAGS = -I$(top_srcdir)/include \
+ 				-I$(top_srcdir)/src \
+ 				-I$(top_srcdir)/src/base
++libomxaudio_effects_la_LDFLAGS = -avoid-version
+ 
+diff -rub libomxil-bellagio-0.9.3-orig/src/components/clocksrc/Makefile.am libomxil-bellagio-0.9.3/src/components/clocksrc/Makefile.am
+--- libomxil-bellagio-0.9.3-orig/src/components/clocksrc/Makefile.am	2014-07-20 15:22:00.858425234 -0400
++++ libomxil-bellagio-0.9.3/src/components/clocksrc/Makefile.am	2014-07-20 15:24:49.151259753 -0400
+@@ -10,4 +10,4 @@
+                              -I$(top_srcdir)/include \
+                              -I$(top_srcdir)/src \
+                              -I$(top_srcdir)/src/base
+-
++libomxclocksrc_la_LDFLAGS = -avoid-version
+diff -rub libomxil-bellagio-0.9.3-orig/src/components/videoscheduler/Makefile.am libomxil-bellagio-0.9.3/src/components/videoscheduler/Makefile.am
+--- libomxil-bellagio-0.9.3-orig/src/components/videoscheduler/Makefile.am	2014-07-20 15:22:00.862425254 -0400
++++ libomxil-bellagio-0.9.3/src/components/videoscheduler/Makefile.am	2014-07-20 15:22:36.462601786 -0400
+@@ -6,7 +6,7 @@
+ 								library_entry_point.c
+ 
+ libomxvideosched_la_LIBADD = $(top_builddir)/src/libomxil-bellagio.la
+-libomxvideosched_la_LDFLAGS = 
++libomxvideosched_la_LDFLAGS = -avoid-version
+ libomxvideosched_la_CFLAGS = -I$(top_srcdir)/include \
+ 			-I$(top_srcdir)/src \
+ 			-I$(top_srcdir)/src/base
+diff -rub libomxil-bellagio-0.9.3-orig/src/dynamic_loader/Makefile.am libomxil-bellagio-0.9.3/src/dynamic_loader/Makefile.am
+--- libomxil-bellagio-0.9.3-orig/src/dynamic_loader/Makefile.am	2014-07-20 15:22:00.862425254 -0400
++++ libomxil-bellagio-0.9.3/src/dynamic_loader/Makefile.am	2014-07-20 15:22:36.462601786 -0400
+@@ -3,7 +3,7 @@
+ omxdynamicloader_LTLIBRARIES = libomxdynamicloader.la
+ libomxdynamicloader_la_SOURCES = ste_dynamic_component_loader.c ste_dynamic_component_loader.h
+ 
+-libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(top_builddir)/src/.libs
++libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(top_builddir)/src/.libs -avoid-version
+ libomxdynamicloader_la_CFLAGS = -I$(top_srcdir)/include \
+ 			-I$(top_srcdir)/src \
+ 			-I$(top_srcdir)/src/base \
+diff -rub libomxil-bellagio-0.9.3-orig/src/Makefile.am libomxil-bellagio-0.9.3/src/Makefile.am
+--- libomxil-bellagio-0.9.3-orig/src/Makefile.am	2014-07-20 15:22:00.862425254 -0400
++++ libomxil-bellagio-0.9.3/src/Makefile.am	2014-07-20 15:22:36.462601786 -0400
+@@ -8,7 +8,7 @@
+ omxregister_bellagio_CFLAGS = -DOMXILCOMPONENTSPATH=\"$(plugindir)/\" \
+ 			      -I$(top_srcdir)/include
+ omxregister_bellagio_LDADD = $(lib_LTLIBRARIES)
+-omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir)
++omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir) -avoid-version
+ 
+ lib_LTLIBRARIES = libomxil-bellagio.la
+ libomxil_bellagio_la_SOURCES = component_loader.h \
+@@ -29,7 +29,7 @@
+ libomxil_bellagio_la_CFLAGS = -I$(top_srcdir)/include -I$(srcdir)/base -I$(srcdir)/core_extensions \
+                               -DINSTALL_PATH_STR=\"$(plugindir)\" -DOMX_LOADERS_DIRNAME=\"$(libdir)/omxloaders\/\"
+ libomxil_bellagio_la_LIBADD = base/libomxbase.la core_extensions/libomxcoreext.la -lpthread
+-libomxil_bellagio_la_LDFLAGS = -version-info @SHARED_VERSION_INFO@
++libomxil_bellagio_la_LDFLAGS = -avoid-version
+ 
+ include_extradir = $(includedir)/bellagio
+ 
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 103d789..ba3d491 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -12,7 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
            file://configure-fix.patch \
            file://parallel-make.patch \
            file://makefile-docdir-fix.patch \
-           file://dynamicloader-linking.patch"
+           file://dynamicloader-linking.patch \
+           file://disable-so-versioning.patch"
 
 SRC_URI[md5sum] = "a1de827fdb75c02c84e55f740ca27cb8"
 SRC_URI[sha256sum] = "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
@@ -23,13 +24,17 @@ inherit autotools
 
 EXTRA_OECONF += "--disable-doc --disable-Werror"
 
-FILES_${PN} += "${libdir}/bellagio/*${SOLIBS} \
-                ${libdir}/omxloaders/*${SOLIBS}"
+#
+# The .so files populated by libomxil are not intended to be versioned and symlinked.
+# Make sure they get packaged in the main package.
+#
+FILES_SOLIBSDEV = ""
+FILES_${PN} += "${libdir}/*.so \
+                ${libdir}/bellagio/*.so \
+                ${libdir}/omxloaders/*.so"
 FILES_${PN}-staticdev += "${libdir}/bellagio/*.a \
                           ${libdir}/omxloaders/*.a"
 FILES_${PN}-dev += "${libdir}/bellagio/*.la \
-                    ${libdir}/bellagio/*${SOLIBSDEV} \
-                    ${libdir}/omxloaders/*.la \
-                    ${libdir}/omxloaders/*${SOLIBSDEV}"
+                    ${libdir}/omxloaders/*.la"
 FILES_${PN}-dbg += "${libdir}/bellagio/.debug/ \
                     ${libdir}/omxloaders/.debug/"
-- 
1.9.1


