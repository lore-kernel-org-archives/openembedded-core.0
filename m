Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB516C83F12
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 15:09:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.16664.1693235388267053076
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 08:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=d2sQiySB;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31aeee69de0so2818519f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693235387; x=1693840187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kmiVqVR498HdSny4XbeamiIrwvkQaBeLX/bat6h2pI=;
        b=d2sQiySB8MlMiZRf3LmZ0OmLZXq9tBWtiD9iy9DqHXfn1ZiY4HYf0uXcqWbR2q/vSI
         04w+d7SI1y75Sj2+1JJk1obITSnnjTimqdWMxU7OFuHsS2QCGile2BeaJIBsliJrsJp1
         C8xUtcgNw/TanZiHyt0RMMUBN3mtflOUmXg3PezBEsXkjx9Q4s4pibkZBZAhTcS9oi5s
         J9YkSWQ3+rHl6nH0k3JiU8aRXS9MYZa5GCiLCEy16CARkC4aTfhr5BzdrGozIcFR6YoQ
         rkCbId+hQVOAF2OBY3DmNn9uVuKlvVYNAM/+8GsfNb4scFBHhxxxPlMNoN7ruCPr1LS3
         qxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693235387; x=1693840187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kmiVqVR498HdSny4XbeamiIrwvkQaBeLX/bat6h2pI=;
        b=J6EXyl7Rl4BK4V0nSnnyPGEuOdbdNRd8c2fwlfIys9vz2UTo/MJzHzt0oWFSg5leEy
         HplPe9cEWvD7F4t/dvgg8mAZQ8eY+0Dcm8G80eQbBnwjOJdvBmh5EzEJNUHyYtTmCt18
         VVHR3E7+9TBO/EDM36Pvgmq5LM/uikJiN/SwZEJ0ibdv+zshQ6vaahVjv9dIMMk6ICID
         8On7Ljo3BGIHJ93swW2dU5rKkDtxdFMsjLT8QwpHG9eD9iprLIQxV5kfqoUl+7A/YsXM
         2Pl1yf/sun3wT5lN0YNRZdAEWdpk4Z7Js2958RDdp0MJqfeeyj7mKAQTfouCi75+OfwV
         hwIQ==
X-Gm-Message-State: AOJu0YzcrwNi3bCCNbcZY1lHshrHM6v20TOnIpS6Lgu7wuBzU9iFjI6h
	pllMwacNuvuy5feLyOQfaK0gxaJ5uSYW5pjEGzo=
X-Google-Smtp-Source: AGHT+IFax5OBM1HhDBk5KFb6jd++7N8dwdU5z9SP+iy17+RXlPpBUJkZjPET1byngu3yEA3tSuCi1myjlfgSkxnuQio=
X-Received: by 2002:a5d:6949:0:b0:319:841c:ae7a with SMTP id
 r9-20020a5d6949000000b00319841cae7amr20032062wrw.41.1693235386464; Mon, 28
 Aug 2023 08:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230827080953.2005190-1-max.oss.09@gmail.com>
 <DB5PR02MB1021304FFF37BA67288997ADDEFE1A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <177F942FA4953D34.1521@lists.openembedded.org>
In-Reply-To: <177F942FA4953D34.1521@lists.openembedded.org>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Mon, 28 Aug 2023 17:09:35 +0200
Message-ID: <CAEHkU3XsGEHZzvL=cy_p83zDs4WURHknpAQP4FRqZ_nCLLbwRQ@mail.gmail.com>
Subject: Re: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibit the
 default dependencies"
To: max.oss.09@gmail.com
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>, Randolph Sapp <rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 15:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186833

On Mon, Aug 28, 2023 at 5:01=E2=80=AFPM Max Krummenacher via
lists.openembedded.org <max.oss.09=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Sun, Aug 27, 2023 at 11:23=E2=80=AFPM Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > > -----Original Message-----
> > > From: Max Krummenacher <max.oss.09@gmail.com>
> > > Sent: den 27 augusti 2023 10:10
> > > To: openembedded-core@lists.openembedded.org; Peter Kjellerstedt
> > > <peter.kjellerstedt@axis.com>
> > > Cc: Max Krummenacher <max.krummenacher@toradex.com>; Randolph Sapp
> > > <rs@ti.com>
> > > Subject: [oe][OE-core][Patch 0/1] Revert "bin_package.bbclass: Inhibi=
t the
> > > default dependencies"
> > >
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > Hi
> > >
> > > With commit d1d09bd4d7 ("bin_package.bbclass: Inhibit the default
> > > dependencies") applied I'm getting a lot of these errors, i.e. qa
> > > does miss libc and compiler provided libs:
> > >
> > > ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> > > /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-uml=
ibs
> > > requires ld-linux-aarch64.so.1(GLIBC_2.17)(64bit), but no providers f=
ound
> > > in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> > > ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> > > /usr/lib/libusc.so.23.1.6404501 contained in package ti-img-rogue-uml=
ibs
> > > requires libc.so.6(GLIBC_2.17)(64bit), but no providers found in
> > > RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> > > ERROR: ti-img-rogue-umlibs-23.1.6404501-r2 do_package_qa: QA Issue:
> > > /usr/lib/libufwriter.so.23.1.6404501 contained in package ti-img-rogu=
e-
> > > umlibs requires libstdc++.so.6(GLIBCXX_3.4.14)(64bit), but no provide=
rs
> > > found in RDEPENDS:ti-img-rogue-umlibs? [file-rdeps]
> > >
> > > Reverting the commit makes the build pass, alternatively adding
> > > to depends in the recipe which is using the bin_package class
> > > fixes it too:
> > >
> > > DEPENDS +=3D " virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
> > >
> > > I'd prefer reverting removing the default dependencies over fixing
> > > each of the recipes which do use the bin_package class to actually
> > > install binaries running in the target user space.
> > >
> > > Any opinions?
> >
> > Bummer. I guess we will have to update our recipes individually
> > instead. :(
> >
> > >
> > > Max
> > >
> > > Max Krummenacher (1):
> > >   Revert "bin_package.bbclass: Inhibit the default dependencies"
> > >
> > >  meta/classes-recipe/bin_package.bbclass | 3 ---
> > >  1 file changed, 3 deletions(-)
> > >
> > > --
> > > 2.35.3
> >
> > //Peter
> >
>
> From the bugzilla entry [1] which added the feature and from the commit
> adding the class [2] it looks to me that the class should simplify adding
> binaries externally built for the target.
> Having the users of the class having to add the used libc / compiler
> shared objects to not trigger a qa warning seems really wrong to me.
>
> Additionally I don't see the advantage in not installing the base
> dependencies. Doing anything usefull in a build would need to build
> them anyway for some other recipe, so one would save creating a few
> hard links. Do I miss something here?
>
> So IMHO a recipe which inherits the class and really does not like the
> default dependencies should add the `INHIBIT_DEFAULT_DEPS =3D "1"`.

Adding the missing links, sorry about that:
[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1592
[2] https://www.openembedded.org/pipermail/openembedded-core/2012-September=
/067782.html

>
> Regards
> Max
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186832): https://lists.openembedded.org/g/openembedde=
d-core/message/186832
> Mute This Topic: https://lists.openembedded.org/mt/100987453/3617484
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
x.oss.09@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

