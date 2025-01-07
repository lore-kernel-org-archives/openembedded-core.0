Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4E8E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 19:24:15 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.859.1736277849414195248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 11:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZiZmHOLx;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21661be2c2dso215207095ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 11:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736277849; x=1736882649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VYqHXNd9clLWEuY+1h1LIB5aowJBpgZu+sA38qCzUAI=;
        b=ZiZmHOLx6/DASbBMY73K+7wESV+30IDNsEfsYwD7dXXFtexmm9tfHjiYGj+BJ/zKg7
         tQuf5YWNf6Y1mChBrs4HrCwSnr6Y73wy24L6Alxd1zSU+WoHeU08MCSGzpzUZrXnb4bx
         l27XqfyyQoAhbB7nJqXWyMu/8VXehLzDVRkZ9aFHQxBDlDfbeFCShkB+04aTvSBoqo6w
         VYFedZYaHp9svW+ozbOCfuETY1W01Fw7uBRml3XgojRMsIxR9joW+GE2DqDGIXvtBEKI
         ek4Q0figCRu48RaDBwoDuNXEfW7G3+DuwlbjdHlylfzjmefDffjylyRyqZkYgLsizAm8
         PqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736277849; x=1736882649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYqHXNd9clLWEuY+1h1LIB5aowJBpgZu+sA38qCzUAI=;
        b=e7sMg+oFT92Fktr1+QyVgo7Y7WrV8W4ub3oS0GkkP2pF8HEXDxmJA1Az+qT5yH8WOh
         gL5t2DRmyqUM7tUlkFUYZW2WOZPKWbYYpDNX97gYNFeC+XughNkSdrbwbIO57GCt+GJM
         8n1/RSpkaUHTFQh5MQtXt+M0vkpbY63xmnvReu/UW38w8UIvNa7sznohII4L20dALCK2
         +UwK3Cw3CP5r07m50X+/suUmixGoWlTgK3Kt57iUrh9bEOvrzl3fHURIEKBzJQKgjP+L
         K1ZzkpQukfRTaPtKYd/KserRWb0BZkhCIHK8W/gvkCqnD6ZtCyAYPHHPHcORm885EE1g
         pLOw==
X-Gm-Message-State: AOJu0YxNYq8cInUz38LOwHVoD2b7/oYAc6ZosPdi+jRLIazphDZMwLhw
	FDfhyXsc6OZxYCXjLkDJmi82/Ft9N2yRL3Hx8phEAro28JnctFRe6ko+6w==
X-Gm-Gg: ASbGncv4ev0qZlTBiC6rJKWf4Yf+w5abV/qnYbd+bOzA2YZdfvDq8Qlb3lyucT4EwAP
	nLypKeUS//E+OyGcTWDV3TDbEmanC2jktwanBlx94Y0fbvUhE7A2GWdn6eI1OEbEnM1+VWkZtG/
	Mm/wtojBIlFI/vjFYmjm1i8B9ia6c9yxZ6NYq90JdD6zFZOEqhzDP1jOU3UHqJM8/0EJweswygn
	Fk1sPaAh3/Mg3LYmYEgvLppyDPlFFeVfhx/FXYYQLArPzutPub44fD7rA1tMMXm00VvH0AZsV4J
	bJY=
X-Google-Smtp-Source: AGHT+IHkr7C8soGEQKams6r9IZWoxTM2PxO549iufJZ8aCQ3afEYe4X0c7kWJG+fGsb3A//IQqfLbg==
X-Received: by 2002:a17:902:e74e:b0:215:aee1:7e3e with SMTP id d9443c01a7336-21a83f36d48mr3588635ad.5.1736277848512;
        Tue, 07 Jan 2025 11:24:08 -0800 (PST)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc971814sm312019835ad.79.2025.01.07.11.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 11:24:08 -0800 (PST)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [scarthgap][PATCH] bluez5: backport patch to fix address type when loading keys
Date: Tue,  7 Jan 2025 16:23:01 -0300
Message-Id: <20250107192301.62009-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 19:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209502

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
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ix-up-address-type-when-loading-keys.patch | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-up-address-type-when-loading-keys.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 3f2f096aaccb..9cbeb5e99f0d 100644
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
index 000000000000..a2c067b5faa6
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
2.39.5


