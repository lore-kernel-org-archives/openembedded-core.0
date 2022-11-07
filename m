Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A63C4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 00:51:17 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.5157.1667782275140385702
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 16:51:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hz4NEQJI;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id f4-20020a056830264400b0066c8e56828aso4020900otu.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 16:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CCTl6deyDbZ0+0KucYFQV7CGlvxUN7addhCZGqw6qdI=;
        b=Hz4NEQJI4OgcBTk0y/IJ02hHjcsEivQSf37L0DgfRqg6hAPw90FfD1d9w0fH0RhGSU
         Ra5luA4xheo6nwzggl6SBmKP0RJT0r+qxt5C/N1mwvhqX1r+zl3ZdkKGL5R0MqtkH7dV
         /vHHQ7aaeatgon3lIWheodbrvm+DAgGKHyb7XL2EVrd4dkGuSVXTr8N7/cSXYmdCrfgC
         CMnmwIjMrK2n6v/RP0GZeTUB3EaFqb9Y/8qzgonWA5MJAhZjgyw3ROtKANR/b4+Qc6Vq
         /H/AGpzJ1ZqU7L/yNgpBTXwtK818Jwbeea3D41URkD9QmODZCS2SHTFNNWyosFt9U0QI
         Ja7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCTl6deyDbZ0+0KucYFQV7CGlvxUN7addhCZGqw6qdI=;
        b=fiAg353qsvn8Dv6g4oLQqyCmvj6EkXWxxX4Rt9Qf4upXatOgAbpi9rwWPCUxmQQ0A+
         Cr49b2Dvs2PssSBIsqAVRqrYxKpyyXI4Zdfnh8DcPjevFCaHLXFiN+4XVs2pStUbhGhn
         4zL9c8LD6pfcbJTHiiiy1R2HoWNuGeNEXiPG1+o8iLM2IE8K8vuEKSJ1bla/TR8iB97T
         3SIhAk8Qe56iPO4ogrg7ZpfmO4P5RhkR0L7zb1YeBOEWejR2xI7X9M79WnL85dvwAI7k
         fWqTPHgvD2tv020zc6WgfQcfqwC5MwXHh1F4BSnZuNFkxJge36v/pDG4y3m7NsBqtd9N
         Cuhw==
X-Gm-Message-State: ACrzQf1ck1p8rujp3mzphjWAqPTkGh3ZcRSx/w5F6Dx8hIzLwXxPnUAV
	TroSS3xvsY6GINk+rYR7e81okggQsvYNqRtHDU4=
X-Google-Smtp-Source: AMsMyM5NqfTTn+aG2XCEi4MVMr6gLdGxYQzb8RFfYqGDN+zbKeAs5pETZNrepHSEa/9/HWJCgN9X0rwqZHrmaZvZaQo=
X-Received: by 2002:a9d:65c9:0:b0:66c:5124:909a with SMTP id
 z9-20020a9d65c9000000b0066c5124909amr19845168oth.111.1667782274111; Sun, 06
 Nov 2022 16:51:14 -0800 (PST)
MIME-Version: 1.0
References: <4af9fc74-3b02-57ca-7aa1-d02a90f0f621@windriver.com>
 <CAOSpxdYo-5pvq632UZoxSyD5+sHQJcZYfwA0L3w1FauFm_fXHA@mail.gmail.com> <acc9833f-0f2e-0a56-5b1a-a5ceff309e24@balister.org>
In-Reply-To: <acc9833f-0f2e-0a56-5b1a-a5ceff309e24@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Nov 2022 16:50:48 -0800
Message-ID: <CAMKF1srDvWxhKaJLBQt650j5ezxLbQ70oE0rSMVQO3mYNg1pPQ@mail.gmail.com>
Subject: Re: [OE-core] Dunfell toolchain update analysis
To: Philip Balister <philip@balister.org>
Cc: Steve Sakoman <steve@sakoman.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	"Moodalappa, Shivaprasad" <Shivaprasad.Moodalappa@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 00:51:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172818

On Sun, Nov 6, 2022 at 4:20 PM Philip Balister <philip@balister.org> wrote:
>
> On 11/2/22 09:00, Steve Sakoman wrote:
> > On Wed, Nov 2, 2022 at 2:24 AM Randy MacLeod
> > <randy.macleod@windriver.com> wrote:
> >>
> >> Thanks for the info I requested Sundeep.
> >>
> >>
> >> Steve or anyone using dunfell,
> >>
> >> Do you have any concerns with the updates shown below?
> >
> > The glibc and binutils updates seem fine.  The gcc update(s) concern
> > me a little bit, but we can test and see if any issues arise.
>
> The release notes for gcc might concern me if I was trying for super
> stable .... But, we created some gcc-9.5 recipes and found they fixed a
> segfault in the fftw QA which offset any concern we had. I'd love to see
> gcc updated in Dunfel, but if it isn't I plan to create a layer that
> will overlay the newer gcc in Dunfell to resolve the fftw issue (with 32
> arm+neon)

9.5 is a bug fix release in gcc-9 series so it should qualify for
stable update for dunfell.

>
> Philip
>
> >
> > Steve
> >
> >> Hello Randy,
> >>
> >> I checked the Dunfell branch for gcc, glibc & binutils updates.
> >>
> >> gcc-9.3 is currently used in Dunfell and gcc-9.5 was released by gcc.
> >> glibc-2.31 is used by Dunfell and latest commits in this branch are listed in attached file 'glibc.log'
> >> binutils-2.34 is used by Dunfell and latest commits in this branch are listed in attached file 'binutils-gdb.log'
> >>
> >> Can I update all these 3 modules as mentioned above?
> >>
> >>
> >> Thanks,
> >> Sundeep K.
> >>
> >>
> >>
> >>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172817): https://lists.openembedded.org/g/openembedded-core/message/172817
> Mute This Topic: https://lists.openembedded.org/mt/94732697/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

