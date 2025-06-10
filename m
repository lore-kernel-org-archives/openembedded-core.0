Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D94AC71131
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:08 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.91279.1749571742313299240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LC6/srmi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234c5b57557so52714525ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571741; x=1750176541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiZYgiZBxvmwUbYYp5vbdrvfqGiKvuY9uTCVRje79xw=;
        b=LC6/srmieju055rvgupKxPw+cZ41A2KjR53ByuZbeBGUj8Lre1A2Xa5R2SKBdQCWMN
         5bYosnKUqrIFDHYnZQ4/7KdDP5xoFMx0QgYpAHi0lx5Kh2kXaF9fctp8qygJPoR7HdY9
         ywGLf85b9NU8+ankhd2NBKqrgdU6sLhhpFy/SvQ5EiykhktiuhMSVkYsmkZmsozgnDMj
         6nmA65crwYzx2Xj6aFrN0SCte3THIHGoXpINfw4pjR0iXE8Ov1Bu6dTQrSHNpk/IudDM
         UvV2VPeuXnkZ2r0527qCihFeULi9yAKRfD13SDiFpA6XhTm2+kFRud9Mz/qIpiQXvDz5
         gr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571741; x=1750176541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QiZYgiZBxvmwUbYYp5vbdrvfqGiKvuY9uTCVRje79xw=;
        b=jjQGFX33wfOb7FEuOvp6MedYVfvCdhoNOusN50j71pJ1i5B1y487UnzeifdVgyydiV
         cF1rb6aCln/NsHfbJJ6i5pfNfRIwkgjmwrFf8eQwd5aTglmFaURqqB/ZWZhgp8OEkT4x
         wO8vAa95JL3+okP8XvIpdLm9YD0Kps0RSnrUZYwzkLfUCitvH0zWsFW0RXe90J7T/xVs
         5r6u6q0oNyLBc9TZwydOMgsXG+5bFPRGy5E/SPIC9BTGIgNl9sUHkfcPm3ZJapfcfopa
         SatVI/rvnAeY+Qm4dA9MuLTybvQ1kGedFyqK3QkmQ2Gmz+9fmNGWzWPujUpo4M8vf9PO
         cfxQ==
X-Gm-Message-State: AOJu0YwEo2YkYZ5i59UqmVHb8WhUXtJTV1B2UTgw7SNqi4X/EfoyGMRF
	ydn1+iIdbGr+bh9kMDSELVlbl/1fVANU6ZPiwDirs5DAll0gU7LjAGizcbb8jB7ryP87OiQhqzb
	qQIHT
X-Gm-Gg: ASbGncv+SCHWz3zgQfxZJtjyDLL2Z6CZDZxSkiD8Ue06OfTFsHIpJnvb6M+y/IdtvaB
	SBSgnM9E9bUMi1XTujcYkNM38LlYhnHPJ5y+TRdrQprw6stFsFfola6kKE/4CYpjXpp7yCwfkjY
	zDew+d53b648GinDuMzetea9zupttYhxYi/QFrGA65ULSTtVJ0MFu8DBRuZzBzUzaGSrbTYAvSt
	bSj8tu24X4e0W/YsvBEeTtCbuXj9limU5Nh9eKh8WdfTU/PI2dnrLfHZ+VtK9ALlyCvkjdPUouH
	TwbgfFTIbPxS3U/xqnWGC03xttqrGDk9Q7do6/f2XTYhaYgEtcYzrw==
X-Google-Smtp-Source: AGHT+IFSOB4HdQSe9+tgm4B0V2qyT53YS+WpJ6PpU4jEjLq71V4BPlDMucdZSMne7CIZ2kOclojM8w==
X-Received: by 2002:a17:902:ce0f:b0:235:2403:77c7 with SMTP id d9443c01a7336-23601d81928mr263746515ad.37.1749571741450;
        Tue, 10 Jun 2025 09:09:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/32] libsoup-2.4: fix CVE-2025-46420
Date: Tue, 10 Jun 2025 09:08:20 -0700
Message-ID: <131a975cac59061f1b3013ce626a93160bf8d2be.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218376

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/438

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  | 61 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
new file mode 100644
index 0000000000..c970661694
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
@@ -0,0 +1,61 @@
+From 81e03c538d6a102406114567f4f1c468033ce2e4 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Thu, 26 Dec 2024 18:31:42 -0600
+Subject: [PATCH] soup_header_parse_quality_list: Fix leak
+
+When iterating over the parsed list we now steal the allocated strings that we want and then free_full the list which may contain remaining strings.
+
+CVE: CVE-2025-46420
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/421/diffs?commit_id=c9083869ec2a3037e6df4bd86b45c419ba295f8e]
+
+ Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 87bb3dc..9707ca0 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -528,7 +528,7 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
+ 	GSList *unsorted;
+ 	QualityItem *array;
+ 	GSList *sorted, *iter;
+-	char *item, *semi;
++	char *semi;
+ 	const char *param, *equal, *value;
+ 	double qval;
+ 	int n;
+@@ -541,9 +541,8 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
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
+@@ -575,15 +574,15 @@ soup_header_parse_quality_list (const char *header, GSList **unacceptable)
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
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 7c1de29fd5..1ef9303fb8 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52530.patch \
            file://CVE-2025-32906.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-46420.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


