Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17487C5B554
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:33:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.920.1748446423647497468
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:33:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xAqmoJkz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c73f82dfso3613332b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446423; x=1749051223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BiYeXo9kfU7kjj7DCyUuZ+nSQ48yNLDrwYQVLMK/J/M=;
        b=xAqmoJkzBMmKLyVeGl5XhlV8tGciOdBx0E1gdzvNLUTq21iylMEBATc7jMbF9nzv10
         7kTJr5p3ERHxrcKJfOpI9lFOvBw7PdQwtazdovpYUoeXQafSm9SxD7Bg5lZClXgWDI2w
         4ReTlJr+Icb1A7gzz1kWYhJRViRx4OQh2WiNpBOOgtTZH1EilRBIK+/KqmZfz/4f3M/w
         nA3FIOfYAIwB9t3iHCgJL1bUopi1fuXE94hHBqdeuE2uYvuMPs5u5YwnbcsRuKAs9+/g
         EW1Si+0vDdUzun1LpSIvrPVUnHQh36i77yfP1JZE4NiGkrn6V7YnxD0kAKQx5s427TVU
         iUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446423; x=1749051223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiYeXo9kfU7kjj7DCyUuZ+nSQ48yNLDrwYQVLMK/J/M=;
        b=kY7tvAUQXULYWRB5F7xjZgbFR+7xsBNSnWXbtlwhe8XjedwpnVXkbooNYwu0LiF9yy
         kFbhcoa4AUfAdA0tlAECvGwxga82GL6aQQPpGDZ/Wf0ulWEfWzDwXuwin3mIoqKgumMi
         isP2FG+cu9lC342QdT1fQ1enqNz8ZDt1WLlNRJYEv7UHEgzIpdhDx5aLP5fIGAj4t5Xl
         yT2vBkwXb8xgTsrRfimM5PyYZRy9mearxizxkuxPaIXV9j6yuJmwiMix6WYX3ZZbP6Dm
         QeeouXANQfUsoS5FJ3gJ/joB/eMWDFSDfAnJnMFFATC6BIcswJ/HsjQ1xu+5a3m7GYEo
         uFEg==
X-Gm-Message-State: AOJu0YxQCXz/9aBnjyXurM1L3EAGjPiYcKsvLjtOny+znsi7ppjjekFr
	OtVqu+fkJePuq3yqYp0Bo20FOOU1JBtbRFO1IpmumBbnaWZN1wt/N4fZpqFgtMoJcfcyk1T2uZP
	MwD0K
X-Gm-Gg: ASbGnctJdAcHc81P0gjlFfLw4KlfmO9wM4TNtqUhvLgpGcJ4y+BN5iZEBkqZpRVvdO1
	VYYTOe2v4ujtw9Atw91KTHfORaJs6enmHS0rugpwZNWZCiLNRmxWjnsjf7vy2FDJFKWH5YHCKdQ
	lVkyXcASI3N+ftZOcMZIQ6L/GWx+I1l9v54WszJvomaO8iz95AjOXokHneKhb0oiu273mdv9nBt
	Ai9IFoj7U982LT1ACUrGVZyqp+2UFO6Kfc/vfVa4NoZu0KtcwJYDBpRWWKxnqEk6MvqKIY1JtNL
	9veBRzmo57RBTc6amz/8Xx71T/mSHKEF6jGxjsazNn+fYBZSqa95JA==
X-Google-Smtp-Source: AGHT+IHeRZI7BX102dGUWMJaHzYPSZVJi3mSHeBZ9V69F8ixxrOoGcqDeBzgcfaUKYaVW+TK64xu0g==
X-Received: by 2002:a05:6a00:a06:b0:742:a77b:8bc with SMTP id d2e1a72fcca58-745fdf7710fmr24951737b3a.2.1748446422854;
        Wed, 28 May 2025 08:33:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:33:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/14] ofono: patch CVE-2024-7537
Date: Wed, 28 May 2025 08:33:13 -0700
Message-ID: <9ab0da6f0564787b753aedb90ea437b135243bdf.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217368

From: Peter Marko <peter.marko@siemens.com>

Pick commit
https://web.git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0


