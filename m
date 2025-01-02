Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8383EE77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 14:12:09 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.8445.1735827125353917062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 06:12:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kq6+ikuZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.169, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e53a91756e5so13871006276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 06:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735827124; x=1736431924; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5q+EV7Af80W19pZK9vPRXbE/NRFyYeUEdHR06DF7Vs=;
        b=kq6+ikuZS4rudLxLZj8hu7+sRwuDRJnLJdOgLwbUmh400uVrQDbM2T+k+imOLocOFb
         IHEtYxQnS5iUygMIeJTC89vJ76FAn1O0pXTpl9x3WX675FtO1GTRw38mB5x3ylWZSiBI
         0etfYNbL/n5WwrEWbfHc546/hc8yCeRpG0+SvGVu1OiZa6EbWEsMLyrv+fOg+iBP5zHj
         +QQsodPMGCiw3NXyHFNcc38IwM42aLYUhNAnGblb1OrtKS3LApllUBwza4zGvvaG8lhQ
         G65Oz2a6CJXIGeh+0hoNKqIWfVgEucOQAhXQlctQbAFWwaiOqI7AbThzI+LucDnWDhQP
         dtwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735827124; x=1736431924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5q+EV7Af80W19pZK9vPRXbE/NRFyYeUEdHR06DF7Vs=;
        b=mVYh+mEtGkE7jZ4wnmQcbNq8eDz+amEhDH2RqaDGknhsxQKW4iU0eqFfUHYoFj/XFH
         O4S0CpBHhO15rhmE39sF5rBwKzxYMQO5mxzL07HGR/7W0s519FiRDmP1NjBs7O4Isphs
         iFaiCPlO75Oi+ZFL4aTBagu8IhCUD2CLHaKTdihUAoUORIgFWzAmmLDS+zxX4wK5PD27
         XY2cN89KEyZoWIuRFc6ZP9MDtjudKI2Kia2SxV1GkNehm9lk3xAxp7BC8XjsxBzCGJZC
         6x2LWUsJC4g4Wg6F6pFNU7ECoNCYE4tugyo2svtU7CTFrMyrRxtGS5P1b6zl63FNUKca
         Ha+A==
X-Gm-Message-State: AOJu0YwpvZBhj8wrEyMw5xgp0BF2ushkfcLpF/8lh9SQ7wQzj3ZVGZAc
	ndsaMVYll/4B+3qGO9wUEeHQlrmnmrmdz3L3tzMVYms0/I8KIqa1+mfVy4IxtVOxuaCRsbgPAKu
	bEXwhIDMJzdOinM/MnZ9+mnitT1Zv6vMLKD+MwFccXfNE8b9eQIE=
X-Gm-Gg: ASbGncuhi8Fh33ipuqHCCc8PQcSKFQ8sQviEjBxZROI5ZEU2hWDCXOkcV+x2f5+B4Jd
	jIR4PWFadF8P55fndmeDKWrUuP9W0Fp/ByNbHQA==
X-Google-Smtp-Source: AGHT+IFSYJtRZIT7H+hl/66H1b5tnb9HD1wTSjr9FlAKT+65BeH38mD1brCZIGLIp1eK7beQ/AJ4eHNo3fTBYxAR3QY=
X-Received: by 2002:a05:690c:6a12:b0:6ef:792a:6dfd with SMTP id
 00721157ae682-6f3f8251781mr332819737b3.38.1735827124122; Thu, 02 Jan 2025
 06:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20250102133318.642859-1-vanusuri@mvista.com>
In-Reply-To: <20250102133318.642859-1-vanusuri@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 2 Jan 2025 06:11:52 -0800
Message-ID: <CAOSpxdYWywz-GCboQu4q3vEhkFGn2skVhEzPdsB=kTtN0DoQzw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/7] gstreamer1.0-plugins-good: fix
 several CVEs
To: vanusuri@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 14:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209310

Could you send a V2 with the following changes?

1. Please combine the series with  the previous gstreamer patch set
you sent  -- this second series doesn't apply cleanly on top of those
changes
2. Patch file names should reflect the CVE being fixed, e.g.
CVE-2024-47537.patch

Thanks!

Steve

On Thu, Jan 2, 2025 at 5:33=E2=80=AFAM Vijay Anusuri via
lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
wrote:
>
> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Fixes for below CVEs:
> CVE-2024-47537
> CVE-2024-47539
> CVE-2024-47543
> CVE-2024-47544
> CVE-2024-47545
> CVE-2024-47546
> CVE-2024-47596
> CVE-2024-47597
> CVE-2024-47598
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  ...o-sized-boxes-instead-of-stopping-to.patch | 124 +++++
>  ...ger-overflow-when-allocating-the-sam.patch |  64 +++
>  ...Fix-debug-output-during-trun-parsing.patch |  73 +++
>  ...erate-over-all-trun-entries-if-none-.patch |  36 ++
>  ...zes-of-stsc-stco-stts-before-trying-.patch |  63 +++
>  ...e-only-an-even-number-of-bytes-is-pr.patch |  44 ++
>  ...e-enough-data-is-available-before-re.patch | 120 +++++
>  ...th-checks-and-offsets-in-stsd-entry-.patch | 449 ++++++++++++++++++
>  ...r-handling-when-parsing-cenc-sample-.patch |  56 +++
>  ...e-there-are-enough-offsets-to-read-w.patch |  49 ++
>  ...-handle-errors-returns-from-various-.patch |  97 ++++
>  ...r-invalid-atom-length-when-extractin.patch |  36 ++
>  ...size-check-for-parsing-SMI-SEQH-atom.patch |  37 ++
>  .../gstreamer1.0-plugins-good_1.20.7.bb       |  13 +
>  14 files changed, 1261 insertions(+)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0001-qtdemux-Skip-zero-sized-boxes-instead-of-stopping-to.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0002-qtdemux-Fix-integer-overflow-when-allocating-the-sam.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0003-qtdemux-Fix-debug-output-during-trun-parsing.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0004-qtdemux-Don-t-iterate-over-all-trun-entries-if-none-.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0005-qtdemux-Check-sizes-of-stsc-stco-stts-before-trying-.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0006-qtdemux-Make-sure-only-an-even-number-of-bytes-is-pr.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0007-qtdemux-Make-sure-enough-data-is-available-before-re.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0008-qtdemux-Fix-length-checks-and-offsets-in-stsd-entry-.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0009-qtdemux-Fix-error-handling-when-parsing-cenc-sample-.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0010-qtdemux-Make-sure-there-are-enough-offsets-to-read-w.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0011-qtdemux-Actually-handle-errors-returns-from-various-.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugin=
s-good/0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0001-qtdemux-Skip-zero-sized-boxes-instead-of-stopping-to.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qtdemux-Skip-zero-s=
ized-boxes-instead-of-stopping-to.patch
> new file mode 100644
> index 0000000000..8af25e73fd
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qt=
demux-Skip-zero-sized-boxes-instead-of-stopping-to.patch
> @@ -0,0 +1,124 @@
> +From d4bab55077c6a77bd80cb12a8b0d28020ef412a9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Tue, 24 Sep 2024 09:50:34 +0300
> +Subject: [PATCH] qtdemux: Skip zero-sized boxes instead of stopping to l=
ook at
> + further boxes
> +
> +A zero-sized box is not really a problem and can be skipped to look at a=
ny
> +possibly following ones.
> +
> +BMD ATEM devices specifically write a zero-sized bmdc box in the sample
> +description, followed by the avcC box in case of h264. Previously the av=
cC box
> +would simply not be read at all and the file would be unplayable.
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/7564>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/d4bab55077c6a77bd80cb12a8b0d28020ef412a9]
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 54 ++++++++++++-------
> + 1 file changed, 36 insertions(+), 18 deletions(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index 32df6eeb85c1..5e5c21758058 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -12226,9 +12226,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode=
 * trak)
> +               else
> +                 size =3D len - 0x8;
> +
> +-              if (size < 1)
> +-                /* No real data, so break out */
> +-                break;
> ++              /* No real data, so skip */
> ++              if (size < 1) {
> ++                len -=3D 8;
> ++                avc_data +=3D 8;
> ++                continue;
> ++              }
> +
> +               switch (QT_FOURCC (avc_data + 0x4)) {
> +                 case FOURCC_avcC:
> +@@ -12343,9 +12346,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode=
 * trak)
> +               else
> +                 size =3D len - 0x8;
> +
> +-              if (size < 1)
> +-                /* No real data, so break out */
> +-                break;
> ++              /* No real data, so skip */
> ++              if (size < 1) {
> ++                len -=3D 8;
> ++                hevc_data +=3D 8;
> ++                continue;
> ++              }
> +
> +               switch (QT_FOURCC (hevc_data + 0x4)) {
> +                 case FOURCC_hvcC:
> +@@ -12767,9 +12773,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode=
 * trak)
> +               else
> +                 size =3D len - 8;
> +
> +-              if (size < 1)
> +-                /* No real data, so break out */
> +-                break;
> ++              /* No real data, so skip */
> ++              if (size < 1) {
> ++                len -=3D 8;
> ++                vc1_data +=3D 8;
> ++                continue;
> ++              }
> +
> +               switch (QT_FOURCC (vc1_data + 0x4)) {
> +                 case GST_MAKE_FOURCC ('d', 'v', 'c', '1'):
> +@@ -12809,9 +12818,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode=
 * trak)
> +               else
> +                 size =3D len - 0x8;
> +
> +-              if (size < 1)
> +-                /* No real data, so break out */
> +-                break;
> ++              /* No real data, so skip */
> ++              if (size < 1) {
> ++                len -=3D 8;
> ++                av1_data +=3D 8;
> ++                continue;
> ++              }
> +
> +               switch (QT_FOURCC (av1_data + 0x4)) {
> +                 case FOURCC_av1C:
> +@@ -12919,9 +12931,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode=
 * trak)
> +               else
> +                 size =3D len - 0x8;
> +
> +-              if (size < 1)
> +-                /* No real data, so break out */
> +-                break;
> ++              /* No real data, so skip */
> ++              if (size < 1) {
> ++                len -=3D 8;
> ++                vpcc_data +=3D 8;
> ++                continue;
> ++              }
> +
> +               switch (QT_FOURCC (vpcc_data + 0x4)) {
> +                 case FOURCC_vpcC:
> +@@ -13421,9 +13436,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode=
 * trak)
> +             else
> +               size =3D len - 8;
> +
> +-            if (size < 1)
> +-              /* No real data, so break out */
> +-              break;
> ++            /* No real data, so skip */
> ++            if (size < 1) {
> ++              len -=3D 8;
> ++              wfex_data +=3D 8;
> ++              continue;
> ++            }
> +
> +             switch (QT_FOURCC (wfex_data + 4)) {
> +               case GST_MAKE_FOURCC ('w', 'f', 'e', 'x'):
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0002-qtdemux-Fix-integer-overflow-when-allocating-the-sam.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qtdemux-Fix-integer=
-overflow-when-allocating-the-sam.patch
> new file mode 100644
> index 0000000000..ded7e1b1c5
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qt=
demux-Fix-integer-overflow-when-allocating-the-sam.patch
> @@ -0,0 +1,64 @@
> +From c3a2af94c652513ac1b1858295688ac88c5cc737 Mon Sep 17 00:00:00 2001
> +From: Antonio Morales <antonio-morales@github.com>
> +Date: Thu, 26 Sep 2024 18:39:37 +0300
> +Subject: [PATCH] qtdemux: Fix integer overflow when allocating the sampl=
es
> + table for fragmented MP4
> +
> +This can lead to out of bounds writes and NULL pointer dereferences.
> +
> +Fixes GHSL-2024-094, GHSL-2024-237, GHSL-2024-241
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3839
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8060>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/c3a2af94c652513ac1b1858295688ac88c5cc737]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> +CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-475=
98
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index de8fae8b02ee..2fb5b2b014db 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -3364,6 +3364,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteR=
eader * trun,
> +   gint i;
> +   guint8 *data;
> +   guint entry_size, dur_offset, size_offset, flags_offset =3D 0, ct_off=
set =3D 0;
> ++  guint new_n_samples;
> +   QtDemuxSample *sample;
> +   gboolean ismv =3D FALSE;
> +   gint64 initial_offset;
> +@@ -3475,14 +3476,13 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByt=
eReader * trun,
> +     goto fail;
> +   data =3D (guint8 *) gst_byte_reader_peek_data_unchecked (trun);
> +
> +-  if (stream->n_samples + samples_count >=3D
> +-      QTDEMUX_MAX_SAMPLE_INDEX_SIZE / sizeof (QtDemuxSample))
> ++  if (!g_uint_checked_add (&new_n_samples, stream->n_samples, samples_c=
ount) ||
> ++      new_n_samples >=3D QTDEMUX_MAX_SAMPLE_INDEX_SIZE / sizeof (QtDemu=
xSample))
> +     goto index_too_big;
> +
> +   GST_DEBUG_OBJECT (qtdemux, "allocating n_samples %u * %u (%.2f MB)",
> +-      stream->n_samples + samples_count, (guint) sizeof (QtDemuxSample)=
,
> +-      (stream->n_samples + samples_count) *
> +-      sizeof (QtDemuxSample) / (1024.0 * 1024.0));
> ++      new_n_samples, (guint) sizeof (QtDemuxSample),
> ++      (new_n_samples) * sizeof (QtDemuxSample) / (1024.0 * 1024.0));
> +
> +   /* create a new array of samples if it's the first sample parsed */
> +   if (stream->n_samples =3D=3D 0) {
> +@@ -3491,7 +3491,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteR=
eader * trun,
> +     /* or try to reallocate it with space enough to insert the new samp=
les */
> +   } else
> +     stream->samples =3D g_try_renew (QtDemuxSample, stream->samples,
> +-        stream->n_samples + samples_count);
> ++        new_n_samples);
> +   if (stream->samples =3D=3D NULL)
> +     goto out_of_memory;
> +
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0003-qtdemux-Fix-debug-output-during-trun-parsing.patch b/meta/recipes-mult=
imedia/gstreamer/gstreamer1.0-plugins-good/0003-qtdemux-Fix-debug-output-du=
ring-trun-parsing.patch
> new file mode 100644
> index 0000000000..8c17c548df
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-qt=
demux-Fix-debug-output-during-trun-parsing.patch
> @@ -0,0 +1,73 @@
> +From 812f175c580a2e702581859fd481c8f51d633508 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Thu, 26 Sep 2024 18:40:56 +0300
> +Subject: [PATCH] qtdemux: Fix debug output during trun parsing
> +
> +Various integers are unsigned so print them as such. Also print the actu=
al
> +allocation size if allocation fails, not only parts of it.
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8060>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/812f175c580a2e702581859fd481c8f51d633508]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + gst/isomp4/qtdemux.c | 17 +++++++++--------
> + 1 file changed, 9 insertions(+), 8 deletions(-)
> +
> +diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
> +index e012ce1..0111912 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -3228,8 +3228,8 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteR=
eader * trun,
> +   gint64 initial_offset;
> +   gint32 min_ct =3D 0;
> +
> +-  GST_LOG_OBJECT (qtdemux, "parsing trun track-id %d; "
> +-      "default dur %d, size %d, flags 0x%x, base offset %" G_GINT64_FOR=
MAT ", "
> ++  GST_LOG_OBJECT (qtdemux, "parsing trun track-id %u; "
> ++      "default dur %u, size %u, flags 0x%x, base offset %" G_GINT64_FOR=
MAT ", "
> +       "decode ts %" G_GINT64_FORMAT, stream->track_id, d_sample_duratio=
n,
> +       d_sample_size, d_sample_flags, *base_offset, decode_ts);
> +
> +@@ -3257,7 +3257,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteR=
eader * trun,
> +     /* note this is really signed */
> +     if (!gst_byte_reader_get_int32_be (trun, &data_offset))
> +       goto fail;
> +-    GST_LOG_OBJECT (qtdemux, "trun data offset %d", data_offset);
> ++    GST_LOG_OBJECT (qtdemux, "trun data offset %u", data_offset);
> +     /* default base offset =3D first byte of moof */
> +     if (*base_offset =3D=3D -1) {
> +       GST_LOG_OBJECT (qtdemux, "base_offset at moof");
> +@@ -3279,7 +3279,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstByteR=
eader * trun,
> +
> +   GST_LOG_OBJECT (qtdemux, "running offset now %" G_GINT64_FORMAT,
> +       *running_offset);
> +-  GST_LOG_OBJECT (qtdemux, "trun offset %d, flags 0x%x, entries %d",
> ++  GST_LOG_OBJECT (qtdemux, "trun offset %u, flags 0x%x, entries %u",
> +       data_offset, flags, samples_count);
> +
> +   if (flags & TR_FIRST_SAMPLE_FLAGS) {
> +@@ -3499,14 +3499,15 @@ fail:
> +   }
> + out_of_memory:
> +   {
> +-    GST_WARNING_OBJECT (qtdemux, "failed to allocate %d samples",
> +-        stream->n_samples);
> ++    GST_WARNING_OBJECT (qtdemux, "failed to allocate %u + %u samples",
> ++        stream->n_samples, samples_count);
> +     return FALSE;
> +   }
> + index_too_big:
> +   {
> +-    GST_WARNING_OBJECT (qtdemux, "not allocating index of %d samples, w=
ould "
> +-        "be larger than %uMB (broken file?)", stream->n_samples,
> ++    GST_WARNING_OBJECT (qtdemux,
> ++      "not allocating index of %u + %u samples, would "
> ++        "be larger than %uMB (broken file?)", stream->n_samples, sample=
s_count,
> +         QTDEMUX_MAX_SAMPLE_INDEX_SIZE >> 20);
> +     return FALSE;
> +   }
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0004-qtdemux-Don-t-iterate-over-all-trun-entries-if-none-.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qtdemux-Don-t-itera=
te-over-all-trun-entries-if-none-.patch
> new file mode 100644
> index 0000000000..217387a4cd
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qt=
demux-Don-t-iterate-over-all-trun-entries-if-none-.patch
> @@ -0,0 +1,36 @@
> +From eb7f9331c2294bc28a549b79c9f931c3e6c6bc44 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Thu, 26 Sep 2024 18:41:39 +0300
> +Subject: [PATCH] qtdemux: Don't iterate over all trun entries if none of=
 the
> + flags are set
> +
> +Nothing would be printed anyway.
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8060>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/eb7f9331c2294bc28a549b79c9f931c3e6c6bc44]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c b/su=
bprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c
> +index 22da35e9e7ad..297b580ef038 100644
> +--- a/gst/isomp4/qtdemux_dump.c
> ++++ b/gst/isomp4/qtdemux_dump.c
> +@@ -836,6 +836,11 @@ qtdemux_dump_trun (GstQTDemux * qtdemux, GstByteRea=
der * data, int depth)
> +     GST_LOG ("%*s    first-sample-flags: %u", depth, "", first_sample_f=
lags);
> +   }
> +
> ++  /* Nothing to print below */
> ++  if ((flags & (TR_SAMPLE_DURATION | TR_SAMPLE_SIZE | TR_SAMPLE_FLAGS |
> ++              TR_COMPOSITION_TIME_OFFSETS)) =3D=3D 0)
> ++    return TRUE;
> ++
> +   for (i =3D 0; i < samples_count; i++) {
> +     if (flags & TR_SAMPLE_DURATION) {
> +       if (!gst_byte_reader_get_uint32_be (data, &sample_duration))
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0005-qtdemux-Check-sizes-of-stsc-stco-stts-before-trying-.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qtdemux-Check-sizes=
-of-stsc-stco-stts-before-trying-.patch
> new file mode 100644
> index 0000000000..8b5bddbf5b
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qt=
demux-Check-sizes-of-stsc-stco-stts-before-trying-.patch
> @@ -0,0 +1,63 @@
> +From 1def2965d8da8cc74ab0036d7f8d59e81e676cad Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Fri, 27 Sep 2024 15:50:54 +0300
> +Subject: [PATCH] qtdemux: Check sizes of stsc/stco/stts before trying to=
 merge
> + entries
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-246
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3854
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8060>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/1def2965d8da8cc74ab0036d7f8d59e81e676cad]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 22 +++++++++++++++++++
> + 1 file changed, 22 insertions(+)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index 0996292d0789..c14d939ee3c9 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -10033,6 +10033,21 @@ qtdemux_merge_sample_table (GstQTDemux * qtdemu=
x, QtDemuxStream * stream)
> +     return;
> +   }
> +
> ++  if (gst_byte_reader_get_remaining (&stream->stts) < 8) {
> ++    GST_DEBUG_OBJECT (qtdemux, "Too small stts");
> ++    return;
> ++  }
> ++
> ++  if (stream->stco.size < 8) {
> ++    GST_DEBUG_OBJECT (qtdemux, "Too small stco");
> ++    return;
> ++  }
> ++
> ++  if (stream->n_samples_per_chunk =3D=3D 0) {
> ++    GST_DEBUG_OBJECT (qtdemux, "No samples per chunk");
> ++    return;
> ++  }
> ++
> +   /* Parse the stts to get the sample duration and number of samples */
> +   gst_byte_reader_skip_unchecked (&stream->stts, 4);
> +   stts_duration =3D gst_byte_reader_get_uint32_be_unchecked (&stream->s=
tts);
> +@@ -10044,6 +10059,13 @@ qtdemux_merge_sample_table (GstQTDemux * qtdemu=
x, QtDemuxStream * stream)
> +   GST_DEBUG_OBJECT (qtdemux, "sample_duration %d, num_chunks %u", stts_=
duration,
> +       num_chunks);
> +
> ++  if (gst_byte_reader_get_remaining (&stream->stsc) <
> ++      stream->n_samples_per_chunk * 3 * 4 +
> ++      (stream->n_samples_per_chunk - 1) * 4) {
> ++    GST_DEBUG_OBJECT (qtdemux, "Too small stsc");
> ++    return;
> ++  }
> ++
> +   /* Now parse stsc, convert chunks into single samples and generate a
> +    * new stsc, stts and stsz from this information */
> +   gst_byte_writer_init (&stsc);
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0006-qtdemux-Make-sure-only-an-even-number-of-bytes-is-pr.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qtdemux-Make-sure-o=
nly-an-even-number-of-bytes-is-pr.patch
> new file mode 100644
> index 0000000000..02d9cb278c
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qt=
demux-Make-sure-only-an-even-number-of-bytes-is-pr.patch
> @@ -0,0 +1,44 @@
> +From 314945426c7105ad90f44a188037bc43bb3b0300 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Thu, 26 Sep 2024 09:20:28 +0300
> +Subject: [PATCH] qtdemux: Make sure only an even number of bytes is proc=
essed
> + when handling CEA608 data
> +
> +An odd number of bytes would lead to out of bound reads and writes, and =
doesn't
> +make any sense as CEA608 comes in byte pairs.
> +
> +Strip off any leftover bytes and assume everything before that is valid.
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-195
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3841
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8060>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/314945426c7105ad90f44a188037bc43bb3b0300]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index c14d939ee3c9..b9f466991adf 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -6145,6 +6145,11 @@ convert_to_s334_1a (const guint8 * ccpair, guint8=
 ccpair_size, guint field,
> +   guint8 *storage;
> +   gsize i;
> +
> ++  /* Strip off any leftover odd bytes and assume everything before is v=
alid */
> ++  if (ccpair_size % 2 !=3D 0) {
> ++    ccpair_size -=3D 1;
> ++  }
> ++
> +   /* We are converting from pairs to triplets */
> +   *res =3D ccpair_size / 2 * 3;
> +   storage =3D g_malloc (*res);
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0007-qtdemux-Make-sure-enough-data-is-available-before-re.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qtdemux-Make-sure-e=
nough-data-is-available-before-re.patch
> new file mode 100644
> index 0000000000..5ff18baa7e
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qt=
demux-Make-sure-enough-data-is-available-before-re.patch
> @@ -0,0 +1,120 @@
> +From 8ef08a7a41da987aa630082df355ea651aa09132 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Thu, 26 Sep 2024 14:17:02 +0300
> +Subject: [PATCH] qtdemux: Make sure enough data is available before read=
ing
> + wave header node
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-236
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3843
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8060>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/8ef08a7a41da987aa630082df355ea651aa09132]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 84 ++++++++++---------
> + 1 file changed, 45 insertions(+), 39 deletions(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index b9f466991adf..55ba59152c7a 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -13697,47 +13697,53 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +         } else {
> +           guint32 datalen =3D QT_UINT32 (stsd_entry_data + offset + 16)=
;
> +           const guint8 *data =3D stsd_entry_data + offset + 16;
> +-          GNode *wavenode;
> +-          GNode *waveheadernode;
> +-
> +-          wavenode =3D g_node_new ((guint8 *) data);
> +-          if (qtdemux_parse_node (qtdemux, wavenode, data, datalen)) {
> +-            const guint8 *waveheader;
> +-            guint32 headerlen;
> +-
> +-            waveheadernode =3D qtdemux_tree_get_child_by_type (wavenode=
, fourcc);
> +-            if (waveheadernode) {
> +-              waveheader =3D (const guint8 *) waveheadernode->data;
> +-              headerlen =3D QT_UINT32 (waveheader);
> +-
> +-              if (headerlen > 8) {
> +-                gst_riff_strf_auds *header =3D NULL;
> +-                GstBuffer *headerbuf;
> +-                GstBuffer *extra;
> +-
> +-                waveheader +=3D 8;
> +-                headerlen -=3D 8;
> +-
> +-                headerbuf =3D gst_buffer_new_and_alloc (headerlen);
> +-                gst_buffer_fill (headerbuf, 0, waveheader, headerlen);
> +-
> +-                if (gst_riff_parse_strf_auds (GST_ELEMENT_CAST (qtdemux=
),
> +-                        headerbuf, &header, &extra)) {
> +-                  gst_caps_unref (entry->caps);
> +-                  /* FIXME: Need to do something with the channel reord=
er map */
> +-                  entry->caps =3D
> +-                      gst_riff_create_audio_caps (header->format, NULL,=
 header,
> +-                      extra, NULL, NULL, NULL);
> +-
> +-                  if (extra)
> +-                    gst_buffer_unref (extra);
> +-                  g_free (header);
> ++
> ++          if (len < datalen || len - datalen < offset + 16) {
> ++            GST_WARNING_OBJECT (qtdemux, "Not enough data for waveheade=
rnode");
> ++          } else {
> ++            GNode *wavenode;
> ++            GNode *waveheadernode;
> ++
> ++            wavenode =3D g_node_new ((guint8 *) data);
> ++            if (qtdemux_parse_node (qtdemux, wavenode, data, datalen)) =
{
> ++              const guint8 *waveheader;
> ++              guint32 headerlen;
> ++
> ++              waveheadernode =3D
> ++                  qtdemux_tree_get_child_by_type (wavenode, fourcc);
> ++              if (waveheadernode) {
> ++                waveheader =3D (const guint8 *) waveheadernode->data;
> ++                headerlen =3D QT_UINT32 (waveheader);
> ++
> ++                if (headerlen > 8) {
> ++                  gst_riff_strf_auds *header =3D NULL;
> ++                  GstBuffer *headerbuf;
> ++                  GstBuffer *extra;
> ++
> ++                  waveheader +=3D 8;
> ++                  headerlen -=3D 8;
> ++
> ++                  headerbuf =3D gst_buffer_new_and_alloc (headerlen);
> ++                  gst_buffer_fill (headerbuf, 0, waveheader, headerlen)=
;
> ++
> ++                  if (gst_riff_parse_strf_auds (GST_ELEMENT_CAST (qtdem=
ux),
> ++                          headerbuf, &header, &extra)) {
> ++                    gst_caps_unref (entry->caps);
> ++                    /* FIXME: Need to do something with the channel reo=
rder map */
> ++                    entry->caps =3D
> ++                        gst_riff_create_audio_caps (header->format, NUL=
L,
> ++                        header, extra, NULL, NULL, NULL);
> ++
> ++                    if (extra)
> ++                      gst_buffer_unref (extra);
> ++                    g_free (header);
> ++                  }
> +                 }
> +-              }
> +-            } else
> +-              GST_DEBUG ("Didn't find waveheadernode for this codec");
> ++              } else
> ++                GST_DEBUG ("Didn't find waveheadernode for this codec")=
;
> ++            }
> ++            g_node_destroy (wavenode);
> +           }
> +-          g_node_destroy (wavenode);
> +         }
> +       } else if (esds) {
> +         gst_qtdemux_handle_esds (qtdemux, stream, entry, esds,
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0008-qtdemux-Fix-length-checks-and-offsets-in-stsd-entry-.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qtdemux-Fix-length-=
checks-and-offsets-in-stsd-entry-.patch
> new file mode 100644
> index 0000000000..41cf4c7d00
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qt=
demux-Fix-length-checks-and-offsets-in-stsd-entry-.patch
> @@ -0,0 +1,449 @@
> +From fe9d5d37234aca04fef7248184177168905a7a69 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Fri, 27 Sep 2024 00:12:57 +0300
> +Subject: [PATCH] qtdemux: Fix length checks and offsets in stsd entry pa=
rsing
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-242
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3845
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8060>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/fe9d5d37234aca04fef7248184177168905a7a69]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 218 +++++++-----------
> + 1 file changed, 79 insertions(+), 139 deletions(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index 55ba59152c7a..fb157552eb75 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -12237,43 +12237,35 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +           case FOURCC_avc1:
> +           case FOURCC_avc3:
> +           {
> +-            guint len =3D QT_UINT32 (stsd_entry_data);
> ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> +             const guint8 *avc_data =3D stsd_entry_data + 0x56;
> +
> +             /* find avcC */
> +-            while (len >=3D 0x8) {
> +-              guint size;
> +-
> +-              if (QT_UINT32 (avc_data) <=3D 0x8)
> +-                size =3D 0;
> +-              else if (QT_UINT32 (avc_data) <=3D len)
> +-                size =3D QT_UINT32 (avc_data) - 0x8;
> +-              else
> +-                size =3D len - 0x8;
> ++            while (len >=3D 8) {
> ++              guint32 size =3D QT_UINT32 (avc_data);
> +
> +-              /* No real data, so skip */
> +-              if (size < 1) {
> +-                len -=3D 8;
> +-                avc_data +=3D 8;
> +-                continue;
> +-              }
> ++              if (size < 8 || size > len)
> ++                break;
> +
> +-              switch (QT_FOURCC (avc_data + 0x4)) {
> ++              switch (QT_FOURCC (avc_data + 4)) {
> +                 case FOURCC_avcC:
> +                 {
> +                   /* parse, if found */
> +                   GstBuffer *buf;
> +
> ++                  if (size < 8 + 1)
> ++                    break;
> ++
> +                   GST_DEBUG_OBJECT (qtdemux, "found avcC codec_data in =
stsd");
> +
> +                   /* First 4 bytes are the length of the atom, the next=
 4 bytes
> +                    * are the fourcc, the next 1 byte is the version, an=
d the
> +                    * subsequent bytes are profile_tier_level structure =
like data. */
> +                   gst_codec_utils_h264_caps_set_level_and_profile (entr=
y->caps,
> +-                      avc_data + 8 + 1, size - 1);
> +-                  buf =3D gst_buffer_new_and_alloc (size);
> +-                  gst_buffer_fill (buf, 0, avc_data + 0x8, size);
> ++                      avc_data + 8 + 1, size - 8 - 1);
> ++                  buf =3D gst_buffer_new_and_alloc (size - 8);
> ++                  gst_buffer_fill (buf, 0, avc_data + 8, size - 8);
> +                   gst_caps_set_simple (entry->caps,
> +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> +                   gst_buffer_unref (buf);
> +@@ -12284,6 +12276,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +                 {
> +                   GstBuffer *buf;
> +
> ++                  if (size < 8 + 40 + 1)
> ++                    break;
> ++
> +                   GST_DEBUG_OBJECT (qtdemux, "found strf codec_data in =
stsd");
> +
> +                   /* First 4 bytes are the length of the atom, the next=
 4 bytes
> +@@ -12291,17 +12286,14 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +                    * next 1 byte is the version, and the
> +                    * subsequent bytes are sequence parameter set like d=
ata. */
> +
> +-                  size -=3D 40;   /* we'll be skipping BITMAPINFOHEADER=
 */
> +-                  if (size > 1) {
> +-                    gst_codec_utils_h264_caps_set_level_and_profile
> +-                        (entry->caps, avc_data + 8 + 40 + 1, size - 1);
> ++                  gst_codec_utils_h264_caps_set_level_and_profile
> ++                      (entry->caps, avc_data + 8 + 40 + 1, size - 8 - 4=
0 - 1);
> +
> +-                    buf =3D gst_buffer_new_and_alloc (size);
> +-                    gst_buffer_fill (buf, 0, avc_data + 8 + 40, size);
> +-                    gst_caps_set_simple (entry->caps,
> +-                        "codec_data", GST_TYPE_BUFFER, buf, NULL);
> +-                    gst_buffer_unref (buf);
> +-                  }
> ++                  buf =3D gst_buffer_new_and_alloc (size - 8 - 40);
> ++                  gst_buffer_fill (buf, 0, avc_data + 8 + 40, size - 8 =
- 40);
> ++                  gst_caps_set_simple (entry->caps,
> ++                      "codec_data", GST_TYPE_BUFFER, buf, NULL);
> ++                  gst_buffer_unref (buf);
> +                   break;
> +                 }
> +                 case FOURCC_btrt:
> +@@ -12309,11 +12301,11 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +                   guint avg_bitrate, max_bitrate;
> +
> +                   /* bufferSizeDB, maxBitrate and avgBitrate - 4 bytes =
each */
> +-                  if (size < 12)
> ++                  if (size < 8 + 12)
> +                     break;
> +
> +-                  max_bitrate =3D QT_UINT32 (avc_data + 0xc);
> +-                  avg_bitrate =3D QT_UINT32 (avc_data + 0x10);
> ++                  max_bitrate =3D QT_UINT32 (avc_data + 8 + 4);
> ++                  avg_bitrate =3D QT_UINT32 (avc_data + 8 + 8);
> +
> +                   if (!max_bitrate && !avg_bitrate)
> +                     break;
> +@@ -12345,8 +12337,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +                   break;
> +               }
> +
> +-              len -=3D size + 8;
> +-              avc_data +=3D size + 8;
> ++              len -=3D size;
> ++              avc_data +=3D size;
> +             }
> +
> +             break;
> +@@ -12357,44 +12349,36 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +           case FOURCC_dvh1:
> +           case FOURCC_dvhe:
> +           {
> +-            guint len =3D QT_UINT32 (stsd_entry_data);
> ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> +             const guint8 *hevc_data =3D stsd_entry_data + 0x56;
> +
> +             /* find hevc */
> +-            while (len >=3D 0x8) {
> +-              guint size;
> +-
> +-              if (QT_UINT32 (hevc_data) <=3D 0x8)
> +-                size =3D 0;
> +-              else if (QT_UINT32 (hevc_data) <=3D len)
> +-                size =3D QT_UINT32 (hevc_data) - 0x8;
> +-              else
> +-                size =3D len - 0x8;
> ++            while (len >=3D 8) {
> ++              guint32 size =3D QT_UINT32 (hevc_data);
> +
> +-              /* No real data, so skip */
> +-              if (size < 1) {
> +-                len -=3D 8;
> +-                hevc_data +=3D 8;
> +-                continue;
> +-              }
> ++              if (size < 8 || size > len)
> ++                break;
> +
> +-              switch (QT_FOURCC (hevc_data + 0x4)) {
> ++              switch (QT_FOURCC (hevc_data + 4)) {
> +                 case FOURCC_hvcC:
> +                 {
> +                   /* parse, if found */
> +                   GstBuffer *buf;
> +
> ++                  if (size < 8 + 1)
> ++                    break;
> ++
> +                   GST_DEBUG_OBJECT (qtdemux, "found hvcC codec_data in =
stsd");
> +
> +                   /* First 4 bytes are the length of the atom, the next=
 4 bytes
> +                    * are the fourcc, the next 1 byte is the version, an=
d the
> +                    * subsequent bytes are sequence parameter set like d=
ata. */
> +                   gst_codec_utils_h265_caps_set_level_tier_and_profile
> +-                      (entry->caps, hevc_data + 8 + 1, size - 1);
> ++                      (entry->caps, hevc_data + 8 + 1, size - 8 - 1);
> +
> +-                  buf =3D gst_buffer_new_and_alloc (size);
> +-                  gst_buffer_fill (buf, 0, hevc_data + 0x8, size);
> ++                  buf =3D gst_buffer_new_and_alloc (size - 8);
> ++                  gst_buffer_fill (buf, 0, hevc_data + 8, size - 8);
> +                   gst_caps_set_simple (entry->caps,
> +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> +                   gst_buffer_unref (buf);
> +@@ -12403,8 +12387,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +                 default:
> +                   break;
> +               }
> +-              len -=3D size + 8;
> +-              hevc_data +=3D size + 8;
> ++              len -=3D size;
> ++              hevc_data +=3D size;
> +             }
> +             break;
> +           }
> +@@ -12784,36 +12768,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +           }
> +           case FOURCC_vc_1:
> +           {
> +-            guint len =3D QT_UINT32 (stsd_entry_data);
> ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> +             const guint8 *vc1_data =3D stsd_entry_data + 0x56;
> +
> +             /* find dvc1 */
> +             while (len >=3D 8) {
> +-              guint size;
> +-
> +-              if (QT_UINT32 (vc1_data) <=3D 8)
> +-                size =3D 0;
> +-              else if (QT_UINT32 (vc1_data) <=3D len)
> +-                size =3D QT_UINT32 (vc1_data) - 8;
> +-              else
> +-                size =3D len - 8;
> ++              guint32 size =3D QT_UINT32 (vc1_data);
> +
> +-              /* No real data, so skip */
> +-              if (size < 1) {
> +-                len -=3D 8;
> +-                vc1_data +=3D 8;
> +-                continue;
> +-              }
> ++              if (size < 8 || size > len)
> ++                break;
> +
> +-              switch (QT_FOURCC (vc1_data + 0x4)) {
> ++              switch (QT_FOURCC (vc1_data + 4)) {
> +                 case GST_MAKE_FOURCC ('d', 'v', 'c', '1'):
> +                 {
> +                   GstBuffer *buf;
> +
> +                   GST_DEBUG_OBJECT (qtdemux, "found dvc1 codec_data in =
stsd");
> +-                  buf =3D gst_buffer_new_and_alloc (size);
> +-                  gst_buffer_fill (buf, 0, vc1_data + 8, size);
> ++                  buf =3D gst_buffer_new_and_alloc (size - 8);
> ++                  gst_buffer_fill (buf, 0, vc1_data + 8, size - 8);
> +                   gst_caps_set_simple (entry->caps,
> +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> +                   gst_buffer_unref (buf);
> +@@ -12822,36 +12795,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +                 default:
> +                   break;
> +               }
> +-              len -=3D size + 8;
> +-              vc1_data +=3D size + 8;
> ++              len -=3D size;
> ++              vc1_data +=3D size;
> +             }
> +             break;
> +           }
> +           case FOURCC_av01:
> +           {
> +-            guint len =3D QT_UINT32 (stsd_entry_data);
> ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> +             const guint8 *av1_data =3D stsd_entry_data + 0x56;
> +
> +             /* find av1C */
> +-            while (len >=3D 0x8) {
> +-              guint size;
> +-
> +-              if (QT_UINT32 (av1_data) <=3D 0x8)
> +-                size =3D 0;
> +-              else if (QT_UINT32 (av1_data) <=3D len)
> +-                size =3D QT_UINT32 (av1_data) - 0x8;
> +-              else
> +-                size =3D len - 0x8;
> ++            while (len >=3D 8) {
> ++              guint32 size =3D QT_UINT32 (av1_data);
> +
> +-              /* No real data, so skip */
> +-              if (size < 1) {
> +-                len -=3D 8;
> +-                av1_data +=3D 8;
> +-                continue;
> +-              }
> ++              if (size < 8 || size > len)
> ++                break;
> +
> +-              switch (QT_FOURCC (av1_data + 0x4)) {
> ++              switch (QT_FOURCC (av1_data + 4)) {
> +                 case FOURCC_av1C:
> +                 {
> +                   /* parse, if found */
> +@@ -12861,7 +12823,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +                       "found av1C codec_data in stsd of size %d", size)=
;
> +
> +                   /* not enough data, just ignore and hope for the best=
 */
> +-                  if (size < 4)
> ++                  if (size < 8 + 4)
> +                     break;
> +
> +                   /* Content is:
> +@@ -12910,9 +12872,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +                             (gint) (pres_delay_field & 0x0F) + 1, NULL)=
;
> +                       }
> +
> +-                      buf =3D gst_buffer_new_and_alloc (size);
> ++                      buf =3D gst_buffer_new_and_alloc (size - 8);
> +                       GST_BUFFER_FLAG_SET (buf, GST_BUFFER_FLAG_HEADER)=
;
> +-                      gst_buffer_fill (buf, 0, av1_data + 8, size);
> ++                      gst_buffer_fill (buf, 0, av1_data + 8, size - 8);
> +                       gst_caps_set_simple (entry->caps,
> +                           "codec_data", GST_TYPE_BUFFER, buf, NULL);
> +                       gst_buffer_unref (buf);
> +@@ -12930,8 +12892,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +                   break;
> +               }
> +
> +-              len -=3D size + 8;
> +-              av1_data +=3D size + 8;
> ++              len -=3D size;
> ++              av1_data +=3D size;
> +             }
> +
> +             break;
> +@@ -12942,29 +12904,18 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +              * vp08, vp09, and vp10 fourcc. */
> +           case FOURCC_vp09:
> +           {
> +-            guint len =3D QT_UINT32 (stsd_entry_data);
> ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> +             const guint8 *vpcc_data =3D stsd_entry_data + 0x56;
> +
> +             /* find vpcC */
> +-            while (len >=3D 0x8) {
> +-              guint size;
> +-
> +-              if (QT_UINT32 (vpcc_data) <=3D 0x8)
> +-                size =3D 0;
> +-              else if (QT_UINT32 (vpcc_data) <=3D len)
> +-                size =3D QT_UINT32 (vpcc_data) - 0x8;
> +-              else
> +-                size =3D len - 0x8;
> ++            while (len >=3D 8) {
> ++              guint32 size =3D QT_UINT32 (vpcc_data);
> +
> +-              /* No real data, so skip */
> +-              if (size < 1) {
> +-                len -=3D 8;
> +-                vpcc_data +=3D 8;
> +-                continue;
> +-              }
> ++              if (size < 8 || size > len)
> ++                break;
> +
> +-              switch (QT_FOURCC (vpcc_data + 0x4)) {
> ++              switch (QT_FOURCC (vpcc_data + 4)) {
> +                 case FOURCC_vpcC:
> +                 {
> +                   const gchar *profile_str =3D NULL;
> +@@ -12980,7 +12931,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +
> +                   /* the meaning of "size" is length of the atom body, =
excluding
> +                    * atom length and fourcc fields */
> +-                  if (size < 12)
> ++                  if (size < 8 + 12)
> +                     break;
> +
> +                   /* Content is:
> +@@ -13086,8 +13037,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +                   break;
> +               }
> +
> +-              len -=3D size + 8;
> +-              vpcc_data +=3D size + 8;
> ++              len -=3D size;
> ++              vpcc_data +=3D size;
> +             }
> +
> +             break;
> +@@ -13428,7 +13379,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +         }
> +         case FOURCC_wma_:
> +         {
> +-          guint len =3D QT_UINT32 (stsd_entry_data);
> ++          guint32 len =3D QT_UINT32 (stsd_entry_data);
> +           len =3D len <=3D offset ? 0 : len - offset;
> +           const guint8 *wfex_data =3D stsd_entry_data + offset;
> +           const gchar *codec_name =3D NULL;
> +@@ -13453,21 +13404,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +
> +           /* find wfex */
> +           while (len >=3D 8) {
> +-            guint size;
> ++            guint32 size =3D QT_UINT32 (wfex_data);
> +
> +-            if (QT_UINT32 (wfex_data) <=3D 0x8)
> +-              size =3D 0;
> +-            else if (QT_UINT32 (wfex_data) <=3D len)
> +-              size =3D QT_UINT32 (wfex_data) - 8;
> +-            else
> +-              size =3D len - 8;
> +-
> +-            /* No real data, so skip */
> +-            if (size < 1) {
> +-              len -=3D 8;
> +-              wfex_data +=3D 8;
> +-              continue;
> +-            }
> ++            if (size < 8 || size > len)
> ++              break;
> +
> +             switch (QT_FOURCC (wfex_data + 4)) {
> +               case GST_MAKE_FOURCC ('w', 'f', 'e', 'x'):
> +@@ -13512,12 +13452,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +                     "width", G_TYPE_INT, wfex.wBitsPerSample,
> +                     "depth", G_TYPE_INT, wfex.wBitsPerSample, NULL);
> +
> +-                if (size > wfex.cbSize) {
> ++                if (size > 8 + wfex.cbSize) {
> +                   GstBuffer *buf;
> +
> +-                  buf =3D gst_buffer_new_and_alloc (size - wfex.cbSize)=
;
> ++                  buf =3D gst_buffer_new_and_alloc (size - 8 - wfex.cbS=
ize);
> +                   gst_buffer_fill (buf, 0, wfex_data + 8 + wfex.cbSize,
> +-                      size - wfex.cbSize);
> ++                      size - 8 - wfex.cbSize);
> +                   gst_caps_set_simple (entry->caps,
> +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> +                   gst_buffer_unref (buf);
> +@@ -13534,8 +13474,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode =
* trak)
> +               default:
> +                 break;
> +             }
> +-            len -=3D size + 8;
> +-            wfex_data +=3D size + 8;
> ++            len -=3D size;
> ++            wfex_data +=3D size;
> +           }
> +           break;
> +         }
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0009-qtdemux-Fix-error-handling-when-parsing-cenc-sample-.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qtdemux-Fix-error-h=
andling-when-parsing-cenc-sample-.patch
> new file mode 100644
> index 0000000000..a84575199e
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qt=
demux-Fix-error-handling-when-parsing-cenc-sample-.patch
> @@ -0,0 +1,56 @@
> +From da3b4e903ae990193988a873368bdd1865350521 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Fri, 27 Sep 2024 09:47:50 +0300
> +Subject: [PATCH] qtdemux: Fix error handling when parsing cenc sample gr=
oups
> + fails
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-238, GHSL-2024-239, GHSL-2024-240
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3846
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8109>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/da3b4e903ae990193988a873368bdd1865350521]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 9 +++++++--
> + 1 file changed, 7 insertions(+), 2 deletions(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index 94ce75b2d42d..e7a79be45b29 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -11404,12 +11404,15 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e * trak)
> +       if (stream->subtype !=3D FOURCC_soun) {
> +         GST_ERROR_OBJECT (qtdemux,
> +             "Unexpeced stsd type 'aavd' outside 'soun' track");
> ++        goto corrupt_file;
> +       } else {
> +         /* encrypted audio with sound sample description v0 */
> +         GNode *enc =3D qtdemux_tree_get_child_by_type (stsd, fourcc);
> +         stream->protected =3D TRUE;
> +-        if (!qtdemux_parse_protection_aavd (qtdemux, stream, enc, &four=
cc))
> ++        if (!qtdemux_parse_protection_aavd (qtdemux, stream, enc, &four=
cc)) {
> +           GST_ERROR_OBJECT (qtdemux, "Failed to parse protection scheme=
 info");
> ++          goto corrupt_file;
> ++        }
> +       }
> +     }
> +
> +@@ -11418,8 +11421,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNode=
 * trak)
> +        * with the same type */
> +       GNode *enc =3D qtdemux_tree_get_child_by_type (stsd, fourcc);
> +       stream->protected =3D TRUE;
> +-      if (!qtdemux_parse_protection_scheme_info (qtdemux, stream, enc, =
&fourcc))
> ++      if (!qtdemux_parse_protection_scheme_info (qtdemux, stream, enc, =
&fourcc)) {
> +         GST_ERROR_OBJECT (qtdemux, "Failed to parse protection scheme i=
nfo");
> ++        goto corrupt_file;
> ++      }
> +     }
> +
> +     if (stream->subtype =3D=3D FOURCC_vide) {
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0010-qtdemux-Make-sure-there-are-enough-offsets-to-read-w.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qtdemux-Make-sure-t=
here-are-enough-offsets-to-read-w.patch
> new file mode 100644
> index 0000000000..af0d1ed633
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qt=
demux-Make-sure-there-are-enough-offsets-to-read-w.patch
> @@ -0,0 +1,49 @@
> +From 20503e5dd90e21ef170488b2a8b8529ae8a4cab9 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Fri, 27 Sep 2024 10:38:50 +0300
> +Subject: [PATCH] qtdemux: Make sure there are enough offsets to read whe=
n
> + parsing samples
> +
> +While this specific case is also caught when initializing co_chunk, the =
error
> +is ignored in various places and calling into the function would lead to=
 out of
> +bounds reads if the error message doesn't cause the pipeline to be shut =
down
> +fast enough.
> +
> +To avoid this, no matter what, make sure enough offsets are available wh=
en
> +parsing them. While this is potentially slower, the same is already done=
 in the
> +non-chunks_are_samples case.
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-245
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3847
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8109>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/20503e5dd90e21ef170488b2a8b8529ae8a4cab9]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index e7a79be45b29..5277952c5ea5 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -10070,9 +10070,9 @@ qtdemux_parse_samples (GstQTDemux * qtdemux, QtD=
emuxStream * stream, guint32 n)
> +           goto done;
> +         }
> +
> +-        cur->offset =3D
> +-            qt_atom_parser_get_offset_unchecked (&stream->co_chunk,
> +-            stream->co_size);
> ++        if (!qt_atom_parser_get_offset (&stream->co_chunk,
> ++                stream->co_size, &cur->offset))
> ++          goto corrupt_file;
> +
> +         GST_LOG_OBJECT (qtdemux, "Created entry %d with offset "
> +             "%" G_GUINT64_FORMAT, j, cur->offset);
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0011-qtdemux-Actually-handle-errors-returns-from-various-.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qtdemux-Actually-ha=
ndle-errors-returns-from-various-.patch
> new file mode 100644
> index 0000000000..c864deb635
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qt=
demux-Actually-handle-errors-returns-from-various-.patch
> @@ -0,0 +1,97 @@
> +From ed254790331a3fba2f68255a8f072552d622aac1 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Fri, 27 Sep 2024 10:39:30 +0300
> +Subject: [PATCH] qtdemux: Actually handle errors returns from various
> + functions instead of ignoring them
> +
> +Ignoring them might cause the element to continue as if all is fine desp=
ite the
> +internal state being inconsistent. This can lead to all kinds of follow-=
up
> +issues, including memory safety issues.
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-245
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3847
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8109>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/ed254790331a3fba2f68255a8f072552d622aac1]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 29 +++++++++++++++----
> + 1 file changed, 23 insertions(+), 6 deletions(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index 5277952c5ea5..1de70f184f50 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -4853,10 +4853,15 @@ gst_qtdemux_loop_state_header (GstQTDemux * qtde=
mux)
> + beach:
> +   if (ret =3D=3D GST_FLOW_EOS && (qtdemux->got_moov || qtdemux->media_c=
aps)) {
> +     /* digested all data, show what we have */
> +-    qtdemux_prepare_streams (qtdemux);
> ++    ret =3D qtdemux_prepare_streams (qtdemux);
> ++    if (ret !=3D GST_FLOW_OK)
> ++      return ret;
> ++
> +     QTDEMUX_EXPOSE_LOCK (qtdemux);
> +     ret =3D qtdemux_expose_streams (qtdemux);
> +     QTDEMUX_EXPOSE_UNLOCK (qtdemux);
> ++    if (ret !=3D GST_FLOW_OK)
> ++      return ret;
> +
> +     qtdemux->state =3D QTDEMUX_STATE_MOVIE;
> +     GST_DEBUG_OBJECT (qtdemux, "switching state to STATE_MOVIE (%d)",
> +@@ -7552,13 +7557,21 @@ gst_qtdemux_process_adapter (GstQTDemux * demux,=
 gboolean force)
> +             gst_qtdemux_stream_concat (demux,
> +                 demux->old_streams, demux->active_streams);
> +
> +-            qtdemux_parse_moov (demux, data, demux->neededbytes);
> ++            if (!qtdemux_parse_moov (demux, data, demux->neededbytes)) =
{
> ++              ret =3D GST_FLOW_ERROR;
> ++              break;
> ++            }
> +             qtdemux_node_dump (demux, demux->moov_node);
> +             qtdemux_parse_tree (demux);
> +-            qtdemux_prepare_streams (demux);
> ++            ret =3D qtdemux_prepare_streams (demux);
> ++            if (ret !=3D GST_FLOW_OK)
> ++              break;
> ++
> +             QTDEMUX_EXPOSE_LOCK (demux);
> +-            qtdemux_expose_streams (demux);
> ++            ret =3D qtdemux_expose_streams (demux);
> +             QTDEMUX_EXPOSE_UNLOCK (demux);
> ++            if (ret !=3D GST_FLOW_OK)
> ++              break;
> +
> +             demux->got_moov =3D TRUE;
> +
> +@@ -7649,8 +7662,10 @@ gst_qtdemux_process_adapter (GstQTDemux * demux, =
gboolean force)
> +             /* in MSS we need to expose the pads after the first moof a=
s we won't get a moov */
> +             if (demux->variant =3D=3D VARIANT_MSS_FRAGMENTED && !demux-=
>exposed) {
> +               QTDEMUX_EXPOSE_LOCK (demux);
> +-              qtdemux_expose_streams (demux);
> ++              ret =3D qtdemux_expose_streams (demux);
> +               QTDEMUX_EXPOSE_UNLOCK (demux);
> ++              if (ret !=3D GST_FLOW_OK)
> ++                goto done;
> +             }
> +
> +             gst_qtdemux_check_send_pending_segment (demux);
> +@@ -13764,8 +13779,10 @@ qtdemux_prepare_streams (GstQTDemux * qtdemux)
> +
> +     /* parse the initial sample for use in setting the frame rate cap *=
/
> +     while (sample_num =3D=3D 0 && sample_num < stream->n_samples) {
> +-      if (!qtdemux_parse_samples (qtdemux, stream, sample_num))
> ++      if (!qtdemux_parse_samples (qtdemux, stream, sample_num)) {
> ++        ret =3D GST_FLOW_ERROR;
> +         break;
> ++      }
> +       ++sample_num;
> +     }
> +   }
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch b/meta/reci=
pes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qtdemux-Check-for-i=
nvalid-atom-length-when-extractin.patch
> new file mode 100644
> index 0000000000..7096a75a71
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qt=
demux-Check-for-invalid-atom-length-when-extractin.patch
> @@ -0,0 +1,36 @@
> +From 3153fda823cb91b1031dae69738c6c5d526fb6e1 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Thu, 26 Sep 2024 19:16:19 +0300
> +Subject: [PATCH] qtdemux: Check for invalid atom length when extracting =
Closed
> + Caption data
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-243
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3849
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8109>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/3153fda823cb91b1031dae69738c6c5d526fb6e1]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index 1de70f184f50..8850d09321e8 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -5827,7 +5827,7 @@ extract_cc_from_data (QtDemuxStream * stream, cons=
t guint8 * data, gsize size,
> +     goto invalid_cdat;
> +   atom_length =3D QT_UINT32 (data);
> +   fourcc =3D QT_FOURCC (data + 4);
> +-  if (G_UNLIKELY (atom_length > size || atom_length =3D=3D 8))
> ++  if (G_UNLIKELY (atom_length > size || atom_length <=3D 8))
> +     goto invalid_cdat;
> +
> +   GST_DEBUG_OBJECT (stream->pad, "here");
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/=
0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch b/meta/recipes-=
multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qtdemux-Add-size-check-=
for-parsing-SMI-SEQH-atom.patch
> new file mode 100644
> index 0000000000..b379c2f88c
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qt=
demux-Add-size-check-for-parsing-SMI-SEQH-atom.patch
> @@ -0,0 +1,37 @@
> +From 3ce1b812a9531611288af286b5dc6631a11e3f4a Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricula=
r.com>
> +Date: Fri, 27 Sep 2024 00:31:36 +0300
> +Subject: [PATCH] qtdemux: Add size check for parsing SMI / SEQH atom
> +
> +Thanks to Antonio Morales for finding and reporting the issue.
> +
> +Fixes GHSL-2024-244
> +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3853
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/8109>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/3ce1b812a9531611288af286b5dc6631a11e3f4a]
> +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-202=
4-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subproj=
ects/gst-plugins-good/gst/isomp4/qtdemux.c
> +index 8850d09321e8..dc70287a8a9b 100644
> +--- a/gst/isomp4/qtdemux.c
> ++++ b/gst/isomp4/qtdemux.c
> +@@ -10633,8 +10633,9 @@ qtdemux_parse_svq3_stsd_data (GstQTDemux * qtdem=
ux,
> +                 GST_WARNING_OBJECT (qtdemux, "Unexpected second SEQH SM=
I atom "
> +                     " found, ignoring");
> +               } else {
> ++                /* Note: The size does *not* include the fourcc and the=
 size field itself */
> +                 seqh_size =3D QT_UINT32 (data + 4);
> +-                if (seqh_size > 0) {
> ++                if (seqh_size > 0 && seqh_size <=3D size - 8) {
> +                   _seqh =3D gst_buffer_new_and_alloc (seqh_size);
> +                   gst_buffer_fill (_seqh, 0, data + 8, seqh_size);
> +                 }
> +--
> +GitLab
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_=
1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.2=
0.7.bb
> index dfb0c0f342..5427cdb75d 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.=
bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.=
bb
> @@ -6,6 +6,19 @@ BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer=
/gst-plugins-good/-/issues
>
>  SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-=
plugins-good-${PV}.tar.xz \
>             file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gst=
glf.patch \
> +           file://0001-qtdemux-Skip-zero-sized-boxes-instead-of-stopping=
-to.patch \
> +           file://0002-qtdemux-Fix-integer-overflow-when-allocating-the-=
sam.patch \
> +           file://0003-qtdemux-Fix-debug-output-during-trun-parsing.patc=
h \
> +           file://0004-qtdemux-Don-t-iterate-over-all-trun-entries-if-no=
ne-.patch \
> +           file://0005-qtdemux-Check-sizes-of-stsc-stco-stts-before-tryi=
ng-.patch \
> +           file://0006-qtdemux-Make-sure-only-an-even-number-of-bytes-is=
-pr.patch \
> +           file://0007-qtdemux-Make-sure-enough-data-is-available-before=
-re.patch \
> +           file://0008-qtdemux-Fix-length-checks-and-offsets-in-stsd-ent=
ry-.patch \
> +           file://0009-qtdemux-Fix-error-handling-when-parsing-cenc-samp=
le-.patch \
> +           file://0010-qtdemux-Make-sure-there-are-enough-offsets-to-rea=
d-w.patch \
> +           file://0011-qtdemux-Actually-handle-errors-returns-from-vario=
us-.patch \
> +           file://0012-qtdemux-Check-for-invalid-atom-length-when-extrac=
tin.patch \
> +           file://0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.=
patch \
>             "
>
>  SRC_URI[sha256sum] =3D "599f093cc833a1e346939ab6e78a3f8046855b6da13520aa=
e80dd385434f4ab2"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209303): https://lists.openembedded.org/g/openembedde=
d-core/message/209303
> Mute This Topic: https://lists.openembedded.org/mt/110388307/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

