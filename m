Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFDF707E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 14:59:15 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1XAKUG-0000xa-SF from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jul 2014 07:59:16 -0700
Received: from SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 24 Jul 2014 07:59:16 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	SVR-ORW-FEM-06.mgc.mentorg.com (147.34.97.120) with Microsoft SMTP
	Server id 14.2.247.3; Thu, 24 Jul 2014 07:59:15 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 10:59:11 -0400
Message-ID: <1406213951-11347-2-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1406213951-11347-1-git-send-email-drew_moseley@mentor.com>
References: <D4601E2D-F5E9-4AD3-AB6A-A67B0D4FD4E4@mentor.com>
	<1406213951-11347-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 24 Jul 2014 14:59:16.0687 (UTC)
	FILETIME=[D6E8CDF0:01CFA74F]
Subject: [PATCH V2 2/2] libomxil-0.9.3: Remove versioning for bellagio .so files.
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

The so files installed under ${libdir}/bellagio are not versioned and should
be installed without version-based symlinks so that omxregister-bellagio
can properly find and register them.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../libomxil-0.9.3/disable-so-versioning.patch     | 36 ++++++++++++++++++++++
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 10 ++++--
 2 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch

diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
new file mode 100644
index 0000000..f408e4a
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
@@ -0,0 +1,36 @@
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
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 103d789..40d6df8 100644
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
@@ -23,12 +24,15 @@ inherit autotools
 
 EXTRA_OECONF += "--disable-doc --disable-Werror"
 
-FILES_${PN} += "${libdir}/bellagio/*${SOLIBS} \
+#
+# The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
+# Make sure they get packaged in the main package.
+#
+FILES_${PN} += "${libdir}/bellagio/*.so \
                 ${libdir}/omxloaders/*${SOLIBS}"
 FILES_${PN}-staticdev += "${libdir}/bellagio/*.a \
                           ${libdir}/omxloaders/*.a"
 FILES_${PN}-dev += "${libdir}/bellagio/*.la \
-                    ${libdir}/bellagio/*${SOLIBSDEV} \
                     ${libdir}/omxloaders/*.la \
                     ${libdir}/omxloaders/*${SOLIBSDEV}"
 FILES_${PN}-dbg += "${libdir}/bellagio/.debug/ \
-- 
1.9.1


