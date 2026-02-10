Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235F7EA8114
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:19:55 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19414.1770729589609781843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 05:19:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bk5W4eDT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-658078d6655so7359855a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 05:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770729588; x=1771334388; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GPB6+SnKh0MCLuxHQ+w0/ZXQdL3yev8TTn7CF0a7Pes=;
        b=bk5W4eDT0Rmpyl2rjdyYAQt838k00rJA6KR9EF6OeUQEGJW2ikkhUCUDPZqvtCd7kv
         Tz3AghCZkGygy3qi4SiUKc2tCBEmOsv6XRZNZ4UlJfCwMOonkGvkuuwx0r2N9GJGifM8
         Z2nPP3xReI+6/TOAlB3emcAW0h55KNheNBKP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770729588; x=1771334388;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPB6+SnKh0MCLuxHQ+w0/ZXQdL3yev8TTn7CF0a7Pes=;
        b=Sdujqhim5TBTgHb8631IYnYg918t9ehUsZS4Ft2kJy3r4kqcLPjEiKrYmChQxYB0Gp
         +gUkFq7YG0K3x5IkoWyDZ2PVc9Ju4wcMbT1Rp5pie9E6uBGZ0BTnLPgfYe1Ql8RewG77
         /qKRfO2G/rdwSqT3yjTgBhSW2mw0zR3lqEfNGWLLAdk0QTcvX381erjeNgfFhhNsI/x3
         bYWximCNb3qmJaQRmv2mie00tmpHUUyEHDFPj2OhkuOb1M0sq2IIwTZTh7asT4SRL0Rc
         fLHuHzk6slc3haWIlFEGvwrpB82riDev/ocVQ/orPqb2TPxf6ZKuHbKA8jPuikf2gYft
         UHhw==
X-Gm-Message-State: AOJu0YwNwcihjFQ8nyv+qKPt3u7ronibb2BhNcsU6+TGbQ49KpoBPDh8
	3l+5JRhTLxNIIaea3a8+tV4x9qZ/VAc0AHagEnx/bh3vuR5p6Yd5+G8Upiz4EQGMxcQ=
X-Gm-Gg: AZuq6aLg+gFT8ceA+NHuUXj4h0st/RNPB9DIxGej8M8csaXYgOSzRRgf0Fl9eZ3Hqq6
	fe6K1tfGcyKd81RW4ArlEDuKPmmaiciYzgcFrSgI0/J/+pLRgU1uZAiTcHNvBgLddzLXDZfRgAL
	mLSITPAxMDWbEH2vsScURKOUQvn1aEFmp4Cc0LbiVKmzXEUWQzi2bxdnklLtTMtpMZrF1Lizyjl
	N4UTNjYivnjBXCDuknjOSHORqgghH5YSYEomUBWnkxgBJBA9HBNdlwbUMtv9i5U7iiX9i5ngWQv
	ujnN/iXEmnqB0pUsI4MkdSmTHo8I4q2Ef8qFg6sU2A5BhTERVQPh79lgplvvbB1jNjHi2IOoAOO
	X9M4Bccx0RjxakubyYOmQqZiWuwOCmXgYWo7PTErKGkmuHG7OoAFUmaoW01HYRTFNoM9tBOk0ca
	McjZyrZyhg14SvUYlahJ4hbe2WBSijySHCegurp2vLaiOqbldfRd2aD5tPvAM6G0a8GQCdk1I2E
	WXMkOqTDz/eLnU+sDLd
X-Received: by 2002:a17:906:7305:b0:b8e:2a8a:4328 with SMTP id a640c23a62f3a-b8edf174379mr843291966b.7.1770729587855;
        Tue, 10 Feb 2026 05:19:47 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa? ([2001:8b0:aba:5f3c:847e:ef7e:e5c4:fa])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf1532sm520763166b.55.2026.02.10.05.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:19:47 -0800 (PST)
Message-ID: <e8f2e5e39f2ced4d3fd25d33159ce8bdaaa5313a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16
 removal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Jan-Simon
 =?ISO-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>,
 bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 10 Feb 2026 13:19:46 +0000
In-Reply-To: <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com>
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
	 <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 13:19:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230896

On Tue, 2026-02-10 at 11:09 +0100, Mathieu Dubois-Briand wrote:
> On Fri Feb 6, 2026 at 9:27 PM CET, Bruce Ashfield via lists.openembedded.=
org wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >=20
> > Hi all,
> >=20
> > Here's my series for the two repositories combined into one.
> > I usually do end up missing some reference to the old kernels,
> > so I'm never completely sure that I've gotten them all.
> >=20
> > But with this (and thanks to Kevin getting the beaglebone
> > working with 6.18/standard/base), we are down to just the
> > single reference kernel.
> >=20
> > As usual, I'll continue updating any kernel that is active
> > upstream, and I'll send -stable updates to the appropriate
> > branches.
> >=20
> > I also plan to make my scripts available for those that may
> > want to bump SRCREVs by themselves to continue consuming my
> > merges.
> >=20
> > I'm out for the weekend, but will pick up any issues with
> > this on first thing Monday morning.
>=20
> Looks correct on the autobuilder.
>=20
> Just a quick note for Jan-Simon: once merged, this will break meta-
> agl
> layer, as it refers to 6.16 as a preferred version:
>=20
> WARNING: preferred version 6.16% of linux-yocto not available (for
> item virtual/kernel)
> WARNING: versions of linux-yocto available: 6.18.8+git
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2987

It mostly worked in my testing except for:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/3148
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/3176

linux-yocto-6.18.7+git-r0 do_kernel_version_sanity_check: Package Version (=
6.18.7+git) does not match of kernel being built (6.18.8). Please update th=
e PV variable to match the kernel source or set KERNEL_VERSION_SANITY_SKIP=
=3D"1" in your recipe.

Did I miss a patch or something?

Cheers,

Richard


