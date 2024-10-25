Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3A0D116EE
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 05:08:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.5268.1729832913512253989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 22:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8oEHB2q;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e5130832aso1167220b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 22:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729832913; x=1730437713; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kq27mx4AH9LlRWS6ULixQlkUOsoceEl20U8I6p5Inl0=;
        b=U8oEHB2q3cbIeFJbDmEVAogHQuHFRAo/fugteaoaYQYZ84RcBY05AUjoceeW1KtBAS
         xMqQ8VS7hLL0v5Ihnm/0O84DkHizpg1Rh0XTRImER+U3Qm8BrhFIf7lgrbPcL3+75lMX
         fci1dKRv92JqJv0Wk/eu6KBZ5gZvcJkPBnzqXBrO4o9aTNNcG7CulHRjqShurjW1mOA6
         jd2BDrT4wS5HACCS/NFpf3tzLsry3gmZVlVCzyOUfrZ11VfvSj9nzUjzLliLCxZLAEeX
         XBk1sGwmw0YDdOdNapFxd6WNa+d2aN8h6BdiRCXG/nnTzksp+6ifsQhRbaPwC6edtyBf
         i5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729832913; x=1730437713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kq27mx4AH9LlRWS6ULixQlkUOsoceEl20U8I6p5Inl0=;
        b=J+3YZrC7QZRCuAcLQQZG77ZI2koiS/knnY/uvnzy/sVcVC2SbE/fLY1nyIJowLm95D
         /YfGgdrwvKpuuTWFJRID8OGA7UdEX/gfRYGIMUSfpi7YTh14HY3Ltz8M1Nv4wzlMxan0
         TMzkK7+1x4CMsEedaYbSDVNT0tVUCqsLqdb55oVOBUMXVkpKriEPvK43aklcwGMybW5L
         E3yFi5lxaD/7wLpU+en+J7Vsz3NiPG7d46Tu1aZr6hyLaiWWmHA8Qd2Isx72ZzNCvYSX
         AW+Uv6eEuIaDrWge0lCPmJo8jvQT43ItsBz1SnZyNVqg6aYzhgM1JM/JftKsB3uA3Gfx
         ic0A==
X-Forwarded-Encrypted: i=1; AJvYcCUGC8gkvfm02Z1cNiX665WrwJmdMW0GDk9pzFurW5fF0V7D+y8ftxeM6lz8VLnCXxeAk0BqmNHCXmGLb9FGTARulA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQ3phA/M4hlgbtJ6bvfjvGkx3Ai61KZkjA3TNFxf05s2JxFA/3
	et1JpYewWN6wp1oyuS0TMzOO/XqEAimN91MY7WNSo21kNhQs/gwlO3W9+PGKt270E/ClRNxKlSs
	XJf4d8RVqEdTYUJ2shOM8l7cSoZQ=
X-Google-Smtp-Source: AGHT+IEeogKBCmC3K4RxRHmUigaPFzMClVfQ26PXs/ldqBWqitYsPgsLIYUVIXRjDfoj77MF08OXzDk5mmKegXLiy2U=
X-Received: by 2002:a05:6a00:1989:b0:71e:4ba:f389 with SMTP id
 d2e1a72fcca58-72030babd3amr11409888b3a.10.1729832912669; Thu, 24 Oct 2024
 22:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723636705.git.steve@sakoman.com> <468a9077d9b3466d60ee8c5b6144529ea5e5c849.1723636705.git.steve@sakoman.com>
 <CAApg2=Q13Q7mHWMOuC4=oL2AJVMBJpHAOPV_3xCphiotCrVuMg@mail.gmail.com>
 <17EB9EED917D6CD6.10903@lists.openembedded.org> <CAOSpxdYkNiYFE3n2KBaAPH=Qrxu3DGxgnLuWaJkMQbwHkEmVAA@mail.gmail.com>
 <0ac8780b1703a929a085f732db8647e5f091d933.camel@linuxfoundation.org>
In-Reply-To: <0ac8780b1703a929a085f732db8647e5f091d933.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 25 Oct 2024 07:08:21 +0200
Message-ID: <CAApg2=SBM7Bqmt7ZYTPOOan9T9FTdawoA1zt8+hqS+UAQzu9Ew@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 1/9] cve_check: Use a local copy of the
 database during builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: steve@sakoman.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000047d5950625461ceb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 05:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206311

--00000000000047d5950625461ceb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 3:09=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2024-10-22 at 05:59 -0700, Steve Sakoman via
> lists.openembedded.org wrote:
> > Hi Marta,
> >
> > We are still getting database errors on scarthgap (and occasionally on
> > kirkstone if memory serves), so I think we need to reconsider
> > backporting this patch.
> >
> > Can you suggest changes that would make it acceptable to you?
>
> Just for complete context, moving the database on master did isolate the
> database issues to scarthgap so the problem is in the older branches at
> this point.
>
>
Hello all,
To make a summary, this patch did not solve the issue on master, it was the
change of the database path that did. Is this correct? And we still do not
know what the cause is? So, when we change the path on all branches, the
issue is likely to come back ?

My problem with this patch is that it changes names of variables that are
in use. It should at least not fail silently for people who decide to use a
pinned database.

Do you see another solution than renaming the _DLDIR_ version to the old
name?

Kind regards,
Marta

--00000000000047d5950625461ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 22, 2024 at 3:09=E2=80=AF=
PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Tue, 2024-10-22 at 05:59 -0700, Steve=
 Sakoman via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" t=
arget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Hi Marta,<br>
&gt; <br>
&gt; We are still getting database errors on scarthgap (and occasionally on=
<br>
&gt; kirkstone if memory serves), so I think we need to reconsider<br>
&gt; backporting this patch.<br>
&gt; <br>
&gt; Can you suggest changes that would make it acceptable to you?<br>
<br>
Just for complete context, moving the database on master did isolate the da=
tabase issues to scarthgap so the problem is in the older branches at this =
point.<br>
<br></blockquote><div><br></div><div>Hello all,</div><div>To make a summary=
, this patch did not solve the issue on master, it was the change of the da=
tabase path that did. Is this correct? And we still do not know what the ca=
use is? So, when we change the path on all branches, the issue is likely to=
 come back ?<br></div><div><br></div><div>My problem with this patch is tha=
t it changes names of variables that are in use. It should at least not fai=
l silently for people who decide to use a pinned database. <br></div><div><=
br></div><div>Do you see another solution than renaming the _DLDIR_ version=
 to the old name?</div><div><br></div><div>Kind regards,</div><div>Marta<br=
></div></div></div>

--00000000000047d5950625461ceb--

