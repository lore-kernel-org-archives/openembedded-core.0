Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32427E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:28:43 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.66645.1735579721854698506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=n4XE4ysA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20241230172839d463d9b73db89b903e-lvwxmo@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20241230172839d463d9b73db89b903e
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=t6x5J5ZSx+eT+dYHdg3oJw/Kt6OJaeX0A65KypESYY4=;
 b=n4XE4ysA03Dj3cF7iri2hQRLQEY86l+cm8Nkz3zLmJthgO5wCrFonSfapMxSJ90xgi1BeK
 JU2pc4L32yT2PpJKbqacc4Kh2dd+/b6EB2LAUZ8lJb0Q6gHrxqR+5BvlHfdBmb0m5peEvi73
 AV4avBOBiKuzyCajc8k5EcDQASuJgIlUiKbOt8/JBf3qsfpv3LBEk4WsLaGXC0ADjPUqfE1b
 tyg+suRQZuZ9bgXEdop4J67oZP2n80Y30QuEZi/4cuaUL8+YP4mqivBX5l25MDnWxgHDy/J7
 XnVKIsZrluBBb7EInQAOtCMvF9aTXFqfxZwH7BcZ/P1bhdvOO0uEbJxA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 06/16] gstreamer1.0-plugins-good: patch several CVEs
Date: Mon, 30 Dec 2024 18:27:13 +0100
Message-Id: <20241230172723.3644270-6-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209170

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8057

Signed-off-by: Peter Marko <peter.marko@siemens.com>

fixup! gstreamer1.0-plugins-good: patch CVE-2024-47540 and CVE-2024-47601
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
index 00000000000..354a2e5194a
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
index 00000000000..39346ca829d
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
index 00000000000..af1e9bf6d75
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
index 00000000000..aaae3d7abe7
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
index 00000000000..7216d7c9d3f
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
index 00000000000..cb5ba69af03
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
index 00000000000..371eb9da9bc
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
index ca262903400..96dd6f7228f 100644
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
2.30.2


