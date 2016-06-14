Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 09C6B73178
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:15:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 14 Jun 2016 01:15:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718727829"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 01:15:09 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:31 +0300
Message-Id: <0b02da59df3ec9889d9559644e332b232db8475e.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
References: <cab121fcc6b904939f6187832ba9b48b3d5fe53f.1465891164.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465891164.git.jussi.kukkonen@intel.com>
References: <cover.1465891164.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 07/30] connman-gnome: Add patch to port to Gtk+3
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
X-List-Received-Date: Tue, 14 Jun 2016 08:15:09 -0000

Upstream is not really active anymore: patch the Gtk+3 upgrade
in for now (long term solution is to change to another UI).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../connman/connman-gnome/0001-Port-to-Gtk3.patch  | 277 +++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |   5 +-
 2 files changed, 280 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch

diff --git a/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
new file mode 100644
index 0000000..c93e9b4
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
@@ -0,0 +1,277 @@
+From a59b0fac02e74a971ac3f08bf28c17ce361a9526 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 2 Mar 2016 15:47:49 +0200
+Subject: [PATCH] Port to Gtk3
+
+Some unused (or not useful) code was removed, functionality should stay
+the same.
+
+Code still contains quite a few uses of deprecated API.
+
+Upstream-Status: Submitted
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ applet/agent.c        |  3 +--
+ applet/main.c         | 43 -------------------------------------------
+ applet/status.c       |  8 --------
+ configure.ac          |  3 +--
+ properties/ethernet.c | 14 +++++++-------
+ properties/main.c     |  2 +-
+ properties/wifi.c     | 12 ++++++------
+ 7 files changed, 16 insertions(+), 69 deletions(-)
+
+diff --git a/applet/agent.c b/applet/agent.c
+index 65bed08..04fe86a 100644
+--- a/applet/agent.c
++++ b/applet/agent.c
+@@ -126,7 +126,6 @@ static void request_input_dialog(GHashTable *request,
+ 	gtk_window_set_position(GTK_WINDOW(dialog), GTK_WIN_POS_CENTER);
+ 	gtk_window_set_keep_above(GTK_WINDOW(dialog), TRUE);
+ 	gtk_window_set_urgency_hint(GTK_WINDOW(dialog), TRUE);
+-	gtk_dialog_set_has_separator(GTK_DIALOG(dialog), FALSE);
+ 	input->dialog = dialog;
+ 
+ 	gtk_dialog_add_button(GTK_DIALOG(dialog),
+@@ -139,7 +138,7 @@ static void request_input_dialog(GHashTable *request,
+ 	gtk_table_set_row_spacings(GTK_TABLE(table), 4);
+ 	gtk_table_set_col_spacings(GTK_TABLE(table), 20);
+ 	gtk_container_set_border_width(GTK_CONTAINER(table), 12);
+-	gtk_container_add(GTK_CONTAINER(GTK_DIALOG(dialog)->vbox), table);
++	gtk_container_add(GTK_CONTAINER(gtk_dialog_get_content_area (GTK_DIALOG(dialog))), table);
+ 
+ 	label = gtk_label_new(_("Please provide some network information:"));
+ 	gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.0);
+diff --git a/applet/main.c b/applet/main.c
+index f12d371..cd16285 100644
+--- a/applet/main.c
++++ b/applet/main.c
+@@ -157,46 +157,6 @@ static void name_owner_changed(DBusGProxy *proxy, const char *name,
+ 	}
+ }
+ 
+-static void open_uri(GtkWindow *parent, const char *uri)
+-{
+-	GtkWidget *dialog;
+-	GdkScreen *screen;
+-	GError *error = NULL;
+-	gchar *cmdline;
+-
+-	screen = gtk_window_get_screen(parent);
+-
+-	cmdline = g_strconcat("xdg-open ", uri, NULL);
+-
+-	if (gdk_spawn_command_line_on_screen(screen,
+-				cmdline, &error) == FALSE) {
+-		dialog = gtk_message_dialog_new(parent,
+-				GTK_DIALOG_DESTROY_WITH_PARENT, GTK_MESSAGE_ERROR,
+-				GTK_BUTTONS_CLOSE, "%s", error->message);
+-		gtk_dialog_run(GTK_DIALOG(dialog));
+-		gtk_widget_destroy(dialog);
+-		g_error_free(error);
+-	}
+-
+-	g_free(cmdline);
+-}
+-
+-static void about_url_hook(GtkAboutDialog *dialog,
+-				const gchar *url, gpointer data)
+-{
+-	open_uri(GTK_WINDOW(dialog), url);
+-}
+-
+-static void about_email_hook(GtkAboutDialog *dialog,
+-				const gchar *email, gpointer data)
+-{
+-	gchar *uri;
+-
+-	uri = g_strconcat("mailto:", email, NULL);
+-	open_uri(GTK_WINDOW(dialog), uri);
+-	g_free(uri);
+-}
+-
+ static void about_callback(GtkWidget *item, gpointer user_data)
+ {
+ 	const gchar *authors[] = {
+@@ -204,9 +164,6 @@ static void about_callback(GtkWidget *item, gpointer user_data)
+ 		NULL
+ 	};
+ 
+-	gtk_about_dialog_set_url_hook(about_url_hook, NULL, NULL);
+-	gtk_about_dialog_set_email_hook(about_email_hook, NULL, NULL);
+-
+ 	gtk_show_about_dialog(NULL, "version", VERSION,
+ 			"copyright", "Copyright \xc2\xa9 2008 Intel Corporation",
+ 			"comments", _("A connection manager for the GNOME desktop"),
+diff --git a/applet/status.c b/applet/status.c
+index aed6f1e..015ff29 100644
+--- a/applet/status.c
++++ b/applet/status.c
+@@ -102,8 +102,6 @@ static void icon_animation_start(IconAnimation *animation,
+ {
+ 	available = TRUE;
+ 
+-	gtk_status_icon_set_tooltip(statusicon, NULL);
+-
+ 	animation->start = start;
+ 	animation->end = (end == 0) ? animation->count - 1 : end;
+ 
+@@ -120,8 +118,6 @@ static void icon_animation_stop(IconAnimation *animation)
+ {
+ 	available = TRUE;
+ 
+-	gtk_status_icon_set_tooltip(statusicon, NULL);
+-
+ 	if (animation->id > 0)
+ 		g_source_remove(animation->id);
+ 
+@@ -251,8 +247,6 @@ void status_unavailable(void)
+ 	available = FALSE;
+ 
+ 	gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_notifier);
+-	gtk_status_icon_set_tooltip(statusicon,
+-				"Connection Manager daemon is not running");
+ 
+ 	gtk_status_icon_set_visible(statusicon, TRUE);
+ }
+@@ -299,7 +293,6 @@ static void set_ready(gint signal)
+ 
+ 	if (signal < 0) {
+ 		gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_wired);
+-		gtk_status_icon_set_tooltip(statusicon, NULL);
+ 		return;
+ 	}
+ 
+@@ -311,7 +304,6 @@ static void set_ready(gint signal)
+ 		index = 4;
+ 
+ 	gtk_status_icon_set_from_pixbuf(statusicon, pixbuf_signal[index]);
+-	gtk_status_icon_set_tooltip(statusicon, NULL);
+ }
+ 
+ struct timeout_data {
+diff --git a/configure.ac b/configure.ac
+index b972e07..a4dad5d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -55,8 +55,7 @@ AC_SUBST(DBUS_LIBS)
+ DBUS_BINDING_TOOL="dbus-binding-tool"
+ AC_SUBST(DBUS_BINDING_TOOL)
+ 
+-PKG_CHECK_MODULES(GTK, gtk+-2.0 >= 2.8, dummy=yes,
+-				AC_MSG_ERROR(gtk+ >= 2.8 is required))
++PKG_CHECK_MODULES(GTK, gtk+-3.0)
+ AC_SUBST(GTK_CFLAGS)
+ AC_SUBST(GTK_LIBS)
+ 
+diff --git a/properties/ethernet.c b/properties/ethernet.c
+index 31db7a0..0b6b423 100644
+--- a/properties/ethernet.c
++++ b/properties/ethernet.c
+@@ -82,7 +82,7 @@ void add_ethernet_switch_button(GtkWidget *mainbox, GtkTreeIter *iter,
+ 	gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
+ 	gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
+ 
+-	table = gtk_table_new(1, 1, TRUE);
++	table = gtk_table_new(1, 1, FALSE);
+ 	gtk_table_set_row_spacings(GTK_TABLE(table), 10);
+ 	gtk_table_set_col_spacings(GTK_TABLE(table), 10);
+ 	gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
+@@ -136,7 +136,7 @@ void add_ethernet_service(GtkWidget *mainbox, GtkTreeIter *iter, struct config_d
+ 	gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
+ 	gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
+ 
+-	table = gtk_table_new(5, 5, TRUE);
++	table = gtk_table_new(5, 5, FALSE);
+ 	gtk_table_set_row_spacings(GTK_TABLE(table), 10);
+ 	gtk_table_set_col_spacings(GTK_TABLE(table), 10);
+ 	gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
+@@ -144,9 +144,9 @@ void add_ethernet_service(GtkWidget *mainbox, GtkTreeIter *iter, struct config_d
+ 	label = gtk_label_new(_("Configuration:"));
+ 	gtk_table_attach_defaults(GTK_TABLE(table), label, 1, 2, 0, 1);
+ 
+-	combo = gtk_combo_box_new_text();
+-	gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "DHCP");
+-	gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "MANUAL");
++	combo = gtk_combo_box_text_new();
++	gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "DHCP");
++	gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "MANUAL");
+ 	gtk_combo_box_set_row_separator_func(GTK_COMBO_BOX(combo),
+ 					separator_function, NULL, NULL);
+ 	gtk_table_attach_defaults(GTK_TABLE(table), combo, 2, 4, 0, 1);
+@@ -219,7 +219,7 @@ void update_ethernet_ipv4(struct config_data *data, guint policy)
+ 	case CONNMAN_POLICY_DHCP:
+ 		gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 0);
+ 		for (i = 0; i < 3; i++) {
+-			gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);
++			gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 0);
+ 			gtk_widget_set_sensitive(entry[i], 0);
+ 			gtk_entry_set_text(GTK_ENTRY(entry[i]), _(""));
+ 		}
+@@ -227,7 +227,7 @@ void update_ethernet_ipv4(struct config_data *data, guint policy)
+ 	case CONNMAN_POLICY_MANUAL:
+ 		gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 1);
+ 		for (i = 0; i < 3; i++) {
+-			gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);
++			gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 1);
+ 			gtk_widget_set_sensitive(entry[i], 1);
+ 		}
+ 		break;
+diff --git a/properties/main.c b/properties/main.c
+index c05f443..6f76361 100644
+--- a/properties/main.c
++++ b/properties/main.c
+@@ -429,7 +429,7 @@ static GtkWidget *create_interfaces(GtkWidget *window)
+ 
+ 	scrolled = gtk_scrolled_window_new(NULL, NULL);
+ 	gtk_scrolled_window_set_policy(GTK_SCROLLED_WINDOW(scrolled),
+-				GTK_POLICY_AUTOMATIC, GTK_POLICY_AUTOMATIC);
++				GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
+ 	gtk_scrolled_window_set_shadow_type(GTK_SCROLLED_WINDOW(scrolled),
+ 							GTK_SHADOW_OUT);
+ 	gtk_box_pack_start(GTK_BOX(hbox), scrolled, FALSE, TRUE, 0);
+diff --git a/properties/wifi.c b/properties/wifi.c
+index bd325ef..a5827e0 100644
+--- a/properties/wifi.c
++++ b/properties/wifi.c
+@@ -125,7 +125,7 @@ void add_wifi_switch_button(GtkWidget *mainbox, GtkTreeIter *iter,
+ 	gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
+ 	gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
+ 
+-	table = gtk_table_new(1, 1, TRUE);
++	table = gtk_table_new(1, 1, FALSE);
+ 	gtk_table_set_row_spacings(GTK_TABLE(table), 10);
+ 	gtk_table_set_col_spacings(GTK_TABLE(table), 10);
+ 	gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
+@@ -185,9 +185,9 @@ static void wifi_ipconfig(GtkWidget *table, struct config_data *data, GtkTreeIte
+ 	gtk_table_attach_defaults(GTK_TABLE(table), label, 1, 2, 3, 4);
+ 	data->ipv4.label[0] = label;
+ 
+-	combo = gtk_combo_box_new_text();
+-	gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "DHCP");
+-	gtk_combo_box_append_text(GTK_COMBO_BOX(combo), "Manual");
++	combo = gtk_combo_box_text_new();
++	gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "DHCP");
++	gtk_combo_box_text_append_text(GTK_COMBO_BOX_TEXT(combo), "Manual");
+ 
+ 	gtk_combo_box_set_row_separator_func(GTK_COMBO_BOX(combo),
+ 			separator_function, NULL, NULL);
+@@ -335,14 +335,14 @@ void update_wifi_ipv4(struct config_data *data, guint policy)
+ 	case CONNMAN_POLICY_DHCP:
+ 		gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 0);
+ 		for (i = 0; i < 3; i++) {
+-			gtk_entry_set_editable(GTK_ENTRY(entry[i]), 0);
++			gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 0);
+ 			gtk_widget_set_sensitive(entry[i], 0);
+ 		}
+ 		break;
+ 	case CONNMAN_POLICY_MANUAL:
+ 		gtk_combo_box_set_active(GTK_COMBO_BOX(combo), 1);
+ 		for (i = 0; i < 3; i++) {
+-			gtk_entry_set_editable(GTK_ENTRY(entry[i]), 1);
++			gtk_editable_set_editable(GTK_EDITABLE(entry[i]), 1);
+ 			gtk_widget_set_sensitive(entry[i], 1);
+ 		}
+ 		break;
+-- 
+2.8.1
+
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 3521c7f..a56bd37 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
 
-DEPENDS = "gtk+ dbus-glib dbus-glib-native intltool-native gettext-native"
+DEPENDS = "gtk+3 dbus-glib dbus-glib-native intltool-native gettext-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
@@ -15,12 +15,13 @@ SRC_URI = "git://github.com/connectivity/connman-gnome.git \
            file://null_check_for_ipv4_config.patch \
            file://images/* \
            file://connman-gnome-fix-dbus-interface-name.patch \
+           file://0001-Port-to-Gtk3.patch \
           "
 
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep gtk-icon-cache pkgconfig distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 RDEPENDS_${PN} = "connman"
 
-- 
2.1.4


