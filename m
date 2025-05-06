Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3DAC3ABC3
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:14:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.78803.1746544453265482269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=tb0BBpTM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22e4db05fe8so6952135ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746544452; x=1747149252; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hnzKR+tgV9Xp2DKYqrBgZUcXkVnFW0zmvemiFlqR84=;
        b=tb0BBpTM635Z90v+YJlM7G2SU8eAqUZuT5I68VKNIMVuocu03L03M018qI3vbu4s/w
         FlIENCVWh/Y83x+kshrTUPGKObKfycISDriDUPVAeD8MUz5d6UJ4v1/DYNQe9X2cx3eu
         Rrtuw0S2oSLaX8RR543418MKyBKCrt/1v5QtmiXbd48hks9WIiO8Nw9OWdxha1LcznZj
         H5bTR5djRJcZHn8TgKR+BG0Go6IXrG1xPHtTfWnZc+W0RFe0zgaH0L0BL0tNXHcUbyqX
         hnkBimYH6dQNKiW3UyzyX2fZP7lWd4y1nAw4zUv/rt19WltfXoiUhCbDSE+4oK6vXk5I
         lp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746544452; x=1747149252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hnzKR+tgV9Xp2DKYqrBgZUcXkVnFW0zmvemiFlqR84=;
        b=l260kt4ndkXCuZPFOlMjsS/SIjNKo+mypFGJF5Z+fSOA/229r+P8tCL3kp5VKTm8Ha
         DWbHkYSEZdytoe2VyBEq+M+uTFcTSfgSKb9pPbG92YrWpFJf9X/T1IPXOiYhJ+CyC2/p
         IzVjPDvOUe5yxa8gt5k/i7TGaA+/ZqCUDIkpt7sXnKD5xwNhh/saMiE44Nseb9/4aDFf
         nD0eXTczwt2MJfvyXxCTxKvBRjJGTJwjtwAol8fSvF3fe2/qCLiv49S6IqbEQLl4Ifti
         pHDYDfQo+ErvEL4NweMZkZJgQ4/oC/RckeL3RFeV2DSE/s4e3COmF7WHwUjAoPTeejsg
         97rQ==
X-Gm-Message-State: AOJu0YwKT0M95R6rYNWTj9mag/CuHBkV7M1BPKKMaHQXq2JTCyQGSnwX
	6m95OGNfgcJb9bIWBiqHWTdiWqUZWU/y9dT5wQf3qYKp5F52sAJ2YhSyNd/SiKIJcixyRNKND6C
	7
X-Gm-Gg: ASbGncuLF0+RKfLmPBbYpzf7hq2p2X7HtrtuqX7Fm3wM0fTZbhNhb0vi4JPZ93IEaw6
	RpNCtgRLHMmhqX1DJMth64jsl2AJAzt8z7lIdB3T/vJf/U3d+lzZfFEMk1wXC1vakFggI1O1iTo
	k4XNia92maBb02W7Ai/QDKTSiKGr0jpIT/GQ8e/3jUnHh0CuXIvFp3eptWA0FOYOmVYdNwwjw0m
	FC69LCcPp9OA6Xia0Itz0xzXuOCvrGAZUR9dzf/oha0PfLQAz7v5vHRlYt8GbHfQxDZ+2ye4vlI
	2+RXhp6xLJLM0jWlnHBYfZqF2H+o3AFu
X-Google-Smtp-Source: AGHT+IFYUyESeuGTPeIX6+n2H3taY2xbJWUnYEzsaMXPHgPNRFIxBJTUJhvFRQFrP5DzIpptLQaiEg==
X-Received: by 2002:a17:903:120e:b0:223:5241:f5ca with SMTP id d9443c01a7336-22e1ea7c4cbmr142390195ad.20.1746544452471;
        Tue, 06 May 2025 08:14:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:8d37:c5d1:328a:ee43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fa58sm75222545ad.150.2025.05.06.08.14.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:14:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 1/7] libsoup: patch CVE-2025-46420
Date: Tue,  6 May 2025 08:13:53 -0700
Message-ID: <0e4a77c928e2eb0e8b012f2bba13b2ef3929cb34.1746544207.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746544207.git.steve@sakoman.com>
References: <cover.1746544207.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216058

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c9083869ec2a3037e6df4bd86b45c419ba295f8e]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-46420.patch        | 60 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch
new file mode 100644
index 0000000000..37ab16dc05
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46420.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index cbb098908d..63e9afa6fc 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -28,6 +28,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32906-1.patch \
            file://CVE-2025-32906-2.patch \
+           file://CVE-2025-46420.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


