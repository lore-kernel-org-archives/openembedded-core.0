Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61F8EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 07:50:43 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.37337.1687506634078658295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 00:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=VAsJl1id;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b475b54253so5808851fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687506632; x=1690098632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9tmQnaDE9geoV0j7h6lmiO2ibYNF9KyFBy+kFGr5aQ=;
        b=VAsJl1idRl9nN463gdsWL8RovWGOkPueeGNwZxlrqligZMrqVygh9YfE11S7tRhP22
         SmV/Ht9he5s2FVBLAiBeuZpE3l1l50rp8TepJCM9GFnTAG0hsPW2l2fEAv4j/PKnrzSm
         2tn9SYNeM7FcwCQJsnndjx66kssDG34HJBXHyA3F3SlhD/nMJRSjFVUh6EQGORNVM7KH
         QOJnHMFMM8dnuWb9cl/ZDTMoRl0HDigrfZhIqecXwg8SGF8H7uVADZZ5n25D0QxgzjC9
         7684SnUB9lB0kq1ceEMfBY7Vi9+Uvxul6WAVTnMI3Pr7y7G9QikWz3NPAPohA5ipw8dD
         geLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687506632; x=1690098632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9tmQnaDE9geoV0j7h6lmiO2ibYNF9KyFBy+kFGr5aQ=;
        b=RSC+ExmNzc9AO1eUalUym6dAUHSrObPuwUaX57a5zOJ6lBW7LgVoGeVzTjWNwhh3Uo
         CbZGmuaMlAqstRnqKOA4o3ERYms6DVOy/rGkK1jIE6F0cBYQmOCWbTbl59KfF57Cfja3
         HVCNoLa5yqEZl61SYiyN0tPlInHwSYF0PsBwYP2cuifRn9jp/lWsz3KCFGMaG8eTEkRm
         1eY8rw4OKmUFmy9lNp4oyOsphtke9yMZztH4PynGLmOFyycnEtuzS72DPGkoxwhpOSJw
         sjuiATNUP/D7WeXWY0zDrBxGhNKdeVwOOlFAUrBPg1FpbHS/D7I7TtqVgj4vOXVlReYt
         gw0Q==
X-Gm-Message-State: AC+VfDyh/2fFZYmdvD8soqlqj39AxG9Rcqu92RL0Dua0kLayqI9h5gnK
	nDsqsvM1pVpALbig8NSan/8QobqMDacvngtG3iU=
X-Google-Smtp-Source: ACHHUZ5Lm8Zsa323LzyUSAMxYAWp45/upa391o9nr98KItaK09Y4cZQU5rzxAu+x22xQS9Y4I8uHHmSMPBqBjwXAcS0=
X-Received: by 2002:a05:6512:2315:b0:4f9:6a74:d149 with SMTP id
 o21-20020a056512231500b004f96a74d149mr2252107lfu.15.1687506631821; Fri, 23
 Jun 2023 00:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-3-maxime.roussinbelanger@gmail.com>
 <CANNYZj-pa8CDzKEU12OxYpAqXG3z+ptwoW90pZ6Ps=h2p+YQKw@mail.gmail.com> <CAE=T-s7EzA1J+F36TqZJ2soXKUkT4r4AxctP4JNDe1snYFW9_A@mail.gmail.com>
In-Reply-To: <CAE=T-s7EzA1J+F36TqZJ2soXKUkT4r4AxctP4JNDe1snYFW9_A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 23 Jun 2023 09:50:20 +0200
Message-ID: <CANNYZj--pKA7ASdohuoOmrOwK+UZAJPS1WsFVcbqRXEvw+3K-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
To: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 07:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183308

But then you can set the parameters as you want them in your local
configuration. Setting -g globally in the absence of DEBUG_BUILD needs
a use case that applies to most users.

Alex

On Thu, 22 Jun 2023 at 19:11, Maxime Roussin-B=C3=A9langer
<maxime.roussinbelanger@gmail.com> wrote:
>
> Hi Alex,
>
> I don't want a complete debug build. I want to keep optimization and
> have the debug symbols. I don't think I can achieve that with
> DEBUG_BUILD.
>
> Max
>
> On Thu, Jun 22, 2023 at 12:30=E2=80=AFPM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > This change is unnecessary, as there is already a mechanism. Just
> > slightly further down you can see that BUILDSDK_CFLAGS pulls in
> > BUILD_OPTIMIZATION, which sets -g if you enable DEBUG_BUILD in your
> > config.
> >
> > Alex
> >
> > On Thu, 22 Jun 2023 at 18:20, Maxime Roussin-B=C3=A9langer
> > <maxime.roussinbelanger@gmail.com> wrote:
> > >
> > > From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
> > >
> > > Without adding debug flag nativesdk dbg package is not packaged since
> > > there is no debugging information
> > >
> > > Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.=
com>
> > > ---
> > > v2: New commit
> > >
> > >  meta/conf/bitbake.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 9d9b268858..0635affbc1 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -601,7 +601,7 @@ PATCHRESOLVE =3D "noop"
> > >  ##################################################################
> > >
> > >  export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
> > > -BUILDSDK_CPPFLAGS =3D ""
> > > +BUILDSDK_CPPFLAGS ?=3D "-g"
> > >  export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> > >  TARGET_CPPFLAGS =3D ""
> > >
> > > --
> > > 2.36.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#183265): https://lists.openembedded.org/g/openemb=
edded-core/message/183265
> > > Mute This Topic: https://lists.openembedded.org/mt/99701056/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

