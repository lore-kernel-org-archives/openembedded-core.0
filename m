Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4688DEE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:49:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.8575.1692787782414795045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RpPjdV83;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31969580797so4882143f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692787781; x=1693392581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/xtBoGOWAN7jMJPn86JAnK94f4H0CxTcGkIZkRFtKVA=;
        b=RpPjdV83R+EgepKyJnONSCm4gaoRll7IEdLC+E+89+m1McbzPvyQPnAq7j0A3IFslC
         VhUALmSuMoySKeklyPX/uIERuYgmdZRPNLKXO4sofwzzuTXUwXNrrIinFVUd3/V8Kws+
         HipwFScv+xsmzsnw2M0khrtpg0vt5HpRd2Iuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692787781; x=1693392581;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xtBoGOWAN7jMJPn86JAnK94f4H0CxTcGkIZkRFtKVA=;
        b=TQn4WrKG9qcwChXQ2iqE4M1Y2f0z7dEzPWqyPNFgYGaRvaEhllxHjXy+I2eQM2x95q
         mNR0Y0T7ZcEMBT/XKA+PVavzSKkZHpVaNhzx42+6suRSaSdSABRQ9S4Jwuzp7VMoicvq
         ZORE4zris0ChHdaV0tIgyCrXPmZw8HDnSweJmVhQRoL7f+wZmBjt3uslRbkFK209J1uF
         7kBPnk3gSYj2l6ASZdTsdrq0t6QqJYfJHr0CU4y7rGDOMxu1gsNW0vcQALZOYc3XkiMS
         B+T+FQAfR5vtJWuO7xNy6Ha4Nh5S9QaQFiCi85GKsZZglWE5pVjj2qPKxcDKS0aFIm+v
         hnFA==
X-Gm-Message-State: AOJu0YySpwiOosJxRlwzO86QfFxhTXQbmvkM9icnPIUm3MX3wURunYNS
	Gho/XsK21iBTI0x2HMTUSMWBVg==
X-Google-Smtp-Source: AGHT+IHK+rBS4aGF7dK8wiXW05OLhoPpPOczDbZ/DwJURi+N1giTvMmMiRlEgZFwwNqgR962FNgyFQ==
X-Received: by 2002:a05:6000:8b:b0:314:36f0:2214 with SMTP id m11-20020a056000008b00b0031436f02214mr7956083wrx.6.1692787780788;
        Wed, 23 Aug 2023 03:49:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af? ([2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d630e000000b0031980783d78sm18546379wru.54.2023.08.23.03.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 03:49:40 -0700 (PDT)
Message-ID: <32d947d25f3dcddefd458426efd026be7c62a830.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2023 11:49:39 +0100
In-Reply-To: <ZOXVyxiqDDnjCp61@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
	 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
	 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
	 <ZOW1tEl+PiOK09l/@nuoska>
	 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
	 <ZOXVyxiqDDnjCp61@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 10:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186570

On Wed, 2023-08-23 at 12:47 +0300, Mikko Rapeli wrote:
> On Wed, Aug 23, 2023 at 10:06:41AM +0100, Richard Purdie wrote:
> > On Wed, 2023-08-23 at 10:31 +0300, Mikko Rapeli wrote:
> > > Hi,
> > >=20
> > > On Tue, Aug 22, 2023 at 11:25:58PM -0700, Khem Raj wrote:
> > > > will this work when running multiple instances of qemu ?
> > > > e.g.  try bitbake core-image-ptest-all
> > >=20
> > > I was not aware of core-image-ptest-all. Tried to build it but it doe=
sn't
> > > seem to be compatible with IMAGE_FEATURES +=3D "ssh-server-dropbear" =
which is
> > > needed to test core-image-minimal:
> > >=20
> > > Error:=20
> > >  Problem: package packagegroup-core-ssh-dropbear-1.0-r1.noarch from o=
e-repo requires dropbear, but none of the providers can be installed
> > >   - package dropbear-2022.83-r0.core2_64 from oe-repo conflicts with =
openssh provided by openssh-9.3p2-r0.core2_64 from oe-repo
> > >   - package openssh-9.3p2-r0.core2_64 from oe-repo conflicts with dro=
pbear provided by dropbear-2022.83-r0.core2_64 from oe-repo
> > >   - conflicting requests
> > > (try to add '--allowerasing' to command line to replace conflicting p=
ackages or '--skip-broken' to skip uninstallable packages)
> > >=20
> > > oeqa runtime testing core-image-minimal without ssh server doesn't ma=
ke sense as all tests will
> > > just be skipped.
> >=20
> > The autobuilder actually does that, the minimal image is just tested
> > with the small number of non-network tests. The main thing was to test
> > it does actually boot to a login prompt. We have other tests which test
> > the other areas with other images.
>=20
> Yes, granted it's enough to test that boot to serial console login works.
>=20
> > The reason for the above is that there will be ptest openssh images
> > which conflict with the dropbear ones. You can likely avoid that by
> > using:
> >=20
> > IMAGE_FEATURES:append:pn-core-image-minimal =3D  " ssh-server-dropbear"
> >=20
> > The ptest images are designed to only include the ptest in question so
> > in theory are otherwise as minimal as the dependencies allow.
>=20
> Alright, this I could try. But I fear there is a log more missing from my
> plain poky and default machine target to get the selftests and tests runn=
ing.

There is no secret magic config the autobuilder uses. You keep asking
me for this and there isn't anything. It is actually starting to annoy
me a bit as there isn't anything "hidden".

The configurations used are all from this file:

https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json

Yes, there is a block of high level config around numbers of threads,
disk space monitoring, pressure regulation values and so on but we
purposefully keep the config to be as close to standard poky as we can.

When we run selftest we do a couple of things. Firstly we split the
machine and toolchain targets into separate areas.  We also split
reproducibility to it's own target and test mirroring elsewhere too.
This results in a slightly more complex selftest invocation:

OEQA_DEBUGGING_SAVED_OUTPUT=3D${BASE_SHAREDDIR}/pub/repro-fail/ DISPLAY=3D:=
1 oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg buildopti=
ons.SourceMirroring.test_yocto_source_mirror reproducible -T machine -T too=
lchain-user -T toolchain-system -j 15

The only test which I don't think we run anywhere any more is the
test_checkpkg target.

You can see all this from the logs buildbot shows from it's UI on the
autobuilder too.

> This magic is somewhere in the autobuilder related git repositories, but =
from plain
> poky checkout with a specific commit from master branch I don't know whic=
h versions
> and repos to use so that the tests would be passing.
>=20
> With these modifications in local.conf:
>=20
> IMAGE_CLASSES +=3D "testimage"
> TEST_RUNQEMUPARAMS +=3D "slirp"

We do not use slirp on the autobuilder. We never have and we're
unlikely ever to do so and it is not something we officially support
for this. This is likely the biggest source of problems.

I appreciate that gives some networking challenges for people in
constrained environments but we did that primarily to allow for
simplifications in the rest of the setup.

> IMAGE_FEATURES +=3D "ssh-server-dropbear"

I've already explained that this one does likely cause problems. We
simply don't run many tests against minimal images.=20

> # update kernel to latest available in poky
> PREFERRED_VERSION_linux-yocto =3D ""

Not sure why this is needed?

> SANITY_TESTED_DISTROS =3D ""

This one we've discussed. It really should be fixed in a better way but
isn't anywhere near the top of the priority list.

> at least runtime_test.TestImage are passing with slirp now.
>=20
> Without MAGE_FEATURES +=3D "ssh-server-dropbear", "bitbake core-image-pte=
st-all" now succeeds
> and "bitbake -c testimage core-image-ptest-all" is running the tests, see=
minly in series.
> At least there are no multiple qemu instances running in parallel and no =
failures related to
> slirp ssh port being reserved by a single qemu instance. But the tests ar=
e reporting only skips
> so maybe the autobuilder scripts have some settings which I don't have co=
rrectly set:
>=20
> Cannot run ptests without @expectedFailure as ptests are expected to fail
> QMP released QEMU at 08/23/23 10:26:03 and took 0.13 seconds from connect
> Cannot run ptests without @expectedFailure as ptests are expected to fail
> QMP connected to QEMU at 08/23/23 10:26:04 and took 0.60 seconds
> QMP released QEMU at 08/23/23 10:26:04 and took 0.13 seconds from connect
> Cannot run ptests without @expectedFailure as ptests are expected to fail
> RESULTS:
> RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.30s)
> RESULTS - ping.PingTest.test_ping: PASSED (0.04s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (1.55=
s)
> RESULTS - ssh.SSHTest.test_ssh: PASSED (1.01s)
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (=
0.00s)
> SUMMARY:
> core-image-ptest-libtry-tiny-perl () - Ran 5 tests in 7.208s
> core-image-ptest-libtry-tiny-perl - OK - All required tests passed (succe=
sses=3D3, skipped=3D1, failures=3D0, errors=3D0)
>=20
> The ptest execution seems to be skipped for all images.

I think Alex covers this.

You can compare it to what is shown on the autobuilder output. You can
also compare the testresults.json file too using "resulttool report" to
compare results with what the autobuilder runs.

Cheers,

Richard

