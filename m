Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A62D6ED04
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 11:00:32 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.8017.1732186830707197599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 03:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=c6/FmbUj;
 spf=pass (domain: linaro.org, ip: 209.85.208.179, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so8527251fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 03:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732186829; x=1732791629; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAj4MfA6DeCmBuJc5QW4VFhv/9AhPhKLKk3DG3t6nPU=;
        b=c6/FmbUjeDPdNzUe2kpHBpxlC3W46X+0Ls23LuSXy+yyjM2FGNHEE7XDCgS7llRoh0
         NzAlM2b3uHr8ErMNhf7mey+yJI4XyZtFIGcnNRRmhE3h5nimJQLBkBbzI8rSfjfGiino
         mvnb1sV43ZXNqLzkewlK6zlweFouBa3L2eaGsMzZnUaMgV02kx6S0sCK1PxfIwotmyuf
         7J0GaDfCIZaROANqtZ+SSzsn7TZzcjlY9hM/leh4L0cIuDU/RP9DDizfq59c70n6UDcP
         un73BQ9LA/HV7Tkr+eSYhh0AKQda8Q3YBkttdIUJWiVBKnZN5BzNoqOrKRLp7sDUUkQ6
         /P9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732186829; x=1732791629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAj4MfA6DeCmBuJc5QW4VFhv/9AhPhKLKk3DG3t6nPU=;
        b=CSuaOuNuUd4xxMCUs2wnuxxKCvZoskrnaGuFYBUJqUhmQ1BYd8ZA6PSSaYC0Gs01x2
         uBv/57Xn9+YWStSESDHJT7ALB6vRbpVbspCLrM9E7FY/3290haN7o84zbTaHFdVT3jni
         rXQqSBqnundVv+T9ionPiTASvH2i72VrKOW/4gGaIPOVWyvz5AI2zEYUghRyEBPLgmQY
         EMB9RotBGVtnn2xMt+r4mTcKarID0JFkzvjgT7a8qHNlu//EHT1kxXUgO76i4g33pUcD
         l5w96JnMVao4LF6X2i4EZwkOaCiHdNVPPbMfOaR62F2+YdWgeyDiC3KRq8HDBKF2cJy/
         iEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzW/hJ/Eea5sZoXxRt2KUG89yiLAtzM5zvLxSBU4xXvOI+/k3/y7icxQ4mGnKAMyoz/uSBMepcxkaDPfg7QPEUng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxfG7uuE34cIJB2T480eaJJlA8/rf3eJvbYW6Tmn+bMt5IeCbxm
	ijAJG+RSkmfgt9aVWDUmBVKhcZsWJ602r9u/8b+RmkI3PDXHWttCXOuxAsI5pX0=
X-Google-Smtp-Source: AGHT+IE4RB6SFqmHh02bH83V4TmYGIJGge1jgni1fFy/OYBATFSkIGb/UIu2xNeCefPYk3t6H1CXWw==
X-Received: by 2002:a2e:bc20:0:b0:2ff:78be:e02d with SMTP id 38308e7fff4ca-2ff8dbcb795mr36829341fa.11.1732186828412;
        Thu, 21 Nov 2024 03:00:28 -0800 (PST)
Received: from nuoska (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69ae8858sm18274871fa.70.2024.11.21.03.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 03:00:26 -0800 (PST)
Date: Thu, 21 Nov 2024 13:00:23 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: richard.purdie@linuxfoundation.org
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Space optimizations in kirkstone and scarthgap for
 sstate objects
Message-ID: <Zz8Sx6-TzVwnYQJ3@nuoska>
References: <5065c40bca56ce56ab2584c77ed26883a0c972e0.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5065c40bca56ce56ab2584c77ed26883a0c972e0.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 11:00:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207522

Hi,

On Thu, Nov 21, 2024 at 10:41:29AM +0000, Richard Purdie via lists.openembedded.org wrote:
> We've been trying to resolve some of our sstate CDN issues and one
> thing causing us big headaches are large sstate files. By far the worst
> offenders are webkitgtk and llvm.
> 
> In master (and in styhead) we have these:
> 
> https://git.yoctoproject.org/poky/commit/?id=d9066258a1e48e75cf814fb0940ac420bcdd6e99
> https://git.yoctoproject.org/poky/commit/?id=aca8acceb87e568115da9696732e915d91da9652
> https://git.yoctoproject.org/poky/commit/?id=1d8d9b1f87b21af36d9c328132f71c528eefd5b0
> 
> which did significantly reduce the size of the output. Unfortunately I
> made the first two work with changes to DEBUG_LEVELFLAG which are not
> suited for backporting:
> 
> https://git.yoctoproject.org/poky/commit/?id=1cf0974ad242f7eb2815a4ef0e3e5b6507ca56ea
> https://git.yoctoproject.org/poky/commit/?id=ae4ec59b3eff85aaa1cfe914a134e56e1d125744
> 
> I do think we should apply a similar tweak to kirkstone and scarthgap
> though. The third patch above shouldbackport. We should be able to do
> something equivalent for llvm. Any thoughts?
> 
> Michael obtained some sstate size info which I've shared below. You can
> tell the age by the sstate version number (10, 12 and 14 are kirkstone,
> scarthgap and styhead/master) and the recipe versions.

Can similar changes be done via the CI build scripts in the affected branches,
without modifying poky?

I would not mind breaking stable rules when it's about keeping upstream
infrastructure sane and running. Details can be documented to users if they
are impacted and need to revert those changes in their configuration.

Would be nice to know what kind of issues these are in detail and what is the CDN
implementation.

Cheers,

-Mikko

