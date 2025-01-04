Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C13E7719C
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:26 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.18149.1735998141624685044
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rqvC8D09;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21675fd60feso242126235ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998141; x=1736602941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=17yQN8rIeIJyI1GecKSk2gSSxhmES2GWHJ+WCgDAvxI=;
        b=rqvC8D09hS2n69vLv1s9CCh6QNoamkWPXa8WHsOagwpgUoqaNB5uV8Mwu5oDLivLK6
         OL101gf25+3znpfjYcLCa3gGHTOaS0GH9IyTjUAgTY9t1GMFkcPvOlyde4M+DkgBVq8B
         Ck/cCzQKD6Jb0vc65/NII9XdX6ixJpGnmbb4It6ixQlBxxqEt2SiKHNpEzYsPTg4EfK+
         LDoezpqu3Bqn6HLVxomYs4Gkfrc34xWCK1F3zhBwuZaLEbVMWkzAiIcP1X7xOo7HzE6M
         TgYdszLV/iPOab49XAl/+35HjW3puMmuiiVbPh+Kz4t4jp5bb8PcioiNlFPuLGlkMY4l
         tAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998141; x=1736602941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=17yQN8rIeIJyI1GecKSk2gSSxhmES2GWHJ+WCgDAvxI=;
        b=R73VgZvLp+ycsNZRO8NAQEJXlqz4xnMSRM0bHgF7h7Q6YgJKlsgn6DKOwJYYYdSnz0
         CwBA7P09VD69NtNkz5XVkS2m9ZfcwQ2hRwlgoOEyQaZ4VfmQ52kBD6LAsTCnMTXFTn20
         YzT95E4peUbP8jGBy8aJzuNrU6KUJ7t5MdQI0poD8+XTxBpLR8xLdQCB46R1HygsGhww
         EMhHwR99IIoajUVohakSWJHs2N4lO4hLHMbO9twZVUjPDyUtSS3EMP/YmK4fh2HxD+Ze
         1UKlaHqepKAr6sBtLrYJ17cJ1wCDPJgJJtPPMKWcn7dwSPl+yY2mf7fJ+Vtv31F38knL
         CEnw==
X-Gm-Message-State: AOJu0YwXDwi7TymAABg8D31BQr8ZsR1ub9Zucu5R0TzYYuG4sbmKrYVA
	jb3SdZ1iWqD8oahuTr3sajFDtaHv5hGRI2PXHD/jP1GSzRs3XrphM2meBbMVveiMH1lxTxkcQvz
	l
X-Gm-Gg: ASbGnct8sLAtGlqRARrqIdq+h3m/Kq7isyac+8Efma6HHhSbxdx1QZE27nLUtT5r6R8
	8INGk55PxgqdMKSz2DgYwKja9t8eH1HGT9DJ+1YFz+KxPGRXBH62Y73ld1v7LGJwi5IWHrK/hZP
	pdz5Tk3vP0fjVakUnXOS3biqCeeQmkzF3H57GhLlq6T3IyW+K6SZCYp+RWq29fLOHA8fkviYYWO
	7ORhUxjZrQTHpLyPhcB0dELurL8bR7cCA33VqpV3MH5Aw==
X-Google-Smtp-Source: AGHT+IEZDUa0Aks6fghQ4yBxarAZLUga55HPZR4Pd+YngA9Pn226oZurut8r4Fkkgn4R6BJNcRpkXA==
X-Received: by 2002:a05:6a00:b51:b0:726:f7c9:7b28 with SMTP id d2e1a72fcca58-72abdd7c2aemr77951229b3a.8.1735998140539;
        Sat, 04 Jan 2025 05:42:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/25] gstreamer1.0-plugins-good: patch several CVEs
Date: Sat,  4 Jan 2025 05:41:38 -0800
Message-ID: <4763e9911e82c886a02727bf654872280138d83e.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209383

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...or-short-reads-when-parsing-headers-.patch | 174 ++++++++++++++++++
 ...re-enough-data-for-the-tag-list-tag-.patch |  41 +++++
 ...7-wavparse-Fix-parsing-of-acid-chunk.patch |  65 +++++++
 ...hat-at-least-4-bytes-are-available-b.patch |  37 ++++
 ...hat-at-least-32-bytes-are-available-.patch |  40 ++++
 ...ix-clipping-of-size-to-the-file-size.patch |  47 +++++
 ...Check-size-before-reading-ds64-chunk.patch |  41 +++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |   7 +
 8 files changed, 452 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0025-wavparse-Check-for-short-reads-when-parsing-headers-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0026-wavparse-Make-sure-enough-data-for-the-tag-list-tag-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0027-wavparse-Fix-parsing-of-acid-chunk.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0028-wavparse-Check-that-at-least-4-bytes-are-available-b.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0029-wavparse-Check-that-at-least-32-bytes-are-available-.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0030-wavparse-Fix-clipping-of-size-to-the-file-size.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0031-wavparse-Check-size-before-reading-ds64-chunk.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0025-wavparse-Check-for-short-reads-when-parsing-headers-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0025-wavparse-Check-for-short-reads-when-parsing-headers-.patch
new file mode 100644
index 0000000000..4b53830e12
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0025-wavparse-Check-for-short-reads-when-parsing-headers-.patch
@@ -0,0 +1,174 @@
+From 13b48016b3ef1e822c393c2871b0a561ce19ecb3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:00:57 +0300
+Subject: [PATCH 1/7] wavparse: Check for short reads when parsing headers in
+ pull mode
+
+And also return the actual flow return to the caller instead of always returning
+GST_FLOW_ERROR.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-258, GHSL-2024-260
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3886
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3888
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+CVE: CVE-2024-47775
+CVE: CVE-2024-47776
+CVE: CVE-2024-47777
+CVE: CVE-2024-47778
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/13b48016b3ef1e822c393c2871b0a561ce19ecb3]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/wavparse/gstwavparse.c | 63 ++++++++++++++++++++++++++++----------
+ 1 file changed, 46 insertions(+), 17 deletions(-)
+
+diff --git a/gst/wavparse/gstwavparse.c b/gst/wavparse/gstwavparse.c
+index d074f273c5..97d5591fae 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1096,6 +1096,24 @@ parse_ds64 (GstWavParse * wav, GstBuffer * buf)
+   return TRUE;
+ }
+ 
++static GstFlowReturn
++gst_wavparse_pull_range_exact (GstWavParse * wav, guint64 offset, guint size,
++    GstBuffer ** buffer)
++{
++  GstFlowReturn res;
++
++  res = gst_pad_pull_range (wav->sinkpad, offset, size, buffer);
++  if (res != GST_FLOW_OK)
++    return res;
++
++  if (gst_buffer_get_size (*buffer) < size) {
++    gst_clear_buffer (buffer);
++    return GST_FLOW_EOS;
++  }
++
++  return res;
++}
++
+ static GstFlowReturn
+ gst_wavparse_stream_headers (GstWavParse * wav)
+ {
+@@ -1291,9 +1309,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+ 
+       buf = NULL;
+       if ((res =
+-              gst_pad_pull_range (wav->sinkpad, wav->offset, 8,
++              gst_wavparse_pull_range_exact (wav, wav->offset, 8,
+                   &buf)) != GST_FLOW_OK)
+-        goto header_read_error;
++        goto header_pull_error;
+       gst_buffer_map (buf, &map, GST_MAP_READ);
+       tag = GST_READ_UINT32_LE (map.data);
+       size = GST_READ_UINT32_LE (map.data + 4);
+@@ -1396,9 +1414,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+             gst_buffer_unref (buf);
+             buf = NULL;
+             if ((res =
+-                    gst_pad_pull_range (wav->sinkpad, wav->offset + 8,
++                    gst_wavparse_pull_range_exact (wav, wav->offset + 8,
+                         data_size, &buf)) != GST_FLOW_OK)
+-              goto header_read_error;
++              goto header_pull_error;
+             gst_buffer_extract (buf, 0, &wav->fact, 4);
+             wav->fact = GUINT32_FROM_LE (wav->fact);
+             gst_buffer_unref (buf);
+@@ -1443,9 +1461,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+           gst_buffer_unref (buf);
+           buf = NULL;
+           if ((res =
+-                  gst_pad_pull_range (wav->sinkpad, wav->offset + 8,
+-                      size, &buf)) != GST_FLOW_OK)
+-            goto header_read_error;
++                  gst_wavparse_pull_range_exact (wav, wav->offset + 8, size,
++                      &buf)) != GST_FLOW_OK)
++            goto header_pull_error;
+           gst_buffer_map (buf, &map, GST_MAP_READ);
+           acid = (const gst_riff_acid *) map.data;
+           tempo = acid->tempo;
+@@ -1483,9 +1501,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+           gst_buffer_unref (buf);
+           buf = NULL;
+           if ((res =
+-                  gst_pad_pull_range (wav->sinkpad, wav->offset, 12,
++                  gst_wavparse_pull_range_exact (wav, wav->offset, 12,
+                       &buf)) != GST_FLOW_OK)
+-            goto header_read_error;
++            goto header_pull_error;
+           gst_buffer_extract (buf, 8, &ltag, 4);
+           ltag = GUINT32_FROM_LE (ltag);
+         }
+@@ -1512,9 +1530,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+               buf = NULL;
+               if (data_size > 0) {
+                 if ((res =
+-                        gst_pad_pull_range (wav->sinkpad, wav->offset,
++                        gst_wavparse_pull_range_exact (wav, wav->offset,
+                             data_size, &buf)) != GST_FLOW_OK)
+-                  goto header_read_error;
++                  goto header_pull_error;
+               }
+             }
+             if (data_size > 0) {
+@@ -1552,9 +1570,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+               buf = NULL;
+               wav->offset += 12;
+               if ((res =
+-                      gst_pad_pull_range (wav->sinkpad, wav->offset,
++                      gst_wavparse_pull_range_exact (wav, wav->offset,
+                           data_size, &buf)) != GST_FLOW_OK)
+-                goto header_read_error;
++                goto header_pull_error;
+               gst_buffer_map (buf, &map, GST_MAP_READ);
+               gst_wavparse_adtl_chunk (wav, (const guint8 *) map.data,
+                   data_size);
+@@ -1598,9 +1616,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+           gst_buffer_unref (buf);
+           buf = NULL;
+           if ((res =
+-                  gst_pad_pull_range (wav->sinkpad, wav->offset,
++                  gst_wavparse_pull_range_exact (wav, wav->offset,
+                       data_size, &buf)) != GST_FLOW_OK)
+-            goto header_read_error;
++            goto header_pull_error;
+           gst_buffer_map (buf, &map, GST_MAP_READ);
+           if (!gst_wavparse_cue_chunk (wav, (const guint8 *) map.data,
+                   data_size)) {
+@@ -1642,9 +1660,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+           gst_buffer_unref (buf);
+           buf = NULL;
+           if ((res =
+-                  gst_pad_pull_range (wav->sinkpad, wav->offset,
++                  gst_wavparse_pull_range_exact (wav, wav->offset,
+                       data_size, &buf)) != GST_FLOW_OK)
+-            goto header_read_error;
++            goto header_pull_error;
+           gst_buffer_map (buf, &map, GST_MAP_READ);
+           if (!gst_wavparse_smpl_chunk (wav, (const guint8 *) map.data,
+                   data_size)) {
+@@ -1796,6 +1814,17 @@ header_read_error:
+         ("Couldn't read in header %d (%s)", res, gst_flow_get_name (res)));
+     goto fail;
+   }
++header_pull_error:
++  {
++    if (res == GST_FLOW_EOS) {
++      GST_WARNING_OBJECT (wav, "Couldn't pull header %d (%s)", res,
++          gst_flow_get_name (res));
++    } else {
++      GST_ELEMENT_ERROR (wav, STREAM, DEMUX, (NULL),
++          ("Couldn't pull header %d (%s)", res, gst_flow_get_name (res)));
++    }
++    goto exit;
++  }
+ }
+ 
+ /*
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0026-wavparse-Make-sure-enough-data-for-the-tag-list-tag-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0026-wavparse-Make-sure-enough-data-for-the-tag-list-tag-.patch
new file mode 100644
index 0000000000..111c86e894
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0026-wavparse-Make-sure-enough-data-for-the-tag-list-tag-.patch
@@ -0,0 +1,41 @@
+From 4c198f4891cfabde868944d55ff98925e7beb757 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:09:43 +0300
+Subject: [PATCH 2/7] wavparse: Make sure enough data for the tag list tag is
+ available before parsing
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-258
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3886
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+CVE: CVE-2024-47775
+CVE: CVE-2024-47776
+CVE: CVE-2024-47777
+CVE: CVE-2024-47778
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/4c198f4891cfabde868944d55ff98925e7beb757]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/wavparse/gstwavparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gst/wavparse/gstwavparse.c b/gst/wavparse/gstwavparse.c
+index 97d5591fae..21cb48c07e 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1488,6 +1488,10 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+       case GST_RIFF_TAG_LIST:{
+         guint32 ltag;
+ 
++        /* Need at least the ltag */
++        if (size < 4)
++          goto exit;
++
+         if (wav->streaming) {
+           const guint8 *data = NULL;
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0027-wavparse-Fix-parsing-of-acid-chunk.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0027-wavparse-Fix-parsing-of-acid-chunk.patch
new file mode 100644
index 0000000000..39d0cccc9a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0027-wavparse-Fix-parsing-of-acid-chunk.patch
@@ -0,0 +1,65 @@
+From 296e17b4ea81e5c228bb853f6037b654fdca7d47 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:15:27 +0300
+Subject: [PATCH 3/7] wavparse: Fix parsing of acid chunk
+
+Simply casting the bytes to a struct can lead to crashes because of unaligned
+reads, and is also missing the endianness swapping that is necessary on big
+endian architectures.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+CVE: CVE-2024-47775
+CVE: CVE-2024-47776
+CVE: CVE-2024-47777
+CVE: CVE-2024-47778
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/296e17b4ea81e5c228bb853f6037b654fdca7d47]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/wavparse/gstwavparse.c | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/gst/wavparse/gstwavparse.c b/gst/wavparse/gstwavparse.c
+index 21cb48c07e..6a0c44638e 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1433,8 +1433,7 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+         break;
+       }
+       case GST_RIFF_TAG_acid:{
+-        const gst_riff_acid *acid = NULL;
+-        const guint data_size = sizeof (gst_riff_acid);
++        const guint data_size = 24;
+         gfloat tempo;
+ 
+         GST_INFO_OBJECT (wav, "Have acid chunk");
+@@ -1448,13 +1447,13 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+           break;
+         }
+         if (wav->streaming) {
++          const guint8 *data;
+           if (!gst_wavparse_peek_chunk (wav, &tag, &size)) {
+             goto exit;
+           }
+           gst_adapter_flush (wav->adapter, 8);
+-          acid = (const gst_riff_acid *) gst_adapter_map (wav->adapter,
+-              data_size);
+-          tempo = acid->tempo;
++          data = gst_adapter_map (wav->adapter, data_size);
++          tempo = GST_READ_FLOAT_LE (data + 20);
+           gst_adapter_unmap (wav->adapter);
+         } else {
+           GstMapInfo map;
+@@ -1465,8 +1464,7 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+                       &buf)) != GST_FLOW_OK)
+             goto header_pull_error;
+           gst_buffer_map (buf, &map, GST_MAP_READ);
+-          acid = (const gst_riff_acid *) map.data;
+-          tempo = acid->tempo;
++          tempo = GST_READ_FLOAT_LE (map.data + 20);
+           gst_buffer_unmap (buf, &map);
+         }
+         /* send data as tags */
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0028-wavparse-Check-that-at-least-4-bytes-are-available-b.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0028-wavparse-Check-that-at-least-4-bytes-are-available-b.patch
new file mode 100644
index 0000000000..7dbda5abdd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0028-wavparse-Check-that-at-least-4-bytes-are-available-b.patch
@@ -0,0 +1,37 @@
+From c72025cabdfcb2fe30d24eda7bb9d1d01a1b6555 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:21:44 +0300
+Subject: [PATCH 4/7] wavparse: Check that at least 4 bytes are available
+ before parsing cue chunks
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+CVE: CVE-2024-47775
+CVE: CVE-2024-47776
+CVE: CVE-2024-47777
+CVE: CVE-2024-47778
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c72025cabdfcb2fe30d24eda7bb9d1d01a1b6555]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/wavparse/gstwavparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gst/wavparse/gstwavparse.c b/gst/wavparse/gstwavparse.c
+index 6a0c44638e..5655ee3825 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -789,6 +789,11 @@ gst_wavparse_cue_chunk (GstWavParse * wav, const guint8 * data, guint32 size)
+     return TRUE;
+   }
+ 
++  if (size < 4) {
++    GST_WARNING_OBJECT (wav, "broken file %d", size);
++    return FALSE;
++  }
++
+   ncues = GST_READ_UINT32_LE (data);
+ 
+   if (size < 4 + ncues * 24) {
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0029-wavparse-Check-that-at-least-32-bytes-are-available-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0029-wavparse-Check-that-at-least-32-bytes-are-available-.patch
new file mode 100644
index 0000000000..bb5b6ff034
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0029-wavparse-Check-that-at-least-32-bytes-are-available-.patch
@@ -0,0 +1,40 @@
+From 93d79c22a82604adc5512557c1238f72f41188c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:22:02 +0300
+Subject: [PATCH 5/7] wavparse: Check that at least 32 bytes are available
+ before parsing smpl chunks
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-259
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3887
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+CVE: CVE-2024-47775
+CVE: CVE-2024-47776
+CVE: CVE-2024-47777
+CVE: CVE-2024-47778
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/93d79c22a82604adc5512557c1238f72f41188c4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/wavparse/gstwavparse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/gst/wavparse/gstwavparse.c b/gst/wavparse/gstwavparse.c
+index 5655ee3825..8a04805ed4 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -893,6 +893,9 @@ gst_wavparse_smpl_chunk (GstWavParse * wav, const guint8 * data, guint32 size)
+ {
+   guint32 note_number;
+ 
++  if (size < 32)
++    return FALSE;
++
+   /*
+      manufacturer_id = GST_READ_UINT32_LE (data);
+      product_id = GST_READ_UINT32_LE (data + 4);
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0030-wavparse-Fix-clipping-of-size-to-the-file-size.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0030-wavparse-Fix-clipping-of-size-to-the-file-size.patch
new file mode 100644
index 0000000000..d12ab9b4e1
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0030-wavparse-Fix-clipping-of-size-to-the-file-size.patch
@@ -0,0 +1,47 @@
+From 526d0eef0d850c8f2fa1bf0aef15a836797f1a67 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:27:27 +0300
+Subject: [PATCH 6/7] wavparse: Fix clipping of size to the file size
+
+The size does not include the 8 bytes tag and length, so an additional 8 bytes
+must be removed here. 8 bytes are always available at this point because
+otherwise the parsing of the tag and length right above would've failed.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-260
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3888
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+CVE: CVE-2024-47775
+CVE: CVE-2024-47776
+CVE: CVE-2024-47777
+CVE: CVE-2024-47778
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/526d0eef0d850c8f2fa1bf0aef15a836797f1a67]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/wavparse/gstwavparse.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gst/wavparse/gstwavparse.c b/gst/wavparse/gstwavparse.c
+index 8a04805ed4..998cbb276d 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1337,10 +1337,11 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+     }
+ 
+     /* Clip to upstream size if known */
+-    if (upstream_size > 0 && size + wav->offset > upstream_size) {
++    if (upstream_size > 0 && size + 8 + wav->offset > upstream_size) {
+       GST_WARNING_OBJECT (wav, "Clipping chunk size to file size");
+       g_assert (upstream_size >= wav->offset);
+-      size = upstream_size - wav->offset;
++      g_assert (upstream_size - wav->offset >= 8);
++      size = upstream_size - wav->offset - 8;
+     }
+ 
+     /* wav is a st00pid format, we don't know for sure where data starts.
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0031-wavparse-Check-size-before-reading-ds64-chunk.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0031-wavparse-Check-size-before-reading-ds64-chunk.patch
new file mode 100644
index 0000000000..b27132b16d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0031-wavparse-Check-size-before-reading-ds64-chunk.patch
@@ -0,0 +1,41 @@
+From 4f381d15014471b026020d0990a5f5a9f420a22b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:51:00 +0300
+Subject: [PATCH 7/7] wavparse: Check size before reading ds64 chunk
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-261
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3889
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+CVE: CVE-2024-47775
+CVE: CVE-2024-47776
+CVE: CVE-2024-47777
+CVE: CVE-2024-47778
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/4f381d15014471b026020d0990a5f5a9f420a22b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/wavparse/gstwavparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gst/wavparse/gstwavparse.c b/gst/wavparse/gstwavparse.c
+index 998cbb276d..958868de6d 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1087,6 +1087,11 @@ parse_ds64 (GstWavParse * wav, GstBuffer * buf)
+   guint32 sampleCountLow, sampleCountHigh;
+ 
+   gst_buffer_map (buf, &map, GST_MAP_READ);
++  if (map.size < 6 * 4) {
++    GST_WARNING_OBJECT (wav, "Too small ds64 chunk (%" G_GSIZE_FORMAT ")",
++        map.size);
++    return FALSE;
++  }
+   dataSizeLow = GST_READ_UINT32_LE (map.data + 2 * 4);
+   dataSizeHigh = GST_READ_UINT32_LE (map.data + 3 * 4);
+   sampleCountLow = GST_READ_UINT32_LE (map.data + 4 * 4);
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 247fda7f9c..608c3030ba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -31,6 +31,13 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0022-jpegdec-Directly-error-out-on-negotiation-failures.patch \
            file://0023-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
            file://0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch \
+           file://0025-wavparse-Check-for-short-reads-when-parsing-headers-.patch \
+           file://0026-wavparse-Make-sure-enough-data-for-the-tag-list-tag-.patch \
+           file://0027-wavparse-Fix-parsing-of-acid-chunk.patch \
+           file://0028-wavparse-Check-that-at-least-4-bytes-are-available-b.patch \
+           file://0029-wavparse-Check-that-at-least-32-bytes-are-available-.patch \
+           file://0030-wavparse-Fix-clipping-of-size-to-the-file-size.patch \
+           file://0031-wavparse-Check-size-before-reading-ds64-chunk.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.43.0


