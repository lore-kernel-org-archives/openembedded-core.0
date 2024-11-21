Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F52FD6ED0D
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 11:22:52 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.8364.1732188164101452067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 03:22:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=HsScjbBS;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso13579971fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 03:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732188162; x=1732792962; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8K5smtwrerh+ZnIXXRmEBjdTUsD+ER244vpmCGWiyk4=;
        b=HsScjbBSlmprN8A1saSSf+nqUrz1z2CIP8O/a9cUyjnXZtvYODJYBNmf47lllqUzXP
         3MYhNaM7twpnINxrNqmqtzMrLKVJQXgeWP5aqODB2N67B7mfVi8RFE/8j2N7q+55fPOr
         5hk0+lJfVdvJOhWfzDw7CoDwf/5S4klCxnphqnf93OLrQBVrF+k/mGchMYbhWnF2ylE+
         t6mJQdBiJOZoJNPIM2XGs8M1JCJBE0xjhsi6lC0gBc4PImZf6Ra5g+pu6A4vPPf/SDOv
         X3Fy8j9GS+KI3mXnY64t7wuBrcJ6hY0kcnrFVAQ8Sq1C7uIbU3FKGG74kAS8+f8NFwKP
         dT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732188162; x=1732792962;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8K5smtwrerh+ZnIXXRmEBjdTUsD+ER244vpmCGWiyk4=;
        b=dqrMDDY2gxiB3V4zgbnUiKqtJVKjuqNoRjaFplcUUqVPOe0woi4nm2o998wb2DOW8l
         mt87/huAkngtXuokChbOF4bMZOJwqQ6RIRRr2tr96KR+8TSySSdvzfW3lJwWN7xm0rbu
         oo8uzbUH9ac1G+Kk2IRCWAMQCGUisMSp8f2gQVdwzi78lxScss7Va/2I3a1Id6PAXA2K
         oquKHcCPiLUh3QbNit+hcIiLkAkvaLnwipnIWnqUQprcdj6M/y8e6DGcFhTBt347Sg7o
         W29VMxLLPrlzJ/1anwGd4h2QgtvcQBp8x9L4S+QQlXnz8fgTNvyKtCbIZWHMQC/3tavu
         apfA==
X-Forwarded-Encrypted: i=1; AJvYcCX1KIuvHXok/kp7YdfvJ59zmnrnt4NfiNhgq3XHiW+CPJnzi2fY5XRYRanBSdCULgRyVkgNziL4BokA4Ma5eU12Vw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzY07Pcmj3e6z9GqW9swdIRxaOs5p6CR76BLVjRfBZ88OAqb61S
	VEN5biRqc0mudIsgWtJUmXExR0ndj7klOrD6OpRx8VsH0xIjUqjIqEW/uggbLAY=
X-Google-Smtp-Source: AGHT+IHL3hs77JrnAokye0xcg51gjxLA2tZ+moVTp5kCR5Lp2v4fmd1QBG4cFcuWrVJQM4r7UqzySQ==
X-Received: by 2002:a05:651c:98b:b0:2fb:8c9a:fe3f with SMTP id 38308e7fff4ca-2ff8db9b548mr57527881fa.22.1732188162138;
        Thu, 21 Nov 2024 03:22:42 -0800 (PST)
Received: from nuoska (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff69967145sm18356861fa.55.2024.11.21.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 03:22:40 -0800 (PST)
Date: Thu, 21 Nov 2024 13:22:37 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Halstead <mhalstead@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Space optimizations in kirkstone and scarthgap for
 sstate objects
Message-ID: <Zz8X_Ru0s6U87A3N@nuoska>
References: <5065c40bca56ce56ab2584c77ed26883a0c972e0.camel@linuxfoundation.org>
 <Zz8Sx6-TzVwnYQJ3@nuoska>
 <a88e3f9bf38ddcc32cec143d1d9fb664b5a6e033.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a88e3f9bf38ddcc32cec143d1d9fb664b5a6e033.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 11:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207524

Hi,

On Thu, Nov 21, 2024 at 11:10:11AM +0000, Richard Purdie wrote:
> On Thu, 2024-11-21 at 13:00 +0200, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Thu, Nov 21, 2024 at 10:41:29AM +0000, Richard Purdie via lists.openembedded.org wrote:
> > > We've been trying to resolve some of our sstate CDN issues and one
> > > thing causing us big headaches are large sstate files. By far the worst
> > > offenders are webkitgtk and llvm.
> > > 
> > > In master (and in styhead) we have these:
> > > 
> > > https://git.yoctoproject.org/poky/commit/?id=d9066258a1e48e75cf814fb0940ac420bcdd6e99
> > > https://git.yoctoproject.org/poky/commit/?id=aca8acceb87e568115da9696732e915d91da9652
> > > https://git.yoctoproject.org/poky/commit/?id=1d8d9b1f87b21af36d9c328132f71c528eefd5b0
> > > 
> > > which did significantly reduce the size of the output. Unfortunately I
> > > made the first two work with changes to DEBUG_LEVELFLAG which are not
> > > suited for backporting:
> > > 
> > > https://git.yoctoproject.org/poky/commit/?id=1cf0974ad242f7eb2815a4ef0e3e5b6507ca56ea
> > > https://git.yoctoproject.org/poky/commit/?id=ae4ec59b3eff85aaa1cfe914a134e56e1d125744
> > > 
> > > I do think we should apply a similar tweak to kirkstone and scarthgap
> > > though. The third patch above shouldbackport. We should be able to do
> > > something equivalent for llvm. Any thoughts?
> > > 
> > > Michael obtained some sstate size info which I've shared below. You can
> > > tell the age by the sstate version number (10, 12 and 14 are kirkstone,
> > > scarthgap and styhead/master) and the recipe versions.
> > 
> > Can similar changes be done via the CI build scripts in the affected branches,
> > without modifying poky?
> 
> In theory, yes. I'm not sure we want to "hide" this kind of change
> though.

I understand, just wanted to show this as an option. Changes which are specific
to your infrastructure and which break stable rules could be considered
as specific to the CI build jobs you run, hence not hiding but keeping
such changes in CI scripts, which generate the build configurations
and matrixes and the local.conf's.

> > I would not mind breaking stable rules when it's about keeping upstream
> > infrastructure sane and running. Details can be documented to users if they
> > are impacted and need to revert those changes in their configuration.
> 
> If we do make a change, users would easily be able to reverse it
> locally if needed.
> 
> > Would be nice to know what kind of issues these are in detail and what is the CDN
> > implementation.
> 
> Most CDNs have object size limits so the setup cascades through
> different levels of completely different systems to cope with our large
> object sizes.�The CDNs themselves are not designed for large objects
> either, in their view we should split these into multiple smaller
> objects. That isn't really possible without rewriting the way bitbake
> works with sstate.
> 
> Objects are only pulled into the CDN at first request too, the larger
> the objects, the longer this takes. The setup has changed a bit as
> we've tried to work out how we can make it work. One issue was the size
> of the "pipe" between our servers and the CDN nodes. The new
> infrastructure/data centre location has resolved that potential
> bottleneck.

I've used "rsync sstate mirror from main server before build" as CDN
which did not break but underlying VMware virtual storage did break
under heavy bitbake load.

Cheers,

-Mikko

