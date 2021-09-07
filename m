Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.32582.1630998136647915212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207344455"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="207344455"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:16 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="537804491"
Received: from tengjieg-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.164])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:14 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/11] bluez5: fix CVE-2021-3658
Date: Tue,  7 Sep 2021 15:01:58 +0800
Message-Id: <0559cba2b46883e2d0178d611b164814a989df37.1630997270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630997270.git.anuj.mittal@intel.com>
References: <cover.1630997270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backporting upstream fix since the uprev from 5.60 -> 5.61 does include
some minor functionality changes.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...ter-Fix-storing-discoverable-setting.patch | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index a7b628ce1b..0d30b1a3f5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -52,6 +52,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-adapter-Fix-storing-discoverable-setting.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
new file mode 100644
index 0000000000..c2a5edd226
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
@@ -0,0 +1,100 @@
+From b497b5942a8beb8f89ca1c359c54ad67ec843055 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Thu, 24 Jun 2021 16:32:04 -0700
+Subject: [PATCH] adapter: Fix storing discoverable setting
+
+discoverable setting shall only be store when changed via Discoverable
+property and not when discovery client set it as that be considered
+temporary just for the lifetime of the discovery.
+
+Upstream-Status: Backport
+(https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=b497b5942a8beb8f89ca1c359c54ad67ec843055)
+
+CVE: CVE-2021-3658
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+---
+ src/adapter.c | 35 ++++++++++++++++++++++-------------
+ 1 file changed, 22 insertions(+), 13 deletions(-)
+
+diff --git a/src/adapter.c b/src/adapter.c
+index 12e4ff5c0..663b778e4 100644
+--- a/src/adapter.c
++++ b/src/adapter.c
+@@ -560,7 +560,11 @@ static void settings_changed(struct btd_adapter *adapter, uint32_t settings)
+ 	if (changed_mask & MGMT_SETTING_DISCOVERABLE) {
+ 		g_dbus_emit_property_changed(dbus_conn, adapter->path,
+ 					ADAPTER_INTERFACE, "Discoverable");
+-		store_adapter_info(adapter);
++		/* Only persist discoverable setting if it was not set
++		 * temporarily by discovery.
++		 */
++		if (!adapter->discovery_discoverable)
++			store_adapter_info(adapter);
+ 		btd_adv_manager_refresh(adapter->adv_manager);
+ 	}
+ 
+@@ -2162,8 +2166,6 @@ static bool filters_equal(struct mgmt_cp_start_service_discovery *a,
+ static int update_discovery_filter(struct btd_adapter *adapter)
+ {
+ 	struct mgmt_cp_start_service_discovery *sd_cp;
+-	GSList *l;
+-
+ 
+ 	DBG("");
+ 
+@@ -2173,17 +2175,24 @@ static int update_discovery_filter(struct btd_adapter *adapter)
+ 		return -ENOMEM;
+ 	}
+ 
+-	for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
+-		struct discovery_client *client = l->data;
++	/* Only attempt to overwrite current discoverable setting when not
++	 * discoverable.
++	 */
++	if (!(adapter->current_settings & MGMT_OP_SET_DISCOVERABLE)) {
++		GSList *l;
+ 
+-		if (!client->discovery_filter)
+-			continue;
++		for (l = adapter->discovery_list; l; l = g_slist_next(l)) {
++			struct discovery_client *client = l->data;
+ 
+-		if (client->discovery_filter->discoverable)
+-			break;
+-	}
++			if (!client->discovery_filter)
++				continue;
+ 
+-	set_discovery_discoverable(adapter, l ? true : false);
++			if (client->discovery_filter->discoverable) {
++				set_discovery_discoverable(adapter, true);
++				break;
++			}
++		}
++	}
+ 
+ 	/*
+ 	 * If filters are equal, then don't update scan, except for when
+@@ -2216,8 +2225,7 @@ static int discovery_stop(struct discovery_client *client)
+ 		return 0;
+ 	}
+ 
+-	if (adapter->discovery_discoverable)
+-		set_discovery_discoverable(adapter, false);
++	set_discovery_discoverable(adapter, false);
+ 
+ 	/*
+ 	 * In the idle phase of a discovery, there is no need to stop it
+@@ -6913,6 +6921,7 @@ static void adapter_stop(struct btd_adapter *adapter)
+ 	g_free(adapter->current_discovery_filter);
+ 	adapter->current_discovery_filter = NULL;
+ 
++	set_discovery_discoverable(adapter, false);
+ 	adapter->discovering = false;
+ 
+ 	while (adapter->connections) {
+-- 
+2.33.0
+
-- 
2.31.1

