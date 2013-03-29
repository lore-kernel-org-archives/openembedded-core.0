Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1ULgz8-0004Wy-Ns
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Mar 2013 22:37:18 +0100
Received: by mail-ea0-f172.google.com with SMTP id z7so372256eaf.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2013 14:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=MLnYhxR0OZMBuQMsytna8QOByELHCduVBf1mAZ6Jg6Q=;
	b=eS2IvDFAqhxzOv+d2u61Yv5dwfxR2T0yfQj5B9K3xswRthsCeYGoacLC8OosWV0fgU
	fREnu4LssTyV7fdyr++QqFyeifDzDXcMKM+3eEc7KPTz/CAl0A/KKAaFGn0q0ay0/i9l
	n8WoSn4hJCqKnvoBSml6ZabuuJMVG73mZG/OOKbz+pHvu51d7z5Qz3L67xM0yJcTEnIe
	OvP9AhNtxY+0w2obmkSELx2/JhltDBaPgAMcSsdI8+A/WvdgvyyXC4LnICclHBvYcDte
	5VvUYtZtKz10dMStk9pWfSFDVu3jz8CfhiuCArP/KKs/tl6mPXSDIOyn3UDTmOI5Mv6K
	uDXQ==
X-Received: by 10.14.175.71 with SMTP id y47mr11597439eel.18.1364592014471;
	Fri, 29 Mar 2013 14:20:14 -0700 (PDT)
Received: from localhost.localdomain (p4FDF04AD.dip.t-dialin.net.
	[79.223.4.173])
	by mx.google.com with ESMTPS id f47sm6366494eep.13.2013.03.29.14.20.13
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 29 Mar 2013 14:20:13 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Mar 2013 22:19:57 +0100
Message-Id: <1364592001-3562-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
References: <1364592001-3562-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] gtk+: don't provide native build
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
X-List-Received-Date: Fri, 29 Mar 2013 21:37:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The only part required from native build is gtk-update-icon-cache. This is
provided by gtk-update-icon-cache-native_3.4.4. This version works properly
with gtk+. The patch was tested for gnome-icon-theme and hicolor-icon-theme by:

1. building xfce/gtk+ (gtk3-less) image
2. checking for existing icon-theme.cache in rootfs
3. running image / open menus + test applications
4. executing 'gtk-update-icon-cache-2.0 --validate <both icon-themes-dirs>'
5. executing 'gtk-update-icon-cache-2.0 -f <both icon-themes-dirs>' + exact size checking

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc        |    8 --------
 meta/recipes-gnome/gtk+/gtk+_2.24.15.bb |   10 +---------
 2 files changed, 1 insertions(+), 17 deletions(-)

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
index 4e045e4..02d66f8 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.15.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://download.gnome.org/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
 #        file://combo-arrow-size.patch;striplevel=0
 #            file://configurefix.patch
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "68f034fb4f68086790d7488cf00e71c8"
 SRC_URI[sha256sum] = "d7e1c6d6ae6baa48c88441fe52b73b0fb6008763644867d59b049bafb0cf771b"
@@ -38,14 +38,6 @@ EXTRA_OECONF = "--without-libtiff --without-libjasper --enable-xkb --disable-gli
 LIBV = "2.10.0"
 
 PACKAGES_DYNAMIC += "^gtk-immodule-.* ^gtk-printbackend-.*"
-BBCLASSEXTEND = "native"
-RRECOMMENDS_${PN}_class-native = ""
-DEPENDS_class-native = "glib-2.0-native atk-native pango-native cairo-native gdk-pixbuf-native"
-
-do_install_append_class-native () {
-	create_wrapper ${D}/${bindir}/gtk-update-icon-cache-2.0 \
-		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/${LIBV}/loaders.cache
-}
 
 python populate_packages_prepend () {
     gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
-- 
1.7.4.4



