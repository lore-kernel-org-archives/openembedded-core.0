Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D2EC54E49
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 02:25:46 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.52815.1710123937439980039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 19:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fvIxhSkv;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc742543119so2205945276.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 19:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710123936; x=1710728736; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+icOSu1styHOVK89vnecFE9puxnhoz0Cj7GVsv7nV6I=;
        b=fvIxhSkvCdPmUSlZYTP46B/5iZ6iGrnN2W5+z5fT9RSW1xf4r29FNbfWbfGlVDz7GJ
         2ADkJBE0Yml1NfUdPC/dqkeodu2Wk16zomijO9yzW0c0JvxpizGPzzFSxvnN/FTHk1FR
         zjT8b2BR0NrYxxdSF7c1L4ihKcm8C9/gHmlWBjikbAYJHbmq4M8G8W3mN3BuUaaedwKV
         VOESSZOg9WGu+PYzn3X4CPs2C1lshotOg1j1YUfPR5114PSGz4MonYpmGcHBKg1m3yG5
         biVToh24Uo/JuLBxjHFMRfWB9rGdxGPA2I3s8B0a5qvxGz5ERDwRHLRkplSueNWgiyjj
         YaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710123936; x=1710728736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+icOSu1styHOVK89vnecFE9puxnhoz0Cj7GVsv7nV6I=;
        b=L3sH69cvDMaHqb9Np8ePmG92tCWXm6FsmTeq9Pq5xni3UPispJDhytJNg2at+AoDBk
         EMON0/+mv8vNOFc5raSWfE0TSnpf+1n+WarmMxnFoeTWZHq5CVIyxNoJVFak95rzIfdQ
         PrsU/t+Hxfeij9mmgerfeiAbzOW/qb06+vp0Z0NsdAiROrLB25hN5twKzEe3XNRL1WOV
         0i5F4rResLjHPQ4FRiMgXKVwxHdgPD18dl/3Gx8+mQ95fllezL/l4ZHPjgZv4QfAG62N
         BrgC0AfbD7Dlung+jp0ydhdeviDGIgGCx7+UcfZhmTFteuDnz+0I53kYLRpqZFN50nqh
         u/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNdfDd7OdeoOAOImOFWfVQD1SqRlzcFQVGPRmpoeda8C2Hp8PyR5fnOXMm/M2+ir80kLdScK1A/cDXAgYJjVfyR2/nMsf9+ssYS/Fl/vyJOXRNc4o6EupX
X-Gm-Message-State: AOJu0Yy1aPyDzJDl1d251U5yRBCLZoCFuhJe4Z80kLsypVL3axGsY5pz
	Cb4KEKwMyXRsQeQYBYx1vfE16JVLJhKsxLk04mv845OMaZgx+u4tkcE+Q+SL/Er06Yz7w4wexpX
	ACYSEcZXAW7Nq8e22Qg9mdHiScI9Z7buoOOYwtQ==
X-Google-Smtp-Source: AGHT+IHfKMxskb7OG44rcvmsWxPWapvipmdjlQKP7xL5ENirmOcdgzDQ3+sXa7XLg4zPqpsZPHOQnlO0ijpy17DzBbM=
X-Received: by 2002:a25:804b:0:b0:dd1:1f11:5ee3 with SMTP id
 a11-20020a25804b000000b00dd11f115ee3mr2467760ybn.31.1710123936546; Sun, 10
 Mar 2024 19:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3> <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
 <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
 <ZesnuCYO3_s90qYE@pek-khao-d3> <CADkTA4MzMQFtEXyTcS8Hc4b8bcfPQ5-q=f4bUBUx3FcqkchPXw@mail.gmail.com>
 <17BAD2A66EE04CAD.2608@lists.openembedded.org> <CAOSpxdbZaDdip_yn6X8x80MWXhLLVPz+_SCWGO-TTKU7nDdKSQ@mail.gmail.com>
 <13872d74aca711f2a345d778e0239ddbaa6353b5.camel@linuxfoundation.org>
 <17BAFAB0B33CCEEC.17779@lists.openembedded.org> <CADkTA4NpUpnyu5E+JAFJqd+k4+Hak=CqsD+V6Dpu6D8LkC9kCw@mail.gmail.com>
In-Reply-To: <CADkTA4NpUpnyu5E+JAFJqd+k4+Hak=CqsD+V6Dpu6D8LkC9kCw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 10 Mar 2024 16:25:25 -1000
Message-ID: <CAOSpxdZVhgA9UzU4CNDuuCsB0qVHVL9QO8oV=hJgVZtstKrEaA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 02:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196908

On Sun, Mar 10, 2024 at 4:10=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Fri, Mar 8, 2024 at 10:24=E2=80=AFPM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Fri, Mar 8, 2024 at 6:44=E2=80=AFPM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2024-03-08 at 10:42 -0800, Steve Sakoman wrote:
> > > > On Fri, Mar 8, 2024 at 5:10=E2=80=AFAM Steve Sakoman via
> > > > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > > > wrote:
> > > > >
> > > > > I did fire up a test of Kevin's patch:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds=
/6373
> > > > >
> > > > > Let's see what happens.
> > > >
> > > > I can confirm that this patch fixes the parted ptest issues and doe=
s
> > > > not trigger any other ptest issues.
> > > >
> > > > However since there is a kirkstone release build scheduled for next
> > > > Tuesday, the current plan of record is to revert the previous
> > > > linux-yocto 5.15 version bump series for the release build.
> > > >
> > > > I will then wait for a patch from Bruce that fixes the problem befo=
re
> > > > reapplying it post release.
> > >
> > > If it takes a few more days it may be better to slip that release (wh=
en
> > > QA are likely testing M3 anyway) in order to resolve this rather than
> > > reverting a load of things we'll only then end up reapplying.
> > >
> >
> > I'll be working on it over the weekend, along with some other kernel
> > items that I didn't get to as I worked on this today and some meta-virt
> > things.
>
> Steve: Here's my latest queue:
>
> https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel-kirkstone
>
> It passed the parted and util-linux ptests locally.

Thanks Bruce!

I'll grab the patches and run an a-full on the autobuilder.

Steve

> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
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
> View/Reply Online (#196907): https://lists.openembedded.org/g/openembedde=
d-core/message/196907
> Mute This Topic: https://lists.openembedded.org/mt/104794844/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

