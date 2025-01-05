Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A100EE77199
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 05:44:01 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
 by mx.groups.io with SMTP id smtpd.web10.33633.1736055840233799041
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 21:44:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QGhaqMhP;
 spf=pass (domain: mvista.com, ip: 209.85.166.49, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-844e7409f8aso570325739f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 21:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736055838; x=1736660638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxAUw11Rkt+rLHWuWfj5cFUdZSPy85/QTp7ZLPM1mGA=;
        b=QGhaqMhPo9qJw7W4k0BIsZ5tNrL1Q1G8AjZA806wz+tebwbTUp5gZHpfRBCDQvsWAW
         jEX4LIhwuOjLPhR/mmGYHmNVcpXSzeSchiHl4fBOV373nPwt/tSXIHheqrWV4m2P3s2B
         ArqEVAm7IN9zHqvePK5LEqCt4wr+HLZzhQw4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736055838; x=1736660638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OxAUw11Rkt+rLHWuWfj5cFUdZSPy85/QTp7ZLPM1mGA=;
        b=Sg1xe27N6il/NaZGPC75LGRMlsS54QY+BdpGeIcJiO8DC2zv5DIi6GfaSzuqwW9UCK
         /qknFeesJ0/iPjDBnwo+C0xqBTeeeIZr+dsKaV5CcnpStveFji+TvMrmskIuilskYtGu
         0mPa8fkQ75NniXF+wgWim7G445fS2G9K53tzjLYUEu39/w2/GC3gR+FvaUPCXg87NNaP
         2j8DGUXfRLavPV7XqFwx0Fd/jJaxIB/L+Q04Djs1LUa26tWhPsKIZWVZrmBCktb5I+Lx
         0Efy0Z5fZTN6fJaQfbJ2Pv/EWivJ0GGEpR5OCcTZ2aSeRs7ZH4rSa5lL2tksfvIVCV/1
         V53A==
X-Gm-Message-State: AOJu0YzQnSs8TkKlpianvmAYpaVt2687299iWfb/wNWWB+u9j+QwpeaX
	BVA54x9NEhGoeQb5G0tD6T7J/CwN9CmXoMOxnuJkSGiVHgbWMCvyFtOZSgTnSKt/LdYWjba6XPf
	OVjY=
X-Gm-Gg: ASbGncu8rbWcpHWG20Xa7pppNIqZu0ecJQLNynUg+WUuz0ZF9hho4r9M939TS/LIVSg
	2V+ObABMfmeBxcUe17YZcJVkmx0md5t74X8j+Qup7m9BiMhC7MNp+fsOMwL9Xf26CPAysWO6ll4
	YLEPg5b4v4FIH1RbDu3AIMffMjG5faA2LtS+OtuNqpE9gXhT5H52uBjkBd3uLo3x6CSBTbam6hX
	6AcOHbJ0wsqwu5k8Kns0/C3VlK/bkCDtzb7MQ6Zphn5E4Wrtyabp+/nt3N39R7BLwkNCyY=
X-Google-Smtp-Source: AGHT+IGDs4gxMz1G7Q+YLrGOXXqSM+wG81fAh4NYvnPdh1hFgXr5rfTL0U4KCXD+HfTlbykCmtUj+w==
X-Received: by 2002:a05:6e02:20ca:b0:3a7:8270:4050 with SMTP id e9e14a558f8ab-3c2d514fafdmr475494015ab.18.1736055838473;
        Sat, 04 Jan 2025 21:43:58 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:3521:fa4f:fd77:a73f:8749])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66ed9sm8570467173.45.2025.01.04.21.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 21:43:56 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 5/9] gstreamer1.0-plugins-good: Fix multiple CVEs
Date: Sun,  5 Jan 2025 11:13:14 +0530
Message-Id: <20250105054318.222154-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250105054318.222154-1-vanusuri@mvista.com>
References: <20250105054318.222154-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 05:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209410

From: Vijay Anusuri <vanusuri@mvista.com>

Fixes for below CVEs:
CVE-2024-47540
CVE-2024-47601
CVE-2024-47602
CVE-2024-47603
CVE-2024-47834

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...2024-47540_47601_47602_47603_47834-1.patch | 56 +++++++++++++++++++
 ...2024-47540_47601_47602_47603_47834-2.patch | 31 ++++++++++
 ...2024-47540_47601_47602_47603_47834-3.patch | 39 +++++++++++++
 ...2024-47540_47601_47602_47603_47834-4.patch | 47 ++++++++++++++++
 ...2024-47540_47601_47602_47603_47834-5.patch | 48 ++++++++++++++++
 ...2024-47540_47601_47602_47603_47834-6.patch | 39 +++++++++++++
 ...2024-47540_47601_47602_47603_47834-7.patch | 40 +++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  7 +++
 8 files changed, 307 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-3.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-4.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-5.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-6.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-7.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-1.patch
new file mode 100644
index 0000000000..865759916f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-1.patch
@@ -0,0 +1,56 @@
+From 008f0d52408f57f0704d5639b72db2f330b8f003 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 16:32:48 +0300
+Subject: [PATCH] matroskademux: Only unmap GstMapInfo in WavPack header
+ extraction error paths if previously mapped
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-197
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3863
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/008f0d52408f57f0704d5639b72db2f330b8f003]
+CVE: CVE-2024-47540 CVE-2024-47601 CVE-2024-47602 CVE-2024-47603 CVE-2024-47834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/matroska/matroska-demux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c b/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c
+index 9b3cf83adb87..35e60b71470d 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -3885,7 +3885,6 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+   GstMatroskaTrackAudioContext *audiocontext =
+       (GstMatroskaTrackAudioContext *) stream;
+   GstBuffer *newbuf = NULL;
+-  GstMapInfo map, outmap;
+   guint8 *buf_data, *data;
+   Wavpack4Header wvh;
+ 
+@@ -3902,11 +3901,11 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+ 
+   if (audiocontext->channels <= 2) {
+     guint32 block_samples, tmp;
++    GstMapInfo outmap;
+     gsize size = gst_buffer_get_size (*buf);
+ 
+     if (size < 4) {
+       GST_ERROR_OBJECT (element, "Too small wavpack buffer");
+-      gst_buffer_unmap (*buf, &map);
+       return GST_FLOW_ERROR;
+     }
+ 
+@@ -3944,6 +3943,7 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+     *buf = newbuf;
+     audiocontext->wvpk_block_index += block_samples;
+   } else {
++    GstMapInfo map, outmap;
+     guint8 *outdata = NULL;
+     gsize buf_size, size;
+     guint32 block_samples, flags, crc;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-2.patch
new file mode 100644
index 0000000000..04e3a9168a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-2.patch
@@ -0,0 +1,31 @@
+From b7e1b13af70b7c042f29674f5482b502af82d829 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 16:33:39 +0300
+Subject: [PATCH] matroskademux: Fix off-by-one when parsing multi-channel
+ WavPack
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b7e1b13af70b7c042f29674f5482b502af82d829]
+CVE: CVE-2024-47540 CVE-2024-47601 CVE-2024-47602 CVE-2024-47603 CVE-2024-47834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/matroska/matroska-demux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c b/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c
+index 35e60b71470d..583fbbe6e695 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -3970,7 +3970,7 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+     data += 4;
+     size -= 4;
+ 
+-    while (size > 12) {
++    while (size >= 12) {
+       flags = GST_READ_UINT32_LE (data);
+       data += 4;
+       size -= 4;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-3.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-3.patch
new file mode 100644
index 0000000000..de2bdc13cb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-3.patch
@@ -0,0 +1,39 @@
+From 455393ef0f2bb0a49c5bf32ef208af914c44e806 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 18:25:53 +0300
+Subject: [PATCH] matroskademux: Check for big enough WavPack codec private
+ data before accessing it
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-250
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3866
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/455393ef0f2bb0a49c5bf32ef208af914c44e806]
+CVE: CVE-2024-47540 CVE-2024-47601 CVE-2024-47602 CVE-2024-47603 CVE-2024-47834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/matroska/matroska-demux.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c b/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c
+index 583fbbe6e695..91e66fefc36a 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -3888,6 +3888,11 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+   guint8 *buf_data, *data;
+   Wavpack4Header wvh;
+ 
++  if (!stream->codec_priv || stream->codec_priv_size < 2) {
++    GST_ERROR_OBJECT (element, "No or too small wavpack codec private data");
++    return GST_FLOW_ERROR;
++  }
++
+   wvh.ck_id[0] = 'w';
+   wvh.ck_id[1] = 'v';
+   wvh.ck_id[2] = 'p';
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-4.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-4.patch
new file mode 100644
index 0000000000..9bfbd07e1b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-4.patch
@@ -0,0 +1,47 @@
+From be0ac3f40949cb951d5f0761f4a3bd597a94947f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 19:04:51 +0300
+Subject: [PATCH] matroskademux: Don't take data out of an empty adapter when
+ processing WavPack frames
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-249
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3865
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/be0ac3f40949cb951d5f0761f4a3bd597a94947f]
+CVE: CVE-2024-47540 CVE-2024-47601 CVE-2024-47602 CVE-2024-47603 CVE-2024-47834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/matroska/matroska-demux.c    | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c b/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c
+index 91e66fefc36a..98ed51e86a58 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -4036,11 +4036,16 @@ gst_matroska_demux_add_wvpk_header (GstElement * element,
+     }
+     gst_buffer_unmap (*buf, &map);
+ 
+-    newbuf = gst_adapter_take_buffer (adapter, gst_adapter_available (adapter));
++    size = gst_adapter_available (adapter);
++    if (size > 0) {
++      newbuf = gst_adapter_take_buffer (adapter, size);
++      gst_buffer_copy_into (newbuf, *buf,
++          GST_BUFFER_COPY_TIMESTAMPS | GST_BUFFER_COPY_FLAGS, 0, -1);
++    } else {
++      newbuf = NULL;
++    }
+     g_object_unref (adapter);
+ 
+-    gst_buffer_copy_into (newbuf, *buf,
+-        GST_BUFFER_COPY_TIMESTAMPS | GST_BUFFER_COPY_FLAGS, 0, -1);
+     gst_buffer_unref (*buf);
+     *buf = newbuf;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-5.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-5.patch
new file mode 100644
index 0000000000..0e13b8a1ca
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-5.patch
@@ -0,0 +1,48 @@
+From effbbfd771487cc06c79d5a7e447a849884cc6cf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 19:06:03 +0300
+Subject: [PATCH] matroskademux: Skip over laces directly when postprocessing
+ the frame fails
+
+Otherwise NULL buffers might be handled afterwards.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-249
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3865
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/effbbfd771487cc06c79d5a7e447a849884cc6cf]
+CVE: CVE-2024-47540 CVE-2024-47601 CVE-2024-47602 CVE-2024-47603 CVE-2024-47834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/matroska/matroska-demux.c   | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c b/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c
+index 98ed51e86a58..e0a4405dcefa 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -4982,6 +4982,18 @@ gst_matroska_demux_parse_blockgroup_or_simpleblock (GstMatroskaDemux * demux,
+       if (stream->postprocess_frame) {
+         GST_LOG_OBJECT (demux, "running post process");
+         ret = stream->postprocess_frame (GST_ELEMENT (demux), stream, &sub);
++        if (ret != GST_FLOW_OK) {
++          gst_clear_buffer (&sub);
++          goto next_lace;
++        }
++
++        if (sub == NULL) {
++          GST_WARNING_OBJECT (demux,
++              "Postprocessing buffer with timestamp %" GST_TIME_FORMAT
++              " for stream %d failed", GST_TIME_ARGS (buffer_timestamp),
++              stream_num);
++          goto next_lace;
++        }
+       }
+ 
+       /* At this point, we have a sub-buffer pointing at data within a larger
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-6.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-6.patch
new file mode 100644
index 0000000000..3c661e92f7
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-6.patch
@@ -0,0 +1,39 @@
+From ed7b46bac3fa14f95422cc4bb4655d041df51454 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 19:19:42 +0300
+Subject: [PATCH] matroskademux: Skip over zero-sized Xiph stream headers
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-251
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3867
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ed7b46bac3fa14f95422cc4bb4655d041df51454]
+CVE: CVE-2024-47540 CVE-2024-47601 CVE-2024-47602 CVE-2024-47603 CVE-2024-47834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/matroska/matroska-ids.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/matroska/matroska-ids.c b/subprojects/gst-plugins-good/gst/matroska/matroska-ids.c
+index f11b7c2ce31f..ba645f7306d9 100644
+--- a/gst/matroska/matroska-ids.c
++++ b/gst/matroska/matroska-ids.c
+@@ -189,8 +189,10 @@ gst_matroska_parse_xiph_stream_headers (gpointer codec_data,
+     if (offset + length[i] > codec_data_size)
+       goto error;
+ 
+-    hdr = gst_buffer_new_memdup (p + offset, length[i]);
+-    gst_buffer_list_add (list, hdr);
++    if (length[i] > 0) {
++      hdr = gst_buffer_new_memdup (p + offset, length[i]);
++      gst_buffer_list_add (list, hdr);
++    }
+ 
+     offset += length[i];
+   }
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-7.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-7.patch
new file mode 100644
index 0000000000..1341491873
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47540_47601_47602_47603_47834-7.patch
@@ -0,0 +1,40 @@
+From 98e4356be7afa869373f96b4e8ca792c5f9707ee Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 9 Oct 2024 11:52:52 -0400
+Subject: [PATCH] matroskademux: Put a copy of the codec data into the A_MS/ACM
+ caps
+
+The original codec data buffer is owned by matroskademux and does not
+necessarily live as long as the caps.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-280
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3894
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/98e4356be7afa869373f96b4e8ca792c5f9707ee]
+CVE: CVE-2024-47540 CVE-2024-47601 CVE-2024-47602 CVE-2024-47603 CVE-2024-47834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/matroska/matroska-demux.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c b/subprojects/gst-plugins-good/gst/matroska/matroska-demux.c
+index e0a4405dcefa..80da30673120 100644
+--- a/gst/matroska/matroska-demux.c
++++ b/gst/matroska/matroska-demux.c
+@@ -7165,8 +7165,7 @@ gst_matroska_demux_audio_caps (GstMatroskaTrackAudioContext *
+ 
+       /* 18 is the waveformatex size */
+       if (size > 18) {
+-        codec_data = gst_buffer_new_wrapped_full (GST_MEMORY_FLAG_READONLY,
+-            data + 18, size - 18, 0, size - 18, NULL, NULL);
++        codec_data = gst_buffer_new_memdup (data + 18, size - 18);
+       }
+ 
+       if (riff_audio_fmt)
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index 0daae0b519..f57797d236 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -20,6 +20,13 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch \
            file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch \
            file://CVE-2024-47599.patch \
+           file://CVE-2024-47540_47601_47602_47603_47834-1.patch \
+           file://CVE-2024-47540_47601_47602_47603_47834-2.patch \
+           file://CVE-2024-47540_47601_47602_47603_47834-3.patch \
+           file://CVE-2024-47540_47601_47602_47603_47834-4.patch \
+           file://CVE-2024-47540_47601_47602_47603_47834-5.patch \
+           file://CVE-2024-47540_47601_47602_47603_47834-6.patch \
+           file://CVE-2024-47540_47601_47602_47603_47834-7.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.25.1


