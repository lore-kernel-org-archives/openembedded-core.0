Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.9932.1624637600863198011
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 09:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dXgsYJa/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id i94so11202211wri.4
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 09:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QFOtF1IeU1vyi30aPp/HKZfIh9e0avPvUZPHRICA4gw=;
        b=dXgsYJa/inIDrDGBVO8khWHXyg0SxK4gmUEtypnK5qbt37yYXMcEi8p1FauoGLE1La
         nrMId++M1J2DYv4f6c4HP8Q0K5Exutxvwb3W6GLL6Ntu0Jdu5HV26Dscqf+dMZfBDV25
         wBlZI3/Uo5xqqaHNMMmLXpqFjGXUFvWhg/DCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QFOtF1IeU1vyi30aPp/HKZfIh9e0avPvUZPHRICA4gw=;
        b=sZpqnVS6lpdpifDd39hT24010zdQzIClJqdWeNThfaP2/GfxdjZMSf7R8dnOTUJ5Bt
         3hw7BzroKvVTRFT17lGqfmLp7cHSinYMSunuVIGHIr9d9JOifdzE8Xgt7QYNW9ISwAZx
         2SbLkdoIYrBd847V4urMnddbq8qbBC0mLJJ9V0/rtIbNnJ/rXmuH5Om6tWzgVq+1ovwe
         fO7OB8jgnV0RxLbMH0+oupJ6TPd+hYcvbuNaDiQJtT+nU6CdP6aTaSGLQGo6GHqgz54o
         1Xs9VEIp0+OvSx9MIQsbMQntlpBw1DmG0Ga/iW4AP3w9Qm4LkIHDm+pKW/2baY0F92aj
         /cMQ==
X-Gm-Message-State: AOAM531V42N1a8ztkUJWuxG26AAkCuFc8ZefEimlzTg99Nowzun9SGPX
	nuA/r8a4BLh9f5jToKHzNtX6lw==
X-Google-Smtp-Source: ABdhPJyP2nevtzphuD/vWEw+M2m6mFPJCE4e+m86zMI7FZzUv7e4m8bHDG1JfD1Vnvd9ydez6JVL7g==
X-Received: by 2002:a5d:6e0d:: with SMTP id h13mr12284474wrz.118.1624637599387;
        Fri, 25 Jun 2021 09:13:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:628a:47d1:4c03:7e6d? ([2001:8b0:aba:5f3c:628a:47d1:4c03:7e6d])
        by smtp.gmail.com with ESMTPSA id s18sm6540175wrw.33.2021.06.25.09.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 09:13:19 -0700 (PDT)
Message-ID: <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Cc: Alex Stewart <alex.stewart@ni.com>
Date: Fri, 25 Jun 2021 17:13:18 +0100
In-Reply-To: <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
	 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
	 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-25 at 17:45 +0200, Rasmus Villemoes wrote:
> On 25/06/2021 14.16, Richard Purdie wrote:
> > On Fri, 2021-06-25 at 09:37 +0200, Rasmus Villemoes via lists.openembedded.org wrote:
> > > I noticed that if I have an image recipe that says
> > > 
> > > IMAGE_INSTALL += "kernel-module-foo"
> > > 
> > > it fails as expected when the kernel hasn't been built with CONFIG_FOO=m.
> > > 
> > > However, if at the same time some other package which happens to get
> > > installed in the same image says
> > > 
> > > RRECOMMENDS_${PN} += "kernel-module-foo"
> > > 
> > > the image build silently succeeds, obviously without any foo.ko
> > > included. This doesn't seem right. [I'm well aware that the RRECOMMENDS
> > > line alone works as expected, this is about the case where both the
> > > above lines are in play.]
> > 
> > Which package backend are you using and does this happen if you
> > use a different one, particularly swapping ipk and rpm?
> > 
> > That might tell us if this is a package manager issue or a bitbake
> > metadata one.
> 
> I was using ipk. It seems to work as expected (i.e. fail the build) when
> using rpm.

That is probably a bug that needs opening against opkg in bugzilla then.
Added Alex to Cc: (opkg maintainer).

Cheers,

Richard

