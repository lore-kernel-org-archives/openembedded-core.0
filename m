Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032EFC02185
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:47:49 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.28749.1736801261168243855
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AKEN8jQd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2163b0c09afso86733905ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 12:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736801260; x=1737406060; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Em/fdgq7fFpSpYi6G+OqtZeFLjrpwCtbUe4YEH7Ndq0=;
        b=AKEN8jQdfVE7w2V6DtiuVTRukr2eZ31G6un+dAKpKx9EAH8DjpuLmU/X7HRFoNaFD0
         6nUZ5NtmC7HAMHfPWJNOPLoIxCqo1JonKBlY5dy+8ZvBitg47z9tbmB04ale8YOIYtHw
         +NsdNPK1Sti5WnBlt6io1wFc5ThsHvF42yCRMAzGGMgZu5BzXiU7UMHO2VaL41+3njRD
         CcrNdSSNpF0cG/3Hw1SwkUwb5jlXmEvBA3WaL8+S7lXPKUsib1CPVuoY9iw4ioJOYTej
         7wpX37Xpc8pIBAfj6MVbnDTyeB1+SkBkWGHEBtL1KY2y32eFPViQIuShoJpLjq3HnB8m
         +F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736801260; x=1737406060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Em/fdgq7fFpSpYi6G+OqtZeFLjrpwCtbUe4YEH7Ndq0=;
        b=n4xIvl9OZafvtOrL1vcg0t+hEgx06I4dB8vJoW/WSDlaqwiOZ5tgRUvk5dYXbnCzmE
         UctuKrSiAdFZQQAWYEg+K69Sw4/2362g4aoGPrdoLjkc/4KfAF/7W41WoD/dETTIJai9
         4Y+D/COhcs8+Tn+NwRIEm1Iyo3z9BwJ0/e5NMHvO4bS2Rb0wsgbCWOnq+LneZsDn/6dF
         GTKTuglqbZtJZ6RFk8EkdYiDArKOLOlyrr8QNS1aSoL7VjSz8cEZb7SUOibguOn4Z4oy
         2m4uo52XDrCl1907WYhtMlh6pKfKjiY05L2bfqNCcyB3+ZSQzqQl085r7W3NrGWeooWJ
         /NZw==
X-Gm-Message-State: AOJu0YxLtjykca7OcFUgPLZ45tfcDELxrKk/CrN+iXNnJj6TKFS/1dGq
	Heii9g+VJ+O21x42niIVLRZ4yUoqrA9KPH1puOYcqlIRVqQ7whPpyGlce4OHAeLYRTiFdxsdG/+
	BCvU=
X-Gm-Gg: ASbGncvtatpWMNRCNxWvjLk8rxBllVAfFBRmyjYkj3w3FOrjnYL30yHbYIl9HdNg9er
	7tdXw2LEvk9lubxQv3+RL7kIvSEpfRP+Uub1GaSQ7hlJ+Jkl9jcRLy6srTnCmmY/DdMq/Amc/L6
	g0NmNvPybx3wvEOPellXyBtK3tfN0JHjWWinQ4Im0d665cgSrv6/l0RskJHayz3dyTcjtMVE6OP
	DgPkQupDRyLEa0yNPYyoBxNeD+Ov17hx93XOd2MmfQHdA==
X-Google-Smtp-Source: AGHT+IFIon9Atep6pXHx+SsqFJLxPdtLBdf6WXecASHuDUTezQYakRjIoR9OBD7rxXUg+DYeIecnhw==
X-Received: by 2002:a05:6a00:2c86:b0:726:41e:b313 with SMTP id d2e1a72fcca58-72d21fc659dmr27834346b3a.16.1736801260349;
        Mon, 13 Jan 2025 12:47:40 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40549413sm6449435b3a.12.2025.01.13.12.47.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:47:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/15] bluez5: backport patch to fix address type when loading keys
Date: Mon, 13 Jan 2025 12:47:06 -0800
Message-ID: <d719d02f2f3ce8f54de0e10d89a8d389edb61fed.1736801113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736801113.git.steve@sakoman.com>
References: <cover.1736801113.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209758

From: Hiago De Franco <hiago.franco@toradex.com>

With Linux kernel v6.6, due to commit 59b047bc9808 ("Bluetooth:
MGMT/SMP: Fix address type when using SMP over BREDR/LE"), an error
might occur when trying to automatically repair a bluetooth device, as
the key might store using a wrong/invalid address type. This happens
only with bluez5 version 5.72:

HCI Event: Link Key Request (0x17) plen 6 bdaddr 8C:98:6B:7A:BD:F0
HCI Command: Link Key Request Negative Reply (0x01|0x000c) plen 6 bdaddr 8C:98:6B:7A:BD:F0

This was already solved upstream, therefore backport the patch to fix
this issue.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ix-up-address-type-when-loading-keys.patch | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-up-address-type-when-loading-keys.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 3f2f096aac..9cbeb5e99f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -54,6 +54,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file://0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
+           file://0001-adapter-Fix-up-address-type-when-loading-keys.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-up-address-type-when-loading-keys.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-up-address-type-when-loading-keys.patch
new file mode 100644
index 0000000000..a2c067b5fa
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-up-address-type-when-loading-keys.patch
@@ -0,0 +1,52 @@
+From 366a8c522b648f47147de4852c5c030d69b916b3 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Wed, 28 Aug 2024 11:30:16 -0400
+Subject: [PATCH] adapter: Fix up address type when loading keys
+
+Due to kernel change 59b047bc9808
+("Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE")
+some keys maybe store using the wrong/invalid address type as per MGMT
+API, so this attempts to fix them up.
+
+Fixes: https://github.com/bluez/bluez/issues/875
+Upstream-Status: Backport [366a8c522b648f47147de4852c5c030d69b916b3]
+Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
+---
+ src/adapter.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/src/adapter.c b/src/adapter.c
+index 245de4456868..9f44bdefa5f4 100644
+--- a/src/adapter.c
++++ b/src/adapter.c
+@@ -5017,12 +5017,28 @@ static void load_devices(struct btd_adapter *adapter)
+ 			goto free;
+ 		}
+ 
+-		if (key_info)
++		if (key_info) {
++			/* Fix up address type if it was stored with the wrong
++			 * address type since Load Link Keys are only meant to
++			 * work with BR/EDR addresses as per MGMT documentation.
++			 */
++			if (key_info->bdaddr_type != BDADDR_BREDR)
++				key_info->bdaddr_type = BDADDR_BREDR;
++
+ 			adapter->load_keys = g_slist_append(adapter->load_keys,
+ 								key_info);
++		}
++
++		if (ltk_info) {
++			/* Fix up address type if it was stored with the wrong
++			 * address type since Load Long Term Keys are only meant
++			 * to work with LE addresses as per MGMT documentation.
++			 */
++			if (ltk_info->bdaddr_type == BDADDR_BREDR)
++				ltk_info->bdaddr_type = BDADDR_LE_PUBLIC;
+ 
+-		if (ltk_info)
+ 			ltks = g_slist_append(ltks, ltk_info);
++		}
+ 
+ 		if (peripheral_ltk_info)
+ 			ltks = g_slist_append(ltks, peripheral_ltk_info);
-- 
2.43.0


