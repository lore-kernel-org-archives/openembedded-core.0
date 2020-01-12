Return-Path: <crg7475@mailbox.org>
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	by mail.openembedded.org (Postfix) with ESMTP id AF1DA6C108
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:19 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47wddw3dgRzKmf3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837618; bh=Qylm3TWFaljb1Me
	I5fpU5xPot0CGVkG35fhhkYezdqo=; b=DR2Mz79JeWDHCqeCwhEfT9T9cVTzDQ0
	aPtDqLuu3MclttBwjNhvVy4eJSQVVclZ5rEQIsmVvyv7ephb6TVunlEQmLe3DiWr
	jRPLusoDhAw8McFMerHZagdwDjopdtENDGbvVMogJr54HZVuetEMSuCu3j/x7FN2
	FeawAe5Cji4dWitQuSkGR9yfAj+NdrSY7Zl319xx8i+Kz7b7Rqd171ToPQ/Ei7n9
	iupNXXD/j118jaF5ORIYCQ2xn4rXaLbSJ0EYqscYoNrRd3iSeLO7a+l80Fb1UuJt
	xIZ+oDo3Zh29zl2XW4pJg12rhuTvWremkHpScoCGbYF0MnLi5gFAA4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=XwlvvdSQ77ax4H0GJ5FUio6VvBE49DfTmsxqIjEPdcc=;
	b=N77SrHFbpEvnkTqaydIErPJCFXnmSeRkLwmrkHRkQnIlBkcrF4ad/6jpmrRQQk1cGzamFk
	6GmwLOKaEJaMmBHegYK3Hgav+rzQAKj5UAp2na/cMTHVsqeYYLBddPH3run6HAUVJ1rhzF
	iByASVv0izJh2Pz/pJwpGAbJ9JEUNanuSAFyAakWm1AfTIDa6b5mgjUiIpK9TcHdbr6Fn8
	3xr+yntnIZz8/MOT3ZjFX/9A74u9lISP8tBvVwbl27QJtxy/1so723h7ngcPRq0Kru332H
	VKZe6K9p3wbciOjKtW5heYgSTDC75eIs2t1eA8Mp6U0djw4h6uDq8YRtRxzCbg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
	(amavisd-new, port 10030) with ESMTP id J4FW5dCTKvE4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:18 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:52 +0100
Message-Id: <20200112135954.23868-10-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 10/12] gstreamer1.0-rtsp-server: Transition to meson based build
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:20 -0000

* 0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch is a
  fix for GIR support in the meson.build file.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...even-when-cross-compiling-if-introsp.patch | 36 +++++++++++++++++++
 .../gstreamer1.0-rtsp-server_1.16.1.bb        | 23 ++++++------
 2 files changed, 46 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
new file mode 100644
index 0000000000..6962a50d6e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
@@ -0,0 +1,36 @@
+From 95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Fri, 18 Oct 2019 00:42:12 +0100
+Subject: [PATCH] meson: build gir even when cross-compiling if introspection
+ was enabled explicitly
+
+This can be made to work in certain circumstances when
+cross-compiling, so default to not building g-i stuff
+when cross-compiling, but allow it if introspection was
+enabled explicitly via -Dintrospection=enabled.
+
+See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
+
+Upstream-Status: Backport [95ce953e34cd0e9f5d42ce7900a9572e7bc8ca47]
+
+Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index e1e3b1d..3f45f0e 100644
+--- a/meson.build
++++ b/meson.build
+@@ -173,7 +173,7 @@ endif
+ 
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+ gnome = import('gnome')
+-build_gir = gir.found() and not meson.is_cross_build()
++build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
+ gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
+     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
+     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
index 45302ef4f6..deac5a9664 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.1.bb
@@ -9,8 +9,7 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
-           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
-           file://gtk-doc-tweaks.patch \
+           file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
            "
 
 SRC_URI[md5sum] = "380d6a42e856c32fcefa508ad57129e0"
@@ -18,17 +17,15 @@ SRC_URI[sha256sum] = "b0abacad2f86f60d63781d2b24443c5668733e8b08664bbef94124906d
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
+inherit meson pkgconfig upstream-version-is-even gobject-introspection
 
-EXTRA_OECONF = "--disable-examples --disable-tests"
+EXTRA_OEMESON += " \
+    -Dexamples=disabled \
+    -Dtests=disabled \
+"
 
-# Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
-LIBV = "1.0"
-require gst-plugins-package.inc
-
-delete_pkg_m4_file() {
-        # This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
-        rm "${S}/common/m4/pkg.m4" || true
-}
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
 
-do_configure[prefuncs] += " delete_pkg_m4_file"
+# Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
+require gstreamer1.0-plugins-packaging.inc
-- 
2.17.1


