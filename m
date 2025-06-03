Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC60C5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 22:15:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2460.1748988922440843827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 15:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DnWLBTjf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450ce671a08so39564555e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 15:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748988921; x=1749593721; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Urj7yCG2L2H9fcK5LDj5V0saH5qY4W968QhJgnb3qas=;
        b=DnWLBTjf3AU0meL5qkR4KKBwBsgjH5fGFdWPO8H2d6G9s9IOP8eZBqhJQzDXbGNxqJ
         rm5aJYSMks1LG3ncBEx2XbxRmOeRwFQ4VDFT4Y5p1t9Or+pyzMtWbQlrwAUrrYyp1TFm
         v02O+tjsReErTreZEx/XyWEQPFJyYqCop7pnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988921; x=1749593721;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Urj7yCG2L2H9fcK5LDj5V0saH5qY4W968QhJgnb3qas=;
        b=Fl4/F/NQdV8GBMjbXGUzvnxiM1jJH3Oj4csiMsWOk6xw0eoCWKnMoHHH55gOcSHqW2
         1usv5kftXmFbwCsC4h8R+j7WxAGzviqsptdXtEmcgmw0s4/W3EzXfam/0mOZGVKUsgd/
         Aeq8msN+DlMRagATTRDHEq+okZox0K4P4T0X6h9NirGoXvM85EmmriIlKWRh5S2poa4a
         TchNzth5dbu31IHyV3IZUVXsHmfe/FMinIkyGBkRFtj6y59QIOmETK8V+uYldEtJfKwy
         3nSB/4nsRw+poUrXLZc7JSf0nEopH0aXNu+r6BPSu/EaQn7weuWcPLh77YTZDxCwgV11
         5y7Q==
X-Gm-Message-State: AOJu0YyfhPVGhPL3bDERDTDRN+A5B90QztdRb85HX5s4QUkzM5LV+1S5
	pxWH5FaWqwuTlsmtPuaA9mvSazFf9ZANvsEUVz0wY1hIjkGW7CA/br7sVmBHYvI2Aq8=
X-Gm-Gg: ASbGncsoj04FX4Fjb2okm5hd9th2U5cLFljNNgQtySedE2Xn3eBAtf3ieWHuANZoLRY
	HiOyL0nlh8i1RBjppRy+bBg0n9GHyZCuZykZ4vV9FbvEHCcGchs+g2LTrPrSkLBdxhIkXnbf5hb
	4kbneLuzJm3gi+E4wE5p8ZCy53hdK4USDiCmtGekvLYpomKjsEkhHRncuVBTTW+j32PgZpVh41/
	jl47KhfRS3ONc54widtM1XKRNGiiFT3+A6XbUBslGoICF5TSdcG6Izmkxc4PMeY+xGo9lhqfA+V
	svzZthvLwMAVbcuarly3GNk1zAQIttq+gTo2ikfjG1EE2viDpR2K616JeU9/eroOpvsJIJDscDJ
	THbpCbr0MrG2TotMYZVtxHLQmKJnVgwkUSxQlqg==
X-Google-Smtp-Source: AGHT+IFduduBnbMh2muTOz55YjUTHAbnO7tNC/oWmGlorP4EOFQhvPI5voBoMiF07zq/6IXe5XpF0w==
X-Received: by 2002:a05:600c:4e4b:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-451f0b3a20dmr2379585e9.33.1748988920799;
        Tue, 03 Jun 2025 15:15:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f4ac:889f:f8f:cc4e? ([2001:8b0:aba:5f3c:f4ac:889f:f8f:cc4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b871sm19845898f8f.13.2025.06.03.15.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 15:15:20 -0700 (PDT)
Message-ID: <0e3407764e7a3f7951465b3c62cdead8baabe3b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] icecc: calculate pn and bpn from FILE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Douglas Royds <douglas.royds@taitcommunications.com>, 
 "peter.suti@streamunlimited.com"
	 <peter.suti@streamunlimited.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 03 Jun 2025 23:15:17 +0100
In-Reply-To: <ME3P282MB2531A632687099F4A94BDA7F946DA@ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM>
References: <20250603085808.4045687-1-peter.suti@streamunlimited.com>
	 <18457EF875184E76.9693@lists.openembedded.org>
	 <64931a5016ab1996877df1d6764faf9e87dc51e6.camel@linuxfoundation.org>
	 <CACMGZgYc-31tzF8UuLLhMiuJ5kKA1_UN2t9JXzPG7DyoNJo-bA@mail.gmail.com>
	 <ME3P282MB2531A632687099F4A94BDA7F946DA@ME3P282MB2531.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 22:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217828

On Tue, 2025-06-03 at 21:55 +0000, Douglas Royds wrote:
> From:=C2=A0 Peter Suti via lists.openembedded.org
> <peter.suti=3Dstreamunlimited.com@lists.openembedded.org>
> > On Tue, Jun 3, 2025 at 11:59=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >=20
> > > On Tue, 2025-06-03 at 10:40 +0100, Richard Purdie via
> > > lists.openembedded.org wrote:
> > > > Unfortunately PN could be set differently to that, or set
> > > > through class
> > > > extensions so I don't think this is a good way to fix the
> > > > issue. It
> > > > does highlight that icecc probably just worked through luck
> > > > anyway. It
> > > > would get it approximately right most of the time but I'm not
> > > > sure we
> > > > want to rely on that.
> >=20
> > Maybe that is why we have to disable a bunch of recipes with
> > ICECC_RECIPE_DISABLE.
> >=20
> > > > To be honest, I'm more tempted to simply remove icecc since it
> > > > would
> > > > seem not a lot of people are using it if it takes this long for
> > > > fixes
> > > > to get sent :/.
> >=20
> > I understand. We will keep using it internally with the above patch
> > because it works for our use cases and
> > provides noticeable speedups still.
> >=20
> > > Just to clarify, this would then let someone maintain this in a
> > > separate layer as it is self contained. I appreciate we'd need to
> > > find
> > > that maintainer someone needs to fill that role to keep this
> > > working...
>=20
> I suspect the reason no one has fixed this might be that no one else
> has hit it yet =E2=80=94 we haven't. Fortunately in the meantime, Peter h=
as
> found a work-around that works for him.

Which branches are you using this with?

> I'd argue that icecc is well supported in oe-core. These are the top
> 6 contributors to icecc.bbclass, making 97 commits over 10 years,
> almost 10 per year:
>=20
> =C2=A0=C2=A0 21 Joshua Watt
> =C2=A0=C2=A0 18 Richard Purdie
> =C2=A0=C2=A0 14 Martin Jansa
> =C2=A0=C2=A0 11 Douglas Royds
> =C2=A0=C2=A0 9 Tobias Henkel
> =C2=A0=C2=A0 6 Dmitry Eremin-Solenikov
>=20
> I'm sure one of these contributors will bump into this same problem
> at some point, and that they'll fix it then. Please don't drop it
> from oe-core.

I can safely say I simply don't use it and never have, which hints at
the kinds of commits I'm responsible for. Joshua used to but doesn't
now and hasn't for a few years. As far as I know, Martin doesn't any
more either. I'm therefore not sure this data makes a good case for it
being well supported.

At this point I think it belongs in its own layer. I appreciate people
don't want to hear that and yes, that means someone will have to
actually step up maintain it rather than relying on me and others
somehow keeping it working mostly by luck.

Cheers,

Richard

