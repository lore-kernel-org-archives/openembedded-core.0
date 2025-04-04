Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7034AC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 21:41:36 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.8609.1743802887833594431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 14:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=On/6u9sn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20250404214125ad61fc2f6f8dff80fa-_6tf3b@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20250404214125ad61fc2f6f8dff80fa
        for <openembedded-core@lists.openembedded.org>;
        Fri, 04 Apr 2025 23:41:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zKzDn8tsZ9Ni2aLtfnCuoaxuZafYkjdeDAvZohjeNtE=;
 b=On/6u9sn8vpirqchrxILcuEb01VBE0h7qbQ4Phowy45w0pMrTWst3Dc2fFT3iIVDkqfLuL
 UPBpluFOv70LoaTYXjCZ7FrE6F8/sLsSkTD/YT3WzsYIJRSx+bVd9zl6OqwZSWgXyPjB/ofH
 t9zYVNOorjTWKuGHnHg5h7Ol6P1OaumZXhTDPFtbLhADphke7KN/7kQdEZstBh8i3CAQ/HvW
 Byj8xDHOhREi+oi9Cz/UtMCaK/iCd2dW/rEz4T44CNHXJUMC+H7J/UPOtBWSMgYEnwy61xas
 7FkqtuCUyUAxBNgm+96UsKZnxVzr+duVcXPqJdQQBI7jtbMG3p0B1e8w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] ofono: patch CVE-2024-7537
Date: Fri,  4 Apr 2025 23:40:38 +0200
Message-Id: <20250404214038.2829979-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 21:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214369

From: Peter Marko <peter.marko@siemens.com>

Pick commit
https://web.git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ofono/ofono/CVE-2024-7537.patch           | 59 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch
new file mode 100644
index 0000000000..518b042d5b
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch
@@ -0,0 +1,59 @@
+From e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Sun, 16 Mar 2025 12:26:42 +0200
+Subject: [PATCH] qmi: sms: Fix possible out-of-bounds read
+
+Fixes: CVE-2024-7537
+
+CVE: CVE-2024-7537
+Upstream-Status: Backport [https://web.git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ drivers/qmimodem/sms.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/qmimodem/sms.c b/drivers/qmimodem/sms.c
+index 3e2bef6e..75863480 100644
+--- a/drivers/qmimodem/sms.c
++++ b/drivers/qmimodem/sms.c
+@@ -485,6 +485,8 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 	const struct qmi_wms_result_msg_list *list;
+ 	uint32_t cnt = 0;
+ 	uint16_t tmp;
++	uint16_t length;
++	size_t msg_size;
+ 
+ 	DBG("");
+ 
+@@ -494,7 +496,7 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 		goto done;
+ 	}
+ 
+-	list = qmi_result_get(result, QMI_WMS_RESULT_MSG_LIST, NULL);
++	list = qmi_result_get(result, QMI_WMS_RESULT_MSG_LIST, &length);
+ 	if (list == NULL) {
+ 		DBG("Err: get msg list empty");
+ 		goto done;
+@@ -503,6 +505,13 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 	cnt = GUINT32_FROM_LE(list->cnt);
+ 	DBG("msgs found %d", cnt);
+ 
++	msg_size = cnt * sizeof(list->msg[0]);
++
++	if (length != sizeof(list->cnt) + msg_size) {
++		DBG("Err: invalid msg list count");
++		goto done;
++	}
++
+ 	for (tmp = 0; tmp < cnt; tmp++) {
+ 		DBG("unread type %d ndx %d", list->msg[tmp].type,
+ 			GUINT32_FROM_LE(list->msg[tmp].ndx));
+@@ -516,8 +525,6 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 
+ 	/* save list and get 1st msg */
+ 	if (cnt) {
+-		int msg_size = cnt * sizeof(list->msg[0]);
+-
+ 		data->msg_list = g_try_malloc0(sizeof(list->cnt) + msg_size);
+ 		if (data->msg_list == NULL)
+ 			goto done;
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 1083b91d56..9f11af9236 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -25,6 +25,7 @@ SRC_URI = "\
     file://CVE-2024-7546.patch \
     file://CVE-2024-7547.patch \
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
+    file://CVE-2024-7537.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 

