Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 69BD477172
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174501"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:34 +0300
Message-Id: <acd2e9a7647c73d930528f7675b1197987f949be.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 16/37] oh-puzzles: Remove as we're using puzzles now
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:34 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../puzzles/files/oh-puzzles-owl-menu.patch        | 203 ---------------------
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |  73 --------
 2 files changed, 276 deletions(-)
 delete mode 100644 meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch
 delete mode 100644 meta/recipes-sato/puzzles/oh-puzzles_git.bb

diff --git a/meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch b/meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch
deleted file mode 100644
index 7e2c3ab..0000000
--- a/meta/recipes-sato/puzzles/files/oh-puzzles-owl-menu.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-This patch enable owl menu, which is hidden in the title bar to save space on
-small screen. It has not been used for a long time, rebase needed.
-
-Upstream-Status: Inappropriate [enable feature]
-
-Index: src/gtk.c
-===================================================================
---- src/gtk.c	(revision 22)
-+++ src/gtk.c	(working copy)
-@@ -28,6 +28,8 @@
- #include <gdk/gdkx.h>
- #include <gdk-pixbuf/gdk-pixbuf.h>
- 
-+#include <libowl/owlwindowmenu.h>
-+
- #include <librsvg/rsvg.h>
- 
- #include <X11/Xlib.h>
-@@ -1237,6 +1239,7 @@
-     }
- }
- 
-+#if 0
- static void
- add_widget (GtkUIManager *merge,
- 	    GtkWidget *widget,
-@@ -1247,10 +1250,11 @@
-     gtk_box_pack_start (box, widget, FALSE, FALSE, 0);
- 
-     toplevel = gtk_widget_get_toplevel (GTK_WIDGET (box));
--    gtk_widget_show_all (toplevel);
- }
-+#endif
- 
- static GtkActionEntry toplevel_actions[] = {
-+    { "Top", NULL, "" },
-     { "Game", NULL, N_("Game") },
-     { "Settings", NULL, N_("Settings") },
-     { "Help", NULL, N_("Help") },
-@@ -1303,11 +1307,13 @@
- 			frontend *fe)
- {
-     GString *xml;
-+    GError *error = NULL;
-     gboolean presets = FALSE;
-     GSList *radio_group = NULL;
-     int i;
- 
--    xml = g_string_new ("<ui><menubar><placeholder name=\"TypePlaceholder\">"
-+    xml = g_string_new ("<ui><menubar><menu name=\"TopMenu\" action=\"Top\">"
-+			"<placeholder name=\"TypePlaceholder\">"
- 			"<menu name=\"SettingsMenu\" action=\"Settings\">");
- 
-     for (i = 0; i < midend_num_presets(fe->me); i++) {
-@@ -1359,8 +1365,14 @@
- 			 "<menuitem name=\"CustomMenu\" action=\"Custom\"/>");
-     }
-     
--    g_string_append (xml, "</menu></placeholder></menubar></ui>");
--    gtk_ui_manager_add_ui_from_string (merge, xml->str, -1, NULL);
-+    g_string_append (xml, "</menu></placeholder></menu></menubar></ui>");
-+
-+    gtk_ui_manager_add_ui_from_string (merge, xml->str, -1, &error);
-+    if (error != NULL) {
-+	g_warning ("Error adding custom: %s", error->message);
-+	g_error_free (error);
-+    }
-+
-     g_string_free (xml, TRUE);
- }
- 
-@@ -1434,6 +1446,7 @@
- new_window(char *arg, char **error)
- {
-     frontend *fe;
-+    GError *err = NULL;
-     GtkBox *vbox;
-     GtkUIManager *merge;
-     GtkActionGroup *actions;
-@@ -1496,8 +1509,6 @@
-     gtk_window_add_accel_group(GTK_WINDOW(fe->window), fe->accelgroup);
- 
-     merge = gtk_ui_manager_new ();
--    g_signal_connect (G_OBJECT (merge), "add_widget",
--		      G_CALLBACK (add_widget), vbox);
- 
-     actions = gtk_action_group_new ("PuzzleActions");
-     gtk_action_group_add_actions (actions, toplevel_actions,
-@@ -1509,22 +1520,39 @@
- 
-     gtk_ui_manager_insert_action_group (merge, actions, 0);
-     
--    gtk_ui_manager_add_ui_from_file (merge, DATADIR "/oh-puzzles/ui/menu.xml", NULL);
-+    gtk_ui_manager_add_ui_from_file (merge, DATADIR "/oh-puzzles/ui/menu.xml", 
-+				     &err);
-+    if (err != NULL) {
-+	g_warning ("Error making UI: %s", err->message);
-+	g_error_free (err);
-+	err = NULL;
-+    }
- 
-     if (thegame.can_solve) {
--	    char *str = "<ui><menubar><menu name=\"GameMenu\" action=\"Game\">"
-+	char *str = "<ui><menubar><menu name=\"TopMenu\" action=\"Top\">"
-+	    "<menu name=\"GameMenu\" action=\"Game\">"
- 	    "<placeholder name=\"SolvePlaceholder\">"
- 	    "<separator name=\"SolveSep\"/>"
- 	    "<menuitem name=\"SolveMenu\" action=\"Solve\"/>"
--	    "</placeholder></menu></menubar></ui>";
-+	    "</placeholder></menu></menu></menubar></ui>";
- 
--	gtk_ui_manager_add_ui_from_string (merge, str, -1, NULL);
-+	gtk_ui_manager_add_ui_from_string (merge, str, -1, &err);
-+	if (err != NULL) {
-+	    g_warning ("Error adding solve. %s", err->message);
-+	    g_error_free (err);
-+	}
-     }
- 
-     if ((n = midend_num_presets(fe->me)) > 0 || thegame.can_configure) {
- 	generate_settings_menu (merge, actions, fe);
-     }
- 
-+    /* Do this so that the menu is packed now instead of in the idle loop */
-+    gtk_ui_manager_ensure_update (merge);
-+
-+    owl_set_window_menu_item (GTK_WINDOW (fe->window),
-+			      GTK_MENU_ITEM (gtk_ui_manager_get_widget (merge, "/menubar/TopMenu")));
-+    
-     setup_colours (fe);
-     setup_pixbufs (fe);
- 
-@@ -1572,7 +1600,7 @@
-                           GDK_BUTTON_RELEASE_MASK |
- 			  GDK_BUTTON_MOTION_MASK);
- 
--    /* The window is shown once the menubar has been added */
-+    gtk_widget_show_all (fe->window);
-     return fe;
- }
- 
-Index: src/menu.xml
-===================================================================
---- src/menu.xml	(revision 22)
-+++ src/menu.xml	(working copy)
-@@ -1,26 +1,25 @@
- <ui>
- <menubar>
--<menu name="GameMenu" action="Game">
--	<menuitem name="NewMenu" action="New"/>
--	<menuitem name="RestartMenu" action="Restart"/>
--<!--	<menuitem name="SpecificMenu" action="Specific"/> -->
--	<menuitem name="RandomMenu" action="Random"/>
--	<separator name="GameSep1"/>
--	<menuitem name="LoadMenu" action="Load"/>
--	<menuitem name="SaveMenu" action="Save"/>
--	<separator name="GameSep2"/>
--	<menuitem name="UndoMenu" action="Undo"/>
--	<menuitem name="RedoMenu" action="Redo"/>
--	<placeholder name="CopyPlaceholder"/>
--	<placeholder name="SolvePlaceholder"/>
--	<separator name="GameSep3"/>
--	<menuitem name="QuitMenu" action="Quit"/>
--</menu>
-+<menu name="TopMenu" action="Top">
-+	<menu name="GameMenu" action="Game">
-+		<menuitem name="NewMenu" action="New"/>
-+		<menuitem name="RestartMenu" action="Restart"/>
-+	<!--	<menuitem name="SpecificMenu" action="Specific"/> -->
-+		<menuitem name="RandomMenu" action="Random"/>
-+		<separator name="GameSep1"/>
-+		<menuitem name="LoadMenu" action="Load"/>
-+		<menuitem name="SaveMenu" action="Save"/>
-+		<separator name="GameSep2"/>
-+		<menuitem name="UndoMenu" action="Undo"/>
-+		<menuitem name="RedoMenu" action="Redo"/>
-+		<placeholder name="CopyPlaceholder"/>
-+		<placeholder name="SolvePlaceholder"/>
-+	</menu>
- 
--<placeholder name="TypePlaceholder"/>
--
--<menu name="HelpMenu" action="Help">
-+	<placeholder name="TypePlaceholder"/>
- 	<menuitem name="AboutMenu" action="About"/>
-+	<menuitem name="QuitMenu" action="Quit"/>
-+
- </menu>
- </menubar>
- </ui>
-Index: src/Makefile.am
-===================================================================
---- src/Makefile.am	(revision 22)
-+++ src/Makefile.am	(working copy)
-@@ -10,7 +10,7 @@
- 	lightup loopy map mines net netslide pattern pegs rect samegame \
- 	sixteen slant solo tents twiddle untangle
- 
--libpuzzles_la_LIBADD = $(PUZZLES_LIBS)
-+libpuzzles_la_LIBADD = $(PUZZLES_LIBS) -lowl
- libpuzzles_la_SOURCES = combi.c \
- 			configuration.c \
- 			drawing.c \
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
deleted file mode 100644
index dfa68a6..0000000
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ /dev/null
@@ -1,73 +0,0 @@
-SUMMARY = "Portable Puzzle Collection"
-HOMEPAGE = "http://o-hand.com/"
-BUGTRACKER = "http://bugzilla.yoctoproject.org/"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=f56ec6772dd1c7c367067bbea8ea1675 \
-                    file://src/tree234.h;endline=28;md5=a188e6d250430ca094a54a82f48472a7 \
-                    file://src/tree234.c;endline=28;md5=b4feb1976feebf8f1379093ed52f2945"
-
-SECTION = "x11"
-DEPENDS = "gtk+ gconf intltool-native librsvg gettext-native"
-
-# libowl requires x11 in DISTRO_FEATURES
-DEPENDS_append_poky = " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libowl', '', d)}"
-
-# Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRCREV = "92f1a20e4b72eed7a35b00984d9793b51dc2fb3b"
-PV = "0.2+git${SRCPV}"
-PR = "r10"
-
-SRC_URI = "git://git.yoctoproject.org/${BPN}"
-SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;striplevel=0 "
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig distro_features_check
-
-bindir = "/usr/games"
-
-EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
-
-do_install_append () {
-    install -d ${D}/${datadir}/applications/
-
-    cd ${D}/${prefix}/games
-    for prog in *; do
-	if [ -x $prog ]; then
-            # Convert prog to Title Case
-            title=$(echo $prog | sed 's/\(^\| \)./\U&/g')
-	    echo "making ${D}/${datadir}/applications/$prog.desktop"
-	    cat <<STOP > ${D}/${datadir}/applications/$prog.desktop
-[Desktop Entry]
-Name=$title
-Exec=${prefix}/games/$prog
-Icon=applications-games
-Terminal=false
-Type=Application
-Categories=Game;
-StartupNotify=true
-X-MB-SingleInstance=true
-Comment=Play $title.
-STOP
-        fi
-    done
-}
-
-PACKAGES += "${PN}-extra"
-RDEPENDS_${PN}-extra += "oh-puzzles"
-
-FILES_${PN} = "/usr/share/pixmaps /usr/share/oh-puzzles/"
-FILES_${PN}-extra = "/usr/games/ /usr/share/applications /etc/gconf/schemas"
-
-python __anonymous () {
-    var = bb.data.expand("FILES_${PN}", d, 1)
-    data = d.getVar(var, True)
-    for name in ("bridges", "fifteen", "inertia", "map", "samegame", "slant"):
-        data = data + " /usr/games/%s" % name
-        data = data + " /usr/share/applications/%s.desktop" % name
-        data = data + " /etc/gconf/schemas/%s.schemas" % name
-    d.setVar(var, data)
-}
-- 
2.1.4


