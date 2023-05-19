Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7EDC77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 11:37:58 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web11.23392.1684496269051982918
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 04:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=0G+BTo5p;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.222.54, mailfrom: brgl@bgdev.pl)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-783eef15004so1018527241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684496268; x=1687088268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsmvm+Q59LszaMEOR/VwztDHOOwkSZEGgNyDvKGGW7k=;
        b=0G+BTo5pwGKq8N6xgc8hm1OUBIjHlaOLhU/gaD9OXlfvEHvH4roUK5mj24bcoWviS7
         GYCOPgkNdHfh7ItU52LroZ52j0iOPIkeFQk/sgH0XV6NuBp8bbtMZXKicCDm1ufbxgf1
         5AjWTOIL0DqVnuZSGosmw/9kzBzB0jYdsHowaoKCTAmhEsPYdOrMJ3/NzpXIPrKft3RN
         nnJRaVipG5p3KZ31ua9DvQ7PQEumF6UbeGHMKnQqd+R6aOTVarGUpjOyPk9ZJ3hPGNP+
         Acg/E9D6yLLWROW52bEHvOekgJXFbh4KxpOq70e+OZuD30eXOnoMEDRf3mTH6g38mTVC
         hiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684496268; x=1687088268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsmvm+Q59LszaMEOR/VwztDHOOwkSZEGgNyDvKGGW7k=;
        b=YEVpI1TexwHL+zBIKSwFD/Fo1IjY58fEl8y4pdKLDus0xOTPMwfeM+7oTk6oqJ66mp
         SGI77of7Zl/SbPR2ujyOkmUUZKeHr6y5PMja8zYIKMPTZdv3gFmRHRS9r1JBvZEVJIyk
         JuRYyOcCaNay0Fm7CGG0+cF/nMMoB7xyOGQbOeOE17ExsquJpK74ZQxxTjE26beDirs6
         I2S/aN+M2Xcqx0xkY+ct8KmruJadwjxk91pciE2drd2c9Y7fW/ICgmYpfZcrVwNgfFXP
         cNOooAPFFXEQ+KZyChSXZldnurgHf02eoJbMPFkJHn79FQ9V2uCkYliKP/aks3UjIpAu
         9u2A==
X-Gm-Message-State: AC+VfDwauq6PC4ln+FyoUjTMrgDwq12PG9uNd3Li6Bq0tS3DnRtAeAyo
	eQH1caL9TWfwNqzGrNod8cRPMc7gbxjTsbPO80YyWQ==
X-Google-Smtp-Source: ACHHUZ6klhYJ0zOhuPQCxg0x6IFnGATEDWzXr2cy0ddVBBQxwh0UzC7gWxsiPaxAH5WSrmmJHEen3kyBO4f/Li+3xv0=
X-Received: by 2002:a67:fbda:0:b0:42f:e9be:5921 with SMTP id
 o26-20020a67fbda000000b0042fe9be5921mr470434vsr.12.1684496267937; Fri, 19 May
 2023 04:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230517080639.9336-1-brgl@bgdev.pl> <20230517080639.9336-7-brgl@bgdev.pl>
 <CADkTA4M_vy+E_nqxMMHDVi4bmw7OdNyRTwBDiNvLRQ8ydP-2cQ@mail.gmail.com> <63C660BB-CE31-473F-A9B6-62A87D0F72C9@arm.com>
In-Reply-To: <63C660BB-CE31-473F-A9B6-62A87D0F72C9@arm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 19 May 2023 13:37:37 +0200
Message-ID: <CAMRc=Me+FaedmC300vUWUqbM+5ty-cn3BV2ppnd=LbAZPf4jVQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 06/20] python3-libfdt: new package
To: Ross Burton <ross.burton@arm.com>
Cc: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>, Khem Raj <raj.khem@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Trevor Woerner <twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 11:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181547

On Thu, May 18, 2023 at 6:56=E2=80=AFPM Ross Burton <ross.burton@arm.com> w=
rote:
>
>
>
> > On 17 May 2023, at 17:32, Bruce Ashfield via lists.openembedded.org <br=
uce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > I'm not sure if you saw the old threads on this, but we went through th=
is
> > binding in detail in february:
> >
> > See the series from TrevorW:
> >
> > [PATCH v3 1/4] dtc: version bump and add python wrapper
> >
> > The pypi releases of libfdt bindings are not kept in sync with the dtc
> > releases and rarely update. Not that they change a lot, but that is
> > still the case.
> >
> > The suggestion for the bindings is the same, they'd be better of built
> > from dtc, versus using pypi.
> >
> > There may be some issues remaining with the build, as Trevor hasn't
> > updated his series in a while now.
>
> Agreed - that series needs to be resurrected as it=E2=80=99s the canonica=
l source of the bindings.
>
> Ross
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181527): https://lists.openembedded.org/g/openembedde=
d-core/message/181527
> Mute This Topic: https://lists.openembedded.org/mt/98944002/3618139
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
gl@bgdev.pl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

In this case I propose to just drop patches 06/20 and 07/20 from this
series for now when applying.

Bart

