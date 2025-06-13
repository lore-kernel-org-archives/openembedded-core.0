Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18380C71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:46:08 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.3369.1749793541404398251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J5NR8x5g;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74264d1832eso1904417b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793540; x=1750398340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJZY3/7wAmJ3dvqrnwxGV4YHfri7WJ/xsCGWE2FPkA0=;
        b=J5NR8x5g4GguiUugoPttA+Bun3LKA/798HoSZMvs069DirabVu4Wlcj+yNnrsI0rZ0
         13lybwAXvnZDi7YeXnSnSL7Ssx5JRvFaCFuxHp/Uy+L4obUeob0zaMJfqLTjqhzLKCtA
         RMui7FSI1OaITpVXjZzF7GxEWFcOqV6xI/HR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793540; x=1750398340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJZY3/7wAmJ3dvqrnwxGV4YHfri7WJ/xsCGWE2FPkA0=;
        b=HRZhlDrlTYUZxPOHCvliNQrrEcQdeneZsn5AIo0KxvCH2MMm5rRF8ISdJJYzuSxXCR
         DPH6WANOfpggax9yOlFrJOPP6+M92yczZauF3rWdduL0Bq9oxX1ajF1Dnl5WeZumFsZI
         dgv4cikDCiNs1zzNLkdriRpMrkqnkj5r78dcj1F/yNqrwstsCa7sPZvY8bBP2MpZc+Z1
         6A6EclBC9d9YojR+P580yC8WU0z5Pykqf0yBxrRZOV2CFspdhorhA4eIQ8PJcu7B0tm5
         dpdvhDp9XM/xCOex38dJhxD40zW1O2OxdgyB6CFLpYJhpjbNJZgbEone+3UBoKd2KUOf
         4gaw==
X-Gm-Message-State: AOJu0YwMtNgvT2/scaGmK12ZHHq8FwanfMriaN/fk4YALNT+TFXJhTHP
	IJdewOv8GiYBW5Ci43tnHUkjowcZ5urKtmm80GY0B++pk8sRcxiyt01KlgBbPvi0t5moS7E4e8Z
	VGAlw
X-Gm-Gg: ASbGncu6oGrYzjMRww5zeqB9VuSjobhnwTGPGEIVLPoi2yU5OhMhw2lOj/7QuZSPmWH
	pRUrYYEAJ3GYJEYHV0eXhGlbuQVaFawa/ZG2j758ZdyOONjRTNHpb5XLmLAAMgW++scwq84JjZB
	IMh2s+nIejCDikWn3pI8VQHP74U3C2h5AkDGU3j3bBnFEEAQaqH5Yk/itaCHUoaLrgGPuyyPaI6
	GJ3K6s0RQGyrIg5fVXr9LDRD/P3AHbtq+t0dzxUNyc/ZvrF5i8+Ti5ilVsTqhUdUJv9sAEvS7Qi
	0QT1YsSW7EOX6RTU1BfAqzQ30NYXSOxjT548xFLq2bG2b8slRDfZ6rTTAPvdvN4a45M0QPOA
X-Google-Smtp-Source: AGHT+IERq4WxtYfuPYnjwoq7dRnTux+kDZBBNvg/zItIOtqLcARu3uI5mRT+shbZZULQ9tkawDMAQQ==
X-Received: by 2002:a05:6a00:398e:b0:747:ee09:1fd2 with SMTP id d2e1a72fcca58-7488f79d9dbmr2717098b3a.12.1749793540434;
        Thu, 12 Jun 2025 22:45:40 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:39 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 9/9] libsoup: Fix CVE-2025-46420
Date: Fri, 13 Jun 2025 11:14:54 +0530
Message-Id: <20250613054454.112590-9-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218584

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-46420.patch      | 60 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch
new file mode 100644
index 0000000000..dbaec12f7d
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-46420.patch
@@ -0,0 +1,60 @@
+From c9083869ec2a3037e6df4bd86b45c419ba295f8e Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:31:42 -0600
+Subject: [PATCH] soup_header_parse_quality_list: Fix leak
+
+When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]
+CVE: CVE-2025-46420
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index a5f7a7f6..85385cea 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -530,7 +530,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	GSList *unsorted;
+ 	QualityItem *array;
+ 	GSList *sorted, *iter;
+-	char *item, *semi;
++	char *semi;
+ 	const char *param, *equal, *value;
+ 	double qval;
+ 	int n;
+@@ -543,9 +543,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	unsorted = soup_header_parse_list (header);
+ 	array = g_new0 (QualityItem, g_slist_length (unsorted));
+ 	for (iter = unsorted, n = 0; iter; iter = iter->next) {
+-		item = iter->data;
+ 		qval = 1.0;
+-		for (semi = strchr (item, ';'); semi; semi = strchr (semi + 1, ';')) {
++		for (semi = strchr (iter->data, ';'); semi; semi = strchr (semi + 1, ';')) {
+ 			param = skip_lws (semi + 1);
+ 			if (*param != 'q')
+ 				continue;
+@@ -577,15 +576,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 		if (qval == 0.0) {
+ 			if (unacceptable) {
+ 				*unacceptable = g_slist_prepend (*unacceptable,
+-								 item);
++								 g_steal_pointer (&iter->data));
+ 			}
+ 		} else {
+-			array[n].item = item;
++			array[n].item = g_steal_pointer (&iter->data);
+ 			array[n].qval = qval;
+ 			n++;
+ 		}
+ 	}
+-	g_slist_free (unsorted);
++	g_slist_free_full (unsorted, g_free);
+ 
+ 	qsort (array, n, sizeof (QualityItem), sort_by_qval);
+ 	sorted = NULL;
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index a90f683cb8..67aa180612 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -35,6 +35,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32053.patch \
+           file://CVE-2025-46420.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


