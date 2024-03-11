Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F2BC54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:01:21 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.63658.1710165679742575913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 07:01:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=If4LzwNk;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-29c2880c8b6so123742a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 07:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710165679; x=1710770479; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4xYIRdhIHXA3yFoHi3FL2SFD40sA077ZODPaNSvrUc=;
        b=If4LzwNksIm7fcL3hp5TgdqEKCbSgnh5p4lDD7hfNoSCDFyQvN6sZm771L0xPu9F88
         MWWlCa8JnjlXQs/zbH9YWIa02lbjwxfAs9OI6anqKjc3srbcOEI0bJmFhz3e2qKPa/bk
         ZE3TznEbwJ6/tyJ9Ml28wvNmf01+9ioKpVaFVA5mGM9vOYiM7gyu8JU/SVHAXc7V5s60
         j0LJzzPPv7PmvGfZ4KPV9XIyo5nH/6PaBebqipJGAwdcAdhSljLa1D0+C3vWLz1qjChD
         B+QFJMTXYPVDK9ObWLcRG+jsE1jchVNBwEeCbW3IlQdR3Ygs+dPlhTWWtyxQGeIwgYVj
         g1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165679; x=1710770479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4xYIRdhIHXA3yFoHi3FL2SFD40sA077ZODPaNSvrUc=;
        b=HaFZr+HgvdO0PfIymlwvktEdF9G+Go+D7EgGZBq6Nub5UAAEOUlhUgK3Z7YmkPrrDr
         Us6P02JsrrvoDLH8UU84dd4bDoXo00rypOfNCdKomJMGrvkszbOa2HmHfjxZCn2efP0n
         tFq8BhDBkjTVspz+hRA3JzUs2hrhqjQWp5re+lEYC2XNj5EwO9mhtXZzSWni0Io9/x73
         4MyQ87n0b8Dun72uP7M6gv3+86kyY+PN4658BllqS+kpIBQCH60DoVKc1sZKtj874xTz
         B1HmUx6nvvwfx0iQnYFNyJ+f32VKk1RaS8Tl3LKtEbGeugQ6LPORuQD7UloEHE2cqkjo
         UWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtkJ4BEyNW0o0nU+WgRIYzZ6OATr1pwgMNU7iBO+0ANuVMHTZkjnem3COm2t8CGmPiiQAOxJz9MibP8Jftc4HEQWK0ROyncU9H4cW+DbfpzNb2kS+obtV2
X-Gm-Message-State: AOJu0Yye4HTNfNhjWbMkUwJliQJJ4eXfGPgDTvAiB8lQAQxf94Q5t4em
	tRPu1Hb8bkGNWHpv2pLUx5BGTU8kccaolh/vHfXMGWYDVCCPE31g7S5ae90oRprpWe/Vld2lHqv
	06Yfo3xhHRxBa2iy+vEh5k6WTTfip5T5aI6Q=
X-Google-Smtp-Source: AGHT+IGlSAjORxPoNhJ6bi33nRP8AQSAs/6nbr0UxlFLw6zNeCrIWvfbMmRZ2nlX+CC6HtQxNDWApZATSS+QvyYXgcg=
X-Received: by 2002:a17:90b:4f84:b0:29b:c47a:24c4 with SMTP id
 qe4-20020a17090b4f8400b0029bc47a24c4mr645287pjb.9.1710165678940; Mon, 11 Mar
 2024 07:01:18 -0700 (PDT)
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
 <17BB94A9287B59CB.17779@lists.openembedded.org> <CAOSpxdayPHFMaOoVcgYixDXxPgFYwEpDe4d5PR18Ab9u_0Gukw@mail.gmail.com>
In-Reply-To: <CAOSpxdayPHFMaOoVcgYixDXxPgFYwEpDe4d5PR18Ab9u_0Gukw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Mar 2024 10:01:06 -0400
Message-ID: <CADkTA4PNwFeXWTQ764jt1abDf51CHQHukNoQaOM+csj8VCQP=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 14:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196940

On Mon, Mar 11, 2024 at 9:51=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Sun, Mar 10, 2024 at 4:25=E2=80=AFPM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Sun, Mar 10, 2024 at 4:10=E2=80=AFPM Bruce Ashfield <bruce.ashfield@=
gmail.com> wrote:
> > >
> > > On Fri, Mar 8, 2024 at 10:24=E2=80=AFPM Bruce Ashfield via
> > > lists.openembedded.org
> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > >
> > > > On Fri, Mar 8, 2024 at 6:44=E2=80=AFPM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > On Fri, 2024-03-08 at 10:42 -0800, Steve Sakoman wrote:
> > > > > > On Fri, Mar 8, 2024 at 5:10=E2=80=AFAM Steve Sakoman via
> > > > > > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.=
org>
> > > > > > wrote:
> > > > > > >
> > > > > > > I did fire up a test of Kevin's patch:
> > > > > > >
> > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/bu=
ilds/6373
> > > > > > >
> > > > > > > Let's see what happens.
> > > > > >
> > > > > > I can confirm that this patch fixes the parted ptest issues and=
 does
> > > > > > not trigger any other ptest issues.
> > > > > >
> > > > > > However since there is a kirkstone release build scheduled for =
next
> > > > > > Tuesday, the current plan of record is to revert the previous
> > > > > > linux-yocto 5.15 version bump series for the release build.
> > > > > >
> > > > > > I will then wait for a patch from Bruce that fixes the problem =
before
> > > > > > reapplying it post release.
> > > > >
> > > > > If it takes a few more days it may be better to slip that release=
 (when
> > > > > QA are likely testing M3 anyway) in order to resolve this rather =
than
> > > > > reverting a load of things we'll only then end up reapplying.
> > > > >
> > > >
> > > > I'll be working on it over the weekend, along with some other kerne=
l
> > > > items that I didn't get to as I worked on this today and some meta-=
virt
> > > > things.
> > >
> > > Steve: Here's my latest queue:
> > >
> > > https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel-kirkst=
one
> > >
> > > It passed the parted and util-linux ptests locally.
> >
> > Thanks Bruce!
> >
> > I'll grab the patches and run an a-full on the autobuilder.
>
> The a-full results are here:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6666
>
> The ptest runs came back all green, but there were failures in all of
> the hw-ref tests that use older versions of 5.15 since the patch added
> with SRC_URI +=3D  in your final commit doesn't apply to those older
> kernel versions.
>

Yah, that's fine.

We'd never merge the patch like I put it in the queue.

I'll actually merge those changes into the linux-yocto tree and send
SRCREV updates. I just wanted to make sure that they worked in
your tests, like they worked in mine.

I can also bump the reference BSPs to pick up the change.

Really this is something that -stable should be fixing, but I'm not
in a position to propose a fix (it is far from my area of expertise)
so I kept the patches with as minor touches as possible so when
(if) they fix the issue, I won't have much conflict.

I can do those SRCREV bumps shortly and send the entire queue
by patches if that works for you.

Bruce

> For example, beaglebone:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8751/st=
eps/11/logs/errors
>
> Steve
>
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#196908): https://lists.openembedded.org/g/openembed=
ded-core/message/196908
> > Mute This Topic: https://lists.openembedded.org/mt/104794844/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

