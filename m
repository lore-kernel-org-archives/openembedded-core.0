Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABFEC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 05:38:21 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.44466.1747633093470068558
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 22:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BKatjOFB;
 spf=pass (domain: mvista.com, ip: 209.85.216.41, mailfrom: asharma@mvista.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30572effb26so3621756a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 22:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747633092; x=1748237892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvNDTJxR8MBdHWo00bhNPJnS9ap1BM/y/mXxpMySAwQ=;
        b=BKatjOFB8+5xsTdnIE66MBY2fRlPbiE1ihmJOlLv7BKmONyWLm/b1xdvVmqJ2wVNfD
         zm6SH+LpyM75VD1j4OB0PRfxnC8JbIiFFEkONvjz872u66D1LteELrJvc60cXMRZQ14C
         UtLelTrtd3CazU+U/Z/y9nwDflsj0cdrqZTWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747633092; x=1748237892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvNDTJxR8MBdHWo00bhNPJnS9ap1BM/y/mXxpMySAwQ=;
        b=Z301pxWEoTOo6RXI/6c2kUDz4NubLVQBPZJRHDNfy0yhgTw1xgJGO10BieDNA9NZgj
         DuASrZChCNCdB0skwBT9aI/z3+UX8vTujYrsRz/h1zrLpPXmXJWKL3+QkNt5qWtjkCnG
         jhrHpOpfqGA0zursqKYJXBrK9K5STq1TjzTmXBiNfvIN0Bl3psETMg2XIYtqntlDlbhA
         5AG4P3DAIG7RXqlpONEm0ttc32jI1Pgdq6zD2CLa4FMZk617cRNZ4oA8N/fG8conxjQ5
         sd0R5YO2y14fgnnClIBO1jchOedPMxD2yri0Z3XGaNWiIkOU1dLQAgBhbQWKpUE6yOaZ
         DeEw==
X-Gm-Message-State: AOJu0YwS4MxQkk2IDmfKhG96hN3W8raG4scQFXPqPedFaYgIfsA7gPc7
	r2ttrCF1gAqYG7O/yp3dpfXdn2saMdHzMTf5kJcp7WuX3pS96PB3OeQMAojJeIK7WqXd/ZOg/iO
	jmSDggP4=
X-Gm-Gg: ASbGncvV3ziC4uZNJlemj4LLLevrMCLztyF5/7yn+8PXj7z4FxFeC2589bCpIbNi7K4
	f5g3zjsydK7MFrmJZZzJfHPd2jXAAQdx0/idx8JN6hwsy8EHXyEsvbji5RHw5BbhSLTSTJMdMMq
	m2Gx94reXz2guLhedjEh5nGdIBsNKd7D3x/nBCtwUmQKfKWbNcoIaduriHhZWmf2e7w3DvYe+fV
	5ZmF8VSZoNChComaFQ4Czi9kIsyPDDYQTbHoAUyH3JWQ2OblHnGZ+WCOCr/WkLdY4k8vRlPIr8m
	ZcaUfjJElgOi6mi8VNbyxRE4ZG9wi05U7vUiY56OQ1UNoUutKRvW0S28NlWE
X-Google-Smtp-Source: AGHT+IGbzFe78yQLhLVh3Qf7mXx/7hPMTk8+/dBv9TCi++6U4aMJihEcExnhjxodyRHg49nn3mle5A==
X-Received: by 2002:a17:90b:5548:b0:2f6:dcc9:38e0 with SMTP id 98e67ed59e1d1-30e7d2bee8amr22235802a91.0.1747633092420;
        Sun, 18 May 2025 22:38:12 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c31:2b73:37b8:ebca:d2a2:bd97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e934930fesm4490757a91.29.2025.05.18.22.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 22:38:11 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Mon, 19 May 2025 11:08:07 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libsoup-2.4: Fix CVE-2025-46420
Date: Mon, 19 May 2025 11:08:05 +0530
Message-Id: <20250519053805.1334042-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 05:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216817

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-46420.patch  | 60 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 3aaa06a541..fa4dece0e9 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -22,6 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
            file://CVE-2025-32909.patch \
+           file://CVE-2025-46420.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


