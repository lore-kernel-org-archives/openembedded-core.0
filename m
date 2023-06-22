Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C840AEB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:58 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.17362.1687453917400448390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LfzB7u2U;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1ad4d508e81so11808fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453916; x=1690045916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxTwQ1roKCnfNoV90jgJnKypoet6doLhM4EgWJ/zd8U=;
        b=LfzB7u2U3KS0LRy0k8NqVi4BolI/cjoaQSRmysZFqFa7q82wQQGJa8Qe8lv9/JezGl
         gZDnKsP5DR1Jv2Iz2Xb54uHJm6+7VqDnGWpebD/qpYh0EzNAskbAYoyvCwC6i8+naKVd
         66n5Bv0wGq4Pg6nRvKl4q/MEo0He/F01QVYXo7ay9DsFYd/KjK3c4/K2VBLwaebsUXQj
         PLX2dGiX1ew1eSBsX8CTx9DWav0CqZXdogDLEfaZm5cTDPB+UY4/gNwqV3STVSdXazRW
         38CLobbV+EOzp37nbuxLzVMfCn1ZGfA6NMht7entgfDKgePxSzgexwSiEaF6UMjOR37P
         /ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453916; x=1690045916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxTwQ1roKCnfNoV90jgJnKypoet6doLhM4EgWJ/zd8U=;
        b=CmAy5CyBBq0544B2wGXhIxiG53QeOaTDp2NQYtifgv8owe2f6uNkmf100oMRUYMtQI
         U8j4lP+3NvceofScycGKD1ABE3z7y6e7ycZEzk1BzYk3+5apGFjuTBevYd2804sd1doT
         Zlf7X5S361dd8/rh47UdUXppNLkS5XzwSlImwItVZ+RVU2WTdwByWZGnQkV45kf2z1i/
         rWX67gB7TZXHCvOM8K+Bs/MRUN58VPvrlC4vfjD3KqQBH6WNSMMmGxX0QKR77bmdP3BD
         81F28LRxGASkcuD5tjdYVBSrfXj8dW+PBwP766voa7Q3ff5uJacsMA7up2/hA1QuFPED
         iCXw==
X-Gm-Message-State: AC+VfDwGTPnK9A9GltVp/MkqDcdA+RJp80Zm2V+xL5KieOLz+9iInB+x
	Vlw0PedbaFiePxccbuwmByROpw/ioauPbVmqSbPhoS6R3xk=
X-Google-Smtp-Source: ACHHUZ52ZyNV6CHSimAqKmkZI6c0t7vPsxX3AFsJ21S/tObr7GY5b4f08/kLK7TIqoJNdtvyAIvBB4dTly5ULoe+0rU=
X-Received: by 2002:a05:6870:8c34:b0:1a9:ce5a:a061 with SMTP id
 ec52-20020a0568708c3400b001a9ce5aa061mr14253820oab.48.1687453916609; Thu, 22
 Jun 2023 10:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-3-maxime.roussinbelanger@gmail.com> <CANNYZj-pa8CDzKEU12OxYpAqXG3z+ptwoW90pZ6Ps=h2p+YQKw@mail.gmail.com>
In-Reply-To: <CANNYZj-pa8CDzKEU12OxYpAqXG3z+ptwoW90pZ6Ps=h2p+YQKw@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Date: Thu, 22 Jun 2023 13:11:30 -0400
Message-ID: <CAE=T-s7EzA1J+F36TqZJ2soXKUkT4r4AxctP4JNDe1snYFW9_A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/3] bitbake.conf: add debug symbol for sdk
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183287

Hi Alex,

I don't want a complete debug build. I want to keep optimization and
have the debug symbols. I don't think I can achieve that with
DEBUG_BUILD.

Max

On Thu, Jun 22, 2023 at 12:30=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> This change is unnecessary, as there is already a mechanism. Just
> slightly further down you can see that BUILDSDK_CFLAGS pulls in
> BUILD_OPTIMIZATION, which sets -g if you enable DEBUG_BUILD in your
> config.
>
> Alex
>
> On Thu, 22 Jun 2023 at 18:20, Maxime Roussin-B=C3=A9langer
> <maxime.roussinbelanger@gmail.com> wrote:
> >
> > From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
> >
> > Without adding debug flag nativesdk dbg package is not packaged since
> > there is no debugging information
> >
> > Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.co=
m>
> > ---
> > v2: New commit
> >
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 9d9b268858..0635affbc1 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -601,7 +601,7 @@ PATCHRESOLVE =3D "noop"
> >  ##################################################################
> >
> >  export BUILD_CPPFLAGS =3D "-isystem${STAGING_INCDIR_NATIVE}"
> > -BUILDSDK_CPPFLAGS =3D ""
> > +BUILDSDK_CPPFLAGS ?=3D "-g"
> >  export CPPFLAGS =3D "${TARGET_CPPFLAGS}"
> >  TARGET_CPPFLAGS =3D ""
> >
> > --
> > 2.36.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#183265): https://lists.openembedded.org/g/openembed=
ded-core/message/183265
> > Mute This Topic: https://lists.openembedded.org/mt/99701056/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

