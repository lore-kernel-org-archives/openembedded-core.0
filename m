Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DEE0C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 14:15:35 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.306.1754403329677395238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 07:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SDnrYT0K;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-70748d1920cso63472946d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403329; x=1755008129; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfsWD23FBAs+EmQmB+AY22FfE41qt5ZDsClnrsvX1h8=;
        b=SDnrYT0Kra9DarzeShSh2GXEneByOq081Vl/RIOtOeaDdjE7d8ynCXwm+2gdfCyORj
         PPtTNDwj/tMOfRXldUSo99l8zAHAmqTZm8Hvcr7ppK58aBBs4eb1/YsNWd7spQAPE7B1
         SA5yl1B8MEXMiROqEn0lncqrMTfUnaculMVPLQisIAVIaSluVviUa7Nq8nNoh+LVyzsB
         bCp4KNyRjwpfzipENXgIhzTEWjDuo5zeieTO12SDl0OtSLUrsEG6VeAOnlobGjQ2Hf1j
         /pTJzkKW5wT7AV80divN75nnFD/Cm2sX39+VkzTfoBvtx7HN9QKCE4yXG4qR8tvnlGKo
         BQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403329; x=1755008129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfsWD23FBAs+EmQmB+AY22FfE41qt5ZDsClnrsvX1h8=;
        b=c1gKrnzD4KBtjUMT/xQuah3eFa/AZpA7P/1RFnCnMYjGrUO2X91ljYbs8QQ0VY8Nks
         3n1HEniBiSoRIJbQd0efLvgAqJhudjnHtoJOGjbTRVneuGE6LH+a7s+K6y2lWkmZrEk4
         NeNDC80X7OvFCGYWWlVQg0xXjaIPFdNJY14jNJkSwfF1j0qFregaD5j/TaAlvwT40Plq
         a414ibhmGpToOTZRCmrQ4vYuE+WqT71wdoifQylc1eXlH2AmAIcAsWyLUp8pzv7x9/3g
         Ro6YgDskyeKqNfj0kxSgowucjzTZpwetp9+IHCA5LS7iHq2ksfBf7WOiFr3nRnCaIV15
         vV0A==
X-Forwarded-Encrypted: i=1; AJvYcCVHGb+E4UfgJKeoM+r09KkenuuDzyDEjNaHCpbrTFZuxBwItXq+IUhb2vG4TRfp3ycehcjCk3Fdwx8uagvnC81Lbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4cebDAVUYDbI+b3xTVbV8m3BeTLSiiAWYklS32wVhpGnPhM3o
	uPHdOBPi0LRL5WO8pG2d9WaNhLSF3VifWSacmg1iVSIQVFgCwXpex8HhdfbkTCJqTBaOSDq1G8D
	2PQGtMPwOrw+TECzZvLVf/JQzNnXcEYGmnjbd
X-Gm-Gg: ASbGnct98XFrU+Slt1T2I6JOVoXF0f0EEYZyPzTO8k/tbMMwOF5lkR0xvszKU/z3Yij
	AL9AExYFBmJpCbu0ojgqUHHxJGVEiExHg87Zz4g7jznA5s759XEoayBVuECijVJGOtUwxiuiJfX
	vL7iwVWlpVPSkE5YYz5n2nn8tAAiPRpJfBeVb687DbbFdMDNEDu4JesrKAxRy+E5pYXMXJwbbbf
	goUpjGF+KS7/Tr8C1hhP3ks3wlnJJM4JEvyxsNksw==
X-Google-Smtp-Source: AGHT+IHDT0B7cv+xriQI2oinNKagwFSL3B2voayp6xXJ87zgePuoi09gyQl7K1DAooYa1ZZF+SFp6gnmeyecuUG+FjY=
X-Received: by 2002:a05:6214:1945:b0:704:f7d8:7033 with SMTP id
 6a1803df08f44-70966b35f0bmr48612636d6.24.1754403328195; Tue, 05 Aug 2025
 07:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250805062005.254626-1-jiaying.song.cn@windriver.com> <CAOSpxdZHSfEW17ni3+ZOA77HOy8taahQUQ8E6+Yk+tCTaL=MKQ@mail.gmail.com>
In-Reply-To: <CAOSpxdZHSfEW17ni3+ZOA77HOy8taahQUQ8E6+Yk+tCTaL=MKQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Aug 2025 16:15:16 +0200
X-Gm-Features: Ac12FXx0KpqPer3ReeSxzioWn2xFpBDloE1aq3eCD1e8NCGr0haguWCc7Q0FSJs
Message-ID: <CANNYZj9_H8=MwkEP8JUvZRTrmWBjY49cL4GgyiBkhJTBE_7_tg@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] ca-certificates: correct the SRC_URI
To: steve@sakoman.com
Cc: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 14:15:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221475

I think master contains a newer version that is not affected by the issue:
http://deb.debian.org/debian/pool/main/c/ca-certificates/

Alex

On Tue, 5 Aug 2025 at 15:38, Steve Sakoman via lists.openembedded.org
<steve=3Dsakoman.com@lists.openembedded.org> wrote:
>
> You'll need to submit this for master first, once it is accepted there
> I can take it for stable versions.
>
> Thanks!
>
> Steve
>
> On Mon, Aug 4, 2025 at 11:20=E2=80=AFPM Song, Jiaying (CN) via
> lists.openembedded.org
> <Jiaying.Song.CN=3Dwindriver.com@lists.openembedded.org> wrote:
> >
> > From: Jiaying Song <jiaying.song.cn@windriver.com>
> >
> > The original tarball URL is no longer valid, as it has been moved to an=
 archive
> > location. This update points to the new location.
> >
> > Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> > ---
> >  .../recipes-support/ca-certificates/ca-certificates_20241223.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20241=
223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
> > index bbdc7dd68d..7977e3ae5c 100644
> > --- a/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
> > +++ b/meta/recipes-support/ca-certificates/ca-certificates_20241223.bb
> > @@ -15,7 +15,7 @@ DEPENDS:class-nativesdk =3D "openssl-native"
> >  PACKAGE_WRITE_DEPS +=3D "openssl-native debianutils-native"
> >
> >  SRC_URI[sha256sum] =3D "dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903=
891b003cd9b1ad7e03"
> > -SRC_URI =3D "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.=
xz \
> > +SRC_URI =3D "https://snapshot.debian.org/archive/debian/20241223T14350=
0Z/pool/main/c/${BPN}/${BPN}_${PV}.tar.xz \
> >             file://0002-update-ca-certificates-use-SYSROOT.patch \
> >             file://0001-update-ca-certificates-don-t-use-Debianisms-in-=
run-p.patch \
> >             file://default-sysroot.patch \
> > --
> > 2.34.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221474): https://lists.openembedded.org/g/openembedde=
d-core/message/221474
> Mute This Topic: https://lists.openembedded.org/mt/114544635/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

