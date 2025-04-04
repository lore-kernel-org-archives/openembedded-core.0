Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F02C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 21:41:16 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.8603.1743802870794286656
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 14:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=MlBgO9OY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202504042141079d76ddf6feacc268e6-lhzpqb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202504042141079d76ddf6feacc268e6
        for <openembedded-core@lists.openembedded.org>;
        Fri, 04 Apr 2025 23:41:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NgL3wukCxp8/6ObDP26vOHD4gAiQU0zRlUoYdmjFH2s=;
 b=MlBgO9OYRJ20ZJj7cSWY0IWFuGYGKM5YaHAu3nrhyujsMfiUHWRdbt3rRN5zPm61oCu0VJ
 sWflwa1jNCCykEqI1f3QsG8DAjOSFYZECNswQIefSVBtYsGZvaYMX/VRQeGL/DCniaTWJuMw
 C1jt4S54VOXsGokIPbc0pOXYWx3wkMP9nn+XtQvwwHLfhcGp2f2b2ASQTqFYBO1+CINORf06
 mc7pzz4/Sp4K8nk7xTf6FY9zbmOp3UJ583dEf25/cEC8pp09rztyjOwf5ksb1Xzr/yi+xfk6
 hgWCJJnQXl3UJK0MwgusM6kscOvHn5JdU/qU8VQ5T1SHs1NvQPSTbP8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] ofono: patch CVE-2024-7537
Date: Fri,  4 Apr 2025 23:40:15 +0200
Message-Id: <20250404214015.2829921-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 21:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214368

From: Peter Marko <peter.marko@siemens.com>

Pick commit
https://web.git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ofono/ofono/CVE-2024-7537.patch           | 59 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.4.bb  |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7537.patch
new file mode 100644
index 0000000000..6e131121f2
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
+@@ -467,6 +467,8 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 	const struct qmi_wms_result_msg_list *list;
+ 	uint32_t cnt = 0;
+ 	uint16_t tmp;
++	uint16_t length;
++	size_t msg_size;
+ 
+ 	DBG("");
+ 
+@@ -476,7 +478,7 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 		goto done;
+ 	}
+ 
+-	list = qmi_result_get(result, QMI_WMS_RESULT_MSG_LIST, NULL);
++	list = qmi_result_get(result, QMI_WMS_RESULT_MSG_LIST, &length);
+ 	if (list == NULL) {
+ 		DBG("Err: get msg list empty");
+ 		goto done;
+@@ -485,6 +487,13 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
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
+@@ -498,8 +507,6 @@ static void get_msg_list_cb(struct qmi_result *result, void *user_data)
+ 
+ 	/* save list and get 1st msg */
+ 	if (cnt) {
+-		int msg_size = cnt * sizeof(list->msg[0]);
+-
+ 		data->msg_list = g_try_malloc0(sizeof(list->cnt) + msg_size);
+ 		if (data->msg_list == NULL)
+ 			goto done;
diff --git a/meta/recipes-connectivity/ofono/ofono_2.4.bb b/meta/recipes-connectivity/ofono/ofono_2.4.bb
index 5ae63e6ef6..2cf6438117 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.4.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.4.bb
@@ -25,6 +25,7 @@ SRC_URI = "\
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
     file://CVE-2023-4232.patch \
     file://CVE-2023-4235.patch \
+    file://CVE-2024-7537.patch \
 "
 SRC_URI[sha256sum] = "93580adc1afd1890dc516efb069de0c5cdfef014415256ddfb28ab172df2d11d"
 

