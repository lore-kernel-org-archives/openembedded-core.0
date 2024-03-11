Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BAAC5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 14:11:01 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.63749.1710166251890470637
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 07:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LPUbc5Oi;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6098a20ab22so37553117b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710166251; x=1710771051; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWe42GT52k0ajO257cHQL+CcE2nGmh0KsRS4L3Vp60I=;
        b=LPUbc5Oi8H+Rcehoiqr/tdZQOc7jYKSIfocCm/nJfJyoFSKOcuBCmsBuGphw+R4abK
         0CK0LRbYzy2hVI0xsUO1nQPXYvuZWYQ5fP73s23N3IGQ1VxZI/Rz02Zyz8kYTfUwXxli
         uUI5+mz6fkQUgBn9xxCFGa3P5nT3xCBXiCKTiYFdhDvue5W9pA8shuewQTYruInMF4/z
         IWaeGJqjmLONjE+nnLopUdPrOFy/vMPPRLcpOFxEQ6Kv1rmMpLZQuxJorXYzIBrTn9kD
         GxvwyQhRryvq25ipMfp6Hu96c+HxIOEyk/XmjTIzL4R5WE8ljBluel/XQD2UeLjpxDO0
         IbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710166251; x=1710771051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWe42GT52k0ajO257cHQL+CcE2nGmh0KsRS4L3Vp60I=;
        b=gvH4JjMmF+NXLodpOFVtI50DLEpI/uHyjiggWE2m3C8hNm3P14sbf6nMevG7oaYANV
         Nc6UrHQYEwGIY+5bVxwAOElDAK9SWBKhxWw0H90RQqU5ACOkSCy7yOoSJWHoFxhHf76N
         9fQ0PGO7jI5HuahBx1hE/FvRDSYPHmjny1iyZq8/Ekp4+W5GRWKnC6nmkXLaSTD5rhsH
         vQjV+oW3HXer4VjMD2p1GV98Jjek9dQZ16IOY6vYxmJBBW3+jr+Xyzt3h0pNDZFUL5+S
         5LuZbyp+oR0HipN70vMExiVeKuHx2CVKGw28vYXEe179h78+xy0uZKoQ5QY3OFvw1g/A
         33Og==
X-Forwarded-Encrypted: i=1; AJvYcCX/tAPZdcsKXQceiGmJhGDgKVVSyPzmd2V5xb3bp2oAuYg/tTgA+mTivpwMOKdci3cM7EXNFzEpj6jpQZOhmJEzNO8Bq1hpptPKlEDUueunPOEV4IVoQGdb
X-Gm-Message-State: AOJu0YygcjHsR3f9MVcjGAsscByp5m+aHI5oU7UTVO1s0RuCbDOsB5xo
	6EYneSJSSmT+qdOu2z39BAuKFxfFOus21xdd8X9tzJagjv/jPm9wi27HbU9YF2HqauUzaRAsf9j
	Xm6TJn7TRs3qMjOMaO4ZTiwinHzHlmAO3//5Dfg==
X-Google-Smtp-Source: AGHT+IEHi9UCn4WVHSLgxdvAinqr0YPsfKZJtQ5d5gvcHpJtSWGP8fbkF3H1qUMy4OW8dp58gsXrmpoeLnk+t+lXuRY=
X-Received: by 2002:a81:6e8b:0:b0:60a:1f3:5964 with SMTP id
 j133-20020a816e8b000000b0060a01f35964mr6775129ywc.31.1710166251086; Mon, 11
 Mar 2024 07:10:51 -0700 (PDT)
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
 <CADkTA4PNwFeXWTQ764jt1abDf51CHQHukNoQaOM+csj8VCQP=Q@mail.gmail.com>
In-Reply-To: <CADkTA4PNwFeXWTQ764jt1abDf51CHQHukNoQaOM+csj8VCQP=Q@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 11 Mar 2024 04:10:39 -1000
Message-ID: <CAOSpxdbBzMm4M6SeOkuMBj-+LLDCxn+44Da_JJsJ28X=gXKNDg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 14:11:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196941

On Mon, Mar 11, 2024 at 4:01=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Mon, Mar 11, 2024 at 9:51=E2=80=AFAM Steve Sakoman <steve@sakoman.com>=
 wrote:
> >
> > On Sun, Mar 10, 2024 at 4:25=E2=80=AFPM Steve Sakoman via
> > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > On Sun, Mar 10, 2024 at 4:10=E2=80=AFPM Bruce Ashfield <bruce.ashfiel=
d@gmail.com> wrote:
> > > >
> > > > On Fri, Mar 8, 2024 at 10:24=E2=80=AFPM Bruce Ashfield via
> > > > lists.openembedded.org
> > > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > On Fri, Mar 8, 2024 at 6:44=E2=80=AFPM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, 2024-03-08 at 10:42 -0800, Steve Sakoman wrote:
> > > > > > > On Fri, Mar 8, 2024 at 5:10=E2=80=AFAM Steve Sakoman via
> > > > > > > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedde=
d.org>
> > > > > > > wrote:
> > > > > > > >
> > > > > > > > I did fire up a test of Kevin's patch:
> > > > > > > >
> > > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/=
builds/6373
> > > > > > > >
> > > > > > > > Let's see what happens.
> > > > > > >
> > > > > > > I can confirm that this patch fixes the parted ptest issues a=
nd does
> > > > > > > not trigger any other ptest issues.
> > > > > > >
> > > > > > > However since there is a kirkstone release build scheduled fo=
r next
> > > > > > > Tuesday, the current plan of record is to revert the previous
> > > > > > > linux-yocto 5.15 version bump series for the release build.
> > > > > > >
> > > > > > > I will then wait for a patch from Bruce that fixes the proble=
m before
> > > > > > > reapplying it post release.
> > > > > >
> > > > > > If it takes a few more days it may be better to slip that relea=
se (when
> > > > > > QA are likely testing M3 anyway) in order to resolve this rathe=
r than
> > > > > > reverting a load of things we'll only then end up reapplying.
> > > > > >
> > > > >
> > > > > I'll be working on it over the weekend, along with some other ker=
nel
> > > > > items that I didn't get to as I worked on this today and some met=
a-virt
> > > > > things.
> > > >
> > > > Steve: Here's my latest queue:
> > > >
> > > > https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel-kirk=
stone
> > > >
> > > > It passed the parted and util-linux ptests locally.
> > >
> > > Thanks Bruce!
> > >
> > > I'll grab the patches and run an a-full on the autobuilder.
> >
> > The a-full results are here:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6666
> >
> > The ptest runs came back all green, but there were failures in all of
> > the hw-ref tests that use older versions of 5.15 since the patch added
> > with SRC_URI +=3D  in your final commit doesn't apply to those older
> > kernel versions.
> >
>
> Yah, that's fine.
>
> We'd never merge the patch like I put it in the queue.
>
> I'll actually merge those changes into the linux-yocto tree and send
> SRCREV updates. I just wanted to make sure that they worked in
> your tests, like they worked in mine.
>
> I can also bump the reference BSPs to pick up the change.
>
> Really this is something that -stable should be fixing, but I'm not
> in a position to propose a fix (it is far from my area of expertise)
> so I kept the patches with as minor touches as possible so when
> (if) they fix the issue, I won't have much conflict.
>
> I can do those SRCREV bumps shortly and send the entire queue
> by patches if that works for you.

That would be perfect. Thanks for the quick response on this, I really
appreciate it!

Steve

> > For example, beaglebone:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8751/=
steps/11/logs/errors
> >
> > Steve
> >
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait
> > > > > thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > > >
> > > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#196908): https://lists.openembedded.org/g/openemb=
edded-core/message/196908
> > > Mute This Topic: https://lists.openembedded.org/mt/104794844/3620601
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [steve@sakoman.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

