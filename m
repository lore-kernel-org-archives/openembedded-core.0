Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB03CC38150
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:32:26 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.8990.1720096341795357453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QBzaV+fm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fb0d88fd25so4163705ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096341; x=1720701141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBdamduvh6pHu1+N60EYI+jG5s3lBR1HAGAF6bGHuhE=;
        b=QBzaV+fmS0tf+EszuELjjBjIoQVuqVeHN7robyyEgnFKg5odp2izJNsTYy4gLNOHcT
         RMqUlYHWMJQluuhjqsdcY7YrUVOR8HHq4O870zVBoHUOAhqQ5dmPqLSIgulH9cGXbuxN
         NduM3dVF21rH7x6CEWMTx7QjtOOwZulOF4ld7yyn178UnITgBGtZDompsGeGKxtrIMBj
         1Cgfym6UZoeykudZbS9bILQFK8kr/Lkz3yGoKZm8IX5uTNKciD/Q4myBezlLJfEBuUV4
         d4v3xXG21CRLho5Xd5gQPWADyXjEGJnAjwOjt2UwlkjndFvpCVC2KDBNtPzaIQn85iCR
         n2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096341; x=1720701141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBdamduvh6pHu1+N60EYI+jG5s3lBR1HAGAF6bGHuhE=;
        b=Zv1fgOPBQTHBlWRlRtSdnNb2hocpf0XBBSvT4Zo759PrNG0Nsl+gSu0BA9mFUfcNTI
         OwjlTWnrF6dBT+p86OI97FQPfFBBFd00Jg+GotxzYRVjgzqPmTeQx0d7kUf4LYO9I+1h
         ssu9uezd6bvLIx5FfckQ8q6mmzbw3W71CyzS9s3hVHaOJ12tuIkaA8JUtJXG/pIrYn2B
         AWv3oMmueDeIpfZTYfhTo11Yp8ElqbAcrgVu7xPxAxX2XDTFPsRA06owIrseCZsW1Wbz
         DDFOPFICMVVSNnwbCO9DAIW676uKzt5aUXs3BgJvbuhEiNRGUcdlWc8JFhqBewqE0eUP
         nPJQ==
X-Gm-Message-State: AOJu0Ywimo4EpeFEow49DrodrqHvAv7oA8R7xGEpkpTMxcAgoFv5wor7
	YMHAVhxG2a8kRoIY0IQhRzudgf5ndTUGcvzKuTcGT89ctUKPwGFmbx1EOKk59s30qpHFJ9VNTR2
	e
X-Google-Smtp-Source: AGHT+IEj8KYezMv2uwRcOxvcRo7vHlkjIQKIPnWjP3dJMfJ2RmKgjdf3vtIzn+DnaBhXlCX8K4wUXA==
X-Received: by 2002:a17:903:191:b0:1f9:ba4b:57d2 with SMTP id d9443c01a7336-1fb370d2070mr20980885ad.27.1720096340923;
        Thu, 04 Jul 2024 05:32:20 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac159d337sm121034095ad.284.2024.07.04.05.32.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:32:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/7] gstreamer1.0-plugins-base: fix CVE-2024-4453
Date: Thu,  4 Jul 2024 05:32:07 -0700
Message-Id: <6708631c89d1cb0d7e0e1b888c51826b3939f8af.1720096173.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720096173.git.steve@sakoman.com>
References: <cover.1720096173.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201568

From: Archana Polampalli <archana.polampalli@windriver.com>

GStreamer EXIF Metadata Parsing Integer Overflow Remote Code Execution Vulnerability.
This vulnerability allows remote attackers to execute arbitrary code on affected
installations of GStreamer. Interaction with this library is required to exploit this
vulnerability but attack vectors may vary depending on the implementation. The specific
flaw exists within the parsing of EXIF metadata. The issue results from the lack of
proper validation of user-supplied data, which can result in an integer overflow before
allocating a buffer. An attacker can leverage this vulnerability to execute code in the
context of the current process. . Was ZDI-CAN-23896.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-4453.patch                       | 65 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.20.7.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch
new file mode 100644
index 0000000000..cdc8ab083d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2024-4453.patch
@@ -0,0 +1,65 @@
+From e33578a3c2b85a68962003bd053abda9409e73a2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 25 Apr 2024 15:21:20 +0300
+Subject: [PATCH] exiftag: Prevent integer overflows and out of bounds reads
+ when handling undefined tags
+
+Fixes ZDI-CAN-23896
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3483
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/6768>
+
+CVE: CVE-2024-4453
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e33578a3c2b85a68]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst-libs/gst/tag/gstexiftag.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/gst-libs/gst/tag/gstexiftag.c b/gst-libs/gst/tag/gstexiftag.c
+index ed41ccf..3b9a2be 100644
+--- a/gst-libs/gst/tag/gstexiftag.c
++++ b/gst-libs/gst/tag/gstexiftag.c
+@@ -1383,6 +1383,7 @@ parse_exif_undefined_tag (GstExifReader * reader, const GstExifTagMatch * tag,
+
+   if (count > 4) {
+     GstMapInfo info;
++    gsize alloc_size;
+
+     if (offset < reader->base_offset) {
+       GST_WARNING ("Offset is smaller (%u) than base offset (%u)", offset,
+@@ -1404,14 +1405,28 @@ parse_exif_undefined_tag (GstExifReader * reader, const GstExifTagMatch * tag,
+       return;
+     }
+
++    if (info.size - real_offset < count) {
++      GST_WARNING ("Invalid size %u for buffer of size %" G_GSIZE_FORMAT
++          ", not adding tag %s", count, info.size, tag->gst_tag);
++      gst_buffer_unmap (reader->buffer, &info);
++      return;
++    }
++
++    if (!g_size_checked_add (&alloc_size, count, 1)) {
++      GST_WARNING ("Invalid size %u for buffer of size %" G_GSIZE_FORMAT
++          ", not adding tag %s", real_offset, info.size, tag->gst_tag);
++      gst_buffer_unmap (reader->buffer, &info);
++      return;
++    }
++
+     /* +1 because it could be a string without the \0 */
+-    data = malloc (sizeof (guint8) * count + 1);
++    data = malloc (alloc_size);
+     memcpy (data, info.data + real_offset, count);
+     data[count] = 0;
+
+     gst_buffer_unmap (reader->buffer, &info);
+   } else {
+-    data = malloc (sizeof (guint8) * count + 1);
++    data = malloc (count + 1);
+     memcpy (data, (guint8 *) offset_as_data, count);
+     data[count] = 0;
+   }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
index 8dfa70aea3..368698b58b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.7.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch \
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
+           file://CVE-2024-4453.patch \
            "
 SRC_URI[sha256sum] = "fde6696a91875095d82c1012b5777c28ba926047ffce08508e12c1d2c66f0057"
 
-- 
2.34.1


