Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11069EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 09:48:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.7802.1692784080171273142
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 02:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=iaGbBXxM;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-50087d47d4dso3277045e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 02:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692784078; x=1693388878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4RNEVLmS8x4L0Zw5y0jFe27AnTXNiXtRb+jp5vhgco=;
        b=iaGbBXxMdbhlwmxFE+znqoDAvxcWLZqQ7nM2AkONpSEFFCqzdnbvGcc/X03rK8q4wb
         2GmehBp4tQX4h6vTRylEIrMqak6IHXvGOSvPjWOXSJRT2PObYswvyaraCCBo/RKq4PM/
         IPkzaKVGTuuwgBIJB2rtFAgCyPh9HS+CHjtmRmh/KrXrmSizgyo3MkaaXU9I2GqnvF+n
         iu6qE/7M/N/asICDrqpyCpbAMENzyHOffYARMW/h06bTYvAEVK5qZr6QJLKr5DGoxAxf
         ucxExtroiiR7LA1mu9e7baztRHcaqm4iZGPd+NYQEJqMz9SBKCVNAetPyd+/Zts5ZQO+
         oE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692784078; x=1693388878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4RNEVLmS8x4L0Zw5y0jFe27AnTXNiXtRb+jp5vhgco=;
        b=eek/qijFpIG+zRxR9DFbvXXGYX6rbxx6VZ4n+RdgmXyMSFdsMDLU+xVp05qsN0fNVu
         MLBiFN7yQZPy738TXTW/I/wlDzgo5wvmlaesU0d8LdwewvmwFQQCgGNAhhJYidHMouO3
         FiMIOXogf/Qcm3Lz+2fmDxKZJBEHrjjDnKzGaAfm/X2aTXg5NhdyN+FxfnQExHHhJlK3
         K/YXAWuYuWci3k540kjBppJiUT3RpXeYhYSMmvU6rQQTkQ9aY4WOEVL1kO91yc8nvI0+
         EBBEFYSUVm2jTSGcuW19D7F08zNLsL9vrBLJ/ZWbW/SX7KAYYZPMsg2VjexVnEsO/VpX
         LCTw==
X-Gm-Message-State: AOJu0Yy9DlOjtTIMx1CW3chBApJedVdzzghItTHktQbMebtMO2CxPJeU
	GHAC1d31tjPZokjDJQ62jpGHcw==
X-Google-Smtp-Source: AGHT+IEIfuenMOrAPEQGA+O4OHraNaw4jUIFrVh3quqniTM3iljLVgRpe3BBDZblWgSweMJV+uTBZQ==
X-Received: by 2002:ac2:4c45:0:b0:4f8:78c9:4f00 with SMTP id o5-20020ac24c45000000b004f878c94f00mr10933145lfk.20.1692784078309;
        Wed, 23 Aug 2023 02:47:58 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id u13-20020ac243cd000000b004fbc6a8ad08sm301297lfl.306.2023.08.23.02.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 02:47:57 -0700 (PDT)
Date: Wed, 23 Aug 2023 12:47:55 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
Message-ID: <ZOXVyxiqDDnjCp61@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
 <ZOW1tEl+PiOK09l/@nuoska>
 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186564

Hi,

On Wed, Aug 23, 2023 at 10:06:41AM +0100, Richard Purdie wrote:
> On Wed, 2023-08-23 at 10:31 +0300, Mikko Rapeli wrote:
> > Hi,
> > 
> > On Tue, Aug 22, 2023 at 11:25:58PM -0700, Khem Raj wrote:
> > > will this work when running multiple instances of qemu ?
> > > e.g.  try bitbake core-image-ptest-all
> > 
> > I was not aware of core-image-ptest-all. Tried to build it but it doesn't
> > seem to be compatible with IMAGE_FEATURES += "ssh-server-dropbear" which is
> > needed to test core-image-minimal:
> > 
> > Error: 
> >  Problem: package packagegroup-core-ssh-dropbear-1.0-r1.noarch from oe-repo requires dropbear, but none of the providers can be installed
> >   - package dropbear-2022.83-r0.core2_64 from oe-repo conflicts with openssh provided by openssh-9.3p2-r0.core2_64 from oe-repo
> >   - package openssh-9.3p2-r0.core2_64 from oe-repo conflicts with dropbear provided by dropbear-2022.83-r0.core2_64 from oe-repo
> >   - conflicting requests
> > (try to add '--allowerasing' to command line to replace conflicting packages or '--skip-broken' to skip uninstallable packages)
> > 
> > oeqa runtime testing core-image-minimal without ssh server doesn't make sense as all tests will
> > just be skipped.
> 
> The autobuilder actually does that, the minimal image is just tested
> with the small number of non-network tests. The main thing was to test
> it does actually boot to a login prompt. We have other tests which test
> the other areas with other images.

Yes, granted it's enough to test that boot to serial console login works.

> The reason for the above is that there will be ptest openssh images
> which conflict with the dropbear ones. You can likely avoid that by
> using:
> 
> IMAGE_FEATURES:append:pn-core-image-minimal =  " ssh-server-dropbear"
> 
> The ptest images are designed to only include the ptest in question so
> in theory are otherwise as minimal as the dependencies allow.

Alright, this I could try. But I fear there is a log more missing from my
plain poky and default machine target to get the selftests and tests running.
This magic is somewhere in the autobuilder related git repositories, but from plain
poky checkout with a specific commit from master branch I don't know which versions
and repos to use so that the tests would be passing.

With these modifications in local.conf:

IMAGE_CLASSES += "testimage"
TEST_RUNQEMUPARAMS += "slirp"
IMAGE_FEATURES += "ssh-server-dropbear"
# update kernel to latest available in poky
PREFERRED_VERSION_linux-yocto = ""
SANITY_TESTED_DISTROS = ""

at least runtime_test.TestImage are passing with slirp now.

Without MAGE_FEATURES += "ssh-server-dropbear", "bitbake core-image-ptest-all" now succeeds
and "bitbake -c testimage core-image-ptest-all" is running the tests, seeminly in series.
At least there are no multiple qemu instances running in parallel and no failures related to
slirp ssh port being reserved by a single qemu instance. But the tests are reporting only skips
so maybe the autobuilder scripts have some settings which I don't have correctly set:

Cannot run ptests without @expectedFailure as ptests are expected to fail
QMP released QEMU at 08/23/23 10:26:03 and took 0.13 seconds from connect
Cannot run ptests without @expectedFailure as ptests are expected to fail
QMP connected to QEMU at 08/23/23 10:26:04 and took 0.60 seconds
QMP released QEMU at 08/23/23 10:26:04 and took 0.13 seconds from connect
Cannot run ptests without @expectedFailure as ptests are expected to fail
RESULTS:
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.30s)
RESULTS - ping.PingTest.test_ping: PASSED (0.04s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (1.55s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (1.01s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
SUMMARY:
core-image-ptest-libtry-tiny-perl () - Ran 5 tests in 7.208s
core-image-ptest-libtry-tiny-perl - OK - All required tests passed (successes=3, skipped=1, failures=0, errors=0)

The ptest execution seems to be skipped for all images.

Cheers,

-Mikko

