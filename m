Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id DBF8A608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 00:56:42 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jul 2013 02:56:36 +0200
Message-Id: <1373504197-9550-2-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 2/3] cogl-1.0: make building cogl-pango optional
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
X-List-Received-Date: Thu, 11 Jul 2013 00:56:43 -0000

Add a 'cogl-pango' PACKAGECONFIG option and enable it by default.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index 8400668..c0d410e 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -8,7 +8,7 @@ SRC_URI += "file://cogl_fixed_mul-constraint.patch \
 
 inherit clutter
 
-DEPENDS = "pango glib-2.0 gdk-pixbuf"
+DEPENDS = "glib-2.0 gdk-pixbuf"
 PACKAGES =+ "${PN}-examples \
              libcogl libcogl-dev \
              libcogl-gles2 libcogl-gles2-dev \
@@ -34,6 +34,8 @@ EXTRA_OECONF += "--disable-introspection	\
 	       	 --disable-gles1		\
 	    	"
 
+PACKAGECONFIG[cogl-pango] = "--enable-cogl-pango,--disable-cogl-pango,pango"
+
 # GL flavours
 PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,${EDEPENDS_GL},${ERDEPENDS_GL}"
 PACKAGECONFIG[gles2] = "--enable-gles2,--disable-gles2,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
@@ -52,7 +54,7 @@ PACKAGECONFIG[wayland-server] = "--enable-wayland-egl-server,--disable-wayland-e
 
 # Respect the DISTRO_FEATURES to pull in GLX or Wayland as appropriate by
 # default.
-PACKAGECONFIG ??= "gl \
+PACKAGECONFIG ??= "cogl-pango gl \
                    ${@base_contains('DISTRO_FEATURES', 'wayland', 'egl-wayland', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'x11', 'glx', '', d)}"
 
-- 
1.8.1.2


