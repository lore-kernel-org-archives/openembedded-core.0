Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53869CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 22:30:13 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.773.1778625007803128246
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 15:30:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QZYvgVCb;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-654672a6d68so6675767d50.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 15:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778625007; cv=none;
        d=google.com; s=arc-20240605;
        b=LsDF6PHu/mAGBoC2QcD/h5VljomhCRyCS4tBJMmBwcXL9r/j3D7SnA+83jJVPWJ/r1
         dlMcAY6RA8Tly31XCX+I6m1RitalD/Kjn41P2iqV1dcjzeLC1+aYcttVqsQTkb2OLzQ+
         YmzhUrFaYcIZsAMlTKgqgf5BaaOI1HtfLqUtGwrodgHrdRBuyD42QPjK0tc1LPVcJv3o
         fpH/mkfFb9UN5q+CKEM3Lx7MwodihZY/zBmPCezONKXzBTw2t+DHYmAnharOxHezPdD6
         JA1dilGD5jBc2Bbs/yP36fwM4mWVuk/hJ5D34uUvH5jLTvEdzp1hZN9rtbnzGbJb6Xux
         0h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r33/Oxn40m28a4hD30H0GD3LLbhyQQNqgmPjLCj0MYA=;
        fh=/0bD1tHDTlNqNV+s0MufUGqSvGjmuOTE19tshw4lm28=;
        b=jHWs6ncwcuEIzVRULwPWBZ+aYDWFlvs9k8aFp7hRVhBofAB7msIE3p3tsBjHz/HXDZ
         oxH87j9p/yeRt6ilkYkVS8XtrVvzoYh5PFeo4JAqBBZvm4VSeBW1MxwT699/xkkqFNTb
         MLjIYvwprbcJua/GGAlhdWKlLu1ruUQ+PsMtj2jXbLnCJWXuFx1Fv4B1dqntsDctwawP
         mtgY9gOY1HEbtsT6Rxe2+yEn2w6MR6Ob95VJNGiQd9sssOyKkETKiM2kuDKEJ+cwOeCi
         Ucpp0ymOr7xwuC85Q+fvvBxo/dO3RdBOIiik28tDbhOOzy48FbOrpARTmHnL8LvD2hTb
         OQWQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778625007; x=1779229807; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r33/Oxn40m28a4hD30H0GD3LLbhyQQNqgmPjLCj0MYA=;
        b=QZYvgVCbNQCHqo2DMDa2zjVPCGQLtIog18N8a3H9U04CvKwNt2qaQDrD4UOaCaC+fk
         KAdCfLN6ISU2UzAScrb1cLgzurcXEVKLbHD1rK596f+PnF2V6i47cZAgYuqLOCdujf4n
         HGU1bZvpaHYlOcfCKD0dw9HgZSs0rkIiX7SHaPZ2d6eNSg9geHqOMa7On+6zFiJsC5br
         4AgZPJ1UP/OjH8aaMZkIEeFMzL0bYCoHsPtKgd5HmVePU/rVsONT1AGLx/hidFdmLU4N
         GN+YGUT+MRYUUI8T49KW7wr+LxAxOcSKRbpR8+X2SpbAB95CvDT32secSYYkXBKbepbN
         rv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778625007; x=1779229807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r33/Oxn40m28a4hD30H0GD3LLbhyQQNqgmPjLCj0MYA=;
        b=D+I1VNLlm7gwJKwAx6QyJvVS3vq/1t1Z0VnMLmBuuL1KUNGCZ5LMU7bzXs3ofy2zHS
         cnva9ubfAtZWR76bfLyIFV+mcwtwbT+xHOwqtBh6HuGfJ3NLEj0ldOjJ5bLS4XA2QfyR
         x3FR0+E8qY7nsqbcpIzNbfdi4w9TbSbrldg5qSMXy+U4sFL2PsXrdtyY4ittYvREB8CM
         AkwQUF+ZQKkm4HbtHKDKJBc64mTO3qFjHWUb6z9dG8fvUA1/jvUsgkkshvCyvDBgAeqk
         mdo1pNxJct3wT0a/H1ME9iY+0dr3D8JO2lUQmLY7r+iUNRPSPluOgdcNVYb/vzJehtET
         P+AA==
X-Gm-Message-State: AOJu0YyqMq8tEIe5etsxT80zqLoq7hQdRt/JYHx7YRh8X2ZIB4+xdHe0
	y15KcqtxE30kzPtYivevXaPrgk1J2gp/RR0OmSk0Jsmg0rafYC8tLO6RKswzMWA1m8AtDlvxYUC
	6XKQiaBjnsDHaDplY1WOKjD5CWNIJp6k=
X-Gm-Gg: Acq92OEZ0/bsUy9KAqGn7aYnl0jvOUNcWlCOV5PVYyvdWNEn7tj+h9NBHz/lIEWIYWJ
	TNqfTbrGFR9Pm55mQHQ4vHkln2+NtuKbhMr27Sf5TL4UDgythcS3KW/rPeKtA1K5Vgh9GRVu4GI
	czf12vE5Lh+v9gKeCe3mSqr3ePAjRjAhMrYq8bxZuxJhSVNCmrLRg+RyQPsin1HToQ9YO+RgExv
	dcRzVzgw1Z/vxqZwrlFF+gqBbL00NeefPTm5zroQWAbQyHRkGbG9aDNC/E1Hm1Y9P8vi3nYnPQ9
	EoIURVgjHuSp5hWqhenXyA==
X-Received: by 2002:a05:690e:11c9:b0:650:5f31:2334 with SMTP id
 956f58d0204a3-65df62cab1dmr813500d50.32.1778625006810; Tue, 12 May 2026
 15:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260512-sbom-zstd-support-v1-0-93273381d548@bootlin.com>
 <20260512-sbom-zstd-support-v1-2-93273381d548@bootlin.com> <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
In-Reply-To: <CAJdd5GZfKYWsR3Ryw7OFpbe6qD-HaKXm8o2CENby1q5H9oZrkQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 12 May 2026 16:29:54 -0600
X-Gm-Features: AVHnY4KZohC85J3RHByY-mO5CVjabjl420LBQVXnJEYo0KLJ_8D3gYX4i6lVZ5g
Message-ID: <CAJdd5GZQpHzwYaqpMQ41JgsZov_C8G_5ireXw1vK=uXRa8QvBA@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2] spdx3: support SBOM compression based on SPDX_SBOM_EXT
To: jeremie.dautheribes@bootlin.com
Cc: openembedded-core@lists.openembedded.org, miquel.raynal@bootlin.com, 
	thomas.petazzoni@bootlin.com, benjamin.robin@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 22:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236917

On Tue, May 12, 2026 at 4:27=E2=80=AFPM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Tue, May 12, 2026 at 11:02=E2=80=AFAM J=C3=A9r=C3=A9mie Dautheribes vi=
a
> lists.openembedded.org
> <jeremie.dautheribes=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Add support for optional zstd compression for all types of SBOMs,
> > including:
> >   - image SBOM
> >   - recipe SBOM
> >   - SDK SBOM

We should perhaps also implement decompression when reading in
documents, so that the intermediate documents are compressed as well;
if we are allowing the final documents to be compressed, I don't see a
compelling reason why we wouldn't just compress all of them.

> >
> > Zstd compression is applied if SPDX_SBOM_EXT ends with ".zst".
> >
> > Co-authored-by: Benjamin Robin (Schneider Electric) <benjamin.robin@boo=
tlin.com>
> > Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jere=
mie.dautheribes@bootlin.com>
> > ---
> >  meta/classes/create-spdx-3.0.bbclass |  3 ++-
> >  meta/lib/oe/sbom30.py                | 11 +++++++++--
> >  2 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create=
-spdx-3.0.bbclass
> > index 785edb9865..6cf8fa4688 100644
> > --- a/meta/classes/create-spdx-3.0.bbclass
> > +++ b/meta/classes/create-spdx-3.0.bbclass
> > @@ -75,7 +75,8 @@ SPDX_IMPORTS[doc] =3D "SPDX_IMPORTS is the base varia=
ble that describes how to \
> >              SPDX 3 spec. Optional but recommended"
> >
> >  SPDX_SBOM_EXT ??=3D ".spdx.json"
> > -SPDX_SBOM_EXT[doc] =3D "SBOM file extension name."
> > +SPDX_SBOM_EXT[doc] =3D "SBOM file extension name.\
> > +    If it ends with '.zst', SBOMs are automatically compressed using Z=
std."
> >
> >  # Agents
> >  #   Bitbake variables can be used to describe an SPDX Agent that may b=
e used
> > diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
> > index 0f1f9281ad..2184c1a07f 100644
> > --- a/meta/lib/oe/sbom30.py
> > +++ b/meta/lib/oe/sbom30.py
> > @@ -1036,8 +1036,15 @@ def write_jsonld_doc(d, objset, dest):
> >          serializer =3D oe.spdx30.JSONLDInlineSerializer()
> >
> >      objset.objects.add(objset.doc)
> > -    with dest.open("wb") as f:
> > -        serializer.write(objset, f, force_at_graph=3DTrue)
> > +
> > +    if dest.name.endswith(".zst"):
>
> I'm not sure I like this detection mechanism; I think we usually do
> something more explicit for compression rather than relying on the
> suffix in other places?
>
> > +        num_threads =3D int(d.getVar("BB_NUMBER_THREADS"))
>
> The API is oe.utils.parallel_make_argument()
>
> > +        with bb.compress.zstd.open(dest, "w", num_threads=3Dnum_thread=
s) as f:
> > +            serializer.write(objset, f, force_at_graph=3DTrue)
> > +    else:
> > +        with dest.open("wb") as f:
> > +            serializer.write(objset, f, force_at_graph=3DTrue)
> > +
> >      objset.objects.remove(objset.doc)
> >
> >
> >
> > --
> > 2.54.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#236897): https://lists.openembedded.org/g/openembed=
ded-core/message/236897
> > Mute This Topic: https://lists.openembedded.org/mt/119282964/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

