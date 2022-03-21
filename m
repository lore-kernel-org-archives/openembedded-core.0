Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8812BC433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:39 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.2473.1647901778201591853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pN7BwqGN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so559371pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=giQsGTRC4suQeu3qNNVyGHijy3/rXGee6EiR8EYxdn4=;
        b=pN7BwqGNyFiHyebXCVpMQ2mbVqRQwkrhu3BWDb6ugerwacXhomzLOTBforW4n9XA89
         npwjdBPYrr+eW7TPjizr5+1GP1wFmwPf6uS0OzhdZfE9MbOrMRqr7mjRdus8LQ5rPBid
         3pyhiFWeMmgfSib2cSQ1xxoEggItDm1X4lnxrI0CIvBwTWyTPCaQTFB6Qkiamk2Y4uS3
         l5NF8Ca/2xWh9Xx1mGs+CmYaJPN+4qRWQh6LiSmlFCUw5Hw8fKOzRk15pzHSEDv7pYvp
         I+Wt79IshzV+BTYu/KhF+rF6R8LiKy4o2iBX9v/q58lGNq3sEK2gieFPBInbZotK8Opi
         X3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=giQsGTRC4suQeu3qNNVyGHijy3/rXGee6EiR8EYxdn4=;
        b=SMerPD0NcG5qoABr47dI6GwFjV+BNBBWl1AOFBoK6Qn4OdOaIh9z5kuD9ARicAncWD
         +hCAXSiKfJXZPX5ho53NH7GcYnRHHfpOBK7v0bptEzYZX321/IDC+N4L5Hg9sS+6o811
         oRs3V5JdmoGIQ+f1oOvuD75Z9/2rcd6BOj2NHWsmZyXNDMcSJZDN6xGYd+pMuqcPqKEQ
         kTJ/KB3gnnV/yFGD+3f3Ekcibyjd4mXgqAX8+gtmA7KJ2j1F+tyL7BN6TPNmXtHKgj54
         VsHL8Xt2WAQAweTa8JJ0z/tjudA3J99EzwDt4q4+CrgpKmUiLlthnNJ+dPX+CgKcavMH
         2lKw==
X-Gm-Message-State: AOAM532IF9POT9dUt643r1nlvOcv6fj3UE5KEtBqzDSPUjQ3V9/7ByAl
	+cUSLgpOnhTwgAaeccVuuEu1FAxIT3+qVZtQCTg=
X-Google-Smtp-Source: 
 ABdhPJx2psEgbV+RdMjh/RhZer44/pbh1v0qEYasEaXhDPutPDyJODdJDYnSFSj4pMMOcQwJQTdZUA==
X-Received: by 2002:a17:902:e94f:b0:14f:1636:c8a8 with SMTP id
 b15-20020a170902e94f00b0014f1636c8a8mr14763872pll.130.1647901777224;
        Mon, 21 Mar 2022 15:29:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/13] bluez5: fix CVE-2021-3658
Date: Mon, 21 Mar 2022 12:29:05 -1000
Message-Id: 
 <12669ab256a3ffbcb4bcbaba1bc9c690920d32b1.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163518

From: Minjae Kim <flowergom@gmail.com>

adapter incorrectly restores Discoverable state after powered down

Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b497b5942a8beb8f89ca1c359c54ad67ec843055]
CVE: CVE-2021-3658
Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


