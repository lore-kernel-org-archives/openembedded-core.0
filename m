Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 56386731D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727994"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:18 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:39 +0300
Message-Id: <0f2ff38af17202708f5174e65604ac74faaaa950.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 15/30] leafpad: Replace with L3afpad
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

L3afpad is a GTK+3 fork of leafpad.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      |  2 +-
 .../builder/files/builder_session.sh               |  4 +-
 meta/recipes-sato/l3afpad/l3afpad_git.bb           | 23 ++++++
 meta/recipes-sato/leafpad/files/leafpad.desktop    | 10 ---
 meta/recipes-sato/leafpad/files/owl-menu.patch     | 63 -----------------
 ...gtkprint-.c-Fix-security-formatting-issue.patch | 81 ----------------------
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      | 37 ----------
 .../packagegroups/packagegroup-core-x11-sato.bb    |  2 +-
 8 files changed, 27 insertions(+), 195 deletions(-)
 create mode 100644 meta/recipes-sato/l3afpad/l3afpad_git.bb
 delete mode 100644 meta/recipes-sato/leafpad/files/leafpad.desktop
 delete mode 100644 meta/recipes-sato/leafpad/files/owl-menu.patch
 delete mode 100644 meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch
 delete mode 100644 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 4e7fd4d..974664d 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -187,7 +187,7 @@ RDEPENDS_packagegroup-self-hosted-graphics = "\
     gtk-theme-clearlooks \
     xdg-utils \
     epiphany \
-    leafpad \
+    l3afpad \
     pcmanfm \
     vte \
     "
diff --git a/meta/recipes-graphics/builder/files/builder_session.sh b/meta/recipes-graphics/builder/files/builder_session.sh
index 001a033..4e509a7 100644
--- a/meta/recipes-graphics/builder/files/builder_session.sh
+++ b/meta/recipes-graphics/builder/files/builder_session.sh
@@ -23,8 +23,8 @@ if [ ! -d /home/builder/.local/share/applications ]; then
     xdg-mime default epiphany.desktop x-scheme-handler/https
     xdg-mime default epiphany.desktop text/html
 
-    #register text files with leafpad text editor
-    xdg-mime default leafpad.desktop text/plain
+    #register text files with l3afpad text editor
+    xdg-mime default l3afpad.desktop text/plain
 fi
 
 cd /home/builder/poky
diff --git a/meta/recipes-sato/l3afpad/l3afpad_git.bb b/meta/recipes-sato/l3afpad/l3afpad_git.bb
new file mode 100644
index 0000000..1e7c82f
--- /dev/null
+++ b/meta/recipes-sato/l3afpad/l3afpad_git.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Simple GTK+ Text Editor"
+HOMEPAGE = "https://github.com/stevenhoneyman/l3afpad"
+
+# Note that COPYING seems to mistakenly contain LGPLv2.1.
+# The source code is marked GPLv2+ and COPYING used to contain
+# that as well.
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://src/l3afpad.h;endline=20;md5=8848fd645cd45115d8cb47ca5c42a50e \
+                    file://src/utils.c;endline=20;md5=ae4792f69d3bb7b7ba91d582ba9b1a05"
+
+DEPENDS = "gtk+3 intltool-native gettext-native"
+
+PV = "0.8.18.1.11+git${SRCPV}"
+SRC_URI = "git://github.com/stevenhoneyman/l3afpad.git"
+SRCREV ="3cdccdc9505643e50f8208171d9eee5de11a42ff"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig distro_features_check
+
+EXTRA_OECONF = "--disable-emacs --disable-print"
+FILES_${PN} += "${datadir}/icons"
diff --git a/meta/recipes-sato/leafpad/files/leafpad.desktop b/meta/recipes-sato/leafpad/files/leafpad.desktop
deleted file mode 100644
index c7e2d5b..0000000
--- a/meta/recipes-sato/leafpad/files/leafpad.desktop
+++ /dev/null
@@ -1,10 +0,0 @@
-[Desktop Entry]
-Name=Notes
-Exec=/usr/bin/leafpad
-Comment=Text Editor
-Icon=accessories-text-editor
-Terminal=false
-Type=Application
-Categories=GTK;Utility;TextEditor;
-X-MB-SingleInstance=true
-StartupNotify=true
diff --git a/meta/recipes-sato/leafpad/files/owl-menu.patch b/meta/recipes-sato/leafpad/files/owl-menu.patch
deleted file mode 100644
index 2ebf74a..0000000
--- a/meta/recipes-sato/leafpad/files/owl-menu.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Upstream-Status: Inappropriate [enable feature]
-
---- tmp/src/menu.c.orig	2007-04-23 12:08:41.000000000 +0100
-+++ tmp/src/menu.c	2007-04-23 12:08:41.000000000 +0100
-@@ -152,7 +152,7 @@
- 	}
- 	
- 	accel_group = gtk_accel_group_new();
--	ifactory = gtk_item_factory_new(GTK_TYPE_MENU_BAR, "<main>", accel_group);
-+	ifactory = gtk_item_factory_new(GTK_TYPE_MENU, "<main>", accel_group);
- 	gtk_item_factory_set_translate_func(ifactory, menu_translate, NULL, NULL);
- 	gtk_item_factory_create_items(ifactory, nmenu_items, menu_items, NULL);
- 	gtk_window_add_accel_group(GTK_WINDOW(window), accel_group);
-
---- tmp/src/window.c.orig	2007-04-23 12:14:07.000000000 +0100
-+++ tmp/src/window.c	2007-04-23 12:14:07.000000000 +0100
-@@ -18,6 +18,8 @@
-  */
- 
- #include "leafpad.h"
-+#include <libowl/owlwindowmenu.h>
-+
- /*
- static void cb_scroll_event(GtkAdjustment *adj, GtkWidget *view)
- {
-@@ -52,7 +54,6 @@
- 	gtk_container_add(GTK_CONTAINER(window), vbox);
- 	
- 	menubar = create_menu_bar(window);
--	gtk_box_pack_start(GTK_BOX(vbox), menubar, FALSE, FALSE, 0);
- 	
- 	sw = gtk_scrolled_window_new(NULL, NULL);
- 	gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(sw),
-
---- tmp/src/main.c.orig	2007-04-23 12:15:03.000000000 +0100
-+++ tmp/src/main.c	2007-04-23 12:15:03.000000000 +0100
-@@ -244,6 +244,7 @@
- 	Conf *conf;
- 	GtkItemFactory *ifactory;
- 	gchar *stdin_data = NULL;
-+	GtkWidget *menu;
- 	
- 	bindtextdomain(PACKAGE, LOCALEDIR);
- 	bind_textdomain_codeset(PACKAGE, "UTF-8");
-@@ -293,7 +294,10 @@
- 		conf->autoindent);
- 	
- 	gtk_widget_show_all(pub->mw->window);
-+	owl_set_window_menu (GTK_WINDOW(pub->mw->window),
-+			     GTK_MENU(pub->mw->menubar));
-+	
- 	g_free(conf->fontname);
- 	g_free(conf);
- 	
-
---- tmp/src/Makefile.am.orig	2007-04-23 12:17:54.000000000 +0100
-+++ tmp/src/Makefile.am	2007-04-23 12:17:54.000000000 +0100
-@@ -27,4 +27,4 @@
- 	i18n.h
- 
- leafpad_CFLAGS  = $(GTK_CFLAGS) $(GNOMEPRINT_CFLAGS)
--leafpad_LDADD   = $(GTK_LIBS) $(INTLLIBS) $(GNOMEPRINT_LIBS)
-+leafpad_LDADD   = $(GTK_LIBS) $(INTLLIBS) $(GNOMEPRINT_LIBS) -lowl
diff --git a/meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch b/meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch
deleted file mode 100644
index cf2687f..0000000
--- a/meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 316ccb1733a6da726c0e7f0748e3e88ec459ca54 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
-Date: Fri, 13 May 2016 14:36:51 -0500
-Subject: [PATCH] src/{dialog,gtkprint}.c: Fix security formatting issues
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-../../../../../../../workspace/sources/leafpad/src/dialog.c: In
-unction
-'run_dialog_message':
-../../../../../../../workspace/sources/leafpad/src/dialog.c:39:3:
-rror:
-format not a string literal and no format arguments
-[-Werror=format-security]
-   str);
-   ^
-../../../../../../../workspace/sources/leafpad/src/dialog.c: In
-unction
-'create_dialog_message_question':
-../../../../../../../workspace/sources/leafpad/src/dialog.c:64:3:
-rror:
-format not a string literal and no format arguments
-[-Werror=format-security]
-   str);
-
-../../../../../../../workspace/sources/leafpad/src/gtkprint.c: In
-function 'create_error_dialog':
-../../../../../../../workspace/sources/leafpad/src/gtkprint.c:168:3:
-error: format not a string literal and no format arguments
-[-Werror=format-security]
-   message);
-
-[YOCTO #9546]
-
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
-Upstream-status: Pending
----
- src/dialog.c   | 4 ++--
- src/gtkprint.c | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/dialog.c b/src/dialog.c
-index 14b69d7..8c8f2da 100644
---- a/src/dialog.c
-+++ b/src/dialog.c
-@@ -36,7 +36,7 @@ void run_dialog_message(GtkWidget *window,
- 		GTK_DIALOG_DESTROY_WITH_PARENT,
- 		type,
- 		GTK_BUTTONS_NONE,
--		str);
-+		str, NULL);
- 	gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
- 	gtk_dialog_add_buttons(GTK_DIALOG(dialog),
- 		GTK_STOCK_OK, GTK_RESPONSE_CANCEL, NULL);
-@@ -61,7 +61,7 @@ GtkWidget *create_dialog_message_question(GtkWidget *window, gchar *message, ...
- 		GTK_DIALOG_DESTROY_WITH_PARENT,
- 		GTK_MESSAGE_QUESTION,
- 		GTK_BUTTONS_NONE,
--		str);
-+		str, NULL);
- 	gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
- 	gtk_dialog_add_buttons(GTK_DIALOG(dialog),
- 		GTK_STOCK_NO, GTK_RESPONSE_NO,
-diff --git a/src/gtkprint.c b/src/gtkprint.c
-index 3f39384..e2bb83a 100644
---- a/src/gtkprint.c
-+++ b/src/gtkprint.c
-@@ -165,7 +165,7 @@ static void create_error_dialog(GtkTextView *text_view, gchar *message)
- 		GTK_DIALOG_DESTROY_WITH_PARENT,
- 		GTK_MESSAGE_ERROR,
- 		GTK_BUTTONS_NONE,
--		message);
-+		message, NULL);
- 	gtk_window_set_resizable(GTK_WINDOW(dialog), FALSE);
- 	gtk_dialog_add_buttons(GTK_DIALOG(dialog),
- 		GTK_STOCK_OK, GTK_RESPONSE_CANCEL, NULL);
--- 
-2.1.4
-
diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
deleted file mode 100644
index e6a4b56..0000000
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "Simple GTK+ Text Editor"
-HOMEPAGE = "http://tarot.freeshell.org/leafpad/"
-
-LICENSE = "GPLv2 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/leafpad.h;endline=20;md5=d3d6a89f5e61e8b13bdea537511ba1fa \
-                    file://src/utils.c;endline=20;md5=0d2cc6584ba3202448bb274f62739571"
-
-DEPENDS = "gtk+ intltool-native libowl gettext-native"
-# The libowl requires x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
-           file://leafpad.desktop \
-           file://src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch \
-           "
-
-SRC_URI[md5sum] = "254a72fc67505e3aa52884c729cd7b97"
-SRC_URI[sha256sum] = "959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c"
-PR = "r2"
-
-SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "
-
-inherit autotools pkgconfig distro_features_check
-
-EXTRA_OECONF = " --enable-chooser --disable-emacs --disable-print"
-
-do_install_append () {
-        install -d ${D}/${datadir}
-        install -d ${D}/${datadir}/applications
-        install -m 0644 ${WORKDIR}/leafpad.desktop ${D}/${datadir}/applications
-}
-
-FILES_${PN} += "${datadir}/applications/leafpad.desktop"
-
-PACKAGES += "leafpad-stock-icons"
-FILES_leafpad-stock-icons = "${datadir}/icons/hicolor/"
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 234a23a..034fc75 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -47,7 +47,7 @@ WEB ?= ""
 
 SUMMARY_${PN}-apps = "Sato desktop - applications"
 RDEPENDS_${PN}-apps = "\
-    leafpad \
+    l3afpad \
     gst-player-bin \
     matchbox-terminal \
     sato-screenshot \
-- 
2.1.4


