Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A5CEEE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 13:17:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.11200.1692796641441437091
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 06:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JRhh9PqG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fef34c33d6so25878335e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692796639; x=1693401439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gHrgypnyAo52bEl/vZ67L2btZvCXQTlR+1UemVnBOwE=;
        b=JRhh9PqG5xu+sWVIeqZHkK6JCuHv46AWnVTfqrNJkrpirQ+m1XTCzdC2rmD3cEgZS/
         8nDqRSr4Z0Iy6npHoTzPLJ0ib/No+6RtDlAd5sGzb74uc8tavB3vHNBtcSepUIf5snrq
         zYi7xvvfCikF2fW3ZqqSY8iWjDsDig1tEvEP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692796639; x=1693401439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gHrgypnyAo52bEl/vZ67L2btZvCXQTlR+1UemVnBOwE=;
        b=GAJL0bLkn3Q5563qRyQG/mdDXaVv8vd7Yy7Bj3BAfQIqJt+FXJarI+VdhtS08vceXf
         cxktemUVaEnopXeu8B35atuAaCvLGWZ47UO5IeQwjcqhzJ1v1jWHiy63tyBAB2yyS4pV
         gq9LFqsVYu9K7/D34yJcbDHpS9ArXtXkFvGIX8aM6BKzVZmIpWvxYTgjBEuDNSG9nm7n
         RTmK6/tugXVl7S0dRiqxTaqKdmqXkaV42oHhCRGW7hi7JbKgQ+N39TLaKbIRuF5wUEMr
         h4FaJ9Ag6lQ2jy/mZxX+LOmBlmFUwKMSWxMiQdMD7+wJ6SGsTHoCMZTeniugm5jvfNqy
         GhWQ==
X-Gm-Message-State: AOJu0Yxqe5Fp+friqNbBaGR4oon+j0axJselFBRI6HJKECMMZLEP4FXy
	ttTUTyo/rIdLIZWjZSRJVjH6Dw==
X-Google-Smtp-Source: AGHT+IEtNySyXidMFnGMvKFusaBGHd9wYltRT/AH9ifXRVzM41jU863coBUhqHXnt3jLHaqjEPzd4A==
X-Received: by 2002:adf:efc9:0:b0:313:f235:cd17 with SMTP id i9-20020adfefc9000000b00313f235cd17mr8822130wrp.40.1692796639461;
        Wed, 23 Aug 2023 06:17:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af? ([2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af])
        by smtp.gmail.com with ESMTPSA id x9-20020adfffc9000000b00319756d5b80sm19229352wrs.29.2023.08.23.06.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 06:17:18 -0700 (PDT)
Message-ID: <835e38056061edca51f6f06ebc96bdfcf8c05fab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2023 14:17:18 +0100
In-Reply-To: <ZOXxzodhl2XrcrL7@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
	 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
	 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
	 <ZOW1tEl+PiOK09l/@nuoska>
	 <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
	 <ZOXVyxiqDDnjCp61@nuoska>
	 <32d947d25f3dcddefd458426efd026be7c62a830.camel@linuxfoundation.org>
	 <ZOXxzodhl2XrcrL7@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 13:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186575

On Wed, 2023-08-23 at 14:47 +0300, Mikko Rapeli wrote:
> On Wed, Aug 23, 2023 at 11:49:39AM +0100, Richard Purdie wrote:
> > On Wed, 2023-08-23 at 12:47 +0300, Mikko Rapeli wrote:
> > > On Wed, Aug 23, 2023 at 10:06:41AM +0100, Richard Purdie wrote:
> > > > On Wed, 2023-08-23 at 10:31 +0300, Mikko Rapeli wrote:
> > > > > Hi,
> > > > >=20
> > > > > On Tue, Aug 22, 2023 at 11:25:58PM -0700, Khem Raj wrote:
> > > > > > will this work when running multiple instances of qemu ?
> > > > > > e.g.  try bitbake core-image-ptest-all
> > > > >=20
> > > > > I was not aware of core-image-ptest-all. Tried to build it but it=
 doesn't
> > > > > seem to be compatible with IMAGE_FEATURES +=3D "ssh-server-dropbe=
ar" which is
> > > > > needed to test core-image-minimal:
> > > > >=20
> > > > > Error:=20
> > > > >  Problem: package packagegroup-core-ssh-dropbear-1.0-r1.noarch fr=
om oe-repo requires dropbear, but none of the providers can be installed
> > > > >   - package dropbear-2022.83-r0.core2_64 from oe-repo conflicts w=
ith openssh provided by openssh-9.3p2-r0.core2_64 from oe-repo
> > > > >   - package openssh-9.3p2-r0.core2_64 from oe-repo conflicts with=
 dropbear provided by dropbear-2022.83-r0.core2_64 from oe-repo
> > > > >   - conflicting requests
> > > > > (try to add '--allowerasing' to command line to replace conflicti=
ng packages or '--skip-broken' to skip uninstallable packages)
> > > > >=20
> > > > > oeqa runtime testing core-image-minimal without ssh server doesn'=
t make sense as all tests will
> > > > > just be skipped.
> > > >=20
> > > > The autobuilder actually does that, the minimal image is just teste=
d
> > > > with the small number of non-network tests. The main thing was to t=
est
> > > > it does actually boot to a login prompt. We have other tests which =
test
> > > > the other areas with other images.
> > >=20
> > > Yes, granted it's enough to test that boot to serial console login wo=
rks.
> > >=20
> > > > The reason for the above is that there will be ptest openssh images
> > > > which conflict with the dropbear ones. You can likely avoid that by
> > > > using:
> > > >=20
> > > > IMAGE_FEATURES:append:pn-core-image-minimal =3D  " ssh-server-dropb=
ear"
> > > >=20
> > > > The ptest images are designed to only include the ptest in question=
 so
> > > > in theory are otherwise as minimal as the dependencies allow.
> > >=20
> > > Alright, this I could try. But I fear there is a log more missing fro=
m my
> > > plain poky and default machine target to get the selftests and tests =
running.
> >=20
> > There is no secret magic config the autobuilder uses. You keep asking
> > me for this and there isn't anything. It is actually starting to annoy
> > me a bit as there isn't anything "hidden".
>=20
> If I can't run the tests for poky the way yocto upstream does, then I'm a=
fraid
> I can't really help with the issues you've seeing with the tests.

If that isn't possible we need to fix the docs.

> > The configurations used are all from this file:
> >=20
> > https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json
>=20
> Ok so https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/=
1948
> for example uses yocto-autobuilder-helper at commit
> af5d072a654a060c3ee61b5f394f52632e20200b. And the full repo
> URL is visible not in the snippet there but in the full stdio download
> of "Fetch yocto-autobuilder-helper" step. It was the web UI confusing me.
>=20
> I'm sorry if these are all obvious to you and other developers but not
> to me.
>=20
> > Yes, there is a block of high level config around numbers of threads,
> > disk space monitoring, pressure regulation values and so on but we
> > purposefully keep the config to be as close to standard poky as we can.
> >=20
> > When we run selftest we do a couple of things. Firstly we split the
> > machine and toolchain targets into separate areas.  We also split
> > reproducibility to it's own target and test mirroring elsewhere too.
> > This results in a slightly more complex selftest invocation:
> >=20
> > OEQA_DEBUGGING_SAVED_OUTPUT=3D${BASE_SHAREDDIR}/pub/repro-fail/ DISPLAY=
=3D:1 oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg build=
options.SourceMirroring.test_yocto_source_mirror reproducible -T machine -T=
 toolchain-user -T toolchain-system -j 15
> >=20
> > The only test which I don't think we run anywhere any more is the
> > test_checkpkg target.
> >=20
> > You can see all this from the logs buildbot shows from it's UI on the
> > autobuilder too.
>=20
> Thanks, this explains alot!
>=20
> I'm still wondering how the build hosts are setup with "modprobe vgem" an=
d that
> build user account is in "render" group (on Ubuntu at least). Should thes=
e
> be added to some documentation too?

Yes, they should.

>=20
> > > This magic is somewhere in the autobuilder related git repositories, =
but from plain
> > > poky checkout with a specific commit from master branch I don't know =
which versions
> > > and repos to use so that the tests would be passing.
> > >=20
> > > With these modifications in local.conf:
> > >=20
> > > IMAGE_CLASSES +=3D "testimage"
> > > TEST_RUNQEMUPARAMS +=3D "slirp"
> >=20
> > We do not use slirp on the autobuilder. We never have and we're
> > unlikely ever to do so and it is not something we officially support
> > for this. This is likely the biggest source of problems.
>=20
> Sadly I can't figure out how to setup runqemu and testimage.bbclass and
> oe-selftests networking without slirp and for my testing needs it has bee=
n good
> enough, now also with oe-selftests.

As root you need to run:

runqemu-gen-tapdevs <uid> <gid> <number tap devs>

where uid is your user ID and gid is the group you want to be able to
access those devices. Once done once at boot, the builds will use those
devices. The autobuilder has these pre-setup.

You raise a good point that this should be documented, probably in the
testing manual. As we're all aware, documentation is hard so we should
either file a bug for that (and the vgem issue) or write a docs patch.

https://docs.yoctoproject.org/test-manual/index.html

> > I appreciate that gives some networking challenges for people in
> > constrained environments but we did that primarily to allow for
> > simplifications in the rest of the setup.
> >=20
> > > IMAGE_FEATURES +=3D "ssh-server-dropbear"
> >=20
> > I've already explained that this one does likely cause problems. We
> > simply don't run many tests against minimal images.=20
> >=20
> > > # update kernel to latest available in poky
> > > PREFERRED_VERSION_linux-yocto =3D ""
> >=20
> > Not sure why this is needed?
>=20
> I'm trying to test the 6.4 kernel update and reproduce the issues you've =
seen
> there too.

Ok, I did change the default to 6.4 now.

> > > SANITY_TESTED_DISTROS =3D ""
> >=20
> > This one we've discussed. It really should be fixed in a better way but
> > isn't anywhere near the top of the priority list.
>=20
> I'll try to get to this.

Thanks,

Richard

