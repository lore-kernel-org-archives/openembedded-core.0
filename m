Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11E2C71136
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:39 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.95766.1749584071643644569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xDKGCp5k;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2349f096605so70084385ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584071; x=1750188871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vrL4QCsw9nvYF7sM5SkuxYxV3KLu+JdAR5iRxLzkmmI=;
        b=xDKGCp5kUFvx1QzW3Ol6zL4CdSehCXRMQV4blna5+uHpqo/LQ/x2BLMuCmkEb1UPI9
         d6yj1/O2/dE/9PtyyGpe15jhuK7jeMcHTsygKmoxTxsw78wMcliCZ/YOumG2f+y9fIVZ
         hj7UEPgVwrVXNgTSpRjdV0msglqlB334zxsrtgGS+nGuM1rQYrBsXQeI0sC3TGgss1/o
         JUhwWTVjrR8lqQqUnr4qmn9BH9myayiJ4EbaSlC205OfBBStTPCDA9Pmt3INUJNnKa1A
         OjFVzuapHrWczqykNxLe3g+3SYPiRKQwAmt/AmHBwf6QDRB/N5OrZW305PjQTqCM3f9b
         e4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584071; x=1750188871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrL4QCsw9nvYF7sM5SkuxYxV3KLu+JdAR5iRxLzkmmI=;
        b=l2yNlB53HaFKkmwLTgZpmMZ6k//BtFyavIWxgqOURHPfIsE6E7Yzq9F4sfLeWDte6V
         o/TJUduQXVG9TsTGy9oOjFMxZq7RHMXdVdPuqUOzNZx0vaLBh+nvjU7hBaSVc43LHRsv
         xRY/vHX12RsshGK0c7kbcxH56y8Y7GKMIdF06gYbbwJ/BsB+RdsJVrVHpFKGnDBwq/zs
         nuUECYA5fSe/pnXXOjFV+WugE4syqg4UfecieBkjfeRQsPm5d5AqVMXNE31/4D31W+Fp
         F4XKhS3XQQVEFH9bmV2B5EPxRVaaFpT7Gxtt4egDQI/AYNcLKee0opVlzdISO/f2fds7
         Ux+A==
X-Gm-Message-State: AOJu0YyhwsXB4s84049RXtRs9d9OVJ4y7DGnCCkWVYN0col25uAm3q3g
	ushiY4C/qnLzhiWQFr3yn36mrCUYAVrcN9K5aDBuBxgDnwvZY2/Ssw6B9YZG87Xrtt4jOhLGBY5
	ZIxnN
X-Gm-Gg: ASbGncswCUqUc77po0J+wvSRyC2Qg+8BtLNEWiE4Nr/7x89CpaokhD2wFFBrnH/2pqq
	cQWJxwk1mHzVDVM/Y1V7hVuD1iB246/sJmTPaamqGPy/FNBt7ZPrDyjJTNAXjv6RrYim2wosOC6
	D2RgqlhrQF4Ao4R8dNkydrccI3bndR1oiiUftfGb3ukPG3VcEjlCH69gnheN0Ht+dlmO2QBbTN6
	hPmeP6v3CxsDU2x6FMxyx0u6TwTma5GsCEtFjgXNNgwBQchJiqYg3f45sg2PQPAUDC7I77OlfUA
	bMtT5uAFVE4zwU5+mCtn/ait/WJOsooZl8soqXJmbi9dyHi/qu+4yg==
X-Google-Smtp-Source: AGHT+IEAGcn5iPjVFN4dhLvX/c/Rn5Mce3XZ5scwBrcahsEA+yXia4OYG6Blt14Samye1PPZLV1FEg==
X-Received: by 2002:a17:903:32c1:b0:235:a9b:21e7 with SMTP id d9443c01a7336-23641b2654bmr6979925ad.48.1749584070871;
        Tue, 10 Jun 2025 12:34:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/16] libsoup: fix CVE-2025-32051
Date: Tue, 10 Jun 2025 12:33:58 -0700
Message-ID: <dd92cad39759b7ad105d8bcd42672847a273bccc.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218408

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/401

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32051-1.patch      | 29 ++++++++++
 .../libsoup-3.4.4/CVE-2025-32051-2.patch      | 57 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
new file mode 100644
index 0000000000..efeda48b11
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-1.patch
@@ -0,0 +1,29 @@
+From dc5db30989f385303c79ec3188c52e33f6f5886e Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Sat, 16 Nov 2024 11:50:09 -0600
+Subject: [PATCH 1/2] Fix possible NULL deref in soup_uri_decode_data_uri
+
+CVE: CVE-2025-32051
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/0713ba4a719da938dc8facc89fca99cd0aa3069f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-uri-utils.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libsoup/soup-uri-utils.c b/libsoup/soup-uri-utils.c
+index be2b79b..0251279 100644
+--- a/libsoup/soup-uri-utils.c
++++ b/libsoup/soup-uri-utils.c
+@@ -303,6 +303,8 @@ soup_uri_decode_data_uri (const char *uri,
+ 
+         uri_string = g_uri_to_string (soup_uri);
+         g_uri_unref (soup_uri);
++        if (!uri_string)
++                return NULL;
+ 
+         start = uri_string + 5;
+         comma = strchr (start, ',');
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch
new file mode 100644
index 0000000000..24c184bb86
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32051-2.patch
@@ -0,0 +1,57 @@
+From 7d1557a60145927806c88d321e8322a9d9f49bb2 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 22 Nov 2024 13:39:51 -0600
+Subject: [PATCH 2/2] soup_uri_decode_data_uri(): Handle URIs with a path
+ starting with //
+
+CVE: CVE-2025-32051
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/79cfd65c9bd8024cd45dd725c284766329873709]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-uri-utils.c | 8 ++++++++
+ tests/uri-parsing-test.c | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/libsoup/soup-uri-utils.c b/libsoup/soup-uri-utils.c
+index 0251279..1ff11cd 100644
+--- a/libsoup/soup-uri-utils.c
++++ b/libsoup/soup-uri-utils.c
+@@ -286,6 +286,7 @@ soup_uri_decode_data_uri (const char *uri,
+         gboolean base64 = FALSE;
+         char *uri_string;
+         GBytes *bytes;
++        const char *path;
+ 
+         g_return_val_if_fail (uri != NULL, NULL);
+ 
+@@ -301,6 +302,13 @@ soup_uri_decode_data_uri (const char *uri,
+         if (content_type)
+                 *content_type = NULL;
+ 
++        /* g_uri_to_string() is picky about paths that start with `//` and will assert. */
++        path = g_uri_get_path (soup_uri);
++        if (path[0] == '/' && path[1] == '/') {
++                g_uri_unref (soup_uri);
++                return NULL;
++        }
++
+         uri_string = g_uri_to_string (soup_uri);
+         g_uri_unref (soup_uri);
+         if (!uri_string)
+diff --git a/tests/uri-parsing-test.c b/tests/uri-parsing-test.c
+index 1f16273..418391e 100644
+--- a/tests/uri-parsing-test.c
++++ b/tests/uri-parsing-test.c
+@@ -141,6 +141,8 @@ static struct {
+         { "data:text/plain;base64,aGVsbG8=", "hello", "text/plain" },
+         { "data:text/plain;base64,invalid=", "", "text/plain" },
+         { "data:,", "", CONTENT_TYPE_DEFAULT },
++        { "data:.///", NULL, NULL },
++        { "data:/.//", NULL, NULL },
+ };
+ 
+ static void
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index e7dccb6380..9af7de192f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -38,6 +38,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907-2.patch \
            file://CVE-2025-32053.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32051-1.patch \
+           file://CVE-2025-32051-2.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


