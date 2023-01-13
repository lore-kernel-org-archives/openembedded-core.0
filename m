Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAF6C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 09:37:14 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.82354.1673602625162837329
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 01:37:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pTdLc8KH;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id bu8so32286830lfb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 01:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmTqc3Fxwo/aatMMYXPgO/nuszq+1yG5aqaHc9CD+qQ=;
        b=pTdLc8KHmcS5AC/X7Im93sZWwS1OE8ivwlapBHfFUg5fRdjhqalCcMZ4gt9k06HPeM
         V7XfVfjj4reLo+7kajjczRHXthAXz+fH26d6hwLi/5u/6gxD2SHSiZYU/Y3KdWP/MsRL
         2si7jScWZ6A14s0nbTowepOQ6aTXZV8Hn8kfmBG5yQdQ85ySUyzKWIwvuIjAIdYRvp4q
         CYgY+ZnYlqz7Z2fc7FCM/8bf0LrjfUoJd4ShS/M0v9OKTNXixZ8jPRZMiSIvCvZ7Rlrz
         umgHxf3L21cRs9O+ibdGlZ+KXyTYVeLH9ArrLSIxNAIobj0jUvbB1I1m0zxXnlG3DpkP
         3HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmTqc3Fxwo/aatMMYXPgO/nuszq+1yG5aqaHc9CD+qQ=;
        b=oEslXqjfejw0hMt4Cijxu3w0jYV3M3yrB7aYWbz38CcTNKpUF7D69J2H+/KDril4Tu
         Bb74+IBqSIffRAXou00gKPpKDhwNI+gV2zTgxyg51xLb9MDX5uyoSRcuxIik5Y2wzaPw
         6zxsVCUERa8Je0wiWl3TVsZM/HH7LNtnm67t+gW55gAUWRh6knO/7f13d1Y3s92EpkzZ
         Q92eyW2z0f2CgyfooalziwMmRyAmDL79xnE94rYZkRWjXvQr0zWeQbhILanJBuC0XaZP
         iQjuoKMxmqTmbeUPQn+HPdUneONtLxw/NSeAd8bYfXN204e1XcbdSm/DuaLRzEtR/q0p
         4efg==
X-Gm-Message-State: AFqh2krG5+L0hr3xjomEbjqkDGHWAAzP7Lh9YWR1Jgp/bVZ5LMgwESiZ
	oI9i3fyYqaX1VjVG6c734lc362Mjw71o3sNrGIo=
X-Google-Smtp-Source: AMrXdXs0avEj1ohevO32zffD8Jsbpc7D8nl1Q5EyaAJISHeiIphwm5wQfD7RpR/3H8kDQto0pdzIW1ZB/oilqoPNNlk=
X-Received: by 2002:ac2:4bc9:0:b0:4b5:4502:1323 with SMTP id
 o9-20020ac24bc9000000b004b545021323mr4814026lfq.345.1673602623183; Fri, 13
 Jan 2023 01:37:03 -0800 (PST)
MIME-Version: 1.0
References: <20230112213301.11768-1-s.zhmylev@yadro.com> <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com> <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
In-Reply-To: <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Jan 2023 10:36:51 +0100
Message-ID: <CANNYZj-PGM5iD0PDvD7u-reGXxZRtOkLMhMX8T9XnpkoX1wpzA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
To: Sergey Zhmylev <s.zhmylev@yadro.com>
Cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 09:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175817

This document hasn't been maintained in decades, and is not in any way offi=
cial.

Alex

On Fri, 13 Jan 2023 at 10:14, Sergey Zhmylev <s.zhmylev@yadro.com> wrote:
>
> Sure, RPM naming convention from rpm.org:
> http://ftp.rpm.org/max-rpm/ch-rpm-file-format.html
> As you can see, there are nothing about "core2_64" architecture.
>
> --
> With best wishes,
> Sergei Zhmylev
> Engineering consultant
> OS development department
>
>
>
>
>
>
>
>
> On Fri, 2023-01-13 at 09:34 +0100, Alexander Kanavin wrote:
> > =C2=AB=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=
=BD=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=
=B2=D0=BD=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=
=81=D0=B0=D1=82=D0=B0!=C2=BB
> >
> > On Fri, 13 Jan 2023 at 09:25, Sergey Zhmylev <s.zhmylev@yadro.com>
> > wrote:
> > >
> > > Exactly! Even more: when I build for "genericx86_64", I get mix of
> > > packages with architecture one of: "x86_64", "genericx86_64",
> > > "core2_64", and "noarch". Our audit team highlited this as this is
> > > not
> > > compliant with common RPM naming convention.
> >
> > Can you please link to (or describe with references) the common
> > naming
> > convention?
> >
> > Alex
> >

