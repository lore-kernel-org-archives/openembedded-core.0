Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CC0C5AD49
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:44 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.7108.1748093804261109759
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H2uvsOzE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30ea7770bd2so937725a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093803; x=1748698603; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7AW+ep7eGUYUFl2YcyIxd/hEsQr3zTLpRdbwszbd8Cs=;
        b=H2uvsOzEgmxOHCRgXFigKJ8TVkUrIvVLUtpgpMYwmJSGP2YJium8xqpol3B632imSm
         Lk8yxgcm4IG7mlw2R0rOVVdyDvxbupR0RyILDfvRQUEi6k/3qDqSHS8tds+H/zW4Pdq6
         e1+8ui4o1s0G4Grqei9ofzWYq8nw4JgY5szi4dCqLe5/VFdLFfyi9gKhGkXXG0EaisE5
         IcnKMmkqDQqTXewt/iDTUc1W08yyWc3QDF1Ub/hVgjsZONFvDYBrIMqzHuE80/nuptM8
         iNZiOGeP+aa7Aij8yyrhfStLavnOGDCyarDCDgqj5225swD4434Z3RV0BPky244r4FTX
         TiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093803; x=1748698603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7AW+ep7eGUYUFl2YcyIxd/hEsQr3zTLpRdbwszbd8Cs=;
        b=Q8M5VBDplGMv86n4+ElAABrdBnjmIMT7GNo6Dsjt6BDNICxstRF+s6qNGkYl+hC88H
         qCvivLhtq1aodUcch62QGH/cn4qPjZjXM6LpGRD3YxB8kn9rO1G+D8o/JFdcN6YEmrmW
         QZgk/GuEA6O+w7CUjTgzShcy3XOYceXzK+Y+zfiYZOVdusUZtkoPWq0x3c0kf74hTrbk
         /EKsp3NpAeCANdp4exaPY/M3Divo4pv3roEfzYBft6ErH5c7S2t6QZfOlY5M8V9vMAOu
         ndj1URz8Qlf+wJm95lKcKF5O+TWBIZyvKfNmvbf8yBe9pYZWQpxeGxPjzCOHJJdkH5zF
         Dxng==
X-Gm-Message-State: AOJu0YwXy/pFjkRThZHRJS0ItJTKJd9AuEQoeIN2cYSYgkhf1XphsQjQ
	Tlujgg67ybmLWPnZRpUPDahd8XDgIUXqHgkLemP6ASRcu7fOqOiubhnl+9dQ09EskU2XvbFv3Xp
	+6z9n
X-Gm-Gg: ASbGncstiGrNGf1U6oaZOXIUjaIGxbd62rPfippghyKIwgQMSPIIG8KdQdZVhPJnkGK
	m9QzApoOqWPWfrfUbudcCr6Q2z1fjj5paNaGwBbQU+4XZDRateHLtJCaY/h46x1PQXYXj9eZ87P
	wyiU2LpqfTn3qcWIesTZ2Qwqc20pWXFqj9IHzbadcgy5Qxqe3QdElAxEanSgxeWLbGhv3h7dEK9
	optpwaKQnyh/PpSi1AVEPftf1xXL/tycSdCYXX4jmV4wd6GvCdeav+YcsNjJHB3Psr8zLvpMEMy
	TCn19zSSR4E9Kxdg1Dk/KjpDDfZPfeBpkrCMxW2t0hk=
X-Google-Smtp-Source: AGHT+IGe0zzudCiO0E7jVpHjRYdcB1kqZ8fee3x3/UQtGsN+p0RtagAKpWi0G18s5cJfd6c+Oj4gLQ==
X-Received: by 2002:a17:90b:1b0f:b0:311:44e:4c90 with SMTP id 98e67ed59e1d1-3110f0c7291mr4554969a91.4.1748093803444;
        Sat, 24 May 2025 06:36:43 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/12] libsoup-2.4: Fix CVE-2025-46420
Date: Sat, 24 May 2025 06:36:20 -0700
Message-ID: <f0d5d13b0b7b2cf3f60c85b0c135fd948c648256.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217229

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


