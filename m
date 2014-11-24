Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2279721BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 07:50:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAO7oEUk014451
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Nov 2014 23:50:14 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 23 Nov 2014 23:50:13 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 15:49:35 +0800
Message-ID: <9cd87c8d872944f13d7364c2c441a3436e39f8e3.1416815305.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416815305.git.Chong.Lu@windriver.com>
References: <cover.1416815305.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] connman-gnome: fix dbus interface name
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
X-List-Received-Date: Mon, 24 Nov 2014 07:50:13 -0000
Content-Type: text/plain

This patch resolves following error:

"connman-dbus.xml": "connman" is not a valid D-Bus interface name

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../connman-gnome-fix-dbus-interface-name.patch    | 187 +++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |   7 +-
 2 files changed, 191 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch

diff --git a/meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch b/meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
new file mode 100644
index 0000000..f4049fa
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
@@ -0,0 +1,187 @@
+connman-gnome: fix dbus interface name
+
+This patch resolves following error:
+
+"connman-dbus.xml": "connman" is not a valid D-Bus interface name
+
+https://502552.bugs.gentoo.org/attachment.cgi?id=380652
+
+Upstream-Status: Backport
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ common/connman-client.c | 24 ++++++++++++------------
+ common/connman-client.h |  4 ++--
+ common/connman-dbus.c   |  6 +++---
+ common/connman-dbus.xml |  2 +-
+ 4 files changed, 18 insertions(+), 18 deletions(-)
+
+diff --git a/common/connman-client.c b/common/connman-client.c
+index c55e25c..9d818b2 100644
+--- a/common/connman-client.c
++++ b/common/connman-client.c
+@@ -289,7 +289,7 @@ gboolean connman_client_set_ipv4(ConnmanClient *client, const gchar *device,
+ 
+ 	g_value_init(&value, DBUS_TYPE_G_DICTIONARY);
+ 	g_value_set_boxed(&value, ipv4);
+-	ret = connman_set_property(proxy, "IPv4.Configuration", &value, NULL);
++	ret = net_connman_set_property(proxy, "IPv4.Configuration", &value, NULL);
+ 
+ 	g_object_unref(proxy);
+ 
+@@ -317,7 +317,7 @@ void connman_client_set_powered(ConnmanClient *client, const gchar *device,
+ 	g_value_set_boolean(&value, powered);
+ 
+ 	error = NULL;
+-	connman_set_property(proxy, "Powered", &value, &error);
++	net_connman_set_property(proxy, "Powered", &value, &error);
+ 	if( error )
+ 		fprintf (stderr, "error: %s\n", error->message);
+ 
+@@ -325,7 +325,7 @@ void connman_client_set_powered(ConnmanClient *client, const gchar *device,
+ }
+ 
+ void connman_client_scan(ConnmanClient *client, const gchar *device,
+-						connman_scan_reply callback, gpointer user_data)
++						net_connman_scan_reply callback, gpointer user_data)
+ {
+ 	ConnmanClientPrivate *priv = CONNMAN_CLIENT_GET_PRIVATE(client);
+ 	DBusGProxy *proxy;
+@@ -339,7 +339,7 @@ void connman_client_scan(ConnmanClient *client, const gchar *device,
+ 	if (proxy == NULL)
+ 		return;
+ 
+-	connman_scan_async(proxy, callback, user_data);
++	net_connman_scan_async(proxy, callback, user_data);
+ 
+ 	g_object_unref(proxy);
+ }
+@@ -353,7 +353,7 @@ gboolean connman_client_get_offline_status(ConnmanClient *client)
+ 
+ 	DBG("client %p", client);
+ 
+-	ret = connman_get_properties(priv->manager, &hash, NULL);
++	ret = net_connman_get_properties(priv->manager, &hash, NULL);
+ 
+ 	if (ret == FALSE)
+ 		goto done;
+@@ -375,7 +375,7 @@ void connman_client_set_offlinemode(ConnmanClient *client, gboolean status)
+ 	g_value_init(&value, G_TYPE_BOOLEAN);
+ 	g_value_set_boolean(&value, status);
+ 
+-	connman_set_property(priv->manager, "OfflineMode", &value, NULL);
++	net_connman_set_property(priv->manager, "OfflineMode", &value, NULL);
+ }
+ 
+ static gboolean network_disconnect(GtkTreeModel *model, GtkTreePath *path,
+@@ -398,7 +398,7 @@ static gboolean network_disconnect(GtkTreeModel *model, GtkTreePath *path,
+ 		return TRUE;
+ 
+ 	if (type == CONNMAN_TYPE_WIFI)
+-		connman_disconnect(proxy, NULL);
++		net_connman_disconnect(proxy, NULL);
+ 
+ 	g_object_unref(proxy);
+ 
+@@ -422,13 +422,13 @@ void connman_client_connect(ConnmanClient *client, const gchar *network)
+ 	if (proxy == NULL)
+ 		return;
+ 
+-	connman_connect(proxy, NULL);
++	net_connman_connect(proxy, NULL);
+ 
+ 	g_object_unref(proxy);
+ }
+ 
+ void connman_client_connect_async(ConnmanClient *client, const gchar *network,
+-		connman_connect_reply callback, gpointer userdata)
++		net_connman_connect_reply callback, gpointer userdata)
+ {
+ 	ConnmanClientPrivate *priv = CONNMAN_CLIENT_GET_PRIVATE(client);
+ 	DBusGProxy *proxy;
+@@ -446,7 +446,7 @@ void connman_client_connect_async(ConnmanClient *client, const gchar *network,
+ 	if (proxy == NULL)
+ 		goto done;
+ 
+-	connman_connect_async(proxy, callback, userdata);
++	net_connman_connect_async(proxy, callback, userdata);
+ 
+ done:
+ 	return;
+@@ -476,7 +476,7 @@ void connman_client_disconnect(ConnmanClient *client, const gchar *network)
+ 	if (proxy == NULL)
+ 		return;
+ 
+-	connman_disconnect(proxy, NULL);
++	net_connman_disconnect(proxy, NULL);
+ 
+ 	g_object_unref(proxy);
+ }
+@@ -532,7 +532,7 @@ void connman_client_remove(ConnmanClient *client, const gchar *network)
+ 	if (proxy == NULL)
+ 		return;
+ 
+-	connman_remove(proxy, NULL);
++	net_connman_remove(proxy, NULL);
+ 
+ 	g_object_unref(proxy);
+ }
+diff --git a/common/connman-client.h b/common/connman-client.h
+index 9e2e6d5..98241de 100644
+--- a/common/connman-client.h
++++ b/common/connman-client.h
+@@ -70,13 +70,13 @@ void connman_client_set_powered(ConnmanClient *client, const gchar *device,
+ gboolean connman_client_set_ipv4(ConnmanClient *client, const gchar *device,
+ 				struct ipv4_config *ipv4_config);
+ void connman_client_scan(ConnmanClient *client, const gchar *device,
+-							connman_scan_reply callback, gpointer user_data);
++							net_connman_scan_reply callback, gpointer user_data);
+ 
+ void connman_client_connect(ConnmanClient *client, const gchar *network);
+ void connman_client_disconnect(ConnmanClient *client, const gchar *network);
+ gchar *connman_client_get_security(ConnmanClient *client, const gchar *network);
+ void connman_client_connect_async(ConnmanClient *client, const gchar *network,
+-				connman_connect_reply callback, gpointer userdata);
++				net_connman_connect_reply callback, gpointer userdata);
+ void connman_client_set_remember(ConnmanClient *client, const gchar *network,
+ 							gboolean remember);
+ 
+diff --git a/common/connman-dbus.c b/common/connman-dbus.c
+index b82b3e1..543eb43 100644
+--- a/common/connman-dbus.c
++++ b/common/connman-dbus.c
+@@ -655,15 +655,15 @@ DBusGProxy *connman_dbus_create_manager(DBusGConnection *conn,
+ 
+ 	DBG("getting manager properties");
+ 
+-	connman_get_properties_async(proxy, manager_properties, store);
++	net_connman_get_properties_async(proxy, manager_properties, store);
+ 
+ 	DBG("getting technologies");
+ 
+-	connman_get_technologies_async(proxy, manager_technologies, store);
++	net_connman_get_technologies_async(proxy, manager_technologies, store);
+ 
+ 	DBG("getting services");
+ 
+-	connman_get_services_async(proxy, manager_services, store);
++	net_connman_get_services_async(proxy, manager_services, store);
+ 
+ 	return proxy;
+ }
+diff --git a/common/connman-dbus.xml b/common/connman-dbus.xml
+index 56b9582..0199d52 100644
+--- a/common/connman-dbus.xml
++++ b/common/connman-dbus.xml
+@@ -1,7 +1,7 @@
+ <?xml version="1.0" encoding="UTF-8" ?>
+ 
+ <node name="/">
+-  <interface name="connman">
++  <interface name="net.connman">
+     <method name="GetProperties">
+       <arg type="a{sv}" direction="out"/>
+     </method>
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 6688739..f5575d2 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -11,9 +11,10 @@ DEPENDS = "gtk+ dbus-glib intltool-native"
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
 SRC_URI = "git://github.com/connectivity/connman-gnome.git \
-	   file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
-       file://null_check_for_ipv4_config.patch \
-	   file://images/* \
+           file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
+           file://null_check_for_ipv4_config.patch \
+           file://images/* \
+           file://connman-gnome-fix-dbus-interface-name.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


