Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7111FC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 14:20:35 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.406.1754403629165445913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 07:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hWP8g+mS;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.179, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e9025db31e7so82476276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754403628; x=1755008428; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmN3l3s7GpCekR5jSJq/xjSc8DSZ0lssrgl+Gl5mKts=;
        b=hWP8g+mSzyHSUjExlLUhtzLCuWpsbYjDzKfwgY4wMdycOuQhQNs3SGXEL+n4/qqP19
         yngAasU4B7VtDEqjsut5Gun/WB+MN81UOAlhsLuq+ycLZTivgGpB7CBOpJi4aNaE7VY3
         qoM2eEKDeOO/3xIrt5l8vTFjslQixmdsCod1HorxT+gL0nIk7cLL8s20USETozoAEuhM
         cT7wPOBqJEGLXeTACrG5eg5k0U51dsG2KLrLsnnbcY23PkZa2Q+gQSZw9+3bjEE0pEYI
         mv5nM5rYG4WplmMKqmyizFe5dDaZc5nsYGOscKDFGWrwJYg7usv9l2VwR1aoDKS9O2z5
         V7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403628; x=1755008428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmN3l3s7GpCekR5jSJq/xjSc8DSZ0lssrgl+Gl5mKts=;
        b=TXaJaYrfFbuIWfU9KDOdQp1W7XRD/ZoUzVK3+G2MzwkAT05v216tDQEhVJie5Uo6t+
         VO19GTAfJz4cgYvJv0PoHqPx4k5iBh/UhjYUtKT4Mkyf5zv7bR5Q77G4qlGMf3QaImlC
         VTSh8aknMnvWcA6jeecs8Kuw2dT/8LJTqz7VQpCgWPELoPy72RtRkRh51oDXNJRJIHqj
         nQQhU8/LmzU7fARJMMLRjdUg8B69tF2TrDzOsI6+kCFfEEQ6viXNR7OKU6JvJ25nZIxM
         0axVfTwG+vFhVzXkautAwG+eJ5UDv94K7ydD+4OuTO3xYr77oLkZMWqpbSrz5nnWVEdN
         Nvhw==
X-Forwarded-Encrypted: i=1; AJvYcCUl5SirEAq3G+JGHhFjxFQUZYSRxyQgYoeuGYuzpz94KTGz6KQg6s3TyrkmcWUyX3d3OLnB+5L2KyCaTej121/KnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxQg2g/ksVDNaKJKREztosmRbw0IIdtFx5qehn0u0BPXbiUsLdG
	cvVd+4+DkuSPXFgFo4/EgW9I/+vPJ0fSWYR7qimGvWlT/Qxkr+aJVq+dYyReaLZ1cUlHYYSm0Gj
	WOmiN6czzdQ6vWHJz0dtWZoRjZdjd1BJR2oNEpQ983w==
X-Gm-Gg: ASbGncvOSOgKHiuuVEMScMMfcowymvlNaU0xeD0ywqoui/9A82W5Cpt7FHKG/gv79Z3
	cSOXmXU0jArVPZcEZF1gqzR+1evbqickzEhumep5D+j8AHwZFIFhOs7x8vFkDUbhCRPGKrPrJ2I
	KGF0F8QtN9Y+aLBWpYkwo5NNkIIiZUVd4SK/lLvkRE+xvJjOi2Qm2YpyVCbYmSXaXTE3O+damMN
	PqgDXkUiomOBd7pCXXAgB7jQkFmYJQJDTQzow==
X-Google-Smtp-Source: AGHT+IEuuJWxCS9LtWyPrNSqOQ0rr93CADV/nQDLu63OxaASzwVx4y0DtXmxRtJg05mG1B3Mpb8WlsCLfkVJnYTJo60=
X-Received: by 2002:a05:6902:2d08:b0:e8e:19fa:b3bb with SMTP id
 3f1490d57ef6-e8feddb8f3amr13178285276.14.1754403627881; Tue, 05 Aug 2025
 07:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250805062005.254626-1-jiaying.song.cn@windriver.com>
 <CAOSpxdZHSfEW17ni3+ZOA77HOy8taahQUQ8E6+Yk+tCTaL=MKQ@mail.gmail.com> <CANNYZj9_H8=MwkEP8JUvZRTrmWBjY49cL4GgyiBkhJTBE_7_tg@mail.gmail.com>
In-Reply-To: <CANNYZj9_H8=MwkEP8JUvZRTrmWBjY49cL4GgyiBkhJTBE_7_tg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 5 Aug 2025 07:20:17 -0700
X-Gm-Features: Ac12FXwlijA9dX1gz3Dh4HRNUnz8hayKp0HXTrlOF8U4l9VmWvvjhJGr2CafNm8
Message-ID: <CAOSpxdaWsRxeYA+XCMVnFocQzuDKZX-u+vv=Syd_ThEa_+J3-Q@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] ca-certificates: correct the SRC_URI
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 14:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221476

On Tue, Aug 5, 2025 at 7:15=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> I think master contains a newer version that is not affected by the issue=
:
> http://deb.debian.org/debian/pool/main/c/ca-certificates/

Yes, you are correct!

Thanks for reviewing.

Steve

> On Tue, 5 Aug 2025 at 15:38, Steve Sakoman via lists.openembedded.org
> <steve=3Dsakoman.com@lists.openembedded.org> wrote:
> >
> > You'll need to submit this for master first, once it is accepted there
> > I can take it for stable versions.
> >
> > Thanks!
> >
> > Steve
> >
> > On Mon, Aug 4, 2025 at 11:20=E2=80=AFPM Song, Jiaying (CN) via
> > lists.openembedded.org
> > <Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > From: Jiaying Song <jiaying.song.cn@windriver.com>
> > >
> > > The original tarball URL is no longer valid, as it has been moved to =
an archive
> > > location. This update points to the new location.
> > >
> > > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> > > ---
> > >  .../recipes-support/ca-certificates/ca-certificates_20241223.bb | 2 =
+-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-support/ca-certificates/ca-certificates_202=
41223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
> > > index bbdc7dd68d..7977e3ae5c 100644
> > > --- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.b=
b
> > > +++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.b=
b
> > > @@ -15,7 +15,7 @@ DEPENDS:class-nativesdk =3D "openssl-native"
> > >  PACKAGE_WRITE_DEPS +=3D "openssl-native debianutils-native"
> > >
> > >  SRC_URI[sha256sum] =3D "dd8286d0a9dd35c756fea5f1df3fed1510fb891f3769=
03891b003cd9b1ad7e03"
> > > -SRC_URI =3D "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.ta=
r.xz \
> > > +SRC_URI =3D "https://snapshot.debian.org/archive/debian/20241223T143=
500Z/pool/main/c/${BPN}/${BPN}_${PV}.tar.xz \
> > >             file://0002-update-ca-certificates-use-SYSROOT.patch \
> > >             file://0001-update-ca-certificates-don-t-use-Debianisms-i=
n-run-p.patch \
> > >             file://default-sysroot.patch \
> > > --
> > > 2.34.1
> > >
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#221474): https://lists.openembedded.org/g/openembed=
ded-core/message/221474
> > Mute This Topic: https://lists.openembedded.org/mt/114544635/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

