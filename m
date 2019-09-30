Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id E60937DD6A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 01:57:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,565,1559491200"; d="scan'208";a="76239091"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 30 Sep 2019 09:57:29 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 1AD2E4CE03E8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 09:57:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Mon, 30 Sep 2019 09:57:35 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Sep 2019 17:57:21 +0800
Message-ID: <20190930095721.45073-1-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 1AD2E4CE03E8.A240E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] Update patch to fix do_patch error when PATCHTOOL = "patch".
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
X-List-Received-Date: Mon, 30 Sep 2019 01:57:31 -0000
Content-Type: text/plain

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../bluez5/bluez5/CVE-2018-10910.patch        | 726 +++++++-----------
 1 file changed, 263 insertions(+), 463 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch
index b4b1846c45..2a78077443 100644
--- a/meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2018-10910.patch
@@ -1,3 +1,8 @@
+From 977321f2c7f974ea68a3d90df296c66189a3f254 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 21 Jun 2019 17:57:35 +0900
+Subject: [PATCH] CVE-2018-10910
+
 A bug in Bluez may allow for the Bluetooth Discoverable state being set to on
 when no Bluetooth agent is registered with the system. This situation could
 lead to the unauthorized pairing of certain Bluetooth devices without any
@@ -21,14 +26,24 @@ DiscoverableTimeout property:
 [bluetooth]# discoverable-timeout 180
 Changing discoverable-timeout 180 succeeded
 ---
- client/main.c | 43 +++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 43 insertions(+)
+ client/main.c       |  82 +++++++++++++++++++++++++++++++++-
+ doc/adapter-api.txt |   6 +++
+ src/adapter.c       | 125 ++++++++++++++++++++++++++++++++++++++++++++++------
+ 3 files changed, 198 insertions(+), 15 deletions(-)
 
 diff --git a/client/main.c b/client/main.c
-index 87323d8f7..59820c6d9 100644
+index 87323d8..1a66a3a 100644
 --- a/client/main.c
 +++ b/client/main.c
-@@ -1061,6 +1061,47 @@ static void cmd_discoverable(int argc, char *argv[])
+@@ -877,6 +877,7 @@ static void cmd_show(int argc, char *argv[])
+ 	print_property(proxy, "Class");
+ 	print_property(proxy, "Powered");
+ 	print_property(proxy, "Discoverable");
++	print_property(proxy, "DiscoverableTimeout");
+ 	print_property(proxy, "Pairable");
+ 	print_uuids(proxy);
+ 	print_property(proxy, "Modalias");
+@@ -1061,6 +1062,47 @@ static void cmd_discoverable(int argc, char *argv[])
  	return bt_shell_noninteractive_quit(EXIT_FAILURE);
  }
  
@@ -76,7 +91,87 @@ index 87323d8f7..59820c6d9 100644
  static void cmd_agent(int argc, char *argv[])
  {
  	dbus_bool_t enable;
-@@ -2549,6 +2590,8 @@ static const struct bt_shell_menu main_menu = {
+@@ -1124,6 +1166,7 @@ static struct set_discovery_filter_args {
+ 	char **uuids;
+ 	size_t uuids_len;
+ 	dbus_bool_t duplicate;
++	dbus_bool_t discoverable;
+ 	bool set;
+ } filter = {
+ 	.rssi = DISTANCE_VAL_INVALID,
+@@ -1163,6 +1206,11 @@ static void set_discovery_filter_setup(DBusMessageIter *iter, void *user_data)
+ 						DBUS_TYPE_BOOLEAN,
+ 						&args->duplicate);
+ 
++	if (args->discoverable)
++		g_dbus_dict_append_entry(&dict, "Discoverable",
++						DBUS_TYPE_BOOLEAN,
++						&args->discoverable);
++
+ 	dbus_message_iter_close_container(iter, &dict);
+ }
+ 
+@@ -1320,6 +1368,26 @@ static void cmd_scan_filter_duplicate_data(int argc, char *argv[])
+ 	filter.set = false;
+ }
+ 
++static void cmd_scan_filter_discoverable(int argc, char *argv[])
++{
++	if (argc < 2 || !strlen(argv[1])) {
++		bt_shell_printf("Discoverable: %s\n",
++				filter.discoverable ? "on" : "off");
++		return bt_shell_noninteractive_quit(EXIT_SUCCESS);
++	}
++
++	if (!strcmp(argv[1], "on"))
++		filter.discoverable = true;
++	else if (!strcmp(argv[1], "off"))
++		filter.discoverable = false;
++	else {
++		bt_shell_printf("Invalid option: %s\n", argv[1]);
++		return bt_shell_noninteractive_quit(EXIT_FAILURE);
++	}
++
++	filter.set = false;
++}
++
+ static void filter_clear_uuids(void)
+ {
+ 	g_strfreev(filter.uuids);
+@@ -1348,6 +1416,11 @@ static void filter_clear_duplicate(void)
+ 	filter.duplicate = false;
+ }
+ 
++static void filter_clear_discoverable(void)
++{
++	filter.discoverable = false;
++}
++
+ struct clear_entry {
+ 	const char *name;
+ 	void (*clear) (void);
+@@ -1359,6 +1432,7 @@ static const struct clear_entry filter_clear[] = {
+ 	{ "pathloss", filter_clear_pathloss },
+ 	{ "transport", filter_clear_transport },
+ 	{ "duplicate-data", filter_clear_duplicate },
++	{ "discoverable", filter_clear_discoverable },
+ 	{}
+ };
+ 
+@@ -2468,7 +2542,11 @@ static const struct bt_shell_menu scan_menu = {
+ 	{ "duplicate-data", "[on/off]", cmd_scan_filter_duplicate_data,
+ 				"Set/Get duplicate data filter",
+ 				NULL },
+-	{ "clear", "[uuids/rssi/pathloss/transport/duplicate-data]",
++	{ "discoverable", "[on/off]", cmd_scan_filter_discoverable,
++				"Set/Get discoverable filter",
++				NULL },
++	{ "clear",
++		"[uuids/rssi/pathloss/transport/duplicate-data/discoverable]",
+ 				cmd_scan_filter_clear,
+ 				"Clears discovery filter.",
+ 				filter_clear_generator },
+@@ -2549,6 +2627,8 @@ static const struct bt_shell_menu main_menu = {
  	{ "discoverable", "<on/off>", cmd_discoverable,
  					"Set controller discoverable mode",
  							NULL },
@@ -85,74 +180,36 @@ index 87323d8f7..59820c6d9 100644
  	{ "agent",        "<on/off/capability>", cmd_agent,
  				"Enable/disable agent with given capability",
  							capability_generator},
--- 
-2.17.1
-
-Subject:    [PATCH BlueZ 2/4] client: Make show command print DiscoverableTimeout
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-25 10:20:33
-Message-ID: 20180725102035.19439-2-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-Controller XX:XX:XX:XX:XX:XX (public)
-	Name: Vudentz's T460s
-	Alias: Intel-1
-	Class: 0x004c010c
-	Powered: yes
-	Discoverable: no
-	DiscoverableTimeout: 0x00000000
-	Pairable: yes
-	UUID: Headset AG                (00001112-0000-1000-8000-00805f9b34fb)
-	UUID: Generic Attribute Profile (00001801-0000-1000-8000-00805f9b34fb)
-	UUID: A/V Remote Control        (0000110e-0000-1000-8000-00805f9b34fb)
-	UUID: SIM Access                (0000112d-0000-1000-8000-00805f9b34fb)
-	UUID: Generic Access Profile    (00001800-0000-1000-8000-00805f9b34fb)
-	UUID: PnP Information           (00001200-0000-1000-8000-00805f9b34fb)
-	UUID: A/V Remote Control Target (0000110c-0000-1000-8000-00805f9b34fb)
-	UUID: Audio Source              (0000110a-0000-1000-8000-00805f9b34fb)
-	UUID: Audio Sink                (0000110b-0000-1000-8000-00805f9b34fb)
-	UUID: Headset                   (00001108-0000-1000-8000-00805f9b34fb)
-	Modalias: usb:v1D6Bp0246d0532
-	Discovering: no
----
- client/main.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/client/main.c b/client/main.c
-index 59820c6d9..6f472d050 100644
---- a/client/main.c
-+++ b/client/main.c
-@@ -877,6 +877,7 @@ static void cmd_show(int argc, char *argv[])
- 	print_property(proxy, "Class");
- 	print_property(proxy, "Powered");
- 	print_property(proxy, "Discoverable");
-+	print_property(proxy, "DiscoverableTimeout");
- 	print_property(proxy, "Pairable");
- 	print_uuids(proxy);
- 	print_property(proxy, "Modalias");
--- 
-2.17.1
-Subject:    [PATCH BlueZ 3/4] adapter: Track pending settings
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-25 10:20:34
-Message-ID: 20180725102035.19439-3-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-This tracks settings being changed and in case the settings is already
-pending considered it to be done.
----
- src/adapter.c | 30 ++++++++++++++++++++++++++++--
- 1 file changed, 28 insertions(+), 2 deletions(-)
-
+diff --git a/doc/adapter-api.txt b/doc/adapter-api.txt
+index d14d0ca..4791af2 100644
+--- a/doc/adapter-api.txt
++++ b/doc/adapter-api.txt
+@@ -113,6 +113,12 @@ Methods		void StartDiscovery()
+ 				generated for either ManufacturerData and
+ 				ServiceData everytime they are discovered.
+ 
++			bool Discoverable (Default: false)
++
++				Make adapter discoverable while discovering,
++				if the adapter is already discoverable this
++				setting this filter won't do anything.
++
+ 			When discovery filter is set, Device objects will be
+ 			created as new devices with matching criteria are
+ 			discovered regardless of they are connectable or
 diff --git a/src/adapter.c b/src/adapter.c
-index af340fd6e..20c20f9e9 100644
+index af340fd..822bd34 100644
 --- a/src/adapter.c
 +++ b/src/adapter.c
-@@ -196,6 +196,7 @@ struct btd_adapter {
+@@ -157,6 +157,7 @@ struct discovery_filter {
+ 	int16_t rssi;
+ 	GSList *uuids;
+ 	bool duplicate;
++	bool discoverable;
+ };
+ 
+ struct watch_client {
+@@ -196,6 +197,7 @@ struct btd_adapter {
  	char *name;			/* controller device name */
  	char *short_name;		/* controller short name */
  	uint32_t supported_settings;	/* controller supported settings */
@@ -160,7 +217,15 @@ index af340fd6e..20c20f9e9 100644
  	uint32_t current_settings;	/* current controller settings */
  
  	char *path;			/* adapter object path */
-@@ -509,8 +510,10 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
+@@ -213,6 +215,7 @@ struct btd_adapter {
+ 
+ 	bool discovering;		/* discovering property state */
+ 	bool filtered_discovery;	/* we are doing filtered discovery */
++	bool filtered_discoverable;	/* we are doing filtered discovery */
+ 	bool no_scan_restart_delay;	/* when this flag is set, restart scan
+ 					 * without delay */
+ 	uint8_t discovery_type;		/* current active discovery type */
+@@ -509,8 +512,10 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
  	changed_mask = adapter->current_settings ^ settings;
  
  	adapter->current_settings = settings;
@@ -171,7 +236,7 @@ index af340fd6e..20c20f9e9 100644
  
  	if (changed_mask & MGMT_SETTING_POWERED) {
  	        g_dbus_emit_property_changed(dbus_conn, adapter->path,
-@@ -596,10 +599,31 @@ static bool set_mode(struct btd_adapter *adapter, uint16_t opcode,
+@@ -596,10 +601,31 @@ static bool set_mode(struct btd_adapter *adapter, uint16_t opcode,
  							uint8_t mode)
  {
  	struct mgmt_mode cp;
@@ -203,160 +268,11 @@ index af340fd6e..20c20f9e9 100644
  	DBG("sending set mode command for index %u", adapter->dev_id);
  
  	if (mgmt_send(adapter->mgmt, opcode,
-@@ -2739,13 +2763,15 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
- 	else
- 		current_enable = FALSE;
- 
--	if (enable == current_enable) {
-+	if (enable == current_enable || adapter->pending_settings & setting) {
- 		g_dbus_pending_property_success(id);
- 		return;
- 	}
- 
- 	mode = (enable == TRUE) ? 0x01 : 0x00;
- 
-+	adapter->pending_settings |= setting;
-+
- 	switch (setting) {
- 	case MGMT_SETTING_POWERED:
- 		opcode = MGMT_OP_SET_POWERED;
-@@ -2798,7 +2824,7 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
- 	data->id = id;
- 
- 	if (mgmt_send(adapter->mgmt, opcode, adapter->dev_id, len, param,
--				property_set_mode_complete, data, g_free) > 0)
-+			property_set_mode_complete, data, g_free) > 0)
- 		return;
- 
- 	g_free(data);
--- 
-2.17.1
-Subject:    [PATCH BlueZ 4/4] adapter: Check pending when setting DiscoverableTimeout
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-25 10:20:35
-Message-ID: 20180725102035.19439-4-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-This makes DiscoverableTimeout check if discoverable is already pending
-and don't attempt to set it once again which may cause discoverable to
-be re-enabled when in fact the application just want to set the timeout
-alone.
----
- src/adapter.c | 14 +++++++++++++-
- 1 file changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/src/adapter.c b/src/adapter.c
-index 20c20f9e9..f92c897c7 100644
---- a/src/adapter.c
-+++ b/src/adapter.c
-@@ -2901,6 +2901,7 @@ static void property_set_discoverable_timeout(
- 				GDBusPendingPropertySet id, void *user_data)
- {
- 	struct btd_adapter *adapter = user_data;
-+	bool enabled;
- 	dbus_uint32_t value;
- 
- 	dbus_message_iter_get_basic(iter, &value);
-@@ -2914,8 +2915,19 @@ static void property_set_discoverable_timeout(
- 	g_dbus_emit_property_changed(dbus_conn, adapter->path,
- 				ADAPTER_INTERFACE, "DiscoverableTimeout");
- 
-+	if (adapter->pending_settings & MGMT_SETTING_DISCOVERABLE) {
-+		if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
-+			enabled = false;
-+		else
-+			enabled = true;
-+	} else {
-+		if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
-+			enabled = true;
-+		else
-+			enabled = false;
-+	}
- 
--	if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
-+	if (enabled)
- 		set_discoverable(adapter, 0x01, adapter->discoverable_timeout);
- }
- 
--- 
-2.17.1
-Subject:    [PATCH BlueZ 1/5] doc/adapter-api: Add Discoverable option to SetDiscoveryFilter
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-26 14:17:19
-Message-ID: 20180726141723.20199-1-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-This enables the client to set its discoverable setting while
-discovering which is very typical situation as usually the setings
-application would allow incoming pairing request while scanning, so
-this would reduce the number of calls setting Discoverable and
-DiscoverableTimeout and restoring after done with discovery.
----
- doc/adapter-api.txt | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/doc/adapter-api.txt b/doc/adapter-api.txt
-index d14d0ca50..4791af2c7 100644
---- a/doc/adapter-api.txt
-+++ b/doc/adapter-api.txt
-@@ -113,6 +113,12 @@ Methods		void StartDiscovery()
- 				generated for either ManufacturerData and
- 				ServiceData everytime they are discovered.
- 
-+			bool Discoverable (Default: false)
-+
-+				Make adapter discoverable while discovering,
-+				if the adapter is already discoverable this
-+				setting this filter won't do anything.
-+
- 			When discovery filter is set, Device objects will be
- 			created as new devices with matching criteria are
- 			discovered regardless of they are connectable or
--- 
-2.17.1
-Subject:    [PATCH BlueZ 2/5] adapter: Discovery filter discoverable
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-26 14:17:20
-Message-ID: 20180726141723.20199-2-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-This implements the discovery filter discoverable and tracks which
-clients had enabled it and restores the settings when the last client
-enabling it exits.
----
- src/adapter.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 54 insertions(+), 2 deletions(-)
-
-diff --git a/src/adapter.c b/src/adapter.c
-index f92c897c7..bd9edddc6 100644
---- a/src/adapter.c
-+++ b/src/adapter.c
-@@ -157,6 +157,7 @@ struct discovery_filter {
- 	int16_t rssi;
- 	GSList *uuids;
- 	bool duplicate;
-+	bool discoverable;
- };
- 
- struct watch_client {
-@@ -214,6 +215,7 @@ struct btd_adapter {
- 
- 	bool discovering;		/* discovering property state */
- 	bool filtered_discovery;	/* we are doing filtered discovery */
-+	bool filtered_discoverable;	/* we are doing filtered discovery */
- 	bool no_scan_restart_delay;	/* when this flag is set, restart scan
- 					 * without delay */
- 	uint8_t discovery_type;		/* current active discovery type */
-@@ -1842,6 +1844,16 @@ static void discovery_free(void *user_data)
+@@ -1818,7 +1844,17 @@ static void discovery_free(void *user_data)
  	g_free(client);
  }
  
+-static void discovery_remove(struct watch_client *client)
 +static bool set_filtered_discoverable(struct btd_adapter *adapter, bool enable)
 +{
 +	if (adapter->filtered_discoverable == enable)
@@ -367,13 +283,15 @@ index f92c897c7..bd9edddc6 100644
 +	return set_discoverable(adapter, enable, 0);
 +}
 +
- static void discovery_remove(struct watch_client *client)
++static void discovery_remove(struct watch_client *client, bool exit)
  {
  	struct btd_adapter *adapter = client->adapter;
-@@ -1854,6 +1866,22 @@ static void discovery_remove(struct watch_client *client)
+ 
+@@ -1830,7 +1866,27 @@ static void discovery_remove(struct watch_client *client)
  	adapter->discovery_list = g_slist_remove(adapter->discovery_list,
  								client);
  
+-	discovery_free(client);
 +	if (adapter->filtered_discoverable &&
 +			client->discovery_filter->discoverable) {
 +		GSList *l;
@@ -390,10 +308,72 @@ index f92c897c7..bd9edddc6 100644
 +			set_filtered_discoverable(adapter, false);
 +	}
 +
- 	discovery_free(client);
++	if (!exit && client->discovery_filter)
++		adapter->set_filter_list = g_slist_prepend(
++					adapter->set_filter_list, client);
++	else
++		discovery_free(client);
  
  	/*
-@@ -2224,6 +2252,15 @@ static DBusMessage *start_discovery(DBusConnection *conn,
+ 	 * If there are other client discoveries in progress, then leave
+@@ -1859,8 +1915,11 @@ static void stop_discovery_complete(uint8_t status, uint16_t length,
+ 		goto done;
+ 	}
+ 
+-	if (client->msg)
++	if (client->msg) {
+ 		g_dbus_send_reply(dbus_conn, client->msg, DBUS_TYPE_INVALID);
++		dbus_message_unref(client->msg);
++		client->msg = NULL;
++	}
+ 
+ 	adapter->discovery_type = 0x00;
+ 	adapter->discovery_enable = 0x00;
+@@ -1873,7 +1932,7 @@ static void stop_discovery_complete(uint8_t status, uint16_t length,
+ 	trigger_passive_scanning(adapter);
+ 
+ done:
+-	discovery_remove(client);
++	discovery_remove(client, false);
+ }
+ 
+ static int compare_sender(gconstpointer a, gconstpointer b)
+@@ -2094,14 +2153,14 @@ static int update_discovery_filter(struct btd_adapter *adapter)
+ 	return -EINPROGRESS;
+ }
+ 
+-static int discovery_stop(struct watch_client *client)
++static int discovery_stop(struct watch_client *client, bool exit)
+ {
+ 	struct btd_adapter *adapter = client->adapter;
+ 	struct mgmt_cp_stop_discovery cp;
+ 
+ 	/* Check if there are more client discovering */
+ 	if (g_slist_next(adapter->discovery_list)) {
+-		discovery_remove(client);
++		discovery_remove(client, exit);
+ 		update_discovery_filter(adapter);
+ 		return 0;
+ 	}
+@@ -2111,7 +2170,7 @@ static int discovery_stop(struct watch_client *client)
+ 	 * and so it is enough to send out the signal and just return.
+ 	 */
+ 	if (adapter->discovery_enable == 0x00) {
+-		discovery_remove(client);
++		discovery_remove(client, exit);
+ 		adapter->discovering = false;
+ 		g_dbus_emit_property_changed(dbus_conn, adapter->path,
+ 					ADAPTER_INTERFACE, "Discovering");
+@@ -2136,7 +2195,7 @@ static void discovery_disconnect(DBusConnection *conn, void *user_data)
+ 
+ 	DBG("owner %s", client->owner);
+ 
+-	discovery_stop(client);
++	discovery_stop(client, true);
+ }
+ 
+ /*
+@@ -2200,6 +2259,15 @@ static DBusMessage *start_discovery(DBusConnection *conn,
  					     adapter->set_filter_list, client);
  		adapter->discovery_list = g_slist_prepend(
  					      adapter->discovery_list, client);
@@ -409,7 +389,7 @@ index f92c897c7..bd9edddc6 100644
  		goto done;
  	}
  
-@@ -2348,6 +2385,17 @@ static bool parse_duplicate_data(DBusMessageIter *value,
+@@ -2324,6 +2392,17 @@ static bool parse_duplicate_data(DBusMessageIter *value,
  	return true;
  }
  
@@ -427,7 +407,7 @@ index f92c897c7..bd9edddc6 100644
  struct filter_parser {
  	const char *name;
  	bool (*func)(DBusMessageIter *iter, struct discovery_filter *filter);
-@@ -2357,6 +2405,7 @@ struct filter_parser {
+@@ -2333,6 +2412,7 @@ struct filter_parser {
  	{ "Pathloss", parse_pathloss },
  	{ "Transport", parse_transport },
  	{ "DuplicateData", parse_duplicate_data },
@@ -435,7 +415,7 @@ index f92c897c7..bd9edddc6 100644
  	{ }
  };
  
-@@ -2396,6 +2445,7 @@ static bool parse_discovery_filter_dict(struct btd_adapter *adapter,
+@@ -2372,6 +2452,7 @@ static bool parse_discovery_filter_dict(struct btd_adapter *adapter,
  	(*filter)->rssi = DISTANCE_VAL_INVALID;
  	(*filter)->type = get_scan_type(adapter);
  	(*filter)->duplicate = false;
@@ -443,7 +423,7 @@ index f92c897c7..bd9edddc6 100644
  
  	dbus_message_iter_init(msg, &iter);
  	if (dbus_message_iter_get_arg_type(&iter) != DBUS_TYPE_ARRAY ||
-@@ -2441,8 +2491,10 @@ static bool parse_discovery_filter_dict(struct btd_adapter *adapter,
+@@ -2417,8 +2498,10 @@ static bool parse_discovery_filter_dict(struct btd_adapter *adapter,
  		goto invalid_args;
  
  	DBG("filtered discovery params: transport: %d rssi: %d pathloss: %d "
@@ -456,250 +436,70 @@ index f92c897c7..bd9edddc6 100644
  
  	return true;
  
--- 
-2.17.1
-Subject:    [PATCH BlueZ 3/5] client: Add scan.discoverable command
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-26 14:17:21
-Message-ID: 20180726141723.20199-3-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-This adds discoverable command to scan menu which can be used to set
-if adapter should become discoverable while scanning:
-
-[bluetooth]# scan.discoverable on
-[bluetooth]# scan on
-SetDiscoveryFilter success
-[CHG] Controller XX:XX:XX:XX:XX:XX Discoverable: yes
-Discovery started
-[CHG] Controller XX:XX:XX:XX:XX:XX Discovering: yes
-[bluetooth]# scan off
-Discovery stopped
-[CHG] Controller XX:XX:XX:XX:XX:XX Discoverable: no
----
- client/main.c | 29 +++++++++++++++++++++++++++++
- 1 file changed, 29 insertions(+)
-
-diff --git a/client/main.c b/client/main.c
-index 6f472d050..6e6f6d2fb 100644
---- a/client/main.c
-+++ b/client/main.c
-@@ -1166,6 +1166,7 @@ static struct set_discovery_filter_args {
- 	char **uuids;
- 	size_t uuids_len;
- 	dbus_bool_t duplicate;
-+	dbus_bool_t discoverable;
- 	bool set;
- } filter = {
- 	.rssi = DISTANCE_VAL_INVALID,
-@@ -1205,6 +1206,11 @@ static void set_discovery_filter_setup(DBusMessageIter *iter, void *user_data)
- 						DBUS_TYPE_BOOLEAN,
- 						&args->duplicate);
+@@ -2510,7 +2593,7 @@ static DBusMessage *stop_discovery(DBusConnection *conn,
+ 	if (client->msg)
+ 		return btd_error_busy(msg);
  
-+	if (args->discoverable)
-+		g_dbus_dict_append_entry(&dict, "Discoverable",
-+						DBUS_TYPE_BOOLEAN,
-+						&args->discoverable);
-+
- 	dbus_message_iter_close_container(iter, &dict);
- }
+-	err = discovery_stop(client);
++	err = discovery_stop(client, false);
+ 	switch (err) {
+ 	case 0:
+ 		return dbus_message_new_method_return(msg);
+@@ -2739,13 +2822,15 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
+ 	else
+ 		current_enable = FALSE;
  
-@@ -1362,6 +1368,26 @@ static void cmd_scan_filter_duplicate_data(int argc, char *argv[])
- 	filter.set = false;
- }
+-	if (enable == current_enable) {
++	if (enable == current_enable || adapter->pending_settings & setting) {
+ 		g_dbus_pending_property_success(id);
+ 		return;
+ 	}
  
-+static void cmd_scan_filter_discoverable(int argc, char *argv[])
-+{
-+	if (argc < 2 || !strlen(argv[1])) {
-+		bt_shell_printf("Discoverable: %s\n",
-+				filter.discoverable ? "on" : "off");
-+		return bt_shell_noninteractive_quit(EXIT_SUCCESS);
-+	}
-+
-+	if (!strcmp(argv[1], "on"))
-+		filter.discoverable = true;
-+	else if (!strcmp(argv[1], "off"))
-+		filter.discoverable = false;
-+	else {
-+		bt_shell_printf("Invalid option: %s\n", argv[1]);
-+		return bt_shell_noninteractive_quit(EXIT_FAILURE);
-+	}
-+
-+	filter.set = false;
-+}
-+
- static void filter_clear_uuids(void)
- {
- 	g_strfreev(filter.uuids);
-@@ -2510,6 +2536,9 @@ static const struct bt_shell_menu scan_menu = {
- 	{ "duplicate-data", "[on/off]", cmd_scan_filter_duplicate_data,
- 				"Set/Get duplicate data filter",
- 				NULL },
-+	{ "discoverable", "[on/off]", cmd_scan_filter_discoverable,
-+				"Set/Get discoverable filter",
-+				NULL },
- 	{ "clear", "[uuids/rssi/pathloss/transport/duplicate-data]",
- 				cmd_scan_filter_clear,
- 				"Clears discovery filter.",
--- 
-2.17.1
-Subject:    [PATCH BlueZ 4/5] client: Add scan.clear discoverable
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-26 14:17:22
-Message-ID: 20180726141723.20199-4-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-This implements scan.clear for discoverable filter.
----
- client/main.c | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/client/main.c b/client/main.c
-index 6e6f6d2fb..1a66a3ab4 100644
---- a/client/main.c
-+++ b/client/main.c
-@@ -1416,6 +1416,11 @@ static void filter_clear_duplicate(void)
- 	filter.duplicate = false;
- }
+ 	mode = (enable == TRUE) ? 0x01 : 0x00;
  
-+static void filter_clear_discoverable(void)
-+{
-+	filter.discoverable = false;
-+}
++	adapter->pending_settings |= setting;
 +
- struct clear_entry {
- 	const char *name;
- 	void (*clear) (void);
-@@ -1427,6 +1432,7 @@ static const struct clear_entry filter_clear[] = {
- 	{ "pathloss", filter_clear_pathloss },
- 	{ "transport", filter_clear_transport },
- 	{ "duplicate-data", filter_clear_duplicate },
-+	{ "discoverable", filter_clear_discoverable },
- 	{}
- };
+ 	switch (setting) {
+ 	case MGMT_SETTING_POWERED:
+ 		opcode = MGMT_OP_SET_POWERED;
+@@ -2798,7 +2883,7 @@ static void property_set_mode(struct btd_adapter *adapter, uint32_t setting,
+ 	data->id = id;
  
-@@ -2539,7 +2545,8 @@ static const struct bt_shell_menu scan_menu = {
- 	{ "discoverable", "[on/off]", cmd_scan_filter_discoverable,
- 				"Set/Get discoverable filter",
- 				NULL },
--	{ "clear", "[uuids/rssi/pathloss/transport/duplicate-data]",
-+	{ "clear",
-+		"[uuids/rssi/pathloss/transport/duplicate-data/discoverable]",
- 				cmd_scan_filter_clear,
- 				"Clears discovery filter.",
- 				filter_clear_generator },
--- 
-2.17.1
-Subject:    [PATCH BlueZ 5/5] adapter: Fix not keeping discovery filters
-From:       Luiz Augusto von Dentz <luiz.dentz () gmail ! com>
-Date:       2018-07-26 14:17:23
-Message-ID: 20180726141723.20199-5-luiz.dentz () gmail ! com
-[Download RAW message or body]
-
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-
-If the discovery has been stopped and the client has set filters those
-should be put back into filter list since the client may still be
-interested in using them the next time it start a scanning.
----
- src/adapter.c | 25 ++++++++++++++++---------
- 1 file changed, 16 insertions(+), 9 deletions(-)
-
-diff --git a/src/adapter.c b/src/adapter.c
-index bd9edddc6..822bd3472 100644
---- a/src/adapter.c
-+++ b/src/adapter.c
-@@ -1854,7 +1854,7 @@ static bool set_filtered_discoverable(struct btd_adapter *adapter, bool enable)
- 	return set_discoverable(adapter, enable, 0);
- }
+ 	if (mgmt_send(adapter->mgmt, opcode, adapter->dev_id, len, param,
+-				property_set_mode_complete, data, g_free) > 0)
++			property_set_mode_complete, data, g_free) > 0)
+ 		return;
  
--static void discovery_remove(struct watch_client *client)
-+static void discovery_remove(struct watch_client *client, bool exit)
+ 	g_free(data);
+@@ -2875,6 +2960,7 @@ static void property_set_discoverable_timeout(
+ 				GDBusPendingPropertySet id, void *user_data)
  {
- 	struct btd_adapter *adapter = client->adapter;
- 
-@@ -1882,7 +1882,11 @@ static void discovery_remove(struct watch_client *client)
- 			set_filtered_discoverable(adapter, false);
- 	}
- 
--	discovery_free(client);
-+	if (!exit && client->discovery_filter)
-+		adapter->set_filter_list = g_slist_prepend(
-+					adapter->set_filter_list, client);
-+	else
-+		discovery_free(client);
+ 	struct btd_adapter *adapter = user_data;
++	bool enabled;
+ 	dbus_uint32_t value;
  
- 	/*
- 	 * If there are other client discoveries in progress, then leave
-@@ -1911,8 +1915,11 @@ static void stop_discovery_complete(uint8_t status, uint16_t length,
- 		goto done;
- 	}
+ 	dbus_message_iter_get_basic(iter, &value);
+@@ -2888,8 +2974,19 @@ static void property_set_discoverable_timeout(
+ 	g_dbus_emit_property_changed(dbus_conn, adapter->path,
+ 				ADAPTER_INTERFACE, "DiscoverableTimeout");
  
--	if (client->msg)
-+	if (client->msg) {
- 		g_dbus_send_reply(dbus_conn, client->msg, DBUS_TYPE_INVALID);
-+		dbus_message_unref(client->msg);
-+		client->msg = NULL;
++	if (adapter->pending_settings & MGMT_SETTING_DISCOVERABLE) {
++		if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
++			enabled = false;
++		else
++			enabled = true;
++	} else {
++		if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
++			enabled = true;
++		else
++			enabled = false;
 +	}
  
- 	adapter->discovery_type = 0x00;
- 	adapter->discovery_enable = 0x00;
-@@ -1925,7 +1932,7 @@ static void stop_discovery_complete(uint8_t status, uint16_t length,
- 	trigger_passive_scanning(adapter);
- 
- done:
--	discovery_remove(client);
-+	discovery_remove(client, false);
- }
- 
- static int compare_sender(gconstpointer a, gconstpointer b)
-@@ -2146,14 +2153,14 @@ static int update_discovery_filter(struct btd_adapter *adapter)
- 	return -EINPROGRESS;
- }
- 
--static int discovery_stop(struct watch_client *client)
-+static int discovery_stop(struct watch_client *client, bool exit)
- {
- 	struct btd_adapter *adapter = client->adapter;
- 	struct mgmt_cp_stop_discovery cp;
- 
- 	/* Check if there are more client discovering */
- 	if (g_slist_next(adapter->discovery_list)) {
--		discovery_remove(client);
-+		discovery_remove(client, exit);
- 		update_discovery_filter(adapter);
- 		return 0;
- 	}
-@@ -2163,7 +2170,7 @@ static int discovery_stop(struct watch_client *client)
- 	 * and so it is enough to send out the signal and just return.
- 	 */
- 	if (adapter->discovery_enable == 0x00) {
--		discovery_remove(client);
-+		discovery_remove(client, exit);
- 		adapter->discovering = false;
- 		g_dbus_emit_property_changed(dbus_conn, adapter->path,
- 					ADAPTER_INTERFACE, "Discovering");
-@@ -2188,7 +2195,7 @@ static void discovery_disconnect(DBusConnection *conn, void *user_data)
- 
- 	DBG("owner %s", client->owner);
- 
--	discovery_stop(client);
-+	discovery_stop(client, true);
+-	if (adapter->current_settings & MGMT_SETTING_DISCOVERABLE)
++	if (enabled)
+ 		set_discoverable(adapter, 0x01, adapter->discoverable_timeout);
  }
  
- /*
-@@ -2586,7 +2593,7 @@ static DBusMessage *stop_discovery(DBusConnection *conn,
- 	if (client->msg)
- 		return btd_error_busy(msg);
- 
--	err = discovery_stop(client);
-+	err = discovery_stop(client, false);
- 	switch (err) {
- 	case 0:
- 		return dbus_message_new_method_return(msg);
 -- 
-2.17.1
+2.7.4
+
-- 
2.17.1




