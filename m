Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gthomas@mail.chez-thomas.org>) id 1SDGey-0002XX-Dg
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 16:49:08 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 996)
	id E6316F811D9; Thu, 29 Mar 2012 08:40:05 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:40:04 -0600
Message-Id: <1333032004-16287-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] gstreamer: Provide easy way to enable runtime debugging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2012 14:49:08 -0000

The gstreamer framework has a very useful debugging setup which is
essential for debugging pipelines and plugins.  This patch makes
it simple to enable this (disabled by default).  To enable debugging,
just add this line to local.conf
  GSTREAMER_DEBUG = "--enable-debug"

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    3 ++-
 meta/recipes-multimedia/gstreamer/gst-fluendo.inc  |    3 ++-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    3 ++-
 .../gstreamer/gstreamer_0.10.36.bb                 |    3 ++-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
index 5ee5066..92cd349 100644
--- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
@@ -25,7 +25,8 @@ SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def18
 
 PR = "r1"
 
-EXTRA_OECONF = "--with-ffmpeg-extra-configure=\"--target-os=linux\" "
+GSTREAMER_DEBUG ?= "--disable-debug"
+EXTRA_OECONF = "--with-ffmpeg-extra-configure=\"--target-os=linux\" ${GSTREAMER_DEBUG}"
 
 # yasm not found, use --disable-yasm for a crippled build for libav
 EXTRA_OECONF_append_x86-64 = " --disable-yasm "
diff --git a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
index 8b24cf7..b2c7eea 100644
--- a/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-fluendo.inc
@@ -11,4 +11,5 @@ FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la ${libdir}/gstreamer-0.10/*.a"
 
-EXTRA_OECONF = "--disable-debug --disable-valgrind"
+GSTREAMER_DEBUG ?= "--disable-debug"
+EXTRA_OECONF = "${GSTREAMER_DEBUG} --disable-valgrind"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index f11a4af..ccb81b3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -10,7 +10,8 @@ FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
 
-EXTRA_OECONF = "--disable-valgrind --disable-debug --disable-examples "
+GSTREAMER_DEBUG ?= "--disable-debug"
+EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_DEBUG} --disable-examples "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index 3c03c0d..278c20e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -20,7 +20,8 @@ SRC_URI[sha256sum] = "e556a529e0a8cf1cd0afd0cab2af5488c9524e7c3f409de29b5d82bb41
 
 inherit autotools pkgconfig gettext
 
-EXTRA_OECONF = "--disable-docs-build --disable-dependency-tracking --with-check=no --disable-examples --disable-tests --disable-valgrind --disable-debug"
+GSTREAMER_DEBUG ?= "--disable-debug"
+EXTRA_OECONF = "--disable-docs-build --disable-dependency-tracking --with-check=no --disable-examples --disable-tests --disable-valgrind ${GSTREAMER_DEBUG}"
 
 #do_compile_prepend () {
 #	mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
-- 
1.7.7.6



