Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4E4C54E49
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 02:10:16 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.52618.1710123010712242485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 19:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XzHoBqZ5;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29be9c136a2so518234a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 19:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710123010; x=1710727810; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6OzeICdzOAzo1/nTbiYN0JlXTnHd7yrAc/l7UKNLUc=;
        b=XzHoBqZ5quBEe9OlwSUiFtEfjLpWo5TFff4UEogHsDrZ9e1irufM8Mi6O7c0Fun+Dk
         xxkmKITvr53UjG88XAMQUPc/dFspQITzwjFmdS26ZQS3TP243DqEEotQXruRDfh1Kfmh
         ICi/osovBhBjbVxhPF1vBBeIBKaPP2orCw77bNAY6GKRpu/x60nl0qQtr81HmA8VFtIw
         lsBLzLrrpt8lwWi0AnZ4KCHtihiqAhQqMtqoZ5azPqk5MzluqOH9+CtwYTysbDFg/gDE
         DYX5NNmylEaOwUfohatdga/fIbKmYyt2awQHtEfBu5uV8a6oOsFnkPyhaygo7ZNFzqK0
         Bdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710123010; x=1710727810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C6OzeICdzOAzo1/nTbiYN0JlXTnHd7yrAc/l7UKNLUc=;
        b=cM9YTkJDk0G82ygqrjl2uo5rEtM3kh0cV13V/q3vXFmL3Nf6Ch1bTtTBoZgmUJ7MjL
         6DtMtIwSN6KUPMZz9O5uo4DpaK81Leckof0slGtc0aFl6oXPamTerLH+DnKSoF7RfEx4
         lS0YHDo7nOs7fw/dzQkVhrYv04jPGadswG5iCsnrqxC5lJYIcIOJ/X9UFYfH8zqUuetO
         XxdI4EJ7u2MbFViDc5sr8zW7hKCVTuUPwgv9WjvLUWo2n059FTfyRbMnCaA2T6Wora7h
         XUS6R32h1K0VqUEiuT9084NsuHYkTcPGTtJOw6KytaAdPN95UL3n/+4z6kpXML0Lzl6E
         0/sA==
X-Forwarded-Encrypted: i=1; AJvYcCXDJ6+0AUP9P8g2823sp7ykydvGbB6BVQh25x/RVObTIINIqbBTLvxhxCdfeImxcOhO+M0LUIJLuJCtDO+9fWzz3kmz5plS166zNi40jUdMtYNMPk+5fobn
X-Gm-Message-State: AOJu0YwN9JY5qywHxDFe4E8GvqzyrCNFPmaVIzO++LVwX3jCxZZOfw0C
	hpE5SRZpSMyXyQzDtmO9/t8vF/XPYUig4kltWDWlLwLNMPvIov0MUByfnoK70cAuU4xVS01QoS4
	Sx+5CqYR/q2sVy55JCI8+Ag2eo/s=
X-Google-Smtp-Source: AGHT+IHXZVmFi83tfPP3kZD6Sg2zsPw4eKK9sNPlrOu3BcEXxeoU/yt5w4SMhQAnvtRd3geRQOAPH5MCwkOTuewwNU8=
X-Received: by 2002:a17:90a:d490:b0:29a:cb1d:7a37 with SMTP id
 s16-20020a17090ad49000b0029acb1d7a37mr3506298pju.32.1710123010083; Sun, 10
 Mar 2024 19:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3> <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
 <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
 <ZesnuCYO3_s90qYE@pek-khao-d3> <CADkTA4MzMQFtEXyTcS8Hc4b8bcfPQ5-q=f4bUBUx3FcqkchPXw@mail.gmail.com>
 <17BAD2A66EE04CAD.2608@lists.openembedded.org> <CAOSpxdbZaDdip_yn6X8x80MWXhLLVPz+_SCWGO-TTKU7nDdKSQ@mail.gmail.com>
 <13872d74aca711f2a345d778e0239ddbaa6353b5.camel@linuxfoundation.org> <17BAFAB0B33CCEEC.17779@lists.openembedded.org>
In-Reply-To: <17BAFAB0B33CCEEC.17779@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Mar 2024 22:09:58 -0400
Message-ID: <CADkTA4NpUpnyu5E+JAFJqd+k4+Hak=CqsD+V6Dpu6D8LkC9kCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: bruce.ashfield@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 02:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196907

On Fri, Mar 8, 2024 at 10:24=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Fri, Mar 8, 2024 at 6:44=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2024-03-08 at 10:42 -0800, Steve Sakoman wrote:
> > > On Fri, Mar 8, 2024 at 5:10=E2=80=AFAM Steve Sakoman via
> > > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > > wrote:
> > > >
> > > > I did fire up a test of Kevin's patch:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6=
373
> > > >
> > > > Let's see what happens.
> > >
> > > I can confirm that this patch fixes the parted ptest issues and does
> > > not trigger any other ptest issues.
> > >
> > > However since there is a kirkstone release build scheduled for next
> > > Tuesday, the current plan of record is to revert the previous
> > > linux-yocto 5.15 version bump series for the release build.
> > >
> > > I will then wait for a patch from Bruce that fixes the problem before
> > > reapplying it post release.
> >
> > If it takes a few more days it may be better to slip that release (when
> > QA are likely testing M3 anyway) in order to resolve this rather than
> > reverting a load of things we'll only then end up reapplying.
> >
>
> I'll be working on it over the weekend, along with some other kernel
> items that I didn't get to as I worked on this today and some meta-virt
> things.

Steve: Here's my latest queue:

https://git.yoctoproject.org/poky-contrib/log/?h=3Dzedd/kernel-kirkstone

It passed the parted and util-linux ptests locally.

Bruce

>
> Bruce
>
> > Cheers,
> >
> > Richard
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
> View/Reply Online (#196866): https://lists.openembedded.org/g/openembedde=
d-core/message/196866
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

