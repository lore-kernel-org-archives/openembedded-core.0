Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D98CCD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 08:46:02 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4215.1780649157816578157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 01:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QoXqpFyZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45eee266c6cso1298592f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 01:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780649156; cv=none;
        d=google.com; s=arc-20240605;
        b=Yx5zVBR/H0xrIbbQjxcsFgyAKkA/XEPlxpN+WiMNCo9GUIttB4V2czMVUU/SQg/Xa3
         PHLrK3ABof+1yBnL71xVQ/kDp4SszDHOhntOSU8d+YYgQge0cIS+dsMTdKAog26Gr4GN
         GDjYxFbXzEp6LzvhWogYtTJjGytiYQTq9e8hdQS4c1gQ1Z12WOzOwamQJAHFULQwfJqS
         I8E8fonZRMvQndjsTS9UaTtTe/yX0kS9KrkpRQMxoPC/nAEgQTx06ASoYeVOQqseuPyS
         xja0IA55ox4wVWhv0K3jjhXViBc9I3ExUAwWWLdgVWUWyBCzHSDgFKiPxnObBJjinYA/
         lv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tjQZFr6UlUanwIfi7CTiT67XpLEAjFjhMW9ulRPV+Dw=;
        fh=Ago9ptZNMSPdKq1W49sYQDQDT1hYcGf1jZm57MZvhhU=;
        b=OKMC5I1jJqNNfWhVBUaL9vtqw94xa8X0dGVtUStOvKPqFhqyLd4btWwE++Kql9KsXk
         r0POcbpOAU7myuPGuhhEqmo+2Vu8SSYJtWCW0lQCMemvDyDBeqG/0YOv47VtqCgjNo8m
         M04yLt54u2a2Ru9gX0EG4t1pBz/uo1NC25wg5QIjf22RqrmQ5sDO33S7GuBCJrWnGWgw
         FaXOinFGBDUZL1AnXdN2xwVVYoNvVVX5MXuYUPPq1budT+o49rEgocHTFfrC006vF8tV
         VPWiaBi7pM1mmqN0n9OC96eWCw9ogBTCZEulh0dt8jaqen7ciaPipKX/aGEhuSwpfLn1
         Cp1w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780649156; x=1781253956; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tjQZFr6UlUanwIfi7CTiT67XpLEAjFjhMW9ulRPV+Dw=;
        b=QoXqpFyZjyCu+uIeIEJEDgtt+c4dHtyh9Q41cAB0UYqFrsHtH7o+C5H6G6GedQIyPR
         fgELACIBSdMx9BSuAS59+qg2iaHaKTuJVSHiJDhPxtz2LdBatruUFPj2ovXDelC8awuW
         dfLZs7OT2kA6U0K1X5ABF/wq4qfQWI+1iNDQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649156; x=1781253956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjQZFr6UlUanwIfi7CTiT67XpLEAjFjhMW9ulRPV+Dw=;
        b=E0RHOTeflZY+8iGmgSAEApIkRHhK9PqeuF1GumY3sgCrHNJSD4sPlCJ8akkAVaOt3/
         Kh8nobhAdUDMsDbHiSywjV6MsUjXL7HJ/6OG93Q8ZdmlB669JpiRiwOu/4JcOORVPOvG
         8pIlYNeX1jGKl3G+Y4BFLejHeRXJpecEvghzp0urn9V0sxIFfAdV0drWn/ZlxLDMD3LK
         XNCpo7oZLYD90L8P+7v7E+7Ng+gNJGN2iBlcQe8hHBsAnRlzeUSyGbDSEioUtm16GufC
         N+qp8p2mXDfon9uFjcbpy/3Qv0DjH9S/LcnTeBESaisoH+eQPnMhS9xMVdRXsG/QO0L0
         XPvw==
X-Forwarded-Encrypted: i=1; AFNElJ9InHjTyM18e5dbRgWBjT9u0hwh4ZQVMz79Ub/yQyDYeTyNL/+g9gyB3MOIySx9pKLktp8XJQCIUftdsXPYcI6OHw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdoivRjlr4uS+C7ppd1GxgXZFyUuGJNGKTN9k8HtmaON1pZ1li
	1v9ypf5uIT/aPETBP4RJRbp1C7bSEd/iWo4heKcmaJcw/eot3zmkyNpbaWFPKosCq3YfEDOwoKV
	PODYORZrSa3pmiaODxJwnxeUCr+yiIKRUCvpcsM1eJQ==
X-Gm-Gg: Acq92OF091mPNol0316EDH3D7xXlS6lAY0uYSJES5Xu1Bvdtpr/jqCkm7bmeNfuywyp
	kfP7TdFbbRS4u2fyUaJBcx0LGqTRGYpLTNL4pfZL/ZlfyF5PKqS1QuHEPXu8HLAGCfoqqHMhQrZ
	5oRNlPDeFFwzlY6oTibNJ1FKmD6eeJy584JEa0miR3Hh3K2VdzIN9ZAUJEzrcNhkjOnNt91D89a
	o87pa7LAh1m6u0hjn8oGOesQHls3Xe1eNjr8zr4qMiM8E0cEuZETPkt02K6hTUeMBMn6pB5fQaF
	57Q6lAd9+cXlCbKHGA0nW8QQlLdR7SrWmKhjmtYCYl6ZyatFZ7sw
X-Received: by 2002:adf:f947:0:b0:43f:e934:50ac with SMTP id
 ffacd0b85a97d-460302e0899mr3139228f8f.7.1780649154942; Fri, 05 Jun 2026
 01:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260520081403.3052797-1-hsimeliere.opensource@witekio.com> <DJ0529SO7U38.2KY8QAKJ8TRSU@smile.fr>
In-Reply-To: <DJ0529SO7U38.2KY8QAKJ8TRSU@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 5 Jun 2026 10:45:29 +0200
X-Gm-Features: AVVi8Ce5QB3kApoyGuREpRfPxPX3c-JrtNH-NOEPdm_qwLZCV3VVv9LyTPWGjM8
Message-ID: <CAMSfU+6QETjush0pqLyZjdxO8UtNOvu2hLLZby3fsEP9HOH1XQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/7] gnutls: Fix CVE-2026-33846
To: hsimeliere.opensource@witekio.com, 
	openembedded-core@lists.openembedded.org
Cc: Bruno VERNAY <bruno.vernay@se.com>
Content-Type: multipart/alternative; boundary="00000000000059b01c06537db06e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 08:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238153

--00000000000059b01c06537db06e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 4 juin 2026 =C3=A0 10:57, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :

> On Wed May 20, 2026 at 10:13 AM CEST, Hugo Simeliere via
> lists.openembedded.org wrote:
> > From: "Hugo SIMELIERE (Schneider Electric)" <
> hsimeliere.opensource@witekio.com>
> >
> > Pick patch from [1] as mentioned in Debian report in [2].
> > Pick pre-patch [3] to minimize conflicts.
> >
> > [1]
> https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d=
383d1ff78
> > [2] https://security-tracker.debian.org/tracker/CVE-2026-33846
> > [3]
> https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1b=
f4cbd1fc0
> >
> > Signed-off-by: Hugo SIMELIERE (Schneider Electric) <
> hsimeliere.opensource@witekio.com>
> > Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
> > ---
> >  .../gnutls/gnutls/CVE-2026-33846-pre.patch    | 97 +++++++++++++++++++
> >  .../gnutls/gnutls/CVE-2026-33846.patch        | 67 +++++++++++++
> >  meta/recipes-support/gnutls/gnutls_3.8.4.bb   |  2 +
> >  3 files changed, 166 insertions(+)
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
> >  create mode 100644
> meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> >
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patc=
h
> b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
> > new file mode 100644
> > index 0000000000..71266cb338
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch
> > @@ -0,0 +1,97 @@
> > +From e51ef765b942968949e29797a73727c371397eea Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Fri, 17 Apr 2026 17:49:31 +0200
> > +Subject: [PATCH 1/2] buffers: shorten merge_handshake_packet using
> recv_buf
>
> As far as I can tell this patch is only cosmetic and I'd rather not
> merge it unless you have a compeling reason.
>
> To apply CVE-2026-33846.patch, it looks like you will need to change it
> to use "session->internals.handshake_recv_buffer" instead of "recv_buf".
>

Hello,

Actually, scratch that. I've discussed it with Paul. In this case, the
review will be easier with the cosmetic "-pre" patches.
So, don't change that. Sorry for the noise.

Regards,


>
> Regards,
>
> > +
> > +I had vague concerns about thread-safety of this,
> > +but then this pattern already exists within the file.
> > +
> > +CVE: CVE-2026-33846
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1b=
f4cbd1fc0
> ]
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +(cherry picked from commit 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0)
> > +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <
> hsimeliere.opensource@witekio.com>
> > +---
> > + lib/buffers.c | 52 +++++++++++++++++---------------------------------=
-
> > + 1 file changed, 17 insertions(+), 35 deletions(-)
> > +
> > +diff --git a/lib/buffers.c b/lib/buffers.c
> > +index 672380b05..d54c77022 100644
> > +--- a/lib/buffers.c
> > ++++ b/lib/buffers.c
> > +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_=
t
> session,
> > +     int exists =3D 0, i, pos =3D 0;
> > +     int ret;
> > +
> > ++    handshake_buffer_st *recv_buf =3D
> > ++            session->internals.handshake_recv_buffer;
> > ++
> > +     for (i =3D 0; i < session->internals.handshake_recv_buffer_size;
> i++) {
> > +-            if (session->internals.handshake_recv_buffer[i].htype =3D=
=3D
> > +-                hsk->htype) {
> > ++            if (recv_buf[i].htype =3D=3D hsk->htype) {
> > +                     exists =3D 1;
> > +                     pos =3D i;
> > +                     break;
> > +@@ -1005,44 +1007,24 @@ static int
> merge_handshake_packet(gnutls_session_t session,
> > +             _gnutls_write_uint24(0, &hsk->header[6]);
> > +             _gnutls_write_uint24(hsk->length, &hsk->header[9]);
> > +
> > +-            _gnutls_handshake_buffer_move(
> > +-                    &session->internals.handshake_recv_buffer[pos],
> hsk);
> > ++            _gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> > +
> > +     } else {
> > +-            if (hsk->start_offset <
> > +-                        session->internals.handshake_recv_buffer[pos]
> > +-                                .start_offset &&
> > +-                hsk->end_offset + 1 >=3D
> > +-                        session->internals.handshake_recv_buffer[pos]
> > +-                                .start_offset) {
> > +-
> memcpy(&session->internals.handshake_recv_buffer[pos]
> > +-                                    .data.data[hsk->start_offset],
> > ++            if (hsk->start_offset < recv_buf[pos].start_offset &&
> > ++                hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) =
{
> > ++                    memcpy(&recv_buf[pos].data.data[hsk->start_offset=
],
> > +                            hsk->data.data, hsk->data.length);
> > +-                    session->internals.handshake_recv_buffer[pos]
> > +-                            .start_offset =3D hsk->start_offset;
> > +-                    session->internals.handshake_recv_buffer[pos]
> > +-                            .end_offset =3D MIN(
> > +-                            hsk->end_offset,
> > +-
> session->internals.handshake_recv_buffer[pos]
> > +-                                    .end_offset);
> > +-            } else if (hsk->end_offset >
> > +-
>  session->internals.handshake_recv_buffer[pos]
> > +-                                       .end_offset &&
> > +-                       hsk->start_offset <=3D
> > +-
>  session->internals.handshake_recv_buffer[pos]
> > +-                                               .end_offset +
> > +-                                       1) {
> > +-
> memcpy(&session->internals.handshake_recv_buffer[pos]
> > +-                                    .data.data[hsk->start_offset],
> > ++                    recv_buf[pos].start_offset =3D hsk->start_offset;
> > ++                    recv_buf[pos].end_offset =3D
> > ++                            MIN(hsk->end_offset,
> recv_buf[pos].end_offset);
> > ++            } else if (hsk->end_offset > recv_buf[pos].end_offset &&
> > ++                       hsk->start_offset <=3D recv_buf[pos].end_offse=
t +
> 1) {
> > ++                    memcpy(&recv_buf[pos].data.data[hsk->start_offset=
],
> > +                            hsk->data.data, hsk->data.length);
> > +
> > +-                    session->internals.handshake_recv_buffer[pos]
> > +-                            .end_offset =3D hsk->end_offset;
> > +-                    session->internals.handshake_recv_buffer[pos]
> > +-                            .start_offset =3D MIN(
> > +-                            hsk->start_offset,
> > +-
> session->internals.handshake_recv_buffer[pos]
> > +-                                    .start_offset);
> > ++                    recv_buf[pos].end_offset =3D hsk->end_offset;
> > ++                    recv_buf[pos].start_offset =3D MIN(
> > ++                            hsk->start_offset,
> recv_buf[pos].start_offset);
> > +             }
> > +             _gnutls_handshake_buffer_clear(hsk);
> > +     }
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> > new file mode 100644
> > index 0000000000..e7d5cc6c2b
> > --- /dev/null
> > +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> > @@ -0,0 +1,67 @@
> > +From 68e0c900c1111206fa4a135cdb43827f3b908284 Mon Sep 17 00:00:00 2001
> > +From: Alexander Sosedkin <asosedkin@redhat.com>
> > +Date: Fri, 17 Apr 2026 18:21:36 +0200
> > +Subject: [PATCH 2/2] buffers: add more checks to DTLS reassembly
> > +
> > +Previously, gnutls didn't check that DTLS fragments claimed
> > +a consistent message_length value.
> > +Additionally, a crucial array size check was missing,
> > +enabling an attacker to cause a heap overwrite.
> > +The updated version rejects fragments with mismatching length
> > +and adds a missing boundary check.
> > +
> > +Reported-by: Haruto Kimura (Stella)
> > +Reported-by: Oscar Reparaz
> > +Reported-by: Zou Dikai
> > +Fixes: #1816
> > +Fixes: #1838
> > +Fixes: #1839
> > +Fixes: CVE-2026-33846
> > +Fixes: GNUTLS-SA-2026-04-29-1
> > +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
> > +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> > +
> > +CVE: CVE-2026-33846
> > +Upstream-Status: Backport [
> https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d=
383d1ff78
> ]
> > +
> > +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> > +(cherry picked from commit 65ab33fa54e34fba69d793735b7df3d383d1ff78)
> > +Signed-off-by: Hugo SIMELIERE (Schneider Electric) <
> hsimeliere.opensource@witekio.com>
> > +---
> > + lib/buffers.c | 20 ++++++++++++++++++++
> > + 1 file changed, 20 insertions(+)
> > +
> > +diff --git a/lib/buffers.c b/lib/buffers.c
> > +index d54c77022..5d4d16276 100644
> > +--- a/lib/buffers.c
> > ++++ b/lib/buffers.c
> > +@@ -1010,6 +1010,26 @@ static int
> merge_handshake_packet(gnutls_session_t session,
> > +             _gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> > +
> > +     } else {
> > ++            if (hsk->length !=3D recv_buf[pos].length) {
> > ++                    /* inconsistent across fragments */
> > ++                    _gnutls_handshake_buffer_clear(hsk);
> > ++                    return gnutls_assert_val(
> > ++                            GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> > ++            }
> > ++            /* start_offset + data.length <=3D hsk->length <=3D max_l=
ength
> */
> > ++            if (hsk->length < hsk->start_offset + hsk->data.length) {
> > ++                    /* impossible claims, overflow requested */
> > ++                    _gnutls_handshake_buffer_clear(hsk);
> > ++                    return gnutls_assert_val(
> > ++                            GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> > ++            }
> > ++            if (hsk->length > recv_buf[pos].data.max_length) {
> > ++                    /* we don't have this much allocated, overflow
> guard */
> > ++                    _gnutls_handshake_buffer_clear(hsk);
> > ++                    return gnutls_assert_val(
> > ++                            GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> > ++            }
> > ++
> > +             if (hsk->start_offset < recv_buf[pos].start_offset &&
> > +                 hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) =
{
> > +                     memcpy(&recv_buf[pos].data.data[hsk->start_offset=
],
> > +--
> > +2.43.0
> > +
> > diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> > index ccb6a2b4b2..e40a654a8e 100644
> > --- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> > +++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
> > @@ -43,6 +43,8 @@ SRC_URI =3D "
> https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
> >             file://CVE-2025-14831-7.patch \
> >             file://CVE-2025-14831-8.patch \
> >             file://CVE-2025-14831-9.patch \
> > +           file://CVE-2026-33846-pre.patch \
> > +           file://CVE-2026-33846.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D
> "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
>
>
> --
> Yoann Congal
> Smile ECS
>
>

--=20
Yoann Congal
Smile ECS

--00000000000059b01c06537db06e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 4 =
juin 2026 =C3=A0=C2=A010:57, Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Wed May 20, 2026 at 10:13 =
AM CEST, Hugo Simeliere via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: &quot;Hugo SIMELIERE (Schneider Electric)&quot; &lt;<a href=3D"m=
ailto:hsimeliere.opensource@witekio.com" target=3D"_blank">hsimeliere.opens=
ource@witekio.com</a>&gt;<br>
&gt;<br>
&gt; Pick patch from [1] as mentioned in Debian report in [2].<br>
&gt; Pick pre-patch [3] to minimize conflicts.<br>
&gt;<br>
&gt; [1] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34=
fba69d793735b7df3d383d1ff78" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78</=
a><br>
&gt; [2] <a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-33=
846" rel=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.o=
rg/tracker/CVE-2026-33846</a><br>
&gt; [3] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23=
bbb218f5ec3bd4bb1bf4cbd1fc0" rel=3D"noreferrer" target=3D"_blank">https://g=
itlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0</=
a><br>
&gt;<br>
&gt; Signed-off-by: Hugo SIMELIERE (Schneider Electric) &lt;<a href=3D"mail=
to:hsimeliere.opensource@witekio.com" target=3D"_blank">hsimeliere.opensour=
ce@witekio.com</a>&gt;<br>
&gt; Reviewed-by: Bruno VERNAY &lt;<a href=3D"mailto:bruno.vernay@se.com" t=
arget=3D"_blank">bruno.vernay@se.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2026-33846-pre.patch=C2=A0 =C2=A0 | 97 +++=
++++++++++++++++<br>
&gt;=C2=A0 .../gnutls/gnutls/CVE-2026-33846.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 67 +++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a>=C2=A0 =C2=A0|=C2=A0=
 2 +<br>
&gt;=C2=A0 3 files changed, 166 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3=
3846-pre.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3=
3846.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.pat=
ch b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..71266cb338<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846-pre.patch<br>
&gt; @@ -0,0 +1,97 @@<br>
&gt; +From e51ef765b942968949e29797a73727c371397eea Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Fri, 17 Apr 2026 17:49:31 +0200<br>
&gt; +Subject: [PATCH 1/2] buffers: shorten merge_handshake_packet using re=
cv_buf<br>
<br>
As far as I can tell this patch is only cosmetic and I&#39;d rather not<br>
merge it unless you have a compeling reason.<br>
<br>
To apply CVE-2026-33846.patch, it looks like you will need to change it<br>
to use &quot;session-&gt;internals.handshake_recv_buffer&quot; instead of &=
quot;recv_buf&quot;.<br></blockquote><div><br></div><div>Hello,</div><div><=
br></div><div>Actually, scratch that. I&#39;ve discussed it with Paul. In t=
his case, the review will be easier with the cosmetic &quot;-pre&quot; patc=
hes.</div><div>So, don&#39;t change that. Sorry for the noise.</div><div><b=
r></div><div>Regards,</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Regards,<br>
<br>
&gt; +<br>
&gt; +I had vague concerns about thread-safety of this,<br>
&gt; +but then this pattern already exists within the file.<br>
&gt; +<br>
&gt; +CVE: CVE-2026-33846<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb21=
8f5ec3bd4bb1bf4cbd1fc0</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +(cherry picked from commit 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0)<=
br>
&gt; +Signed-off-by: Hugo SIMELIERE (Schneider Electric) &lt;<a href=3D"mai=
lto:hsimeliere.opensource@witekio.com" target=3D"_blank">hsimeliere.opensou=
rce@witekio.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/buffers.c | 52 +++++++++++++++++--------------------------------=
--<br>
&gt; + 1 file changed, 17 insertions(+), 35 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/buffers.c b/lib/buffers.c<br>
&gt; +index 672380b05..d54c77022 100644<br>
&gt; +--- a/lib/buffers.c<br>
&gt; ++++ b/lib/buffers.c<br>
&gt; +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session=
_t session,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int exists =3D 0, i, pos =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; + <br>
&gt; ++=C2=A0 =C2=A0 handshake_buffer_st *recv_buf =3D<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 session-&gt;internals.hand=
shake_recv_buffer;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; session-&gt;internals.handsh=
ake_recv_buffer_size; i++) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (session-&gt;internals.=
handshake_recv_buffer[i].htype =3D=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;htyp=
e) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (recv_buf[i].htype =3D=
=3D hsk-&gt;htype) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0exists =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pos =3D i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0break;<br>
&gt; +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_sess=
ion_t session,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_gnutls_write_uint24(=
0, &amp;hsk-&gt;header[6]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_gnutls_write_uint24(=
hsk-&gt;length, &amp;hsk-&gt;header[9]);<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _gnutls_handshake_buffer_m=
ove(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;session-&gt;internals.handshake_recv_buffer[pos], hsk);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _gnutls_handshake_buffer_m=
ove(&amp;recv_buf[pos], hsk);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hsk-&gt;start_offset &=
lt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start_offset &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;end_=
offset + 1 &gt;=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start_offset) {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memcpy(&amp;session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data.data[hsk-=
&gt;start_offset],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hsk-&gt;start_offset &=
lt; recv_buf[pos].start_offset &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;end_=
offset + 1 &gt;=3D recv_buf[pos].start_offset) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memcpy(&amp;recv_buf[pos].data.data[hsk-&gt;start_offset],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;data.data, hsk-&gt;data.length);<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start_offset =3D hsk-&gt;start_offset;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end_offset =3D MIN(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;end_offset,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 session-&gt;internals.handshake_recv_buffer=
[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end_offset);<b=
r>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (hsk-&gt;end_off=
set &gt;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0session-&gt;internals.handshak=
e_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.e=
nd_offset &amp;&amp;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0hsk-&gt;start_offset &lt;=3D<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0session-&gt;internals.handshak=
e_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0.end_offset +<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01)=
 {<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memcpy(&amp;session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data.data[hsk-=
&gt;start_offset],<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 recv_buf[pos].start_offset =3D hsk-&gt;start_offset;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 recv_buf[pos].end_offset =3D<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MIN(hsk-&gt;end_offset, recv_buf[pos].end_o=
ffset);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (hsk-&gt;end_off=
set &gt; recv_buf[pos].end_offset &amp;&amp;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0hsk-&gt;start_offset &lt;=3D recv_buf[pos].end_offset + 1)=
 {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 memcpy(&amp;recv_buf[pos].data.data[hsk-&gt;start_offset],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;data.data, hsk-&gt;data.length);<br>
&gt; + <br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end_offset =3D hsk-&gt;end_offset;<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start_offset =3D MIN(<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;start_offset,<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 session-&gt;internals.handshake_recv_buffer=
[pos]<br>
&gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start_offset);=
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 recv_buf[pos].end_offset =3D hsk-&gt;end_offset;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 recv_buf[pos].start_offset =3D MIN(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hsk-&gt;start_offset, recv_buf[pos].start_o=
ffset);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_gnutls_handshake_buf=
fer_clear(hsk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b=
/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e7d5cc6c2b<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch<br>
&gt; @@ -0,0 +1,67 @@<br>
&gt; +From 68e0c900c1111206fa4a135cdb43827f3b908284 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@redhat.com" =
target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +Date: Fri, 17 Apr 2026 18:21:36 +0200<br>
&gt; +Subject: [PATCH 2/2] buffers: add more checks to DTLS reassembly<br>
&gt; +<br>
&gt; +Previously, gnutls didn&#39;t check that DTLS fragments claimed<br>
&gt; +a consistent message_length value.<br>
&gt; +Additionally, a crucial array size check was missing,<br>
&gt; +enabling an attacker to cause a heap overwrite.<br>
&gt; +The updated version rejects fragments with mismatching length<br>
&gt; +and adds a missing boundary check.<br>
&gt; +<br>
&gt; +Reported-by: Haruto Kimura (Stella)<br>
&gt; +Reported-by: Oscar Reparaz<br>
&gt; +Reported-by: Zou Dikai<br>
&gt; +Fixes: #1816<br>
&gt; +Fixes: #1838<br>
&gt; +Fixes: #1839<br>
&gt; +Fixes: CVE-2026-33846<br>
&gt; +Fixes: GNUTLS-SA-2026-04-29-1<br>
&gt; +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H<br>
&gt; +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H<br>
&gt; +<br>
&gt; +CVE: CVE-2026-33846<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/gnutls/gnutl=
s/-/commit/65ab33fa54e34fba69d793735b7df3d383d1ff78" rel=3D"noreferrer" tar=
get=3D"_blank">https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69=
d793735b7df3d383d1ff78</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;<a href=3D"mailto:asosedkin@red=
hat.com" target=3D"_blank">asosedkin@redhat.com</a>&gt;<br>
&gt; +(cherry picked from commit 65ab33fa54e34fba69d793735b7df3d383d1ff78)<=
br>
&gt; +Signed-off-by: Hugo SIMELIERE (Schneider Electric) &lt;<a href=3D"mai=
lto:hsimeliere.opensource@witekio.com" target=3D"_blank">hsimeliere.opensou=
rce@witekio.com</a>&gt;<br>
&gt; +---<br>
&gt; + lib/buffers.c | 20 ++++++++++++++++++++<br>
&gt; + 1 file changed, 20 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/lib/buffers.c b/lib/buffers.c<br>
&gt; +index d54c77022..5d4d16276 100644<br>
&gt; +--- a/lib/buffers.c<br>
&gt; ++++ b/lib/buffers.c<br>
&gt; +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_sessi=
on_t session,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_gnutls_handshake_buf=
fer_move(&amp;recv_buf[pos], hsk);<br>
&gt; + <br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hsk-&gt;length !=3D re=
cv_buf[pos].length) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* inconsistent across fragments */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _gnutls_handshake_buffer_clear(hsk);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNUTLS_E_UNEXPECTED_PACKET_LENGTH);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* start_offset + data.len=
gth &lt;=3D hsk-&gt;length &lt;=3D max_length */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hsk-&gt;length &lt; hs=
k-&gt;start_offset + hsk-&gt;data.length) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* impossible claims, overflow requested */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _gnutls_handshake_buffer_clear(hsk);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNUTLS_E_UNEXPECTED_PACKET_LENGTH);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hsk-&gt;length &gt; re=
cv_buf[pos].data.max_length) {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* we don&#39;t have this much allocated, overflow guard */<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 _gnutls_handshake_buffer_clear(hsk);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return gnutls_assert_val(<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GNUTLS_E_UNEXPECTED_PACKET_LENGTH);<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hsk-&gt;start_off=
set &lt; recv_buf[pos].start_offset &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hsk-&gt=
;end_offset + 1 &gt;=3D recv_buf[pos].start_offset) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0memcpy(&amp;recv_buf[pos].data.data[hsk-&gt;start_offset],<br>
&gt; +-- <br>
&gt; +2.43.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.=
4.bb" rel=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a> b/meta/recip=
es-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gnutls_3.8.4.bb</a><br>
&gt; index ccb6a2b4b2..e40a654a8e 100644<br>
&gt; --- a/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a><br>
&gt; +++ b/meta/recipes-support/gnutls/<a href=3D"http://gnutls_3.8.4.bb" r=
el=3D"noreferrer" target=3D"_blank">gnutls_3.8.4.bb</a><br>
&gt; @@ -43,6 +43,8 @@ SRC_URI =3D &quot;<a href=3D"https://www.gnupg.org/f=
tp/gcrypt/gnutls/v$%7BSHRT_VER%7D/gnutls-$%7BPV%7D.tar" rel=3D"noreferrer" =
target=3D"_blank">https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnut=
ls-${PV}.tar</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-7=
.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-8=
.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2025-14831-9=
.patch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-33846-pre.pa=
tch \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-33846.patch =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 SRC_URI[sha256sum] =3D &quot;2bea4e154794f3f00180fa2a5c51fe8b005=
ac7a31cd58bd44cdfa7f36ebc3a9b&quot;<br>
<br>
<br>
-- <br>
Yoann Congal<br>
Smile ECS<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--00000000000059b01c06537db06e--

