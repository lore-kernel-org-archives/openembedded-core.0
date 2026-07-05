Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B505C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139206.1783291364071562634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3Q0xhc59;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-475417f010dso1234106f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291362; x=1783896162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqVBp0FMx5u7D4u2Zqy1T1Jxmr6TggyRgVTuN1CCnxY=;
        b=3Q0xhc59qjzQo0cJMdCIdr3MgT4fIDyEJHkhQ2jzt6XYWWTJzoNq2ta+DjDWKaE9AC
         b9J+zleXf+/qx7P7kcLj+mS3bWC32ZArNbEkS9M32da3eevVOyDkSXdyna+tMB8I8bd+
         mnuUzShI1D3baQv058+DwMyTUwBNKK2PZdWkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291362; x=1783896162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hqVBp0FMx5u7D4u2Zqy1T1Jxmr6TggyRgVTuN1CCnxY=;
        b=sR7OMzaBJh+vAMYDhVn7o71N2De5xk8AU8tqAIC4jMMyu4C1+NLIBtlDp0veFIL4Lj
         5nEkSR8ioegQBvl+FTxFgWyoNYmmbz/1fLVFxS46tBlbQSH/oC8IkDOzqY9+RCSUrQ1p
         CCd+Wyx9M6CgXHpQ7ycSngMbfHoqV/UjJQ7B4cjKolCGx/0N5vivRm2y9eJk+25v/LoB
         9kRSXBR5X17gn4GRgTna0BWWsc5BmKrb5yksajU/lEuxcK0SnPkCNFylNy6iCWHilz3P
         Tpr+qCRkyINqnZsHKbKqkncx/ReVjgXelchq8UDyc+4goqvmjXsI57oWk9Z+FMfUx5PE
         Q77A==
X-Gm-Message-State: AOJu0YzXMcKADzp93OqsaLzfhzR0HlB9eiS0T2ZNPlFxZkuZarZdIW5f
	3NudiUEVt7uqyHEN0vCrzVM03uxmBDA7H19pwI0usFLiS5JdKhopNTuNltIkpM0BoiaeY/vb/M8
	tOQMp+Uc=
X-Gm-Gg: AfdE7ckvKDrOUwy6UrhBXZpNPkgG2Hq9cbPKeXmdSIjWYgY5kv8oSQ0Dl1znRU7GwfE
	AiYTix95nsJkpH3WVjcuVqvcZKwtsmSlT8pmdSQjhi6vqMjpGuv/f2e/8D0Ty3xUEOCMyFjtbxP
	HjbsQbnwp2nUAKstDzIEmUCRZ7YbPYuz0TBIxXtqPHG7I6iBk0/d8/s5DhBU9CDz0iiJ7maF2VX
	MQocdwjrhnTa5bXZy87AEHWIA+2Yie/y8NqJ6KPz8xQqSPHJ0sKo3M5QaSutRPkAnTACTWAtNpg
	hZbURY2hlDtrMmZ4s8Hb8LDRsqKZjE4fg03JKgHDVX7MSPceLhItR3KYe4PQ1KaBafjO7HJPSuA
	eUn0waz8Bh7gB+fXeLhPhQBaPaZRHxo67OWankkwZMvabeueW9AFTz25Jo3EvStokMsEGzzgaM0
	k1TkSlcp5NWAh4aiaFt5VNNTXeVQ==
X-Received: by 2002:adf:f3c8:0:b0:470:a7d8:75f5 with SMTP id ffacd0b85a97d-47aab77041emr6253084f8f.42.1783291362249;
        Sun, 05 Jul 2026 15:42:42 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/55] bluez5: fix gatt cache sync issue
Date: Mon,  6 Jul 2026 00:40:53 +0200
Message-ID: <42e311bae67ea0d4bfe1ff7e223bdf93e049c0ae.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240157

From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>

There is a timing issue to update DB Hash value.

The gatt_client_service_changed() callback in src/device.c
is called from service_changed_complete() in gatt-client.c,
which is invoked after db_hash_read_cb() has already updated
the hash. Adding store_gatt_db(device) here guarantees the
db is persisted with the correct, up-to-date hash for both
the addition and removal cases.

Upstream-Status: Backport [bluez/bluez@0fd01e9]
Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 137eeffd4faa50cc9f2574712217d97b1457a8f7)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-stored-gatt-cache-DB-Hash-value-no.patch | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 1600107b878..4e51cc9a213 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -73,6 +73,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
+           file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
new file mode 100644
index 00000000000..69323bdc5ee
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
@@ -0,0 +1,84 @@
+From 9ec8cad56e47c0555a056e928e6568d543b3ae0c Mon Sep 17 00:00:00 2001
+From: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
+Date: Wed, 1 Apr 2026 19:30:04 +0800
+Subject: [PATCH v1] src/device: Fix stored gatt cache DB Hash value not update
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There is an asymmetry in behavior: when services are added during
+the same connection (via Service Changed indication), the persistent
+storage (disk) is not updated with the new DB hash, but when services
+are removed, it is updated.
+
+During the same connection, We check DB hash value stored at
+/var/lib/bluetooth/<adaptor addr>/cache/<remote addr>.
+When established connection, the stored DB Hash value is A.Then we
+add new services, the stored DB Hash value is still A which should
+change to B. However, if we remove the existing services, the stored
+DB Hash value changed to C.
+
+When performing addition, it goes like this:
+
+discover_primary_cb()
+  └─> gatt_db_insert_service()      ← NEW service inserted into db
+        └─> gatt_service_added()    ← callback fires immediately
+              └─> store_gatt_db()   ← SAVED TO DISK (hash still OLD)
+  ...
+  └─> discovery_op_complete(success=true)
+        └─> read_db_hash(op)             ← sends ATT Read By Type
+              └─> [ATT response arrives]
+                    └─> db_hash_read_cb()
+                          ├─> gatt_db_attribute_write(op->hash, ...)
+                          │     └─> hash UPDATED IN MEMORY
+                          └─> discovery_op_complete(true, 0)
+                                ├─> [no services to remove, no
+                                │    store_gatt_db called]
+                                └─> service_changed_complete()
+
+Whereas removal perform like this:
+discovery_op_complete(success=true)  [1st call]
+  └─> read_db_hash(op)
+      └─> op->hash is NULL → sends ATT request → early return
+...
+[ATT response arrives]
+db_hash_read_cb()
+  └─> gatt_db_attribute_write(op->hash, ) ← hash UPDATED IN MEMORY
+  └─> discovery_op_complete(true, 0)          [2nd call]
+      └─> read_db_hash(op)  → op->hash already set → returns false
+      └─> gatt_db_remove_service()
+          └─> gatt_service_removed()
+              └─> store_gatt_db() ← SAVED TO DISK (hash is NEW)
+
+There is a timing issue to update DB Hash value.
+
+The gatt_client_service_changed() callback in src/device.c is called
+from service_changed_complete() in gatt-client.c, which is invoked
+after db_hash_read_cb() has already updated the hash. Adding
+store_gatt_db(device) here guarantees the db is persisted with the
+correct, up-to-date hash for both the addition and removal cases.
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/0fd01e98cf94616a5c1c39749314cdd4a1654687]
+Signed-off-by: Mengshi Wu <mengshi.wu@oss.qualcomm.com>
+---
+ src/device.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/device.c b/src/device.c
+index 3ea683667..cfbde307b 100644
+--- a/src/device.c
++++ b/src/device.c
+@@ -6267,7 +6267,11 @@ static void gatt_client_service_changed(uint16_t start_handle,
+ 							uint16_t end_handle,
+ 							void *user_data)
+ {
++	struct btd_device *device = user_data;
++
+ 	DBG("start 0x%04x, end: 0x%04x", start_handle, end_handle);
++
++	store_gatt_db(device);
+ }
+
+ static void gatt_debug(const char *str, void *user_data)
+--
+2.34.1

