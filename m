Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E919C4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 13:36:23 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.13083.1713447382191526939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 06:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2PLcL7lT;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.169, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c70a53419eso699538b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713447381; x=1714052181; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oDy6HTxsRQ4qXjc4GyaIQ0xPRWkJgY8EUs6yAAVZEY=;
        b=2PLcL7lTTUGFn1Oyp7i8mXjIISzuOz0+piNT858bSN3B3CqtfE6ph5TLh9yEqxOfmq
         9eplfOLoUCgPIReMdrePd3kigE3afpU+ApuBCIUZ9tVFJXYpsIzUetExOPNyzz5dKTbq
         d8JOmYmuwjuY8ScpU41vYLtfMEvwae4DAElOOqWvlD3ePd3KLUTV4TLEVzG6BkGInQ2n
         UXGOl1AxAxE2OgzQbhb4k0iPuaWKH2aEQ9g8IioNGpGNxidjfBq6sdkte6JSXKxc0F/3
         +G3rwTGaho6Z0Yj1PVF50elrU/qKqGCeboEeAi2BNTbJXYLvf2/ZYyg3pxYQKxpmo02r
         cu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713447381; x=1714052181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/oDy6HTxsRQ4qXjc4GyaIQ0xPRWkJgY8EUs6yAAVZEY=;
        b=AHj/7yD68S41yW+8qY0eNCPM3IQwvyttu5WffhL0HYwOegsLUOhIMazmhBVjL3z82L
         fAKSjOMphNnINlr53IyCXYiKwZtRY7uT8FbfZNrMOgch0vwjGctAddBjho/q5ihx4oyV
         IaZBwhTiD2K2yiuO5eDzhL/3pL2lSdFq7kMvwAfSoHtF6NTicuCswM/+xSbV2XU5/dlT
         CqXxT0oVJdcjWLR21Mwm4npCZg8NZ1WI5jbOE71WICd3aRj0wdw9vh6GmAcGfFPXI8a/
         xmhGDa/V7S6x55ZEnbZsioor6qUwJd0kpX4GWLQ2tzjha3K4rGB6NWOE5gPokO9VQ4Vj
         mkPg==
X-Gm-Message-State: AOJu0YwM8+/V9nFbl+ReqhGf2GI7ebVKa0Go7NOEgDcZfGmT7AzSr0lO
	2nApxScnDTmJyOtdiMtMZM15BW60oDia7fCgaofs+TkqVQa6eFug3spNt9lnbD2ohPbNL/YDltn
	IW2pQWIfrAIDsC6jR2rji4/uxnP+eLBKMOEo2s7cvtjbcSCY=
X-Google-Smtp-Source: AGHT+IGdCBzGMRevRxMUwZ3ZhMHLc+kYlGXEWbHBLMzXmppzW7XLODDJhy75hurBiAs/33TtrRaUIAqbUISDT12I1YM=
X-Received: by 2002:a54:4482:0:b0:3c7:574:410f with SMTP id
 v2-20020a544482000000b003c70574410fmr998826oiv.16.1713447381443; Thu, 18 Apr
 2024 06:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240417222826.3549176-1-jdmason@kudzu.us> <20240417222826.3549176-2-jdmason@kudzu.us>
 <CANNYZj9FBaNo4bWB1=1FvQ6Gv9vKemDS4fJQrLm4sEiJJ=chag@mail.gmail.com>
In-Reply-To: <CANNYZj9FBaNo4bWB1=1FvQ6Gv9vKemDS4fJQrLm4sEiJJ=chag@mail.gmail.com>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 18 Apr 2024 09:36:10 -0400
Message-ID: <CAPoiz9yzQdWw0v5t8fEYxHTzf7cJzU1FG88eZ=LiNtVC7-6NVg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] liba52: remove UPSTREAM_CHECK_URI
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 13:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198518

On Thu, Apr 18, 2024 at 1:37=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I have actually queued a patch to remove this recipe altogether. It's
> a dead project, and superseded by ffmpeg long time ago.
>
> Alex

No problem.  Feel free to drop this then in favor of dropping the
recipe completely.

Thanks,
Jon


>
> On Thu, 18 Apr 2024 at 00:28, Jon Mason via lists.openembedded.org
> <jdmason=3Dkudzu.us@lists.openembedded.org> wrote:
> >
> > UPSTREAM_CHECK_URI pointed to a URL that does not exist, causing
> > UNKNOWN_BROKEN error when running `devtool check-upgrade-status`.
> > There doesn't appear to be a way to check on sourceforge for new
> > versions (and there hasn't been a new version in over a decade at this
> > point).  There is a way to use CVS, but sourceforge is decommissioning
> > CVS (and it doesn't make sense to switch to something that is being
> > removed).  So, just doing UPSTREAM_VERSION_UNKNOWN.
> >
> > Signed-off-by: Jon Mason <jdmason@kudzu.us>
> > ---
> >  meta/recipes-multimedia/liba52/liba52_0.7.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/reci=
pes-multimedia/liba52/liba52_0.7.4.bb
> > index 684dd590ca15..d52310b8ca92 100644
> > --- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> > +++ b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
> > @@ -16,7 +16,7 @@ SRC_URI =3D "https://sourceforge.net/projects/liba52/=
files/a52dec-${PV}.tar.gz \
> >  SRC_URI[md5sum] =3D "1a2e77b4f7aacd858961a6b727710551"
> >  SRC_URI[sha256sum] =3D "c1931bc511dc48987fdba6888be577f3035e3f0b6b81d3=
ea3e766fca8d18e128"
> >
> > -UPSTREAM_CHECK_URI =3D "http://liba52.sourceforge.net/downloads.html"
> > +UPSTREAM_VERSION_UNKNOWN =3D "1"
> >
> >  S =3D "${WORKDIR}/a52dec-${PV}"
> >
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#198489): https://lists.openembedded.org/g/openembed=
ded-core/message/198489
> > Mute This Topic: https://lists.openembedded.org/mt/105587759/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

