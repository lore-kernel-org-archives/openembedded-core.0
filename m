Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC52FE7719A
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:16 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.18133.1735998131711585704
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IoJAPMmw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216401de828so171988205ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998131; x=1736602931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyJ+WBKYB2zKtPCGuVOGqIfKMy/NS5NZ6tqbH32KM+E=;
        b=IoJAPMmws2Vamzltul0Gnm2vGP3gRiTVmwJoKxtaFYCfBQs1+9loGyuySCNZuHEICW
         8+0T6IcZ4nDEHRqaOtNZW5jpShqxIphoGhVpcmOVto10vxIaVfmcu/aEk2nE746pwk6Q
         vIr9gKOTjlo3T+2JaRelpMw2UZE4HhYbKi7DpZMgpb1FqYWTWhBPjmad0+F2/NNzfBwK
         O/vLqwwy9AfB2so60JKt82CE66Dhx4QjEwhtU1Y5hDIrD7SLnyfXvJ1pVtIfPWnL3XIV
         tWlxYytjOjsi91imnPoIkdT88Lqx618VCHgEVkDDDPcg3Ft4p/+K/okRX3bIQ1YdcG8J
         8YlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998131; x=1736602931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyJ+WBKYB2zKtPCGuVOGqIfKMy/NS5NZ6tqbH32KM+E=;
        b=gwvW8bQWnHwLRbttirbsqisPVIYX4qoGTHZxJE6XjmNbN6M2VH+r1NVC/XrTX8AcP2
         gPlQbGHxEvBLTIsuOdbK16iiUDvjylDm+A+2YgNHX4ll4DkdCqhGab2iwkoyjA2R/e9z
         Y457I3rwzZnj955fyFBPjkBEfRxvOXrP7FbTUcC8BqAhXfcwPDP1YC6GEMiNZ/o+W8K4
         5kuFDXosEMoJq9MiqXcYeLUS0ZcyE1AW85KkzLIP2FpI4krl9X4DIzHr8rySreJV04Kx
         mPnuZBG+jmeZeZBEI5xo4z2SuobFmVbi4qJTBQscUsvbj/H6dXxJ+UbGKxNQKyyQw0Tb
         ntQA==
X-Gm-Message-State: AOJu0YyAHZpA/gxwKEULo+82f8cpYJSZTBk1NPWFof+6eUbYOCwEtKGm
	dyRW9prQFmqIkbA1p6CMuf61mn7RWn2NbhEK3Oz3sYFEJu8ZEj9AKc9Va+fu5WkTVADGXz8uvlO
	6
X-Gm-Gg: ASbGncvrP4mHcXfPPSgrQbv37LkneTNxeep5Dgn+qnFJ/nrbY6gRM73aGYSy3rKocOA
	qRITWje+8zaVJogwcBIr9jBNedaD+sbKaRohUXPucHguxVnVOxoKuMPTgkeokYm16zsWSlcAJKv
	PLHvqYggO70ehzu1qFLUpsjpSsx15Ke87tLi7Wiux4FUFOkrGOxbMNH7u+ZQBe94FPXJsxZ1XLX
	sOhiQW4aKnHtwhrht5Qby2fsotYzPPfiGxLaI7883ZjHA==
X-Google-Smtp-Source: AGHT+IE9evnnaITpc+1RqBMBhZrzCzGQ3BuYDOrs9Xnwhjp31LRNK1tSnjQYTvK1ErzU/0fS28LjxA==
X-Received: by 2002:a05:6a21:3116:b0:1e1:abd6:ca66 with SMTP id adf61e73a8af0-1e5e049f46dmr77715830637.24.1735998130944;
        Sat, 04 Jan 2025 05:42:10 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/25] gstreamer1.0-plugins-base: patch CVE-2024-47542
Date: Sat,  4 Jan 2025 05:41:32 -0800
Message-ID: <8a0c3c92ec3bf150c0697d25c70ad149b2d82f0e.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209377

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8033

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...parsing-extended-header-if-not-enoug.patch | 64 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch
new file mode 100644
index 0000000000..4b514ff875
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch
@@ -0,0 +1,64 @@
+From 537161868f36048571f400648ac7909f26c73d53 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 13:43:06 +0300
+Subject: [PATCH] id3v2: Don't try parsing extended header if not enough data
+ is available
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-235
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3842
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8033>
+
+CVE: CVE-2024-47542
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/537161868f36048571f400648ac7909f26c73d53]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst-libs/gst/tag/id3v2.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/gst-libs/gst/tag/id3v2.c b/gst-libs/gst/tag/id3v2.c
+index 7db2cb7e12..70f975d133 100644
+--- a/gst-libs/gst/tag/id3v2.c
++++ b/gst-libs/gst/tag/id3v2.c
+@@ -29,7 +29,7 @@
+ 
+ #define HANDLE_INVALID_SYNCSAFE
+ 
+-static gboolean id3v2_frames_to_tag_list (ID3TagsWorking * work, guint size);
++static gboolean id3v2_frames_to_tag_list (ID3TagsWorking * work);
+ 
+ #ifndef GST_DISABLE_GST_DEBUG
+ 
+@@ -258,7 +258,7 @@ gst_tag_list_from_id3v2_tag (GstBuffer * buffer)
+     GST_MEMDUMP ("ID3v2 tag (un-unsyced)", uu_data, work.hdr.frame_data_size);
+   }
+ 
+-  id3v2_frames_to_tag_list (&work, work.hdr.frame_data_size);
++  id3v2_frames_to_tag_list (&work);
+ 
+   g_free (uu_data);
+ 
+@@ -440,12 +440,17 @@ id3v2_add_id3v2_frame_blob_to_taglist (ID3TagsWorking * work,
+ }
+ 
+ static gboolean
+-id3v2_frames_to_tag_list (ID3TagsWorking * work, guint size)
++id3v2_frames_to_tag_list (ID3TagsWorking * work)
+ {
+   guint frame_hdr_size;
+ 
+   /* Extended header if present */
+   if (work->hdr.flags & ID3V2_HDR_FLAG_EXTHDR) {
++    if (work->hdr.frame_data_size < 4) {
++      GST_DEBUG ("Tag has no extended header data. Broken tag");
++      return FALSE;
++    }
++
+     work->hdr.ext_hdr_size = id3v2_read_synch_uint (work->hdr.frame_data, 4);
+ 
+     /* In id3v2.4.x the header size is the size of the *whole*
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index e65de0036d..793b8afc3d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0007-oggstream-review-and-fix-per-format-min_packet_size.patch \
            file://0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch \
            file://0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch \
+           file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.43.0


