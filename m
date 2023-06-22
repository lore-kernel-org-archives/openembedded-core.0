Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E0F8EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 18:04:39 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
 by mx.groups.io with SMTP id smtpd.web11.18732.1687457076829129478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 11:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=F+7HpiMG;
 spf=pass (domain: gmail.com, ip: 209.85.160.43, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1aa291b3fc4so4458139fac.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 11:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687457076; x=1690049076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GK8fugzcxurEyXwtWNoj5B3WTxwfUoWlIWI92oF6mUs=;
        b=F+7HpiMG4d8MAy/peaQGMCWoEO2deMczrXFnejaj75wqf7nYBo9e/nvWVHz6a5Tj27
         HVcbOezMGv+CZga3amnEqmBDNA166EAflCJTamNagbe5TonUxHE1gTKmjFqVGU9ancwI
         DfUuewwQK+XrhId0mci+JOh6Exq1OCty1t1u4oVM4RoG6IwoUH/zXd6Jn3WNa9y0Edf9
         zGOEq+A/r3oFMA6jLwmd7P5uJPD6ysKBESAf1SJemKyGSWp8Jtbh9oO+gICZlNLTyNZ1
         Uw6cTOFbwEbvIdmIfqJBOwKDeAAEuELvn49vOieHaX5JqWDYM5CkUOQkW3T/o+DUL6MU
         9bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687457076; x=1690049076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GK8fugzcxurEyXwtWNoj5B3WTxwfUoWlIWI92oF6mUs=;
        b=lUhHjVXadrX9mTciT+3S7YC/g3j3YwW3xR6SJNXN62yUC5d8vSRWWWTgltc7NnLidW
         bjdrfSpkQjFrOAXH2jmEf88cbfsBKmMkYWE5BlHxl31+YlnW5ppfF4gcP139KUEqePqt
         5e3ab/9L0yIeZ0sGVM2aaKbdgUzbMpZ3s+jPe54VznpLyTIRpwHBxUYnr3/F4SrHOcUp
         KPXi+E8m1nXrZV5K9b12bms1fFWkhkiPDjXke69fHs7qR5Njij+ywW9niJC0REauWLBD
         7UqezYUVVybOAdpfUb2tS0uesa8UVHlMfRl7Ck56ne7vGcaK4xEkUhlacFNvEnxhlSh5
         SftQ==
X-Gm-Message-State: AC+VfDwrrxa74cnmwnrTnKe20HrAOysx0y4Hthpa5PiDjWFZ0vSCMRM8
	tFqbR9lwwSLTxISCOQT5Mp7TgCV49QkRze/sMfk=
X-Google-Smtp-Source: ACHHUZ6QXb5QLkJJEOjON9tQKwO3gCfPw5ZXpHztTth/4PGh9qMUBUhj+m7yqdnM9LURcZ7JNi74JuYvO/GYqqt12hY=
X-Received: by 2002:a05:6870:5b2a:b0:1a2:ea73:5a3a with SMTP id
 ds42-20020a0568705b2a00b001a2ea735a3amr9664081oab.14.1687457076020; Thu, 22
 Jun 2023 11:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230622161749.797820-1-maxime.roussinbelanger@gmail.com>
 <20230622161749.797820-2-maxime.roussinbelanger@gmail.com> <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com>
In-Reply-To: <CANNYZj8KCSygjo9EPUD91oqOzdZhBkYVrJCVthu66bBSoQz8Jg@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Date: Thu, 22 Jun 2023 14:04:09 -0400
Message-ID: <CAE=T-s78z1EsvaTs6AiSU2LXwB9Niq1_UGSWG1RmhSUkk1eGBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/3] insane: ignore nativesdk-${PN}-src host
 contaminated issue
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 18:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183288

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

