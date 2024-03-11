Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86687C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 13:51:11 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.63255.1710165063090924391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 06:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zSqHOqak;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.172, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60a104601dcso24384057b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710165062; x=1710769862; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXmbwFXta2C+fEpPezNVL6fLs6I4LpkLYFDWsybeIRI=;
        b=zSqHOqakuSIBNLxbCWDE1p3Z9EzlNj/yPL4VmNtZhdj2NBgGb8Yc/GuxnMz9nh5kKF
         uhx5VKxzba5tMVw/Q8VP6CgXlP8sNeSxt7nLi1FAPSW39X+7kqLvfo3Y5xEochFcJb2V
         Bnx9RRH/9BGDNehZqcHzZ3Q5s/P5Sssh5E0LFNsqYlTQFFvi7UCZj97a4+2IGr+nq1mw
         7zqVWfpf2k6m/XHufI5+eildtrXRtxho2liMCNlPyxS1VUWaxtNF+DjAnweQgQ5KEMN0
         mLJGSrPufndX21Gigq+kktWaraKn52glUF/WlSyydMtU322NU9zvxi+5r8oU5i7dnw18
         5+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710165062; x=1710769862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXmbwFXta2C+fEpPezNVL6fLs6I4LpkLYFDWsybeIRI=;
        b=U/iH8uKMXEwv4BG7c3SbkibOngW4ul/+EP06/I9AytzX6DElXgXaK8UwaniB9jQHJJ
         cZa+NESYMacNdZdnq2xiL4SUipzpt/VT1UtZjXpDDFZstkjmM8jPvfD5a2SOotWFkeRl
         riEd3xg5jNiMzRKoBrHm/XUDUhVwsQyvuZ5kG4NT/i/CVFBj7rIJkA6ZWZrr9ok/iQzy
         hSuMrkiVvvm/jJAHBFLmpTVSQkQtq6QVlOggvYPQXyE+SgZU5zX9TIUW91iMsPv0tkZY
         P6QZtHibK2gPdSNrVXv26H4XAeWewVnbP6CWbj25LNl7YjCU2I+l2tQ2ulQMcWw2wK2H
         rWmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY3Ax75blW3C2/lPkHWjm1qviZM+VAF8L168oNiYUrG6Im7zkEKtrxIMg4FPT7TnqK9TMTFMToVmT7Ku/qIjgiHPBROMiF/VGne+TIoPODr5zSmct/+yxA
X-Gm-Message-State: AOJu0YxGGRks784oDOtJPl2v4TBtLdvL54uyF5K4R4Rp1KyYZpELs6Uk
	tlMHmQT/4sH2wD7u1yoalr0EWJREyuMW95LMo44xr8i4srncXQJa+HGT6NNzjygwRjfptJPj54Q
	lrPVOFEMrlp8FOaURzo+YMrSDdSQiuvE7bg/gsg==
X-Google-Smtp-Source: AGHT+IEkBBDOA3y5ugQEAdiVwwe5AM1vbRl2D/KEp8yHxz3eSX6z3eH1K+n4XIaSB1+7zWLaI2ythWjMG6D1cf+VcFM=
X-Received: by 2002:a81:5f85:0:b0:609:33dd:c63f with SMTP id
 t127-20020a815f85000000b0060933ddc63fmr646915ywb.34.1710165062252; Mon, 11
 Mar 2024 06:51:02 -0700 (PDT)
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
 <17BB94A9287B59CB.17779@lists.openembedded.org>
In-Reply-To: <17BB94A9287B59CB.17779@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 11 Mar 2024 03:50:51 -1000
Message-ID: <CAOSpxdayPHFMaOoVcgYixDXxPgFYwEpDe4d5PR18Ab9u_0Gukw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 13:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196938

On Sun, Mar 10, 2024 at 4:25=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Sun, Mar 10, 2024 at 4:10=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > On Fri, Mar 8, 2024 at 10:24=E2=80=AFPM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > On Fri, Mar 8, 2024 at 6:44=E2=80=AFPM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, 2024-03-08 at 10:42 -0800, Steve Sakoman wrote:
> > > > > On Fri, Mar 8, 2024 at 5:10=E2=80=AFAM Steve Sakoman via
> > > > > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.or=
g>
> > > > > wrote:
> > > > > >
> > > > > > I did fire up a test of Kevin's patch:
> > > > > >
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/buil=
ds/6373
> > > > > >
> > > > > > Let's see what happens.
> > > > >
> > > > > I can confirm that this patch fixes the parted ptest issues and d=
oes
> > > > > not trigger any other ptest issues.
> > > > >
> > > > > However since there is a kirkstone release build scheduled for ne=
xt
> > > > > Tuesday, the current plan of record is to revert the previous
> > > > > linux-yocto 5.15 version bump series for the release build.
> > > > >
> > > > > I will then wait for a patch from Bruce that fixes the problem be=
fore
> > > > > reapplying it post release.
> > > >
> > > > If it takes a few more days it may be better to slip that release (=
when
> > > > QA are likely testing M3 anyway) in order to resolve this rather th=
an
> > > > reverting a load of things we'll only then end up reapplying.
> > > >
> > >
> > > I'll be working on it over the weekend, along with some other kernel
> > > items that I didn't get to as I worked on this today and some meta-vi=
rt
> > > things.
> >
> > Steve: Here's my latest queue:
> >
> > https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel-kirkston=
e
> >
> > It passed the parted and util-linux ptests locally.
>
> Thanks Bruce!
>
> I'll grab the patches and run an a-full on the autobuilder.

The a-full results are here:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6666

The ptest runs came back all green, but there were failures in all of
the hw-ref tests that use older versions of 5.15 since the patch added
with SRC_URI +=3D  in your final commit doesn't apply to those older
kernel versions.

For example, beaglebone:

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/8751/step=
s/11/logs/errors

Steve

> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196908): https://lists.openembedded.org/g/openembedde=
d-core/message/196908
> Mute This Topic: https://lists.openembedded.org/mt/104794844/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

