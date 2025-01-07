Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F6FC3DA4A
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:09:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.106.1736273339969905101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:09:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=THQGGQaW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21669fd5c7cso237585875ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273339; x=1736878139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+JImGOG54ajpW94OTXSQOFxmK5lW/EuQFVnEgHzbV34=;
        b=THQGGQaWHFFMf6i3FiKkbRYUsnw9pU7ouR++bwYWc4WfeiYBQK1xtzABHFBO86oxhe
         DEizGwccwFMHiRDL8Ez13dYlLuH706Ba+yYULmuNwQkMMa1tTLyXGtUy69D3eT4rHbmm
         SmG5sXsjmh3EPW3IjCSo9ZRYcG4TFK/q1nw9mu1O2jPNUPY96sFv+tKBHPVQnQ8qFsIH
         ii86ZVFgOzSvfaPmE62DZaJV/zMkiI+YsEucpqBR5mqP2GRs58S4b9udxpOoQ5eVSADH
         g82cuprMG3ZVj6+jTuoPM6fz4QkFIIdk6VWzTIGhESsHCITYh0r8rDWTmQOmWZamgxG3
         sAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273339; x=1736878139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JImGOG54ajpW94OTXSQOFxmK5lW/EuQFVnEgHzbV34=;
        b=hSn7qMEE2fICJnN4ZJjsGQEdB9eE8p81TDvglt6fTQpCvGOfhoacppDaEC7sOc0C+y
         /4vHcgz75BZAnRTrgWc1Qof15gk1RsLVc57yEj6hvAUotf8dNsZ0985OXiptSrP2e6XV
         zEoAqpJ7euAjSXeTj73sr6mwMI4JMf/yioEQW86nc7/Lto2D53A5pZc9Nfyo56cLNpWN
         SIJjqV0S1mYH9+QBD/MxocZJsv2rBEgVp6JhlRyrJFdF5uZbCIehmaiCgkEqkpxqLhPq
         aFaRPypdaHAOQZwo3j14PMjz9CNQiqxGQXEQaFyHLctjQdw0bwKauJhgSckE7b+Wa6j6
         O8fg==
X-Gm-Message-State: AOJu0YyctXqwR5PWouvfMU1c0lfUX0Kyv6205R3kaczFKhsrNe3jiAvS
	eNV90iKCVtLBrkEWETfU4CK90cB7m+j48aVYiAMQIU+uBDVE+Tn1Q2TN3FTGXOggUOcMZFhhRpl
	MXgM=
X-Gm-Gg: ASbGncvFS/td6D5vgm5Bp97dltGcvqRXT72hOtPwzoqGaEfji8d44bXWzASa8x3hjaA
	gc1NIuyOzjcReSmYBMk5Y9BFKUZC00q9RxOOvUGZnkJtwebHa5U43XWb7gi+WKQ/cwXoitMTtsk
	nxTLFuZkEMA3NjuH84TnjFQnSR6FkihIlZDGBQyJlm3Fcf3bkoU7IfTcwdPv22hF6oCiIoWgxJt
	RDHLqGeMvnbiIn3dxtrMSKERdHLBg3zvVAwviAo7nUSww==
X-Google-Smtp-Source: AGHT+IFZp87qMSMvP7ZYDPxEk3HvhOtfQZ/4foCBqZU95QXAoOAyr7EoIIOyWmceEtT8FokHH4n5AA==
X-Received: by 2002:a17:902:e5c2:b0:215:b33b:e26d with SMTP id d9443c01a7336-21a83f55103mr113395ad.21.1736273338902;
        Tue, 07 Jan 2025 10:08:58 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/19] gstreamer1.0-plugins-good: Fix multiple CVE's
Date: Tue,  7 Jan 2025 10:08:27 -0800
Message-ID: <9c228198644da3ebed0a25051633676158161f26.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209490

From: Vijay Anusuri <vanusuri@mvista.com>

Fixes for below CVEs:
CVE-2024-47775
CVE-2024-47776
CVE-2024-47777
CVE-2024-47778

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-47775_47776_47777_47778-1.patch  | 171 ++++++++++++++++++
 .../CVE-2024-47775_47776_47777_47778-2.patch  |  38 ++++
 .../CVE-2024-47775_47776_47777_47778-3.patch  |  62 +++++++
 .../CVE-2024-47775_47776_47777_47778-4.patch  |  34 ++++
 .../CVE-2024-47775_47776_47777_47778-5.patch  |  37 ++++
 .../CVE-2024-47775_47776_47777_47778-6.patch  |  44 +++++
 .../CVE-2024-47775_47776_47777_47778-7.patch  |  38 ++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |   7 +
 8 files changed, 431 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-3.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-4.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-5.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-6.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-7.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-1.patch
new file mode 100644
index 0000000000..2eaef45f41
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-1.patch
@@ -0,0 +1,171 @@
+From 13b48016b3ef1e822c393c2871b0a561ce19ecb3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:00:57 +0300
+Subject: [PATCH] wavparse: Check for short reads when parsing headers in pull
+ mode
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/13b48016b3ef1e822c393c2871b0a561ce19ecb3]
+CVE: CVE-2024-47775 CVE-2024-47776 CVE-2024-47777 CVE-2024-47778
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst/wavparse/gstwavparse.c                | 63 ++++++++++++++-----
+ 1 file changed, 46 insertions(+), 17 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c b/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c
+index d074f273c501..97d5591fae8f 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1097,6 +1097,24 @@ parse_ds64 (GstWavParse * wav, GstBuffer * buf)
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
+@@ -1292,9 +1310,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1397,9 +1415,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1444,9 +1462,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1484,9 +1502,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1513,9 +1531,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1553,9 +1571,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1599,9 +1617,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1643,9 +1661,9 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1797,6 +1815,17 @@ header_read_error:
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
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-2.patch
new file mode 100644
index 0000000000..3df27b62bc
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-2.patch
@@ -0,0 +1,38 @@
+From 4c198f4891cfabde868944d55ff98925e7beb757 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:09:43 +0300
+Subject: [PATCH] wavparse: Make sure enough data for the tag list tag is
+ available before parsing
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-258
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3886
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/4c198f4891cfabde868944d55ff98925e7beb757]
+CVE: CVE-2024-47775 CVE-2024-47776 CVE-2024-47777 CVE-2024-47778
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c b/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c
+index 97d5591fae8f..21cb48c07eb3 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1489,6 +1489,10 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-3.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-3.patch
new file mode 100644
index 0000000000..010041aa4e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-3.patch
@@ -0,0 +1,62 @@
+From 296e17b4ea81e5c228bb853f6037b654fdca7d47 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:15:27 +0300
+Subject: [PATCH] wavparse: Fix parsing of acid chunk
+
+Simply casting the bytes to a struct can lead to crashes because of unaligned
+reads, and is also missing the endianness swapping that is necessary on big
+endian architectures.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/296e17b4ea81e5c228bb853f6037b654fdca7d47]
+CVE: CVE-2024-47775 CVE-2024-47776 CVE-2024-47777 CVE-2024-47778
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/wavparse/gstwavparse.c      | 12 +++++-------
+ 1 file changed, 5 insertions(+), 7 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c b/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c
+index 21cb48c07eb3..6a0c44638ea2 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1434,8 +1434,7 @@ gst_wavparse_stream_headers (GstWavParse * wav)
+         break;
+       }
+       case GST_RIFF_TAG_acid:{
+-        const gst_riff_acid *acid = NULL;
+-        const guint data_size = sizeof (gst_riff_acid);
++        const guint data_size = 24;
+         gfloat tempo;
+ 
+         GST_INFO_OBJECT (wav, "Have acid chunk");
+@@ -1449,13 +1448,13 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+@@ -1466,8 +1465,7 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-4.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-4.patch
new file mode 100644
index 0000000000..c7c3dbed46
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-4.patch
@@ -0,0 +1,34 @@
+From c72025cabdfcb2fe30d24eda7bb9d1d01a1b6555 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:21:44 +0300
+Subject: [PATCH] wavparse: Check that at least 4 bytes are available before
+ parsing cue chunks
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c72025cabdfcb2fe30d24eda7bb9d1d01a1b6555]
+CVE: CVE-2024-47775 CVE-2024-47776 CVE-2024-47777 CVE-2024-47778
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c b/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c
+index 6a0c44638ea2..5655ee3825ca 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -790,6 +790,11 @@ gst_wavparse_cue_chunk (GstWavParse * wav, const guint8 * data, guint32 size)
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
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-5.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-5.patch
new file mode 100644
index 0000000000..89b240998a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-5.patch
@@ -0,0 +1,37 @@
+From 93d79c22a82604adc5512557c1238f72f41188c4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:22:02 +0300
+Subject: [PATCH] wavparse: Check that at least 32 bytes are available before
+ parsing smpl chunks
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-259
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3887
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/93d79c22a82604adc5512557c1238f72f41188c4]
+CVE: CVE-2024-47775 CVE-2024-47776 CVE-2024-47777 CVE-2024-47778
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c b/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c
+index 5655ee3825ca..8a04805ed427 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -894,6 +894,9 @@ gst_wavparse_smpl_chunk (GstWavParse * wav, const guint8 * data, guint32 size)
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
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-6.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-6.patch
new file mode 100644
index 0000000000..0ad2592bc9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-6.patch
@@ -0,0 +1,44 @@
+From 526d0eef0d850c8f2fa1bf0aef15a836797f1a67 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:27:27 +0300
+Subject: [PATCH] wavparse: Fix clipping of size to the file size
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
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/526d0eef0d850c8f2fa1bf0aef15a836797f1a67]
+CVE: CVE-2024-47775 CVE-2024-47776 CVE-2024-47777 CVE-2024-47778
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c b/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c
+index 8a04805ed427..998cbb276dbf 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1338,10 +1338,11 @@ gst_wavparse_stream_headers (GstWavParse * wav)
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
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-7.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-7.patch
new file mode 100644
index 0000000000..d73359f375
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47775_47776_47777_47778-7.patch
@@ -0,0 +1,38 @@
+From 4f381d15014471b026020d0990a5f5a9f420a22b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 13:51:00 +0300
+Subject: [PATCH] wavparse: Check size before reading ds64 chunk
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-261
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3889
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8042>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/4f381d15014471b026020d0990a5f5a9f420a22b]
+CVE: CVE-2024-47775 CVE-2024-47776 CVE-2024-47777 CVE-2024-47778
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c b/subprojects/gst-plugins-good/gst/wavparse/gstwavparse.c
+index 998cbb276dbf..958868de6d9e 100644
+--- a/gst/wavparse/gstwavparse.c
++++ b/gst/wavparse/gstwavparse.c
+@@ -1088,6 +1088,11 @@ parse_ds64 (GstWavParse * wav, GstBuffer * buf)
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
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index 8cf08c5088..e82473086e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -30,6 +30,13 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47606.patch \
            file://CVE-2024-47613.patch \
            file://CVE-2024-47774.patch \
+           file://CVE-2024-47775_47776_47777_47778-1.patch \
+           file://CVE-2024-47775_47776_47777_47778-2.patch \
+           file://CVE-2024-47775_47776_47777_47778-3.patch \
+           file://CVE-2024-47775_47776_47777_47778-4.patch \
+           file://CVE-2024-47775_47776_47777_47778-5.patch \
+           file://CVE-2024-47775_47776_47777_47778-6.patch \
+           file://CVE-2024-47775_47776_47777_47778-7.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.43.0


