Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493E7C71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.91292.1749571760969159346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sFx12xnc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23539a1a421so48838615ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571760; x=1750176560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vTiFRdKUWuCtYNZHnN30+AS7DonWsESrsq2Z2Cc6r4=;
        b=sFx12xncXLUN126ayip+dUeKqyFUidNVSOXNHLbFAKczLPUcOl7Cy8pFotxw9cNxFu
         TfGMv+tCyx484fxKzxUOYMDsc1f4HU0N/NZp0p/ErHC15XSc7caCwWna0s76W0dHR7E1
         LzLiWN0zZUT8SC54G+j5TpeVUekpX67TqndmwcE7ZDhJJk2QXvZZrEuhYPsxb0zqNBPT
         WLfLVH5DDP9w1Ianq4RZ5kcCtjLcfVqD0s1C89CoXx0JBuxcSiWKuQAylEfTSyWoQDpO
         tsTqiRn92foPvFm9X2IAI12kHAZaBty8Z5RgxWLWzvgF6BplyvtsUb0E2wIwQEeK8sJt
         gxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571760; x=1750176560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vTiFRdKUWuCtYNZHnN30+AS7DonWsESrsq2Z2Cc6r4=;
        b=YCcSbwtYvIHZoYoJuYOTgdwg2i+5GMbCMtHW8HfmvBacSCA6nhSQ2ha1JYikfIZH64
         v1964Aq3rD0lX6mu7IpBeDPEJmtRTL8UcOnCgK3Qh2NzriYAyAa4WbGc6EjlfziOOZlB
         CcpQo/tpKMvabsFtK6ItlK/SMFf0Iq37ExqX+VI+vAd29Fae4leILGrP8kD1dw+enC0I
         2MWsRI1J4xEIy4bb5EtYHXffcADHZ0hGKZtY2HoODKRUMWmT3JKMOHOzm/puMcoffwYi
         6ke43HS8XcVSw+NBXP/j1Z7iEDDbkuKfpythYRD5yJSCxatDuDhIuLRfRgPG1jvTiiUX
         NOLQ==
X-Gm-Message-State: AOJu0YyeMeZqdpTcS/rpkfhnIqyCAUsr/R2AZG24ICloe+GhZm/iB6n5
	CRd9Ig6eMmQZMNa/u5JPt66YLqYC0ZhGUzq7LVrYI5Ld/bHAYiGhe61CioHtFjEl8h5iOZtGOHX
	C/F72
X-Gm-Gg: ASbGncsHkvLZRvmphlKzSH0FXzZv5ZKWxM0rMo7k9P+T651JkvuOSZD4+Y/NHSDEBtq
	YaMn81DMNV+TvGMk9Z+bWMUS/s+Cu98Sotk6cNZ/xhwofZt8hpG+appXzIJOqPPSAlbGnHTjSTS
	VvxzapPXe3J8CwQhB4v/miWdzCE9POh0TuD2iPdCgnnHzD/8Ev6chpbrOHg0VWV3pZCT2ya2e0L
	q92dtx58H5CDMdFe0MRN36sU0+W6zn6kzn4/3P7UsaXe9WYgaDx4l8GY9y9jV3SsGpntEUcuW68
	GkrvKQALf2cybdLtowusCBo7SyZE9eeTourlWq7vVT5FRPVP7AK6i+1Oz16nyTko
X-Google-Smtp-Source: AGHT+IFaHDPCLIAp06jPUDKOdUEm/FA1AM3K/tSZ2w5JEk2ktIHmwEJa/RYkO4cyfpLlliQJiOBU2w==
X-Received: by 2002:a17:903:188:b0:234:ef42:5d65 with SMTP id d9443c01a7336-23601dec50bmr231043945ad.52.1749571760086;
        Tue, 10 Jun 2025 09:09:20 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 17/32] libsoup-2.4: fix CVE-2025-32907
Date: Tue, 10 Jun 2025 09:08:30 -0700
Message-ID: <771a05a7f65c391b0e2ad01e509f63d14fd0a7f2.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218386

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/428

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32907.patch  | 39 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
new file mode 100644
index 0000000000..41dd3ff3f4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32907.patch
@@ -0,0 +1,39 @@
+From 8158b4084dcba2a233dfcb7359c53ab2840148f7 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 12:17:39 +0200
+Subject: [PATCH 1/2] soup-message-headers: Correct merge of ranges
+
+It had been skipping every second range, which generated an array
+of a lot of insane ranges, causing large memory usage by the server.
+
+Closes #428
+
+Part-of: <https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452>
+
+CVE: CVE-2025-32907
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/452/diffs?commit_id=9bb92f7a685e31e10e9e8221d0342280432ce836]
+
+Test part not applied since test codes use some functions not in this
+version
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-message-headers.c |   1 +
+ 1 files changed, 1 insertions(+)
+
+diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
+index 78b2455..00b9763 100644
+--- a/libsoup/soup-message-headers.c
++++ b/libsoup/soup-message-headers.c
+@@ -1024,6 +1024,7 @@ soup_message_headers_get_ranges_internal (SoupMessageHeaders  *hdrs,
+ 			if (cur->start <= prev->end) {
+ 				prev->end = MAX (prev->end, cur->end);
+ 				g_array_remove_index (array, i);
++				i--;
+ 			}
+ 		}
+ 	}
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 45add2e3e0..b771805723 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-32907.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


