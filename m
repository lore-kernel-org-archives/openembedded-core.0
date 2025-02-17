Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE961C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 23:05:45 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7176.1739833545087610487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 15:05:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AZchw19i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-439685e14f1so23094655e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 15:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739833543; x=1740438343; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fUYv64ouCd7n9U9PCYbFffLJl1tbo1nS9bs6et2bBJU=;
        b=AZchw19ilhG3KamSZRpGxxREwvX9XzfnrhkDWPuB3vPCK+lbWpNc0BrLiweEIqFDnX
         awWBPF77p7FpfCSsUo4zzgtBgltaf88rstSNB6j7X+OvjpnlNmyPTYmzj6IV6jCoOGvZ
         YPocVTSrpockFOgzuqyjKbwQMGp015Tlxm+N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739833543; x=1740438343;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fUYv64ouCd7n9U9PCYbFffLJl1tbo1nS9bs6et2bBJU=;
        b=JLJkamyWJx7mFLXCKmcZelfJXkPWqg6JrFQ/si5nKHL5RyLiXXdKCVhkia2/3i0P1+
         zpyXaoafZA7UcQ6YRd4X7twdyul9+theXlJI7jMMf6jpBvd7H7h3NwBkxt18OLBiDrKU
         BW4DArwTRl7O3966XpHUMnnzug3VzYjBI5TWXVBBhACGM8Ycd/SbWsmuw2cTeGjL0wR0
         YSGoe0v7KEUx/zkqoA20t8h8FHruOAmBOmlBL53OxNBZQsWx/liBLZdeG+GblyUp14Rb
         VmcEwJCDCR9F2z9gtprU2HmmuTOxnyb4Sq6iJFWjdrMAbyUSeGk9BkVFPzYw/9kyP5xw
         B+0A==
X-Gm-Message-State: AOJu0YyHLFJ1bczRcDzjg40ZL9/caEg107fSZK+ZvqgrzIktncKwLrIj
	6g4egMaI7lJYDbP8DDK+mpcH6+B5arsaiWnlNgtS9WngVC99Kob+61JMK4h1FX0=
X-Gm-Gg: ASbGncsBJMp8bk7eO/1A9lAYaoB2fgvmoEJxLQx1JBH5OzJ2Olxr26YyoxRGlIdYkIx
	90IPRtvQPY3Dq2lUvhG8NgYyshJHkeOotLKeHSlio22Q29hbmJQC9EiOdO/hCfOFGvE7p1Hn7WX
	PDUEpFTxOJPREk6/51TyaqifoCteaeeAUYY1yfzuq8d86dycXP3CyuI2ZaU5tHK+1Uhp6kif0QK
	ScJFLXfSq6Y7MSwwstoqcUpCpRXGrYzk75U6cJ9xUc7MLjNstYo39WUmdOGXKRaRrvifGEeZCy8
	ySP1WTIybcsIHExmSz+Vs3EG8ZKzEoTqj0IeSY0f4zuzDcNeQ6OXCoJd3MthFt6cAipq6vE8rrn
	wp7Vp
X-Google-Smtp-Source: AGHT+IFW5ld0N8nk+G5N7uvaobaGG3xtR3ws6xe8/UTxC5pXdgQtVEgtHbm5d+lNU7hnhtLihyPQTQ==
X-Received: by 2002:a05:600c:1f0f:b0:439:8653:20bb with SMTP id 5b1f17b1804b1-439865322ddmr44022325e9.14.1739833543418;
        Mon, 17 Feb 2025 15:05:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f127:df56:488b:353b? ([2001:8b0:aba:5f3c:f127:df56:488b:353b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8217sm13564030f8f.90.2025.02.17.15.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 15:05:41 -0800 (PST)
Message-ID: <a3c3edddb8916a3e9464511775bbbbc46834c5f1.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set
 zeroconf provider
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kiernan@gmail.com, Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2025 23:05:40 +0000
In-Reply-To: <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com>
References: <20250215165545.1929-1-alex.kiernan@gmail.com>
	 <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
	 <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 23:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211557

On Mon, 2025-02-17 at 11:16 +0000, Alex Kiernan via lists.openembedded.org =
wrote:
> On Mon, Feb 17, 2025 at 10:32=E2=80=AFAM Quentin Schulz
> <quentin.schulz@cherry.de> wrote:
> >=20
> > Hi Alex,
> >=20
> > On 2/15/25 5:55 PM, Alex Kiernan via lists.openembedded.org wrote:
> > > avahi, systemd-resolved and mDNSResponder (in meta-networking) can al=
l
> > > provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> > > which of these will provide service via packagegroup-base-zeroconf.
> > >=20
> >=20
> > If I'm not mistaken, this seems to be fitting RPROVIDES usage?
> >=20
>=20
> I guess I'm guilty of copying what was there (WIRELESS_DAEMON)
>=20
> > What if we had something like
> >=20
> > RPROVIDES:${PN}-resolved +=3D "zeroconf-daemon"
> >=20
> > in the systemd recipe
> >=20
> > RPROVIDES:${PN}-libnss-mdns +=3D "zeroconf-daemon"
> >=20
> > in the mdns recipe and
> >=20
>=20
> This would be:
>=20
> RPROVIDES:${PN} +=3D "zeroconf-daemon"
>=20
> > RPROVIDES:${PN}-daemon +=3D "zeroconf-daemon"
> >=20
> > in the avahi-libnss-mdns recipe?
> >=20
>=20
> And the base avahi recipe here
>=20
> > and then we simply RDEPENDS on zeroconf-daemon?
> >=20
> > Does that work (haven't tested myself)? What do you think?
> >=20
>=20
> And then selection via a PREFERRED_RPROVIDER:zeroconf-daemon =3D "..."
>=20
> I guess I think it should work, though my concern is the interaction
> between the daemon and the nss plugin, which is how I ended up down
> this rabbit hole in the first place!
>=20
> We seem to have very little usage of RPROVIDES (other than as a
> migration mechanism) and PREFERRED_RPROVIDER in general.

I'd strongly suggest avoiding PREFERRED_RPROVIDER. It doesn't work how
people think it does and I wish I'd held my ground and never added the
thing.=C2=A0It works where you have something that can be provided by
multiple things even if several of them end up present, it doesn't
matter as long as you have at least one.

The reason there aren't many references to PREFERRED_RPROVIDER is
because what I suspect you're trying to do is usually handled with
VIRTUAL-RUNTIME_* variables. These lock in to specific configuration
choices explicitly.

They are pretty horrible and I wish we had a better way but they are
the best we've been able to come up with. I've had ideas on better
solutions but never any time to implement anything.

Cheers,

Richard







