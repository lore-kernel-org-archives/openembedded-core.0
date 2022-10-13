Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD07C4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 22:41:04 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.1027.1665700856169424390
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 15:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QdWCElJv;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1324e7a1284so3987886fac.10
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 15:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7MsEHEpuI/d0sz9yeDUqn6Gn99ldvndI7e7mljLGkE=;
        b=QdWCElJv8OdqoQ3wZpvFn/rFLrGvYRt4uDTB3G3aE6xJSqLz0lEt8GC2TQ4OCAQLqg
         GW+VspByK3HYe1KYqCdCztCT+3ehUQP6HOtYOa+GFaTQA38NayHpf81sp38UoyNcXu3z
         0qvh4LysDKuoZ83T95ZBrCGJb6oeL/ZJAFbdLSoveDdwE301tXIMxhWQkYYTwMAlWjti
         rLYpavJOqEX3KrE6JMTCxSKkAqezRa5mUl9ndyDwUP/RQnyhGqVfKAEbi6XLtYWx819w
         E/MTIW4UfzYKmSW3crkqje88OJ0DnDVveEALWqP6BfBn/bC2IBYHjDxLcSyOpS1zWoxy
         2Jnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7MsEHEpuI/d0sz9yeDUqn6Gn99ldvndI7e7mljLGkE=;
        b=RwmfuCguH1odbysAZhLhR5WonY0OjBgvBDsezc9psVoCR/gx9uAVt/dU4kYbbcQDm3
         VLjXKc4YIYlSabWPewnluY9wmpZSZjavnJpy5fe2r8kQzLhZ4CY7TvOwGlmHUb/vlCxP
         Xw3P9x5v1KlvoVH1WTzYZpIvz+8bmi0QADtyKNB4Efbevso6Lzk1yH1NcYWcUou5K1UX
         hGNzGx0rZ0l5Y8O0IzfeYAWCpJ6pMpEXkR6DQw2J+e5HyeySIgaSrEcVZqz+AEFHHAbP
         S5swx/ssm+n/7nBlzkXTXlA0FzRV4yi44jk/uUkeNzWNInQ2vvSJ4tjg9cmxcJgap8nW
         Ju2A==
X-Gm-Message-State: ACrzQf3Wa3ZWxWQm0ojclNqAXojdQcfSKTulbBieludIuZw0D5JKgsUN
	1Ly5++a9la2sSOelxpPJgphm8ruXJqvfAcPmrOFfgL9i
X-Google-Smtp-Source: AMsMyM56HgyI+ios5ncUaX9LtKubpsxLynZ8MKGe9zcvNnOvmV+0DdWcKTZlgRhBc42Eq7dvj2zoDD2TTUHYYgeMI+I=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr6508683oae.262.1665700855251; Thu, 13
 Oct 2022 15:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221013132926.2771530-1-pkj@axis.com> <6E25C44F-E526-49E7-9AAE-336E670B7F15@arm.com>
 <32ff3b495b8640fb9706bcd5119305f1@axis.com> <CAMKF1spjQSXimjhUeufGppgKenNLgsR+c_ppWJJd0ON4GS=dHw@mail.gmail.com>
 <86833f1a66344e14b8191960d12993f4@axis.com>
In-Reply-To: <86833f1a66344e14b8191960d12993f4@axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Oct 2022 15:40:29 -0700
Message-ID: <CAMKF1sqsD7zt0u6=iZertwcF5LKUU-P-KdeS+n=Aceao-+BLFQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Allow -Wno-error=poison-system-directories
 to take effect
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Ross Burton <Ross.Burton@arm.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 22:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171722

On Thu, Oct 13, 2022 at 2:21 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 13 oktober 2022 17:41
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: Ross Burton <Ross.Burton@arm.com>; Patches and discussions about th=
e
> > oe-core layer <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] gcc: Allow -Wno-error=3Dpoison-system-
> > directories to take effect
> >
> > On Thu, Oct 13, 2022 at 7:38 AM Peter Kjellerstedt <peter.kjellerstedt@=
axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Ross Burton <Ross.Burton@arm.com>
> > > > Sent: den 13 oktober 2022 16:05
> > > > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > Cc: Patches and discussions about the oe-core layer <openembedded-
> > > > core@lists.openembedded.org>
> > > > Subject: Re: [OE-core] [PATCH] gcc: Allow -Wno-error=3Dpoison-syste=
m-
> > > > directories to take effect
> > > >
> > > > Whilst this is a good fix, I=E2=80=99m horrified to ask why you nee=
d it=E2=80=A6
> > >
> > > We have a recipe for skia. Somewhere in that mess of a build
> > > system it uses (gn), something adds -I/usr/include/freetype2,
> > > which results in an error with -Werror=3Dpoison-system-directories
> > > enabled (as it should). Now, to work around that problem, the
> > > recipe currently adds -I=3D/usr/include/freetype2, which means we
> > > know that the correct path is used. However, since the original
> > > -I/usr/include/freetype2 is still in the list of options, the
> > > error still triggers.
> > >
> > > Now, to fix the problem properly, skias's build files should be
> > > patched, but that is not my job. What I am working on is to get
> > > our recipes to build with Langdale. This means I can cut some
> > > corners and, e.g., disable errors and then hand off to the
> > > responsible team to fix the underlying problem at a time that
> > > suits them. Thus in this case I wanted to add
> > > -Wno-error=3Dpoison-system-directories for skia, which I then, to
> > > my surprise, noticed had no effect...
> >
> > from gcc recipe point of view, this fix is fine. however your use of
> > this seems to be a workaround that perhaps is better fixed in skia
>
> Oh, I'm well aware of that. As I said, my job at this stage is to get
> everything building with Langdale. And to achieve that, it is perfectly
> fine for me to, e.g., disable compiler errors. Once the platform
> builds, the respective code owners have the responsibility to actually
> correct their code to not generate the errors in the first place.

I hope you will inform the responsible and ask them to fix the problem.

>
> > because =3D syntax for sysroot works with gcc but may not work with
> > clang e.g. so you are being lucky here.
>
> We don't use clang so that is not a problem for us.
>
> > > //Peter
> > >
> > > > Ross
>
> //Peter
>

