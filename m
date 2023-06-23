Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B262EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 14:59:27 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.702.1687532367169856561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 07:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gjFpiavY;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-55b3a245359so514682eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532366; x=1690124366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xvn09tK0YfxlOsDLnBawokc0NeP+bBCEoLC9sRUQxDw=;
        b=gjFpiavYSKZgln0zJc0z8Vu9NzNl0Nn6dcuR9hOYUPqTtVySUvDhwQIXC1sbQbhqeg
         Qa/9VBjEiIqGvqfMntFGWaQ1US4R7rPoGKic9KLr7m4mjUEnphQMgV0uL52bckQdmsii
         dxH98YHy8iz+EqQY1OVLRPmJ7tKurFWTQCVZi/P62BalpvmhFLOaq1wPpBx8CNxTPdh4
         vCrh+vHFyACQO+g18b9i9CHQThGVVzdsaA0ncriTWV1sV1ahq6pPdoSMi3HYCHGGoQZy
         KDohRDCg2d54rDzKVF9gwU1fgPYyXO/BmIfgoayl6u9SukdCvuQneLWqyPujYe0jQG9L
         RYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532366; x=1690124366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xvn09tK0YfxlOsDLnBawokc0NeP+bBCEoLC9sRUQxDw=;
        b=Yw5uFxkG1BdHWxkeminqhB7XWwqlBeyLbGShFx3odOJKMPo/empJsjAb06XmhqGPUz
         ZeF4cChhqJFrARpItKNepXxNPupbLbQC5dCqk8XbLmKSs4/RhtLSDCi224beq9eb/MNg
         lKoWUNCHju7XzSaUKQlsENElGM63gLqjk/d9rqvZwNtM0sO5AOl3fN+CWynvV0joX7x1
         MEHhvxgg6tR6Wqz3Ju6E3Pb6b89uvz1gFBdJ5csaMZSu2YkiFAw6XnuxdMwpwPgad/hQ
         /uh02Yjb9JfjIWTKbGwflMt8xCYM9/9FEuy7h8iMwWaF720XlLe8FC6TqUT1cYcs+EbB
         4z+A==
X-Gm-Message-State: AC+VfDzvTPGhK+sJpd51HlbAgXiCensnu5GHYLUop3K95klwY7gtItuW
	WwCF+xs+OUWdVXVLBwt7LF5Mn3ZHNzV4xpp3fK5HkBSXGJI=
X-Google-Smtp-Source: ACHHUZ6iLp4xi3G1rCCU5vroXD8uX+oMNLA/ML+zF82odOg3ICzTCEMZ7yx42H25gRUfhtGQNTOuriVJbEEmi23fDDQ=
X-Received: by 2002:a4a:d18d:0:b0:562:eb64:73f6 with SMTP id
 j13-20020a4ad18d000000b00562eb6473f6mr3856286oor.4.1687532366139; Fri, 23 Jun
 2023 07:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-3-maxime.roussinbelanger@gmail.com>
 <CANNYZj-pa8CDzKEU12OxYpAqXG3z+ptwoW90pZ6Ps=h2p+YQKw@mail.gmail.com>
 <CAE=T-s7EzA1J+F36TqZJ2soXKUkT4r4AxctP4JNDe1snYFW9_A@mail.gmail.com> <CANNYZj--pKA7ASdohuoOmrOwK+UZAJPS1WsFVcbqRXEvw+3K-Q@mail.gmail.com>
In-Reply-To: <CANNYZj--pKA7ASdohuoOmrOwK+UZAJPS1WsFVcbqRXEvw+3K-Q@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Date: Fri, 23 Jun 2023 10:58:56 -0400
Message-ID: <CAE=T-s5zCTKjZ6g6-J_dUYjJFrL5AK69Y-dRtmdA+=zeXcCUyw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 14:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183331

On Fri, Jun 23, 2023 at 3:50=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> But then you can set the parameters as you want them in your local
> configuration. Setting -g globally in the absence of DEBUG_BUILD needs
> a use case that applies to most users.
>
> Alex

If user wants to install nativesdk dgb/src package you need to add that fla=
g,
so instead of modifying the `BUILDSDK_CPPFLAGS`, it should probably be
documented.

Do you have any pointers where it could be documented?

Max.

>
> On Thu, 22 Jun 2023 at 19:11, Maxime Roussin-B=C3=A9langer
> <maxime.roussinbelanger@gmail.com> wrote:
> >
> > Hi Alex,
> >
> > I don't want a complete debug build. I want to keep optimization and
> > have the debug symbols. I don't think I can achieve that with
> > DEBUG_BUILD.
> >
> > Max
> >
> > On Thu, Jun 22, 2023 at 12:30=E2=80=AFPM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > This change is unnecessary, as there is already a mechanism. Just
> > > slightly further down you can see that BUILDSDK_CFLAGS pulls in
> > > BUILD_OPTIMIZATION, which sets -g if you enable DEBUG_BUILD in your
> > > config.
> > >
> > > Alex
> > >
> > > On Thu, 22 Jun 2023 at 18:20, Maxime Roussin-B=C3=A9langer
> > > <maxime.roussinbelanger@gmail.com> wrote:
> > > >
> > > > From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
> > > >
> > > > Without adding debug flag nativesdk dbg package is not packaged sin=
ce
> > > > there is no debugging information
> > > >
> > > > Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmai=
l.com>
> > > > ---
> > > > v2: New commit
> > > >
> > > >  meta/conf/bitbake.conf | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > > index 9d9b268858..0635affbc1 100644
> > > > --- a/meta/conf/bitbake.conf
> > > > +++ b/meta/conf/bitbake.conf
> > > > @@ -601,7 +601,7 @@ PATCHRESOLVE =3D "noop"
> > > >  ##################################################################
> > > >
> > > >  export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
> > > > -BUILDSDK_CPPFLAGS =3D ""
> > > > +BUILDSDK_CPPFLAGS ?=3D "-g"
> > > >  export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> > > >  TARGET_CPPFLAGS =3D ""
> > > >
> > > > --
> > > > 2.36.0
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#183265): https://lists.openembedded.org/g/opene=
mbedded-core/message/183265
> > > > Mute This Topic: https://lists.openembedded.org/mt/99701056/1686489
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [alex.kanavin@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

