Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A130CE77197
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:16 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.18147.1735998136316793328
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c1IoQFoL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21628b3fe7dso178420695ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998135; x=1736602935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7G1DfcRIwDJTp9S1ZAkRAE7UHRPUnJe+MbAt2wPNn4=;
        b=c1IoQFoLZmRI7WPbUGlyK740Hu6DdpptLlZ5MNZPrNULEixsLEU9XuiusPZjrBcyGC
         U3rdcE0qAze5DeVNdjktNoZ6l63JtqbSHd1ojjCLKdC3P55XkUhnSPJ6y48158lPAwaI
         hE7h4w8W9uM1fBoLDqZ9d43qASGlYvB8f309x2lXIVvOV0M6eKHEZ3sRhRciMmVbSG41
         Qc6jzmqxv4QASwYii1127o9pyHX5O3Pyj30hQu6l+Wg44/rQVUWN/7h1VsJrqvZHgKJ8
         xUB3lerzz2sSo3WxQmxVPmf6LJWRBsj90mDFWgXLI6O2AHZWE06idILGvVRQ41yWyBFs
         HIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998135; x=1736602935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7G1DfcRIwDJTp9S1ZAkRAE7UHRPUnJe+MbAt2wPNn4=;
        b=LeMqwG9D2BBYA6GuYWH6fmy352oqEEw2Osb4fmmaQcMp6zw2y3z0MLufcE73wb1l/3
         m/rer/fgAPGbqX6uCXH/4cwFDvP4Cs+MB4bMJ9tq4Z+guEPcRb+HTYzyLFmSPVIHLGmy
         9bEX9y7o1cnvKHq06OTALKHvrmoH6qbTnOO9mTwjq0Y7O1fpp1jNWRkEnrxbqQVlE4w8
         7kAC+/Xpvvrf0PtFXmkDXNQ1r8j60qLOp9mKCIsskLl1Z6RcObyc0RN9VVycts3trK1N
         efEXfagkQNxd8mVNvOrKImYnR3xMLJ6i4stSgAF27hBsq3Q3Uw112z6tihfNB7COJWdg
         W1PQ==
X-Gm-Message-State: AOJu0Yxv/sst54ZF/c+ixIG9Ipw4fKeqMdVb0FcmgOREPMqmxAYWHdgD
	Z1AkyNvUmGnaMuWaFU/LB9khCrTsrL3wQHTH5W/+v5Fv1iNAMquixCcp/ojWcQS7H543CCK/IcU
	T
X-Gm-Gg: ASbGncsFY1eQERH0ABcjYeCjTsxu8pCra873RxMknXwbOwcXX1ohv/LV5SqWS7e3HyR
	ktQQSAXX+D2rTK2d3ZBTWmYX/rFPdx5cc1FtuAs23YOSfzKVrA0L6eVF3TA4pWNTP1ciJholoi3
	YTvhQDqNgB31tOBYEauJyhxRRbw+Tpfgy2mXKCC/pYMMPX44/3PmZoFUA+ts3esXl7zC1WzITUM
	JlAbd/MkImJOaWCXVy6tShOJOTAXsyKxucZaoTLb9n7vA==
X-Google-Smtp-Source: AGHT+IEUEkdUE4jgIsCAYqRrUwNWYWq7AnN8RjlgtPNhN4EFToPL/nO44Zq8ieUEa4KWx4mTQe76jg==
X-Received: by 2002:a05:6a21:2d07:b0:1e2:5cf:c8d6 with SMTP id adf61e73a8af0-1e5e080ba76mr71399896637.36.1735998135560;
        Sat, 04 Jan 2025 05:42:15 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/25] gstreamer1.0-plugins-good: patch CVE-2024-47606
Date: Sat,  4 Jan 2025 05:41:35 -0800
Message-ID: <30f2b1c6b10e064ce0f0f1910d2740e6ccc86251.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209380

From: Peter Marko <peter.marko@siemens.com>

Pick commit related to plugins-good from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...teger-overflow-when-parsing-Theora-e.patch | 44 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch
new file mode 100644
index 0000000000..37f133a493
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch
@@ -0,0 +1,44 @@
+From f8e398c46fc074f266edb3f20479c0ca31b52448 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 22:16:06 +0300
+Subject: [PATCH] qtdemux: Avoid integer overflow when parsing Theora extension
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-166
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3851
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032>
+
+CVE: CVE-2024-47606
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f8e398c46fc074f266edb3f20479c0ca31b52448]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/isomp4/qtdemux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index 5e3cb1b9e6..c2d8b5e0f1 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -8279,7 +8279,7 @@ qtdemux_parse_theora_extension (GstQTDemux * qtdemux, QtDemuxStream * stream,
+   end -= 8;
+ 
+   while (buf < end) {
+-    gint size;
++    guint32 size;
+     guint32 type;
+ 
+     size = QT_UINT32 (buf);
+@@ -8287,7 +8287,7 @@ qtdemux_parse_theora_extension (GstQTDemux * qtdemux, QtDemuxStream * stream,
+ 
+     GST_LOG_OBJECT (qtdemux, "%p %p", buf, end);
+ 
+-    if (buf + size > end || size <= 0)
++    if (end - buf < size || size < 8)
+       break;
+ 
+     buf += 8;
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 85c9a20a2d..7f8cd7c96c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch \
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
            file://0022-jpegdec-Directly-error-out-on-negotiation-failures.patch \
+           file://0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.43.0


