Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A1AC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 19:54:48 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web11.3232.1677095681739647215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 11:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E8x1uvX1;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id r4so1162834ila.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NdXY3AXOHG320/PRcYORuGebuHnWm3FY8UqgJHHsod4=;
        b=E8x1uvX1LjR4uEKaa8/IFYqKX9BvbtdtRK4P1z7bsCaDjxnpq6dyps7+7sNXWHX5iv
         q/EUCeemvCJmVTE3n5NIJBo1NH1CXZozwTS3t+A/ujmpqmIUkWsA1gRAdvtue7UFiEQ6
         qSTOQt+PhV2BIPax2sVtvTjAEX4r9TauDhgrpg5eJ/UETHXFFTSnxNJg2GB8L2isz66D
         4SPBLSx6TVzVwRbK0+LwiLZJEyrj2aIF+QLRAtZ+4cuw5syGD6mFJI3sITr3IBNdK2pR
         JlIj6ynwF3dhn4epr/l1eZHjny6X3rcxj2VBGWTEhLxgqugjBnG/DkN1SliHLdI+a2XH
         uQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdXY3AXOHG320/PRcYORuGebuHnWm3FY8UqgJHHsod4=;
        b=StnxhoD/i+Afag7+Y1VfU78ofM+1P1fvUi49vEQRhx8sdJ6RkHM5sQK4ith5dG5aP+
         mDuFzLlTD7DARBkkeXPwsNN0M2d56mgDt4Fsy/fybmuVK6ZLUQ+aFbQou+uaeXyTqToe
         ywzrex+bLXfo+KUDrqe18vdxa4ob4rzZ65DDF0bl1XUxn/YDqHFSLMhPA4npr0171FP8
         qZKNax41e7Vr5tiZ8q3QpuX5JW3PbKQfGAqVheMUBHkORnHnSNICG2rLenANyIRp9jUf
         mT6D47dg5fhZC+OWZk55hj6g5Iv6dVmhwTb3PH7bI2UKC+szRizNOGNpF/f9BeVzvboW
         xOcQ==
X-Gm-Message-State: AO0yUKUHm8KbOg5kQbwzTlb8Tk8UrK+2LSgNRXF5DlGey2eJaS59T9u/
	oaIlBBjcz5exF0aVSkiw6h0eurCIOt4PtXTmEmI=
X-Google-Smtp-Source: AK7set8mCTkZ4jC1ilY69vRgYRmz/WwpCUymWROzVvf6G/puZ+DQINPxtdxOxEDuCRfQu/hlwber7j2cdxkLzptL1tU=
X-Received: by 2002:a05:6e02:1148:b0:313:8b38:bf14 with SMTP id
 o8-20020a056e02114800b003138b38bf14mr2352573ill.4.1677095680994; Wed, 22 Feb
 2023 11:54:40 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5Qe4+kJANi+HuDrNK=9okEj9XgaFYzhhuixpVqdtZft1w@mail.gmail.com>
 <Y/ZurxXQueWv15l9@mail.local>
In-Reply-To: <Y/ZurxXQueWv15l9@mail.local>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 22 Feb 2023 19:54:30 +0000
Message-ID: <CAO5Uq5Sjoihd=KPgh8wSFZ_KKipUXiVeOikJtdX8-zxVpMoqng@mail.gmail.com>
Subject: Re: [OE-core] sstate cache management
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 19:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177583

On Wed, Feb 22, 2023 at 7:36 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> This doesn't answer your question but did you look into
> https://lore.kernel.org/all/20221121111102.5556-1-tomasz.dziendzielski@gmail.com/?
>

Thanks, yeah, I did... it really didn't scratch the particular itch I
had, mostly because I want to stuff other things in there. It feels a
bit like I'm rejecting it based on "not invented here", likely I just
need to get to a place where I can post what I have!

> On 22/02/2023 17:56:35+0000, Alex Kiernan wrote:
> > I needed to do something about our shared sstate store and waded into
> > the sstate cache management problem as the existing script takes hours
> > to run over NFS (which for better or worse is where ours is). I've set
> > myself the problem of replacing the existing script with something
> > more extensible, understandable and performant.
> >
> > I've got something which I believed was roughly right, but I'm ending
> > up with questions I can't answer when comparing the two outputs...
> >
> > If I run the existing shell script against a tiny sstate-cache (on my
> > laptop) I get 420 duplicate files eligible for removal, if I run my
> > script I get 491, looking into the delta, I pick out things like
> > these:
> >
> > $ find sstate-cache/ -name
> > sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:*_populate_sysroot.tar.zst*
> > -ls
> >     49067     16 -rw-r--r--   1 alexk    alexk       14435 Feb 18
> > 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst
> >     49129     16 -rw-r--r--   1 alexk    alexk       15205 Feb 18
> > 15:29 sstate-cache/25/59/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:2559429e2a553085bc657f3d2a21a111818061448e5fa2aa16398afb5dad8b90_populate_sysroot.tar.zst.siginfo
> >   2490392     16 -rw-r--r--   1 alexk    alexk       15204 Feb 20
> > 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst.siginfo
> >    339439     16 -rw-r--r--   1 alexk    alexk       14423 Feb 20
> > 13:24 sstate-cache/bf/08/sstate:libcap-ng:core2-64-poky-linux:0.8.3:r0:core2-64:10:bf08f26e6bc5ab56ed128441fb05edeef41aa881330d04eea127a93ede51713d_populate_sysroot.tar.zst
> >
> > Which look to me like I should be able to delete the older ones, or am
> > I missing something? Trying to follow what the existing script is
> > supposed to do is challenging!
> >
> > --
> > Alex Kiernan
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#177579): https://lists.openembedded.org/g/openembedded-core/message/177579
> > Mute This Topic: https://lists.openembedded.org/mt/97165650/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com



-- 
Alex Kiernan

