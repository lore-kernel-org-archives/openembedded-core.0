Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tn3iW-0003rc-Ip
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 09:49:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Dec 2012 00:34:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266440712"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 00:34:09 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Dec 2012 10:34:26 +0200
Message-Id: <076896b6989230187ea8fe8e7c03a4c28f4bc568.1356337650.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
Subject: [PATCH 14/15] pcmanfm: upgrade to 1.1.0
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
X-List-Received-Date: Mon, 24 Dec 2012 08:49:00 -0000

pcmanfm_fix_for_automake_1.12.patch: removed
- problem not reprodicible anymore

owl-window-menu.patch: removed
- not needed anymore

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../pcmanfm/files/owl-window-menu.patch            | 81 ----------------------
 .../files/pcmanfm_fix_for_automake_1.12.patch      | 35 ----------
 .../{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb}        | 11 ++-
 3 files changed, 4 insertions(+), 123 deletions(-)
 delete mode 100644 meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
 delete mode 100644 meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
 rename meta/recipes-sato/pcmanfm/{pcmanfm_0.9.10.bb => pcmanfm_1.1.0.bb} (76%)

diff --git a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch b/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
deleted file mode 100644
index 88b154e..0000000
--- a/meta/recipes-sato/pcmanfm/files/owl-window-menu.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-0.9.7 use a new menu bar from gtk_ui_manager, so need a translation here to
-enable owl menu
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [enable feature]
-
-Index: pcmanfm-0.9.9/configure.ac
-===================================================================
---- pcmanfm-0.9.9.orig/configure.ac	2011-08-10 05:28:31.000000000 +0800
-+++ pcmanfm-0.9.9/configure.ac	2011-10-10 15:47:33.000000000 +0800
-@@ -70,6 +70,8 @@
- 
- gtk_modules="gtk+-2.0 >= 2.16.0"
- PKG_CHECK_MODULES(GTK, [$gtk_modules])
-+OWL_LIBS="-lowl"
-+GTK_LIBS="$GTK_LIBS $OWL_LIBS"
- AC_SUBST(GTK_CFLAGS)
- AC_SUBST(GTK_LIBS)
- 
-Index: pcmanfm-0.9.9/src/main-win.c
-===================================================================
---- pcmanfm-0.9.9.orig/src/main-win.c	2011-08-10 05:28:32.000000000 +0800
-+++ pcmanfm-0.9.9/src/main-win.c	2011-10-10 15:50:48.000000000 +0800
-@@ -37,6 +37,8 @@
- #include "pref.h"
- #include "tab-page.h"
- 
-+#include "libowl/owlwindowmenu.h"
-+
- static void fm_main_win_finalize              (GObject *object);
- G_DEFINE_TYPE(FmMainWin, fm_main_win, GTK_TYPE_WINDOW);
- 
-@@ -400,9 +402,27 @@
-     }
- }
- 
-+/* Transfer gtk_ui_manager menubar to gtk menubar */
-+static GtkWidget * ui_menubar_to_menu(GtkWidget *menubar)
-+{
-+    GtkWidget *main_menu;
-+    GList *iter;
-+
-+    main_menu = gtk_menu_new();
-+
-+    for ( iter = gtk_container_get_children(GTK_CONTAINER(menubar));
-+          iter;
-+          iter = g_list_next(iter) )
-+    {
-+        GtkWidget *menu = GTK_WIDGET(iter->data);
-+        gtk_widget_reparent(menu, main_menu);
-+    }
-+    return main_menu;
-+}
-+
- static void fm_main_win_init(FmMainWin *win)
- {
--    GtkWidget *vbox, *menubar, *toolitem, *btn;
-+    GtkWidget *vbox, *menubar, *owl_menubar, *toolitem, *btn;
-     GtkUIManager* ui;
-     GtkActionGroup* act_grp;
-     GtkAction* act;
-@@ -456,7 +476,6 @@
-     win->popup = gtk_ui_manager_get_widget(ui, "/popup");
-     gtk_menu_attach_to_widget(GTK_WIDGET(win->popup), win, NULL);
- 
--    gtk_box_pack_start( (GtkBox*)vbox, menubar, FALSE, TRUE, 0 );
-     gtk_box_pack_start( (GtkBox*)vbox, win->toolbar, FALSE, TRUE, 0 );
- 
-     /* load bookmarks menu */
-@@ -517,6 +536,10 @@
- 
-     gtk_container_add( (GtkContainer*)win, vbox );
-     gtk_widget_show_all(vbox);
-+
-+    owl_menubar = ui_menubar_to_menu(menubar);
-+    gtk_widget_show_all(owl_menubar);
-+    owl_set_window_menu(GTK_WINDOW(win), GTK_MENU(owl_menubar));
- }
- 
- 
diff --git a/meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch b/meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
deleted file mode 100644
index 1ad0ff5..0000000
--- a/meta/recipes-sato/pcmanfm/files/pcmanfm_fix_for_automake_1.12.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
-Fix these errors:
-| automake: warnings are treated as errors
-| data/ui/Makefile.am:18: warning: '%'-style pattern rules are a GNU make extension
-| src/Makefile.am:10: warning: compiling 'pcmanfm.c' with per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'
-| autoreconf: automake failed with exit status: 1
-| ERROR: autoreconf execution failed.
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@Intel.com>
-2012/07/09
-
-Index: pcmanfm-0.9.10/configure.ac
-===================================================================
---- pcmanfm-0.9.10.orig/configure.ac
-+++ pcmanfm-0.9.10/configure.ac
-@@ -13,6 +13,7 @@ AC_PROG_CC
- AM_PROG_LIBTOOL
- AM_PROG_CC_STDC
- AC_HEADER_STDC
-+AM_PROG_CC_C_O
- 
- # Checks for header files.
- AC_HEADER_STDC
-Index: pcmanfm-0.9.10/data/ui/Makefile.am
-===================================================================
---- pcmanfm-0.9.10.orig/data/ui/Makefile.am
-+++ pcmanfm-0.9.10/data/ui/Makefile.am
-@@ -15,6 +15,6 @@ EXTRA_DIST = \
- 	$(NULL)
- 
- # Purge GtkBuilder UI files
--%.ui: %.glade
-+.glade.ui:
- 	cp $< $@
- #	$(top_builddir)/src/xml-purge $@
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
similarity index 76%
rename from meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
rename to meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
index 1780764..bcfc9db 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.10.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.0.bb
@@ -11,7 +11,7 @@ SECTION = "x11"
 DEPENDS = "gtk+ startup-notification libfm"
 DEPENDS_append_poky = " libowl"
 
-PR = "r1"
+PR = "r0"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
 
@@ -20,13 +20,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
 	   file://gnome-fs-regular.png \
 	   file://gnome-mime-text-plain.png \
 	   file://emblem-symbolic-link.png \
-	   file://cross-compile-fix.patch \
-           file://pcmanfm_fix_for_automake_1.12.patch" 
+	   file://cross-compile-fix.patch"
 
-SRC_URI_append_poky = " file://owl-window-menu.patch"
-
-SRC_URI[md5sum] = "d34a3530a6c5dcd674d23021d71c3e95"
-SRC_URI[sha256sum] = "f133c6f207f719d1fc69fe8bc07b2de6883c6937ffa87448df42e3b1a30e0298"
+SRC_URI[md5sum] = "af0cff78690e658f3c06ceabf27bc71a"
+SRC_URI[sha256sum] = "1f6301f330ad648f3322708ec6c0f680a8695a9453932fe19653bab6731e5582"
 
 inherit autotools pkgconfig
 
-- 
1.7.11.7



