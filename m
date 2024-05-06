Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F340C4345F
	for <webhook@archiver.kernel.org>; Mon,  6 May 2024 04:03:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13072.1714968214898104436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 May 2024 21:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=q0mdZsAh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5856ba2f23=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4463Ynfq018076
	for <openembedded-core@lists.openembedded.org>; Sun, 5 May 2024 21:03:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=lWK1H
	Hrrzuxk68c+WAZIeBhnKpS3dbktg7WNakJOsjg=; b=q0mdZsAhHFT98wV/XMpJj
	G59tfFPCPb4KRW4UwtxN+um29yaH+w3VSx752OxeL3gBSgvYiloK0uij4VrYEj7b
	vUoBl8u6LKdA/1A185DDvVb2eiuIMgsYUXKf26JJnUOZ/YISatTC1kpXPRcMeOSs
	F3VRumvLs1dA+Ae/jqRaAcpRi3ViVYF9SrRXuwZ2k0MD9SISFdkWsgCpXIP0WNS/
	l3IQ0Vn0U9NeI/uSlMa6DBlnSGUs2WBZ3ciUoucN8Pzz8fNG2FTz95vS2J5kqUst
	mQTBElV8QJC1K+dtu4vcVJYhrj+P1kLZx3OV+yjl0M6qdCJ3Loq65zqLJW3KQif0
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xwg9ys5e9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 May 2024 21:03:34 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Sun, 5 May 2024 21:03:32 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH V2 1/1] gstreamer1.0-plugins-bad: fix CVE-2023-44446
Date: Mon, 6 May 2024 04:03:19 +0000
Message-ID: <20240506040319.854336-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: vNvKa0GyTCJsfmfLq1ARr3rYpTxeVQ4v
X-Proofpoint-GUID: vNvKa0GyTCJsfmfLq1ARr3rYpTxeVQ4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-05_17,2024-05-03_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 04:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199032

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


