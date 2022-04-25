Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197F8C388F3
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.27250.1650878279337916358
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 02:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23P9HwY9008055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 02:17:58 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 25 Apr 2022 02:17:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 25 Apr 2022 02:17:58 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 25 Apr 2022 02:17:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] bluez5: Fix CVE-2022-0204
Date: Mon, 25 Apr 2022 17:17:56 +0800
Message-ID: <20220425091756.1290963-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164812

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2022-0204.

[1] https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=591c546c536b42bef696d027f64aa22434f8c3f0

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../bluez5/bluez5/CVE-2022-0204.patch         | 70 +++++++++++++++++++
 .../bluez5/bluez5_5.56.bb                     |  3 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
new file mode 100644
index 0000000000..d4862f232b
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
@@ -0,0 +1,70 @@
+From 591c546c536b42bef696d027f64aa22434f8c3f0 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Tue, 8 Jun 2021 16:46:49 -0700
+Subject: [PATCH] shared/gatt-server: Fix heap overflow when appending prepare
+ writes
+
+The code shall check if the prepare writes would append more the
+allowed maximum attribute length.
+
+Fixes https://github.com/bluez/bluez/security/advisories/GHSA-479m-xcq5-9g2q
+
+CVE: CVE-2022-0204
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=591c546c536b42bef696d027f64aa22434f8c3f0]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/shared/gatt-server.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/src/shared/gatt-server.c b/src/shared/gatt-server.c
+index dc4e681c9..9beec44be 100644
+--- a/src/shared/gatt-server.c
++++ b/src/shared/gatt-server.c
+@@ -779,6 +779,20 @@ static uint8_t authorize_req(struct bt_gatt_server *server,
+ 						server->authorize_data);
+ }
+ 
++static uint8_t check_length(uint16_t length, uint16_t offset)
++{
++	if (length > BT_ATT_MAX_VALUE_LEN)
++		return BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
++
++	if (offset > BT_ATT_MAX_VALUE_LEN)
++		return BT_ATT_ERROR_INVALID_OFFSET;
++
++	if (length + offset > BT_ATT_MAX_VALUE_LEN)
++		return BT_ATT_ERROR_INVALID_ATTRIBUTE_VALUE_LEN;
++
++	return 0;
++}
++
+ static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
+ 					uint16_t length, void *user_data)
+ {
+@@ -809,6 +823,10 @@ static void write_cb(struct bt_att_chan *chan, uint8_t opcode, const void *pdu,
+ 				(opcode == BT_ATT_OP_WRITE_REQ) ? "Req" : "Cmd",
+ 				handle);
+ 
++	ecode = check_length(length, 0);
++	if (ecode)
++		goto error;
++
+ 	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
+@@ -1299,6 +1317,10 @@ static void prep_write_cb(struct bt_att_chan *chan, uint8_t opcode,
+ 	util_debug(server->debug_callback, server->debug_data,
+ 				"Prep Write Req - handle: 0x%04x", handle);
+ 
++	ecode = check_length(length, offset);
++	if (ecode)
++		goto error;
++
+ 	ecode = check_permissions(server, attr, BT_ATT_PERM_WRITE_MASK);
+ 	if (ecode)
+ 		goto error;
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb b/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
index ae0f72b678..84773c08b1 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
@@ -1,5 +1,8 @@
 require bluez5.inc
 
+SRC_URI += "file://CVE-2022-0204.patch \
+           "
+
 SRC_URI[md5sum] = "e6c51b2aefa7c56ff072819a78611fa5"
 SRC_URI[sha256sum] = "59c4dba9fc8aae2a6a5f8f12f19bc1b0c2dc27355c7ca3123eed3fe6bd7d0b9d"
 
-- 
2.25.1


