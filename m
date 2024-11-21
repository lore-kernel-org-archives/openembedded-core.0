Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A163D6ED08
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 11:10:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8160.1732187415329806557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 03:10:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CQ0Qz7mr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315abed18aso6348705e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732187413; x=1732792213; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7SIEtkXN/eSM9HVgociJDuWrZi+osCACYai6y/4mjKY=;
        b=CQ0Qz7mrFJcL4iWI2DsoieOrmNbNo8BvYLUP6qjyy0bd+3vBXY4M2uqSbOBBsxr7wP
         jBd4TcNDyay7sQiDDtydiaeRKiqsnDSxa+XzmGr9yECnr+oYTOHcA0TSIf1ry+7/73Jd
         eX4yYctJ/G4SQbeV5YryN3h4GyolxqDFG+7Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732187413; x=1732792213;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7SIEtkXN/eSM9HVgociJDuWrZi+osCACYai6y/4mjKY=;
        b=eh+6zpd6hNVomSAv9ZxpQ/nsXed2nv0Ib28+gjYxgl+qPgN6NdmU03qe/+6Mdw+oTT
         c/z+ax0yncu2DdwGnklV6JpXt4x7LK/o7gINAVKCi+i64G/nGjMngYW0aP+GonfiEmJP
         UCTUuwT01tGIGY53rX1NhYZGeAAnH+9A9+04ZNlJM4W2Xk+gYPLJF9R5Qkle9u9P1UtN
         WXBhoBM42t0Y/DSW3W0KjB3VjGa6mn27+eYKSyf0BMppOf8RVd5H7v5w6vMJe7yUyKVm
         CvTbYLH9j8045ie1FjU1g4cF8F6gleUZRqHAKlSy4SHQzYgWdu/k/brMx0FQc5c6uz4w
         bUwg==
X-Forwarded-Encrypted: i=1; AJvYcCU7wGrVFy2ZsjVaJiATU1p41Le7OwFYMMhStaFpRheFRiNEDsX+dkHZAGObcJFLffcbBBW4TeQKYuGwKitmQ2FXCw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwS46DKwqtjdFBlqHGxSEW7Dt2ZLWajpyspLjrnVxS2+6EgGJ3N
	Q2VHDcPdmRmXFJam6b5K31FxIAYfbi4s8NVMAPAw79aRgG3EJuMyK2Il5SPUnfI=
X-Google-Smtp-Source: AGHT+IEq8tRac+wwIsSHV6bl2TL3cQtsPTIh14L/auNZGEeiqVzISHPATtZ3xHwW2C3eL7K6t8xzmw==
X-Received: by 2002:a05:6000:2189:b0:382:4a84:67c with SMTP id ffacd0b85a97d-38254afa122mr3080569f8f.32.1732187413084;
        Thu, 21 Nov 2024 03:10:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a4ee:c091:1f03:6404? ([2001:8b0:aba:5f3c:a4ee:c091:1f03:6404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254905495sm4711113f8f.20.2024.11.21.03.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 03:10:12 -0800 (PST)
Message-ID: <a88e3f9bf38ddcc32cec143d1d9fb664b5a6e033.camel@linuxfoundation.org>
Subject: Re: [OE-core] Space optimizations in kirkstone and scarthgap for
 sstate objects
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>, Steve Sakoman
	 <steve@sakoman.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2024 11:10:11 +0000
In-Reply-To: <Zz8Sx6-TzVwnYQJ3@nuoska>
References: 
	<5065c40bca56ce56ab2584c77ed26883a0c972e0.camel@linuxfoundation.org>
	 <Zz8Sx6-TzVwnYQJ3@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 11:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207523

On Thu, 2024-11-21 at 13:00 +0200, Mikko Rapeli wrote:
> Hi,
>=20
> On Thu, Nov 21, 2024 at 10:41:29AM +0000, Richard Purdie via lists.openem=
bedded.org wrote:
> > We've been trying to resolve some of our sstate CDN issues and one
> > thing causing us big headaches are large sstate files. By far the worst
> > offenders are webkitgtk and llvm.
> >=20
> > In master (and in styhead) we have these:
> >=20
> > https://git.yoctoproject.org/poky/commit/?id=3Dd9066258a1e48e75cf814fb0=
940ac420bcdd6e99
> > https://git.yoctoproject.org/poky/commit/?id=3Daca8acceb87e568115da9696=
732e915d91da9652
> > https://git.yoctoproject.org/poky/commit/?id=3D1d8d9b1f87b21af36d9c3281=
32f71c528eefd5b0
> >=20
> > which did significantly reduce the size of the output. Unfortunately I
> > made the first two work with changes to DEBUG_LEVELFLAG which are not
> > suited for backporting:
> >=20
> > https://git.yoctoproject.org/poky/commit/?id=3D1cf0974ad242f7eb2815a4ef=
0e3e5b6507ca56ea
> > https://git.yoctoproject.org/poky/commit/?id=3Dae4ec59b3eff85aaa1cfe914=
a134e56e1d125744
> >=20
> > I do think we should apply a similar tweak to kirkstone and scarthgap
> > though. The third patch above shouldbackport. We should be able to do
> > something equivalent for llvm. Any thoughts?
> >=20
> > Michael obtained some sstate size info which I've shared below. You can
> > tell the age by the sstate version number (10, 12 and 14 are kirkstone,
> > scarthgap and styhead/master) and the recipe versions.
>=20
> Can similar changes be done via the CI build scripts in the affected bran=
ches,
> without modifying poky?

In theory, yes. I'm not sure we want to "hide" this kind of change
though.

> I would not mind breaking stable rules when it's about keeping upstream
> infrastructure sane and running. Details can be documented to users if th=
ey
> are impacted and need to revert those changes in their configuration.

If we do make a change, users would easily be able to reverse it
locally if needed.

> Would be nice to know what kind of issues these are in detail and what is=
 the CDN
> implementation.

Most CDNs have object size limits so the setup cascades through
different levels of completely different systems to cope with our large
object sizes.=C2=A0The CDNs themselves are not designed for large objects
either, in their view we should split these into multiple smaller
objects. That isn't really possible without rewriting the way bitbake
works with sstate.

Objects are only pulled into the CDN at first request too, the larger
the objects, the longer this takes. The setup has changed a bit as
we've tried to work out how we can make it work. One issue was the size
of the "pipe" between our servers and the CDN nodes. The new
infrastructure/data centre location has resolved that potential
bottleneck.

Cheers,

Richard



