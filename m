Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692B2C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 06:08:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.44762.1747634905376327218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 23:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BLV2bU4L;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c9563fd9so602772b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 23:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747634904; x=1748239704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Forjz3j31fA70sHm6dD09RsPByLUdb6eLqpS/KynUdc=;
        b=BLV2bU4LFlep335wCgmnpnqnlm9AAQSU2nCxEnL8/3kuhf5Q+CHW4IRolx8Nuj/N0f
         kKnEaZP/I8YcAEVUj65c/kOUP4RIaSXKLWXm8g1boEpzE5SfaV06RR9ZRyyqnhFv2GAS
         6krTo8XMzW7xHzdXiwXYoWoWILR+P2tryjCWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747634904; x=1748239704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Forjz3j31fA70sHm6dD09RsPByLUdb6eLqpS/KynUdc=;
        b=BmtnhTosuxTLxgyso4FNUEBARNnfuWhMoBkeJHhj7TwSQBCiet327eCK07yljxbCJT
         RiJKtS+57i/A8rBREcb6K86NDS+fxf2Asbw00IY96CmN9Qr3BmImrVypDLL7759TwaSD
         Z5jEikvjnuIisKJsyl5wkS8IUlqGnwkrhwojRIDs/0A//y6mdNNM61zQDBfEmgYpTp3Y
         dDZ35WT4JsNlW8myqiai+ZvQdqAG6QaME7aF27AW7KImq2BFkfkG8FJ4WASHMKzlFR1t
         tFwY8eP80GJNeDpm7m+XRRyCJIgQ/b9TUVD3tfjlkg8zSyXVDK4ZAuUdi5nIigZuONKf
         GDuA==
X-Gm-Message-State: AOJu0Yw7QHPZK1O6WkYNlBs5SUIFUGeofyVnb8qKADKrKBrnGNnj+XBn
	9EDRwm7caBABjob4nj748kj23dUsIAYvI5Vpv20pqKjfXXkGPWkm1yjrkX/5qE+z+7e8NfX9tzQ
	wHo8TGmM=
X-Gm-Gg: ASbGncuDr3sHu4QctBxaNAV3GZ3fRpaw46PTfQ/XUpQFssrNp7u/5xooxhGBrKZY6ae
	z8+L1awhaHrFvggKlHAMbVeld0PkNAll+mQfl6MWXcz4pD/GUYxkweTzMMRlqqB2ii7LfTC45B3
	/c/sPwfDGNQz6wdnwNpm0j+TQyZuwZALJTpzsYbwcastQC1gOm+mbkTQJ9qTPU5n6dTD4bhZ8K7
	5tvdraad4dFQjH4nya7WhDEhfGMN5QArZaaWC3N95nJ1ufLHuXxSnrpssQroIfnbBh41uaLvnQf
	kH3TrghygQeaWmi0birGJ3z6YjPSyhMRpxyNqXNf6rILPDFHdA==
X-Google-Smtp-Source: AGHT+IG8EjBrmGS9CHub+Alfex5Q4HZBKQyGZkjm+D1In81zZ3FJA7ad8yvLQJMPIzh43M67b0mCMg==
X-Received: by 2002:a05:6a00:3c83:b0:72d:3b2e:fef9 with SMTP id d2e1a72fcca58-742acd72449mr15402449b3a.20.1747634904345;
        Sun, 18 May 2025 23:08:24 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c31:2b73:37b8:ebca:d2a2:bd97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c882sm5665480b3a.55.2025.05.18.23.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 23:08:23 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Mon, 19 May 2025 11:38:18 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libsoup-2.4: Fix CVE-2025-46420
Date: Mon, 19 May 2025 11:38:16 +0530
Message-Id: <20250519060816.1379583-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 06:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216821

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  | 60 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
new file mode 100644
index 0000000000..37ab16dc05
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-46420.patch
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
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 00f7fea41a..f04d9b2966 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-46420.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.34.1


