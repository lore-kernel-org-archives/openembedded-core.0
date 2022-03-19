Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FF0C433F5
	for <webhook@archiver.kernel.org>; Sat, 19 Mar 2022 22:41:07 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.12786.1647729666360603613
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 15:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qvp1aZeC;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id qx21so23238452ejb.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Mar 2022 15:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F6hTYYFGYAOX4xgDjlfw2ZS2p9XhZU/mmKMlnXUkmlk=;
        b=Qvp1aZeC3XTx0kWU9QLoFNBQGFjn+mSg0lm6hu0cvwjaK6ffVsGaFWJFVUUIfCZxlN
         fEs76BYvTPVuCglg39vIBUDQsU3FWme5OlA7qDAKThQdAXTM9ziYoAEFxE5h8Fy2A5Rx
         Uh81pO20CzbUs6+oL+6WQL5qsEQVQ2+nzghTyP4nNxb6aHfbhlhFI3uxwBogi5ezAzU2
         rOqZRBbJbtb2mL/KHGWrf/CgE1K8M8Uw/SLEzz4iX+17tD6ToTPd84LdYasNC7mlhb5c
         8Yt7PSYrVYb11BLd64ywVOKZePukXqGrBM2POHH+cbITC3We6TXqJX/JhMjyVI6+gNp3
         E4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F6hTYYFGYAOX4xgDjlfw2ZS2p9XhZU/mmKMlnXUkmlk=;
        b=BOXd3yGeUGDu12fAx0XlkNfMcqOQc+WJryb734Q/j3wnxWIiYnTaZoLKJy2/RpzOs1
         AzXIECp6kpxRM0bseV0khRqbnvP4g8Quy6iu6gNSDKRNE4UQkOwdRKfV834MKCY4jBma
         hZ/DIr0r0tKBa75duygBdG7MXCRi89otcxOInqBW22ept7/FrYixNJtRyg+9Iu1gDowH
         GjTt5WpzXCVAdL6W/hX8HwyBUPSk6mJcO4eOwLWtw1u0amVbt5URFvPLSf7VFxYjH9aP
         +Bqpw3FzuB1VIKDKqB7d1/9SuYh0Ugu4EBwIahlIPoQxuGBA+lDR/c1skE8J8IVO394S
         biNA==
X-Gm-Message-State: AOAM530JHpJy0HlVpwa55ztEyM+bwQER1MZM7blD8X4JMCarfgDW5Ffn
	cH5I/s29CfgAQg8rf9vHqZuvtLAvZqrn0g==
X-Google-Smtp-Source: 
 ABdhPJzrG+tzf89t7SgoRFxvAyu7R+zCjsbIXV5tHbQK5kUv3QSTaUytDYp63+xaqcaGzemVJnLsIw==
X-Received: by 2002:a17:907:7205:b0:6df:b8c9:e68e with SMTP id
 dr5-20020a170907720500b006dfb8c9e68emr8017949ejc.507.1647729664557;
        Sat, 19 Mar 2022 15:41:04 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 i21-20020a1709061cd500b006da62ab503csm5169200ejh.157.2022.03.19.15.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 15:41:04 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] bluez5: fix CVE-2021-3658
Date: Sat, 19 Mar 2022 23:40:52 +0100
Message-Id: <20220319224052.43178-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Mar 2022 22:41:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163477

adapter incorrectly restores Discoverable state after powered down

Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b497b5942a8beb8f89ca1c359c54ad67ec843055]
CVE: CVE-2021-3658
Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2021-3658.patch         | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3658.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 34796fdd20..7cf061dcf6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,6 +54,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://CVE-2021-0129.patch \
            file://CVE-2021-3588.patch \
+          file://CVE-2021-3658.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3658.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3658.patch
new file mode 100644
index 0000000000..1738ca13da
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3658.patch
@@ -0,0 +1,95 @@
+From b497b5942a8beb8f89ca1c359c54ad67ec843055 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Thu, 24 Jun 2021 16:32:04 -0700
+Subject: [PATCH] adapter: Fix storing discoverable setting
+
+discoverable setting shall only be store when changed via Discoverable
+property and not when discovery client set it as that be considered
+temporary just for the lifetime of the discovery.
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b497b5942a8beb8f89ca1c359c54ad67ec843055]
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
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
+2.25.1
+
-- 
2.25.1


