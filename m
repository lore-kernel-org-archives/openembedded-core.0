Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6017C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 14:56:01 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.47349.1674140158629310438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 06:55:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KYdiMd2J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id l8so1739706wms.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 06:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AKYY3GSDGV4z4YsGo9x3WyjIX86k2jjfYtIn3PEo/7w=;
        b=KYdiMd2JyBlVbguDOvavk2D1/1sEfdlDnlGozc9cAw9YyUcp3hpkhenEK/jmechoPD
         IXBe278vrD4ARoPtdfDIA86Qt4+sJWOMQQOugCJgSlCzLIOLKtI/DIGPvKb3iyxabAPI
         g0PNJdMJVLKLyPw3uuxr506pEePI2x1AzRPGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AKYY3GSDGV4z4YsGo9x3WyjIX86k2jjfYtIn3PEo/7w=;
        b=mDQ9BL0VjrzuMsv40CkcWYJThE8p/zWb5Z8ZKr+tbRjQ45aV1VfdVtFmSV282JA6YT
         MHPzVaZ8oLEVRLeQ/sb5DpVVChv+EMUr2iqkBbPAC6nPpDkJqW71fU2Mi5Z5IIWG/bgO
         hbSWjiS6M6dFgCEUB8hjY7hpS9z3NCm3Ouc+sswZ1Zs4T+g2YywpRuHIaMcnMJ+VcozG
         iOTpenGSOwsc4SM3RU8045VWWMuMpSmzsDhtc0EX8+Q/q92Z7K1F0MT5j0WL9lxJGpR3
         mQP9zF1Fs2migmgU/gvem5uDHl16MQbOrbHNWbKKhOsP9KTHshw6yKaq46ntCbR1LRrg
         2kCg==
X-Gm-Message-State: AFqh2ko1wi4si91WoIDjZVJWAwm5UhrJ64dve1vJlVFeeToTwXH+gOwQ
	dl41FH8u6jl6Irvy7wnVkZcHqw==
X-Google-Smtp-Source: AMrXdXs5GPSYE7Qja/xs5iBbCetIkH1XZTZof9x/F+We1mZ9KWpOsUDMyk7MAlghn+nzxAF4ie82RA==
X-Received: by 2002:a05:600c:4fcb:b0:3db:1919:41b5 with SMTP id o11-20020a05600c4fcb00b003db191941b5mr4850314wmq.21.1674140156614;
        Thu, 19 Jan 2023 06:55:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbd2:83db:332a:f7e3? ([2001:8b0:aba:5f3c:bbd2:83db:332a:f7e3])
        by smtp.gmail.com with ESMTPSA id f26-20020a7bc8da000000b003da105437besm5017392wml.29.2023.01.19.06.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 06:55:56 -0800 (PST)
Message-ID: <ee2655e7e0e626ac984a89e7a76f27f702e14d8d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Jan-Simon
 =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>, Anuj Mittal
 <anuj.mittal@intel.com>, Scott Murray <scott.murray@konsulko.com>, 
 openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2023 14:55:55 +0000
In-Reply-To: <CADkTA4OfjPHmc=p=btjf9vvkW2N-QGVJJpSAXLZOFmrikNetpg@mail.gmail.com>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
	 <20230119102423.3493565d@booty>
	 <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
	 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
	 <6597547835fc9c22bc2267362da8c1a84f2fce68.camel@linuxfoundation.org>
	 <CADkTA4OfjPHmc=p=btjf9vvkW2N-QGVJJpSAXLZOFmrikNetpg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 14:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176143

On Thu, 2023-01-19 at 09:52 -0500, Bruce Ashfield wrote:
> On Thu, Jan 19, 2023 at 9:40 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Thu, 2023-01-19 at 08:55 -0500, Bruce Ashfield wrote:
> > > On Thu, Jan 19, 2023 at 4:57 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > >=20
> > > > Hi Anuj/Bruce/Jan-Simon/Scott,
> > > >=20
> > > > Please see the links below. This patch, pending for master triggers=
 a
> > > > few warnings in a few layers as there are a handful of patches with=
 no
> > > > Upstream-Status present in them.
> > > >=20
> > > > I know this kind of thing is annoying but it is probably worth star=
ting
> > > > to give the wider community the hint that they should document this=
,
> > > > and if they do document it, it might remind them to try and submit =
them
> > > > too. You're not the target audience but as layers being tested on t=
he
> > > > autobuilder you get to lead by example! :)
> > > >=20
> > > > If anyone doesn't want to tweak things to fix this, we can disable =
the
> > > > warnings for that specific test but I would prefer not to, I think =
this
> > > > is the right thing to encourage. The numbers of issues are low and
> > > > easily avoided one way or another.
> > >=20
> > > I'd prefer the upstream-status check to be disabled for meta-virtuali=
zation.
> > >=20
> > > This isn't something that I'm strictly enforcing, and not something t=
hat I
> > > want to start strictly enforcing.
> >=20
> > I understand and will see what I can do to change the configurations, I
> > was hoping to avoid that.
> >=20
> > Just as a heads up, there is an open action for the TSC to discuss
> > which QA checks shouldn't be bypassed for compatible layer status.
>=20
> Understood.
>=20
> I'll strongly argue that if a layer wants to carry some technical debt
> due to the nature of the upstream communities they work within and the
> debt is within the layer .. that is something they should be able to
> choose.

To be clear, you can put Upstream-Status: Pending or Inappropriate and
move on, it doesn't mean they have to be submitted upstream, just that
the status is recorded.

Cheers,

Richard



