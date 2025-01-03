Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07755E77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 02:15:12 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.23020.1735870502965868441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 18:15:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=htDJaNBF;
 spf=pass (domain: mvista.com, ip: 209.85.208.46, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so15881903a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 18:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735870501; x=1736475301; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9Kvk8bcisDUYwPgbXO176nC/n/RI311r+W5LeQ95BE=;
        b=htDJaNBFnOlK6f7YM6sX27rJckVwynGsTBtckRITOWh0h4R0CyrqRDSIVbYD5mt5lv
         xAUkslN9cHxamyzHaGQNFdTQVgtvx7E+zdM6vS1VqyqibzH1qlQZ2BZXpNnwO0+Or9/0
         2HeadwxbXB9dTZCspqXtG3wO73pjo1DmEoTqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735870501; x=1736475301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9Kvk8bcisDUYwPgbXO176nC/n/RI311r+W5LeQ95BE=;
        b=a2hnvJjUHrjoDfOA4m0iPQOKieJCb79oBSQ8luGjmk7E17clHIfCdB48Ewj5/eKtDS
         jygt8T8vaWqSZ8UZjKJagfsvWPZitx7CkTHMvUjPhgni14+1fcc1fKlYm7ExDJf0O4yO
         bRziO3AX4MY1SKiNthNTmYw90ofzy14cwhEqQ0R7r1wYDiQboH6D3MKwQ9KWdleq/qhp
         6kArto7cubDQufK1Wdf40VkdSEr4s8zRH/Gi0V6ypiTWzr790ynhtEomUiGoCEgiJhA/
         X1QN6+pHWkHJ210g6o9+WYSf4UMpMXn3s8Y7NhJQ8UCxeKnUnbHdO7LdInPYct20AHO9
         Wfjg==
X-Gm-Message-State: AOJu0Yzc4KXad9vN3GmIKS6XEhhQgGwEPa2Pk6mdWcmbOYraA+9i0BkA
	ZE7RDYo4VP8mODWGOCE2Me1hysTa5ed/eIuMBWCBL+aj1ff2RRAPxkMghK5DIts1xQNABkWpgw+
	ijzW1vRp/+wuc99nSh049+KWy5VSPxaqsowmGpg==
X-Gm-Gg: ASbGncu7p98D2F+Hti7750TVvGIEPgkLXqGVOoxrOGBBiWRX+3o1g/xcmyktM2pZJZl
	XLMmswV2e3URlbYCYK9vvgKVlkwBRP79gEMifP5a9CY3mnHTBnQMPBNUZkt/ei0zwLXoEhNBm
X-Google-Smtp-Source: AGHT+IGSe+N6oV3LB7fYWUPzrOgWqLHXqWkDaRzjpMyfHyuAWsUJTPz6oTpEmC6jT9h8gBe9bVSNaYuaVklTBp70/Xo=
X-Received: by 2002:a05:6402:234a:b0:5d0:e877:764e with SMTP id
 4fb4d7f45d1cf-5d81ddfebaemr37024997a12.24.1735870500668; Thu, 02 Jan 2025
 18:15:00 -0800 (PST)
MIME-Version: 1.0
References: <20250102133318.642859-1-vanusuri@mvista.com> <CAOSpxdYWywz-GCboQu4q3vEhkFGn2skVhEzPdsB=kTtN0DoQzw@mail.gmail.com>
In-Reply-To: <CAOSpxdYWywz-GCboQu4q3vEhkFGn2skVhEzPdsB=kTtN0DoQzw@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 3 Jan 2025 07:44:48 +0530
Message-ID: <CANQUz1-HzBGUa2jRYM7tpf+Amo7WRkFNw8+Je1p1eao=ibB_9g@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/7] gstreamer1.0-plugins-good: fix
 several CVEs
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091ae78062ac3d807"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209313

--00000000000091ae78062ac3d807
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure why it is not applied cleanly. Previous patch set is for
gstreamer1.0-plugins-base. The 2nd patch set is for
gstreamer1.0-plugins-good.

As suggested above [1] & [2] , I will send out a V2 patch.

Thanks & Regards,
Vijay

On Thu, Jan 2, 2025 at 7:42=E2=80=AFPM Steve Sakoman <steve@sakoman.com> wr=
ote:

> Could you send a V2 with the following changes?
>
> 1. Please combine the series with  the previous gstreamer patch set
> you sent  -- this second series doesn't apply cleanly on top of those
> changes
> 2. Patch file names should reflect the CVE being fixed, e.g.
> CVE-2024-47537.patch
>
> Thanks!
>
> Steve
>
> On Thu, Jan 2, 2025 at 5:33=E2=80=AFAM Vijay Anusuri via
> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
> wrote:
> >
> > From: Vijay Anusuri <vanusuri@mvista.com>
> >
> > Fixes for below CVEs:
> > CVE-2024-47537
> > CVE-2024-47539
> > CVE-2024-47543
> > CVE-2024-47544
> > CVE-2024-47545
> > CVE-2024-47546
> > CVE-2024-47596
> > CVE-2024-47597
> > CVE-2024-47598
> >
> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > ---
> >  ...o-sized-boxes-instead-of-stopping-to.patch | 124 +++++
> >  ...ger-overflow-when-allocating-the-sam.patch |  64 +++
> >  ...Fix-debug-output-during-trun-parsing.patch |  73 +++
> >  ...erate-over-all-trun-entries-if-none-.patch |  36 ++
> >  ...zes-of-stsc-stco-stts-before-trying-.patch |  63 +++
> >  ...e-only-an-even-number-of-bytes-is-pr.patch |  44 ++
> >  ...e-enough-data-is-available-before-re.patch | 120 +++++
> >  ...th-checks-and-offsets-in-stsd-entry-.patch | 449 ++++++++++++++++++
> >  ...r-handling-when-parsing-cenc-sample-.patch |  56 +++
> >  ...e-there-are-enough-offsets-to-read-w.patch |  49 ++
> >  ...-handle-errors-returns-from-various-.patch |  97 ++++
> >  ...r-invalid-atom-length-when-extractin.patch |  36 ++
> >  ...size-check-for-parsing-SMI-SEQH-atom.patch |  37 ++
> >  .../gstreamer1.0-plugins-good_1.20.7.bb       |  13 +
> >  14 files changed, 1261 insertions(+)
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qtdemux-=
Skip-zero-sized-boxes-instead-of-stopping-to.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qtdemux-=
Fix-integer-overflow-when-allocating-the-sam.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-qtdemux-=
Fix-debug-output-during-trun-parsing.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qtdemux-=
Don-t-iterate-over-all-trun-entries-if-none-.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qtdemux-=
Check-sizes-of-stsc-stco-stts-before-trying-.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qtdemux-=
Make-sure-only-an-even-number-of-bytes-is-pr.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qtdemux-=
Make-sure-enough-data-is-available-before-re.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qtdemux-=
Fix-length-checks-and-offsets-in-stsd-entry-.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qtdemux-=
Fix-error-handling-when-parsing-cenc-sample-.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qtdemux-=
Make-sure-there-are-enough-offsets-to-read-w.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qtdemux-=
Actually-handle-errors-returns-from-various-.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qtdemux-=
Check-for-invalid-atom-length-when-extractin.patch
> >  create mode 100644
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qtdemux-=
Add-size-check-for-parsing-SMI-SEQH-atom.patch
> >
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qtdemu=
x-Skip-zero-sized-boxes-instead-of-stopping-to.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qtdemu=
x-Skip-zero-sized-boxes-instead-of-stopping-to.patch
> > new file mode 100644
> > index 0000000000..8af25e73fd
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qtdemu=
x-Skip-zero-sized-boxes-instead-of-stopping-to.patch
> > @@ -0,0 +1,124 @@
> > +From d4bab55077c6a77bd80cb12a8b0d28020ef412a9 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Tue, 24 Sep 2024 09:50:34 +0300
> > +Subject: [PATCH] qtdemux: Skip zero-sized boxes instead of stopping to
> look at
> > + further boxes
> > +
> > +A zero-sized box is not really a problem and can be skipped to look at
> any
> > +possibly following ones.
> > +
> > +BMD ATEM devices specifically write a zero-sized bmdc box in the sampl=
e
> > +description, followed by the avcC box in case of h264. Previously the
> avcC box
> > +would simply not be read at all and the file would be unplayable.
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7564>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/d4bab55077c6a=
77bd80cb12a8b0d28020ef412a9
> ]
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 54 ++++++++++++------=
-
> > + 1 file changed, 36 insertions(+), 18 deletions(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index 32df6eeb85c1..5e5c21758058 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -12226,9 +12226,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +               else
> > +                 size =3D len - 0x8;
> > +
> > +-              if (size < 1)
> > +-                /* No real data, so break out */
> > +-                break;
> > ++              /* No real data, so skip */
> > ++              if (size < 1) {
> > ++                len -=3D 8;
> > ++                avc_data +=3D 8;
> > ++                continue;
> > ++              }
> > +
> > +               switch (QT_FOURCC (avc_data + 0x4)) {
> > +                 case FOURCC_avcC:
> > +@@ -12343,9 +12346,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +               else
> > +                 size =3D len - 0x8;
> > +
> > +-              if (size < 1)
> > +-                /* No real data, so break out */
> > +-                break;
> > ++              /* No real data, so skip */
> > ++              if (size < 1) {
> > ++                len -=3D 8;
> > ++                hevc_data +=3D 8;
> > ++                continue;
> > ++              }
> > +
> > +               switch (QT_FOURCC (hevc_data + 0x4)) {
> > +                 case FOURCC_hvcC:
> > +@@ -12767,9 +12773,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +               else
> > +                 size =3D len - 8;
> > +
> > +-              if (size < 1)
> > +-                /* No real data, so break out */
> > +-                break;
> > ++              /* No real data, so skip */
> > ++              if (size < 1) {
> > ++                len -=3D 8;
> > ++                vc1_data +=3D 8;
> > ++                continue;
> > ++              }
> > +
> > +               switch (QT_FOURCC (vc1_data + 0x4)) {
> > +                 case GST_MAKE_FOURCC ('d', 'v', 'c', '1'):
> > +@@ -12809,9 +12818,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +               else
> > +                 size =3D len - 0x8;
> > +
> > +-              if (size < 1)
> > +-                /* No real data, so break out */
> > +-                break;
> > ++              /* No real data, so skip */
> > ++              if (size < 1) {
> > ++                len -=3D 8;
> > ++                av1_data +=3D 8;
> > ++                continue;
> > ++              }
> > +
> > +               switch (QT_FOURCC (av1_data + 0x4)) {
> > +                 case FOURCC_av1C:
> > +@@ -12919,9 +12931,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +               else
> > +                 size =3D len - 0x8;
> > +
> > +-              if (size < 1)
> > +-                /* No real data, so break out */
> > +-                break;
> > ++              /* No real data, so skip */
> > ++              if (size < 1) {
> > ++                len -=3D 8;
> > ++                vpcc_data +=3D 8;
> > ++                continue;
> > ++              }
> > +
> > +               switch (QT_FOURCC (vpcc_data + 0x4)) {
> > +                 case FOURCC_vpcC:
> > +@@ -13421,9 +13436,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +             else
> > +               size =3D len - 8;
> > +
> > +-            if (size < 1)
> > +-              /* No real data, so break out */
> > +-              break;
> > ++            /* No real data, so skip */
> > ++            if (size < 1) {
> > ++              len -=3D 8;
> > ++              wfex_data +=3D 8;
> > ++              continue;
> > ++            }
> > +
> > +             switch (QT_FOURCC (wfex_data + 4)) {
> > +               case GST_MAKE_FOURCC ('w', 'f', 'e', 'x'):
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qtdemu=
x-Fix-integer-overflow-when-allocating-the-sam.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qtdemu=
x-Fix-integer-overflow-when-allocating-the-sam.patch
> > new file mode 100644
> > index 0000000000..ded7e1b1c5
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qtdemu=
x-Fix-integer-overflow-when-allocating-the-sam.patch
> > @@ -0,0 +1,64 @@
> > +From c3a2af94c652513ac1b1858295688ac88c5cc737 Mon Sep 17 00:00:00 2001
> > +From: Antonio Morales <antonio-morales@github.com>
> > +Date: Thu, 26 Sep 2024 18:39:37 +0300
> > +Subject: [PATCH] qtdemux: Fix integer overflow when allocating the
> samples
> > + table for fragmented MP4
> > +
> > +This can lead to out of bounds writes and NULL pointer dereferences.
> > +
> > +Fixes GHSL-2024-094, GHSL-2024-237, GHSL-2024-241
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3839
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c3a2af94c6525=
13ac1b1858295688ac88c5cc737
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> > +CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597
> CVE-2024-47598
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 12 ++++++------
> > + 1 file changed, 6 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index de8fae8b02ee..2fb5b2b014db 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -3364,6 +3364,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux,
> GstByteReader * trun,
> > +   gint i;
> > +   guint8 *data;
> > +   guint entry_size, dur_offset, size_offset, flags_offset =3D 0,
> ct_offset =3D 0;
> > ++  guint new_n_samples;
> > +   QtDemuxSample *sample;
> > +   gboolean ismv =3D FALSE;
> > +   gint64 initial_offset;
> > +@@ -3475,14 +3476,13 @@ qtdemux_parse_trun (GstQTDemux * qtdemux,
> GstByteReader * trun,
> > +     goto fail;
> > +   data =3D (guint8 *) gst_byte_reader_peek_data_unchecked (trun);
> > +
> > +-  if (stream->n_samples + samples_count >=3D
> > +-      QTDEMUX_MAX_SAMPLE_INDEX_SIZE / sizeof (QtDemuxSample))
> > ++  if (!g_uint_checked_add (&new_n_samples, stream->n_samples,
> samples_count) ||
> > ++      new_n_samples >=3D QTDEMUX_MAX_SAMPLE_INDEX_SIZE / sizeof
> (QtDemuxSample))
> > +     goto index_too_big;
> > +
> > +   GST_DEBUG_OBJECT (qtdemux, "allocating n_samples %u * %u (%.2f MB)"=
,
> > +-      stream->n_samples + samples_count, (guint) sizeof
> (QtDemuxSample),
> > +-      (stream->n_samples + samples_count) *
> > +-      sizeof (QtDemuxSample) / (1024.0 * 1024.0));
> > ++      new_n_samples, (guint) sizeof (QtDemuxSample),
> > ++      (new_n_samples) * sizeof (QtDemuxSample) / (1024.0 * 1024.0));
> > +
> > +   /* create a new array of samples if it's the first sample parsed */
> > +   if (stream->n_samples =3D=3D 0) {
> > +@@ -3491,7 +3491,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux,
> GstByteReader * trun,
> > +     /* or try to reallocate it with space enough to insert the new
> samples */
> > +   } else
> > +     stream->samples =3D g_try_renew (QtDemuxSample, stream->samples,
> > +-        stream->n_samples + samples_count);
> > ++        new_n_samples);
> > +   if (stream->samples =3D=3D NULL)
> > +     goto out_of_memory;
> > +
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-qtdemu=
x-Fix-debug-output-during-trun-parsing.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-qtdemu=
x-Fix-debug-output-during-trun-parsing.patch
> > new file mode 100644
> > index 0000000000..8c17c548df
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003-qtdemu=
x-Fix-debug-output-during-trun-parsing.patch
> > @@ -0,0 +1,73 @@
> > +From 812f175c580a2e702581859fd481c8f51d633508 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Thu, 26 Sep 2024 18:40:56 +0300
> > +Subject: [PATCH] qtdemux: Fix debug output during trun parsing
> > +
> > +Various integers are unsigned so print them as such. Also print the
> actual
> > +allocation size if allocation fails, not only parts of it.
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/812f175c580a2=
e702581859fd481c8f51d633508
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + gst/isomp4/qtdemux.c | 17 +++++++++--------
> > + 1 file changed, 9 insertions(+), 8 deletions(-)
> > +
> > +diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c
> > +index e012ce1..0111912 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -3228,8 +3228,8 @@ qtdemux_parse_trun (GstQTDemux * qtdemux,
> GstByteReader * trun,
> > +   gint64 initial_offset;
> > +   gint32 min_ct =3D 0;
> > +
> > +-  GST_LOG_OBJECT (qtdemux, "parsing trun track-id %d; "
> > +-      "default dur %d, size %d, flags 0x%x, base offset %"
> G_GINT64_FORMAT ", "
> > ++  GST_LOG_OBJECT (qtdemux, "parsing trun track-id %u; "
> > ++      "default dur %u, size %u, flags 0x%x, base offset %"
> G_GINT64_FORMAT ", "
> > +       "decode ts %" G_GINT64_FORMAT, stream->track_id,
> d_sample_duration,
> > +       d_sample_size, d_sample_flags, *base_offset, decode_ts);
> > +
> > +@@ -3257,7 +3257,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux,
> GstByteReader * trun,
> > +     /* note this is really signed */
> > +     if (!gst_byte_reader_get_int32_be (trun, &data_offset))
> > +       goto fail;
> > +-    GST_LOG_OBJECT (qtdemux, "trun data offset %d", data_offset);
> > ++    GST_LOG_OBJECT (qtdemux, "trun data offset %u", data_offset);
> > +     /* default base offset =3D first byte of moof */
> > +     if (*base_offset =3D=3D -1) {
> > +       GST_LOG_OBJECT (qtdemux, "base_offset at moof");
> > +@@ -3279,7 +3279,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux,
> GstByteReader * trun,
> > +
> > +   GST_LOG_OBJECT (qtdemux, "running offset now %" G_GINT64_FORMAT,
> > +       *running_offset);
> > +-  GST_LOG_OBJECT (qtdemux, "trun offset %d, flags 0x%x, entries %d",
> > ++  GST_LOG_OBJECT (qtdemux, "trun offset %u, flags 0x%x, entries %u",
> > +       data_offset, flags, samples_count);
> > +
> > +   if (flags & TR_FIRST_SAMPLE_FLAGS) {
> > +@@ -3499,14 +3499,15 @@ fail:
> > +   }
> > + out_of_memory:
> > +   {
> > +-    GST_WARNING_OBJECT (qtdemux, "failed to allocate %d samples",
> > +-        stream->n_samples);
> > ++    GST_WARNING_OBJECT (qtdemux, "failed to allocate %u + %u samples"=
,
> > ++        stream->n_samples, samples_count);
> > +     return FALSE;
> > +   }
> > + index_too_big:
> > +   {
> > +-    GST_WARNING_OBJECT (qtdemux, "not allocating index of %d samples,
> would "
> > +-        "be larger than %uMB (broken file?)", stream->n_samples,
> > ++    GST_WARNING_OBJECT (qtdemux,
> > ++      "not allocating index of %u + %u samples, would "
> > ++        "be larger than %uMB (broken file?)", stream->n_samples,
> samples_count,
> > +         QTDEMUX_MAX_SAMPLE_INDEX_SIZE >> 20);
> > +     return FALSE;
> > +   }
> > +--
> > +2.25.1
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qtdemu=
x-Don-t-iterate-over-all-trun-entries-if-none-.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qtdemu=
x-Don-t-iterate-over-all-trun-entries-if-none-.patch
> > new file mode 100644
> > index 0000000000..217387a4cd
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qtdemu=
x-Don-t-iterate-over-all-trun-entries-if-none-.patch
> > @@ -0,0 +1,36 @@
> > +From eb7f9331c2294bc28a549b79c9f931c3e6c6bc44 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Thu, 26 Sep 2024 18:41:39 +0300
> > +Subject: [PATCH] qtdemux: Don't iterate over all trun entries if none
> of the
> > + flags are set
> > +
> > +Nothing would be printed anyway.
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/eb7f9331c2294=
bc28a549b79c9f931c3e6c6bc44
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c
> > +index 22da35e9e7ad..297b580ef038 100644
> > +--- a/gst/isomp4/qtdemux_dump.c
> > ++++ b/gst/isomp4/qtdemux_dump.c
> > +@@ -836,6 +836,11 @@ qtdemux_dump_trun (GstQTDemux * qtdemux,
> GstByteReader * data, int depth)
> > +     GST_LOG ("%*s    first-sample-flags: %u", depth, "",
> first_sample_flags);
> > +   }
> > +
> > ++  /* Nothing to print below */
> > ++  if ((flags & (TR_SAMPLE_DURATION | TR_SAMPLE_SIZE | TR_SAMPLE_FLAGS=
 |
> > ++              TR_COMPOSITION_TIME_OFFSETS)) =3D=3D 0)
> > ++    return TRUE;
> > ++
> > +   for (i =3D 0; i < samples_count; i++) {
> > +     if (flags & TR_SAMPLE_DURATION) {
> > +       if (!gst_byte_reader_get_uint32_be (data, &sample_duration))
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qtdemu=
x-Check-sizes-of-stsc-stco-stts-before-trying-.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qtdemu=
x-Check-sizes-of-stsc-stco-stts-before-trying-.patch
> > new file mode 100644
> > index 0000000000..8b5bddbf5b
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qtdemu=
x-Check-sizes-of-stsc-stco-stts-before-trying-.patch
> > @@ -0,0 +1,63 @@
> > +From 1def2965d8da8cc74ab0036d7f8d59e81e676cad Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Fri, 27 Sep 2024 15:50:54 +0300
> > +Subject: [PATCH] qtdemux: Check sizes of stsc/stco/stts before trying
> to merge
> > + entries
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-246
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3854
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1def2965d8da8=
cc74ab0036d7f8d59e81e676cad
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 22 ++++++++++++++++++=
+
> > + 1 file changed, 22 insertions(+)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index 0996292d0789..c14d939ee3c9 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -10033,6 +10033,21 @@ qtdemux_merge_sample_table (GstQTDemux *
> qtdemux, QtDemuxStream * stream)
> > +     return;
> > +   }
> > +
> > ++  if (gst_byte_reader_get_remaining (&stream->stts) < 8) {
> > ++    GST_DEBUG_OBJECT (qtdemux, "Too small stts");
> > ++    return;
> > ++  }
> > ++
> > ++  if (stream->stco.size < 8) {
> > ++    GST_DEBUG_OBJECT (qtdemux, "Too small stco");
> > ++    return;
> > ++  }
> > ++
> > ++  if (stream->n_samples_per_chunk =3D=3D 0) {
> > ++    GST_DEBUG_OBJECT (qtdemux, "No samples per chunk");
> > ++    return;
> > ++  }
> > ++
> > +   /* Parse the stts to get the sample duration and number of samples =
*/
> > +   gst_byte_reader_skip_unchecked (&stream->stts, 4);
> > +   stts_duration =3D gst_byte_reader_get_uint32_be_unchecked
> (&stream->stts);
> > +@@ -10044,6 +10059,13 @@ qtdemux_merge_sample_table (GstQTDemux *
> qtdemux, QtDemuxStream * stream)
> > +   GST_DEBUG_OBJECT (qtdemux, "sample_duration %d, num_chunks %u",
> stts_duration,
> > +       num_chunks);
> > +
> > ++  if (gst_byte_reader_get_remaining (&stream->stsc) <
> > ++      stream->n_samples_per_chunk * 3 * 4 +
> > ++      (stream->n_samples_per_chunk - 1) * 4) {
> > ++    GST_DEBUG_OBJECT (qtdemux, "Too small stsc");
> > ++    return;
> > ++  }
> > ++
> > +   /* Now parse stsc, convert chunks into single samples and generate =
a
> > +    * new stsc, stts and stsz from this information */
> > +   gst_byte_writer_init (&stsc);
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qtdemu=
x-Make-sure-only-an-even-number-of-bytes-is-pr.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qtdemu=
x-Make-sure-only-an-even-number-of-bytes-is-pr.patch
> > new file mode 100644
> > index 0000000000..02d9cb278c
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qtdemu=
x-Make-sure-only-an-even-number-of-bytes-is-pr.patch
> > @@ -0,0 +1,44 @@
> > +From 314945426c7105ad90f44a188037bc43bb3b0300 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Thu, 26 Sep 2024 09:20:28 +0300
> > +Subject: [PATCH] qtdemux: Make sure only an even number of bytes is
> processed
> > + when handling CEA608 data
> > +
> > +An odd number of bytes would lead to out of bound reads and writes, an=
d
> doesn't
> > +make any sense as CEA608 comes in byte pairs.
> > +
> > +Strip off any leftover bytes and assume everything before that is vali=
d.
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-195
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3841
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/314945426c710=
5ad90f44a188037bc43bb3b0300
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 5 +++++
> > + 1 file changed, 5 insertions(+)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index c14d939ee3c9..b9f466991adf 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -6145,6 +6145,11 @@ convert_to_s334_1a (const guint8 * ccpair,
> guint8 ccpair_size, guint field,
> > +   guint8 *storage;
> > +   gsize i;
> > +
> > ++  /* Strip off any leftover odd bytes and assume everything before is
> valid */
> > ++  if (ccpair_size % 2 !=3D 0) {
> > ++    ccpair_size -=3D 1;
> > ++  }
> > ++
> > +   /* We are converting from pairs to triplets */
> > +   *res =3D ccpair_size / 2 * 3;
> > +   storage =3D g_malloc (*res);
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qtdemu=
x-Make-sure-enough-data-is-available-before-re.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qtdemu=
x-Make-sure-enough-data-is-available-before-re.patch
> > new file mode 100644
> > index 0000000000..5ff18baa7e
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qtdemu=
x-Make-sure-enough-data-is-available-before-re.patch
> > @@ -0,0 +1,120 @@
> > +From 8ef08a7a41da987aa630082df355ea651aa09132 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Thu, 26 Sep 2024 14:17:02 +0300
> > +Subject: [PATCH] qtdemux: Make sure enough data is available before
> reading
> > + wave header node
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-236
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3843
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/8ef08a7a41da9=
87aa630082df355ea651aa09132
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 84 ++++++++++--------=
-
> > + 1 file changed, 45 insertions(+), 39 deletions(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index b9f466991adf..55ba59152c7a 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -13697,47 +13697,53 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +         } else {
> > +           guint32 datalen =3D QT_UINT32 (stsd_entry_data + offset + 1=
6);
> > +           const guint8 *data =3D stsd_entry_data + offset + 16;
> > +-          GNode *wavenode;
> > +-          GNode *waveheadernode;
> > +-
> > +-          wavenode =3D g_node_new ((guint8 *) data);
> > +-          if (qtdemux_parse_node (qtdemux, wavenode, data, datalen)) =
{
> > +-            const guint8 *waveheader;
> > +-            guint32 headerlen;
> > +-
> > +-            waveheadernode =3D qtdemux_tree_get_child_by_type (waveno=
de,
> fourcc);
> > +-            if (waveheadernode) {
> > +-              waveheader =3D (const guint8 *) waveheadernode->data;
> > +-              headerlen =3D QT_UINT32 (waveheader);
> > +-
> > +-              if (headerlen > 8) {
> > +-                gst_riff_strf_auds *header =3D NULL;
> > +-                GstBuffer *headerbuf;
> > +-                GstBuffer *extra;
> > +-
> > +-                waveheader +=3D 8;
> > +-                headerlen -=3D 8;
> > +-
> > +-                headerbuf =3D gst_buffer_new_and_alloc (headerlen);
> > +-                gst_buffer_fill (headerbuf, 0, waveheader, headerlen)=
;
> > +-
> > +-                if (gst_riff_parse_strf_auds (GST_ELEMENT_CAST
> (qtdemux),
> > +-                        headerbuf, &header, &extra)) {
> > +-                  gst_caps_unref (entry->caps);
> > +-                  /* FIXME: Need to do something with the channel
> reorder map */
> > +-                  entry->caps =3D
> > +-                      gst_riff_create_audio_caps (header->format,
> NULL, header,
> > +-                      extra, NULL, NULL, NULL);
> > +-
> > +-                  if (extra)
> > +-                    gst_buffer_unref (extra);
> > +-                  g_free (header);
> > ++
> > ++          if (len < datalen || len - datalen < offset + 16) {
> > ++            GST_WARNING_OBJECT (qtdemux, "Not enough data for
> waveheadernode");
> > ++          } else {
> > ++            GNode *wavenode;
> > ++            GNode *waveheadernode;
> > ++
> > ++            wavenode =3D g_node_new ((guint8 *) data);
> > ++            if (qtdemux_parse_node (qtdemux, wavenode, data, datalen)=
)
> {
> > ++              const guint8 *waveheader;
> > ++              guint32 headerlen;
> > ++
> > ++              waveheadernode =3D
> > ++                  qtdemux_tree_get_child_by_type (wavenode, fourcc);
> > ++              if (waveheadernode) {
> > ++                waveheader =3D (const guint8 *) waveheadernode->data;
> > ++                headerlen =3D QT_UINT32 (waveheader);
> > ++
> > ++                if (headerlen > 8) {
> > ++                  gst_riff_strf_auds *header =3D NULL;
> > ++                  GstBuffer *headerbuf;
> > ++                  GstBuffer *extra;
> > ++
> > ++                  waveheader +=3D 8;
> > ++                  headerlen -=3D 8;
> > ++
> > ++                  headerbuf =3D gst_buffer_new_and_alloc (headerlen);
> > ++                  gst_buffer_fill (headerbuf, 0, waveheader,
> headerlen);
> > ++
> > ++                  if (gst_riff_parse_strf_auds (GST_ELEMENT_CAST
> (qtdemux),
> > ++                          headerbuf, &header, &extra)) {
> > ++                    gst_caps_unref (entry->caps);
> > ++                    /* FIXME: Need to do something with the channel
> reorder map */
> > ++                    entry->caps =3D
> > ++                        gst_riff_create_audio_caps (header->format,
> NULL,
> > ++                        header, extra, NULL, NULL, NULL);
> > ++
> > ++                    if (extra)
> > ++                      gst_buffer_unref (extra);
> > ++                    g_free (header);
> > ++                  }
> > +                 }
> > +-              }
> > +-            } else
> > +-              GST_DEBUG ("Didn't find waveheadernode for this codec")=
;
> > ++              } else
> > ++                GST_DEBUG ("Didn't find waveheadernode for this
> codec");
> > ++            }
> > ++            g_node_destroy (wavenode);
> > +           }
> > +-          g_node_destroy (wavenode);
> > +         }
> > +       } else if (esds) {
> > +         gst_qtdemux_handle_esds (qtdemux, stream, entry, esds,
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qtdemu=
x-Fix-length-checks-and-offsets-in-stsd-entry-.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qtdemu=
x-Fix-length-checks-and-offsets-in-stsd-entry-.patch
> > new file mode 100644
> > index 0000000000..41cf4c7d00
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qtdemu=
x-Fix-length-checks-and-offsets-in-stsd-entry-.patch
> > @@ -0,0 +1,449 @@
> > +From fe9d5d37234aca04fef7248184177168905a7a69 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Fri, 27 Sep 2024 00:12:57 +0300
> > +Subject: [PATCH] qtdemux: Fix length checks and offsets in stsd entry
> parsing
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-242
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3845
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/fe9d5d37234ac=
a04fef7248184177168905a7a69
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 218 +++++++----------=
-
> > + 1 file changed, 79 insertions(+), 139 deletions(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index 55ba59152c7a..fb157552eb75 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -12237,43 +12237,35 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +           case FOURCC_avc1:
> > +           case FOURCC_avc3:
> > +           {
> > +-            guint len =3D QT_UINT32 (stsd_entry_data);
> > ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> > +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> > +             const guint8 *avc_data =3D stsd_entry_data + 0x56;
> > +
> > +             /* find avcC */
> > +-            while (len >=3D 0x8) {
> > +-              guint size;
> > +-
> > +-              if (QT_UINT32 (avc_data) <=3D 0x8)
> > +-                size =3D 0;
> > +-              else if (QT_UINT32 (avc_data) <=3D len)
> > +-                size =3D QT_UINT32 (avc_data) - 0x8;
> > +-              else
> > +-                size =3D len - 0x8;
> > ++            while (len >=3D 8) {
> > ++              guint32 size =3D QT_UINT32 (avc_data);
> > +
> > +-              /* No real data, so skip */
> > +-              if (size < 1) {
> > +-                len -=3D 8;
> > +-                avc_data +=3D 8;
> > +-                continue;
> > +-              }
> > ++              if (size < 8 || size > len)
> > ++                break;
> > +
> > +-              switch (QT_FOURCC (avc_data + 0x4)) {
> > ++              switch (QT_FOURCC (avc_data + 4)) {
> > +                 case FOURCC_avcC:
> > +                 {
> > +                   /* parse, if found */
> > +                   GstBuffer *buf;
> > +
> > ++                  if (size < 8 + 1)
> > ++                    break;
> > ++
> > +                   GST_DEBUG_OBJECT (qtdemux, "found avcC codec_data i=
n
> stsd");
> > +
> > +                   /* First 4 bytes are the length of the atom, the
> next 4 bytes
> > +                    * are the fourcc, the next 1 byte is the version,
> and the
> > +                    * subsequent bytes are profile_tier_level structur=
e
> like data. */
> > +                   gst_codec_utils_h264_caps_set_level_and_profile
> (entry->caps,
> > +-                      avc_data + 8 + 1, size - 1);
> > +-                  buf =3D gst_buffer_new_and_alloc (size);
> > +-                  gst_buffer_fill (buf, 0, avc_data + 0x8, size);
> > ++                      avc_data + 8 + 1, size - 8 - 1);
> > ++                  buf =3D gst_buffer_new_and_alloc (size - 8);
> > ++                  gst_buffer_fill (buf, 0, avc_data + 8, size - 8);
> > +                   gst_caps_set_simple (entry->caps,
> > +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> > +                   gst_buffer_unref (buf);
> > +@@ -12284,6 +12276,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +                 {
> > +                   GstBuffer *buf;
> > +
> > ++                  if (size < 8 + 40 + 1)
> > ++                    break;
> > ++
> > +                   GST_DEBUG_OBJECT (qtdemux, "found strf codec_data i=
n
> stsd");
> > +
> > +                   /* First 4 bytes are the length of the atom, the
> next 4 bytes
> > +@@ -12291,17 +12286,14 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +                    * next 1 byte is the version, and the
> > +                    * subsequent bytes are sequence parameter set like
> data. */
> > +
> > +-                  size -=3D 40;   /* we'll be skipping BITMAPINFOHEAD=
ER
> */
> > +-                  if (size > 1) {
> > +-                    gst_codec_utils_h264_caps_set_level_and_profile
> > +-                        (entry->caps, avc_data + 8 + 40 + 1, size - 1=
);
> > ++                  gst_codec_utils_h264_caps_set_level_and_profile
> > ++                      (entry->caps, avc_data + 8 + 40 + 1, size - 8 -
> 40 - 1);
> > +
> > +-                    buf =3D gst_buffer_new_and_alloc (size);
> > +-                    gst_buffer_fill (buf, 0, avc_data + 8 + 40, size)=
;
> > +-                    gst_caps_set_simple (entry->caps,
> > +-                        "codec_data", GST_TYPE_BUFFER, buf, NULL);
> > +-                    gst_buffer_unref (buf);
> > +-                  }
> > ++                  buf =3D gst_buffer_new_and_alloc (size - 8 - 40);
> > ++                  gst_buffer_fill (buf, 0, avc_data + 8 + 40, size - =
8
> - 40);
> > ++                  gst_caps_set_simple (entry->caps,
> > ++                      "codec_data", GST_TYPE_BUFFER, buf, NULL);
> > ++                  gst_buffer_unref (buf);
> > +                   break;
> > +                 }
> > +                 case FOURCC_btrt:
> > +@@ -12309,11 +12301,11 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +                   guint avg_bitrate, max_bitrate;
> > +
> > +                   /* bufferSizeDB, maxBitrate and avgBitrate - 4 byte=
s
> each */
> > +-                  if (size < 12)
> > ++                  if (size < 8 + 12)
> > +                     break;
> > +
> > +-                  max_bitrate =3D QT_UINT32 (avc_data + 0xc);
> > +-                  avg_bitrate =3D QT_UINT32 (avc_data + 0x10);
> > ++                  max_bitrate =3D QT_UINT32 (avc_data + 8 + 4);
> > ++                  avg_bitrate =3D QT_UINT32 (avc_data + 8 + 8);
> > +
> > +                   if (!max_bitrate && !avg_bitrate)
> > +                     break;
> > +@@ -12345,8 +12337,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +                   break;
> > +               }
> > +
> > +-              len -=3D size + 8;
> > +-              avc_data +=3D size + 8;
> > ++              len -=3D size;
> > ++              avc_data +=3D size;
> > +             }
> > +
> > +             break;
> > +@@ -12357,44 +12349,36 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +           case FOURCC_dvh1:
> > +           case FOURCC_dvhe:
> > +           {
> > +-            guint len =3D QT_UINT32 (stsd_entry_data);
> > ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> > +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> > +             const guint8 *hevc_data =3D stsd_entry_data + 0x56;
> > +
> > +             /* find hevc */
> > +-            while (len >=3D 0x8) {
> > +-              guint size;
> > +-
> > +-              if (QT_UINT32 (hevc_data) <=3D 0x8)
> > +-                size =3D 0;
> > +-              else if (QT_UINT32 (hevc_data) <=3D len)
> > +-                size =3D QT_UINT32 (hevc_data) - 0x8;
> > +-              else
> > +-                size =3D len - 0x8;
> > ++            while (len >=3D 8) {
> > ++              guint32 size =3D QT_UINT32 (hevc_data);
> > +
> > +-              /* No real data, so skip */
> > +-              if (size < 1) {
> > +-                len -=3D 8;
> > +-                hevc_data +=3D 8;
> > +-                continue;
> > +-              }
> > ++              if (size < 8 || size > len)
> > ++                break;
> > +
> > +-              switch (QT_FOURCC (hevc_data + 0x4)) {
> > ++              switch (QT_FOURCC (hevc_data + 4)) {
> > +                 case FOURCC_hvcC:
> > +                 {
> > +                   /* parse, if found */
> > +                   GstBuffer *buf;
> > +
> > ++                  if (size < 8 + 1)
> > ++                    break;
> > ++
> > +                   GST_DEBUG_OBJECT (qtdemux, "found hvcC codec_data i=
n
> stsd");
> > +
> > +                   /* First 4 bytes are the length of the atom, the
> next 4 bytes
> > +                    * are the fourcc, the next 1 byte is the version,
> and the
> > +                    * subsequent bytes are sequence parameter set like
> data. */
> > +                   gst_codec_utils_h265_caps_set_level_tier_and_profil=
e
> > +-                      (entry->caps, hevc_data + 8 + 1, size - 1);
> > ++                      (entry->caps, hevc_data + 8 + 1, size - 8 - 1);
> > +
> > +-                  buf =3D gst_buffer_new_and_alloc (size);
> > +-                  gst_buffer_fill (buf, 0, hevc_data + 0x8, size);
> > ++                  buf =3D gst_buffer_new_and_alloc (size - 8);
> > ++                  gst_buffer_fill (buf, 0, hevc_data + 8, size - 8);
> > +                   gst_caps_set_simple (entry->caps,
> > +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> > +                   gst_buffer_unref (buf);
> > +@@ -12403,8 +12387,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +                 default:
> > +                   break;
> > +               }
> > +-              len -=3D size + 8;
> > +-              hevc_data +=3D size + 8;
> > ++              len -=3D size;
> > ++              hevc_data +=3D size;
> > +             }
> > +             break;
> > +           }
> > +@@ -12784,36 +12768,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +           }
> > +           case FOURCC_vc_1:
> > +           {
> > +-            guint len =3D QT_UINT32 (stsd_entry_data);
> > ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> > +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> > +             const guint8 *vc1_data =3D stsd_entry_data + 0x56;
> > +
> > +             /* find dvc1 */
> > +             while (len >=3D 8) {
> > +-              guint size;
> > +-
> > +-              if (QT_UINT32 (vc1_data) <=3D 8)
> > +-                size =3D 0;
> > +-              else if (QT_UINT32 (vc1_data) <=3D len)
> > +-                size =3D QT_UINT32 (vc1_data) - 8;
> > +-              else
> > +-                size =3D len - 8;
> > ++              guint32 size =3D QT_UINT32 (vc1_data);
> > +
> > +-              /* No real data, so skip */
> > +-              if (size < 1) {
> > +-                len -=3D 8;
> > +-                vc1_data +=3D 8;
> > +-                continue;
> > +-              }
> > ++              if (size < 8 || size > len)
> > ++                break;
> > +
> > +-              switch (QT_FOURCC (vc1_data + 0x4)) {
> > ++              switch (QT_FOURCC (vc1_data + 4)) {
> > +                 case GST_MAKE_FOURCC ('d', 'v', 'c', '1'):
> > +                 {
> > +                   GstBuffer *buf;
> > +
> > +                   GST_DEBUG_OBJECT (qtdemux, "found dvc1 codec_data i=
n
> stsd");
> > +-                  buf =3D gst_buffer_new_and_alloc (size);
> > +-                  gst_buffer_fill (buf, 0, vc1_data + 8, size);
> > ++                  buf =3D gst_buffer_new_and_alloc (size - 8);
> > ++                  gst_buffer_fill (buf, 0, vc1_data + 8, size - 8);
> > +                   gst_caps_set_simple (entry->caps,
> > +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> > +                   gst_buffer_unref (buf);
> > +@@ -12822,36 +12795,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +                 default:
> > +                   break;
> > +               }
> > +-              len -=3D size + 8;
> > +-              vc1_data +=3D size + 8;
> > ++              len -=3D size;
> > ++              vc1_data +=3D size;
> > +             }
> > +             break;
> > +           }
> > +           case FOURCC_av01:
> > +           {
> > +-            guint len =3D QT_UINT32 (stsd_entry_data);
> > ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> > +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> > +             const guint8 *av1_data =3D stsd_entry_data + 0x56;
> > +
> > +             /* find av1C */
> > +-            while (len >=3D 0x8) {
> > +-              guint size;
> > +-
> > +-              if (QT_UINT32 (av1_data) <=3D 0x8)
> > +-                size =3D 0;
> > +-              else if (QT_UINT32 (av1_data) <=3D len)
> > +-                size =3D QT_UINT32 (av1_data) - 0x8;
> > +-              else
> > +-                size =3D len - 0x8;
> > ++            while (len >=3D 8) {
> > ++              guint32 size =3D QT_UINT32 (av1_data);
> > +
> > +-              /* No real data, so skip */
> > +-              if (size < 1) {
> > +-                len -=3D 8;
> > +-                av1_data +=3D 8;
> > +-                continue;
> > +-              }
> > ++              if (size < 8 || size > len)
> > ++                break;
> > +
> > +-              switch (QT_FOURCC (av1_data + 0x4)) {
> > ++              switch (QT_FOURCC (av1_data + 4)) {
> > +                 case FOURCC_av1C:
> > +                 {
> > +                   /* parse, if found */
> > +@@ -12861,7 +12823,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +                       "found av1C codec_data in stsd of size %d",
> size);
> > +
> > +                   /* not enough data, just ignore and hope for the
> best */
> > +-                  if (size < 4)
> > ++                  if (size < 8 + 4)
> > +                     break;
> > +
> > +                   /* Content is:
> > +@@ -12910,9 +12872,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +                             (gint) (pres_delay_field & 0x0F) + 1,
> NULL);
> > +                       }
> > +
> > +-                      buf =3D gst_buffer_new_and_alloc (size);
> > ++                      buf =3D gst_buffer_new_and_alloc (size - 8);
> > +                       GST_BUFFER_FLAG_SET (buf,
> GST_BUFFER_FLAG_HEADER);
> > +-                      gst_buffer_fill (buf, 0, av1_data + 8, size);
> > ++                      gst_buffer_fill (buf, 0, av1_data + 8, size - 8=
);
> > +                       gst_caps_set_simple (entry->caps,
> > +                           "codec_data", GST_TYPE_BUFFER, buf, NULL);
> > +                       gst_buffer_unref (buf);
> > +@@ -12930,8 +12892,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +                   break;
> > +               }
> > +
> > +-              len -=3D size + 8;
> > +-              av1_data +=3D size + 8;
> > ++              len -=3D size;
> > ++              av1_data +=3D size;
> > +             }
> > +
> > +             break;
> > +@@ -12942,29 +12904,18 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +              * vp08, vp09, and vp10 fourcc. */
> > +           case FOURCC_vp09:
> > +           {
> > +-            guint len =3D QT_UINT32 (stsd_entry_data);
> > ++            guint32 len =3D QT_UINT32 (stsd_entry_data);
> > +             len =3D len <=3D 0x56 ? 0 : len - 0x56;
> > +             const guint8 *vpcc_data =3D stsd_entry_data + 0x56;
> > +
> > +             /* find vpcC */
> > +-            while (len >=3D 0x8) {
> > +-              guint size;
> > +-
> > +-              if (QT_UINT32 (vpcc_data) <=3D 0x8)
> > +-                size =3D 0;
> > +-              else if (QT_UINT32 (vpcc_data) <=3D len)
> > +-                size =3D QT_UINT32 (vpcc_data) - 0x8;
> > +-              else
> > +-                size =3D len - 0x8;
> > ++            while (len >=3D 8) {
> > ++              guint32 size =3D QT_UINT32 (vpcc_data);
> > +
> > +-              /* No real data, so skip */
> > +-              if (size < 1) {
> > +-                len -=3D 8;
> > +-                vpcc_data +=3D 8;
> > +-                continue;
> > +-              }
> > ++              if (size < 8 || size > len)
> > ++                break;
> > +
> > +-              switch (QT_FOURCC (vpcc_data + 0x4)) {
> > ++              switch (QT_FOURCC (vpcc_data + 4)) {
> > +                 case FOURCC_vpcC:
> > +                 {
> > +                   const gchar *profile_str =3D NULL;
> > +@@ -12980,7 +12931,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +
> > +                   /* the meaning of "size" is length of the atom body=
,
> excluding
> > +                    * atom length and fourcc fields */
> > +-                  if (size < 12)
> > ++                  if (size < 8 + 12)
> > +                     break;
> > +
> > +                   /* Content is:
> > +@@ -13086,8 +13037,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +                   break;
> > +               }
> > +
> > +-              len -=3D size + 8;
> > +-              vpcc_data +=3D size + 8;
> > ++              len -=3D size;
> > ++              vpcc_data +=3D size;
> > +             }
> > +
> > +             break;
> > +@@ -13428,7 +13379,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +         }
> > +         case FOURCC_wma_:
> > +         {
> > +-          guint len =3D QT_UINT32 (stsd_entry_data);
> > ++          guint32 len =3D QT_UINT32 (stsd_entry_data);
> > +           len =3D len <=3D offset ? 0 : len - offset;
> > +           const guint8 *wfex_data =3D stsd_entry_data + offset;
> > +           const gchar *codec_name =3D NULL;
> > +@@ -13453,21 +13404,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +
> > +           /* find wfex */
> > +           while (len >=3D 8) {
> > +-            guint size;
> > ++            guint32 size =3D QT_UINT32 (wfex_data);
> > +
> > +-            if (QT_UINT32 (wfex_data) <=3D 0x8)
> > +-              size =3D 0;
> > +-            else if (QT_UINT32 (wfex_data) <=3D len)
> > +-              size =3D QT_UINT32 (wfex_data) - 8;
> > +-            else
> > +-              size =3D len - 8;
> > +-
> > +-            /* No real data, so skip */
> > +-            if (size < 1) {
> > +-              len -=3D 8;
> > +-              wfex_data +=3D 8;
> > +-              continue;
> > +-            }
> > ++            if (size < 8 || size > len)
> > ++              break;
> > +
> > +             switch (QT_FOURCC (wfex_data + 4)) {
> > +               case GST_MAKE_FOURCC ('w', 'f', 'e', 'x'):
> > +@@ -13512,12 +13452,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +                     "width", G_TYPE_INT, wfex.wBitsPerSample,
> > +                     "depth", G_TYPE_INT, wfex.wBitsPerSample, NULL);
> > +
> > +-                if (size > wfex.cbSize) {
> > ++                if (size > 8 + wfex.cbSize) {
> > +                   GstBuffer *buf;
> > +
> > +-                  buf =3D gst_buffer_new_and_alloc (size - wfex.cbSiz=
e);
> > ++                  buf =3D gst_buffer_new_and_alloc (size - 8 -
> wfex.cbSize);
> > +                   gst_buffer_fill (buf, 0, wfex_data + 8 + wfex.cbSiz=
e,
> > +-                      size - wfex.cbSize);
> > ++                      size - 8 - wfex.cbSize);
> > +                   gst_caps_set_simple (entry->caps,
> > +                       "codec_data", GST_TYPE_BUFFER, buf, NULL);
> > +                   gst_buffer_unref (buf);
> > +@@ -13534,8 +13474,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNod=
e
> * trak)
> > +               default:
> > +                 break;
> > +             }
> > +-            len -=3D size + 8;
> > +-            wfex_data +=3D size + 8;
> > ++            len -=3D size;
> > ++            wfex_data +=3D size;
> > +           }
> > +           break;
> > +         }
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qtdemu=
x-Fix-error-handling-when-parsing-cenc-sample-.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qtdemu=
x-Fix-error-handling-when-parsing-cenc-sample-.patch
> > new file mode 100644
> > index 0000000000..a84575199e
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qtdemu=
x-Fix-error-handling-when-parsing-cenc-sample-.patch
> > @@ -0,0 +1,56 @@
> > +From da3b4e903ae990193988a873368bdd1865350521 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Fri, 27 Sep 2024 09:47:50 +0300
> > +Subject: [PATCH] qtdemux: Fix error handling when parsing cenc sample
> groups
> > + fails
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-238, GHSL-2024-239, GHSL-2024-240
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3846
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/da3b4e903ae99=
0193988a873368bdd1865350521
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 9 +++++++--
> > + 1 file changed, 7 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index 94ce75b2d42d..e7a79be45b29 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -11404,12 +11404,15 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +       if (stream->subtype !=3D FOURCC_soun) {
> > +         GST_ERROR_OBJECT (qtdemux,
> > +             "Unexpeced stsd type 'aavd' outside 'soun' track");
> > ++        goto corrupt_file;
> > +       } else {
> > +         /* encrypted audio with sound sample description v0 */
> > +         GNode *enc =3D qtdemux_tree_get_child_by_type (stsd, fourcc);
> > +         stream->protected =3D TRUE;
> > +-        if (!qtdemux_parse_protection_aavd (qtdemux, stream, enc,
> &fourcc))
> > ++        if (!qtdemux_parse_protection_aavd (qtdemux, stream, enc,
> &fourcc)) {
> > +           GST_ERROR_OBJECT (qtdemux, "Failed to parse protection
> scheme info");
> > ++          goto corrupt_file;
> > ++        }
> > +       }
> > +     }
> > +
> > +@@ -11418,8 +11421,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux,
> GNode * trak)
> > +        * with the same type */
> > +       GNode *enc =3D qtdemux_tree_get_child_by_type (stsd, fourcc);
> > +       stream->protected =3D TRUE;
> > +-      if (!qtdemux_parse_protection_scheme_info (qtdemux, stream, enc=
,
> &fourcc))
> > ++      if (!qtdemux_parse_protection_scheme_info (qtdemux, stream, enc=
,
> &fourcc)) {
> > +         GST_ERROR_OBJECT (qtdemux, "Failed to parse protection scheme
> info");
> > ++        goto corrupt_file;
> > ++      }
> > +     }
> > +
> > +     if (stream->subtype =3D=3D FOURCC_vide) {
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qtdemu=
x-Make-sure-there-are-enough-offsets-to-read-w.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qtdemu=
x-Make-sure-there-are-enough-offsets-to-read-w.patch
> > new file mode 100644
> > index 0000000000..af0d1ed633
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qtdemu=
x-Make-sure-there-are-enough-offsets-to-read-w.patch
> > @@ -0,0 +1,49 @@
> > +From 20503e5dd90e21ef170488b2a8b8529ae8a4cab9 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Fri, 27 Sep 2024 10:38:50 +0300
> > +Subject: [PATCH] qtdemux: Make sure there are enough offsets to read
> when
> > + parsing samples
> > +
> > +While this specific case is also caught when initializing co_chunk, th=
e
> error
> > +is ignored in various places and calling into the function would lead
> to out of
> > +bounds reads if the error message doesn't cause the pipeline to be shu=
t
> down
> > +fast enough.
> > +
> > +To avoid this, no matter what, make sure enough offsets are available
> when
> > +parsing them. While this is potentially slower, the same is already
> done in the
> > +non-chunks_are_samples case.
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-245
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3847
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/20503e5dd90e2=
1ef170488b2a8b8529ae8a4cab9
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 6 +++---
> > + 1 file changed, 3 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index e7a79be45b29..5277952c5ea5 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -10070,9 +10070,9 @@ qtdemux_parse_samples (GstQTDemux * qtdemux,
> QtDemuxStream * stream, guint32 n)
> > +           goto done;
> > +         }
> > +
> > +-        cur->offset =3D
> > +-            qt_atom_parser_get_offset_unchecked (&stream->co_chunk,
> > +-            stream->co_size);
> > ++        if (!qt_atom_parser_get_offset (&stream->co_chunk,
> > ++                stream->co_size, &cur->offset))
> > ++          goto corrupt_file;
> > +
> > +         GST_LOG_OBJECT (qtdemux, "Created entry %d with offset "
> > +             "%" G_GUINT64_FORMAT, j, cur->offset);
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qtdemu=
x-Actually-handle-errors-returns-from-various-.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qtdemu=
x-Actually-handle-errors-returns-from-various-.patch
> > new file mode 100644
> > index 0000000000..c864deb635
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qtdemu=
x-Actually-handle-errors-returns-from-various-.patch
> > @@ -0,0 +1,97 @@
> > +From ed254790331a3fba2f68255a8f072552d622aac1 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Fri, 27 Sep 2024 10:39:30 +0300
> > +Subject: [PATCH] qtdemux: Actually handle errors returns from various
> > + functions instead of ignoring them
> > +
> > +Ignoring them might cause the element to continue as if all is fine
> despite the
> > +internal state being inconsistent. This can lead to all kinds of
> follow-up
> > +issues, including memory safety issues.
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-245
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3847
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ed254790331a3=
fba2f68255a8f072552d622aac1
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + .../gst-plugins-good/gst/isomp4/qtdemux.c     | 29 +++++++++++++++---=
-
> > + 1 file changed, 23 insertions(+), 6 deletions(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index 5277952c5ea5..1de70f184f50 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -4853,10 +4853,15 @@ gst_qtdemux_loop_state_header (GstQTDemux *
> qtdemux)
> > + beach:
> > +   if (ret =3D=3D GST_FLOW_EOS && (qtdemux->got_moov ||
> qtdemux->media_caps)) {
> > +     /* digested all data, show what we have */
> > +-    qtdemux_prepare_streams (qtdemux);
> > ++    ret =3D qtdemux_prepare_streams (qtdemux);
> > ++    if (ret !=3D GST_FLOW_OK)
> > ++      return ret;
> > ++
> > +     QTDEMUX_EXPOSE_LOCK (qtdemux);
> > +     ret =3D qtdemux_expose_streams (qtdemux);
> > +     QTDEMUX_EXPOSE_UNLOCK (qtdemux);
> > ++    if (ret !=3D GST_FLOW_OK)
> > ++      return ret;
> > +
> > +     qtdemux->state =3D QTDEMUX_STATE_MOVIE;
> > +     GST_DEBUG_OBJECT (qtdemux, "switching state to STATE_MOVIE (%d)",
> > +@@ -7552,13 +7557,21 @@ gst_qtdemux_process_adapter (GstQTDemux *
> demux, gboolean force)
> > +             gst_qtdemux_stream_concat (demux,
> > +                 demux->old_streams, demux->active_streams);
> > +
> > +-            qtdemux_parse_moov (demux, data, demux->neededbytes);
> > ++            if (!qtdemux_parse_moov (demux, data, demux->neededbytes)=
)
> {
> > ++              ret =3D GST_FLOW_ERROR;
> > ++              break;
> > ++            }
> > +             qtdemux_node_dump (demux, demux->moov_node);
> > +             qtdemux_parse_tree (demux);
> > +-            qtdemux_prepare_streams (demux);
> > ++            ret =3D qtdemux_prepare_streams (demux);
> > ++            if (ret !=3D GST_FLOW_OK)
> > ++              break;
> > ++
> > +             QTDEMUX_EXPOSE_LOCK (demux);
> > +-            qtdemux_expose_streams (demux);
> > ++            ret =3D qtdemux_expose_streams (demux);
> > +             QTDEMUX_EXPOSE_UNLOCK (demux);
> > ++            if (ret !=3D GST_FLOW_OK)
> > ++              break;
> > +
> > +             demux->got_moov =3D TRUE;
> > +
> > +@@ -7649,8 +7662,10 @@ gst_qtdemux_process_adapter (GstQTDemux * demux=
,
> gboolean force)
> > +             /* in MSS we need to expose the pads after the first moof
> as we won't get a moov */
> > +             if (demux->variant =3D=3D VARIANT_MSS_FRAGMENTED &&
> !demux->exposed) {
> > +               QTDEMUX_EXPOSE_LOCK (demux);
> > +-              qtdemux_expose_streams (demux);
> > ++              ret =3D qtdemux_expose_streams (demux);
> > +               QTDEMUX_EXPOSE_UNLOCK (demux);
> > ++              if (ret !=3D GST_FLOW_OK)
> > ++                goto done;
> > +             }
> > +
> > +             gst_qtdemux_check_send_pending_segment (demux);
> > +@@ -13764,8 +13779,10 @@ qtdemux_prepare_streams (GstQTDemux * qtdemux=
)
> > +
> > +     /* parse the initial sample for use in setting the frame rate cap
> */
> > +     while (sample_num =3D=3D 0 && sample_num < stream->n_samples) {
> > +-      if (!qtdemux_parse_samples (qtdemux, stream, sample_num))
> > ++      if (!qtdemux_parse_samples (qtdemux, stream, sample_num)) {
> > ++        ret =3D GST_FLOW_ERROR;
> > +         break;
> > ++      }
> > +       ++sample_num;
> > +     }
> > +   }
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qtdemu=
x-Check-for-invalid-atom-length-when-extractin.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qtdemu=
x-Check-for-invalid-atom-length-when-extractin.patch
> > new file mode 100644
> > index 0000000000..7096a75a71
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qtdemu=
x-Check-for-invalid-atom-length-when-extractin.patch
> > @@ -0,0 +1,36 @@
> > +From 3153fda823cb91b1031dae69738c6c5d526fb6e1 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Thu, 26 Sep 2024 19:16:19 +0300
> > +Subject: [PATCH] qtdemux: Check for invalid atom length when extractin=
g
> Closed
> > + Caption data
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-243
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3849
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3153fda823cb9=
1b1031dae69738c6c5d526fb6e1
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index 1de70f184f50..8850d09321e8 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -5827,7 +5827,7 @@ extract_cc_from_data (QtDemuxStream * stream,
> const guint8 * data, gsize size,
> > +     goto invalid_cdat;
> > +   atom_length =3D QT_UINT32 (data);
> > +   fourcc =3D QT_FOURCC (data + 4);
> > +-  if (G_UNLIKELY (atom_length > size || atom_length =3D=3D 8))
> > ++  if (G_UNLIKELY (atom_length > size || atom_length <=3D 8))
> > +     goto invalid_cdat;
> > +
> > +   GST_DEBUG_OBJECT (stream->pad, "here");
> > +--
> > +GitLab
> > +
> > diff --git
> a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qtdemu=
x-Add-size-check-for-parsing-SMI-SEQH-atom.patch
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qtdemu=
x-Add-size-check-for-parsing-SMI-SEQH-atom.patch
> > new file mode 100644
> > index 0000000000..b379c2f88c
> > --- /dev/null
> > +++
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qtdemu=
x-Add-size-check-for-parsing-SMI-SEQH-atom.patch
> > @@ -0,0 +1,37 @@
> > +From 3ce1b812a9531611288af286b5dc6631a11e3f4a Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D <sebastian@centricu=
lar.com>
> > +Date: Fri, 27 Sep 2024 00:31:36 +0300
> > +Subject: [PATCH] qtdemux: Add size check for parsing SMI / SEQH atom
> > +
> > +Thanks to Antonio Morales for finding and reporting the issue.
> > +
> > +Fixes GHSL-2024-244
> > +Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3853
> > +
> > +Part-of: <
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109>
> > +
> > +Upstream-Status: Backport [
> https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/3ce1b812a9531=
611288af286b5dc6631a11e3f4a
> ]
> > +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544
> CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-4759=
8
> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > +---
> > + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 3 ++-
> > + 1 file changed, 2 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
> > +index 8850d09321e8..dc70287a8a9b 100644
> > +--- a/gst/isomp4/qtdemux.c
> > ++++ b/gst/isomp4/qtdemux.c
> > +@@ -10633,8 +10633,9 @@ qtdemux_parse_svq3_stsd_data (GstQTDemux *
> qtdemux,
> > +                 GST_WARNING_OBJECT (qtdemux, "Unexpected second SEQH
> SMI atom "
> > +                     " found, ignoring");
> > +               } else {
> > ++                /* Note: The size does *not* include the fourcc and
> the size field itself */
> > +                 seqh_size =3D QT_UINT32 (data + 4);
> > +-                if (seqh_size > 0) {
> > ++                if (seqh_size > 0 && seqh_size <=3D size - 8) {
> > +                   _seqh =3D gst_buffer_new_and_alloc (seqh_size);
> > +                   gst_buffer_fill (_seqh, 0, data + 8, seqh_size);
> > +                 }
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.20.7.bb
> > index dfb0c0f342..5427cdb75d 100644
> > --- a/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.20.7.bb
> > +++ b/meta/recipes-multimedia/gstreamer/
> gstreamer1.0-plugins-good_1.20.7.bb
> > @@ -6,6 +6,19 @@ BUGTRACKER =3D "
> https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
> >
> >  SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-$=
{PV}.tar.xz
> \
> >
>  file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
> > +
>  file://0001-qtdemux-Skip-zero-sized-boxes-instead-of-stopping-to.patch \
> > +
>  file://0002-qtdemux-Fix-integer-overflow-when-allocating-the-sam.patch \
> > +
>  file://0003-qtdemux-Fix-debug-output-during-trun-parsing.patch \
> > +
>  file://0004-qtdemux-Don-t-iterate-over-all-trun-entries-if-none-.patch \
> > +
>  file://0005-qtdemux-Check-sizes-of-stsc-stco-stts-before-trying-.patch \
> > +
>  file://0006-qtdemux-Make-sure-only-an-even-number-of-bytes-is-pr.patch \
> > +
>  file://0007-qtdemux-Make-sure-enough-data-is-available-before-re.patch \
> > +
>  file://0008-qtdemux-Fix-length-checks-and-offsets-in-stsd-entry-.patch \
> > +
>  file://0009-qtdemux-Fix-error-handling-when-parsing-cenc-sample-.patch \
> > +
>  file://0010-qtdemux-Make-sure-there-are-enough-offsets-to-read-w.patch \
> > +
>  file://0011-qtdemux-Actually-handle-errors-returns-from-various-.patch \
> > +
>  file://0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch \
> > +
>  file://0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#209303):
> https://lists.openembedded.org/g/openembedded-core/message/209303
> > Mute This Topic: https://lists.openembedded.org/mt/110388307/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000091ae78062ac3d807
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Not sure why it is not applied cleanly. Previous patc=
h set is for gstreamer1.0-plugins-base. The 2nd patch set is for gstreamer1=
.0-plugins-good.</div><div><br></div><div>As suggested above [1] &amp; [2] =
, I will send out a V2 patch.<br><br></div><div>Thanks &amp; Regards,</div>=
<div>Vijay<br></div></div><br><div class=3D"gmail_quote gmail_quote_contain=
er"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 2, 2025 at 7:42=E2=80=
=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Could you send a V2 with the following changes?<br>
<br>
1. Please combine the series with=C2=A0 the previous gstreamer patch set<br=
>
you sent=C2=A0 -- this second series doesn&#39;t apply cleanly on top of th=
ose<br>
changes<br>
2. Patch file names should reflect the CVE being fixed, e.g.<br>
CVE-2024-47537.patch<br>
<br>
Thanks!<br>
<br>
Steve<br>
<br>
On Thu, Jan 2, 2025 at 5:33=E2=80=AFAM Vijay Anusuri via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;vanusuri=3D<a href=3D"mailto:mvista.com@=
lists.openembedded.org" target=3D"_blank">mvista.com@lists.openembedded.org=
</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=
=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt;<br>
&gt; Fixes for below CVEs:<br>
&gt; CVE-2024-47537<br>
&gt; CVE-2024-47539<br>
&gt; CVE-2024-47543<br>
&gt; CVE-2024-47544<br>
&gt; CVE-2024-47545<br>
&gt; CVE-2024-47546<br>
&gt; CVE-2024-47596<br>
&gt; CVE-2024-47597<br>
&gt; CVE-2024-47598<br>
&gt;<br>
&gt; Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com=
" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...o-sized-boxes-instead-of-stopping-to.patch | 124 +++++<br>
&gt;=C2=A0 ...ger-overflow-when-allocating-the-sam.patch |=C2=A0 64 +++<br>
&gt;=C2=A0 ...Fix-debug-output-during-trun-parsing.patch |=C2=A0 73 +++<br>
&gt;=C2=A0 ...erate-over-all-trun-entries-if-none-.patch |=C2=A0 36 ++<br>
&gt;=C2=A0 ...zes-of-stsc-stco-stts-before-trying-.patch |=C2=A0 63 +++<br>
&gt;=C2=A0 ...e-only-an-even-number-of-bytes-is-pr.patch |=C2=A0 44 ++<br>
&gt;=C2=A0 ...e-enough-data-is-available-before-re.patch | 120 +++++<br>
&gt;=C2=A0 ...th-checks-and-offsets-in-stsd-entry-.patch | 449 ++++++++++++=
++++++<br>
&gt;=C2=A0 ...r-handling-when-parsing-cenc-sample-.patch |=C2=A0 56 +++<br>
&gt;=C2=A0 ...e-there-are-enough-offsets-to-read-w.patch |=C2=A0 49 ++<br>
&gt;=C2=A0 ...-handle-errors-returns-from-various-.patch |=C2=A0 97 ++++<br=
>
&gt;=C2=A0 ...r-invalid-atom-length-when-extractin.patch |=C2=A0 36 ++<br>
&gt;=C2=A0 ...size-check-for-parsing-SMI-SEQH-atom.patch |=C2=A0 37 ++<br>
&gt;=C2=A0 .../<a href=3D"http://gstreamer1.0-plugins-good_1.20.7.bb" rel=
=3D"noreferrer" target=3D"_blank">gstreamer1.0-plugins-good_1.20.7.bb</a>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 13 +<br>
&gt;=C2=A0 14 files changed, 1261 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0001-qtdemux-Skip-zero-sized-boxes-instead-of-stopping-to.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0002-qtdemux-Fix-integer-overflow-when-allocating-the-sam.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0003-qtdemux-Fix-debug-output-during-trun-parsing.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0004-qtdemux-Don-t-iterate-over-all-trun-entries-if-none-.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0005-qtdemux-Check-sizes-of-stsc-stco-stts-before-trying-.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0006-qtdemux-Make-sure-only-an-even-number-of-bytes-is-pr.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0007-qtdemux-Make-sure-enough-data-is-available-before-re.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0008-qtdemux-Fix-length-checks-and-offsets-in-stsd-entry-.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0009-qtdemux-Fix-error-handling-when-parsing-cenc-sample-.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0010-qtdemux-Make-sure-there-are-enough-offsets-to-read-w.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0011-qtdemux-Actually-handle-errors-returns-from-various-.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0012-qtdemux-Check-for-invalid-atom-length-when-extractin.pa=
tch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.=
0-plugins-good/0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch<=
br>
&gt;<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0001-qtdemux-Skip-zero-sized-boxes-instead-of-stopping-to.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-qtdemux-Skip-zer=
o-sized-boxes-instead-of-stopping-to.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8af25e73fd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001=
-qtdemux-Skip-zero-sized-boxes-instead-of-stopping-to.patch<br>
&gt; @@ -0,0 +1,124 @@<br>
&gt; +From d4bab55077c6a77bd80cb12a8b0d28020ef412a9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Tue, 24 Sep 2024 09:50:34 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Skip zero-sized boxes instead of stopping t=
o look at<br>
&gt; + further boxes<br>
&gt; +<br>
&gt; +A zero-sized box is not really a problem and can be skipped to look a=
t any<br>
&gt; +possibly following ones.<br>
&gt; +<br>
&gt; +BMD ATEM devices specifically write a zero-sized bmdc box in the samp=
le<br>
&gt; +description, followed by the avcC box in case of h264. Previously the=
 avcC box<br>
&gt; +would simply not be read at all and the file would be unplayable.<br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/7564" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7564</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/d4bab55077c6a77bd80cb12a8b0d28020ef412a9" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/d4bab55077c6a77bd80cb12a8b0d28020ef412a9</a>]<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../gst-plugins-good/gst/isomp4/qtdemux.c=C2=A0 =C2=A0 =C2=A0| 54 ++=
++++++++++-------<br>
&gt; + 1 file changed, 36 insertions(+), 18 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index 32df6eeb85c1..5e5c21758058 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -12226,9 +12226,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GN=
ode * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =
=3D len - 0x8;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real d=
ata, so break out */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avc_data +=
=3D 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (QT_FOU=
RCC (avc_data + 0x4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_avcC:<br>
&gt; +@@ -12343,9 +12346,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GN=
ode * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =
=3D len - 0x8;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real d=
ata, so break out */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hevc_data +=
=3D 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (QT_FOU=
RCC (hevc_data + 0x4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_hvcC:<br>
&gt; +@@ -12767,9 +12773,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GN=
ode * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =
=3D len - 8;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real d=
ata, so break out */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vc1_data +=
=3D 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (QT_FOU=
RCC (vc1_data + 0x4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GS=
T_MAKE_FOURCC (&#39;d&#39;, &#39;v&#39;, &#39;c&#39;, &#39;1&#39;):<br>
&gt; +@@ -12809,9 +12818,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GN=
ode * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =
=3D len - 0x8;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real d=
ata, so break out */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 av1_data +=
=3D 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (QT_FOU=
RCC (av1_data + 0x4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_av1C:<br>
&gt; +@@ -12919,9 +12931,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GN=
ode * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =
=3D len - 0x8;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real d=
ata, so break out */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpcc_data +=
=3D 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (QT_FOU=
RCC (vpcc_data + 0x4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_vpcC:<br>
&gt; +@@ -13421,9 +13436,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GN=
ode * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D len -=
 8;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 break out */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so skip *=
/<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wfex_data +=3D 8;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (QT_FOURCC (wf=
ex_data + 4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GST_MAKE_=
FOURCC (&#39;w&#39;, &#39;f&#39;, &#39;e&#39;, &#39;x&#39;):<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0002-qtdemux-Fix-integer-overflow-when-allocating-the-sam.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-qtdemux-Fix-inte=
ger-overflow-when-allocating-the-sam.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..ded7e1b1c5<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002=
-qtdemux-Fix-integer-overflow-when-allocating-the-sam.patch<br>
&gt; @@ -0,0 +1,64 @@<br>
&gt; +From c3a2af94c652513ac1b1858295688ac88c5cc737 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Antonio Morales &lt;<a href=3D"mailto:antonio-morales@github.co=
m" target=3D"_blank">antonio-morales@github.com</a>&gt;<br>
&gt; +Date: Thu, 26 Sep 2024 18:39:37 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Fix integer overflow when allocating the sa=
mples<br>
&gt; + table for fragmented MP4<br>
&gt; +<br>
&gt; +This can lead to out of bounds writes and NULL pointer dereferences.<=
br>
&gt; +<br>
&gt; +Fixes GHSL-2024-094, GHSL-2024-237, GHSL-2024-241<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3839" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3839</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8060" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/c3a2af94c652513ac1b1858295688ac88c5cc737" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/c3a2af94c652513ac1b1858295688ac88c5cc737</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544<br>
&gt; +CVE-2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-=
47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 12 ++++++------<=
br>
&gt; + 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index de8fae8b02ee..2fb5b2b014db 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -3364,6 +3364,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstBy=
teReader * trun,<br>
&gt; +=C2=A0 =C2=A0gint i;<br>
&gt; +=C2=A0 =C2=A0guint8 *data;<br>
&gt; +=C2=A0 =C2=A0guint entry_size, dur_offset, size_offset, flags_offset =
=3D 0, ct_offset =3D 0;<br>
&gt; ++=C2=A0 guint new_n_samples;<br>
&gt; +=C2=A0 =C2=A0QtDemuxSample *sample;<br>
&gt; +=C2=A0 =C2=A0gboolean ismv =3D FALSE;<br>
&gt; +=C2=A0 =C2=A0gint64 initial_offset;<br>
&gt; +@@ -3475,14 +3476,13 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, Gst=
ByteReader * trun,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +=C2=A0 =C2=A0data =3D (guint8 *) gst_byte_reader_peek_data_unchecked =
(trun);<br>
&gt; +<br>
&gt; +-=C2=A0 if (stream-&gt;n_samples + samples_count &gt;=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 QTDEMUX_MAX_SAMPLE_INDEX_SIZE / sizeof (QtDemux=
Sample))<br>
&gt; ++=C2=A0 if (!g_uint_checked_add (&amp;new_n_samples, stream-&gt;n_sam=
ples, samples_count) ||<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 new_n_samples &gt;=3D QTDEMUX_MAX_SAMPLE_INDEX_=
SIZE / sizeof (QtDemuxSample))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goto index_too_big;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0GST_DEBUG_OBJECT (qtdemux, &quot;allocating n_samples %u=
 * %u (%.2f MB)&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 stream-&gt;n_samples + samples_count, (guint) s=
izeof (QtDemuxSample),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 (stream-&gt;n_samples + samples_count) *<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 sizeof (QtDemuxSample) / (1024.0 * 1024.0));<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 new_n_samples, (guint) sizeof (QtDemuxSample),<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 (new_n_samples) * sizeof (QtDemuxSample) / (102=
4.0 * 1024.0));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/* create a new array of samples if it&#39;s the first s=
ample parsed */<br>
&gt; +=C2=A0 =C2=A0if (stream-&gt;n_samples =3D=3D 0) {<br>
&gt; +@@ -3491,7 +3491,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstBy=
teReader * trun,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* or try to reallocate it with space enough to i=
nsert the new samples */<br>
&gt; +=C2=A0 =C2=A0} else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stream-&gt;samples =3D g_try_renew (QtDemuxSample=
, stream-&gt;samples,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;n_samples + samples_count);<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 new_n_samples);<br>
&gt; +=C2=A0 =C2=A0if (stream-&gt;samples =3D=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goto out_of_memory;<br>
&gt; +<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0003-qtdemux-Fix-debug-output-during-trun-parsing.patch b/meta/recipes-m=
ultimedia/gstreamer/gstreamer1.0-plugins-good/0003-qtdemux-Fix-debug-output=
-during-trun-parsing.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8c17c548df<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0003=
-qtdemux-Fix-debug-output-during-trun-parsing.patch<br>
&gt; @@ -0,0 +1,73 @@<br>
&gt; +From 812f175c580a2e702581859fd481c8f51d633508 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Thu, 26 Sep 2024 18:40:56 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Fix debug output during trun parsing<br>
&gt; +<br>
&gt; +Various integers are unsigned so print them as such. Also print the a=
ctual<br>
&gt; +allocation size if allocation fails, not only parts of it.<br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8060" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/812f175c580a2e702581859fd481c8f51d633508" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/812f175c580a2e702581859fd481c8f51d633508</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + gst/isomp4/qtdemux.c | 17 +++++++++--------<br>
&gt; + 1 file changed, 9 insertions(+), 8 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/gst/isomp4/qtdemux.c b/gst/isomp4/qtdemux.c<br>
&gt; +index e012ce1..0111912 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -3228,8 +3228,8 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstBy=
teReader * trun,<br>
&gt; +=C2=A0 =C2=A0gint64 initial_offset;<br>
&gt; +=C2=A0 =C2=A0gint32 min_ct =3D 0;<br>
&gt; +<br>
&gt; +-=C2=A0 GST_LOG_OBJECT (qtdemux, &quot;parsing trun track-id %d; &quo=
t;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 &quot;default dur %d, size %d, flags 0x%x, base=
 offset %&quot; G_GINT64_FORMAT &quot;, &quot;<br>
&gt; ++=C2=A0 GST_LOG_OBJECT (qtdemux, &quot;parsing trun track-id %u; &quo=
t;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;default dur %u, size %u, flags 0x%x, base=
 offset %&quot; G_GINT64_FORMAT &quot;, &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;decode ts %&quot; G_GINT64_FORMAT, s=
tream-&gt;track_id, d_sample_duration,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0d_sample_size, d_sample_flags, *base_offse=
t, decode_ts);<br>
&gt; +<br>
&gt; +@@ -3257,7 +3257,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstBy=
teReader * trun,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* note this is really signed */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!gst_byte_reader_get_int32_be (trun, &amp;dat=
a_offset))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail;<br>
&gt; +-=C2=A0 =C2=A0 GST_LOG_OBJECT (qtdemux, &quot;trun data offset %d&quo=
t;, data_offset);<br>
&gt; ++=C2=A0 =C2=A0 GST_LOG_OBJECT (qtdemux, &quot;trun data offset %u&quo=
t;, data_offset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* default base offset =3D first byte of moof */<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (*base_offset =3D=3D -1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0GST_LOG_OBJECT (qtdemux, &quot;base_offset=
 at moof&quot;);<br>
&gt; +@@ -3279,7 +3279,7 @@ qtdemux_parse_trun (GstQTDemux * qtdemux, GstBy=
teReader * trun,<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0GST_LOG_OBJECT (qtdemux, &quot;running offset now %&quot=
; G_GINT64_FORMAT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0*running_offset);<br>
&gt; +-=C2=A0 GST_LOG_OBJECT (qtdemux, &quot;trun offset %d, flags 0x%x, en=
tries %d&quot;,<br>
&gt; ++=C2=A0 GST_LOG_OBJECT (qtdemux, &quot;trun offset %u, flags 0x%x, en=
tries %u&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0data_offset, flags, samples_count);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (flags &amp; TR_FIRST_SAMPLE_FLAGS) {<br>
&gt; +@@ -3499,14 +3499,15 @@ fail:<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; + out_of_memory:<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 GST_WARNING_OBJECT (qtdemux, &quot;failed to allocate =
%d samples&quot;,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;n_samples);<br>
&gt; ++=C2=A0 =C2=A0 GST_WARNING_OBJECT (qtdemux, &quot;failed to allocate =
%u + %u samples&quot;,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;n_samples, samples_count);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; + index_too_big:<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 GST_WARNING_OBJECT (qtdemux, &quot;not allocating inde=
x of %d samples, would &quot;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;be larger than %uMB (broken file?)=
&quot;, stream-&gt;n_samples,<br>
&gt; ++=C2=A0 =C2=A0 GST_WARNING_OBJECT (qtdemux,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 &quot;not allocating index of %u + %u samples, =
would &quot;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;be larger than %uMB (broken file?)=
&quot;, stream-&gt;n_samples, samples_count,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTDEMUX_MAX_SAMPLE_INDEX_SIZE &gt;&=
gt; 20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return FALSE;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +2.25.1<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0004-qtdemux-Don-t-iterate-over-all-trun-entries-if-none-.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004-qtdemux-Don-t-it=
erate-over-all-trun-entries-if-none-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..217387a4cd<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0004=
-qtdemux-Don-t-iterate-over-all-trun-entries-if-none-.patch<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +From eb7f9331c2294bc28a549b79c9f931c3e6c6bc44 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Thu, 26 Sep 2024 18:41:39 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Don&#39;t iterate over all trun entries if =
none of the<br>
&gt; + flags are set<br>
&gt; +<br>
&gt; +Nothing would be printed anyway.<br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8060" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/eb7f9331c2294bc28a549b79c9f931c3e6c6bc44" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/eb7f9331c2294bc28a549b79c9f931c3e6c6bc44</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c | 5 +++++<br>
&gt; + 1 file changed, 5 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c b=
/subprojects/gst-plugins-good/gst/isomp4/qtdemux_dump.c<br>
&gt; +index 22da35e9e7ad..297b580ef038 100644<br>
&gt; +--- a/gst/isomp4/qtdemux_dump.c<br>
&gt; ++++ b/gst/isomp4/qtdemux_dump.c<br>
&gt; +@@ -836,6 +836,11 @@ qtdemux_dump_trun (GstQTDemux * qtdemux, GstByte=
Reader * data, int depth)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GST_LOG (&quot;%*s=C2=A0 =C2=A0 first-sample-flag=
s: %u&quot;, depth, &quot;&quot;, first_sample_flags);<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 /* Nothing to print below */<br>
&gt; ++=C2=A0 if ((flags &amp; (TR_SAMPLE_DURATION | TR_SAMPLE_SIZE | TR_SA=
MPLE_FLAGS |<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TR_COMPOSITION_TIME=
_OFFSETS)) =3D=3D 0)<br>
&gt; ++=C2=A0 =C2=A0 return TRUE;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0for (i =3D 0; i &lt; samples_count; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (flags &amp; TR_SAMPLE_DURATION) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!gst_byte_reader_get_uint32_be (data, =
&amp;sample_duration))<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0005-qtdemux-Check-sizes-of-stsc-stco-stts-before-trying-.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005-qtdemux-Check-si=
zes-of-stsc-stco-stts-before-trying-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8b5bddbf5b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0005=
-qtdemux-Check-sizes-of-stsc-stco-stts-before-trying-.patch<br>
&gt; @@ -0,0 +1,63 @@<br>
&gt; +From 1def2965d8da8cc74ab0036d7f8d59e81e676cad Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Fri, 27 Sep 2024 15:50:54 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Check sizes of stsc/stco/stts before trying=
 to merge<br>
&gt; + entries<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-246<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3854" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3854</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8060" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/1def2965d8da8cc74ab0036d7f8d59e81e676cad" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/1def2965d8da8cc74ab0036d7f8d59e81e676cad</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../gst-plugins-good/gst/isomp4/qtdemux.c=C2=A0 =C2=A0 =C2=A0| 22 ++=
+++++++++++++++++<br>
&gt; + 1 file changed, 22 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index 0996292d0789..c14d939ee3c9 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -10033,6 +10033,21 @@ qtdemux_merge_sample_table (GstQTDemux * qtd=
emux, QtDemuxStream * stream)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; ++=C2=A0 if (gst_byte_reader_get_remaining (&amp;stream-&gt;stts) &lt;=
 8) {<br>
&gt; ++=C2=A0 =C2=A0 GST_DEBUG_OBJECT (qtdemux, &quot;Too small stts&quot;)=
;<br>
&gt; ++=C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 if (stream-&gt;stco.size &lt; 8) {<br>
&gt; ++=C2=A0 =C2=A0 GST_DEBUG_OBJECT (qtdemux, &quot;Too small stco&quot;)=
;<br>
&gt; ++=C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 if (stream-&gt;n_samples_per_chunk =3D=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 GST_DEBUG_OBJECT (qtdemux, &quot;No samples per chunk&=
quot;);<br>
&gt; ++=C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0/* Parse the stts to get the sample duration and number =
of samples */<br>
&gt; +=C2=A0 =C2=A0gst_byte_reader_skip_unchecked (&amp;stream-&gt;stts, 4)=
;<br>
&gt; +=C2=A0 =C2=A0stts_duration =3D gst_byte_reader_get_uint32_be_unchecke=
d (&amp;stream-&gt;stts);<br>
&gt; +@@ -10044,6 +10059,13 @@ qtdemux_merge_sample_table (GstQTDemux * qtd=
emux, QtDemuxStream * stream)<br>
&gt; +=C2=A0 =C2=A0GST_DEBUG_OBJECT (qtdemux, &quot;sample_duration %d, num=
_chunks %u&quot;, stts_duration,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0num_chunks);<br>
&gt; +<br>
&gt; ++=C2=A0 if (gst_byte_reader_get_remaining (&amp;stream-&gt;stsc) &lt;=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 stream-&gt;n_samples_per_chunk * 3 * 4 +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 (stream-&gt;n_samples_per_chunk - 1) * 4) {<br>
&gt; ++=C2=A0 =C2=A0 GST_DEBUG_OBJECT (qtdemux, &quot;Too small stsc&quot;)=
;<br>
&gt; ++=C2=A0 =C2=A0 return;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0/* Now parse stsc, convert chunks into single samples an=
d generate a<br>
&gt; +=C2=A0 =C2=A0 * new stsc, stts and stsz from this information */<br>
&gt; +=C2=A0 =C2=A0gst_byte_writer_init (&amp;stsc);<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0006-qtdemux-Make-sure-only-an-even-number-of-bytes-is-pr.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006-qtdemux-Make-sur=
e-only-an-even-number-of-bytes-is-pr.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..02d9cb278c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0006=
-qtdemux-Make-sure-only-an-even-number-of-bytes-is-pr.patch<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +From 314945426c7105ad90f44a188037bc43bb3b0300 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Thu, 26 Sep 2024 09:20:28 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Make sure only an even number of bytes is p=
rocessed<br>
&gt; + when handling CEA608 data<br>
&gt; +<br>
&gt; +An odd number of bytes would lead to out of bound reads and writes, a=
nd doesn&#39;t<br>
&gt; +make any sense as CEA608 comes in byte pairs.<br>
&gt; +<br>
&gt; +Strip off any leftover bytes and assume everything before that is val=
id.<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-195<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3841" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3841</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8060" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/314945426c7105ad90f44a188037bc43bb3b0300" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/314945426c7105ad90f44a188037bc43bb3b0300</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 5 +++++<br>
&gt; + 1 file changed, 5 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index c14d939ee3c9..b9f466991adf 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -6145,6 +6145,11 @@ convert_to_s334_1a (const guint8 * ccpair, gui=
nt8 ccpair_size, guint field,<br>
&gt; +=C2=A0 =C2=A0guint8 *storage;<br>
&gt; +=C2=A0 =C2=A0gsize i;<br>
&gt; +<br>
&gt; ++=C2=A0 /* Strip off any leftover odd bytes and assume everything bef=
ore is valid */<br>
&gt; ++=C2=A0 if (ccpair_size % 2 !=3D 0) {<br>
&gt; ++=C2=A0 =C2=A0 ccpair_size -=3D 1;<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0/* We are converting from pairs to triplets */<br>
&gt; +=C2=A0 =C2=A0*res =3D ccpair_size / 2 * 3;<br>
&gt; +=C2=A0 =C2=A0storage =3D g_malloc (*res);<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0007-qtdemux-Make-sure-enough-data-is-available-before-re.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007-qtdemux-Make-sur=
e-enough-data-is-available-before-re.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5ff18baa7e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0007=
-qtdemux-Make-sure-enough-data-is-available-before-re.patch<br>
&gt; @@ -0,0 +1,120 @@<br>
&gt; +From 8ef08a7a41da987aa630082df355ea651aa09132 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Thu, 26 Sep 2024 14:17:02 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Make sure enough data is available before r=
eading<br>
&gt; + wave header node<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-236<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3843" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3843</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8060" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/8ef08a7a41da987aa630082df355ea651aa09132" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/8ef08a7a41da987aa630082df355ea651aa09132</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../gst-plugins-good/gst/isomp4/qtdemux.c=C2=A0 =C2=A0 =C2=A0| 84 ++=
++++++++---------<br>
&gt; + 1 file changed, 45 insertions(+), 39 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index b9f466991adf..55ba59152c7a 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -13697,47 +13697,53 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0guint32 datalen =3D QT_UINT3=
2 (stsd_entry_data + offset + 16);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const guint8 *data =3D stsd_=
entry_data + offset + 16;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNode *wavenode;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNode *waveheadernode;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wavenode =3D g_node_new ((guint8 =
*) data);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qtdemux_parse_node (qtdemux, =
wavenode, data, datalen)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const guint8 *waveheader;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 headerlen;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waveheadernode =3D qtdemux=
_tree_get_child_by_type (wavenode, fourcc);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (waveheadernode) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waveheader =3D (con=
st guint8 *) waveheadernode-&gt;data;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 headerlen =3D QT_UI=
NT32 (waveheader);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (headerlen &gt; =
8) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_riff_str=
f_auds *header =3D NULL;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GstBuffer *h=
eaderbuf;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GstBuffer *e=
xtra;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waveheader +=
=3D 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 headerlen -=
=3D 8;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 headerbuf =
=3D gst_buffer_new_and_alloc (headerlen);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_buffer_f=
ill (headerbuf, 0, waveheader, headerlen);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gst_riff=
_parse_strf_auds (GST_ELEMENT_CAST (qtdemux),<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 headerbuf, &amp;header, &amp;extra)) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_c=
aps_unref (entry-&gt;caps);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FI=
XME: Need to do something with the channel reorder map */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry=
-&gt;caps =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gst_riff_create_audio_caps (header-&gt;format, NULL, header,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 extra, NULL, NULL, NULL);<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (e=
xtra)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gst_buffer_unref (extra);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_fre=
e (header);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len &lt; datalen || len - dat=
alen &lt; offset + 16) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_WARNING_OBJECT (qtdemu=
x, &quot;Not enough data for waveheadernode&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNode *wavenode;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNode *waveheadernode;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wavenode =3D g_node_new ((=
guint8 *) data);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (qtdemux_parse_node (qt=
demux, wavenode, data, datalen)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const guint8 *waveh=
eader;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 headerlen;<=
br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waveheadernode =3D<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtdem=
ux_tree_get_child_by_type (wavenode, fourcc);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (waveheadernode)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waveheader =
=3D (const guint8 *) waveheadernode-&gt;data;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 headerlen =
=3D QT_UINT32 (waveheader);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (headerle=
n &gt; 8) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_r=
iff_strf_auds *header =3D NULL;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GstBu=
ffer *headerbuf;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GstBu=
ffer *extra;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 waveh=
eader +=3D 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 heade=
rlen -=3D 8;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 heade=
rbuf =3D gst_buffer_new_and_alloc (headerlen);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (headerbuf, 0, waveheader, headerlen);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g=
st_riff_parse_strf_auds (GST_ELEMENT_CAST (qtdemux),<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 headerbuf, &amp;header, &amp;extra)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gst_caps_unref (entry-&gt;caps);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* FIXME: Need to do something with the channel reorder map */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 entry-&gt;caps =3D<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 gst_riff_create_audio_caps (header-&gt;format, NULL,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 header, extra, NULL, NULL, NULL);<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (extra)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gst_buffer_unref (extra);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 g_free (header);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_DEBUG (&quot;Di=
dn&#39;t find waveheadernode for this codec&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GST_DEBUG (&=
quot;Didn&#39;t find waveheadernode for this codec&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_node_destroy (wavenode);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_node_destroy (wavenode);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (esds) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_qtdemux_handle_esds (qtdemux, s=
tream, entry, esds,<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0008-qtdemux-Fix-length-checks-and-offsets-in-stsd-entry-.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008-qtdemux-Fix-leng=
th-checks-and-offsets-in-stsd-entry-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..41cf4c7d00<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0008=
-qtdemux-Fix-length-checks-and-offsets-in-stsd-entry-.patch<br>
&gt; @@ -0,0 +1,449 @@<br>
&gt; +From fe9d5d37234aca04fef7248184177168905a7a69 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Fri, 27 Sep 2024 00:12:57 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Fix length checks and offsets in stsd entry=
 parsing<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-242<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3845" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3845</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8060" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8060</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/fe9d5d37234aca04fef7248184177168905a7a69" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/fe9d5d37234aca04fef7248184177168905a7a69</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../gst-plugins-good/gst/isomp4/qtdemux.c=C2=A0 =C2=A0 =C2=A0| 218 +=
++++++-----------<br>
&gt; + 1 file changed, 79 insertions(+), 139 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index 55ba59152c7a..fb157552eb75 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -12237,43 +12237,35 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_avc1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_avc3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint len =3D QT_UINT32 (s=
tsd_entry_data);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 len =3D QT_UINT32 =
(stsd_entry_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D len &lt;=3D 0=
x56 ? 0 : len - 0x56;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const guint8 *avc_dat=
a =3D stsd_entry_data + 0x56;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* find avcC */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 0x8) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint size;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (QT_UINT32 (avc_=
data) &lt;=3D 0x8)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (QT_UINT32 =
(avc_data) &lt;=3D len)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QT_=
UINT32 (avc_data) - 0x8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D len=
 - 0x8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 8) {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 size =3D QT=
_UINT32 (avc_data);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avc_data +=
=3D 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 8 || =
size &gt; len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
avc_data + 0x4)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
avc_data + 4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_avcC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* parse, if found */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GstBuffer *buf;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 8 + 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GST_DEBUG_OBJECT (qtdemux, &quot;found avcC codec_data in stsd&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* First 4 bytes are the length of the atom, the next 4 bytes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * are the fourcc, the next 1 byte is the version, and the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * subsequent bytes are profile_tier_level structure like data. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_codec_utils_h264_caps_set_level_and_profile (entry-&gt;caps,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 avc_data + 8 + 1, size - 1);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (buf, 0, avc_data + 0x8, size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 avc_data + 8 + 1, size - 8 - 1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size - 8);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (buf, 0, avc_data + 8, size - 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_caps_set_simple (entry-&gt;caps,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;codec_data&quot;, GST_TYPE_BUFFER, buf, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_buffer_unref (buf);<br>
&gt; +@@ -12284,6 +12276,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GstBuffer *buf;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 8 + 40 + 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GST_DEBUG_OBJECT (qtdemux, &quot;found strf codec_data in stsd&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* First 4 bytes are the length of the atom, the next 4 bytes<br>
&gt; +@@ -12291,17 +12286,14 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * next 1 byte is the version, and the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * subsequent bytes are sequence parameter set like data. */<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =
-=3D 40;=C2=A0 =C2=A0/* we&#39;ll be skipping BITMAPINFOHEADER */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &gt; 1) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gst_codec_utils_h264_caps_set_level_and_profile<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 (entry-&gt;caps, avc_data + 8 + 40 + 1, size - 1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_c=
odec_utils_h264_caps_set_level_and_profile<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (entry-&gt;caps, avc_data + 8 + 40 + 1, size - 8 - 40 - 1);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 buf =3D gst_buffer_new_and_alloc (size);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gst_buffer_fill (buf, 0, avc_data + 8 + 40, size);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gst_caps_set_simple (entry-&gt;caps,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;codec_data&quot;, GST_TYPE_BUFFER, buf, NULL);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 gst_buffer_unref (buf);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size - 8 - 40);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (buf, 0, avc_data + 8 + 40, size - 8 - 40);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_c=
aps_set_simple (entry-&gt;caps,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;codec_data&quot;, GST_TYPE_BUFFER, buf, NULL);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_unref (buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_btrt:<br>
&gt; +@@ -12309,11 +12301,11 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
guint avg_bitrate, max_bitrate;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* bufferSizeDB, maxBitrate and avgBitrate - 4 bytes each */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 12)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 8 + 12)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_b=
itrate =3D QT_UINT32 (avc_data + 0xc);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avg_b=
itrate =3D QT_UINT32 (avc_data + 0x10);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 max_b=
itrate =3D QT_UINT32 (avc_data + 8 + 4);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avg_b=
itrate =3D QT_UINT32 (avc_data + 8 + 8);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if (!max_bitrate &amp;&amp; !avg_bitrate)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +@@ -12345,8 +12337,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size + 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avc_data +=3D size =
+ 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avc_data +=3D size;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -12357,44 +12349,36 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_dvh1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_dvhe:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint len =3D QT_UINT32 (s=
tsd_entry_data);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 len =3D QT_UINT32 =
(stsd_entry_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D len &lt;=3D 0=
x56 ? 0 : len - 0x56;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const guint8 *hevc_da=
ta =3D stsd_entry_data + 0x56;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* find hevc */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 0x8) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint size;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (QT_UINT32 (hevc=
_data) &lt;=3D 0x8)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (QT_UINT32 =
(hevc_data) &lt;=3D len)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QT_=
UINT32 (hevc_data) - 0x8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D len=
 - 0x8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 8) {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 size =3D QT=
_UINT32 (hevc_data);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hevc_data +=
=3D 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 8 || =
size &gt; len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
hevc_data + 0x4)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
hevc_data + 4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_hvcC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* parse, if found */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GstBuffer *buf;<br>
&gt; +<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 8 + 1)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GST_DEBUG_OBJECT (qtdemux, &quot;found hvcC codec_data in stsd&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* First 4 bytes are the length of the atom, the next 4 bytes<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * are the fourcc, the next 1 byte is the version, and the<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * subsequent bytes are sequence parameter set like data. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_codec_utils_h265_caps_set_level_tier_and_profile<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (entry-&gt;caps, hevc_data + 8 + 1, size - 1);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (entry-&gt;caps, hevc_data + 8 + 1, size - 8 - 1);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (buf, 0, hevc_data + 0x8, size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size - 8);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (buf, 0, hevc_data + 8, size - 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_caps_set_simple (entry-&gt;caps,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;codec_data&quot;, GST_TYPE_BUFFER, buf, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_buffer_unref (buf);<br>
&gt; +@@ -12403,8 +12387,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size + 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hevc_data +=3D size=
 + 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hevc_data +=3D size=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +@@ -12784,36 +12768,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_vc_1:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint len =3D QT_UINT32 (s=
tsd_entry_data);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 len =3D QT_UINT32 =
(stsd_entry_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D len &lt;=3D 0=
x56 ? 0 : len - 0x56;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const guint8 *vc1_dat=
a =3D stsd_entry_data + 0x56;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* find dvc1 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (len &gt;=3D 8)=
 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint size;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (QT_UINT32 (vc1_=
data) &lt;=3D 8)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (QT_UINT32 =
(vc1_data) &lt;=3D len)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QT_=
UINT32 (vc1_data) - 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D len=
 - 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 size =3D QT=
_UINT32 (vc1_data);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vc1_data +=
=3D 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 8 || =
size &gt; len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
vc1_data + 0x4)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
vc1_data + 4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GS=
T_MAKE_FOURCC (&#39;d&#39;, &#39;v&#39;, &#39;c&#39;, &#39;1&#39;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GstBuffer *buf;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GST_DEBUG_OBJECT (qtdemux, &quot;found dvc1 codec_data in stsd&quot;);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (buf, 0, vc1_data + 8, size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size - 8);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gst_b=
uffer_fill (buf, 0, vc1_data + 8, size - 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_caps_set_simple (entry-&gt;caps,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;codec_data&quot;, GST_TYPE_BUFFER, buf, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_buffer_unref (buf);<br>
&gt; +@@ -12822,36 +12795,25 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size + 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vc1_data +=3D size =
+ 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vc1_data +=3D size;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_av01:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint len =3D QT_UINT32 (s=
tsd_entry_data);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 len =3D QT_UINT32 =
(stsd_entry_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D len &lt;=3D 0=
x56 ? 0 : len - 0x56;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const guint8 *av1_dat=
a =3D stsd_entry_data + 0x56;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* find av1C */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 0x8) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint size;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (QT_UINT32 (av1_=
data) &lt;=3D 0x8)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (QT_UINT32 =
(av1_data) &lt;=3D len)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QT_=
UINT32 (av1_data) - 0x8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D len=
 - 0x8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 8) {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 size =3D QT=
_UINT32 (av1_data);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 av1_data +=
=3D 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 8 || =
size &gt; len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
av1_data + 0x4)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
av1_data + 4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_av1C:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* parse, if found */<br>
&gt; +@@ -12861,7 +12823,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;found av1C codec_data in stsd of size %d&quot;, size);<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* not enough data, just ignore and hope for the best */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 4)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 8 + 4)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* Content is:<br>
&gt; +@@ -12910,9 +12872,9 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(gint) (pres_delay_field &amp; 0x0F) + 1=
, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 buf =3D gst_buffer_new_and_alloc (size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 buf =3D gst_buffer_new_and_alloc (size - 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0GST_BUFFER_FLAG_SET (buf, GST_BUFFER_FLAG_HEADER);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gst_buffer_fill (buf, 0, av1_data + 8, size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 gst_buffer_fill (buf, 0, av1_data + 8, size - 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0gst_caps_set_simple (entry-&gt;caps,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;codec_data&quot;, GST_TYPE_BUFFER, buf, N=
ULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0gst_buffer_unref (buf);<br>
&gt; +@@ -12930,8 +12892,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size + 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 av1_data +=3D size =
+ 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 av1_data +=3D size;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -12942,29 +12904,18 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * vp08, vp09, and vp=
10 fourcc. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_vp09:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint len =3D QT_UINT32 (s=
tsd_entry_data);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 len =3D QT_UINT32 =
(stsd_entry_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D len &lt;=3D 0=
x56 ? 0 : len - 0x56;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const guint8 *vpcc_da=
ta =3D stsd_entry_data + 0x56;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* find vpcC */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 0x8) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint size;<br>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (QT_UINT32 (vpcc=
_data) &lt;=3D 0x8)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (QT_UINT32 =
(vpcc_data) &lt;=3D len)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QT_=
UINT32 (vpcc_data) - 0x8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D len=
 - 0x8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (len &gt;=3D 8) {<br=
>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 size =3D QT=
_UINT32 (vpcc_data);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so=
 skip */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpcc_data +=
=3D 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br=
>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 8 || =
size &gt; len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
vpcc_data + 0x4)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (QT_FOURCC (=
vpcc_data + 4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FO=
URCC_vpcC:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
const gchar *profile_str =3D NULL;<br>
&gt; +@@ -12980,7 +12931,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* the meaning of &quot;size&quot; is length of the atom body, excluding<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 * atom length and fourcc fields */<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 12)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s=
ize &lt; 8 + 12)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* Content is:<br>
&gt; +@@ -13086,8 +13037,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size + 8;<=
br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpcc_data +=3D size=
 + 8;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vpcc_data +=3D size=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +@@ -13428,7 +13379,7 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case FOURCC_wma_:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint len =3D QT_UINT32 (stsd_ent=
ry_data);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 len =3D QT_UINT32 (stsd_e=
ntry_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0len =3D len &lt;=3D offset ?=
 0 : len - offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const guint8 *wfex_data =3D =
stsd_entry_data + offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const gchar *codec_name =3D =
NULL;<br>
&gt; +@@ -13453,21 +13404,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* find wfex */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (len &gt;=3D 8) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint32 size =3D QT_UINT32=
 (wfex_data);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (QT_UINT32 (wfex_data) =
&lt;=3D 0x8)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D 0;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (QT_UINT32 (wfex_d=
ata) &lt;=3D len)<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D QT_UINT32 =
(wfex_data) - 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size =3D len - 8;<b=
r>
&gt; +-<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* No real data, so skip *=
/<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 1) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wfex_data +=3D 8;<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &lt; 8 || size &g=
t; len)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (QT_FOURCC (wf=
ex_data + 4)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case GST_MAKE_=
FOURCC (&#39;w&#39;, &#39;f&#39;, &#39;e&#39;, &#39;x&#39;):<br>
&gt; +@@ -13512,12 +13452,12 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;width&quot;, G_TYPE_INT, wfex.wBitsPerSample,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;depth&quot;, G_TYPE_INT, wfex.wBitsPerSample, NULL);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &gt=
; wfex.cbSize) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (size &gt=
; 8 + wfex.cbSize) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GstBuffer *buf;<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size - wfex.cbSize);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =
=3D gst_buffer_new_and_alloc (size - 8 - wfex.cbSize);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_buffer_fill (buf, 0, wfex_data + 8 + wfex.cbSize,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size - wfex.cbSize);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 size - 8 - wfex.cbSize);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_caps_set_simple (entry-&gt;caps,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&quot;codec_data&quot;, GST_TYPE_BUFFER, buf, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_buffer_unref (buf);<br>
&gt; +@@ -13534,8 +13474,8 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GNo=
de * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size + 8;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wfex_data +=3D size + 8;<b=
r>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 len -=3D size;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wfex_data +=3D size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0009-qtdemux-Fix-error-handling-when-parsing-cenc-sample-.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009-qtdemux-Fix-erro=
r-handling-when-parsing-cenc-sample-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..a84575199e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0009=
-qtdemux-Fix-error-handling-when-parsing-cenc-sample-.patch<br>
&gt; @@ -0,0 +1,56 @@<br>
&gt; +From da3b4e903ae990193988a873368bdd1865350521 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Fri, 27 Sep 2024 09:47:50 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Fix error handling when parsing cenc sample=
 groups<br>
&gt; + fails<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-238, GHSL-2024-239, GHSL-2024-240<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3846" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3846</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8109" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/da3b4e903ae990193988a873368bdd1865350521" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/da3b4e903ae990193988a873368bdd1865350521</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 9 +++++++--<br>
&gt; + 1 file changed, 7 insertions(+), 2 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index 94ce75b2d42d..e7a79be45b29 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -11404,12 +11404,15 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, G=
Node * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stream-&gt;subtype !=3D FOURCC_soun) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_ERROR_OBJECT (qtdemux,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Unexpeced stsd =
type &#39;aavd&#39; outside &#39;soun&#39; track&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto corrupt_file;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* encrypted audio with sound sampl=
e description v0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GNode *enc =3D qtdemux_tree_get_chi=
ld_by_type (stsd, fourcc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stream-&gt;protected =3D TRUE;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qtdemux_parse_protection_aavd (qtde=
mux, stream, enc, &amp;fourcc))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qtdemux_parse_protection_aavd (qtde=
mux, stream, enc, &amp;fourcc)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_ERROR_OBJECT (qtdemux, &=
quot;Failed to parse protection scheme info&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto corrupt_file;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +@@ -11418,8 +11421,10 @@ qtdemux_parse_trak (GstQTDemux * qtdemux, GN=
ode * trak)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with the same type */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0GNode *enc =3D qtdemux_tree_get_child_by_t=
ype (stsd, fourcc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0stream-&gt;protected =3D TRUE;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (!qtdemux_parse_protection_scheme_info (qtde=
mux, stream, enc, &amp;fourcc))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!qtdemux_parse_protection_scheme_info (qtde=
mux, stream, enc, &amp;fourcc)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_ERROR_OBJECT (qtdemux, &quot;Fa=
iled to parse protection scheme info&quot;);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto corrupt_file;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (stream-&gt;subtype =3D=3D FOURCC_vide) {<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0010-qtdemux-Make-sure-there-are-enough-offsets-to-read-w.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010-qtdemux-Make-sur=
e-there-are-enough-offsets-to-read-w.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..af0d1ed633<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0010=
-qtdemux-Make-sure-there-are-enough-offsets-to-read-w.patch<br>
&gt; @@ -0,0 +1,49 @@<br>
&gt; +From 20503e5dd90e21ef170488b2a8b8529ae8a4cab9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Fri, 27 Sep 2024 10:38:50 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Make sure there are enough offsets to read =
when<br>
&gt; + parsing samples<br>
&gt; +<br>
&gt; +While this specific case is also caught when initializing co_chunk, t=
he error<br>
&gt; +is ignored in various places and calling into the function would lead=
 to out of<br>
&gt; +bounds reads if the error message doesn&#39;t cause the pipeline to b=
e shut down<br>
&gt; +fast enough.<br>
&gt; +<br>
&gt; +To avoid this, no matter what, make sure enough offsets are available=
 when<br>
&gt; +parsing them. While this is potentially slower, the same is already d=
one in the<br>
&gt; +non-chunks_are_samples case.<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-245<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3847" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3847</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8109" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/20503e5dd90e21ef170488b2a8b8529ae8a4cab9" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/20503e5dd90e21ef170488b2a8b8529ae8a4cab9</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 6 +++---<br>
&gt; + 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index e7a79be45b29..5277952c5ea5 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -10070,9 +10070,9 @@ qtdemux_parse_samples (GstQTDemux * qtdemux, =
QtDemuxStream * stream, guint32 n)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto done;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur-&gt;offset =3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qt_atom_parser_get_offset_=
unchecked (&amp;stream-&gt;co_chunk,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;co_size);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qt_atom_parser_get_offset (&amp;str=
eam-&gt;co_chunk,<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stream-&gt;c=
o_size, &amp;cur-&gt;offset))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto corrupt_file;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_LOG_OBJECT (qtdemux, &quot;Crea=
ted entry %d with offset &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%&quot; G_GUINT=
64_FORMAT, j, cur-&gt;offset);<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0011-qtdemux-Actually-handle-errors-returns-from-various-.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011-qtdemux-Actually=
-handle-errors-returns-from-various-.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..c864deb635<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0011=
-qtdemux-Actually-handle-errors-returns-from-various-.patch<br>
&gt; @@ -0,0 +1,97 @@<br>
&gt; +From ed254790331a3fba2f68255a8f072552d622aac1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Fri, 27 Sep 2024 10:39:30 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Actually handle errors returns from various=
<br>
&gt; + functions instead of ignoring them<br>
&gt; +<br>
&gt; +Ignoring them might cause the element to continue as if all is fine d=
espite the<br>
&gt; +internal state being inconsistent. This can lead to all kinds of foll=
ow-up<br>
&gt; +issues, including memory safety issues.<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-245<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3847" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3847</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8109" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/ed254790331a3fba2f68255a8f072552d622aac1" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/ed254790331a3fba2f68255a8f072552d622aac1</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + .../gst-plugins-good/gst/isomp4/qtdemux.c=C2=A0 =C2=A0 =C2=A0| 29 ++=
+++++++++++++----<br>
&gt; + 1 file changed, 23 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index 5277952c5ea5..1de70f184f50 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -4853,10 +4853,15 @@ gst_qtdemux_loop_state_header (GstQTDemux * q=
tdemux)<br>
&gt; + beach:<br>
&gt; +=C2=A0 =C2=A0if (ret =3D=3D GST_FLOW_EOS &amp;&amp; (qtdemux-&gt;got_=
moov || qtdemux-&gt;media_caps)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* digested all data, show what we have */<br>
&gt; +-=C2=A0 =C2=A0 qtdemux_prepare_streams (qtdemux);<br>
&gt; ++=C2=A0 =C2=A0 ret =3D qtdemux_prepare_streams (qtdemux);<br>
&gt; ++=C2=A0 =C2=A0 if (ret !=3D GST_FLOW_OK)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0QTDEMUX_EXPOSE_LOCK (qtdemux);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D qtdemux_expose_streams (qtdemux);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0QTDEMUX_EXPOSE_UNLOCK (qtdemux);<br>
&gt; ++=C2=A0 =C2=A0 if (ret !=3D GST_FLOW_OK)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0qtdemux-&gt;state =3D QTDEMUX_STATE_MOVIE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0GST_DEBUG_OBJECT (qtdemux, &quot;switching state =
to STATE_MOVIE (%d)&quot;,<br>
&gt; +@@ -7552,13 +7557,21 @@ gst_qtdemux_process_adapter (GstQTDemux * dem=
ux, gboolean force)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_qtdemux_stream_co=
ncat (demux,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0demux-&=
gt;old_streams, demux-&gt;active_streams);<br>
&gt; +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtdemux_parse_moov (demux,=
 data, demux-&gt;neededbytes);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qtdemux_parse_moov (d=
emux, data, demux-&gt;neededbytes)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D GST_FLOW_ER=
ROR;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtdemux_node_dump (de=
mux, demux-&gt;moov_node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qtdemux_parse_tree (d=
emux);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtdemux_prepare_streams (d=
emux);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D qtdemux_prepare_st=
reams (demux);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D GST_FLOW_OK)<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTDEMUX_EXPOSE_LOCK (=
demux);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtdemux_expose_streams (de=
mux);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D qtdemux_expose_str=
eams (demux);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTDEMUX_EXPOSE_UNLOCK=
 (demux);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D GST_FLOW_OK)<=
br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0demux-&gt;got_moov =
=3D TRUE;<br>
&gt; +<br>
&gt; +@@ -7649,8 +7662,10 @@ gst_qtdemux_process_adapter (GstQTDemux * demu=
x, gboolean force)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* in MSS we need to =
expose the pads after the first moof as we won&#39;t get a moov */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (demux-&gt;variant=
 =3D=3D VARIANT_MSS_FRAGMENTED &amp;&amp; !demux-&gt;exposed) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTDEMUX_EXPOSE=
_LOCK (demux);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qtdemux_expose_stre=
ams (demux);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D qtdemux_exp=
ose_streams (demux);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QTDEMUX_EXPOSE=
_UNLOCK (demux);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret !=3D GST_FL=
OW_OK)<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto done;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gst_qtdemux_check_sen=
d_pending_segment (demux);<br>
&gt; +@@ -13764,8 +13779,10 @@ qtdemux_prepare_streams (GstQTDemux * qtdemu=
x)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* parse the initial sample for use in setting th=
e frame rate cap */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (sample_num =3D=3D 0 &amp;&amp; sample_num =
&lt; stream-&gt;n_samples) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 if (!qtdemux_parse_samples (qtdemux, stream, sa=
mple_num))<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 if (!qtdemux_parse_samples (qtdemux, stream, sa=
mple_num)) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D GST_FLOW_ERROR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0++sample_num;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch b/meta/r=
ecipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012-qtdemux-Check-fo=
r-invalid-atom-length-when-extractin.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..7096a75a71<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0012=
-qtdemux-Check-for-invalid-atom-length-when-extractin.patch<br>
&gt; @@ -0,0 +1,36 @@<br>
&gt; +From 3153fda823cb91b1031dae69738c6c5d526fb6e1 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Thu, 26 Sep 2024 19:16:19 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Check for invalid atom length when extracti=
ng Closed<br>
&gt; + Caption data<br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-243<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3849" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3849</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8109" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/3153fda823cb91b1031dae69738c6c5d526fb6e1" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/3153fda823cb91b1031dae69738c6c5d526fb6e1</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index 1de70f184f50..8850d09321e8 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -5827,7 +5827,7 @@ extract_cc_from_data (QtDemuxStream * stream, c=
onst guint8 * data, gsize size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goto invalid_cdat;<br>
&gt; +=C2=A0 =C2=A0atom_length =3D QT_UINT32 (data);<br>
&gt; +=C2=A0 =C2=A0fourcc =3D QT_FOURCC (data + 4);<br>
&gt; +-=C2=A0 if (G_UNLIKELY (atom_length &gt; size || atom_length =3D=3D 8=
))<br>
&gt; ++=C2=A0 if (G_UNLIKELY (atom_length &gt; size || atom_length &lt;=3D =
8))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0goto invalid_cdat;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0GST_DEBUG_OBJECT (stream-&gt;pad, &quot;here&quot;);<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-go=
od/0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch b/meta/recip=
es-multimedia/gstreamer/gstreamer1.0-plugins-good/0013-qtdemux-Add-size-che=
ck-for-parsing-SMI-SEQH-atom.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b379c2f88c<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0013=
-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch<br>
&gt; @@ -0,0 +1,37 @@<br>
&gt; +From 3ce1b812a9531611288af286b5dc6631a11e3f4a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Sebastian=3D20Dr=3DC3=3DB6ge?=3D &lt;<a href=3D"mai=
lto:sebastian@centricular.com" target=3D"_blank">sebastian@centricular.com<=
/a>&gt;<br>
&gt; +Date: Fri, 27 Sep 2024 00:31:36 +0300<br>
&gt; +Subject: [PATCH] qtdemux: Add size check for parsing SMI / SEQH atom<=
br>
&gt; +<br>
&gt; +Thanks to Antonio Morales for finding and reporting the issue.<br>
&gt; +<br>
&gt; +Fixes GHSL-2024-244<br>
&gt; +Fixes <a href=3D"https://gitlab.freedesktop.org/gstreamer/gstreamer/-=
/issues/3853" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedeskt=
op.org/gstreamer/gstreamer/-/issues/3853</a><br>
&gt; +<br>
&gt; +Part-of: &lt;<a href=3D"https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/merge_requests/8109" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8109</a>&gt;<br>
&gt; +<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.freedesktop.org/=
gstreamer/gstreamer/-/commit/3ce1b812a9531611288af286b5dc6631a11e3f4a" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/gstreamer/=
gstreamer/-/commit/3ce1b812a9531611288af286b5dc6631a11e3f4a</a>]<br>
&gt; +CVE: CVE-2024-47537 CVE-2024-47539 CVE-2024-47543 CVE-2024-47544 CVE-=
2024-47545 CVE-2024-47546 CVE-2024-47596 CVE-2024-47597 CVE-2024-47598<br>
&gt; +Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.co=
m" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
&gt; +---<br>
&gt; + subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subp=
rojects/gst-plugins-good/gst/isomp4/qtdemux.c<br>
&gt; +index 8850d09321e8..dc70287a8a9b 100644<br>
&gt; +--- a/gst/isomp4/qtdemux.c<br>
&gt; ++++ b/gst/isomp4/qtdemux.c<br>
&gt; +@@ -10633,8 +10633,9 @@ qtdemux_parse_svq3_stsd_data (GstQTDemux * qt=
demux,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GST_WAR=
NING_OBJECT (qtdemux, &quot;Unexpected second SEQH SMI atom &quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot; found, ignoring&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Note: The=
 size does *not* include the fourcc and the size field itself */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seqh_si=
ze =3D QT_UINT32 (data + 4);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seqh_siz=
e &gt; 0) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seqh_siz=
e &gt; 0 &amp;&amp; seqh_size &lt;=3D size - 8) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
_seqh =3D gst_buffer_new_and_alloc (seqh_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
gst_buffer_fill (_seqh, 0, data + 8, seqh_size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstre=
amer1.0-plugins-good_1.20.7.bb" rel=3D"noreferrer" target=3D"_blank">gstrea=
mer1.0-plugins-good_1.20.7.bb</a> b/meta/recipes-multimedia/gstreamer/<a hr=
ef=3D"http://gstreamer1.0-plugins-good_1.20.7.bb" rel=3D"noreferrer" target=
=3D"_blank">gstreamer1.0-plugins-good_1.20.7.bb</a><br>
&gt; index dfb0c0f342..5427cdb75d 100644<br>
&gt; --- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-good_1.20.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-good_1.20.7.bb</a><br>
&gt; +++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0=
-plugins-good_1.20.7.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0-=
plugins-good_1.20.7.bb</a><br>
&gt; @@ -6,6 +6,19 @@ BUGTRACKER =3D &quot;<a href=3D"https://gitlab.freede=
sktop.org/gstreamer/gst-plugins-good/-/issues" rel=3D"noreferrer" target=3D=
"_blank">https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues=
</a><br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedesktop.org/s=
rc/gst-plugins-good/gst-plugins-good-$%7BPV%7D.tar.xz" rel=3D"noreferrer" t=
arget=3D"_blank">https://gstreamer.freedesktop.org/src/gst-plugins-good/gst=
-plugins-good-${PV}.tar.xz</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-qt-include-=
ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-qtdemux-Skip-zer=
o-sized-boxes-instead-of-stopping-to.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-qtdemux-Fix-inte=
ger-overflow-when-allocating-the-sam.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-qtdemux-Fix-debu=
g-output-during-trun-parsing.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-qtdemux-Don-t-it=
erate-over-all-trun-entries-if-none-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-qtdemux-Check-si=
zes-of-stsc-stco-stts-before-trying-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-qtdemux-Make-sur=
e-only-an-even-number-of-bytes-is-pr.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-qtdemux-Make-sur=
e-enough-data-is-available-before-re.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-qtdemux-Fix-leng=
th-checks-and-offsets-in-stsd-entry-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-qtdemux-Fix-erro=
r-handling-when-parsing-cenc-sample-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-qtdemux-Make-sur=
e-there-are-enough-offsets-to-read-w.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0011-qtdemux-Actually=
-handle-errors-returns-from-various-.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0012-qtdemux-Check-fo=
r-invalid-atom-length-when-extractin.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0013-qtdemux-Add-size=
-check-for-parsing-SMI-SEQH-atom.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;599f093cc833a1e346939ab6e78a3f80468=
55b6da13520aae80dd385434f4ab2&quot;<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#209303): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/209303" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/209303</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11038830=
7/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/110388307/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000091ae78062ac3d807--

