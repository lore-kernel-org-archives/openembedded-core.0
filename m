Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9682C54E4A
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 14:41:27 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.23503.1709908886867879980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 06:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EdtxacNM;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e5a50d91b4so827796b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 06:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709908886; x=1710513686; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzm0bRRTvRyAJMy4FOM9/lJM3ch1331WwEy3WPOl8LM=;
        b=EdtxacNMz+ihN8otwwQgzujr8Ld4DuD79Cfw2rgIGY0vxLgd9/7/afznt7zJmP9bjm
         eVPMWvgSynIn7ui4nGpN0sM0aDh6NG5WpOrAv9QiBc+Zrv0QXUopqN/0oNBdbT3nlyLU
         aYyxys5vOUa2z4HXl71lESV8I/qroqgoSMP4fNiSBfYKTifW5ggTpryKbH5QtozT79HP
         nQ8nZ8ljQpO8dt60G4ttyFDhjd2IqAZfZNonJoNuSd0UlGSPhRpId2fw50TzkZWYyb35
         o+5+GoP26YOv4CptPETwEWviYD+fNW7w6PuYmXwOUIFDWtGzMG84b4CyCIRGbhfMLYte
         C1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709908886; x=1710513686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzm0bRRTvRyAJMy4FOM9/lJM3ch1331WwEy3WPOl8LM=;
        b=KK2h8txSM4KJKcYXQt29vBVwjNZaxjyGK3+glxNO8Xc6HOK+AFiTf+PepWgtnGjnww
         mzGW0slOcObkulzYYNmpf1o5w/wNZi5ywMTs7/4G2kYX5EoIPX2y29iw6JcmFHBLQhXH
         cMzzlWUkPOLbYqRO1NevG3apzLc6oww/BQ9MvCvGVqEwNIqt1B5I4DubSCINl/NPJhm0
         ecp2rzcASQ8rPf0+Bj7dIaRN+2VbbD2BDk4aMTG5CnWTcQinZWmJS6w1yVzW91mCxFvV
         +WuI1OP4Ld9o4/zySZYjkqy0+Dpi9CGup7zlsSi+7NS5vIB4RC7bELGCKesmWX5K1aBt
         tkdw==
X-Forwarded-Encrypted: i=1; AJvYcCW3KC1IUBSlYZK08RGDYXUuTl7k79ObvKT3GsImP4MGl/Rrcx7ZvUb7nRYRqrN/+XYLfWgU1k3+D5bu28vc6wpkdWTMTYmVZ1RaBXekvU+NCI7owhHathwM
X-Gm-Message-State: AOJu0YzfD3pQYepsBWnspFcBMShwxfoRbYtnfVpUNhFfZXQJ8ZadH+3y
	rUxxzNr+WO+CDZ4QsiWzXhIR0V4AR63E04/DsIthrAHBaX43T5t3Pl6ppwloRE0Ud3fXKJRE55A
	NVItB+Vnp1VGKC4dqM0reSRlzEJY=
X-Google-Smtp-Source: AGHT+IEJwL4LtLusvhdA7SNgFDK10tgus1gRJG2oHtnD5/c90Q/nZDNsBZISEqBh1di8S0dpBQW5FCUuJwbGtd8Xhds=
X-Received: by 2002:a05:6a20:431d:b0:1a1:847f:8fa0 with SMTP id
 h29-20020a056a20431d00b001a1847f8fa0mr1699356pzk.15.1709908886037; Fri, 08
 Mar 2024 06:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3> <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
In-Reply-To: <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Mar 2024 09:41:14 -0500
Message-ID: <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Steve Sakoman <steve@sakoman.com>
Cc: Kevin Hao <haokexin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 14:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196852

On Fri, Mar 8, 2024 at 9:21=E2=80=AFAM Steve Sakoman <steve@sakoman.com> wr=
ote:
>
> On Fri, Mar 8, 2024 at 3:35=E2=80=AFAM Kevin Hao <haokexin@gmail.com> wro=
te:
> >
> > On Thu, Mar 07, 2024 at 06:13:35PM -0500, Bruce Ashfield wrote:
> > > Adding Kevin,
> > >
> > > I'm not going to be able to debug this more for a week or so.
> > >
> > > The alternate ways to fix it would be to try that ubuntu patch (fixed
> > > for our tree), and / or see what else needs
> > > to be cherry picked to -stable to fix util-linux. It is likely just a
> > > return code difference to userspace when
> > > resizing is being done.
> > >
> > > Kevin: I'm not sure if Wind River is seeing this, but you might want =
to look
> > > into those ptests and see if they pass on your end.
> >
> > A silly question, which branch are these three patches supposed to appl=
y to?
> > I have tried the kirkstone branch, but it seems that they can't apply c=
leanly.
> > I also tried to manually apply the two kernel patches to the latest
> > linux-yocto/v5.15/standard/base branch, but they also can't be applied =
cleanly.
> > Am I miss something?
>
> No, you haven't missed anything.  Bruce was assuming that kirkstone
> contained  patches that he hasn't sent yet. I wasn't able to apply the
> second two patches either.

Yes, exactly. I did the patches against a different queue than what
Steve had in test.

>
> > On the latest linux-yocto/v5.15/standard/base kernel, the parted ptest
> > does have three failures. Then I have tried the ubuntu kernel patch [1]=
 which is
> > mentioned in the previous discussion about this issue. This patch can a=
pply to
> > the linux-yocto/v5.15/standard/base cleanly and it indeed resolve the p=
arted
> > failures, and I also don't find util-linux ptest failure after applying=
 this
> > patch. I attached my logs.
>
> Hmmm . . . Bruce said that the ubuntu patch didn't apply for him, so I
> haven't tried that.
>
> Do you have a kirkstone patch that I can try on the autobuilder?
>

I'd still rather not go the ubuntu patch route. It is my last choice in the
options.

If this is caused by upstream commits, there should also be upstream
commits that fix the issues. I need to identify those commits and
document why they aren't appropriate for our 5.15 kernel before I pick
up someone's else patch .. since at that point, I have no idea about their
logic and other issues it may introduce.

Bruce

> Thanks!
>
> Steve
>
> > [1] https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/=
jammy/commit/?h=3Dmaster-next--2024.03.04-1&id=3Dc3032b60ff7b3948325b8f2bd6=
88b9a74be3cfb9
> >
> > Thanks,
> > Kevin
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196851): https://lists.openembedded.org/g/openembedde=
d-core/message/196851
> Mute This Topic: https://lists.openembedded.org/mt/104794844/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

