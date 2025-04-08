Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FB9C369A6
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:26 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.6772.1744145478110135924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dB0tE7yN;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2255003f4c6so55003185ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145477; x=1744750277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQDh0L/wU+L68MH8e6E8aWLUthc1ANzltKPevKFVZUc=;
        b=dB0tE7yNCIcL90bhnnNeanat/s1QSQI4tXP5zzz8fero7FeczEj9U7PsM5bBC+ntkN
         /8o7PukYHjU1bS25M+88aNd4j336D73YMrgSZrLacc2pLFlcLnW6g1O/NV3TzW0jbb7Q
         mrf+RG8d2SRynW92lZOkl2m5CAaYyOPVNwDWL3kUL7SvdFMmFSIQ1aoyn9xq2L8tcdiQ
         DhDajGyVlJYmGGogkC79LeZ79CUYNrXUGEeHPyrtMMzHbNkaCYAINoSVPlOfscdVKa73
         JTEYX89pHz0dUzITh3rp/f2yZoAwtQZ9NUX3vD/xz4DBsI8vLuZgk6TVOuWuogKOR06s
         CE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145477; x=1744750277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQDh0L/wU+L68MH8e6E8aWLUthc1ANzltKPevKFVZUc=;
        b=BvQj/XUnclE0s4p2pvu+icW+VfE8UcenxfPJ3h6nVsEBTO2Ss+cc4qwC/4TLT7jf1A
         +RqODrgvcXkY/qGwSskT977YTryDG9yLT6xbJF6keVmoIoV6WggK2WQOVMmGq7060fXp
         mJojtZ3ghfUfc2DOARHAix/CFhPritzwX4UYqgN1ErS/31JuIl0qOZ9qUYKR4dCE5EqP
         u3SFTWfe09qRajj/d4NgFPkCcmlr5KoRLGvF6sNF5pgaOV1Ubu9t9yq2kCxmqOaBW3Ur
         SQeASGe+3/w2iPOtNd6UdNe4zScEiXefuFteV4VEMe4giVwrDN+Szv9x7CyXbqP7uQNH
         Fa+g==
X-Gm-Message-State: AOJu0YzBxU1UoZrHtIhKMAWfIh5x4W3imObyQcJYuSu9xBc57ZFGJ/Gi
	L4ET9AxPZtwnv0jvzu+/Hi5+vvPgnvogY2Ml0BK7/XzgOtrh6JtnAI2U2a6Pm6By+Ov5NkgFgmr
	W
X-Gm-Gg: ASbGncs5CBeRHnecwW1HK1nfmxab/mlKyE95AfSBu9HW/1rAD7dqXP26jlOEzFsjkHA
	/d0KSuGzjMwBVAmhSnJP9Q/gn8R3kjQg7iJdzv/ALiFlO1GHqz0E/FctWNYIzoJ8JlCqHrFcHVm
	Sr0M6y+vYCTsBOWBqcyTLpcZ0dgBrg3NWa3xB4viFwJRQbmJDm4qn2BsRkAQthcVPUKmWT+fWiY
	e0F1l2J3+v7rzlq1ngrfZiGYX+C1cF7iFlgpOsr90xKJgVcaxoh3S6b3O/SbwPaapntONpbVNMi
	DboYnYgEPtqHYEyke+iQmgR2UQazOVUJBgFW
X-Google-Smtp-Source: AGHT+IGWJbnJA6S0MYIeN7N9vj7vRcWbu72ri2uB8iqtDfHDZbSUgbrcWiZhI8SbBv5x3Yji1oY6Rw==
X-Received: by 2002:a17:902:db0d:b0:224:c47:cbd with SMTP id d9443c01a7336-22ac285a533mr9391025ad.0.1744145477302;
        Tue, 08 Apr 2025 13:51:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/10] ofono: patch CVE-2024-7537
Date: Tue,  8 Apr 2025 13:50:58 -0700
Message-ID: <7f3a567b8e1446863e6c5c4336b4cb174592f799.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214557

From: Peter Marko <peter.marko@siemens.com>

Pick commit
https://web.git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0


