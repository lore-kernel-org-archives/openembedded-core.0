Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id C9F8E6B00A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 00:56:44 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 02:56:35 +0200
Message-Id: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH 1/3] cogl-1.0: put each library into its own package
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
X-List-Received-Date: Thu, 11 Jul 2013 00:56:45 -0000

This allows to install cogl-gles2 and cogl-pango only when needed and
enables Debian package renaming. This stops cogl-pango from dragging
in unwanted runtime dependencies, if cogl-pango isn't used.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 55eb003..8400668 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -9,7 +9,10 @@ SRC_URI += "file://cogl_fixed_mul-constraint.patch \
 inherit clutter
 
 DEPENDS = "pango glib-2.0 gdk-pixbuf"
-PACKAGES =+ "${PN}-examples"
+PACKAGES =+ "${PN}-examples \
+             libcogl libcogl-dev \
+             libcogl-gles2 libcogl-gles2-dev \
+             libcogl-pango libcogl-pango-dev"
 AUTOTOOLS_AUXDIR = "${S}/build"
 
 # Extra DEPENDS for PACKAGECONFIG
@@ -54,3 +57,25 @@ PACKAGECONFIG ??= "gl \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'glx', '', d)}"
 
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
+FILES_libcogl = "${libdir}/libcogl${SOLIBS}"
+FILES_libcogl-dev = "${includedir}/cogl/cogl \
+                     ${libdir}/libcogl${SOLIBSDEV} \
+                     ${libdir}/libcogl.la \
+                     ${libdir}/pkgconfig/cogl-1.0.pc \
+                     ${libdir}/pkgconfig/cogl-2.0-experimental.pc \
+                     ${libdir}/pkgconfig/cogl-gl-1.0.pc"
+FILES_libcogl-gles2 = "${libdir}/libcogl-gles2${SOLIBS}"
+FILES_libcogl-gles2-dev = "${includedir}/cogl/cogl-gles2 \
+                           ${libdir}/libcogl-gles2${SOLIBSDEV} \
+                           ${libdir}/libcogl-gles2.la \
+                           ${libdir}/pkgconfig/cogl-gles2-experimental.pc"
+FILES_libcogl-pango = "${libdir}/libcogl-pango${SOLIBS}"
+FILES_libcogl-pango-dev = "${includedir}/cogl/cogl-pango \
+                           ${libdir}/libcogl-pango${SOLIBSDEV} \
+                           ${libdir}/libcogl-pango.la \
+                           ${libdir}/pkgconfig/cogl-pango-1.0.pc"
+
+# For backwards compatibility after Debian-renaming
+RPROVIDES_libcogl = "cogl-1.0"
+RCONFLICTS_libcogl = "cogl-1.0"
+RREPLACES_libcogl = "cogl-1.0"
-- 
1.8.1.2


