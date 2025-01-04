Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FB6E7719C
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:16 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.18132.1735998129141116139
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QvUpu/U9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21675fd60feso242124075ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998128; x=1736602928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VUp+llOLu9v+iBBjjCcduj/RyzHytedvLSwZaTaGH4=;
        b=QvUpu/U9510RFI+Fg4eGlq9dxjaOSvcRIXX+YUVb09/sZE49TQt+Zbx7d60U72nza/
         T344x0qUpvO46vdNmZvNIyweojFWHeFXRDs0llcbXjEgf5k4Bvky7G7ifStJpG9od/DG
         lQZPg+VKVgk/ZVgURP3peMHFmJwBVWJ1dBLr+HfOwNd0/NROgOTFyp6FMy7InvZmNYH9
         XTxQ7C3YYFJhrYS1g9H6DRdcbp3jYnbmF2PZOgjs8yvJyyaORmh9VKqURVNio5WbxOIR
         u/RkPc/Wy4Epy+NfNJLuWrwLRHKQ1iw+Psj9vm7a6AU2imDrgLVwycN+FGvQpUkR+Yd2
         0w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998128; x=1736602928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VUp+llOLu9v+iBBjjCcduj/RyzHytedvLSwZaTaGH4=;
        b=rE8BmDzDXeYMOWZayuxyPuQodwYX+LXra7BPPBkq24aQ8eGZlD9S6CAIw//EHZJH9n
         Y4XTs692jgr4RKtEvsKQBrqJPPOFaE0lmY1RudKOXoPQ5/4usixT73CmNW8lL7RekxGN
         GF9HpiDdLwoURYU6pz/ezOlKRhJgdWGXoHHSvXcX7LpUswhFirm6ySW7PD/Tp44dAn4F
         DuVwlyg0fGh9urJWgTkmNGugFLZlQyeps+6+iCN0iShS+HWM7RnoaAxfb2PsOpL4EgNv
         ROlE/4pHFTdi9Bxt818IKFSNoFafRq5iqsLxEq0uYGmXAUtRv7lbdnTWLXE2dtKmK+S1
         klEw==
X-Gm-Message-State: AOJu0YzjmAvDIaznKc03J55+jOUt38oU2pINWapBk5Y5U/foUJg4HyDN
	SuwNGmM0r1ySBhI08tZdSHlzpWi6q1bBQ7mzzhUm38VDsZilcxfmGdgPBxPZ4SrWVc/mz3c8ZIA
	T
X-Gm-Gg: ASbGncs4GqIt/IJI7Z9lzGXXdrNODehc8vLaX90jNpf4TpI0le/KVnGjHI4JQwbn0fn
	o2U+9dszUpt6X9v8P6N2E3/vVrCFDu9ITCR+WGUIw7ZCdGSa7wCZA6Xhe+5WO0+28uap+gFwyMq
	3jJItz8DIKB3Dx5SO4l2E3lKdzl1d51menpIHU3v+O+heRzr1y+Bvw04J3yYSYXkUbNapaowtu+
	e8zy9GvFKch8vE0HwH7TFi8cdvA2PCMqHC+lWJHCySHgg==
X-Google-Smtp-Source: AGHT+IHLS8R1+LK0keLAAWJgoxETvcetDnFrBlu9XOt0RAVauHEJGg2X9KM9Jvxhhcg3wnBWrDDCLA==
X-Received: by 2002:a05:6a21:6da4:b0:1e1:e2d9:7f0a with SMTP id adf61e73a8af0-1e5e0802525mr88187980637.34.1735998127935;
        Sat, 04 Jan 2025 05:42:07 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:07 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/25] gstreamer1.0-plugins-good: patch several CVEs
Date: Sat,  4 Jan 2025 05:41:30 -0800
Message-ID: <4edd9caa9703e067167c4a185c7338c4e89f795b.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209375

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057

Signed-off-by: Peter Marko <peter.marko@siemens.com>

fixup! gstreamer1.0-plugins-good: patch CVE-2024-47540 and CVE-2024-47601

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ly-unmap-GstMapInfo-in-WavPack-heade.patch | 60 +++++++++++++++++++
 ...x-off-by-one-when-parsing-multi-chan.patch | 35 +++++++++++
 ...eck-for-big-enough-WavPack-codec-pri.patch | 43 +++++++++++++
 ...n-t-take-data-out-of-an-empty-adapte.patch | 51 ++++++++++++++++
 ...ip-over-laces-directly-when-postproc.patch | 52 ++++++++++++++++
 ...ip-over-zero-sized-Xiph-stream-heade.patch | 43 +++++++++++++
 ...t-a-copy-of-the-codec-data-into-the-.patch | 44 ++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  7 +++
 8 files changed, 335 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0015-matroskademux-Only-unmap-GstMapInfo-in-WavPack-heade.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0016-matroskademux-Fix-off-by-one-when-parsing-multi-chan.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0017-matroskademux-Check-for-big-enough-WavPack-codec-pri.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0018-matroskademux-Don-t-take-data-out-of-an-empty-adapte.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0019-matroskademux-Skip-over-laces-directly-when-postproc.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0015-matroskademux-Only-unmap-GstMapInfo-in-WavPack-heade.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0015-matroskademux-Only-unmap-GstMapInfo-in-WavPack-heade.patch
new file mode 100644
index 0000000000..354a2e5194
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0015-matroskademux-Only-unmap-GstMapInfo-in-WavPack-heade.patch
@@ -0,0 +1,60 @@
+From 008f0d52408f57f0704d5639b72db2f330b8f003 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 16:32:48 +0300
+Subject: [PATCH 1/7] matroskademux: Only unmap GstMapInfo in WavPack header
+ extraction error paths if previously mapped
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-197
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3863
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+CVE: CVE-2024-47597
+CVE: CVE-2024-47601
+CVE: CVE-2024-47602
+CVE: CVE-2024-47603
+CVE: CVE-2024-47834
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/008f0d52408f57f0704d5639b72db2f330b8f003]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/matroska/matroska-demux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 9b3cf83adb..35e60b7147 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0016-matroskademux-Fix-off-by-one-when-parsing-multi-chan.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0016-matroskademux-Fix-off-by-one-when-parsing-multi-chan.patch
new file mode 100644
index 0000000000..39346ca829
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0016-matroskademux-Fix-off-by-one-when-parsing-multi-chan.patch
@@ -0,0 +1,35 @@
+From b7e1b13af70b7c042f29674f5482b502af82d829 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 16:33:39 +0300
+Subject: [PATCH 2/7] matroskademux: Fix off-by-one when parsing multi-channel
+ WavPack
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+CVE: CVE-2024-47597
+CVE: CVE-2024-47601
+CVE: CVE-2024-47602
+CVE: CVE-2024-47603
+CVE: CVE-2024-47834
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/b7e1b13af70b7c042f29674f5482b502af82d829]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/matroska/matroska-demux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 35e60b7147..583fbbe6e6 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0017-matroskademux-Check-for-big-enough-WavPack-codec-pri.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0017-matroskademux-Check-for-big-enough-WavPack-codec-pri.patch
new file mode 100644
index 0000000000..af1e9bf6d7
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0017-matroskademux-Check-for-big-enough-WavPack-codec-pri.patch
@@ -0,0 +1,43 @@
+From 455393ef0f2bb0a49c5bf32ef208af914c44e806 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 18:25:53 +0300
+Subject: [PATCH 3/7] matroskademux: Check for big enough WavPack codec private
+ data before accessing it
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-250
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3866
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+CVE: CVE-2024-47597
+CVE: CVE-2024-47601
+CVE: CVE-2024-47602
+CVE: CVE-2024-47603
+CVE: CVE-2024-47834
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/455393ef0f2bb0a49c5bf32ef208af914c44e806]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/matroska/matroska-demux.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 583fbbe6e6..91e66fefc3 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0018-matroskademux-Don-t-take-data-out-of-an-empty-adapte.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0018-matroskademux-Don-t-take-data-out-of-an-empty-adapte.patch
new file mode 100644
index 0000000000..aaae3d7abe
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0018-matroskademux-Don-t-take-data-out-of-an-empty-adapte.patch
@@ -0,0 +1,51 @@
+From be0ac3f40949cb951d5f0761f4a3bd597a94947f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 19:04:51 +0300
+Subject: [PATCH 4/7] matroskademux: Don't take data out of an empty adapter
+ when processing WavPack frames
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-249
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3865
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+CVE: CVE-2024-47597
+CVE: CVE-2024-47601
+CVE: CVE-2024-47602
+CVE: CVE-2024-47603
+CVE: CVE-2024-47834
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/be0ac3f40949cb951d5f0761f4a3bd597a94947f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .../gst-plugins-good/gst/matroska/matroska-demux.c    | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 91e66fefc3..98ed51e86a 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0019-matroskademux-Skip-over-laces-directly-when-postproc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0019-matroskademux-Skip-over-laces-directly-when-postproc.patch
new file mode 100644
index 0000000000..7216d7c9d3
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0019-matroskademux-Skip-over-laces-directly-when-postproc.patch
@@ -0,0 +1,52 @@
+From effbbfd771487cc06c79d5a7e447a849884cc6cf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 19:06:03 +0300
+Subject: [PATCH 5/7] matroskademux: Skip over laces directly when
+ postprocessing the frame fails
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
+CVE: CVE-2024-47540
+CVE: CVE-2024-47601
+CVE: CVE-2024-47602
+CVE: CVE-2024-47603
+CVE: CVE-2024-47834
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/effbbfd771487cc06c79d5a7e447a849884cc6cf]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ .../gst-plugins-good/gst/matroska/matroska-demux.c   | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index 98ed51e86a..e0a4405dce 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch
new file mode 100644
index 0000000000..cb5ba69af0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch
@@ -0,0 +1,43 @@
+From ed7b46bac3fa14f95422cc4bb4655d041df51454 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 19:19:42 +0300
+Subject: [PATCH 6/7] matroskademux: Skip over zero-sized Xiph stream headers
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-251
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3867
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8108>
+
+CVE: CVE-2024-47540
+CVE: CVE-2024-47601
+CVE: CVE-2024-47602
+CVE: CVE-2024-47603
+CVE: CVE-2024-47834
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ed7b46bac3fa14f95422cc4bb4655d041df51454]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/matroska/matroska-ids.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/gst/matroska/matroska-ids.c b/gst/matroska/matroska-ids.c
+index f11b7c2ce3..ba645f7306 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch
new file mode 100644
index 0000000000..371eb9da9b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch
@@ -0,0 +1,44 @@
+From 98e4356be7afa869373f96b4e8ca792c5f9707ee Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 9 Oct 2024 11:52:52 -0400
+Subject: [PATCH 7/7] matroskademux: Put a copy of the codec data into the
+ A_MS/ACM caps
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
+CVE: CVE-2024-47540
+CVE: CVE-2024-47601
+CVE: CVE-2024-47602
+CVE: CVE-2024-47603
+CVE: CVE-2024-47834
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/98e4356be7afa869373f96b4e8ca792c5f9707ee]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gst/matroska/matroska-demux.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gst/matroska/matroska-demux.c b/gst/matroska/matroska-demux.c
+index e0a4405dce..80da306731 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index ca26290340..96dd6f7228 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -21,6 +21,13 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch \
            file://0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch \
            file://0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch \
+           file://0015-matroskademux-Only-unmap-GstMapInfo-in-WavPack-heade.patch \
+           file://0016-matroskademux-Fix-off-by-one-when-parsing-multi-chan.patch \
+           file://0017-matroskademux-Check-for-big-enough-WavPack-codec-pri.patch \
+           file://0018-matroskademux-Don-t-take-data-out-of-an-empty-adapte.patch \
+           file://0019-matroskademux-Skip-over-laces-directly-when-postproc.patch \
+           file://0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch \
+           file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.43.0


