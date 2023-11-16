Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127B1C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 21:31:51 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.18632.1700170307496554228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 13:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nOqKG5Ld;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6ce2988d62eso691736a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 13:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700170306; x=1700775106; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21EDovuANlznaeMaJmWbKASVI7nrSxMXjOfDsJD2tNU=;
        b=nOqKG5LdlN5JoJYaMCusvne9N3SWhYOnAkoSrBGq06Ti4TG02hawHZZhHhr9U+lEAV
         /SLS0GBq9o4YFngqnzkZ2vDF6J2L2SRLYEu7fcRofi1UaUMIprEkERXjQEBwRd4elRsQ
         F8Lh6iDQgsMQvrnTdC+hasZNfY6a5j2l6v974NSQtUFK5SYFcB/0zX6HswpLvwMdp0wb
         tlaZayZ28NLcy5pG4F1R+znvAJ6uYEABH/WxKnR+6zIIe0yCOzFJXpvE4jW6BITxcuQu
         W98BEPhJol6lH1KHFveq6/xMq3BDOjaaoADeCO9gw0jyqz8H4UriRXqpVeAGyAX5CDcg
         +tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700170306; x=1700775106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21EDovuANlznaeMaJmWbKASVI7nrSxMXjOfDsJD2tNU=;
        b=bCZ6zt5bwocrJ+Le1dFpVNPywEF3rWaQcPiNBxPhKiW2poPgg1vbLr1kMwXeqQp+NO
         /ZPrSB62I/Ik1RB0YTpECS9p7N5g94D8/WhsbinXfvb0fbsszdMI03A65x/EsYQtpMMR
         5IR1c8Prer3hqRMWhdl15YEFxWSSeOBEP6zbFUNEIaDNNuEoeUA7Yj5APbinpDnjIclr
         btpQPq2zKdIkU98YaCu4W737sbdOONlAdrG5UxhvL+Bu1WMq7B60r2muLxbfss2cjaBw
         wVl+J4QKu00/Pr4B3VBa1YX8v/VEjerAhvwhdVmY2iiDvsR8mbHL/z4kDj9BeG+LEdfI
         x98w==
X-Gm-Message-State: AOJu0Yx41Xu4GflJX8RnqcVr+LjkZWNCakp+QP2Ht+wChqKZXuSg9tar
	HWTcXkr6dlTMubJLCFGTikzVTMz8X9RRSImA6FNSJKi3w0M=
X-Google-Smtp-Source: AGHT+IGyhGAXKCHWvcC1kwbInlxabqSm3i5VgbX/ExXqRSMUzWPJiJmRTKJO5jDiZovUNYBZirpzeQFnmj8O2hTcGYo=
X-Received: by 2002:a05:6870:9a9b:b0:1f0:15d8:3d55 with SMTP id
 hp27-20020a0568709a9b00b001f015d83d55mr20474009oab.45.1700170305853; Thu, 16
 Nov 2023 13:31:45 -0800 (PST)
MIME-Version: 1.0
References: <20231116165250.2863415-1-richard.purdie@linuxfoundation.org>
 <20231116165250.2863415-2-richard.purdie@linuxfoundation.org>
 <CAMKF1soCqH=+=QUeaF-ikMmwHCe0L0K8Cp_-X3tVqe6xTkQVFg@mail.gmail.com> <847e297330c0748c27926ceccde31f62f5ffed47.camel@linuxfoundation.org>
In-Reply-To: <847e297330c0748c27926ceccde31f62f5ffed47.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2023 13:31:20 -0800
Message-ID: <CAMKF1soN0=ckrXiLn5tOZpgtXf1gHevpW_RetaV9ebzvuemLKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] bitbake.conf: Drop oldincludedir
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 21:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190813

On Thu, Nov 16, 2023 at 1:29=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-11-16 at 13:25 -0800, Khem Raj wrote:
> > On Thu, Nov 16, 2023 at 8:53=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > Autoconf defines this as:
> > >
> > > "The directory for installing C header files for non-GCC compilers."
> > >
> > > Whilst this is something autoconf does allow changing, I find it hard
> > > to believe it has much use in the wild now and that headers don't get
> > > split like this in reality, it would probably only be useful on reall=
y
> > > old unixes.. The values are the same in our configuration anyway.
> > >
> > > Drop the value and just use includedir everywhere.
> >
> > Maybe alias it to includedir instead. Since some makefiles may assume
> > a default value in its absence
> > which might change the install behavior. It does not matter much on
> > native builds but for cross builds it might.
>
> I did for autoconf itself but I'm struggling to believe there are
> generic makefiles out there using this.
>
> We really need to cut down on the amount of environment exports we have
> so lets see if this does actually break anything...
>

yeah other build systemd like cmake, etc also define it, generally I
am in favor of
reducing variable export.

> Cheers,
>
> Richard

