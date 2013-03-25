Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UKHNg-0003Bn-TI
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 01:05:12 +0100
Received: by mail-ea0-f176.google.com with SMTP id h10so2675660eaj.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 16:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=cPAG1qgLYkbsr1xyM9kTEniKqJW8C35n6Bspd9F+Y5E=;
	b=nACBizlVnWLcpttUFeca4qh57aw5Afjgtq8OlLtVfhBXRQPS7gyaJQ6XYyiBRp0fmA
	6Vvk8+Uiie6NBSeAlwt6dI9BfnPc5Kvkpoih4Umq291B0yEY69wm73l7uA0/lAaGt4ho
	koy6zyUoOvgktc8vtgYoZJ6uqXRO3n4aFXkb6Lzc7wI3jdVXm4N8tkdVtQKRpVeqzMF/
	1ERdwYQKkPlOgl+cn6dzQUECVLDd8IDxq7fVpMfAiiiIH0l/4izX2BP5QauRm3stebqa
	nKKsw6Uf47WMp2K3VaCU3x9R3yZIZJ3o9dQkqc144ukCAh+SNRIYrC2FknNu+21TMdVW
	U0kA==
X-Received: by 10.14.202.71 with SMTP id c47mr38572104eeo.39.1364255269844;
	Mon, 25 Mar 2013 16:47:49 -0700 (PDT)
Received: from localhost.localdomain (p4FDF18BD.dip.t-dialin.net.
	[79.223.24.189])
	by mx.google.com with ESMTPS id z45sm21912225eeu.10.2013.03.25.16.47.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 16:47:48 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 00:47:39 +0100
Message-Id: <1364255259-2920-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] gtk+: don't provide gtk-update-icon-cache-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 00:05:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fixes:
| ERROR: Multiple .bb files are due to be built which each provide virtual/gtk-update-icon-cache-native
| (/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
| virtual:native:/home/Superandy/data/oe-core/sources/openembedded-core/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb).
| This usually means one provides something the other doesn't and should.

gtk-update-icon-cache-native_3.4.4 provides a version working with gtk+. This
patch was tested for gnome-icon-theme and hicolor-icon-theme by:

1. building xfce/gtk+ (gtk3-less) image
2. checking for existing icon-theme.cache in rootfs
3. running image / open menus + test applications
4. executing 'gtk-update-icon-cache-2.0 --validate <both icon-themes-dirs>'
5. executing 'gtk-update-icon-cache-2.0 -f <both icon-themes-dirs>' + exact size checking

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc        |    8 --------
 meta/recipes-gnome/gtk+/gtk+_2.24.15.bb |    5 -----
 2 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
index f05838a..84edaf3 100644
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ b/meta/recipes-gnome/gtk+/gtk+.inc
@@ -10,8 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SECTION = "libs"
 
-PROVIDES_class-native = "virtual/gtk-update-icon-cache-native"
-
 X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
 DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native docbook-utils-native \
  libgcrypt cairo gdk-pixbuf"
@@ -81,12 +79,6 @@ do_install () {
 	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-2.0
 }
 
-do_install_append_class-native () {
-	# Ideally we'd use alternatives in the sysroot, but they don't work.
-	# As we know we don't have a native GTK+ 3 (yet), make a symlink instead.
-	ln -s gtk-update-icon-cache-2.0 ${D}${bindir}/gtk-update-icon-cache
-}
-
 SYSROOT_PREPROCESS_FUNCS += "gtk_sysroot_preprocess"
 
 gtk_sysroot_preprocess () {
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb
index 4e045e4..3a76393 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb
@@ -42,11 +42,6 @@ BBCLASSEXTEND = "native"
 RRECOMMENDS_${PN}_class-native = ""
 DEPENDS_class-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
 
-do_install_append_class-native () {
-	create_wrapper ${D}/${bindir}/gtk-update-icon-cache-2.0 \
-		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
-}
-
 python populate_packages_prepend () {
     gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
     immodules_root = os.path.join(gtk_libdir, 'immodules')
-- 
1.7.4.4



