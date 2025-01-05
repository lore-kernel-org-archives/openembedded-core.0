Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1498E77197
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 05:43:51 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web11.33588.1736055827272301851
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 21:43:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jTvIsznb;
 spf=pass (domain: mvista.com, ip: 209.85.166.54, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-844e55a981dso538458239f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 21:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736055826; x=1736660626; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXVrdzLizW728AzrfCvGBgtLQ8D7vvYl1DpCViwUqW8=;
        b=jTvIsznbNMV6F8rkmjdBTJ4mH1ilCayqja2R+tpQSXiHRAO1zj/0tnL+lETe0pteLg
         5ByRZIKvqMzRDv/VuEFqsv5qtqLVip9GConaEPClukZ5cpp5+iLqUm7SJavI3WqrhB/Y
         D3pNybgluKLnwoxOrd1CoHvVyefKf1XIP4Ftc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736055826; x=1736660626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXVrdzLizW728AzrfCvGBgtLQ8D7vvYl1DpCViwUqW8=;
        b=a2H6jBV4utPDvDCtUBe/tfLu7Yvb6kJh2+NNI1LA4oYH1eFwcmUMU4WVhNV0+irzp3
         x+CLbzrO24ORUAnw+FYpEErfoAiC2Lsm6BMU/yU/vTIVINKGTPWdqmWGSzUNhA26Iog+
         WVGxx2M7beVWRnHKwFdjOUvQRy5XzZBEjHI4tV0ox/bkewe7D1GLmEGUo7Cq96uRIUUI
         XzkaTJzzABspSf9+k8z6sGWlBnQZTQ+FifWnZp4IzSvD8eqqiNXuWLkcpTIfIXgwgbNy
         2jFZcAxPmnLQewoFoIPKjBinqV3nvggb3aWG1M7pBrrXMHdZzl+ZvFgkYZqjjlPHES1b
         BlLQ==
X-Gm-Message-State: AOJu0Ywy7VeWIhiQ139wLAAPscrc+kFkjpHRepedRHxFuD1jXwyMSDb1
	IFuc1sRXTuIWWD7vN1Zi/xqjRngefUYFCZuvUTOijTUQEsnqPDOkfth9oE0TiJPBkx/PlUmyzgv
	jLKs=
X-Gm-Gg: ASbGncvy457ibaatpA/bPaMyOOedsOA5Iu/MJ7XohcMWFpYsAQUgYh9d3gdodK8MJRi
	9mIotqvc/3dfTlpvpOpePcXp5XHMVmRABhgRF33qqaOPwdRmIsms+IShRSidO3U9dZ/05GvtJs6
	CJ/VrkuRTOKi7QBoIK1LElcOdcGyc8KefDXsWpQ2bsfuYxMudhc2hkNKLoFl3rJnJYAtTtiGk+p
	ptaxaPGgQX1EK2AHhTl4tB860xbD/0hFWvjZH046wRL6v8D3VxK+idnCYEE2YtL0yoT0Mc=
X-Google-Smtp-Source: AGHT+IGffZT7WZPzAfxuRYhvIyzvYQx4k1psWsLPx18LnIESsy+wvtaZq7k3FCbJBaVosMuXv8aPyg==
X-Received: by 2002:a05:6602:2dcf:b0:83a:b7c8:a3dc with SMTP id ca18e2360f4ac-8499e4ee01cmr4508026239f.1.1736055825418;
        Sat, 04 Jan 2025 21:43:45 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:3521:fa4f:fd77:a73f:8749])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66ed9sm8570467173.45.2025.01.04.21.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 21:43:43 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 3/9] gstreamer1.0-plugins-good: fix several CVE's
Date: Sun,  5 Jan 2025 11:13:12 +0530
Message-Id: <20250105054318.222154-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250105054318.222154-1-vanusuri@mvista.com>
References: <20250105054318.222154-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 05:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209408

From: Vijay Anusuri <vanusuri@mvista.com>

Fixes for below CVEs:
CVE-2024-47537
CVE-2024-47539
CVE-2024-47543
CVE-2024-47544
CVE-2024-47545
CVE-2024-47546
CVE-2024-47596
CVE-2024-47597
CVE-2024-47598

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8059

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...7544_47545_47546_47596_47597_47598-1.patch |  64 +++
 ...544_47545_47546_47596_47597_47598-10.patch |  97 ++++
 ...544_47545_47546_47596_47597_47598-11.patch |  36 ++
 ...544_47545_47546_47596_47597_47598-12.patch |  37 ++
 ...7544_47545_47546_47596_47597_47598-2.patch |  73 +++
 ...7544_47545_47546_47596_47597_47598-3.patch |  36 ++
 ...7544_47545_47546_47596_47597_47598-4.patch |  63 +++
 ...7544_47545_47546_47596_47597_47598-5.patch |  44 ++
 ...7544_47545_47546_47596_47597_47598-6.patch | 120 +++++
 ...7544_47545_47546_47596_47597_47598-7.patch | 449 ++++++++++++++++++
 ...7544_47545_47546_47596_47597_47598-8.patch |  56 +++
 ...7544_47545_47546_47596_47597_47598-9.patch |  49 ++
 ...4_47545_47546_47596_47597_47598-pre1.patch | 127 +++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  13 +
 14 files changed, 1264 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-1.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-10.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-3.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-4.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-5.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-6.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-7.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-8.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-9.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-pre1.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-1.patch
new file mode 100644
index 0000000000..ded7e1b1c5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-1.patch
@@ -0,0 +1,64 @@
+From c3a2af94c652513ac1b1858295688ac88c5cc737 Mon Sep 17 00:00:00 2001
+From: Antonio Morales <antonio-morales@github.com>
+Date: Thu, 26 Sep 2024 18:39:37 +0300
+Subject: [PATCH] qtdemux: Fix integer overflow when allocating the samples
+ table for fragmented MP4
+
+This can lead to out of bounds writes and NULL pointer dereferences.
+
+Fixes GHSL-2024-094, GHSL-2024-237, GHSL-2024-241
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3839
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c3a2af94c652513ac1b1858295688ac88c5cc737]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
+CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index de8fae8b02ee..2fb5b2b014db 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -3364,6 +3364,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteReader * trun,
+   gint i;
+   guint8 *data;
+   guint entry_size, dur_offset, size_offset, flags_offset = 0, ct_offset = 0;
++  guint new_n_samples;
+   QtDemuxSample *sample;
+   gboolean ismv = FALSE;
+   gint64 initial_offset;
+@@ -3475,14 +3476,13 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteReader * trun,
+     goto fail;
+   data = (guint8 *) gst_byte_reader_peek_data_unchecked (trun);
+ 
+-  if (stream->n_samples + samples_count >=
+-      QTDEMUX_MAX_SAMPLE_INDEX_SIZE / sizeof (QtDemuxSample))
++  if (!g_uint_checked_add (&new_n_samples, stream->n_samples, samples_count) ||
++      new_n_samples >= QTDEMUX_MAX_SAMPLE_INDEX_SIZE / sizeof (QtDemuxSample))
+     goto index_too_big;
+ 
+   GST_DEBUG_OBJECT (qtdemux, "allocating n_samples %u * %u (%.2f MB)",
+-      stream->n_samples + samples_count, (guint) sizeof (QtDemuxSample),
+-      (stream->n_samples + samples_count) *
+-      sizeof (QtDemuxSample) / (1024.0 * 1024.0));
++      new_n_samples, (guint) sizeof (QtDemuxSample),
++      (new_n_samples) * sizeof (QtDemuxSample) / (1024.0 * 1024.0));
+ 
+   /* create a new array of samples if it's the first sample parsed */
+   if (stream->n_samples == 0) {
+@@ -3491,7 +3491,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteReader * trun,
+     /* or try to reallocate it with space enough to insert the new samples */
+   } else
+     stream->samples = g_try_renew (QtDemuxSample, stream->samples,
+-        stream->n_samples + samples_count);
++        new_n_samples);
+   if (stream->samples == NULL)
+     goto out_of_memory;
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-10.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-10.patch
new file mode 100644
index 0000000000..c864deb635
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-10.patch
@@ -0,0 +1,97 @@
+From ed254790331a3fba2f68255a8f072552d622aac1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 27 Sep 2024 10:39:30 +0300
+Subject: [PATCH] qtdemux: Actually handle errors returns from various
+ functions instead of ignoring them
+
+Ignoring them might cause the element to continue as if all is fine despite the
+internal state being inconsistent. This can lead to all kinds of follow-up
+issues, including memory safety issues.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-245
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3847
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ed254790331a3fba2f68255a8f072552d622aac1]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/isomp4/qtdemux.c     | 29 +++++++++++++++----
+ 1 file changed, 23 insertions(+), 6 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 5277952c5ea5..1de70f184f50 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -4853,10 +4853,15 @@ gst_qtdemux_loop_state_header (GstQTDemux * qtdemux)
+ beach:
+   if (ret == GST_FLOW_EOS && (qtdemux->got_moov || qtdemux->media_caps)) {
+     /* digested all data, show what we have */
+-    qtdemux_prepare_streams (qtdemux);
++    ret = qtdemux_prepare_streams (qtdemux);
++    if (ret != GST_FLOW_OK)
++      return ret;
++
+     QTDEMUX_EXPOSE_LOCK (qtdemux);
+     ret = qtdemux_expose_streams (qtdemux);
+     QTDEMUX_EXPOSE_UNLOCK (qtdemux);
++    if (ret != GST_FLOW_OK)
++      return ret;
+ 
+     qtdemux->state = QTDEMUX_STATE_MOVIE;
+     GST_DEBUG_OBJECT (qtdemux, "switching state to STATE_MOVIE (%d)",
+@@ -7552,13 +7557,21 @@ gst_qtdemux_process_adapter (GstQTDemux * demux, gboolean force)
+             gst_qtdemux_stream_concat (demux,
+                 demux->old_streams, demux->active_streams);
+ 
+-            qtdemux_parse_moov (demux, data, demux->neededbytes);
++            if (!qtdemux_parse_moov (demux, data, demux->neededbytes)) {
++              ret = GST_FLOW_ERROR;
++              break;
++            }
+             qtdemux_node_dump (demux, demux->moov_node);
+             qtdemux_parse_tree (demux);
+-            qtdemux_prepare_streams (demux);
++            ret = qtdemux_prepare_streams (demux);
++            if (ret != GST_FLOW_OK)
++              break;
++
+             QTDEMUX_EXPOSE_LOCK (demux);
+-            qtdemux_expose_streams (demux);
++            ret = qtdemux_expose_streams (demux);
+             QTDEMUX_EXPOSE_UNLOCK (demux);
++            if (ret != GST_FLOW_OK)
++              break;
+ 
+             demux->got_moov = TRUE;
+ 
+@@ -7649,8 +7662,10 @@ gst_qtdemux_process_adapter (GstQTDemux * demux, gboolean force)
+             /* in MSS we need to expose the pads after the first moof as we won't get a moov */
+             if (demux->variant == VARIANT_MSS_FRAGMENTED && !demux->exposed) {
+               QTDEMUX_EXPOSE_LOCK (demux);
+-              qtdemux_expose_streams (demux);
++              ret = qtdemux_expose_streams (demux);
+               QTDEMUX_EXPOSE_UNLOCK (demux);
++              if (ret != GST_FLOW_OK)
++                goto done;
+             }
+ 
+             gst_qtdemux_check_send_pending_segment (demux);
+@@ -13764,8 +13779,10 @@ qtdemux_prepare_streams (GstQTDemux * qtdemux)
+ 
+     /* parse the initial sample for use in setting the frame rate cap */
+     while (sample_num == 0 && sample_num < stream->n_samples) {
+-      if (!qtdemux_parse_samples (qtdemux, stream, sample_num))
++      if (!qtdemux_parse_samples (qtdemux, stream, sample_num)) {
++        ret = GST_FLOW_ERROR;
+         break;
++      }
+       ++sample_num;
+     }
+   }
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch
new file mode 100644
index 0000000000..7096a75a71
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch
@@ -0,0 +1,36 @@
+From 3153fda823cb91b1031dae69738c6c5d526fb6e1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 19:16:19 +0300
+Subject: [PATCH] qtdemux: Check for invalid atom length when extracting Closed
+ Caption data
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-243
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3849
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3153fda823cb91b1031dae69738c6c5d526fb6e1]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 1de70f184f50..8850d09321e8 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -5827,7 +5827,7 @@ extract_cc_from_data (QtDemuxStream * stream, const guint8 * data, gsize size,
+     goto invalid_cdat;
+   atom_length = QT_UINT32 (data);
+   fourcc = QT_FOURCC (data + 4);
+-  if (G_UNLIKELY (atom_length > size || atom_length == 8))
++  if (G_UNLIKELY (atom_length > size || atom_length <= 8))
+     goto invalid_cdat;
+ 
+   GST_DEBUG_OBJECT (stream->pad, "here");
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch
new file mode 100644
index 0000000000..b379c2f88c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch
@@ -0,0 +1,37 @@
+From 3ce1b812a9531611288af286b5dc6631a11e3f4a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 27 Sep 2024 00:31:36 +0300
+Subject: [PATCH] qtdemux: Add size check for parsing SMI / SEQH atom
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-244
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3853
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3ce1b812a9531611288af286b5dc6631a11e3f4a]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 8850d09321e8..dc70287a8a9b 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -10633,8 +10633,9 @@ qtdemux_parse_svq3_stsd_data (GstQTDemux * qtdemux,
+                 GST_WARNING_OBJECT (qtdemux, "Unexpected second SEQH SMI atom "
+                     " found, ignoring");
+               } else {
++                /* Note: The size does *not* include the fourcc and the size field itself */
+                 seqh_size = QT_UINT32 (data + 4);
+-                if (seqh_size > 0) {
++                if (seqh_size > 0 && seqh_size <= size - 8) {
+                   _seqh = gst_buffer_new_and_alloc (seqh_size);
+                   gst_buffer_fill (_seqh, 0, data + 8, seqh_size);
+                 }
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-2.patch
new file mode 100644
index 0000000000..8c17c548df
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-2.patch
@@ -0,0 +1,73 @@
+From 812f175c580a2e702581859fd481c8f51d633508 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 18:40:56 +0300
+Subject: [PATCH] qtdemux: Fix debug output during trun parsing
+
+Various integers are unsigned so print them as such. Also print the actual
+allocation size if allocation fails, not only parts of it.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/812f175c580a2e702581859fd481c8f51d633508]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gst/isomp4/qtdemux.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
+index e012ce1..0111912 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -3228,8 +3228,8 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteReader * trun,
+   gint64 initial_offset;
+   gint32 min_ct = 0;
+ 
+-  GST_LOG_OBJECT (qtdemux, "parsing trun track-id %d; "
+-      "default dur %d, size %d, flags 0x%x, base offset %" G_GINT64_FORMAT ", "
++  GST_LOG_OBJECT (qtdemux, "parsing trun track-id %u; "
++      "default dur %u, size %u, flags 0x%x, base offset %" G_GINT64_FORMAT ", "
+       "decode ts %" G_GINT64_FORMAT, stream->track_id, d_sample_duration,
+       d_sample_size, d_sample_flags, *base_offset, decode_ts);
+ 
+@@ -3257,7 +3257,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteReader * trun,
+     /* note this is really signed */
+     if (!gst_byte_reader_get_int32_be (trun, &data_offset))
+       goto fail;
+-    GST_LOG_OBJECT (qtdemux, "trun data offset %d", data_offset);
++    GST_LOG_OBJECT (qtdemux, "trun data offset %u", data_offset);
+     /* default base offset = first byte of moof */
+     if (*base_offset == -1) {
+       GST_LOG_OBJECT (qtdemux, "base_offset at moof");
+@@ -3279,7 +3279,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteReader * trun,
+ 
+   GST_LOG_OBJECT (qtdemux, "running offset now %" G_GINT64_FORMAT,
+       *running_offset);
+-  GST_LOG_OBJECT (qtdemux, "trun offset %d, flags 0x%x, entries %d",
++  GST_LOG_OBJECT (qtdemux, "trun offset %u, flags 0x%x, entries %u",
+       data_offset, flags, samples_count);
+ 
+   if (flags & TR_FIRST_SAMPLE_FLAGS) {
+@@ -3499,14 +3499,15 @@ fail:
+   }
+ out_of_memory:
+   {
+-    GST_WARNING_OBJECT (qtdemux, "failed to allocate %d samples",
+-        stream->n_samples);
++    GST_WARNING_OBJECT (qtdemux, "failed to allocate %u + %u samples",
++        stream->n_samples, samples_count);
+     return FALSE;
+   }
+ index_too_big:
+   {
+-    GST_WARNING_OBJECT (qtdemux, "not allocating index of %d samples, would "
+-        "be larger than %uMB (broken file?)", stream->n_samples,
++    GST_WARNING_OBJECT (qtdemux,
++	"not allocating index of %u + %u samples, would "
++        "be larger than %uMB (broken file?)", stream->n_samples, samples_count,
+         QTDEMUX_MAX_SAMPLE_INDEX_SIZE >> 20);
+     return FALSE;
+   }
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-3.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-3.patch
new file mode 100644
index 0000000000..217387a4cd
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-3.patch
@@ -0,0 +1,36 @@
+From eb7f9331c2294bc28a549b79c9f931c3e6c6bc44 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 18:41:39 +0300
+Subject: [PATCH] qtdemux: Don't iterate over all trun entries if none of the
+ flags are set
+
+Nothing would be printed anyway.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/eb7f9331c2294bc28a549b79c9f931c3e6c6bc44]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c
+index 22da35e9e7ad..297b580ef038 100644
+--- a/gst/isomp4/qtdemux_dump.c
++++ b/gst/isomp4/qtdemux_dump.c
+@@ -836,6 +836,11 @@ qtdemux_dump_trun (GstQTDemux * qtdemux, GstByteReader * data, int depth)
+     GST_LOG ("%*s    first-sample-flags: %u", depth, "", first_sample_flags);
+   }
+ 
++  /* Nothing to print below */
++  if ((flags & (TR_SAMPLE_DURATION | TR_SAMPLE_SIZE | TR_SAMPLE_FLAGS |
++              TR_COMPOSITION_TIME_OFFSETS)) == 0)
++    return TRUE;
++
+   for (i = 0; i < samples_count; i++) {
+     if (flags & TR_SAMPLE_DURATION) {
+       if (!gst_byte_reader_get_uint32_be (data, &sample_duration))
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-4.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-4.patch
new file mode 100644
index 0000000000..8b5bddbf5b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-4.patch
@@ -0,0 +1,63 @@
+From 1def2965d8da8cc74ab0036d7f8d59e81e676cad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 27 Sep 2024 15:50:54 +0300
+Subject: [PATCH] qtdemux: Check sizes of stsc/stco/stts before trying to merge
+ entries
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-246
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3854
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1def2965d8da8cc74ab0036d7f8d59e81e676cad]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/isomp4/qtdemux.c     | 22 +++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 0996292d0789..c14d939ee3c9 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -10033,6 +10033,21 @@ qtdemux_merge_sample_table (GstQTDemux * qtdemux, QtDemuxStream * stream)
+     return;
+   }
+ 
++  if (gst_byte_reader_get_remaining (&stream->stts) < 8) {
++    GST_DEBUG_OBJECT (qtdemux, "Too small stts");
++    return;
++  }
++
++  if (stream->stco.size < 8) {
++    GST_DEBUG_OBJECT (qtdemux, "Too small stco");
++    return;
++  }
++
++  if (stream->n_samples_per_chunk == 0) {
++    GST_DEBUG_OBJECT (qtdemux, "No samples per chunk");
++    return;
++  }
++
+   /* Parse the stts to get the sample duration and number of samples */
+   gst_byte_reader_skip_unchecked (&stream->stts, 4);
+   stts_duration = gst_byte_reader_get_uint32_be_unchecked (&stream->stts);
+@@ -10044,6 +10059,13 @@ qtdemux_merge_sample_table (GstQTDemux * qtdemux, QtDemuxStream * stream)
+   GST_DEBUG_OBJECT (qtdemux, "sample_duration %d, num_chunks %u", stts_duration,
+       num_chunks);
+ 
++  if (gst_byte_reader_get_remaining (&stream->stsc) <
++      stream->n_samples_per_chunk * 3 * 4 +
++      (stream->n_samples_per_chunk - 1) * 4) {
++    GST_DEBUG_OBJECT (qtdemux, "Too small stsc");
++    return;
++  }
++
+   /* Now parse stsc, convert chunks into single samples and generate a
+    * new stsc, stts and stsz from this information */
+   gst_byte_writer_init (&stsc);
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-5.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-5.patch
new file mode 100644
index 0000000000..02d9cb278c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-5.patch
@@ -0,0 +1,44 @@
+From 314945426c7105ad90f44a188037bc43bb3b0300 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 09:20:28 +0300
+Subject: [PATCH] qtdemux: Make sure only an even number of bytes is processed
+ when handling CEA608 data
+
+An odd number of bytes would lead to out of bound reads and writes, and doesn't
+make any sense as CEA608 comes in byte pairs.
+
+Strip off any leftover bytes and assume everything before that is valid.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-195
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3841
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/314945426c7105ad90f44a188037bc43bb3b0300]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index c14d939ee3c9..b9f466991adf 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -6145,6 +6145,11 @@ convert_to_s334_1a (const guint8 * ccpair, guint8 ccpair_size, guint field,
+   guint8 *storage;
+   gsize i;
+ 
++  /* Strip off any leftover odd bytes and assume everything before is valid */
++  if (ccpair_size % 2 != 0) {
++    ccpair_size -= 1;
++  }
++
+   /* We are converting from pairs to triplets */
+   *res = ccpair_size / 2 * 3;
+   storage = g_malloc (*res);
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-6.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-6.patch
new file mode 100644
index 0000000000..5ff18baa7e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-6.patch
@@ -0,0 +1,120 @@
+From 8ef08a7a41da987aa630082df355ea651aa09132 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 14:17:02 +0300
+Subject: [PATCH] qtdemux: Make sure enough data is available before reading
+ wave header node
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-236
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3843
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/8ef08a7a41da987aa630082df355ea651aa09132]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/isomp4/qtdemux.c     | 84 ++++++++++---------
+ 1 file changed, 45 insertions(+), 39 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index b9f466991adf..55ba59152c7a 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -13697,47 +13697,53 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+         } else {
+           guint32 datalen = QT_UINT32 (stsd_entry_data + offset + 16);
+           const guint8 *data = stsd_entry_data + offset + 16;
+-          GNode *wavenode;
+-          GNode *waveheadernode;
+-
+-          wavenode = g_node_new ((guint8 *) data);
+-          if (qtdemux_parse_node (qtdemux, wavenode, data, datalen)) {
+-            const guint8 *waveheader;
+-            guint32 headerlen;
+-
+-            waveheadernode = qtdemux_tree_get_child_by_type (wavenode, fourcc);
+-            if (waveheadernode) {
+-              waveheader = (const guint8 *) waveheadernode->data;
+-              headerlen = QT_UINT32 (waveheader);
+-
+-              if (headerlen > 8) {
+-                gst_riff_strf_auds *header = NULL;
+-                GstBuffer *headerbuf;
+-                GstBuffer *extra;
+-
+-                waveheader += 8;
+-                headerlen -= 8;
+-
+-                headerbuf = gst_buffer_new_and_alloc (headerlen);
+-                gst_buffer_fill (headerbuf, 0, waveheader, headerlen);
+-
+-                if (gst_riff_parse_strf_auds (GST_ELEMENT_CAST (qtdemux),
+-                        headerbuf, &header, &extra)) {
+-                  gst_caps_unref (entry->caps);
+-                  /* FIXME: Need to do something with the channel reorder map */
+-                  entry->caps =
+-                      gst_riff_create_audio_caps (header->format, NULL, header,
+-                      extra, NULL, NULL, NULL);
+-
+-                  if (extra)
+-                    gst_buffer_unref (extra);
+-                  g_free (header);
++
++          if (len < datalen || len - datalen < offset + 16) {
++            GST_WARNING_OBJECT (qtdemux, "Not enough data for waveheadernode");
++          } else {
++            GNode *wavenode;
++            GNode *waveheadernode;
++
++            wavenode = g_node_new ((guint8 *) data);
++            if (qtdemux_parse_node (qtdemux, wavenode, data, datalen)) {
++              const guint8 *waveheader;
++              guint32 headerlen;
++
++              waveheadernode =
++                  qtdemux_tree_get_child_by_type (wavenode, fourcc);
++              if (waveheadernode) {
++                waveheader = (const guint8 *) waveheadernode->data;
++                headerlen = QT_UINT32 (waveheader);
++
++                if (headerlen > 8) {
++                  gst_riff_strf_auds *header = NULL;
++                  GstBuffer *headerbuf;
++                  GstBuffer *extra;
++
++                  waveheader += 8;
++                  headerlen -= 8;
++
++                  headerbuf = gst_buffer_new_and_alloc (headerlen);
++                  gst_buffer_fill (headerbuf, 0, waveheader, headerlen);
++
++                  if (gst_riff_parse_strf_auds (GST_ELEMENT_CAST (qtdemux),
++                          headerbuf, &header, &extra)) {
++                    gst_caps_unref (entry->caps);
++                    /* FIXME: Need to do something with the channel reorder map */
++                    entry->caps =
++                        gst_riff_create_audio_caps (header->format, NULL,
++                        header, extra, NULL, NULL, NULL);
++
++                    if (extra)
++                      gst_buffer_unref (extra);
++                    g_free (header);
++                  }
+                 }
+-              }
+-            } else
+-              GST_DEBUG ("Didn't find waveheadernode for this codec");
++              } else
++                GST_DEBUG ("Didn't find waveheadernode for this codec");
++            }
++            g_node_destroy (wavenode);
+           }
+-          g_node_destroy (wavenode);
+         }
+       } else if (esds) {
+         gst_qtdemux_handle_esds (qtdemux, stream, entry, esds,
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-7.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-7.patch
new file mode 100644
index 0000000000..41cf4c7d00
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-7.patch
@@ -0,0 +1,449 @@
+From fe9d5d37234aca04fef7248184177168905a7a69 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 27 Sep 2024 00:12:57 +0300
+Subject: [PATCH] qtdemux: Fix length checks and offsets in stsd entry parsing
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-242
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3845
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/fe9d5d37234aca04fef7248184177168905a7a69]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/isomp4/qtdemux.c     | 218 +++++++-----------
+ 1 file changed, 79 insertions(+), 139 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 55ba59152c7a..fb157552eb75 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -12237,43 +12237,35 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+           case FOURCC_avc1:
+           case FOURCC_avc3:
+           {
+-            guint len = QT_UINT32 (stsd_entry_data);
++            guint32 len = QT_UINT32 (stsd_entry_data);
+             len = len <= 0x56 ? 0 : len - 0x56;
+             const guint8 *avc_data = stsd_entry_data + 0x56;
+ 
+             /* find avcC */
+-            while (len >= 0x8) {
+-              guint size;
+-
+-              if (QT_UINT32 (avc_data) <= 0x8)
+-                size = 0;
+-              else if (QT_UINT32 (avc_data) <= len)
+-                size = QT_UINT32 (avc_data) - 0x8;
+-              else
+-                size = len - 0x8;
++            while (len >= 8) {
++              guint32 size = QT_UINT32 (avc_data);
+ 
+-              /* No real data, so skip */
+-              if (size < 1) {
+-                len -= 8;
+-                avc_data += 8;
+-                continue;
+-              }
++              if (size < 8 || size > len)
++                break;
+ 
+-              switch (QT_FOURCC (avc_data + 0x4)) {
++              switch (QT_FOURCC (avc_data + 4)) {
+                 case FOURCC_avcC:
+                 {
+                   /* parse, if found */
+                   GstBuffer *buf;
+ 
++                  if (size < 8 + 1)
++                    break;
++
+                   GST_DEBUG_OBJECT (qtdemux, "found avcC codec_data in stsd");
+ 
+                   /* First 4 bytes are the length of the atom, the next 4 bytes
+                    * are the fourcc, the next 1 byte is the version, and the
+                    * subsequent bytes are profile_tier_level structure like data. */
+                   gst_codec_utils_h264_caps_set_level_and_profile (entry->caps,
+-                      avc_data + 8 + 1, size - 1);
+-                  buf = gst_buffer_new_and_alloc (size);
+-                  gst_buffer_fill (buf, 0, avc_data + 0x8, size);
++                      avc_data + 8 + 1, size - 8 - 1);
++                  buf = gst_buffer_new_and_alloc (size - 8);
++                  gst_buffer_fill (buf, 0, avc_data + 8, size - 8);
+                   gst_caps_set_simple (entry->caps,
+                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
+                   gst_buffer_unref (buf);
+@@ -12284,6 +12276,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                 {
+                   GstBuffer *buf;
+ 
++                  if (size < 8 + 40 + 1)
++                    break;
++
+                   GST_DEBUG_OBJECT (qtdemux, "found strf codec_data in stsd");
+ 
+                   /* First 4 bytes are the length of the atom, the next 4 bytes
+@@ -12291,17 +12286,14 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                    * next 1 byte is the version, and the
+                    * subsequent bytes are sequence parameter set like data. */
+ 
+-                  size -= 40;   /* we'll be skipping BITMAPINFOHEADER */
+-                  if (size > 1) {
+-                    gst_codec_utils_h264_caps_set_level_and_profile
+-                        (entry->caps, avc_data + 8 + 40 + 1, size - 1);
++                  gst_codec_utils_h264_caps_set_level_and_profile
++                      (entry->caps, avc_data + 8 + 40 + 1, size - 8 - 40 - 1);
+ 
+-                    buf = gst_buffer_new_and_alloc (size);
+-                    gst_buffer_fill (buf, 0, avc_data + 8 + 40, size);
+-                    gst_caps_set_simple (entry->caps,
+-                        "codec_data", GST_TYPE_BUFFER, buf, NULL);
+-                    gst_buffer_unref (buf);
+-                  }
++                  buf = gst_buffer_new_and_alloc (size - 8 - 40);
++                  gst_buffer_fill (buf, 0, avc_data + 8 + 40, size - 8 - 40);
++                  gst_caps_set_simple (entry->caps,
++                      "codec_data", GST_TYPE_BUFFER, buf, NULL);
++                  gst_buffer_unref (buf);
+                   break;
+                 }
+                 case FOURCC_btrt:
+@@ -12309,11 +12301,11 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                   guint avg_bitrate, max_bitrate;
+ 
+                   /* bufferSizeDB, maxBitrate and avgBitrate - 4 bytes each */
+-                  if (size < 12)
++                  if (size < 8 + 12)
+                     break;
+ 
+-                  max_bitrate = QT_UINT32 (avc_data + 0xc);
+-                  avg_bitrate = QT_UINT32 (avc_data + 0x10);
++                  max_bitrate = QT_UINT32 (avc_data + 8 + 4);
++                  avg_bitrate = QT_UINT32 (avc_data + 8 + 8);
+ 
+                   if (!max_bitrate && !avg_bitrate)
+                     break;
+@@ -12345,8 +12337,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                   break;
+               }
+ 
+-              len -= size + 8;
+-              avc_data += size + 8;
++              len -= size;
++              avc_data += size;
+             }
+ 
+             break;
+@@ -12357,44 +12349,36 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+           case FOURCC_dvh1:
+           case FOURCC_dvhe:
+           {
+-            guint len = QT_UINT32 (stsd_entry_data);
++            guint32 len = QT_UINT32 (stsd_entry_data);
+             len = len <= 0x56 ? 0 : len - 0x56;
+             const guint8 *hevc_data = stsd_entry_data + 0x56;
+ 
+             /* find hevc */
+-            while (len >= 0x8) {
+-              guint size;
+-
+-              if (QT_UINT32 (hevc_data) <= 0x8)
+-                size = 0;
+-              else if (QT_UINT32 (hevc_data) <= len)
+-                size = QT_UINT32 (hevc_data) - 0x8;
+-              else
+-                size = len - 0x8;
++            while (len >= 8) {
++              guint32 size = QT_UINT32 (hevc_data);
+ 
+-              /* No real data, so skip */
+-              if (size < 1) {
+-                len -= 8;
+-                hevc_data += 8;
+-                continue;
+-              }
++              if (size < 8 || size > len)
++                break;
+ 
+-              switch (QT_FOURCC (hevc_data + 0x4)) {
++              switch (QT_FOURCC (hevc_data + 4)) {
+                 case FOURCC_hvcC:
+                 {
+                   /* parse, if found */
+                   GstBuffer *buf;
+ 
++                  if (size < 8 + 1)
++                    break;
++
+                   GST_DEBUG_OBJECT (qtdemux, "found hvcC codec_data in stsd");
+ 
+                   /* First 4 bytes are the length of the atom, the next 4 bytes
+                    * are the fourcc, the next 1 byte is the version, and the
+                    * subsequent bytes are sequence parameter set like data. */
+                   gst_codec_utils_h265_caps_set_level_tier_and_profile
+-                      (entry->caps, hevc_data + 8 + 1, size - 1);
++                      (entry->caps, hevc_data + 8 + 1, size - 8 - 1);
+ 
+-                  buf = gst_buffer_new_and_alloc (size);
+-                  gst_buffer_fill (buf, 0, hevc_data + 0x8, size);
++                  buf = gst_buffer_new_and_alloc (size - 8);
++                  gst_buffer_fill (buf, 0, hevc_data + 8, size - 8);
+                   gst_caps_set_simple (entry->caps,
+                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
+                   gst_buffer_unref (buf);
+@@ -12403,8 +12387,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                 default:
+                   break;
+               }
+-              len -= size + 8;
+-              hevc_data += size + 8;
++              len -= size;
++              hevc_data += size;
+             }
+             break;
+           }
+@@ -12784,36 +12768,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+           }
+           case FOURCC_vc_1:
+           {
+-            guint len = QT_UINT32 (stsd_entry_data);
++            guint32 len = QT_UINT32 (stsd_entry_data);
+             len = len <= 0x56 ? 0 : len - 0x56;
+             const guint8 *vc1_data = stsd_entry_data + 0x56;
+ 
+             /* find dvc1 */
+             while (len >= 8) {
+-              guint size;
+-
+-              if (QT_UINT32 (vc1_data) <= 8)
+-                size = 0;
+-              else if (QT_UINT32 (vc1_data) <= len)
+-                size = QT_UINT32 (vc1_data) - 8;
+-              else
+-                size = len - 8;
++              guint32 size = QT_UINT32 (vc1_data);
+ 
+-              /* No real data, so skip */
+-              if (size < 1) {
+-                len -= 8;
+-                vc1_data += 8;
+-                continue;
+-              }
++              if (size < 8 || size > len)
++                break;
+ 
+-              switch (QT_FOURCC (vc1_data + 0x4)) {
++              switch (QT_FOURCC (vc1_data + 4)) {
+                 case GST_MAKE_FOURCC ('d', 'v', 'c', '1'):
+                 {
+                   GstBuffer *buf;
+ 
+                   GST_DEBUG_OBJECT (qtdemux, "found dvc1 codec_data in stsd");
+-                  buf = gst_buffer_new_and_alloc (size);
+-                  gst_buffer_fill (buf, 0, vc1_data + 8, size);
++                  buf = gst_buffer_new_and_alloc (size - 8);
++                  gst_buffer_fill (buf, 0, vc1_data + 8, size - 8);
+                   gst_caps_set_simple (entry->caps,
+                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
+                   gst_buffer_unref (buf);
+@@ -12822,36 +12795,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                 default:
+                   break;
+               }
+-              len -= size + 8;
+-              vc1_data += size + 8;
++              len -= size;
++              vc1_data += size;
+             }
+             break;
+           }
+           case FOURCC_av01:
+           {
+-            guint len = QT_UINT32 (stsd_entry_data);
++            guint32 len = QT_UINT32 (stsd_entry_data);
+             len = len <= 0x56 ? 0 : len - 0x56;
+             const guint8 *av1_data = stsd_entry_data + 0x56;
+ 
+             /* find av1C */
+-            while (len >= 0x8) {
+-              guint size;
+-
+-              if (QT_UINT32 (av1_data) <= 0x8)
+-                size = 0;
+-              else if (QT_UINT32 (av1_data) <= len)
+-                size = QT_UINT32 (av1_data) - 0x8;
+-              else
+-                size = len - 0x8;
++            while (len >= 8) {
++              guint32 size = QT_UINT32 (av1_data);
+ 
+-              /* No real data, so skip */
+-              if (size < 1) {
+-                len -= 8;
+-                av1_data += 8;
+-                continue;
+-              }
++              if (size < 8 || size > len)
++                break;
+ 
+-              switch (QT_FOURCC (av1_data + 0x4)) {
++              switch (QT_FOURCC (av1_data + 4)) {
+                 case FOURCC_av1C:
+                 {
+                   /* parse, if found */
+@@ -12861,7 +12823,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                       "found av1C codec_data in stsd of size %d", size);
+ 
+                   /* not enough data, just ignore and hope for the best */
+-                  if (size < 4)
++                  if (size < 8 + 4)
+                     break;
+ 
+                   /* Content is:
+@@ -12910,9 +12872,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                             (gint) (pres_delay_field & 0x0F) + 1, NULL);
+                       }
+ 
+-                      buf = gst_buffer_new_and_alloc (size);
++                      buf = gst_buffer_new_and_alloc (size - 8);
+                       GST_BUFFER_FLAG_SET (buf, GST_BUFFER_FLAG_HEADER);
+-                      gst_buffer_fill (buf, 0, av1_data + 8, size);
++                      gst_buffer_fill (buf, 0, av1_data + 8, size - 8);
+                       gst_caps_set_simple (entry->caps,
+                           "codec_data", GST_TYPE_BUFFER, buf, NULL);
+                       gst_buffer_unref (buf);
+@@ -12930,8 +12892,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                   break;
+               }
+ 
+-              len -= size + 8;
+-              av1_data += size + 8;
++              len -= size;
++              av1_data += size;
+             }
+ 
+             break;
+@@ -12942,29 +12904,18 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+              * vp08, vp09, and vp10 fourcc. */
+           case FOURCC_vp09:
+           {
+-            guint len = QT_UINT32 (stsd_entry_data);
++            guint32 len = QT_UINT32 (stsd_entry_data);
+             len = len <= 0x56 ? 0 : len - 0x56;
+             const guint8 *vpcc_data = stsd_entry_data + 0x56;
+ 
+             /* find vpcC */
+-            while (len >= 0x8) {
+-              guint size;
+-
+-              if (QT_UINT32 (vpcc_data) <= 0x8)
+-                size = 0;
+-              else if (QT_UINT32 (vpcc_data) <= len)
+-                size = QT_UINT32 (vpcc_data) - 0x8;
+-              else
+-                size = len - 0x8;
++            while (len >= 8) {
++              guint32 size = QT_UINT32 (vpcc_data);
+ 
+-              /* No real data, so skip */
+-              if (size < 1) {
+-                len -= 8;
+-                vpcc_data += 8;
+-                continue;
+-              }
++              if (size < 8 || size > len)
++                break;
+ 
+-              switch (QT_FOURCC (vpcc_data + 0x4)) {
++              switch (QT_FOURCC (vpcc_data + 4)) {
+                 case FOURCC_vpcC:
+                 {
+                   const gchar *profile_str = NULL;
+@@ -12980,7 +12931,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+ 
+                   /* the meaning of "size" is length of the atom body, excluding
+                    * atom length and fourcc fields */
+-                  if (size < 12)
++                  if (size < 8 + 12)
+                     break;
+ 
+                   /* Content is:
+@@ -13086,8 +13037,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                   break;
+               }
+ 
+-              len -= size + 8;
+-              vpcc_data += size + 8;
++              len -= size;
++              vpcc_data += size;
+             }
+ 
+             break;
+@@ -13428,7 +13379,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+         }
+         case FOURCC_wma_:
+         {
+-          guint len = QT_UINT32 (stsd_entry_data);
++          guint32 len = QT_UINT32 (stsd_entry_data);
+           len = len <= offset ? 0 : len - offset;
+           const guint8 *wfex_data = stsd_entry_data + offset;
+           const gchar *codec_name = NULL;
+@@ -13453,21 +13404,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+ 
+           /* find wfex */
+           while (len >= 8) {
+-            guint size;
++            guint32 size = QT_UINT32 (wfex_data);
+ 
+-            if (QT_UINT32 (wfex_data) <= 0x8)
+-              size = 0;
+-            else if (QT_UINT32 (wfex_data) <= len)
+-              size = QT_UINT32 (wfex_data) - 8;
+-            else
+-              size = len - 8;
+-
+-            /* No real data, so skip */
+-            if (size < 1) {
+-              len -= 8;
+-              wfex_data += 8;
+-              continue;
+-            }
++            if (size < 8 || size > len)
++              break;
+ 
+             switch (QT_FOURCC (wfex_data + 4)) {
+               case GST_MAKE_FOURCC ('w', 'f', 'e', 'x'):
+@@ -13512,12 +13452,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+                     "width", G_TYPE_INT, wfex.wBitsPerSample,
+                     "depth", G_TYPE_INT, wfex.wBitsPerSample, NULL);
+ 
+-                if (size > wfex.cbSize) {
++                if (size > 8 + wfex.cbSize) {
+                   GstBuffer *buf;
+ 
+-                  buf = gst_buffer_new_and_alloc (size - wfex.cbSize);
++                  buf = gst_buffer_new_and_alloc (size - 8 - wfex.cbSize);
+                   gst_buffer_fill (buf, 0, wfex_data + 8 + wfex.cbSize,
+-                      size - wfex.cbSize);
++                      size - 8 - wfex.cbSize);
+                   gst_caps_set_simple (entry->caps,
+                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
+                   gst_buffer_unref (buf);
+@@ -13534,8 +13474,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+               default:
+                 break;
+             }
+-            len -= size + 8;
+-            wfex_data += size + 8;
++            len -= size;
++            wfex_data += size;
+           }
+           break;
+         }
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-8.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-8.patch
new file mode 100644
index 0000000000..a84575199e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-8.patch
@@ -0,0 +1,56 @@
+From da3b4e903ae990193988a873368bdd1865350521 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 27 Sep 2024 09:47:50 +0300
+Subject: [PATCH] qtdemux: Fix error handling when parsing cenc sample groups
+ fails
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-238, GHSL-2024-239, GHSL-2024-240
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3846
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/da3b4e903ae990193988a873368bdd1865350521]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 94ce75b2d42d..e7a79be45b29 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -11404,12 +11404,15 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+       if (stream->subtype != FOURCC_soun) {
+         GST_ERROR_OBJECT (qtdemux,
+             "Unexpeced stsd type 'aavd' outside 'soun' track");
++        goto corrupt_file;
+       } else {
+         /* encrypted audio with sound sample description v0 */
+         GNode *enc = qtdemux_tree_get_child_by_type (stsd, fourcc);
+         stream->protected = TRUE;
+-        if (!qtdemux_parse_protection_aavd (qtdemux, stream, enc, &fourcc))
++        if (!qtdemux_parse_protection_aavd (qtdemux, stream, enc, &fourcc)) {
+           GST_ERROR_OBJECT (qtdemux, "Failed to parse protection scheme info");
++          goto corrupt_file;
++        }
+       }
+     }
+ 
+@@ -11418,8 +11421,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+        * with the same type */
+       GNode *enc = qtdemux_tree_get_child_by_type (stsd, fourcc);
+       stream->protected = TRUE;
+-      if (!qtdemux_parse_protection_scheme_info (qtdemux, stream, enc, &fourcc))
++      if (!qtdemux_parse_protection_scheme_info (qtdemux, stream, enc, &fourcc)) {
+         GST_ERROR_OBJECT (qtdemux, "Failed to parse protection scheme info");
++        goto corrupt_file;
++      }
+     }
+ 
+     if (stream->subtype == FOURCC_vide) {
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-9.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-9.patch
new file mode 100644
index 0000000000..af0d1ed633
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-9.patch
@@ -0,0 +1,49 @@
+From 20503e5dd90e21ef170488b2a8b8529ae8a4cab9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 27 Sep 2024 10:38:50 +0300
+Subject: [PATCH] qtdemux: Make sure there are enough offsets to read when
+ parsing samples
+
+While this specific case is also caught when initializing co_chunk, the error
+is ignored in various places and calling into the function would lead to out of
+bounds reads if the error message doesn't cause the pipeline to be shut down
+fast enough.
+
+To avoid this, no matter what, make sure enough offsets are available when
+parsing them. While this is potentially slower, the same is already done in the
+non-chunks_are_samples case.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-245
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3847
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/20503e5dd90e21ef170488b2a8b8529ae8a4cab9]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index e7a79be45b29..5277952c5ea5 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -10070,9 +10070,9 @@ qtdemux_parse_samples (GstQTDemux * qtdemux, QtDemuxStream * stream, guint32 n)
+           goto done;
+         }
+ 
+-        cur->offset =
+-            qt_atom_parser_get_offset_unchecked (&stream->co_chunk,
+-            stream->co_size);
++        if (!qt_atom_parser_get_offset (&stream->co_chunk,
++                stream->co_size, &cur->offset))
++          goto corrupt_file;
+ 
+         GST_LOG_OBJECT (qtdemux, "Created entry %d with offset "
+             "%" G_GUINT64_FORMAT, j, cur->offset);
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-pre1.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-pre1.patch
new file mode 100644
index 0000000000..8238498d38
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-pre1.patch
@@ -0,0 +1,127 @@
+From d4bab55077c6a77bd80cb12a8b0d28020ef412a9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 24 Sep 2024 09:50:34 +0300
+Subject: [PATCH] qtdemux: Skip zero-sized boxes instead of stopping to look at
+ further boxes
+
+A zero-sized box is not really a problem and can be skipped to look at any
+possibly following ones.
+
+BMD ATEM devices specifically write a zero-sized bmdc box in the sample
+description, followed by the avcC box in case of h264. Previously the avcC box
+would simply not be read at all and the file would be unplayable.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7564>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d4bab55077c6a77bd80cb12a8b0d28020ef412a9]
+CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
+CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597
+CVE-2024-47598 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/gst/isomp4/qtdemux.c     | 54 ++++++++++++-------
+ 1 file changed, 36 insertions(+), 18 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 32df6eeb85c1..5e5c21758058 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -12226,9 +12226,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+               else
+                 size = len - 0x8;
+ 
+-              if (size < 1)
+-                /* No real data, so break out */
+-                break;
++              /* No real data, so skip */
++              if (size < 1) {
++                len -= 8;
++                avc_data += 8;
++                continue;
++              }
+ 
+               switch (QT_FOURCC (avc_data + 0x4)) {
+                 case FOURCC_avcC:
+@@ -12343,9 +12346,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+               else
+                 size = len - 0x8;
+ 
+-              if (size < 1)
+-                /* No real data, so break out */
+-                break;
++              /* No real data, so skip */
++              if (size < 1) {
++                len -= 8;
++                hevc_data += 8;
++                continue;
++              }
+ 
+               switch (QT_FOURCC (hevc_data + 0x4)) {
+                 case FOURCC_hvcC:
+@@ -12767,9 +12773,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+               else
+                 size = len - 8;
+ 
+-              if (size < 1)
+-                /* No real data, so break out */
+-                break;
++              /* No real data, so skip */
++              if (size < 1) {
++                len -= 8;
++                vc1_data += 8;
++                continue;
++              }
+ 
+               switch (QT_FOURCC (vc1_data + 0x4)) {
+                 case GST_MAKE_FOURCC ('d', 'v', 'c', '1'):
+@@ -12809,9 +12818,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+               else
+                 size = len - 0x8;
+ 
+-              if (size < 1)
+-                /* No real data, so break out */
+-                break;
++              /* No real data, so skip */
++              if (size < 1) {
++                len -= 8;
++                av1_data += 8;
++                continue;
++              }
+ 
+               switch (QT_FOURCC (av1_data + 0x4)) {
+                 case FOURCC_av1C:
+@@ -12919,9 +12931,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+               else
+                 size = len - 0x8;
+ 
+-              if (size < 1)
+-                /* No real data, so break out */
+-                break;
++              /* No real data, so skip */
++              if (size < 1) {
++                len -= 8;
++                vpcc_data += 8;
++                continue;
++              }
+ 
+               switch (QT_FOURCC (vpcc_data + 0x4)) {
+                 case FOURCC_vpcC:
+@@ -13421,9 +13436,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode * trak)
+             else
+               size = len - 8;
+ 
+-            if (size < 1)
+-              /* No real data, so break out */
+-              break;
++            /* No real data, so skip */
++            if (size < 1) {
++              len -= 8;
++              wfex_data += 8;
++              continue;
++            }
+ 
+             switch (QT_FOURCC (wfex_data + 4)) {
+               case GST_MAKE_FOURCC ('w', 'f', 'e', 'x'):
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index dfb0c0f342..98cef84081 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -6,6 +6,19 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-pre1.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-1.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-2.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-3.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-4.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-5.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-6.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-7.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-8.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-9.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-10.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-11.patch \
+           file://CVE-2024-47537_47539_47543_47544_47545_47546_47596_47597_47598-12.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.25.1


