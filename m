Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052D5C5AE59
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 23:23:36 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.3845.1748993010315361372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 16:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFyUvVby;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553246e975fso7415698e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 16:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748993008; x=1749597808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UTkfDCPgDLs1qsCE13tt4f/6YCRn70T4CAmapOfAj0U=;
        b=dFyUvVbyM4ZdGn88SpXABeJp/hOYLW3+BkMv1FOsC8pzUbdwwsvmgYB1r+pxWbCaw6
         SYKO6Z9moE9R/Jc0GBZKfYJPNFYq182MBiH9BAodOd0qH3Vdu/aFIXjoY/XUHd5a7YkA
         28YUZn2qvFQRjOidB9KPvDIfdT0kizZwfrXfGe2FvYxUPFu1euUD3ayeeT/8I3ZXQTJt
         NqHImgJ03tIfyKzG6AWe/7FlH/gTTznJ9dlDcCsre6rOgpAqWNw9VqqP+1DSuh6GWNDA
         4aoMEx4HlD3yhSPVs8mp2td3vcFgay9D2W64KBc2lOCyT/eOM4PI2voEPkIHyrcS3szo
         ijXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748993008; x=1749597808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UTkfDCPgDLs1qsCE13tt4f/6YCRn70T4CAmapOfAj0U=;
        b=WHDXf24sL+rgRXr/sgPqpIbDV/x0EpFNeMd43W6UJ0Q5WOwa+/D8Wn39OtcSYE6pSG
         o4IGp+5t80Vl6UmCf3maWduF+vj3/5B/4QP+v3G9YgF1xf2ai4fYHOpY5fX44ULaOQoU
         BDah1/axg64xpEZa32xNwJ6zPE2ngGY2ZsQ/7VVQRdorHqanwv4mo3HHtqULU0Y4EvYJ
         IY4scrB6XMJalnhZs0hCzKDzr2fNpepF6F0wOfgRYkjN3maGiTpWO0npc8ZjWEripuNq
         uCR0+GByMWM9UFoNPaI8ivN7XL31JWk/ntpEt5i82jHSLtmEFgwDO/DI6104pTz3hdUu
         zYlg==
X-Forwarded-Encrypted: i=1; AJvYcCWnonFDvwnXoED+0MO9ad5z4pidJ0VReDxJI4shjJZnqNk3YDgABLgt8jZ132NDBH+v0GBuYwZDNuXomcqssqjAWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YynReIgYSDeOwdH5ymBN0T9wslsLKlpcHYWsnAxevEue/T9nwiZ
	7YhpELLrOFfCUQmNEixq3NL3w0LdEW9CS+7Yso5Wx6MHU5Ti+X4i85HpsJTqHr9fywBHF4ppTmi
	7qkUWJXn6Rg3thOOdE3Wv1BM1tauZ6dc=
X-Gm-Gg: ASbGncvW3cuPrstp7gmlicKC49yYuwVTLeWxI4F7zZ7w/JbMoVxVXOqe2zAqPF2iOq6
	Twn7aKgSSLCsV2RpmiLJjKeoUBowLWX9Uv3+xQ7e4vqCybIqEbK6XVh2uVuHmL9iTW45GLuorww
	9TJ9+a9aGaifTAIUbVkXcBcxIueaQHMjZ+DMCBikBM61EwX1I=
X-Google-Smtp-Source: AGHT+IHR/NDboihnYHCaF03XKEVTbtbGno8/3UCO3C8Pfi/Jj7pUUU2mZJaP5l9V7zu6BfJs8cKWF1+XLumZYzhE/qk=
X-Received: by 2002:a2e:b8c2:0:b0:32a:7e4c:e925 with SMTP id
 38308e7fff4ca-32ac71d0b1emr1989111fa.21.1748993007830; Tue, 03 Jun 2025
 16:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
 <18457EF875184E76.9693@lists.openembedded.org> <64931a5016ab1996877df1d6764faf9e87dc51e6.camel@linuxfoundation.org>
 <CACMGZgYc-31tzF8UuLLhMiuJ5kKA1_UN2t9JXzPG7DyoNJo-bA@mail.gmail.com>
 <ME3P282MB2531A632687099F4A94BDA7F946DA@ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM>
 <0e3407764e7a3f7951465b3c62cdead8baabe3b4.camel@linuxfoundation.org>
In-Reply-To: <0e3407764e7a3f7951465b3c62cdead8baabe3b4.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 3 Jun 2025 17:23:15 -0600
X-Gm-Features: AX0GCFu1oWADN0BOnjCtyeM53AQQINBpcew170wI7JC4jkO6AnZolexebW572Lo
Message-ID: <CAJdd5GYmr5OF8XahD9SzuBTS+8omwur-tf6nVz6Jf=pCS69iAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] icecc: calculate pn and bpn from FILE
To: richard.purdie@linuxfoundation.org
Cc: Douglas Royds <douglas.royds@taitcommunications.com>, 
	"peter.suti@streamunlimited.com" <peter.suti@streamunlimited.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 23:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217829

On Tue, Jun 3, 2025 at 4:15=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Tue, 2025-06-03 at 21:55 +0000, Douglas Royds wrote:
> > From:  Peter Suti via lists.openembedded.org
> > <peter.suti=3Dstreamunlimited.com@lists.openembedded.org>
> > > On Tue, Jun 3, 2025 at 11:59=E2=80=AFAM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >
> > > > On Tue, 2025-06-03 at 10:40 +0100, Richard Purdie via
> > > > lists.openembedded.org wrote:
> > > > > Unfortunately PN could be set differently to that, or set
> > > > > through class
> > > > > extensions so I don't think this is a good way to fix the
> > > > > issue. It
> > > > > does highlight that icecc probably just worked through luck
> > > > > anyway. It
> > > > > would get it approximately right most of the time but I'm not
> > > > > sure we
> > > > > want to rely on that.
> > >
> > > Maybe that is why we have to disable a bunch of recipes with
> > > ICECC_RECIPE_DISABLE.
> > >
> > > > > To be honest, I'm more tempted to simply remove icecc since it
> > > > > would
> > > > > seem not a lot of people are using it if it takes this long for
> > > > > fixes
> > > > > to get sent :/.
> > >
> > > I understand. We will keep using it internally with the above patch
> > > because it works for our use cases and
> > > provides noticeable speedups still.
> > >
> > > > Just to clarify, this would then let someone maintain this in a
> > > > separate layer as it is self contained. I appreciate we'd need to
> > > > find
> > > > that maintainer someone needs to fill that role to keep this
> > > > working...
> >
> > I suspect the reason no one has fixed this might be that no one else
> > has hit it yet =E2=80=94 we haven't. Fortunately in the meantime, Peter=
 has
> > found a work-around that works for him.
>
> Which branches are you using this with?
>
> > I'd argue that icecc is well supported in oe-core. These are the top
> > 6 contributors to icecc.bbclass, making 97 commits over 10 years,
> > almost 10 per year:
> >
> >    21 Joshua Watt
> >    18 Richard Purdie
> >    14 Martin Jansa
> >    11 Douglas Royds
> >    9 Tobias Henkel
> >    6 Dmitry Eremin-Solenikov
> >
> > I'm sure one of these contributors will bump into this same problem
> > at some point, and that they'll fix it then. Please don't drop it
> > from oe-core.
>
> I can safely say I simply don't use it and never have, which hints at
> the kinds of commits I'm responsible for. Joshua used to but doesn't
> now and hasn't for a few years. As far as I know, Martin doesn't any
> more either. I'm therefore not sure this data makes a good case for it
> being well supported.
>
> At this point I think it belongs in its own layer. I appreciate people
> don't want to hear that and yes, that means someone will have to
> actually step up maintain it rather than relying on me and others
> somehow keeping it working mostly by luck.

I agree. icecc can be quite useful, but it is one of those things that
is basically impossible to test unless you are actively using it (e.g.
it can't be easily tested on the autobuilder). I don't use it anymore,
and I don't even have a setup to test it on, so I can't really provide
much help on keeping it functional.

>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217828): https://lists.openembedded.org/g/openembedde=
d-core/message/217828
> Mute This Topic: https://lists.openembedded.org/mt/113444145/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

