Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BB7C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 13:40:39 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.12916.1714743635029164320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 06:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=V3k4ggpq;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.171, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-61df496df01so32276807b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714743634; x=1715348434; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1bv4so+Rz+q7g7RlLz+laBo4bBovyGLWanmRWcIFMI=;
        b=V3k4ggpqXlKqWJ1twzm+2EnJ800ggCim8IV81ICvACLQ2BYd82HPdpoZ33TpNpHl00
         b4bySAv606L4LWzmcTadbwjPeh47RvIPnxZbpRtWBfAK/PjPlltuzs1b8/BZqT0L/HvQ
         gzXJA23xOM3mlGoA2pZqZGY8STt+UtREuXY+fnYnUqSpW1bnN4iuFbumswkVo10ZXZcv
         CbOcKkH/BSYrppdT5O5F+oAIXVVrWrLKLkho0foPov/uNp/Ai/fNjBO9ArJXkEljE0nN
         Ab9K50RgbXOxePgFTmqv9I4+WDlePafVNF+1aq7zPVJQImZoVwi0/iUZSvdNbeMSNsdg
         0rxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714743634; x=1715348434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1bv4so+Rz+q7g7RlLz+laBo4bBovyGLWanmRWcIFMI=;
        b=w2zR0mls+htzcnXKWFpUVvwsIncNwPXlIy0o40E8+c/BgrcEXdM+loA/1TGLbNR58b
         ct5l4xKmgrT1TGSFdS2u6mm+R6iud2PydrRVDBaMV02bDmBs80J+7ymUx3Qp39s+r/+S
         Nw1I5IgxnX1n28CWcdzhRJvvEJU1WY8hTlC/qn+u5if9r0IiCYgYTYBV74ep0hVgVD6S
         AOnwtwprQ3YDW5cFMsw1WgUAZUqCUzroRB4M7Q786HSSOEaYXIhJP/vcbY7S2B2y/F/9
         M/21QD9auliNzeUDweoOTR3GHW/gClS284UtMg21OIhR372XX+ogHHLXHcQyG7+VJVM3
         eSTg==
X-Gm-Message-State: AOJu0YyMPPeIwzWMcs7l+fJiqaWXt7V+4DsII50DZQwA9RMacyPmhBYv
	QoDE6zVRjvcasNOCxA7F8HjEhkGKerl0uItiZxyUBIvaBRK90y3xyR9n8UNQ65RuA7u2hh/onmc
	DfHjmArZalo2SdUOeHPFF1eKhe3JT6qfLrEzGvCgI+JTEEhp8Cpg=
X-Google-Smtp-Source: AGHT+IFCFvVuIbiTSC/6oeGn0aThRtfX+K+2J5F0PDue9vCRC6ac2iot12f2ge33qmqd68xBKeJgjTp6uS1u5NQZNvQ=
X-Received: by 2002:a81:49d1:0:b0:618:8900:8105 with SMTP id
 w200-20020a8149d1000000b0061889008105mr2547422ywa.0.1714743634069; Fri, 03
 May 2024 06:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240503114155.449802-1-archana.polampalli@windriver.com> <20240503114155.449802-4-archana.polampalli@windriver.com>
In-Reply-To: <20240503114155.449802-4-archana.polampalli@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 May 2024 06:40:23 -0700
Message-ID: <CAOSpxdYYj1j6R7PxpUE2stN7gpOwxKLgGDSXDfBBOCUKtF30aQ@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 4/4] gstreamer1.0-plugins-bad: fix CVE-2023-44446
To: archana.polampalli@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 13:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198991

On Fri, May 3, 2024 at 4:43=E2=80=AFAM Polampalli, Archana via
lists.openembedded.org
<archana.polampalli=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../CVE-2023-44446.patch                      | 329 ++++++++++++++++++
>  .../gstreamer1.0-plugins-bad_1.20.7.bb        |   1 +
>  2 files changed, 330 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-bad/CVE-2023-44446.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/C=
VE-2023-44446.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-bad/CVE-2023-44446.patch
> new file mode 100644
> index 0000000000..64a9f83d0d
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023=
-44446.patch
> @@ -0,0 +1,329 @@
> +From 7dfaa57b6f9b55f17ffe824bd8988bb71ae11353 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Fri, 20 Oct 2023 00:09:57 +0300
> +Subject: [PATCH] mxfdemux: Store GstMXFDemuxEssenceTrack in their own fi=
xed
> + allocation
> +
> +Previously they were stored inline inside a GArray, but as references to
> +the tracks were stored in various other places although the array could
> +still be updated (and reallocated!), this could lead to dangling
> +references in various places.
> +
> +Instead now store them in a GPtrArray in their own allocation so each
> +track's memory position stays fixed.
> +
> +Fixes ZDI-CAN-22299
> +
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3055
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/5638>
> +
> +CVE: CVE-2023-44429

Your commit message says this is for CVE-2023-44446!

Please send a V2 for this commit only with the proper CVE id, the
other 3 commits are fine.

Steve

> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/7dfaa57b6f9b55f1]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + gst/mxf/mxfdemux.c | 117 ++++++++++++++++++++-------------------------
> + gst/mxf/mxfdemux.h |   2 +-
> + 2 files changed, 52 insertions(+), 67 deletions(-)
> +
> +diff --git a/gst/mxf/mxfdemux.c b/gst/mxf/mxfdemux.c
> +index b0ccc17..7eb990c 100644
> +--- a/gst/mxf/mxfdemux.c
> ++++ b/gst/mxf/mxfdemux.c
> +@@ -170,10 +170,25 @@ gst_mxf_demux_partition_free (GstMXFDemuxPartition=
 * partition)
> + }
> +
> + static void
> +-gst_mxf_demux_reset_mxf_state (GstMXFDemux * demux)
> ++gst_mxf_demux_essence_track_free (GstMXFDemuxEssenceTrack * t)
> + {
> +-  guint i;
> ++  if (t->offsets)
> ++    g_array_free (t->offsets, TRUE);
> ++
> ++  g_free (t->mapping_data);
> ++
> ++  if (t->tags)
> ++    gst_tag_list_unref (t->tags);
> ++
> ++  if (t->caps)
> ++    gst_caps_unref (t->caps);
> ++
> ++  g_free (t);
> ++}
> +
> ++static void
> ++gst_mxf_demux_reset_mxf_state (GstMXFDemux * demux)
> ++{
> +   GST_DEBUG_OBJECT (demux, "Resetting MXF state");
> +
> +   g_list_foreach (demux->partitions, (GFunc) gst_mxf_demux_partition_fr=
ee,
> +@@ -183,22 +198,7 @@ gst_mxf_demux_reset_mxf_state (GstMXFDemux * demux)
> +
> +   demux->current_partition =3D NULL;
> +
> +-  for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +-    GstMXFDemuxEssenceTrack *t =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> +-
> +-    if (t->offsets)
> +-      g_array_free (t->offsets, TRUE);
> +-
> +-    g_free (t->mapping_data);
> +-
> +-    if (t->tags)
> +-      gst_tag_list_unref (t->tags);
> +-
> +-    if (t->caps)
> +-      gst_caps_unref (t->caps);
> +-  }
> +-  g_array_set_size (demux->essence_tracks, 0);
> ++  g_ptr_array_set_size (demux->essence_tracks, 0);
> + }
> +
> + static void
> +@@ -216,7 +216,7 @@ gst_mxf_demux_reset_linked_metadata (GstMXFDemux * d=
emux)
> +
> +   for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +     GstMXFDemuxEssenceTrack *track =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> ++        g_ptr_array_index (demux->essence_tracks, i);
> +
> +     track->source_package =3D NULL;
> +     track->delta_id =3D -1;
> +@@ -419,7 +419,7 @@ gst_mxf_demux_partition_postcheck (GstMXFDemux * dem=
ux,
> +
> +   for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +     GstMXFDemuxEssenceTrack *cand =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> ++        g_ptr_array_index (demux->essence_tracks, i);
> +
> +     if (cand->body_sid !=3D partition->partition.body_sid)
> +       continue;
> +@@ -866,8 +866,7 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux * d=
emux)
> +
> +       for (k =3D 0; k < demux->essence_tracks->len; k++) {
> +         GstMXFDemuxEssenceTrack *tmp =3D
> +-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTr=
ack,
> +-            k);
> ++          g_ptr_array_index (demux->essence_tracks, k);
> +
> +         if (tmp->track_number =3D=3D track->parent.track_number &&
> +             tmp->body_sid =3D=3D edata->body_sid) {
> +@@ -885,24 +884,24 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux *=
 demux)
> +       }
> +
> +       if (!etrack) {
> +-        GstMXFDemuxEssenceTrack tmp;
> ++      GstMXFDemuxEssenceTrack *tmp =3D g_new0 (GstMXFDemuxEssenceTrack,=
 1);
> ++
> ++        tmp->body_sid =3D edata->body_sid;
> ++        tmp->index_sid =3D edata->index_sid;
> ++        tmp->track_number =3D track->parent.track_number;
> ++        tmp->track_id =3D track->parent.track_id;
> ++        memcpy (&tmp->source_package_uid, &package->parent.package_uid,=
 32);
> +
> +-        memset (&tmp, 0, sizeof (tmp));
> +-        tmp.body_sid =3D edata->body_sid;
> +-        tmp.index_sid =3D edata->index_sid;
> +-        tmp.track_number =3D track->parent.track_number;
> +-        tmp.track_id =3D track->parent.track_id;
> +-        memcpy (&tmp.source_package_uid, &package->parent.package_uid, =
32);
> +
> +         if (demux->current_partition->partition.body_sid =3D=3D edata->=
body_sid &&
> +             demux->current_partition->partition.body_offset =3D=3D 0)
> +-          tmp.position =3D 0;
> ++          tmp->position =3D 0;
> +         else
> +-          tmp.position =3D -1;
> ++          tmp->position =3D -1;
> +
> +-        g_array_append_val (demux->essence_tracks, tmp);
> ++        g_ptr_array_add (demux->essence_tracks, tmp);
> +         etrack =3D
> +-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTr=
ack,
> ++            g_ptr_array_index (demux->essence_tracks,
> +             demux->essence_tracks->len - 1);
> +         new =3D TRUE;
> +       }
> +@@ -1050,13 +1049,7 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux =
* demux)
> +
> +     next:
> +       if (new) {
> +-        g_free (etrack->mapping_data);
> +-        if (etrack->tags)
> +-          gst_tag_list_unref (etrack->tags);
> +-        if (etrack->caps)
> +-          gst_caps_unref (etrack->caps);
> +-
> +-        g_array_remove_index (demux->essence_tracks,
> ++       g_ptr_array_remove_index (demux->essence_tracks,
> +             demux->essence_tracks->len - 1);
> +       }
> +     }
> +@@ -1069,7 +1062,8 @@ gst_mxf_demux_update_essence_tracks (GstMXFDemux *=
 demux)
> +
> +   for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +     GstMXFDemuxEssenceTrack *etrack =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> ++        g_ptr_array_index (demux->essence_tracks, i);
> ++
> +
> +     if (!etrack->source_package || !etrack->source_track || !etrack->ca=
ps) {
> +       GST_ERROR_OBJECT (demux, "Failed to update essence track %u", i);
> +@@ -1438,7 +1432,7 @@ gst_mxf_demux_update_tracks (GstMXFDemux * demux)
> +
> +     for (k =3D 0; k < demux->essence_tracks->len; k++) {
> +       GstMXFDemuxEssenceTrack *tmp =3D
> +-          &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrac=
k, k);
> ++          g_ptr_array_index (demux->essence_tracks, k);
> +
> +       if (tmp->source_package =3D=3D source_package &&
> +           tmp->source_track =3D=3D source_track) {
> +@@ -1927,8 +1921,7 @@ gst_mxf_demux_pad_set_component (GstMXFDemux * dem=
ux, GstMXFDemuxPad * pad,
> +   pad->current_essence_track =3D NULL;
> +
> +   for (k =3D 0; k < demux->essence_tracks->len; k++) {
> +-    GstMXFDemuxEssenceTrack *tmp =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 k);
> ++    GstMXFDemuxEssenceTrack *tmp =3D g_ptr_array_index (demux->essence_=
tracks, k);
> +
> +     if (tmp->source_package =3D=3D source_package &&
> +         tmp->source_track =3D=3D source_track) {
> +@@ -2712,7 +2705,7 @@ gst_mxf_demux_handle_generic_container_essence_ele=
ment (GstMXFDemux * demux,
> +   if (!etrack) {
> +     for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +       GstMXFDemuxEssenceTrack *tmp =3D
> +-          &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrac=
k, i);
> ++          g_ptr_array_index (demux->essence_tracks, i);
> +
> +       if (tmp->body_sid =3D=3D demux->current_partition->partition.body=
_sid &&
> +           (tmp->track_number =3D=3D track_number || tmp->track_number =
=3D=3D 0)) {
> +@@ -3933,8 +3926,7 @@ from_track_offset:
> +   gst_mxf_demux_set_partition_for_offset (demux, demux->offset);
> +
> +   for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +-    GstMXFDemuxEssenceTrack *t =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> ++    GstMXFDemuxEssenceTrack *t =3D g_ptr_array_index (demux->essence_tr=
acks, i);
> +
> +     if (index_start_position !=3D -1 && t =3D=3D etrack)
> +       t->position =3D index_start_position;
> +@@ -3958,8 +3950,7 @@ from_track_offset:
> +       /* Handle EOS */
> +       for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +         GstMXFDemuxEssenceTrack *t =3D
> +-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTr=
ack,
> +-            i);
> ++            g_ptr_array_index (demux->essence_tracks, i);
> +
> +         if (t->position > 0)
> +           t->duration =3D t->position;
> +@@ -4197,8 +4188,7 @@ gst_mxf_demux_pull_and_handle_klv_packet (GstMXFDe=
mux * demux)
> +           guint i;
> +           for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +             GstMXFDemuxEssenceTrack *etrack =3D
> +-                &g_array_index (demux->essence_tracks, GstMXFDemuxEssen=
ceTrack,
> +-                i);
> ++                g_ptr_array_index (demux->essence_tracks, i);
> +
> +             if (etrack->body_sid !=3D partition->partition.body_sid)
> +               continue;
> +@@ -4669,9 +4659,8 @@ gst_mxf_demux_pad_to_track_and_position (GstMXFDem=
ux * demux,
> +   /* Get the corresponding essence track for the given source package a=
nd stream id */
> +   for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +     GstMXFDemuxEssenceTrack *track =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> +-    GST_LOG_OBJECT (pad,
> +-        "Looking at essence track body_sid:%d index_sid:%d",
> ++      g_ptr_array_index (demux->essence_tracks, i);
> ++    GST_LOG_OBJECT (pad, "Looking at essence track body_sid:%d index_si=
d:%d",
> +         track->body_sid, track->index_sid);
> +     if (clip->source_track_id =3D=3D 0 || (track->track_id =3D=3D clip-=
>source_track_id
> +             && mxf_umid_is_equal (&clip->source_package_id,
> +@@ -4920,8 +4909,7 @@ gst_mxf_demux_seek_push (GstMXFDemux * demux, GstE=
vent * event)
> +   }
> +
> +   for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +-    GstMXFDemuxEssenceTrack *t =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> ++    GstMXFDemuxEssenceTrack *t =3D g_ptr_array_index (demux->essence_tr=
acks, i);
> +     t->position =3D -1;
> +   }
> +
> +@@ -5359,8 +5347,7 @@ gst_mxf_demux_seek_pull (GstMXFDemux * demux, GstE=
vent * event)
> +   }
> +
> +   for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +-    GstMXFDemuxEssenceTrack *t =3D
> +-        &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTrack,=
 i);
> ++    GstMXFDemuxEssenceTrack *t =3D g_ptr_array_index (demux->essence_tr=
acks, i);
> +     t->position =3D -1;
> +   }
> +
> +@@ -5659,7 +5646,7 @@ gst_mxf_demux_sink_event (GstPad * pad, GstObject =
* parent, GstEvent * event)
> +
> +       for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +         GstMXFDemuxEssenceTrack *t =3D
> +-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTr=
ack, i);
> ++            g_ptr_array_index (demux->essence_tracks, i);
> +
> +         if (t->position > 0)
> +           t->duration =3D t->position;
> +@@ -5700,8 +5687,7 @@ gst_mxf_demux_sink_event (GstPad * pad, GstObject =
* parent, GstEvent * event)
> +
> +           for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +             GstMXFDemuxEssenceTrack *etrack =3D
> +-                &g_array_index (demux->essence_tracks, GstMXFDemuxEssen=
ceTrack,
> +-                i);
> ++                g_ptr_array_index (demux->essence_tracks, i);
> +             etrack->position =3D -1;
> +           }
> +           ret =3D TRUE;
> +@@ -5725,8 +5711,7 @@ gst_mxf_demux_sink_event (GstPad * pad, GstObject =
* parent, GstEvent * event)
> +
> +       for (i =3D 0; i < demux->essence_tracks->len; i++) {
> +         GstMXFDemuxEssenceTrack *t =3D
> +-            &g_array_index (demux->essence_tracks, GstMXFDemuxEssenceTr=
ack,
> +-            i);
> ++            g_ptr_array_index (demux->essence_tracks, i);
> +         t->position =3D -1;
> +       }
> +       demux->current_partition =3D NULL;
> +@@ -5999,7 +5984,7 @@ gst_mxf_demux_finalize (GObject * object)
> +
> +   g_ptr_array_free (demux->src, TRUE);
> +   demux->src =3D NULL;
> +-  g_array_free (demux->essence_tracks, TRUE);
> ++  g_ptr_array_free (demux->essence_tracks, TRUE);
> +   demux->essence_tracks =3D NULL;
> +
> +   g_hash_table_destroy (demux->metadata);
> +@@ -6076,8 +6061,8 @@ gst_mxf_demux_init (GstMXFDemux * demux)
> +   g_rw_lock_init (&demux->metadata_lock);
> +
> +   demux->src =3D g_ptr_array_new ();
> +-  demux->essence_tracks =3D
> +-      g_array_new (FALSE, FALSE, sizeof (GstMXFDemuxEssenceTrack));
> ++  demux->essence_tracks =3D g_ptr_array_new_with_free_func ((GDestroyNo=
tify)
> ++      gst_mxf_demux_essence_track_free);
> +
> +   gst_segment_init (&demux->segment, GST_FORMAT_TIME);
> +
> +diff --git a/gst/mxf/mxfdemux.h b/gst/mxf/mxfdemux.h
> +index d079a1d..1dc8a4e 100644
> +--- a/gst/mxf/mxfdemux.h
> ++++ b/gst/mxf/mxfdemux.h
> +@@ -266,7 +266,7 @@ struct _GstMXFDemux
> +   GList *partitions;
> +   GstMXFDemuxPartition *current_partition;
> +
> +-  GArray *essence_tracks;
> ++  GPtrArray *essence_tracks;
> +
> +   GList *pending_index_table_segments;
> +   GList *index_tables; /* one per BodySID / IndexSID */
> +--
> +2.40.0
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.=
7.bb
> index 219ebe4fa7..4151e54284 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.b=
b
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.b=
b
> @@ -15,6 +15,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-=
plugins-bad/gst-plugins-bad
>             file://CVE-2023-40476.patch \
>             file://CVE-2023-44429.patch \
>             file://CVE-2024-0444.patch \
> +           file://CVE-2023-44446.patch \
>             "
>  SRC_URI[sha256sum] =3D "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5=
957919610080d195"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198980): https://lists.openembedded.org/g/openembedde=
d-core/message/198980
> Mute This Topic: https://lists.openembedded.org/mt/105886014/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

