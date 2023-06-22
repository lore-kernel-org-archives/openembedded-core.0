Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC599EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:08 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.17412.1687453860695314449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KXBmKzLc;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-55e4b840858so3325968eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453860; x=1690045860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK8fugzcxurEyXwtWNoj5B3WTxwfUoWlIWI92oF6mUs=;
        b=KXBmKzLcsCXygGBmdo8LSk89q+gIV/B1323+dNAO07xF3IvThAzAO0B/4cJiuGWhy9
         NQSDYUt3UPeaQK8XVeSMaFOmNfSZ6ElWTG9d81dAMbBjmwnR4OjXakq3KO3OjmPy50T0
         KIqFX9BKhnq86XHd2HT79SU9h3z0n0rTqks3ZNwlu/tXnDvwwI7heJXr7To5TqvWqXLy
         F7ExgG2usWLaaEKq9I0TK2erlEHQWk32z/sT1ULtlmJFKYXXLnTiQCUqSTz7/OqdmDld
         HkPqHEOOs/u6jEnHOvhOqK3Utrge80bAI9bk+tEgbKMtt7RdHRWStrxLTD75Q8hKonIc
         Rn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453860; x=1690045860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK8fugzcxurEyXwtWNoj5B3WTxwfUoWlIWI92oF6mUs=;
        b=bxzseVpnOMYHhYGpg6a+1dfK8Acri0jKPVdTKDjHRsrhYzkd0touk1kC7sz2Kx8dJD
         f+LXnx6oxPZ8B8cc+7IiaJTLjAnxV57GsMN73ZG+VTXeUSfGUfrH+OOYcNXq4slknm4Y
         u/VUZ6cqwpgAbBpjRO0O1qg5Q/uf0jO7Aer3FS3DRE2TlAwf55QSVpLuco39POxXxASZ
         XW1SuwrzeVzNGpKcv9WNjnydZKnvDthFCJci7AFR+xHe9xESK47lg5ybCi7sLI2T+WwB
         BSO74pvtReaUHfUVpo3HmNWxZlrtpK10fdi4ENjAedZp6bvDXYW3GwN4siFKMEAOrcZt
         aSug==
X-Gm-Message-State: AC+VfDwnX3QZPieIMlcn/lZbWn83ytUxZLrjZn/fXxy/2KnCBBU/0THk
	pvzK5BoUXSgJllZ0GE/R2pzom1n8C9nbvKMBchg=
X-Google-Smtp-Source: ACHHUZ6ePAGkyVc0Lt8QkG+FN6Ltcx7pqEC18Rdm0YzuKENQYemY4AF42Ue7wyo27Cf2piHzxdUPUWlpR5MDvokWOfs=
X-Received: by 2002:a05:6870:3a0f:b0:1a9:9bd5:8405 with SMTP id
 du15-20020a0568703a0f00b001a99bd58405mr15922160oab.49.1687453859817; Thu, 22
 Jun 2023 10:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-2-maxime.roussinbelanger@gmail.com> <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com>
In-Reply-To: <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Date: Thu, 22 Jun 2023 13:10:33 -0400
Message-ID: <CAE=T-s5gvt=Dz+TckRU31SA5DOfFpSJgPi8gTmRf5wgcYPJirQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane: ignore nativesdk-${PN}-src host
 contaminated issue
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183276

Hello Alex,

On Thu, Jun 22, 2023 at 12:24=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I'm not sure I understand this. The check is to ensure build process
> works as it should, specifically to prevent build host ownership
> leaking into packages. Yes this information doesn't matter when these
> packages are installed, but it matters for correctness of the build.
>
> Alex

Maybe I don't get how this check is done because everything in the TMPDIR
is owned by the user running bitbake.

Max

>
> On Thu, 22 Jun 2023 at 18:20, Maxime Roussin-B=C3=A9langer
> <maxime.roussinbelanger@gmail.com> wrote:
> >
> > From: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.com>
> >
> > nativesdk-${PN}-src will be installed to a different machine and files
> > ownership will change at install. Since the ownership will change based
> > on how the user will install the sdk there is no point in checking
> > ownership
> >
> > Signed-off-by: Maxime Roussin-Belanger <maxime.roussinbelanger@gmail.co=
m>
> > ---
> > v2: New commit
> >
> >  meta/classes-global/insane.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/i=
nsane.bbclass
> > index a4dbc9a123..82ea834f99 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -1116,6 +1116,9 @@ def package_qa_check_host_user(path, name, d, elf=
, messages):
> >      if path =3D=3D home or path.startswith(home + os.sep):
> >          return
> >
> > +    if name.startswith("nativesdk-") and name.endswith("-src"):
> > +        return
> > +
> >      try:
> >          stat =3D os.lstat(path)
> >      except OSError as exc:
> > --
> > 2.36.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#183264): https://lists.openembedded.org/g/openembed=
ded-core/message/183264
> > Mute This Topic: https://lists.openembedded.org/mt/99701051/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

