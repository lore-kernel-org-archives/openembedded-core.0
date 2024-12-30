Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D56EE7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 17:28:33 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.66250.1735579710692892607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 09:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WkPgHYCf;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241230172828991e3350384878b821-zw8nwe@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241230172828991e3350384878b821
        for <openembedded-core@lists.openembedded.org>;
        Mon, 30 Dec 2024 18:28:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3Ukp/GXtlfbCuq+uUIP37TwQTxf2tJtbFsr5kWuMfRE=;
 b=WkPgHYCfrJtX4yMr6AZHu7eqTYnoBKkvR8w43O4WHyi9FlNDscJwOGFDZiymV6ozBMGpf/
 OTkwQWWCDdQAlKrJRsq1mTtdpKE/qd4xuErniMZDd/e0RqFOXhxV35boupxJE8d7szfiLCrA
 b9uvPlTLH4bAkZFCL+w1mNOnBN40HS5bMhXZTJOJQOFPD4/MkuoDiPXxTZjtS0XI77AJY8N+
 RxiK0WATDt3MygoUBaNAcWFbnWoeCZRgTu8ibsVW14zGT+uh5dPc7E6jN2RHUcVabYBo2C8U
 YR/MAMdGM0o5YMeI9HH0XMgmzlgh4Ope2lUPePwaDt9weVuIqMy8P1ew==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 04/16] gstreamer1.0-plugins-base: patch CVE-2024-47615
Date: Mon, 30 Dec 2024 18:27:11 +0100
Message-Id: <20241230172723.3644270-4-peter.marko@siemens.com>
In-Reply-To: <20241230172723.3644270-1-peter.marko@siemens.com>
References: <20241230172723.3644270-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 17:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209168

From: Peter Marko <peter.marko@siemens.com>

Pick commits from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8038

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...ck-writes-to-GstOggStream.vorbis_mod.patch |  80 +++++++++
 ...w-and-fix-per-format-min_packet_size.patch | 168 ++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |   2 +
 3 files changed, 250 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-vorbis_parse-check-writes-to-GstOggStream.vorbis_mod.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-oggstream-review-and-fix-per-format-min_packet_size.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-vorbis_parse-check-writes-to-GstOggStream.vorbis_mod.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-vorbis_parse-check-writes-to-GstOggStream.vorbis_mod.patch
new file mode 100644
index 00000000000..37d0b463cb9
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0006-vorbis_parse-check-writes-to-GstOggStream.vorbis_mod.patch
@@ -0,0 +1,80 @@
+From 006047a23a4e4c146e40e5dab765bc6318a94744 Mon Sep 17 00:00:00 2001
+From: Mathieu Duponchelle <mathieu@centricular.com>
+Date: Wed, 2 Oct 2024 15:16:30 +0200
+Subject: [PATCH 1/2] vorbis_parse: check writes to
+ GstOggStream.vorbis_mode_sizes
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-117 Fixes gstreamer#3875
+
+Also perform out-of-bounds check for accesses to op->packet
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8038>
+
+CVE: CVE-2024-47615
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/006047a23a4e4c146e40e5dab765bc6318a94744]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/ogg/vorbis_parse.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/ext/ogg/vorbis_parse.c b/ext/ogg/vorbis_parse.c
+index 65ef463808..757c7cd82b 100644
+--- a/ext/ogg/vorbis_parse.c
++++ b/ext/ogg/vorbis_parse.c
+@@ -165,6 +165,10 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+     if (offset == 0) {
+       offset = 8;
+       current_pos -= 1;
++
++      /* have we underrun? */
++      if (current_pos < op->packet)
++        return -1;
+     }
+   }
+ 
+@@ -178,6 +182,10 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+     if (offset == 7)
+       current_pos -= 1;
+ 
++    /* have we underrun? */
++    if (current_pos < op->packet + 5)
++      return -1;
++
+     if (((current_pos[-5] & ~((1 << (offset + 1)) - 1)) != 0)
+         ||
+         current_pos[-4] != 0
+@@ -199,9 +207,18 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+   /* Give ourselves a chance to recover if we went back too far by using
+    * the size check. */
+   for (ii = 0; ii < 2; ii++) {
++
+     if (offset > 4) {
++      /* have we underrun? */
++      if (current_pos < op->packet)
++        return -1;
++
+       size_check = (current_pos[0] >> (offset - 5)) & 0x3F;
+     } else {
++      /* have we underrun? */
++      if (current_pos < op->packet + 1)
++        return -1;
++
+       /* mask part of byte from current_pos */
+       size_check = (current_pos[0] & ((1 << (offset + 1)) - 1));
+       /* shift to appropriate position */
+@@ -233,6 +250,10 @@ gst_parse_vorbis_setup_packet (GstOggStream * pad, ogg_packet * op)
+ 
+   mode_size_ptr = pad->vorbis_mode_sizes;
+ 
++  if (size > G_N_ELEMENTS (pad->vorbis_mode_sizes)) {
++    return -1;
++  }
++
+   for (i = 0; i < size; i++) {
+     offset = (offset + 1) % 8;
+     if (offset == 0)
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-oggstream-review-and-fix-per-format-min_packet_size.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-oggstream-review-and-fix-per-format-min_packet_size.patch
new file mode 100644
index 00000000000..b469049a94b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0007-oggstream-review-and-fix-per-format-min_packet_size.patch
@@ -0,0 +1,168 @@
+From e633ec642825466b91fc12da6629c307906fa206 Mon Sep 17 00:00:00 2001
+From: Mathieu Duponchelle <mathieu@centricular.com>
+Date: Wed, 2 Oct 2024 16:52:51 +0200
+Subject: [PATCH 2/2] oggstream: review and fix per-format min_packet_size
+
+This addresses all manually detected invalid reads in setup functions.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8038>
+
+CVE: CVE-2024-47615
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/e633ec642825466b91fc12da6629c307906fa206]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/ogg/gstoggstream.c | 40 ++++++++++++----------------------------
+ 1 file changed, 12 insertions(+), 28 deletions(-)
+
+diff --git a/ext/ogg/gstoggstream.c b/ext/ogg/gstoggstream.c
+index a8883304a5..ab6be238dc 100644
+--- a/ext/ogg/gstoggstream.c
++++ b/ext/ogg/gstoggstream.c
+@@ -665,11 +665,6 @@ setup_vp8_mapper (GstOggStream * pad, ogg_packet * packet)
+ {
+   gint width, height, par_n, par_d, fps_n, fps_d;
+ 
+-  if (packet->bytes < 26) {
+-    GST_DEBUG ("Failed to parse VP8 BOS page");
+-    return FALSE;
+-  }
+-
+   width = GST_READ_UINT16_BE (packet->packet + 8);
+   height = GST_READ_UINT16_BE (packet->packet + 10);
+   par_n = GST_READ_UINT24_BE (packet->packet + 12);
+@@ -1221,11 +1216,6 @@ setup_fishead_mapper (GstOggStream * pad, ogg_packet * packet)
+   gint64 prestime_n, prestime_d;
+   gint64 basetime_n, basetime_d;
+ 
+-  if (packet->bytes < 44) {
+-    GST_DEBUG ("Not enough data for fishead header");
+-    return FALSE;
+-  }
+-
+   data = packet->packet;
+ 
+   data += 8;                    /* header */
+@@ -1256,8 +1246,8 @@ setup_fishead_mapper (GstOggStream * pad, ogg_packet * packet)
+     pad->prestime = -1;
+ 
+   /* Ogg Skeleton 3.3+ streams provide additional information in the header */
+-  if (packet->bytes >= SKELETON_FISHEAD_3_3_MIN_SIZE && pad->skeleton_major == 3
+-      && pad->skeleton_minor > 0) {
++  if (packet->bytes - 44 >= SKELETON_FISHEAD_3_3_MIN_SIZE
++      && pad->skeleton_major == 3 && pad->skeleton_minor > 0) {
+     gint64 firstsampletime_n, firstsampletime_d;
+     gint64 lastsampletime_n, lastsampletime_d;
+     gint64 firstsampletime, lastsampletime;
+@@ -1296,7 +1286,7 @@ setup_fishead_mapper (GstOggStream * pad, ogg_packet * packet)
+ 
+     GST_INFO ("skeleton fishead parsed total: %" GST_TIME_FORMAT,
+         GST_TIME_ARGS (pad->total_time));
+-  } else if (packet->bytes >= SKELETON_FISHEAD_4_0_MIN_SIZE
++  } else if (packet->bytes - 44 >= SKELETON_FISHEAD_4_0_MIN_SIZE
+       && pad->skeleton_major == 4) {
+     guint64 segment_length, content_offset;
+ 
+@@ -1980,9 +1970,6 @@ setup_kate_mapper (GstOggStream * pad, ogg_packet * packet)
+   guint8 *data = packet->packet;
+   const char *category;
+ 
+-  if (packet->bytes < 64)
+-    return FALSE;
+-
+   pad->granulerate_n = GST_READ_UINT32_LE (data + 24);
+   pad->granulerate_d = GST_READ_UINT32_LE (data + 28);
+   pad->granuleshift = GST_READ_UINT8 (data + 15);
+@@ -2111,9 +2098,6 @@ setup_opus_mapper (GstOggStream * pad, ogg_packet * packet)
+ {
+   GstBuffer *buffer;
+ 
+-  if (packet->bytes < 19)
+-    return FALSE;
+-
+   pad->granulerate_n = 48000;
+   pad->granulerate_d = 1;
+   pad->granuleshift = 0;
+@@ -2394,7 +2378,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "\001vorbis", 7, 22,
++    "\001vorbis", 7, 29,
+     "audio/x-vorbis",
+     setup_vorbis_mapper,
+     NULL,
+@@ -2426,7 +2410,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "PCM     ", 8, 0,
++    "PCM     ", 8, 28,
+     "audio/x-raw",
+     setup_pcm_mapper,
+     NULL,
+@@ -2442,7 +2426,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "CMML\0\0\0\0", 8, 0,
++    "CMML\0\0\0\0", 8, 29,
+     "text/x-cmml",
+     setup_cmml_mapper,
+     NULL,
+@@ -2458,7 +2442,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "Annodex", 7, 0,
++    "Annodex", 7, 44,
+     "application/x-annodex",
+     setup_fishead_mapper,
+     NULL,
+@@ -2537,7 +2521,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "CELT    ", 8, 0,
++    "CELT    ", 8, 60,
+     "audio/x-celt",
+     setup_celt_mapper,
+     NULL,
+@@ -2553,7 +2537,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "\200kate\0\0\0", 8, 0,
++    "\200kate\0\0\0", 8, 64,
+     "text/x-kate",
+     setup_kate_mapper,
+     NULL,
+@@ -2585,7 +2569,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "OVP80\1\1", 7, 4,
++    "OVP80\1\1", 7, 26,
+     "video/x-vp8",
+     setup_vp8_mapper,
+     setup_vp8_mapper_from_caps,
+@@ -2601,7 +2585,7 @@ const GstOggMap mappers[] = {
+     update_stats_vp8
+   },
+   {
+-    "OpusHead", 8, 0,
++    "OpusHead", 8, 19,
+     "audio/x-opus",
+     setup_opus_mapper,
+     NULL,
+@@ -2649,7 +2633,7 @@ const GstOggMap mappers[] = {
+     NULL
+   },
+   {
+-    "\001text\0\0\0", 9, 9,
++    "\001text\0\0\0", 9, 25,
+     "application/x-ogm-text",
+     setup_ogmtext_mapper,
+     NULL,
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index ffae2271541..18837e676dd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -12,6 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch \
            file://0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch \
+           file://0006-vorbis_parse-check-writes-to-GstOggStream.vorbis_mod.patch \
+           file://0007-oggstream-review-and-fix-per-format-min_packet_size.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.30.2


