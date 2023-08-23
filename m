Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13B6EE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 11:47:36 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.9361.1692791251660962722
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 04:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jNofii7/;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so44137651fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 04:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692791250; x=1693396050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kOIeQ21lLViRzCKsCxHbk9sHdNnJOyrqRRkrtGPWsZQ=;
        b=jNofii7/O2JHFoZcgShRf3l0p+7ZVGdYH71iUW43NXzbXE/nL4HFazfouq33J7NHHv
         XgdAuXsnp2/oUX1TI18rFvk89USf4mCfP9heXmoeqLVpzpnxeRknV3y0hnJ3Wo5TDe26
         EHDZIDlA86OW+6hlnc/99yCRhkswcpFyCD5HeXztQ8AU5U/s3UZOTrYfsTXGNFH5auLC
         8JtGzHJOpkBP6pzMeg3+y85eRWloL8Cb9N4c/cmZm+aJ8zNnh63oWjdLKfUM1RmgmS1j
         I3AtDzcXYkXHKP0J9hjjjdH9nRra0iyYQdJhlrjHR7CLl/O8UdKMFadGqK1Ft7pBMGNQ
         PrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692791250; x=1693396050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOIeQ21lLViRzCKsCxHbk9sHdNnJOyrqRRkrtGPWsZQ=;
        b=alXZGllt9GYqccHf3zD8CvRJ6seSpha9IMNHtY9uFIzFMEXoXCeOy7dWQ6PQUi3C7l
         hyguUq5U4qv5xKx9+i5ZdENREkzoGMbiTmEXjkxlUcwYOPSiCHAugFkYVDot8VyXC6HX
         8TiOvos8RZnYrJegHYrB6EBjOHxemRwDmHaP5utdbej2sqmIh6YPXpu0Gwx4zxKlEOXo
         lFDzDAp776HKnvMZQszEYssl5px5as2GqwN0l5nmD3eGtIWMg6u9sEhx6uYBzQ8BlwtP
         kY1bJ+dgx3GQ+D+R2YRbwz9DFxyg7c4lKXAMnJ52oXbD0/utwWSySPYrOBlHXOty4uEY
         Z+bA==
X-Gm-Message-State: AOJu0Yyug8n8X7iswBJyz4FlOTOcScg6jmO2VcC52OQbcEfkwqPzwKdR
	6HePL8/ForPM/SDNVT0DwuwFEA==
X-Google-Smtp-Source: AGHT+IF+zdouMyM2ctZPWe5kxvXsu8tHkczDBXPzlvG/Nvox7kT021ZV0lTfScKc1ITjTayyUDqdug==
X-Received: by 2002:a2e:3c0e:0:b0:2b6:3651:f12f with SMTP id j14-20020a2e3c0e000000b002b63651f12fmr9853025lja.3.1692791249780;
        Wed, 23 Aug 2023 04:47:29 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id i4-20020a2e8644000000b002b6d781b60esm1841531ljj.82.2023.08.23.04.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 04:47:28 -0700 (PDT)
Date: Wed, 23 Aug 2023 14:47:26 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZOXxzodhl2XrcrL7@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
 <ZOW1tEl+PiOK09l/@nuoska>
 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
 <ZOXVyxiqDDnjCp61@nuoska>
 <32d947d25f3dcddefd458426efd026be7c62a830.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32d947d25f3dcddefd458426efd026be7c62a830.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 11:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186572

Hi,

On Wed, Aug 23, 2023 at 11:49:39AM +0100, Richard Purdie wrote:
> On Wed, 2023-08-23 at 12:47 +0300, Mikko Rapeli wrote:
> > On Wed, Aug 23, 2023 at 10:06:41AM +0100, Richard Purdie wrote:
> > > On Wed, 2023-08-23 at 10:31 +0300, Mikko Rapeli wrote:
> > > > Hi,
> > > > 
> > > > On Tue, Aug 22, 2023 at 11:25:58PM -0700, Khem Raj wrote:
> > > > > will this work when running multiple instances of qemu ?
> > > > > e.g.  try bitbake core-image-ptest-all
> > > > 
> > > > I was not aware of core-image-ptest-all. Tried to build it but it doesn't
> > > > seem to be compatible with IMAGE_FEATURES += "ssh-server-dropbear" which is
> > > > needed to test core-image-minimal:
> > > > 
> > > > Error: 
> > > >  Problem: package packagegroup-core-ssh-dropbear-1.0-r1.noarch from oe-repo requires dropbear, but none of the providers can be installed
> > > >   - package dropbear-2022.83-r0.core2_64 from oe-repo conflicts with openssh provided by openssh-9.3p2-r0.core2_64 from oe-repo
> > > >   - package openssh-9.3p2-r0.core2_64 from oe-repo conflicts with dropbear provided by dropbear-2022.83-r0.core2_64 from oe-repo
> > > >   - conflicting requests
> > > > (try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)
> > > > 
> > > > oeqa runtime testing core-image-minimal without ssh server doesn't make sense as all tests will
> > > > just be skipped.
> > > 
> > > The autobuilder actually does that, the minimal image is just tested
> > > with the small number of non-network tests. The main thing was to test
> > > it does actually boot to a login prompt. We have other tests which test
> > > the other areas with other images.
> > 
> > Yes, granted it's enough to test that boot to serial console login works.
> > 
> > > The reason for the above is that there will be ptest openssh images
> > > which conflict with the dropbear ones. You can likely avoid that by
> > > using:
> > > 
> > > IMAGE_FEATURES:append:pn-core-image-minimal =  " ssh-server-dropbear"
> > > 
> > > The ptest images are designed to only include the ptest in question so
> > > in theory are otherwise as minimal as the dependencies allow.
> > 
> > Alright, this I could try. But I fear there is a log more missing from my
> > plain poky and default machine target to get the selftests and tests running.
> 
> There is no secret magic config the autobuilder uses. You keep asking
> me for this and there isn't anything. It is actually starting to annoy
> me a bit as there isn't anything "hidden".

If I can't run the tests for poky the way yocto upstream does, then I'm afraid
I can't really help with the issues you've seeing with the tests.

> The configurations used are all from this file:
> 
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

Ok so https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1948
for example uses yocto-autobuilder-helper at commit
af5d072a654a060c3ee61b5f394f52632e20200b. And the full repo
URL is visible not in the snippet there but in the full stdio download
of "Fetch yocto-autobuilder-helper" step. It was the web UI confusing me.

I'm sorry if these are all obvious to you and other developers but not
to me.

> Yes, there is a block of high level config around numbers of threads,
> disk space monitoring, pressure regulation values and so on but we
> purposefully keep the config to be as close to standard poky as we can.
>
> When we run selftest we do a couple of things. Firstly we split the
> machine and toolchain targets into separate areas.  We also split
> reproducibility to it's own target and test mirroring elsewhere too.
> This results in a slightly more complex selftest invocation:
> 
> OEQA_DEBUGGING_SAVED_OUTPUT=${BASE_SHAREDDIR}/pub/repro-fail/ DISPLAY=:1 oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg buildoptions.SourceMirroring.test_yocto_source_mirror reproducible -T machine -T toolchain-user -T toolchain-system -j 15
> 
> The only test which I don't think we run anywhere any more is the
> test_checkpkg target.
> 
> You can see all this from the logs buildbot shows from it's UI on the
> autobuilder too.

Thanks, this explains alot!

I'm still wondering how the build hosts are setup with "modprobe vgem" and that
build user account is in "render" group (on Ubuntu at least). Should these
be added to some documentation too?

> > This magic is somewhere in the autobuilder related git repositories, but from plain
> > poky checkout with a specific commit from master branch I don't know which versions
> > and repos to use so that the tests would be passing.
> > 
> > With these modifications in local.conf:
> > 
> > IMAGE_CLASSES += "testimage"
> > TEST_RUNQEMUPARAMS += "slirp"
> 
> We do not use slirp on the autobuilder. We never have and we're
> unlikely ever to do so and it is not something we officially support
> for this. This is likely the biggest source of problems.

Sadly I can't figure out how to setup runqemu and testimage.bbclass and
oe-selftests networking without slirp and for my testing needs it has been good
enough, now also with oe-selftests.

> I appreciate that gives some networking challenges for people in
> constrained environments but we did that primarily to allow for
> simplifications in the rest of the setup.
> 
> > IMAGE_FEATURES += "ssh-server-dropbear"
> 
> I've already explained that this one does likely cause problems. We
> simply don't run many tests against minimal images. 
>
> > # update kernel to latest available in poky
> > PREFERRED_VERSION_linux-yocto = ""
> 
> Not sure why this is needed?

I'm trying to test the 6.4 kernel update and reproduce the issues you've seen
there too.

> > SANITY_TESTED_DISTROS = ""
> 
> This one we've discussed. It really should be fixed in a better way but
> isn't anywhere near the top of the priority list.

I'll try to get to this.

Cheers,

-Mikko

