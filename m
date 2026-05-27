Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574DFCD5BDE
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 00:31:21 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9992.1779841877964141539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2026 17:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems.com.br header.s=os header.b=pg/sQT1u;
 spf=pass (domain: ossystems.com.br, ip: 209.85.215.171, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso8320327a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 17:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems.com.br; s=os; t=1779841877; x=1780446677; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPmXjy7Q5m+ef0ieKogCibS+Qiuy8eOAUKtw6YzDZUc=;
        b=pg/sQT1uklo67bRxOXvHkQDBsymGkf0uVBeSazYCFfWWXHsOfmAtQP2H76vdeGmnSm
         vVBOzeerfY5BtgC6IxGN35wVto87gm1bnx2zVFGXC/nNjfksV1GD1ElfUDFXMLYcqsYB
         MlxGjwYdiFJkLRHq59VqM3O3ULOjZ/ki19Ud2gVd7RnCDe1z9efQMbu24Pjq4oI4FPkl
         LbJRKUwUrrb7dic9miqfGimA9iiUcHGgqYh61/O4nwXXXW+INzEl6IBPWKm3jHL6DgsE
         +STFdNcPKG5iTrElpM0Aip/u+IK2jC0WbahQXC6ahopdhuVlmXZQ2q4g7uQ/DYWLtuNi
         i5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779841877; x=1780446677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BPmXjy7Q5m+ef0ieKogCibS+Qiuy8eOAUKtw6YzDZUc=;
        b=HwzbHQCw2r9ePA6rZulBIKQCD7J9s0HPxmY3Ekpvf2LxS1nFmLZkTKxwfawfwdJgNs
         pjRPtmk9p76SfqXC77FXvruiRuA+SWK9tEfsBKegOWNJ3tJ3Guc9HxHSwhjvKnRsr/m5
         3vrbrVZHxr8Uis6SU/Hki7P5QLnzax0YseaS39vDJSO9E6oZdcV9es+cSrl9nHErj5LA
         OWkf1iS/xkJ4cLZ/2qSwpYcJa+2mSJQTb615P6NHBUeoXrsrapkXJ74+rRjY05j5HaeI
         tiSSMKU9CTGmKxclgh38vauUzNfxUntHpp4leyB04TwplAU6+dBWVO0jXf/83V6rOgON
         wx5A==
X-Gm-Message-State: AOJu0YwdB7FmlOw9eVrNNgPeYeBAonHVmwvbG1kquKbMZMEN3znkfdVz
	WUJEiTztePKTLtAVRE2zwgIpsQ8Z93yr13qfuLAfWwfz3AtAOBgMeU8qSeGqHPJbJbIKI4LsoLB
	p4p5YaBs=
X-Gm-Gg: Acq92OHIsaB9YJCX8YN4LXqt8k1zYTZv8V2VvuoxYKhnsW82RzElGsjsOnKcLDmn8ao
	HGM6xNm1cDijtjCuwprAQ8r3oLBjZdlOlWr4+KQfcrZUVvSm2YbdIawkI4TgwLl+5kWHWn8Plkh
	emg4OXCCAL/pvc9CjbLIhw3J3ypl+hOKJHVjEhbCogeigch8yynSMGIwb5ZH5plO5hpWcYsxWLv
	i1le29SrKjNgfsY3IuOexFz4ZVw4nT/f3yFX+NwgqwL/U7kvUNsxMVL5RbGyUirQhHVMsUj3bTS
	Dk6AGACPBGe3ABizWMk3+zlDqZ5KgU9KscsRcV4aoPhGs8AEU0RdtMbhe/Ad7ouGbmN2v3vDqBb
	EmP1lJhG9DQuVLlfIG1/tJV6Xp720QgEgBYnyoUcDM8X1KOiBrIrSDDOzF32wZRmBXF+ymtyI3p
	6lHBY7DKsV6JyOZvLQbw5E/XIrX0bH1OSkJjm/EIepYh3f0+XhtYhwAUIvBJSochTWcZi95FLjn
	yUctbYY7XSdpTmdD4NCBSxAwhkYQg==
X-Received: by 2002:a05:6a20:ce44:b0:3ab:18cd:7da3 with SMTP id adf61e73a8af0-3b328c4cc21mr21498841637.1.1779841877199;
        Tue, 26 May 2026 17:31:17 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202902b1sm11131255a12.6.2026.05.26.17.31.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 17:31:16 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c795f441ff7so8457897a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 May 2026 17:31:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:a121:b0:3a2:f14a:4275 with SMTP id
 adf61e73a8af0-3b328c4ef7amr21055291637.6.1779841876102; Tue, 26 May 2026
 17:31:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKq0E4gjR2R6TXK38v-a3wQa5Yi892BVOB=3YoU+ibM23A@mail.gmail.com>
 <da740047848f706c420629378838229833bc9fe4.camel@linuxfoundation.org>
 <CAP9ODKp1eh1Rj+q5s7Mr+vTZQBny9-Zwxty0qJkJ0gyaYvYX_w@mail.gmail.com> <955fabd11056b0527cbf0ec96988cd98674ed1f1.camel@linuxfoundation.org>
In-Reply-To: <955fabd11056b0527cbf0ec96988cd98674ed1f1.camel@linuxfoundation.org>
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 26 May 2026 21:31:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoV=qiyk-V2PssEmDTb++pV4J+sQa3=QEfTcCw+5w+EEg@mail.gmail.com>
X-Gm-Features: AVHnY4IgEylf1mpHJlZzKsP49-l6L9qpmFyBH28USfdZF-coKfGiUzx4iSYRtV8
Message-ID: <CAP9ODKoV=qiyk-V2PssEmDTb++pV4J+sQa3=QEfTcCw+5w+EEg@mail.gmail.com>
Subject: Re: [OE-core] Re-visiting: bitbake-setup on PyPI as the recommended
 install path
To: richard.purdie@linuxfoundation.org
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Daiane Angolini <angolini@gmail.com>, Rob Woolley <rob.woolley@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 00:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237626

Hi Richard,

Em ter., 26 de mai. de 2026 =C3=A0s 10:53, Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> escreveu:
>
> Hi Otavio,
>
> On Tue, 2026-05-19 at 20:11 -0300, Otavio Salvador wrote:
> > The reason I'm pushing a bit on timing: we're working on the fourth
> > edition of our BitBake/Yocto book and are wrapping up the initial
> > chapters to send to the technical reviewers. As mentioned before,
> > we'd like to use bitbake-setup as the default installation path we
> > recommend to readers. We're trying to cover the BitBake setup story
> > as thoroughly as we can, and we genuinely believe pip is the more
> > user-friendly option for newcomers =E2=80=94 the git clone prerequisite=
 is a
> > real friction point before they've even built anything.
> >
> > Would it be fair to assume a non-alpha release on PyPI is realistic
> > in the coming weeks? Even a rough sense would help us. If it's
> > likely, we'll go ahead and structure the install chapter around `pip
> > install bitbake-setup`. If the timeline is more open-ended, we'd
> > rather know now so we can lead with the git clone path and keep the
> > pip method as a forward-looking note.
> >
> > And the offer to help stands =E2=80=94 happy to test Rob's patches, rev=
iew
> > packaging, contribute documentation, or whatever else would actually
> > move things along.
>
> We talked a bit about it on the weekly call. I think PyPi is the
> direction we will go, I'm just really hesitant to give out commitments
> on timing. I do expect changes in the coming weeks and hope that we'll
> be able to pull things together in that kind of time frame. We just
> don't have a plan about how to handle the versioning that I'm happy
> with yet and that makes it hard to commit.

Thanks for your honesty =E2=80=94 knowing the general direction, even witho=
ut
a specific date, is genuinely helpful.

We've chosen to introduce the install section with `pip install
bitbake-setup` as the primary method, highlighting the git clone
option as a documented alternative just below. We're aligned with your
suggested approach and remain optimistic about the timeline =E2=80=94 we
expect the non-alpha release to arrive sooner rather than later,
fitting well within the book's production schedule. We prefer to guide
readers toward what we see as the more beginner-friendly option first,
with git clone kept as a well-supported backup just beneath.

We still welcome the offer to assist=E2=80=94whether it's testing Rob's
patches, reviewing packaging, documentation, or other tasks to advance
the versioning process. The quicker this is resolved, the more
confident we are in our decision.

Thanks again,


--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854

