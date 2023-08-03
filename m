Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FC1C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 19:29:32 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.3295.1691090971927933217
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Aug 2023 12:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=I0kWY3QU;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1bb89ac2013so887728fac.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 12:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691090971; x=1691695771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tv/RWLASeHWhwr8QRX5FygSzQXEHpThis/ZSm8RZAuI=;
        b=I0kWY3QUoy/0XpfIHYxAdysD99CWNWPJNqCWe0OnIYb4pL6mr7vBA6ZdrS5iIGe0z3
         y6XSxKZsXM0p9lPobQg4REBCCl05MRTbvqAxtSXVGaRlgtncidKg6Z7al+xfORdKbyRy
         DIfpoC8Mhgmf9YsYTNAYnUx6cPzwglCCxc1okzlq8XEXiXpV2ZVvb+OjChnomyMzudfr
         d4RMP9Wq/TzL39CNLMhhX2w5nCXVj+iUeXvB4LG6z+gAwEl4xv4p+F/SA7zFxGCt0+sK
         O1e0Yu8C4qepQDcfz6CqDWzeNg68ksyOVpYLTCxcJwT2NN1XpE5i6Jbc0pijb7/4pmgs
         NXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691090971; x=1691695771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tv/RWLASeHWhwr8QRX5FygSzQXEHpThis/ZSm8RZAuI=;
        b=aHSLVZrg9wbaJArVGb/L+fGIR9uF92Xbo94KljoOOVY40zWqgtXiPTEEbU7tFlKYQw
         6F1OT4/6QqbXCrnWTtm/QDPkf64ylj7IGLvSwsK3sath5Kxm8Ll1Xfin5PB4vurHj28L
         vu1V+6HOz3dJuJGi22ubTIE2FRy4/jj4PhsB8bG9HINzaDZOg0+AzwHDlA68S9TyBbER
         8jYYyT9VXoNws5e+XBgV1Q5ubLLGOt4d/9t9M2Wki/aetLPmedZR/8U2VKN56LkeyUrG
         hpwckWELG48aJ0xwztNmUi53MIRkrByqvW6KwdigjLeGIkpfDuXs/KXWmi0mMnktoF3N
         Az5g==
X-Gm-Message-State: ABy/qLaSa7OTJ7i1k73VBnZdMGxk+ZFNMcFw5Xcz7KPhhz8TFr0ygNje
	bnMJFLBRRlOZe5BcVSzAkMqRKno/Hg+EPbLauVk=
X-Google-Smtp-Source: APBJJlFFOx4M29oEZpg2SVLU5bry7olb+xjeQKoQ5aNj7DscG3DwHvTIbobXDimC03Ej1ah6o5GTXTDgO6duUdt1oaU=
X-Received: by 2002:a05:6870:a411:b0:1ba:617f:5f26 with SMTP id
 m17-20020a056870a41100b001ba617f5f26mr21901427oal.51.1691090971191; Thu, 03
 Aug 2023 12:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802185425.2044630-1-luca.boccassi@gmail.com> <b7a75eb0-caf6-d999-42c8-d1532200807e@gmail.com>
 <CAMw=ZnTgBDUJg9-rmzVxEcHUx3OJbt1=nDnjkZ41BJ9+kaPiXQ@mail.gmail.com> <CAMw=ZnR6FsD8CUhys+K61vtHaeRErjg-08-1kbq0AD=8-qmMdw@mail.gmail.com>
In-Reply-To: <CAMw=ZnR6FsD8CUhys+K61vtHaeRErjg-08-1kbq0AD=8-qmMdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Aug 2023 12:29:04 -0700
Message-ID: <CAMKF1srESwii6EKAOpnW-f-nvNBz9+mP-KTSkurDQvWHb97=ow@mail.gmail.com>
Subject: Re: [PATCH v7] systemd: update to v254
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 19:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185499

On Thu, Aug 3, 2023 at 11:34=E2=80=AFAM Luca Boccassi <luca.boccassi@gmail.=
com> wrote:
>
> On Thu, 3 Aug 2023 at 00:16, Luca Boccassi <luca.boccassi@gmail.com> wrot=
e:
> >
> > On Wed, 2 Aug 2023 at 20:27, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > On 8/2/23 11:54 AM, luca.boccassi@gmail.com wrote:
> > > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > >
> > > > - Drop dependency on gnu-efi, add dependency on pyelftools for EFI =
builds
> > > > - Refresh patches
> > > > - Ship new files and directories
> > > > - Use meson target to build sd-boot instead of filenames
> > > > - Change libpam recipe to set ANY_OF_DISTRO_FEATURES =3D "pam syste=
md" to let
> > > >    logind pull in pam-plugin-umask
> > > >
> > >
> > > We need to fix the includes in few more places, I have submitted anot=
her
> > > pull
> > >
> > > https://github.com/systemd/systemd/pull/28651
> >
> > Merged and backported in v8.
>
> Anything else we need to do here?

I think wait for all testing to be done on AB otherwise this looks ok to me=
.

