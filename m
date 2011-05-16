Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5dj-0003RK-Jt
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:48:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 14:44:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="748097287"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2011 14:44:05 -0700
Message-Id: <3d2ea43c758f6b9a682c38a23a09885a2c70b451.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Sat, 14 May 2011 21:24:07 -0700
Date: Mon, 16 May 2011 14:44:05 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 05/14] mutter: Recipe Update for clutter 1.6 update
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
X-List-Received-Date: Mon, 16 May 2011 21:48:18 -0000

From: Saul Wold <sgw@linux.intel.com>

set DEFAULT_PREFERENCE to -1 for git recipe
Update from clutter-1.4 to clutter-1.6
add fix_CGL_TEXTURE_RECTANGLE_ARB.patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/mutter/mutter.inc            |    2 +-
 .../mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch     |   47 ++++++++++++++++++++
 meta/recipes-graphics/mutter/mutter_2.28.1.bb      |    9 +++-
 meta/recipes-graphics/mutter/mutter_git.bb         |    1 +
 4 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch

diff --git a/meta/recipes-graphics/mutter/mutter.inc b/meta/recipes-graphics/mutter/mutter.inc
index 60ceed4..d87c30e 100644
--- a/meta/recipes-graphics/mutter/mutter.inc
+++ b/meta/recipes-graphics/mutter/mutter.inc
@@ -1,7 +1,7 @@
 SECTION = "x11/wm"
 DESCRIPTION = "Metacity is the boring window manager for the adult in you. Mutter is metacity + clutter."
 LICENSE = "GPLv2"
-DEPENDS = "startup-notification gtk+ gconf clutter-1.4 gdk-pixbuf-native intltool glib-2.0-native"
+DEPENDS = "startup-notification gtk+ gconf clutter-1.6 gdk-pixbuf-native intltool glib-2.0-native"
 # gobject-introspection
 inherit gnome update-alternatives
 
diff --git a/meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch b/meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch
new file mode 100644
index 0000000..13197e5
--- /dev/null
+++ b/meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch
@@ -0,0 +1,47 @@
+Update the usage of CGL_TEXTURE_RECTANGLE_ARB to GL_TEXTURE_RECTANGLE_ARB
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: mutter-2.28.1_0.0/src/compositor/mutter-shaped-texture.c
+===================================================================
+--- mutter-2.28.1_0.0.orig/src/compositor/mutter-shaped-texture.c
++++ mutter-2.28.1_0.0/src/compositor/mutter-shaped-texture.c
+@@ -151,7 +151,7 @@ mutter_shaped_texture_dirty_mask (Mutter
+       cogl_texture_get_gl_texture (priv->mask_texture,
+                                    &mask_gl_tex, &mask_gl_target);
+ 
+-      if (mask_gl_target == CGL_TEXTURE_RECTANGLE_ARB)
++      if (mask_gl_target == GL_TEXTURE_RECTANGLE_ARB)
+         glDeleteTextures (1, &mask_gl_tex);
+ 
+       cogl_texture_unref (priv->mask_texture);
+@@ -214,23 +214,23 @@ mutter_shaped_texture_ensure_mask (Mutte
+ 
+       cogl_texture_get_gl_texture (paint_tex, NULL, &paint_gl_target);
+ 
+-      if (paint_gl_target == CGL_TEXTURE_RECTANGLE_ARB)
++      if (paint_gl_target == GL_TEXTURE_RECTANGLE_ARB)
+         {
+           GLuint tex;
+ 
+           glGenTextures (1, &tex);
+-          glBindTexture (CGL_TEXTURE_RECTANGLE_ARB, tex);
++          glBindTexture (GL_TEXTURE_RECTANGLE_ARB, tex);
+           glPixelStorei (GL_UNPACK_ROW_LENGTH, tex_width);
+           glPixelStorei (GL_UNPACK_ALIGNMENT, 1);
+           glPixelStorei (GL_UNPACK_SKIP_ROWS, 0);
+           glPixelStorei (GL_UNPACK_SKIP_PIXELS, 0);
+-          glTexImage2D (CGL_TEXTURE_RECTANGLE_ARB, 0,
++          glTexImage2D (GL_TEXTURE_RECTANGLE_ARB, 0,
+                         GL_ALPHA, tex_width, tex_height,
+                         0, GL_ALPHA, GL_UNSIGNED_BYTE, mask_data);
+ 
+           priv->mask_texture
+             = cogl_texture_new_from_foreign (tex,
+-                                             CGL_TEXTURE_RECTANGLE_ARB,
++                                             GL_TEXTURE_RECTANGLE_ARB,
+                                              tex_width, tex_height,
+                                              0, 0,
+                                              COGL_PIXEL_FORMAT_A_8);
diff --git a/meta/recipes-graphics/mutter/mutter_2.28.1.bb b/meta/recipes-graphics/mutter/mutter_2.28.1.bb
index e4c185a..50f2647 100644
--- a/meta/recipes-graphics/mutter/mutter_2.28.1.bb
+++ b/meta/recipes-graphics/mutter/mutter_2.28.1.bb
@@ -1,11 +1,14 @@
 require mutter.inc
 
+PR = "r1"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://download.moblin.org/sources/mutter/2.28/mutter-2.28.1_0.0.tar.bz2 \
-           file://nodocs.patch;patch=1 \
-           file://nozenity.patch;patch=1 \
-           file://fix_pkgconfig.patch;patch=1 \
+           file://nodocs.patch \
+           file://nozenity.patch \
+           file://fix_pkgconfig.patch \
+           file://fix_CGL_TEXTURE_RECTANGLE_ARB.patch \
            "
 
 S = "${WORKDIR}/mutter-2.28.1_0.0"
diff --git a/meta/recipes-graphics/mutter/mutter_git.bb b/meta/recipes-graphics/mutter/mutter_git.bb
index 8d308f1..c3ba32e 100644
--- a/meta/recipes-graphics/mutter/mutter_git.bb
+++ b/meta/recipes-graphics/mutter/mutter_git.bb
@@ -18,3 +18,4 @@ SRC_URI = "git://git.moblin.org/mutter.git;protocol=git;branch=master \
            "
 S = "${WORKDIR}/git"
 
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.1.1



