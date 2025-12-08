Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD16BD3B7E2
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:25:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.954.1765211113743512723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 08:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oqtzpxA5;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so40712545e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 08:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765211112; x=1765815912; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4MXVkzjY3nUTYfM2AhgNGmgVvM+uS7X/WjU1BtK80Ro=;
        b=oqtzpxA5u08lFgJxayo4cyh9K7aEZX1JKNk3KmLcs33WVMMxiCuFKOtWGUmF/UDzGz
         I7PnK0a0svssfJberS6NW1jmwrEUzYFutXQpzsSd+JhnaBP6eW5mn4Lj/8uZ/xxLjiUs
         sL95yqw9oA8AKX+Jp6ZqMZYKJLeZ4AXUk91KA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211112; x=1765815912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4MXVkzjY3nUTYfM2AhgNGmgVvM+uS7X/WjU1BtK80Ro=;
        b=Pl11A0/KSAQV8mc8S0Q1ABNWr0WFM2KSYcDYyB/MwbozcdmL/YutXV89+5NYQeS7fU
         k8U6mqGTgA6Ldz82PhnuIHX3w0eVS35fhrvot0V0kvEndvk9UVInrSHjQo6upo80c7Z2
         NhMGVZPDuME/Ve5bVzJ16GAKWOSc+/ue3qZ7utv6Xd5vPfiHXHCN5LsaZzA+abhw8r4g
         l7rmOp5I8nn9wcwIPacfKONHutKYwl2Vf9Sfp6mb3WBDgGm2LHvUSrT8zO+umdsI8Wml
         R8h0ZpZ171i0PVhi4MgkYJDpPN8AMpPkU0rbfxykBPgh4wYdWqjCaseaMKXMiujOF4/L
         Xc7w==
X-Forwarded-Encrypted: i=1; AJvYcCWJV6gCfudy6slz6hxnS2lvVip3kt60I3yBC/wKffBJCnw/ZxCGFFKpEL9+4a8cj/6AK9Z7aEcqV/PQ9NiWWc6MyQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRtiHU1cX0YPn46qq0PFeYOKUpZqNt84lXH7TWg+AedXp3isFk
	7EW1WXuSOv7dInd52fr5EG2NWERiC7ILwHckeSqHm6SNKu7dblcI01aZPPFleIyAuLsmxlv0fDg
	94wLVvEnNAr3vOGHWWLjpzL/fHjOExnAxvymU9Ia5Vg==
X-Gm-Gg: ASbGncuS5cmdn6pbQrsDK9M0s7/sd4lGFzarGnYrAbIV7S46ra34q3MwQBibCBa0W37
	MWnIDMXq8XFbBbn7a+lOzncDnl8In/aHcuDINX2EY2aYPPxF29ps2y/oJjfpXJ+jeFuFOa25Kto
	Ukrg+CzG7Q7IwsnaodPK4oNmNXM74JCZnMkUsSLCa4h7oeOjbS0qFraO+d81XInKh02V9wLaybd
	T6zZfvetOdqa483WV91vjmss18sBlZ3wNqrKEoXLwDsR8HxCYTTmxkfVPQdVZOFEINMew7DwQ==
X-Google-Smtp-Source: AGHT+IHwyi67LT58TTCFa1f0u62TNLVoU3YhGZEe/wvuuRBh2KmgVhr1USTEqYil9XVdY+LStyEWwAB/h+/DB6kYINc=
X-Received: by 2002:a05:600c:530e:b0:477:55ce:f3bc with SMTP id
 5b1f17b1804b1-47939e20181mr85865425e9.19.1765211112072; Mon, 08 Dec 2025
 08:25:12 -0800 (PST)
MIME-Version: 1.0
References: <20251127164443.2285753-1-raj.khem@gmail.com> <DEOEGKYGPYRE.2VTCS4TEKVW7C@bootlin.com>
In-Reply-To: <DEOEGKYGPYRE.2VTCS4TEKVW7C@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 8 Dec 2025 17:24:44 +0100
X-Gm-Features: AQt7F2rlxauRWzaio6aMszPZbUeX34JQaImHgGrRgyWRqC5tKq0MF7vNQIZlxsw
Message-ID: <CAMSfU+7Gv-RcVyAYoa4RH-A_XXt1HoS44HuqbAKWy6RKZxEARA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] autoconf: Raise line length limit for sed/awk
To: mathieu.dubois-briand@bootlin.com
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Dec 2025 16:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227398

Le mer. 3 d=C3=A9c. 2025 =C3=A0 08:23, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> a =C3=A9crit :
>
> On Thu Nov 27, 2025 at 5:44 PM CET, Khem Raj via lists.openembedded.org w=
rote:
> > Latest autoconf is splitting long cmd lines in config.status
> > it generates using sed/awk to have compatibility with
> > platform like HPUX,Solaris,AIX which is understandable given
> > autotools try to achieve wider portability, however, this does
> > mean that in OE builds we might get these newlines added in
> > places dividing commands including buildpaths in them and the
> > methods deployed to scrub them from output artifacts will fail
> > since the string is now on two lines resulting in build QA to
> > pass but the strings do sneak in affecting reproducibility
> > one such example is e2tools recipe in meta-filesystems and there
> > perhaps are more
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
>
> Hi Khem,
>
> Thanks for your patch.
>
> I've had some issues on the autobuilder for a few days, and it looks
> like it was triggered by this patch. While there was no specific error,
> the -tc build jobs had been running for several days and never ending.
>
> One example:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/66/builds/2740
>
> I've had a look on the worker: it looks like the host nfs server, used
> to share files with the tests running in qemu, had been failing:
>
> pokybui+ 4115014  1.1  0.0      0     0 ?        Z    14:23   4:32 [unfsd=
] <defunct>
>
> I clearly can't see how this can be linked to this patch, yet, git
> bisect points to it, and after its removal I don't have the issue
> anymore.
>
> So I'm not sure there is anything you can do, but I will accept any clue
> about what might going on here.

Well, that's unfortunate... I've created a ticket related to this to
avoid losing this in our mailboxes:
16093 =E2=80=93 Compatibility with old sed/awk interferes with reproducibil=
ity
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16093

>
> Thanks,
> Mathieu
>
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#227203): https://lists.openembedded.org/g/openembedde=
d-core/message/227203
> Mute This Topic: https://lists.openembedded.org/mt/116503258/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yo=
ann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Yoann Congal
Smile ECS

