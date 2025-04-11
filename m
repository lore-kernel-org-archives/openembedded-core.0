Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B40DC369A2
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:33:53 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.36474.1744403626872850984
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VNv91RRQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7359aca7ef2so3495763b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403626; x=1745008426; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZPOQ6++7jmbL7hA3ae1qZfJPEsyon8vk8OmxQC3nXw=;
        b=VNv91RRQJ4dftUjbfePDlitNsgzaEYuTispheVyMXXACU0MzZOgMKecMDiLuwD+5zR
         x/gMkueC1eRLR7ibVwpcjYFh7FErXgqZsQj44DiZWDMyRu+u5AFEjmpj0hTpGI4GiUo1
         MqBhqqanJiiB9tlxQtgbBqVv3+dxXHdqOeZ7cULtVMK05nzg0yvsTqxm2nrlss14E+QY
         h7sibBhsrcyJBFLwF6ZqCVuMSNFIG7K5j45GUilhBPhMcttJwwM/SYic5EWeLiokvgY+
         QkVmvT3KvBI6jPnAsi27LuvdtoTIKjL6icug5Ik8gdsxrXegPCV/9/eRLQDND5I2TE8b
         Iwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403626; x=1745008426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZPOQ6++7jmbL7hA3ae1qZfJPEsyon8vk8OmxQC3nXw=;
        b=KPkq/2u2IJdh/UFMcwd4rZMZyWm3B16K9KBvM3+3H6RzeQ1odIYDXvNRnsAquXRstQ
         vYY/seM003QPXLRTuq/SAcab82mycs0bvF373GgsYkB0EC3/VT4n8+abEYA6F5kl554l
         K3e55Fyl5hV6Vi4kWp5a3CaZvkI1rsBQlnPHxwDY/vfx5l/MKdA5G8Gq2RhrbID9zEka
         jKqnWtpDvnvd5wtxbk7mao/6xdfqLJjQyaw58Fn4070C4lJ7YEwPJUc0z/bldYQ9edrg
         oZ+bJ9kNgMV4b+uRI72lWJRGcAVdFTCGfGuyJa3oe10I+1Q+AnrhLRBzxqfOxsZAYJRY
         OKaQ==
X-Gm-Message-State: AOJu0Ywm2qWtQL+PCHywnOeyaoKkTxaU+EhfC3N0TXBU1gAX2YM0iRxA
	CpLMXnJ2MXObK2OswCu45QVIHM69msFUy4hIn2S+BFKZaNUkbbBK37VbDYEHH/oT9bBelzaDx95
	F
X-Gm-Gg: ASbGncuDYEkYq0o+zfq528nRwalRd5s1iNYOkTmdJC0bx+wsVNEkSmFKl87iVreJsA/
	HjY4DtfPuCq9EyrJbRG/ObJKaTvZlbExoh/zt2+2sS/wXagnxaNvxSfVBVUfl7xdPF7r7ntddPO
	WKgmomQuH1masUt1a40NS3aZpCttYXY1XwQaAMANJzgpqEqaSbfyL2kZr2CuG/lnp651iTJZ1Jl
	TBHxDQSSMSFVsgbNiKHDThBXo29cF30qjyjhSTAbmZ0G2OkSmCzIRofhmwmcuf638ZTwNez24LO
	kgeNTRRdgPJLqYd8jjBc+JPJPr2R+Qyc
X-Google-Smtp-Source: AGHT+IFlRmKDdvoCmPpO9Bhm/ICxCOemNh4xDZy0E0tNc4r4S+THJW7Jb82RcwCswhMtp8IWpgM3MA==
X-Received: by 2002:a05:6a20:6f88:b0:1f5:64fd:68ea with SMTP id adf61e73a8af0-2017978c6b3mr6296488637.4.1744403626044;
        Fri, 11 Apr 2025 13:33:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.33.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:33:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/8] ofono: patch CVE-2024-7537
Date: Fri, 11 Apr 2025 13:33:27 -0700
Message-ID: <54ce53f7c2daf4f9d536e4e1f721035064c57b30.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744403103.git.steve@sakoman.com>
References: <cover.1744403103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214754

From: Peter Marko <peter.marko@siemens.com>

Pick commit
https://web.git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=e6d8d526d5077c0b6ab459efeb6b882c28e0fdeb

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
 
-- 
2.43.0


