Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1435C7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 14:33:17 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.555.1685457196371879602
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 07:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=CW88yIfl;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f4f3ac389eso3667060e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 07:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685457194; x=1688049194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xheh3Rcm6tCQK1pFeh8nlykpqmb0gL6MLYPeBDRR558=;
        b=CW88yIflz8MdwS+xX6glQiUGZnua5IHvOJVDseQmEBfccnb7avi8yb2bTWr50eFn0X
         MDSwPAltVFPp3SxucL223Sb6GWFxgWmSyZ19LS4yQeCyNt7Yd+iOlu0fNPpxnvPjJn24
         3cZL95Y1B9hr8LMaRiKgX7/+1UVU+YjJzQoi5PauLLwK1KP1TM+zRZV6QmhkU3hy7pov
         TNgI2A9moMOnW9iUNe2TwXz2/kS2IF0+56F8eBCxpnwjZBwHvxh47xa8//upf1MV8IBp
         M3tJqdGgV88LBistOZ2JejL/wjvY/gifchAETB+iPjubbNk6JOtPmcaGm1FHwTdyGq8q
         3gKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685457194; x=1688049194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xheh3Rcm6tCQK1pFeh8nlykpqmb0gL6MLYPeBDRR558=;
        b=ll8R4Wt5FL4mQ8axdvyjZ3KElhG49RsZ/aY81oMrTPQ15tQQNS5V42eOZXcrfZVrr+
         Gsf0GbMWL9SDQklRL9NRdVaPJHJ+FtW7F1UYM1NbjsKGFkuNLsvtAdIbOM4cBXrViXxK
         EMTfgBzJoYQScmJg9h/jVI2yMmgV0c9TjyFm3TmdyG8i/RNaSd+wbC7XUof/OZZEqkte
         /upoZZ5L3kUJNyVSzvpZv6w6B0rTUy3hw+Qw7rnN8pHSZCzOBZwBm0k3sMYojsV+LY8f
         ersxdrl0irzeNWNMbKt1x5/RUD9yWGkwCZw5cEwZFmwUcyNpm4qcljA1Q3pqQCKLZdF1
         QL+A==
X-Gm-Message-State: AC+VfDxIRGYsRHOPXIyVdHVkQ7QJue2br2utAtE0ozJT7trhiEJlWAcX
	ms2iwyG3ygE2QPs7M+pftap/kcc++vZtUt4cpiU=
X-Google-Smtp-Source: ACHHUZ5bAMgG0O7gMWvQh45KBplRxP/uVsSTeI/xmCPceGeYO9WI50ruTVEMicTD2zJtw2UQQj5slW3ygcOxFzV1aKA=
X-Received: by 2002:ac2:5204:0:b0:4dd:995b:feaa with SMTP id
 a4-20020ac25204000000b004dd995bfeaamr963293lfl.24.1685457194043; Tue, 30 May
 2023 07:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230530131708.1916975-1-mingli.yu@eng.windriver.com> <CADkTA4MLkWsaiLWJoj_7A+2uc4TP13Zyp=JASyZnraNZqrTwsA@mail.gmail.com>
In-Reply-To: <CADkTA4MLkWsaiLWJoj_7A+2uc4TP13Zyp=JASyZnraNZqrTwsA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 30 May 2023 16:33:02 +0200
Message-ID: <CANNYZj9xxEnyxEyWv9q4AY9Cj_zpw6fSyqc6uwLOwzkFYFnZvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Split the qemu package
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181927

I might be missing something here, but can the free-form, anonymous
python code block be avoided? Don't we have PACKAGES_DYNAMIC for this
purpose?

Alex

On Tue, 30 May 2023 at 15:51, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
> On Tue, May 30, 2023 at 9:17=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriv=
er.com> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Currently all files packaged into one package such as qemu-7.2.0-*.rpm.
> > After the qemu package installed on the target, it will take up 464M
> > which includes not only the one matches the arch of the target but aslo
> > all available built qemu targets which set by QEMU_TARGETS.
> >
> > Split the qemu package into qemu-7.2.0-*.rpm, qemu-aarch64-7.2.0*.rpm,
> > qemu-arm-7.2.0*.rpm, qemu-x86_64-7.2.0*.rpm and etc. And let user can o=
nly
> > choose the corresponding qemu arch package they want to install should =
ease
> > the concerns who cares much about the size in embedded device as it
> > decreases the qemu rpm(qemu-7.2.0*.rpm) size from about 65M to about 17=
M
> > and the size of the extracted qemu RPM decreased from about 464M to abo=
ut
> > 248M.
>
> I've been splitting the qemu packages in meta-virtualization for years no=
w.
>
> I find the python more difficult to read than just using overrides, as
> it is much more explicit.
>
> Is there a reason why that approach didn't work in this scenario ?
>
> As Richard mentioned, you should also pull in all the subpackages by
> default with the main qemu package, to avoid regressions.
>
> Also, in the experience of meta-virt, you only want this splitting on
> target builds, not native/host.
>
> Bruce
>
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu.inc | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
> > index a87dee5c99..7302d63747 100644
> > --- a/meta/recipes-devtools/qemu/qemu.inc
> > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > @@ -230,6 +230,25 @@ INSANE_SKIP:${PN} =3D "arch"
> >
> >  FILES:${PN} +=3D "${datadir}/icons"
> >
> > +python(){
> > +    allarchs =3D d.getVar('QEMU_TARGETS').split()
> > +    packages =3D d.getVar('PACKAGES').split()
> > +    pn =3D d.getVar('PN')
> > +
> > +    newpackages=3D[]
> > +    for arch in allarchs:
> > +        archpackage =3D 'qemu-' + arch
> > +        if archpackage not in packages:
> > +            newpackages.append(archpackage)
> > +        d.setVar('FILES:' + pn + "-" + arch, '${bindir}/qemu-' + arch)
> > +        d.appendVar('FILES:' + pn + "-" + arch, ' ' + '${bindir}/qemu-=
system-' + arch)
> > +        if arch =3D=3D "mips":
> > +            d.appendVar('RDEPENDS:' + pn + '-' + arch, ' ' + 'bash')
> > +    packages =3D newpackages + packages
> > +    d.setVar('PACKAGES', ' '.join(packages))
> > +}
> > +
> > +
> >  # Put the guest agent in a separate package
> >  PACKAGES =3D+ "${PN}-guest-agent"
> >  SUMMARY:${PN}-guest-agent =3D "QEMU guest agent"
> > --
> > 2.25.1
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181924): https://lists.openembedded.org/g/openembedde=
d-core/message/181924
> Mute This Topic: https://lists.openembedded.org/mt/99219254/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

