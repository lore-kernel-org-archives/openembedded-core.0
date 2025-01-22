Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34920C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 08:15:49 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.38392.1737533741234371662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 00:15:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BV0+hr5F;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385de9f789cso4950792f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 00:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737533739; x=1738138539; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8+CHb9jdtJZ3v/FUV9OE8K7jM4B1+avzxY0a24M+X0=;
        b=BV0+hr5FzYQmjToADjYNHT7I8PBQF1uiqm7Pz5NU1dkYgIrvlL8JGtvDTZfpnoC/v6
         X6BHxgpgmehxerWjy1EKSE+MHLlCMzFvR6sJBNVc1rKaj17NHDnsQYN5IAZSeGzFIrvI
         5rML95zg3b2J7oQZf2NUD3O2d9wxCXR8Vb154=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737533739; x=1738138539;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z8+CHb9jdtJZ3v/FUV9OE8K7jM4B1+avzxY0a24M+X0=;
        b=M8zgOhXcM6AmYiAZhYI2E1nbk8x290FbK4i2McWVnOURQV9RwzTwthcvHlSNy0jjfb
         /ROY4sqt95K4PHQGDJOOp182VMg5rCdSLvZAzu2WNYmOWQHaLnibOnZsAaEphFkqO94d
         rmENTVM73e73wBFNOIQVUirHCf9EJBY/evWSlx3+KLco0Y+un7HrM4mTliUd8/IyZlNK
         pBolvRzipKZWq6tfQ/LPIiC2KD0974ic+9xi5O86zbucsUmJKnB9b/u35qYajAR3nr+3
         oERQMvr73xVb/szWBn33Y6bIT3yfSyUSQo6R4VfNv6+zaONnwV5fCDzkABjLs9ELe9vp
         im1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvvettaiqHqxQAxM7nJi1a4aJHTetftxfNkJ3/uEpLG192evCek8o1gu2ti8jpOmWTLjVGfqgBQbNhGBdNO+/bCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfpMAGQ55TOC5xPNW1QTZWdfWxG/nhOO/8/TdGj6YeUiDVxbpC
	TkEphlICv/D7+NoB+aRrqDh1djrQbdffM2kO2SdgIdXoEFusz2eHw6bHWEnTGCM=
X-Gm-Gg: ASbGncuxR1zddm8AsvL8ng1R4DmxVsGopOHRXL2byxjQ3zeIf1HGvtxPNgDIeVMrXsR
	aqvFPGjOMfaMUIJTriLEdj0AtOQ12hpwaMoJCJbs78XgEWqqXHpwUKNA0hk5GLRSYpq4HcXpE2/
	+drbXx8zIYSFPc8p6FR+k3rvYcPzPUtRHbdBxGB3u+qMa3mpqDjUbnj2+S+QOsYTw8pb7x3YJAu
	Kp+Rtrhp43sx0c6xl3BM+q2bOodxPn2yxqV3cPqF5DK0xR5jaZ+5BzBmqbHTbd1jp7AvrjZGfBM
	EtYAEx7kwSSXN6Q117Qa/pEepE9TYUZnc5qudpmDVS7/mvjN3006qw==
X-Google-Smtp-Source: AGHT+IEaZVvZ96Bv557pgpNm+m7L4w+SCEhrJWGy68TLoBAB4EiWDLtYguf077Y4XpIXu+BUcqa8kA==
X-Received: by 2002:a5d:6d86:0:b0:385:faf5:eba6 with SMTP id ffacd0b85a97d-38bf5655a3dmr17308788f8f.1.1737533739542;
        Wed, 22 Jan 2025 00:15:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bd38:1d:73cc:d341? ([2001:8b0:aba:5f3c:bd38:1d:73cc:d341])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm15361403f8f.28.2025.01.22.00.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 00:15:38 -0800 (PST)
Message-ID: <2b132859c27f8ffdcebb090d6338e3430d6a8d1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gcc: make include poisoning fatal again
 in gcc/g++
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2025 08:15:37 +0000
In-Reply-To: <20250121182309.904188-2-ross.burton@arm.com>
References: <20250121182309.904188-1-ross.burton@arm.com>
	 <20250121182309.904188-2-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 08:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210138

On Tue, 2025-01-21 at 18:23 +0000, Ross Burton via lists.openembedded.org w=
rote:
> We have a patch to allow us to 'poison' system include directories,
> which are warnings by default but we make them fatal in cross builds.
>=20
> However, in the 13.1 upgrade[1] the patch to make the warnings fatal was
> dropped in the compiler invocation, so it only took effect for pure
> preprocessor calls. This was not noticed at the time as the test case
> was flawed, but this has now been fixed.
>=20
> Add back the fatal poisoning, and restructure the patch slightly so it
> is less invasive.
>=20
> [1] oe-core bea46612fd9106cc5b46eb1d81623b6492563c13
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0.../0002-gcc-poison-system-directories.patch=C2=A0 | 35 +++++++++++=
++------
> =C2=A01 file changed, 25 insertions(+), 10 deletions(-)

Sadly this causes a ton of failures:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/857

The patch is right but we're going to have to dig in and clean up the
issues before it can merge.

Cheers,

Richard

