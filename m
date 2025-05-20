Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 727CEC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 20:22:04 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.1105.1747772519227244388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 13:21:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FcjBUjZv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2025052020215389bdffd492074cc0f0-ddw5tf@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2025052020215389bdffd492074cc0f0
        for <openembedded-core@lists.openembedded.org>;
        Tue, 20 May 2025 22:21:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=EK1qbg5ISxw6p+C9akK1WuBvbSLeMcciLVJmaiZ/5h8=;
 b=FcjBUjZvpL0nGziUqwyxjsj5S0AEr+m2dlXiUv9FV6et2pXz4+LLLaL+xTN5FI12r62BG2
 enuuEbkph5mZEhVnxdyCCztMD+VYd6TUcM86YpUh5cyphVoTtzW6qIKg1jSIRnSTNeyv1spm
 PIUPSN8ObcyE8JE2hHZWCn9Ds71PyQhxh+YTd5J9QGF6oKIzWYWZsv8gtOqYNyUhtTpwD4V7
 Vx2j3xOy0/y+FK6JzBtQjNzFPc6Z8MrPdFLi6JtxYMDqpDCUco2OcHjcD0P/FLml5kuIY1TW
 LaOvlZeJz13HhZ5m23axg1myEbpYDDa9bjrz4UEImTS96QET2R6AJrOQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 4/8] ofono: patch CVE-2024-7537
Date: Tue, 20 May 2025 22:20:29 +0200
Message-Id: <20250520202033.2352749-4-peter.marko@siemens.com>
In-Reply-To: <20250520202033.2352749-1-peter.marko@siemens.com>
References: <20250520202033.2352749-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 20:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216946

From: Peter Marko <peter.marko@siemens.com>

Pick commit
https://web.git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ofono/ofono/CVE-2024-7537.patch           | 59 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.15.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch
new file mode 100644
index 0000000000..4a7cd12297
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
+@@ -442,6 +442,8 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 	const struct qmi_wms_result_msg_list *list;
+ 	uint32_t cnt = 0;
+ 	uint16_t tmp;
++	uint16_t length;
++	size_t msg_size;
+ 
+ 	DBG("");
+ 
+@@ -451,7 +453,7 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 		goto done;
+ 	}
+ 
+-	list = qmi_result_get(result, QMI_WMS_RESULT_MSG_LIST, NULL);
++	list = qmi_result_get(result, QMI_WMS_RESULT_MSG_LIST, &length);
+ 	if (list == NULL) {
+ 		DBG("Err: get msg list empty");
+ 		goto done;
+@@ -460,6 +462,13 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 	cnt = L_LE32_TO_CPU(list->cnt);
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
+ 			L_LE32_TO_CPU(list->msg[tmp].ndx));
+@@ -473,8 +482,6 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 
+ 	/* save list and get 1st msg */
+ 	if (cnt) {
+-		int msg_size = cnt * sizeof(list->msg[0]);
+-
+ 		data->msg_list = l_malloc(sizeof(list->cnt) + msg_size);
+ 		data->msg_list->cnt = cnt;
+ 		memcpy(data->msg_list->msg, list->msg, msg_size);
diff --git a/meta/recipes-connectivity/ofono/ofono_2.15.bb b/meta/recipes-connectivity/ofono/ofono_2.15.bb
index 40eeb3a086..07d7ac6095 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.15.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.15.bb
@@ -9,6 +9,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
+           file://CVE-2024-7537.patch \
            "
 SRC_URI[sha256sum] = "1af93ab72a70502452fe3d0297a6eaea13750cacae1fff3b643dd2245a6408ca"
 

