Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFC7C5475B
	for <webhook@archiver.kernel.org>; Sat,  9 Mar 2024 03:24:13 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.6032.1709954645268025086
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Mar 2024 19:24:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aWqPlT7C;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-29b7164eef6so1150114a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 19:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709954645; x=1710559445; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGu8PSW85MA4P6j9RzeGBGHkH7v7npqzYRsCDp4+eL0=;
        b=aWqPlT7CMobvpc0td7Kl76dg7IycXbbNulGek9nnAlD3zjaTrkUpph5P8ebf+eULTW
         TA7LDchNvYkGfCBo26+igy/J3pn9mNapzkcUI4cJ4UsBHoCLOFNv/P/uzJ0eThrPXUjq
         B4oKlBRUsJCV4e/YhhPSTcqyn0ymD49yO9+kBkCzKmmIW80f8VSaHMATktt7hZjWbw4P
         tyXVP/0Vthyq936I0zHMW+j5OZg8vCGHceK+V1v5EPP8ur9AwubSHLOVLztQuwRMuY03
         bYjdSo4SPR8nGYnfpEvhaFaKhmMIC2qExjWPMz6yyU8tcYB2EiZImV1b+l3bA4CVMdeS
         Ql2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709954645; x=1710559445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGu8PSW85MA4P6j9RzeGBGHkH7v7npqzYRsCDp4+eL0=;
        b=i+xGJE4nGR8YvpnFoByeRXiGmm27upW6o7MGA4rhivBacj4sQVOa21SYQhx+gMlWrB
         BoQdE/Bz4zPdo7Q6Bkd7huCgUBadR0YtvRgzfVNzXiaZSP4IOpeeUiaY+J3ka5/65ich
         H1oCW1dACCTtfrUFxKk3T6UdNIWTF5s1QJ6E+0JhFVQHhZSPxDMzvF/Nb1vwPIK9AEJv
         TJcB5T0sEuPZhtzQldOkv5AIefMgN0/lifuRap38X1tW+1ESZgiAqkA7NhtQ2sbZhRgN
         VRWgo8RUdPP4qUoZp8uuNf+5fg4i5JA+izFvmoRYc5L0kCAV/LbgH/74YM2/Gr9UE8cq
         Feng==
X-Forwarded-Encrypted: i=1; AJvYcCXYF3yrmaNUBfVm7vBq4rVcmntf2VoFLxoDCH/R3MH1APF5AU8Ejg+6Kshk9M+K2MeZ+YIvZFb0yu3U79ut3gofgHfFiXX7hVU8U/kFogZDMzPHn72O0MDx
X-Gm-Message-State: AOJu0YyXjcR0rMkUXfZ646EaOzBdTS4NCV/pB+hNxb9h7R6NRiCyY+/x
	id2dKB9qrriDlleIW5svBXGEMOnwFfU85gdDl9G5edfSXzDxQ/lCh1ONVKFSlK77scpT+MHrONg
	sVzr0t+O7zgn0sdDrSXh1s9zZkec=
X-Google-Smtp-Source: AGHT+IFVA2+fRzweRX0+eLZwKJzMlaz4tlZuC12PTHwx0TbRo2U4pwXH9u7T5p1K1BBXcP3AOFW5tQ4rGaUUIsdc838=
X-Received: by 2002:a17:90a:ad82:b0:29b:c317:6b8c with SMTP id
 s2-20020a17090aad8200b0029bc3176b8cmr856704pjq.41.1709954644498; Fri, 08 Mar
 2024 19:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20240307193409.987235-1-bruce.ashfield@gmail.com>
 <CAOSpxdaskMSouQhV_FmfS==CnfQ5zikQQ4QwwA3RzqtM6dzrLg@mail.gmail.com>
 <CADkTA4NM7zk6kpWe3BENz2a4Fjqwkx+ECqbu6tvsoktHWC45RA@mail.gmail.com>
 <ZesUK4JntnaikkPb@pek-khao-d3> <CAOSpxdbcpwpcwk+e-46FRKaPMip1mD+f4gE8ZP+jfNnef3S-UQ@mail.gmail.com>
 <CADkTA4O4jJcjhCMOXe0jhLygpvjWww+bzw8c1RnNTm65V3xKCg@mail.gmail.com>
 <ZesnuCYO3_s90qYE@pek-khao-d3> <CADkTA4MzMQFtEXyTcS8Hc4b8bcfPQ5-q=f4bUBUx3FcqkchPXw@mail.gmail.com>
 <17BAD2A66EE04CAD.2608@lists.openembedded.org> <CAOSpxdbZaDdip_yn6X8x80MWXhLLVPz+_SCWGO-TTKU7nDdKSQ@mail.gmail.com>
 <13872d74aca711f2a345d778e0239ddbaa6353b5.camel@linuxfoundation.org>
In-Reply-To: <13872d74aca711f2a345d778e0239ddbaa6353b5.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 8 Mar 2024 22:23:52 -0500
Message-ID: <CADkTA4MJ8Y31QAkqHvDqBo7ruV++Rn6ROzSBxfRjwvuKM9maDA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] linux-yocto: for-test-only: fix parted ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Steve Sakoman <steve@sakoman.com>, Kevin Hao <haokexin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Mar 2024 03:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196866

On Fri, Mar 8, 2024 at 6:44=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Fri, 2024-03-08 at 10:42 -0800, Steve Sakoman wrote:
> > On Fri, Mar 8, 2024 at 5:10=E2=80=AFAM Steve Sakoman via
> > lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> > wrote:
> > >
> > > I did fire up a test of Kevin's patch:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/637=
3
> > >
> > > Let's see what happens.
> >
> > I can confirm that this patch fixes the parted ptest issues and does
> > not trigger any other ptest issues.
> >
> > However since there is a kirkstone release build scheduled for next
> > Tuesday, the current plan of record is to revert the previous
> > linux-yocto 5.15 version bump series for the release build.
> >
> > I will then wait for a patch from Bruce that fixes the problem before
> > reapplying it post release.
>
> If it takes a few more days it may be better to slip that release (when
> QA are likely testing M3 anyway) in order to resolve this rather than
> reverting a load of things we'll only then end up reapplying.
>

I'll be working on it over the weekend, along with some other kernel
items that I didn't get to as I worked on this today and some meta-virt
things.

Bruce

> Cheers,
>
> Richard
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

