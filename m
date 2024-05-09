Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11688C25B10
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.8617.1715256315276812254
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pRGgqqW/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so734821b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256314; x=1715861114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eNcAuUKsAauNvRP+HPTAWmzzo5XeII4cFhGfYB/wlEk=;
        b=pRGgqqW/c6shZ59iF0j0NR34bc8e6bcQZcPgaaGxYwEUwvGaAGyao9647ZylrZuS2+
         LkyiiGGmOlVJ/bvh66Y+/NAoJJiuT5n+Grugj95T50PNyRc521g1tt+RUuTfXu6JKZNf
         gQsWxmidXOC5NGN/4kT42ERebtm0ED+BHOdJmXrM0862KoCNVp+qWTMuyDJmNPsswbr7
         iPKRQhWKKwlvMwWdTyxXzKZ1JRZOKmZK1S9B8wAoLSjmeVxd33mOHcGubmlbMof1xW3d
         cAJZRSMXUkaBe9QbIO/d+ELtjCi2r01X8twKzRMtilKG8ULgBv8B2QuRtTPqZ7Z5xIqb
         OvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256314; x=1715861114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eNcAuUKsAauNvRP+HPTAWmzzo5XeII4cFhGfYB/wlEk=;
        b=vzRb1wTMVnTIa7ZhZr+r2o9jgeaqTinzk4C/brGZHdfNWJU4jKziuTReWRpHGNbw9u
         hqM/DK3Oz/yvGSzn5+UEx6g+ciufi0a+T9qJPU5CrNPvY6Mr3Pg2oTbvToblEg8MGSAc
         e4SHWwNPG4H0gM9Pr9OoeKlKqXXwUYhLf9l/w5B3kMiLh/30VvD6OOYW7X38WiumlNUa
         DBBtc6gr8ac7VLihO/ZkBAkZZVec8oqVogsq3ShgJ59K4TrjOM8rNLnN+cu4BKdp8Gea
         wXuyR7K7bDqz+c5L6Ho9S0bPui7uZKNWhvTDkKgql871UzGjHc7OnZvjBLs9eoMFWpXu
         nDvg==
X-Gm-Message-State: AOJu0YwGL8pd6luAGXPa3qnVR7eCEKee+qY6RvBi+9sU7bQcrS9+oJRk
	artfehI/m4YCZ/YL/c88z44CveYkC6hjwnE/h36WMZEdEBbppuzWoIuDIfJDAkw3VfKdOJBXbIM
	M
X-Google-Smtp-Source: AGHT+IH6mDCfWtm1gUnFNVZSDiKsmNCl8+RmzIpJB7AHOvp0CACdL5v2aUpI0tjdLcINHCI3KBkULA==
X-Received: by 2002:a05:6a21:3a87:b0:1af:ccd9:4b1d with SMTP id adf61e73a8af0-1afccd94b69mr5059933637.22.1715256314379;
        Thu, 09 May 2024 05:05:14 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/23] gstreamer1.0-plugins-bad: fix CVE-2023-44446
Date: Thu,  9 May 2024 05:04:42 -0700
Message-Id: <ebe4a219117ba0c161fefe45c514234384291e23.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199151

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-44446.patch                      | 329 ++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |   1 +
 2 files changed, 330 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44446.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44446.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44446.patch
new file mode 100644
index 0000000000..92fe82d36d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44446.patch
@@ -0,0 +1,329 @@
+From 7dfaa57b6f9b55f17ffe824bd8988bb71ae11353 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 20 Oct 2023 00:09:57 +0300
+Subject: [PATCH] mxfdemux: Store GstMXFDemuxEssenceTrack in their own fixed
+ allocation
+
+Previously they were stored inline inside a GArray, but as references to
+the tracks were stored in various other places although the array could
+still be updated (and reallocated!), this could lead to dangling
+references in various places.
+
+Instead now store them in a GPtrArray in their own allocation so each
+track's memory position stays fixed.
+
+Fixes ZDI-CAN-22299
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3055
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5638>
+
+CVE: CVE-2023-44446
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/7dfaa57b6f9b55f1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst/mxf/mxfdemux.c | 117 ++++++++++++++++++++-------------------------
+ gst/mxf/mxfdemux.h |   2 +-
+ 2 files changed, 52 insertions(+), 67 deletions(-)
+
+diff --git a/gst/mxf/mxfdemux.c b/gst/mxf/mxfdemux.c
+index b0ccc17..7eb990c 100644
+--- a/gst/mxf/mxfdemux.c
++++ b/gst/mxf/mxfdemux.c
+@@ -170,10 +170,25 @@ gst_mxf_demux_partition_free (GstMXFDemuxPartition * partition)
+ }
+
+ static void
+-gst_mxf_demux_reset_mxf_state (GstMXFDemux * demux)
++gst_mxf_demux_essence_track_free (GstMXFDemuxEssenceTrack * t)
+ {
+-  guint i;
++  if (t->offsets)
++    g_array_free (t->offsets, TRUE);
++
++  g_free (t->mapping_data);
++
++  if (t->tags)
++    gst_tag_list_unref (t->tags);
++
++  if (t->caps)
++    gst_caps_unref (t->caps);
++
++  g_free (t);
++}
+
++static void
++gst_mxf_demux_reset_mxf_state (GstMXFDemux * demux)
++{
+   GST_DEBUG_OBJECT (demux, "Resetting MXF state");
+
+   g_list_foreach (demux->partitions, (GFunc) gst_mxf_demux_partition_free,
+@@ -183,22 +198,7 @@ gst_mxf_demux_reset_mxf_state (GstMXFDemux * demux)
+
+   demux->current_partition = NULL;
+
+-  for (i = 0; i < demux->essence_tracks->len; i++) {
+-    GstMXFDemuxEssenceTrack *t =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
+-
+-    if (t->offsets)
+-      g_array_free (t->offsets, TRUE);
+-
+-    g_free (t->mapping_data);
+-
+-    if (t->tags)
+-      gst_tag_list_unref (t->tags);
+-
+-    if (t->caps)
+-      gst_caps_unref (t->caps);
+-  }
+-  g_array_set_size (demux->essence_tracks, 0);
++  g_ptr_array_set_size (demux->essence_tracks, 0);
+ }
+
+ static void
+@@ -216,7 +216,7 @@ gst_mxf_demux_reset_linked_metadata (GstMXFDemux * demux)
+
+   for (i = 0; i < demux->essence_tracks->len; i++) {
+     GstMXFDemuxEssenceTrack *track =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++        g_ptr_array_index (demux->essence_tracks, i);
+
+     track->source_package = NULL;
+     track->delta_id = -1;
+@@ -419,7 +419,7 @@ gst_mxf_demux_partition_postcheck (GstMXFDemux * demux,
+
+   for (i = 0; i < demux->essence_tracks->len; i++) {
+     GstMXFDemuxEssenceTrack *cand =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++        g_ptr_array_index (demux->essence_tracks, i);
+
+     if (cand->body_sid != partition->partition.body_sid)
+       continue;
+@@ -866,8 +866,7 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux * demux)
+
+       for (k = 0; k < demux->essence_tracks->len; k++) {
+         GstMXFDemuxEssenceTrack *tmp =
+-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,
+-            k);
++	    g_ptr_array_index (demux->essence_tracks, k);
+
+         if (tmp->track_number == track->parent.track_number &&
+             tmp->body_sid == edata->body_sid) {
+@@ -885,24 +884,24 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux * demux)
+       }
+
+       if (!etrack) {
+-        GstMXFDemuxEssenceTrack tmp;
++	GstMXFDemuxEssenceTrack *tmp = g_new0 (GstMXFDemuxEssenceTrack, 1);
++
++        tmp->body_sid = edata->body_sid;
++        tmp->index_sid = edata->index_sid;
++        tmp->track_number = track->parent.track_number;
++        tmp->track_id = track->parent.track_id;
++        memcpy (&tmp->source_package_uid, &package->parent.package_uid, 32);
+
+-        memset (&tmp, 0, sizeof (tmp));
+-        tmp.body_sid = edata->body_sid;
+-        tmp.index_sid = edata->index_sid;
+-        tmp.track_number = track->parent.track_number;
+-        tmp.track_id = track->parent.track_id;
+-        memcpy (&tmp.source_package_uid, &package->parent.package_uid, 32);
+
+         if (demux->current_partition->partition.body_sid == edata->body_sid &&
+             demux->current_partition->partition.body_offset == 0)
+-          tmp.position = 0;
++          tmp->position = 0;
+         else
+-          tmp.position = -1;
++          tmp->position = -1;
+
+-        g_array_append_val (demux->essence_tracks, tmp);
++        g_ptr_array_add (demux->essence_tracks, tmp);
+         etrack =
+-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,
++            g_ptr_array_index (demux->essence_tracks,
+             demux->essence_tracks->len - 1);
+         new = TRUE;
+       }
+@@ -1050,13 +1049,7 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux * demux)
+
+     next:
+       if (new) {
+-        g_free (etrack->mapping_data);
+-        if (etrack->tags)
+-          gst_tag_list_unref (etrack->tags);
+-        if (etrack->caps)
+-          gst_caps_unref (etrack->caps);
+-
+-        g_array_remove_index (demux->essence_tracks,
++       g_ptr_array_remove_index (demux->essence_tracks,
+             demux->essence_tracks->len - 1);
+       }
+     }
+@@ -1069,7 +1062,8 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux * demux)
+
+   for (i = 0; i < demux->essence_tracks->len; i++) {
+     GstMXFDemuxEssenceTrack *etrack =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++        g_ptr_array_index (demux->essence_tracks, i);
++
+
+     if (!etrack->source_package || !etrack->source_track || !etrack->caps) {
+       GST_ERROR_OBJECT (demux, "Failed to update essence track %u", i);
+@@ -1438,7 +1432,7 @@ gst_mxf_demux_update_tracks (GstMXFDemux * demux)
+
+     for (k = 0; k < demux->essence_tracks->len; k++) {
+       GstMXFDemuxEssenceTrack *tmp =
+-          &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, k);
++          g_ptr_array_index (demux->essence_tracks, k);
+
+       if (tmp->source_package == source_package &&
+           tmp->source_track == source_track) {
+@@ -1927,8 +1921,7 @@ gst_mxf_demux_pad_set_component (GstMXFDemux * demux, GstMXFDemuxPad * pad,
+   pad->current_essence_track = NULL;
+
+   for (k = 0; k < demux->essence_tracks->len; k++) {
+-    GstMXFDemuxEssenceTrack *tmp =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, k);
++    GstMXFDemuxEssenceTrack *tmp = g_ptr_array_index (demux->essence_tracks, k);
+
+     if (tmp->source_package == source_package &&
+         tmp->source_track == source_track) {
+@@ -2712,7 +2705,7 @@ gst_mxf_demux_handle_generic_container_essence_element (GstMXFDemux * demux,
+   if (!etrack) {
+     for (i = 0; i < demux->essence_tracks->len; i++) {
+       GstMXFDemuxEssenceTrack *tmp =
+-          &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++          g_ptr_array_index (demux->essence_tracks, i);
+
+       if (tmp->body_sid == demux->current_partition->partition.body_sid &&
+           (tmp->track_number == track_number || tmp->track_number == 0)) {
+@@ -3933,8 +3926,7 @@ from_track_offset:
+   gst_mxf_demux_set_partition_for_offset (demux, demux->offset);
+
+   for (i = 0; i < demux->essence_tracks->len; i++) {
+-    GstMXFDemuxEssenceTrack *t =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++    GstMXFDemuxEssenceTrack *t = g_ptr_array_index (demux->essence_tracks, i);
+
+     if (index_start_position != -1 && t == etrack)
+       t->position = index_start_position;
+@@ -3958,8 +3950,7 @@ from_track_offset:
+       /* Handle EOS */
+       for (i = 0; i < demux->essence_tracks->len; i++) {
+         GstMXFDemuxEssenceTrack *t =
+-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,
+-            i);
++            g_ptr_array_index (demux->essence_tracks, i);
+
+         if (t->position > 0)
+           t->duration = t->position;
+@@ -4197,8 +4188,7 @@ gst_mxf_demux_pull_and_handle_klv_packet (GstMXFDemux * demux)
+           guint i;
+           for (i = 0; i < demux->essence_tracks->len; i++) {
+             GstMXFDemuxEssenceTrack *etrack =
+-                &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,
+-                i);
++                g_ptr_array_index (demux->essence_tracks, i);
+
+             if (etrack->body_sid != partition->partition.body_sid)
+               continue;
+@@ -4669,9 +4659,8 @@ gst_mxf_demux_pad_to_track_and_position (GstMXFDemux * demux,
+   /* Get the corresponding essence track for the given source package and stream id */
+   for (i = 0; i < demux->essence_tracks->len; i++) {
+     GstMXFDemuxEssenceTrack *track =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
+-    GST_LOG_OBJECT (pad,
+-        "Looking at essence track body_sid:%d index_sid:%d",
++	g_ptr_array_index (demux->essence_tracks, i);
++    GST_LOG_OBJECT (pad, "Looking at essence track body_sid:%d index_sid:%d",
+         track->body_sid, track->index_sid);
+     if (clip->source_track_id == 0 || (track->track_id == clip->source_track_id
+             && mxf_umid_is_equal (&clip->source_package_id,
+@@ -4920,8 +4909,7 @@ gst_mxf_demux_seek_push (GstMXFDemux * demux, GstEvent * event)
+   }
+
+   for (i = 0; i < demux->essence_tracks->len; i++) {
+-    GstMXFDemuxEssenceTrack *t =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++    GstMXFDemuxEssenceTrack *t = g_ptr_array_index (demux->essence_tracks, i);
+     t->position = -1;
+   }
+
+@@ -5359,8 +5347,7 @@ gst_mxf_demux_seek_pull (GstMXFDemux * demux, GstEvent * event)
+   }
+
+   for (i = 0; i < demux->essence_tracks->len; i++) {
+-    GstMXFDemuxEssenceTrack *t =
+-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++    GstMXFDemuxEssenceTrack *t = g_ptr_array_index (demux->essence_tracks, i);
+     t->position = -1;
+   }
+
+@@ -5659,7 +5646,7 @@ gst_mxf_demux_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
+
+       for (i = 0; i < demux->essence_tracks->len; i++) {
+         GstMXFDemuxEssenceTrack *t =
+-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack, i);
++            g_ptr_array_index (demux->essence_tracks, i);
+
+         if (t->position > 0)
+           t->duration = t->position;
+@@ -5700,8 +5687,7 @@ gst_mxf_demux_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
+
+           for (i = 0; i < demux->essence_tracks->len; i++) {
+             GstMXFDemuxEssenceTrack *etrack =
+-                &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,
+-                i);
++                g_ptr_array_index (demux->essence_tracks, i);
+             etrack->position = -1;
+           }
+           ret = TRUE;
+@@ -5725,8 +5711,7 @@ gst_mxf_demux_sink_event (GstPad * pad, GstObject * parent, GstEvent * event)
+
+       for (i = 0; i < demux->essence_tracks->len; i++) {
+         GstMXFDemuxEssenceTrack *t =
+-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,
+-            i);
++            g_ptr_array_index (demux->essence_tracks, i);
+         t->position = -1;
+       }
+       demux->current_partition = NULL;
+@@ -5999,7 +5984,7 @@ gst_mxf_demux_finalize (GObject * object)
+
+   g_ptr_array_free (demux->src, TRUE);
+   demux->src = NULL;
+-  g_array_free (demux->essence_tracks, TRUE);
++  g_ptr_array_free (demux->essence_tracks, TRUE);
+   demux->essence_tracks = NULL;
+
+   g_hash_table_destroy (demux->metadata);
+@@ -6076,8 +6061,8 @@ gst_mxf_demux_init (GstMXFDemux * demux)
+   g_rw_lock_init (&demux->metadata_lock);
+
+   demux->src = g_ptr_array_new ();
+-  demux->essence_tracks =
+-      g_array_new (FALSE, FALSE, sizeof (GstMXFDemuxEssenceTrack));
++  demux->essence_tracks = g_ptr_array_new_with_free_func ((GDestroyNotify)
++      gst_mxf_demux_essence_track_free);
+
+   gst_segment_init (&demux->segment, GST_FORMAT_TIME);
+
+diff --git a/gst/mxf/mxfdemux.h b/gst/mxf/mxfdemux.h
+index d079a1d..1dc8a4e 100644
+--- a/gst/mxf/mxfdemux.h
++++ b/gst/mxf/mxfdemux.h
+@@ -266,7 +266,7 @@ struct _GstMXFDemux
+   GList *partitions;
+   GstMXFDemuxPartition *current_partition;
+
+-  GArray *essence_tracks;
++  GPtrArray *essence_tracks;
+
+   GList *pending_index_table_segments;
+   GList *index_tables; /* one per BodySID / IndexSID */
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 219ebe4fa7..4151e54284 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://CVE-2023-40476.patch \
            file://CVE-2023-44429.patch \
            file://CVE-2024-0444.patch \
+           file://CVE-2023-44446.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.34.1


