Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC7C6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 16:16:09 +0000 (UTC)
Received: by mail-wr0-f177.google.com with SMTP id q9so22761071wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 08:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=r8tNcNnguiSPAZJOENlkdIH1zhSK6LVGYhGN0N094iA=;
	b=ux0bV9Pwrb9NsT3nuvfCX5y2agteXRvQsHZxkWEEc9xPpUgauxs5ofwex+tqZSEHKN
	XytITp7iqX5nVC76MOJ9nZj2EKeRVKwJuK3r/rxCo90nH6HaENKemmEVxBZq4HKlVMaX
	09WM+2wLpDcjajsQ/gxsgNDDKOdqYzKrAWZQgRK1AI5hiqSuJdReDay8l6evoDvkSXVm
	L49Wg3H9HWDlcXNbW8cVtqVzh/mUDpN1itZ2uRUMvbJYCuA596vmXoY/tXtBbJISKWkq
	Qw/OL7sOLMx9PMOYPpF3J1J14zxg5AAULNa3AZ0V0AgI+gHY//AgktZ1DVPjjabgUL3Y
	F18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=r8tNcNnguiSPAZJOENlkdIH1zhSK6LVGYhGN0N094iA=;
	b=H+gqRPe3bdSwGWKRFJBGJOMojEDkkVT87EXiTiXAWagFXsEsf+nnDMhWzMUafqCgaC
	SZy5abewn1XiITyirwXFvKQikICMIOh/HQzHFXrAOwZaG+AyQFTb6EUsJpeQazIkdv/F
	mwHEc7H/kZL/OWKJulCxOfS0CtdZ57dCV2kTymjLfBjGKLH+S0I7FwVYVySMlj1iMvMD
	wNYkgqrmCUTUuJ/QJkm3j0345EgbRnK/dz4+LitzQdFt7ZRGOMM6igPJK0Eb6o0E2XHO
	4XoXBFIu6ONRUmkjAL8V9pR8/gD15b+gspYALJJEcvcHULGIdCwp/JREHvJjpjm6JkDd
	MbIg==
X-Gm-Message-State: AKGB3mKeTnnhpOvxdv11u51gIFfNiX9XgLVESdnax6iiUs7fu6EYEhnd
	Z2l3QneFV7p4CVNqz6mQlwdBGqDx
X-Google-Smtp-Source: ACJfBouOt+VMpNp0V0bFrDFJn9e5BoOVH37+vVZYRl+1H2R/wiY9V88jj3cavKyGBvBVeasnKd10Vw==
X-Received: by 10.223.185.85 with SMTP id b21mr8485575wrg.264.1513786570316;
	Wed, 20 Dec 2017 08:16:10 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r68sm7016947wmd.47.2017.12.20.08.16.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Dec 2017 08:16:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Dec 2017 16:16:06 +0000
Message-Id: <20171220161606.21351-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gstreamer: use a patch instead of sed to fix gtk-doc makefiles
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
X-List-Received-Date: Wed, 20 Dec 2017 16:16:10 -0000

seds can get stale without warning and repeated application can cause problems,
so move the gtk-doc seds into a patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../gstreamer/files/gtk-doc-tweaks.patch           | 25 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins.inc             | 16 +++-----------
 .../gstreamer/gstreamer1.0-rtsp-server.inc         | 15 +++----------
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 15 ++-----------
 4 files changed, 33 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch

diff --git a/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch b/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
new file mode 100644
index 00000000000..593d5bb043b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
@@ -0,0 +1,25 @@
+Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient
+binaries instead of libtool wrapper or running them directly.
+
+Also substitute a bogus plugin scanner, as trying to run the real one is causing
+issues during build on x86_64.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+--- a/common/gtk-doc.mak.orig	2017-12-20 12:43:20.586474397 +0000
++++ b/common/gtk-doc.mak	2017-12-20 12:45:20.758874995 +0000
+@@ -8,3 +8,3 @@
+ GTKDOC_LD = $(LIBTOOL) --tag=CC --mode=link $(CC) $(GTKDOC_DEPS_LIBS) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+-GTKDOC_RUN = $(LIBTOOL) --mode=execute
++GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
+ else
+@@ -12,3 +12,3 @@
+ GTKDOC_LD = $(CC) $(GTKDOC_DEPS_LIBS) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
+-GTKDOC_RUN =
++GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
+ endif
+@@ -99,2 +99,3 @@
+ 	    fi; \
++	    GST_PLUGIN_SCANNER_1_0="$(top_builddir)/libs/gst/helpers/gst-plugin-scanner-dummy" \
+ 	    GST_PLUGIN_SYSTEM_PATH_1_0=`cd $(top_builddir) && pwd`	\
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index c40d3989119..dab0ea3b1a6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -5,6 +5,8 @@ SECTION = "multimedia"
 
 DEPENDS = "gstreamer1.0 glib-2.0-native"
 
+SRC_URI_append = " file://gtk-doc-tweaks.patch"
+
 inherit autotools pkgconfig upstream-version-is-even gobject-introspection gtk-doc
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
@@ -34,19 +36,7 @@ delete_pkg_m4_file() {
 	rm -f "${S}/common/m4/gtk-doc.m4"
 }
 
-# gstreamer is not using system-wide makefiles (which we patch in gtkdoc recipe,
-# but its own custom ones, which we have to patch here
-patch_gtk_doc_makefiles() {
-        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
-        # instead of libtool wrapper or running them directly
-        # Also substitute a bogus plugin scanner, as trying to run the real one is causing issues during build on x86_64.
-        sed -i \
-           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
-           -e "s|\$(GTKDOC_EXTRA_ENVIRONMENT)|\$(GTKDOC_EXTRA_ENVIRONMENT) GST_PLUGIN_SCANNER_1_0=\$(top_builddir)/libs/gst/helpers/gst-plugin-scanner-dummy|" \
-           ${S}/common/gtk-doc*mak
-}
-
-do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
+do_configure[prefuncs] += " delete_pkg_m4_file"
 
 PACKAGES_DYNAMIC = "^${PN}-.*"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 68173ce7d94..a7476c5b8ac 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -9,7 +9,8 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
            file://0001-Don-t-hardcode-libtool-name-when-using-introspection.patch \
-           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch"
+           file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+           file://gtk-doc-tweaks.patch"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
@@ -24,17 +25,7 @@ delete_pkg_m4_file() {
         rm "${S}/common/m4/pkg.m4" || true
 }
 
-# gstreamer is not using system-wide makefiles (which we patch in gtkdoc recipe,
-# but its own custom ones, which we have to patch here
-patch_gtk_doc_makefiles() {
-        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
-        # instead of libtool wrapper or running them directly
-        sed -i \
-           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
-           ${S}/common/gtk-doc*mak
-}
-
-do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
+do_configure[prefuncs] += " delete_pkg_m4_file"
 
 # Needs to be disable due to a dependency on gstreamer-plugins introspection files
 EXTRA_OECONF_append_mips64 = " --disable-introspection "
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 329193486de..f523ef59f93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -16,6 +16,7 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 SRC_URI_append = " \
     file://0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch \
+    file://gtk-doc-tweaks.patch \
 "
 
 PACKAGECONFIG ??= ""
@@ -52,19 +53,7 @@ delete_pkg_m4_file() {
         rm -f "${S}/common/m4/gtk-doc.m4"
 }
 
-# gstreamer is not using system-wide makefiles (which we patch in gtkdoc recipe,
-# but its own custom ones, which we have to patch here
-patch_gtk_doc_makefiles() {
-        # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
-        # instead of libtool wrapper or running them directly
-        # Also substitute a bogus plugin scanner, as trying to run the real one is causing issues during build on x86_64.
-        sed -i \
-           -e "s|GTKDOC_RUN =.*|GTKDOC_RUN = \$(top_builddir)/gtkdoc-qemuwrapper|" \
-           -e "s|\$(GTKDOC_EXTRA_ENVIRONMENT)|\$(GTKDOC_EXTRA_ENVIRONMENT) GST_PLUGIN_SCANNER_1_0=\$(top_builddir)/libs/gst/helpers/gst-plugin-scanner-dummy|" \
-           ${S}/common/gtk-doc*mak
-}
-
-do_configure[prefuncs] += " delete_pkg_m4_file patch_gtk_doc_makefiles"
+do_configure[prefuncs] += "delete_pkg_m4_file"
 
 do_compile_prepend() {
         export GIR_EXTRA_LIBS_PATH="${B}/gst/.libs:${B}/libs/gst/base/.libs"
-- 
2.11.0


