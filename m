Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E60C36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 10:52:42 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.5496.1744195955116395025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 03:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=blKsUc8d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3913958ebf2so5842451f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 03:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744195953; x=1744800753; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5ZUc4JvntV0X6UTwGVo7rKzykozCXtYsMSqKrrHKR7I=;
        b=blKsUc8dptxNalhFNk1aoW6rK0qQjNP+B4dHmwr2Hcch/f73fuzQ2FjWJHKgDB3BVw
         dQOnEeAtEyDAwSlx1lMi1JsTQy9gRAZphM69bA0q0twED9SxplTRdJ6v0w6U+I+bitPm
         0GmneLkHfAQ1jeMpgEMlsUreVHYUOohQEo4V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195953; x=1744800753;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ZUc4JvntV0X6UTwGVo7rKzykozCXtYsMSqKrrHKR7I=;
        b=KFxZ04VFKVnaPWtb0tkELxpQdL51AWt9i5OzmHwsOAxVB9/p0TJ0oT7oaD46NJ3moQ
         gMomkGe5WZ8NYKxNtDbWu1EjdIhD2/NHNwW5b4/HdBnEU5Ihhp0VJ+48aasW2EMywlJP
         u5uigCAjvJDweX/P+P9EcI4ymlM3O1yobw8tgWw9JeOty593SdHr5q8Ozz6CGELS9FYc
         WXxPNZRkdG4B++JKcYAS3FLdJnjnxccYKGBvufqzyPIHOD6k/5yJe1aXjH+LB1ed3zCc
         pEZDzc1x1iwwkYecbg3Mufcx7/RdwjkM1C332rXPNo1B4u4y1O26K6Sdra+rqno+xSLo
         nG+A==
X-Forwarded-Encrypted: i=1; AJvYcCX5a7KZDFlFR1Ibsj2dNywG3x2UnwoxQyMCYD9PKpfLz9pZN5CgdoSuWTS3XboTaFl2uAPayOnGfoo4XApFx09Ysg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSeyQiZvehWdkfT+iDndYWTSDKhcuzdOcwnv5INRNS8wFOYl8v
	Iihjj9aoqXS0ncmxGvUi5lJ2UkLaymVniUtRTu/Uxjao5A6dvmiNTevwebR0XPc=
X-Gm-Gg: ASbGncsKInVR4dzFoKcLiDTUG5gNgF6yE6GGFZirFnfAYyYupbpXtgAryM9Hx5L3xsF
	5cKskO3Omi5095Y4rRonuruUvaCcKW+3ibLz67dTKTQKqRIEFMTbI4QrH8egW6QMYuTncWUZJ00
	l/0sJNCyJ5NglmzM95vdI9qinVVVFft1X4aNy7PvxodGh1X/812NKUEY1pt4IHa3aDcQ3NJ3zVS
	5Zq7+sOZjppp7gatCjNyo9MrgSxoNeRpNjxIxx7CmjGgN9iTVN5iqDtZWEA+TxFf3c9ECUiZc/Z
	ijNJYas9WIlquEdxb53IQUGt5Ry5XfP6o1d8Oekf0fUQYEzDm6RvaxDM7bwChoLgoR98oXKHgeh
	EMjhku2/Optwvw8G249lXQqqIsLISrIny9MjkDE7+
X-Google-Smtp-Source: AGHT+IF6+ps3eDE52vm5FBinBOH6gWG9Rp6Jq6NZPyHN8w90ZgubTS3KgmMslGLO7ap5C6fO6TVcpw==
X-Received: by 2002:a05:6000:420c:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-39d87ab61c0mr2116658f8f.30.1744195953085;
        Wed, 09 Apr 2025 03:52:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9990:6e96:e5dc:1b19? ([2001:8b0:aba:5f3c:9990:6e96:e5dc:1b19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c7a68sm12133745e9.19.2025.04.09.03.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:52:32 -0700 (PDT)
Message-ID: <2bef26e9df54c8e1b12a8e71790e0072e5f09fa7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] udev-extraconf: fix ifupdown for non hotplug
 devices
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jeroen Hofstee <oe@myspectrum.nl>, Jeroen Hofstee
 <jeroen@myspectrum.nl>, 	openembedded-core@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Date: Wed, 09 Apr 2025 11:52:31 +0100
In-Reply-To: <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl>
References: <20250407174904.1191173-1-jeroen@myspectrum.nl>
	 <a0573ce7a2fe28ee7ec138194177c09dbc53283a.camel@linuxfoundation.org>
	 <ecc77fe1-4e85-407c-aa6e-e4b8dcb6e96b@myspectrum.nl>
	 <687a5c15fb54930b999cf16a59baaff8f9897a94.camel@linuxfoundation.org>
	 <7eb23b12-1fd1-48a5-83cd-eab2edb8777b@myspectrum.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 10:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214585

On Wed, 2025-04-09 at 12:40 +0200, Jeroen Hofstee wrote:
> Hello Richard,
>=20
> On 4/9/25 11:27, Richard Purdie via lists.openembedded.org wrote:
> > > > We've purposefully kept the code called from udev and in our
> > > > initscripts relatively minimal/simple as the overhead of executing
> > > > multiple programs does build up over time. Taking the above, we hav=
e
> > > > loops, then pipelines, each of which runs more commands. Each comma=
nd
> > > > has a fork/exec overhead.
> > > >=20
> > > > Is there some way we can simplify this rather than all the shell
> > > > pipelines and loops?
> > > The simplest solution is to patch busybox to respect=C2=A0 --allow=3D=
hotplug I guess.
> > Yes, I as wondering about that. I see patches from a long time ago but
> > I guess they were never merged. It probably is easier for busybox to
> > handle this rather than shell code but I don't know what chance they'd
> > have of being merged upstream.
> >=20
> > I would probably perfer to fix busybox to support this but I don't know
> > how well that is going to work out...
>=20
> Unless they changed their mind, upstream busybox won't accept it, so it
> has to be a patch in OE. But feel free to try to upstream it.

It would be worth a try at least asking as that was a long time ago and
we do have a specific need here which doesn't involve feature creep (as
far as I know).

> For completeness, this is not some theoretical issue, always calling if u=
p
> directly after a network device is discovered does cause issues and is
> against spec as well.

Right, I don't doubt the issue and agree we should fix it, it is just a
question of how.

> The sed stuff isn't that complicated, is it?

It is about the principle and precedent. If I take this, it becomes so
much harder to me to argue against the next similar change and hard to
keep things simple overall. I'm therefore really torn.

I'm spelling things out to see if anyone else has opinions too. Mike's
alternative way of handling things is potentially interesting but I
worry that may also be "against spec".

Cheers,

Richard


