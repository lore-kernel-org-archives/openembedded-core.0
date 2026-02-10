Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F30BEA812B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 15:10:45 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21879.1770736241304585960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 07:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f2dtdXKT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so8168835e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 07:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770736240; x=1771341040; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OXrtiP3PnrWZ+XQTQ7mVfDutM5GO94WVghygzVvCur0=;
        b=f2dtdXKTkEQUi0yKn3LSvuZr7oHrL6D7HXLDS0Q0twctZiHCZk0dTSxQ2mGIdSY+NE
         sQ+RKyP3e9x4nZSb0IuRILUo8l1j6K5evuWGjE0xhcRfO1rKlOlDJqtPq83KZ9qW3aPA
         VOzE8i2l2Fz10ojuVu5GNwDRSXFYVel9eAYwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770736240; x=1771341040;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXrtiP3PnrWZ+XQTQ7mVfDutM5GO94WVghygzVvCur0=;
        b=mpPMW/Rapvz64JVDSfNx5cB1EALwVORQkuJETKjsjFObq0ldN5WqMwlBwxdfCIG984
         QRrGLoxW+vwHz1YCyaLYCSfMbcrYH/Ad1OsCdX/5c06zMpgilI16dzIyB/584G2hmQop
         WlSnFJ8Bi9NUpW0yCllm+wyd/zUaVVN2Cgwc9BPGVbctJNA0/o5p8gKNOJeNoNblN8PX
         +S24pJ9ii5FrvSNRXHDrNQbKAD91P1hgW46FHjDbTBMejy5ai9SbTNsNB2UhTBSxmCd8
         BWB4VjiQlaL5+GxLcghyaDImaBU/SCdS+iXPOAiKdtkgn6SZlT/ksBj3AKPiMW0v1ES+
         3F1A==
X-Forwarded-Encrypted: i=1; AJvYcCV0kSPPhYDnhUQ688XZDOcoUAwUvA2Y3k5ASz9A2YxIxJOfV7vfWRM9x+9bQCn29Q8CbmpbFezcKYjudmTaUJGO4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwF/BHhNFZjZblhbWFii0JFKWCsCK+54Z9hANWRtPI3nkxn033/
	pyPnE4t8TSMajBENYEBPg7mHiPgb3IygsIb4N65uXJRQZGjIYUEXCloilsG7icxhdLc=
X-Gm-Gg: AZuq6aJQoRWCjA8BC2XaalEPXH8P3k742If1p8VM0l/UdnY8UoQcYVyFbYy7vS0Pu3u
	NaC1CtSL9AQQ8zsm2+QkJMh89dZFceFfJMB2Vc0XOOEOaZcIwX7U1I5crjExs68RNvOH06kLoH2
	GPwjXAvwJsRxCLVI1T8x3JGbdwGsepMXBDN2zRSSwe2j3VLQ71PVZfastLty15p6Ey5E1I7W6mI
	THHd4OO1MvoBHqUBse7VH12Jf/vf7/bYygLY3KCmioBikZOpihHGxJ84S+eKouLJVvas17u4qGD
	toegroE2F9wCcnGTZQCLi1CNg2ycNuDmfVhqmthpfYBQ91my58MRPj/Iy9e8PQNSzROs0zY7qk2
	Ssd1PxHXEB2rhRQkRyRYmakp0ysoffGgzJxvNR/XA9gWyxf4HboqvzKiThm69fbpr8MGan4yI52
	uLp2148E7H1ZN/LdNwtKuceSSP8fk1uKDVEoCIvsSRWR5agmeGQ50jUxqqK3S38/p1Yck0HuiaE
	51BPB/shg==
X-Received: by 2002:a05:600c:8b82:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-4832020f040mr239021755e9.16.1770736239608;
        Tue, 10 Feb 2026 07:10:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa? ([2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd1bsm73536075e9.6.2026.02.10.07.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:10:39 -0800 (PST)
Message-ID: <6c64d7676bdbf6ec9c08026bc2c3db4bfbb22625.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16
 removal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Jan-Simon
 =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2026 15:10:38 +0000
In-Reply-To: <CADkTA4NG_9_b5q0JGiS3bGF7hYiPaRWfiNsmM8ED3QoDXbbjNA@mail.gmail.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
	 <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com>
	 <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
	 <CADkTA4NG_9_b5q0JGiS3bGF7hYiPaRWfiNsmM8ED3QoDXbbjNA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 15:10:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230908

On Tue, 2026-02-10 at 09:15 -0500, Bruce Ashfield wrote:
> On Tue, Feb 10, 2026 at 8:19=E2=80=AFAM Richard Purdie <richard.purdie@li=
nuxfoundation.org> wrote:
> > It mostly worked in my testing except for:
> >=20
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3148
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3176
> >=20
> > linux-yocto-6.18.7+git-r0 do_kernel_version_sanity_check: Package Versi=
on (6.18.7+git) does not match of kernel being built (6.18.8). Please updat=
e the PV variable to match the kernel source or set KERNEL_VERSION_SANITY_S=
KIP=3D"1" in your recipe.
> >=20
> > Did I miss a patch or something?
> >=20
>=20
>=20
> I also just sent another patch to the bbappend, to bump it to 6.18.9, but=
 you
> can ignore that patch, as I haven't sent the base uprev yet.
>=20
> genericarm64 has its own SRCREV, so we always need the patch to bump
> it along with the base kernel or we'll get those version mismatch warning=
s.
>=20
> I could fix it by putting a PV into the bbappend, and then only when I up=
date
> both the SRCREV and the PV will the reference board move forward .. but
> I think we should leave it as-is, since it prevents them from falling beh=
ind
> the other qemu based reference boards.

Mathieu is right, I had missed two patches. What happened is groups.io
sent some to me directly and some to the oe-core list. This meant my
mail filtering did something different with the patches and I didn't
spot it.

Normally the numbering would give me a clue but I'd already had issues
applying things as there were conflicts with something else in master-
next I removed.

So sorry about that, my fault and I at least know how it went wrong and
how to avoid it, sorry about the noise!

Cheers,

Richard



