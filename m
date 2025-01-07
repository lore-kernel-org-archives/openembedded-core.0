Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B5AE7719A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:09:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.95.1736273338219459046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RS5xav4D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216426b0865so228634475ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273337; x=1736878137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dW7cVUTCc/OzACXG5Ytep7M2Ak6WQbqeWDrsSFIEmkI=;
        b=RS5xav4DhSrcYFxR4fmGMB5be6CfFAJ4ZcCL21qEqCjqymE1ttnMiGNA0LSwndqEfQ
         jOeP8LRO/FjjcXkqY2c01LMus1QMq7QUYTeSYJg0LPVL0o1cIUm3NeXw6nYGcQMJBpS9
         /cg1xiqqvPRqedwjhWdJ1FhYnYMU0lA2g2Tiq/V5qMGtgHJ7UK+lOgO8ooCkx4TVApGw
         1mksFUKx/+f6wN38PLUgy5k9MFdtTv2vDs6q1QcsRer8wcf1wQUD/2qArbDZGR0eOIVM
         779PqgcOXfj+OptJD24BN+fiydKBrJ1MIRExmhMrlwVa66HGhVUr6xYQ1s7r2Gwxdm6/
         rxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273337; x=1736878137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dW7cVUTCc/OzACXG5Ytep7M2Ak6WQbqeWDrsSFIEmkI=;
        b=XJHAOQLWtOlFJe6aRS8pd7s43WgQmzmhtvM9qDJCGGFYsfQNDo2UA+k/N8z8RvhGXR
         cWwXkjElhiZsYJglz9yCXhecB6SWMb+9Fo+1D5a2CE4Ce1/czRa0GiDowa8/YEkHSn4J
         82htsmwck0JBzJfRflSCAB3gT+M6DuKwgi2MEZm1KVUGJ1jcNIXV9jKk9Q8hC8UVT4f3
         H8vHXe5l1+o3yClSIszPJV9OBMFk0eJKp+vND/WN1BRxaYPFcsRX3C3PsGsx5apc7cGj
         r6BxZRL18G6qpeF5lA0ro3vofxo7A4rPnCbG3gaTjGtjSi5AYV4hKKCRiBpGq/D0KD+7
         pscw==
X-Gm-Message-State: AOJu0Yw3JAK3u4Y0TTGDInCoUaazS/x6j2ZlZc9WLRJSg6wBlNXeZCp7
	UcWZmZP7HnQph6CEC1X1+/t3m9vqDFYxUTLzVxXj/0NaeUB7mP6NmjoKpeI9bRBKQFFEexps/72
	l/vg=
X-Gm-Gg: ASbGncu28hoRIlsLq4/Sf100AZtysDs31k2MrhHNnPLcKjjaNOLdsYuOJ9aZYp2TZTR
	6RHeDy8PTnkf3/UEOe2RpU+OWchwVRTE+qvo0e5F7jiPZpCVxG6hg7xWsDDuOUVRhoahwgO4G+u
	JB0JztruCl7FwnnvGSX1U3lW/QCFS5AX2aRqVbj35ABMQx/4fcKRgLbJM7DB7dFiH2pu0B+3d0a
	lY8Qj/d3q7dtXa1E8n81/0yID4F/QlSkiNveTeMaU8peQ==
X-Google-Smtp-Source: AGHT+IHb2Xo5xGmqewkdGIau1RgcWlXkGMjABd6lzgdSyf/XLtoDtBXV933jAb7kp2ksc0ogkD5D1w==
X-Received: by 2002:a17:902:d4cc:b0:216:2426:768c with SMTP id d9443c01a7336-21a83f4e8f2mr137515ad.16.1736273337405;
        Tue, 07 Jan 2025 10:08:57 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/19] gstreamer1.0-plugins-good: Fix CVE-2024-47774
Date: Tue,  7 Jan 2025 10:08:26 -0800
Message-ID: <7b1943c6b00d5e94f72bcce0eefdfdb7f091af5d.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209489

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-47774.patch                      | 46 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch
new file mode 100644
index 0000000000..b9624a148c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch
@@ -0,0 +1,46 @@
+From 0870e87c7c02e28e22a09a7de0c5b1e5bed68c14 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 14:04:03 +0300
+Subject: [PATCH] avisubtitle: Fix size checks and avoid overflows when
+ checking sizes
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-262
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3890
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0870e87c7c02e28e22a09a7de0c5b1e5bed68c14]
+CVE: CVE-2024-47774
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/avi/gstavisubtitle.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/avi/gstavisubtitle.c b/subprojects/gst-plugins-good/gst/avi/gstavisubtitle.c
+index efc5f0405186..c816934da61c 100644
+--- a/gst/avi/gstavisubtitle.c
++++ b/gst/avi/gstavisubtitle.c
+@@ -196,7 +196,7 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   /* read 'name' of subtitle */
+   name_length = GST_READ_UINT32_LE (map.data + 5 + 2);
+   GST_LOG_OBJECT (sub, "length of name: %u", name_length);
+-  if (map.size <= 17 + name_length)
++  if (G_MAXUINT32 - 17 < name_length || map.size < 17 + name_length)
+     goto wrong_name_length;
+ 
+   name_utf8 =
+@@ -216,7 +216,8 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   file_length = GST_READ_UINT32_LE (map.data + 13 + name_length);
+   GST_LOG_OBJECT (sub, "length srt/ssa file: %u", file_length);
+ 
+-  if (map.size < (17 + name_length + file_length))
++  if (G_MAXUINT32 - 17 - name_length < file_length
++      || map.size < 17 + name_length + file_length)
+     goto wrong_total_length;
+ 
+   /* store this, so we can send it again after a seek; note that we shouldn't
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index 828b5f1083..8cf08c5088 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47540_47601_47602_47603_47834-7.patch \
            file://CVE-2024-47606.patch \
            file://CVE-2024-47613.patch \
+           file://CVE-2024-47774.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.43.0


