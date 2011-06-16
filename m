Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QX8cS-0006HJ-Qs
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 11:12:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jun 2011 02:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,374,1304319600"; d="scan'208";a="13715593"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by azsmga001.ch.intel.com with ESMTP; 16 Jun 2011 02:08:29 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 17:20:33 +0800
Message-Id: <c5f9a9413707c40c2839c4f72571d0440f8f59bf.1308215406.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1308215406.git.dongxiao.xu@intel.com>
References: <cover.1308215406.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/6] connman-gnome: Add 3G configuration support
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
X-List-Received-Date: Thu, 16 Jun 2011 09:12:09 -0000

Change connman-gnome to be git type recipe.
Apply 3g.patch which add cellular config option in connman-gnome.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../connman/connman-gnome/3g.patch                 |  505 ++++++++++++++++++++
 .../{connman-gnome_0.5.bb => connman-gnome_git.bb} |   12 +-
 2 files changed, 514 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/3g.patch
 rename meta/recipes-connectivity/connman/{connman-gnome_0.5.bb => connman-gnome_git.bb} (76%)

diff --git a/meta/recipes-connectivity/connman/connman-gnome/3g.patch b/meta/recipes-connectivity/connman/connman-gnome/3g.patch
new file mode 100644
index 0000000..c73c1ea
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gnome/3g.patch
@@ -0,0 +1,505 @@
+commit 15852e826b0b47f577718ada4b68b63515387f4d
+Author: dongxiao <dongxiao@dongxiao-osel.(none)>
+Date:   Wed Jun 1 14:56:16 2011 +0800
+
+    connman-gnome: Add cellular network config option.
+    
+    Add cellular network config option in connman-gnome.
+    
+    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+diff --git a/common/connman-client.c b/common/connman-client.c
+index e907cc2..d6be363 100644
+--- a/common/connman-client.c
++++ b/common/connman-client.c
+@@ -112,9 +112,10 @@ static void connman_client_init(ConnmanClient *client)
+ 				G_TYPE_STRING,  /* address */
+ 				G_TYPE_STRING,  /* netmask */
+ 				G_TYPE_STRING,  /* gateway */
+-				G_TYPE_BOOLEAN, /* gateway */
+-				G_TYPE_BOOLEAN, /* gateway */
+-				G_TYPE_BOOLEAN);/* gateway */
++				G_TYPE_BOOLEAN, /* ethernet enabled */
++				G_TYPE_BOOLEAN, /* wifi enabled */
++				G_TYPE_BOOLEAN, /* cellular enabled */
++				G_TYPE_BOOLEAN);/* offline */
+ 
+ 	g_object_set_data(G_OBJECT(priv->store),
+ 					"State", g_strdup("unavailable"));
+@@ -218,6 +219,7 @@ static gboolean device_filter(GtkTreeModel *model,
+ 	switch (type) {
+ 	case CONNMAN_TYPE_LABEL_ETHERNET:
+ 	case CONNMAN_TYPE_LABEL_WIFI:
++	case CONNMAN_TYPE_LABEL_CELLULAR:
+ 	case CONNMAN_TYPE_SYSCONFIG:
+ 		return TRUE;
+ 	}
+diff --git a/common/connman-client.h b/common/connman-client.h
+index 37e86d0..15fa098 100644
+--- a/common/connman-client.h
++++ b/common/connman-client.h
+@@ -117,6 +117,7 @@ enum {
+ 
+ 	CONNMAN_COLUMN_ETHERNET_ENABLED,/* G_TYPE_STRING  */
+ 	CONNMAN_COLUMN_WIFI_ENABLED,	/* G_TYPE_STRING  */
++	CONNMAN_COLUMN_CELLULAR_ENABLED,/* G_TYPE_STRING  */
+ 	CONNMAN_COLUMN_OFFLINEMODE,	/* G_TYPE_STRING  */
+ 
+ 	_CONNMAN_NUM_COLUMNS
+@@ -132,6 +133,7 @@ enum {
+ 
+ 	CONNMAN_TYPE_LABEL_ETHERNET,
+ 	CONNMAN_TYPE_LABEL_WIFI,
++	CONNMAN_TYPE_LABEL_CELLULAR,
+ 	CONNMAN_TYPE_SYSCONFIG,
+ 
+ 	_CONNMAN_NUM_TYPE,
+diff --git a/common/connman-dbus.c b/common/connman-dbus.c
+index b5a635c..0f4e1db 100644
+--- a/common/connman-dbus.c
++++ b/common/connman-dbus.c
+@@ -208,6 +208,8 @@ static const gchar *type2icon(guint type)
+ 	case CONNMAN_TYPE_WIFI:
+ 	case CONNMAN_TYPE_WIMAX:
+ 		return "network-wireless";
++	case CONNMAN_TYPE_CELLULAR:
++		return "network-cellular";
+ 	case CONNMAN_TYPE_BLUETOOTH:
+ 		return "bluetooth";
+ 	}
+@@ -220,6 +222,7 @@ static void enabled_technologies_changed(GtkTreeStore *store, GValue *value)
+ 	GtkTreeIter iter;
+ 	gboolean ethernet_enabled_prev, ethernet_enabled = FALSE;
+ 	gboolean wifi_enabled_prev, wifi_enabled = FALSE;
++	gboolean cellular_enabled_prev, cellular_enabled = FALSE;
+ 	gchar **tech = g_value_get_boxed (value);
+ 	guint i;
+ 
+@@ -227,10 +230,13 @@ static void enabled_technologies_changed(GtkTreeStore *store, GValue *value)
+ 		return;
+ 
+ 	for (i = 0; i < g_strv_length(tech); i++) {
++		DBG("technology: %s", *(tech+i));
+ 		if (g_str_equal("ethernet", *(tech + i)))
+ 			ethernet_enabled = TRUE;
+ 		else if (g_str_equal ("wifi", *(tech + i)))
+ 			wifi_enabled = TRUE;
++		else if (g_str_equal ("cellular", *(tech + i)))
++			cellular_enabled = TRUE;
+ 	}
+ 
+ 	get_iter_from_type(store, &iter, CONNMAN_TYPE_LABEL_ETHERNET);
+@@ -246,6 +252,13 @@ static void enabled_technologies_changed(GtkTreeStore *store, GValue *value)
+ 	if (wifi_enabled_prev != wifi_enabled)
+ 		gtk_tree_store_set(store, &iter,
+ 					CONNMAN_COLUMN_WIFI_ENABLED, wifi_enabled, -1);
++
++	get_iter_from_type(store, &iter, CONNMAN_TYPE_LABEL_CELLULAR);
++	gtk_tree_model_get(GTK_TREE_MODEL(store), &iter,
++			CONNMAN_COLUMN_CELLULAR_ENABLED, &cellular_enabled_prev, -1);
++	if (cellular_enabled_prev != cellular_enabled)
++		gtk_tree_store_set(store, &iter,
++					CONNMAN_COLUMN_CELLULAR_ENABLED, cellular_enabled, -1);
+ }
+ 
+ static void enabled_technologies_properties(GtkTreeStore *store, DBusGProxy *proxy, GValue *value)
+@@ -253,14 +266,18 @@ static void enabled_technologies_properties(GtkTreeStore *store, DBusGProxy *pro
+ 	GtkTreeIter iter;
+ 	gboolean ethernet_enabled = FALSE;
+ 	gboolean wifi_enabled = FALSE;
++	gboolean cellular_enabled = FALSE;
+ 	gchar **tech = g_value_get_boxed (value);
+ 	guint i;
+ 
+ 	for (i = 0; i < g_strv_length (tech); i++) {
++		DBG("technology: %s", *(tech+i));
+ 		if (g_str_equal("ethernet", *(tech + i)))
+ 			ethernet_enabled = TRUE;
+ 		else if (g_str_equal ("wifi", *(tech + i)))
+ 			wifi_enabled = TRUE;
++		else if (g_str_equal ("cellular", *(tech + i)))
++			cellular_enabled = TRUE;
+ 	}
+ 
+ 	if (get_iter_from_type(store, &iter, CONNMAN_TYPE_LABEL_ETHERNET) == FALSE)
+@@ -280,6 +297,15 @@ static void enabled_technologies_properties(GtkTreeStore *store, DBusGProxy *pro
+ 			CONNMAN_COLUMN_WIFI_ENABLED, wifi_enabled,
+ 			CONNMAN_COLUMN_TYPE, CONNMAN_TYPE_LABEL_WIFI,
+ 			-1);
++
++	if (get_iter_from_type(store, &iter, CONNMAN_TYPE_LABEL_CELLULAR) == FALSE)
++		gtk_tree_store_append(store, &iter, NULL);
++
++	gtk_tree_store_set(store, &iter,
++			CONNMAN_COLUMN_PROXY, proxy,
++			CONNMAN_COLUMN_CELLULAR_ENABLED, cellular_enabled,
++			CONNMAN_COLUMN_TYPE, CONNMAN_TYPE_LABEL_CELLULAR,
++			-1);
+ }
+ 
+ static void offline_mode_changed(GtkTreeStore *store, GValue *value)
+@@ -497,6 +523,9 @@ static void service_properties(DBusGProxy *proxy, GHashTable *hash,
+ 		case CONNMAN_TYPE_WIFI:
+ 			label_type = CONNMAN_TYPE_LABEL_WIFI;
+ 			break;
++		case CONNMAN_TYPE_CELLULAR:
++			label_type = CONNMAN_TYPE_LABEL_CELLULAR;
++			break;
+ 		default:
+ 			label_type = CONNMAN_TYPE_UNKNOWN;
+ 			break;
+diff --git a/icons/connman-type-cellular.png b/icons/connman-type-cellular.png
+new file mode 100644
+index 0000000..386abd5
+Binary files /dev/null and b/icons/connman-type-cellular.png differ
+diff --git a/properties/Makefile.am b/properties/Makefile.am
+index fc1b8c6..30ae442 100644
+--- a/properties/Makefile.am
++++ b/properties/Makefile.am
+@@ -1,7 +1,7 @@
+ 
+ bin_PROGRAMS = connman-properties
+ 
+-connman_properties_SOURCES = main.c advanced.h ethernet.c wifi.c
++connman_properties_SOURCES = main.c advanced.h ethernet.c wifi.c cellular.c
+ 
+ connman_properties_LDADD = $(top_builddir)/common/libcommon.a \
+ 						@GTK_LIBS@ @DBUS_LIBS@
+diff --git a/properties/advanced.h b/properties/advanced.h
+index 79a1c3c..d8f4117 100644
+--- a/properties/advanced.h
++++ b/properties/advanced.h
+@@ -59,10 +59,18 @@ struct config_data {
+ 		GtkWidget *disconnect;
+ 	} wifi;
+ 
++	struct {
++		GtkWidget *name;
++		GtkWidget *strength;
++		GtkWidget *connect_info;
++		GtkWidget *connect;
++		GtkWidget *disconnect;
++	} cellular;
++
+ 	GtkWidget *ethernet_button;
+ 	GtkWidget *wifi_button;
+-
+ 	GtkWidget *scan_button;
++	GtkWidget *cellular_button;
+ 	GtkWidget *offline_button;
+ };
+ 
+@@ -88,8 +96,11 @@ void update_ethernet_ipv4(struct config_data *data, guint policy);
+ void add_wifi_service(GtkWidget *mainbox, GtkTreeIter *iter, struct config_data *data);
+ void update_wifi_policy(struct config_data *data, guint policy);
+ 
++void add_cellular_service(GtkWidget *mainbox, GtkTreeIter *iter, struct config_data *data);
+ void add_ethernet_switch_button(GtkWidget *mainbox, GtkTreeIter *iter,
+ 				struct config_data *data);
+ 
+ void add_wifi_switch_button(GtkWidget *mainbox, GtkTreeIter *iter,
+ 				struct config_data *data);
++void add_cellular_switch_button(GtkWidget *mainbox, GtkTreeIter *iter,
++				struct config_data *data);
+diff --git a/properties/cellular.c b/properties/cellular.c
+new file mode 100644
+index 0000000..7bbfb89
+--- /dev/null
++++ b/properties/cellular.c
+@@ -0,0 +1,175 @@
++/*
++ *
++ *  Connection Manager
++ *
++ *  Copyright (C) 2011  Intel Corporation. All rights reserved.
++ *
++ *  This program is free software; you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License version 2 as
++ *  published by the Free Software Foundation.
++ *
++ *  This program is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with this program; if not, write to the Free Software
++ *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
++ *
++ */
++
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
++
++#include <dbus/dbus-glib.h>
++#include <glib/gi18n.h>
++#include <gtk/gtk.h>
++
++#include "connman-client.h"
++
++#include "advanced.h"
++
++static void connect_reply_cb(DBusGProxy *proxy, GError *error,
++		gpointer user_data)
++{
++	if (error)
++		g_error_free(error);
++}
++
++static void connect_callback(GtkWidget *editable, gpointer user_data)
++{
++	struct config_data *data = user_data;
++
++	connman_client_connect_async(data->client, data->device, connect_reply_cb, data);
++}
++
++
++static void disconnect_callback(GtkWidget *editable, gpointer user_data)
++{
++	struct config_data *data = user_data;
++
++	connman_client_disconnect(data->client, data->device);
++}
++
++static void switch_callback(GtkWidget *editable, gpointer user_data)
++{
++	struct config_data *data = user_data;
++	const gchar *label = gtk_button_get_label(GTK_BUTTON(data->cellular_button));
++
++	if (g_str_equal(label, "Disable"))
++		connman_client_disable_technology(data->client, data->device, "cellular");
++	else
++		connman_client_enable_technology(data->client, data->device, "cellular");
++}
++
++void add_cellular_switch_button(GtkWidget *mainbox, GtkTreeIter *iter,
++				struct config_data *data)
++{
++	GtkWidget *vbox;
++	GtkWidget *table;
++	GtkWidget *label;
++	GtkWidget *buttonbox;
++	GtkWidget *button;
++	gboolean cellular_enabled;
++
++	gtk_tree_model_get(data->model, iter,
++			CONNMAN_COLUMN_CELLULAR_ENABLED, &cellular_enabled,
++			-1);
++
++	vbox = gtk_vbox_new(TRUE, 0);
++	gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
++	gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
++
++	table = gtk_table_new(1, 1, TRUE);
++	gtk_table_set_row_spacings(GTK_TABLE(table), 10);
++	gtk_table_set_col_spacings(GTK_TABLE(table), 10);
++	gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
++
++	label = gtk_label_new(_("Configure Cellular Networks."));
++	gtk_table_attach_defaults(GTK_TABLE(table), label, 0, 1, 0, 1);
++
++	buttonbox = gtk_hbutton_box_new();
++	gtk_button_box_set_layout(GTK_BUTTON_BOX(buttonbox), GTK_BUTTONBOX_CENTER);
++	gtk_box_pack_start(GTK_BOX(mainbox), buttonbox, FALSE, FALSE, 0);
++
++	button = gtk_button_new();
++	data->cellular_button = button;
++
++	if (cellular_enabled)
++		gtk_button_set_label(GTK_BUTTON(button), _("Disable"));
++	else
++		gtk_button_set_label(GTK_BUTTON(button), _("Enable"));
++
++	gtk_container_add(GTK_CONTAINER(buttonbox), button);
++	g_signal_connect(G_OBJECT(button), "clicked",
++			G_CALLBACK(switch_callback), data);
++}
++
++void add_cellular_service(GtkWidget *mainbox, GtkTreeIter *iter, struct config_data *data)
++{
++	GtkWidget *vbox;
++	GtkWidget *table;
++	GtkWidget *label;
++	GtkWidget *button;
++
++	const char *name, *icon, *state;
++	guint strength;
++
++	gtk_tree_model_get(data->model, iter,
++			CONNMAN_COLUMN_NAME, &name,
++			CONNMAN_COLUMN_ICON, &icon,
++			CONNMAN_COLUMN_STATE, &state,
++			CONNMAN_COLUMN_STRENGTH, &strength,
++			-1);
++
++	if (g_str_equal(state, "failure") == TRUE)
++		connman_client_remove(data->client, data->device);
++
++	vbox = gtk_vbox_new(TRUE, 0);
++	gtk_container_set_border_width(GTK_CONTAINER(vbox), 24);
++	gtk_box_pack_start(GTK_BOX(mainbox), vbox, FALSE, FALSE, 0);
++
++	table = gtk_table_new(4, 8, TRUE);
++	gtk_box_pack_start(GTK_BOX(vbox), table, FALSE, FALSE, 0);
++	data->table = table;
++
++	label = gtk_label_new(_("Access Point:"));
++	gtk_table_attach_defaults(GTK_TABLE(table), label, 3, 4, 0, 1);
++
++	label = gtk_label_new(_(name));
++	gtk_table_attach_defaults(GTK_TABLE(table), label, 4, 5, 0, 1);
++	gtk_label_set_justify(GTK_LABEL(label), GTK_JUSTIFY_LEFT);
++	gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.5);
++	data->cellular.name = label;
++
++	label = gtk_label_new(_(""));
++	gtk_table_attach_defaults(GTK_TABLE(table), label, 3, 5, 2, 3);
++	gtk_misc_set_alignment(GTK_MISC(label), 0.0, 0.0);
++	gtk_widget_hide(label);
++	data->cellular.connect_info = label;
++
++	button = gtk_button_new_with_label(_("Connect"));
++	gtk_table_attach_defaults(GTK_TABLE(table), button, 3, 5, 3, 4);
++	g_signal_connect(G_OBJECT(button), "clicked",
++			G_CALLBACK(connect_callback), data);
++	gtk_widget_set_no_show_all(button, TRUE);
++	data->cellular.connect = button;
++
++	button = gtk_button_new_with_label(_("Disconnect"));
++	gtk_table_attach_defaults(GTK_TABLE(table), button, 3, 5, 3, 4);
++	g_signal_connect(G_OBJECT(button), "clicked",
++			G_CALLBACK(disconnect_callback), data);
++	data->cellular.disconnect = button;
++	gtk_widget_set_no_show_all(button, TRUE);
++
++	if (g_str_equal(state, "failure") == TRUE
++			|| g_str_equal(state, "idle") == TRUE) {
++		gtk_widget_show(data->cellular.connect);
++		gtk_widget_hide(data->cellular.disconnect);
++	} else {
++		gtk_widget_hide(data->cellular.connect);
++		gtk_widget_show(data->cellular.disconnect);
++	}
++}
+diff --git a/properties/main.c b/properties/main.c
+index a09c721..ec36aef 100644
+--- a/properties/main.c
++++ b/properties/main.c
+@@ -42,6 +42,7 @@ static void status_update(GtkTreeModel *model, GtkTreePath  *path,
+ 	const char *name = NULL, *_name = NULL, *state = NULL;
+ 	gboolean ethernet_enabled;
+ 	gboolean wifi_enabled;
++	gboolean cellular_enabled;
+ 	gboolean offline_mode;
+ 
+ 	gtk_tree_model_get(model, iter,
+@@ -50,6 +51,7 @@ static void status_update(GtkTreeModel *model, GtkTreePath  *path,
+ 			CONNMAN_COLUMN_TYPE, &type,
+ 			CONNMAN_COLUMN_ETHERNET_ENABLED, &ethernet_enabled,
+ 			CONNMAN_COLUMN_WIFI_ENABLED, &wifi_enabled,
++			CONNMAN_COLUMN_CELLULAR_ENABLED, &cellular_enabled,
+ 			CONNMAN_COLUMN_OFFLINEMODE, &offline_mode,
+ 			-1);
+ 
+@@ -75,6 +77,29 @@ static void status_update(GtkTreeModel *model, GtkTreePath  *path,
+ 			gtk_widget_hide(data->wifi.connect);
+ 			gtk_widget_show(data->wifi.disconnect);
+ 		}
++	} else if (type == CONNMAN_TYPE_CELLULAR) {
++		if (data->cellular.name)
++			_name = gtk_label_get_text(GTK_LABEL(data->cellular.name));
++
++		if (!(name && _name && g_str_equal(name, _name)))
++			return;
++
++		if (g_str_equal(state, "failure") == TRUE) {
++			gtk_label_set_text(GTK_LABEL(data->cellular.connect_info),
++					_("connection failed"));
++			gtk_widget_show(data->cellular.connect_info);
++			gtk_widget_show(data->cellular.connect);
++			gtk_widget_hide(data->cellular.disconnect);
++		} else if (g_str_equal(state, "idle") == TRUE) {
++			gtk_widget_hide(data->cellular.connect_info);
++			gtk_widget_show(data->cellular.connect);
++			gtk_widget_hide(data->cellular.disconnect);
++		} else {
++			gtk_widget_hide(data->cellular.connect_info);
++			gtk_widget_hide(data->cellular.connect);
++			gtk_widget_show(data->cellular.disconnect);
++		}
++
+ 	} else if (type == CONNMAN_TYPE_LABEL_ETHERNET) {
+ 		if (!data->ethernet_button)
+ 			return;
+@@ -92,6 +117,13 @@ static void status_update(GtkTreeModel *model, GtkTreePath  *path,
+ 			gtk_button_set_label(GTK_BUTTON(data->wifi_button), _("Enable"));
+ 			gtk_widget_set_sensitive(data->scan_button, 0);
+ 		}
++	} else if (type == CONNMAN_TYPE_LABEL_CELLULAR) {
++		if (!data->cellular_button)
++			return;
++		if (cellular_enabled)
++			gtk_button_set_label(GTK_BUTTON(data->cellular_button), _("Disable"));
++		else
++			gtk_button_set_label(GTK_BUTTON(data->cellular_button), _("Enable"));
+ 	} else if (type == CONNMAN_TYPE_SYSCONFIG) {
+ 		if (!data->offline_button)
+ 			return;
+@@ -100,7 +132,6 @@ static void status_update(GtkTreeModel *model, GtkTreePath  *path,
+ 		else
+ 			gtk_button_set_label(GTK_BUTTON(data->offline_button), _("OfflineMode"));
+ 	}
+-
+ }
+ 
+ static void set_offline_callback(GtkWidget *button, gpointer user_data)
+@@ -207,12 +238,18 @@ static struct config_data *create_config(GtkTreeModel *model,
+ 	case CONNMAN_TYPE_WIFI:
+ 		add_wifi_service(mainbox, iter, data);
+ 		break;
++	case CONNMAN_TYPE_CELLULAR:
++		add_cellular_service(mainbox, iter, data);
++		break;
+ 	case CONNMAN_TYPE_LABEL_ETHERNET:
+ 		add_ethernet_switch_button(mainbox, iter, data);
+ 		break;
+ 	case CONNMAN_TYPE_LABEL_WIFI:
+ 		add_wifi_switch_button(mainbox, iter, data);
+ 		break;
++	case CONNMAN_TYPE_LABEL_CELLULAR:
++		add_cellular_switch_button(mainbox, iter, data);
++		break;
+ 	case CONNMAN_TYPE_SYSCONFIG:
+ 		add_system_config(mainbox, iter, data);
+ 		break;
+@@ -295,6 +332,7 @@ static void device_to_text(GtkTreeViewColumn *column, GtkCellRenderer *cell,
+ 		markup = g_strdup_printf("  %s\n", title);
+ 		break;
+ 	case CONNMAN_TYPE_WIFI:
++	case CONNMAN_TYPE_CELLULAR:
+ 		/* Show the AP name */
+ 		title = N_(name);
+ 		if (g_str_equal(state, "association") == TRUE)
+@@ -324,6 +362,10 @@ static void device_to_text(GtkTreeViewColumn *column, GtkCellRenderer *cell,
+ 		title = N_("Wireless Networks");
+ 		markup = g_strdup_printf("<b>\n%s\n</b>", title);
+ 		break;
++	case CONNMAN_TYPE_LABEL_CELLULAR:
++		title = N_("Cellular Networks");
++		markup = g_strdup_printf("<b>\n%s\n</b>", title);
++		break;
+ 	case CONNMAN_TYPE_SYSCONFIG:
+ 		title = N_("System Configuration");
+ 		markup = g_strdup_printf("<b>\n%s\n</b>", title);
+@@ -362,6 +404,10 @@ static void type_to_icon(GtkTreeViewColumn *column, GtkCellRenderer *cell,
+ 		g_object_set(cell, "icon-name", "network-wireless",
+ 						"stock-size", 4, NULL);
+ 		break;
++	case CONNMAN_TYPE_LABEL_CELLULAR:
++		g_object_set(cell, "icon-name", "network-cellular",
++						"stock-size", 4, NULL);
++		break;
+ 	default:
+ 		g_object_set(cell, "icon-name", NULL, NULL);
+ 		break;
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_git.bb
similarity index 76%
rename from meta/recipes-connectivity/connman/connman-gnome_0.5.bb
rename to meta/recipes-connectivity/connman/connman-gnome_git.bb
index 69b2d5b..024fa5f 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_git.bb
@@ -6,12 +6,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
 DEPENDS = "gtk+ dbus"
-PR = "r5"
+PR = "r0"
 
-RRECOMMENDS_${PN} = "python python-dbus connman connman-plugin-ethernet connman-plugin-loopback connman-plugin-udhcp connman-plugin-wifi connman-plugin-fake connman-plugin-bluetooth connman-plugin-dnsproxy"
+RRECOMMENDS_${PN} = "python python-dbus connman connman-plugin-ethernet connman-plugin-loopback connman-plugin-udhcp connman-plugin-wifi connman-plugin-fake connman-plugin-bluetooth connman-plugin-dnsproxy connman-plugin-ofono"
 
 SRCREV = "78d3c39db6f3f7977b466305110faa8ca5f74ec8"
-SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git"
+SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git \
+           file://3g.patch"
 S = "${WORKDIR}/git"
 
+SRC_URI[md5sum] = "0e1c4c25d19cad9b08a216848a320716"
+SRC_URI[sha256sum] = "4d5fe481b444fc3e64fd9caa149dbcd76de166a25733f18fd93da01d2abf5d1c"
+
 inherit autotools gtk-icon-cache
+
+
-- 
1.7.1



