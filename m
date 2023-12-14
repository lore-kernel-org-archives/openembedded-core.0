Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42A2C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 18:30:20 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.30895.1702578613322498351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 10:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZNN90sEu;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-20308664c13so2203299fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702578612; x=1703183412; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QetASKZewsl/SVZaczrwOedB50SATM0BRAON9Ictf9o=;
        b=ZNN90sEu1AaFmB8IeltCmjKJ9Orh92GymKiZQ/yC0tQhLYoV4sxu02axoAVWQUUaaA
         Vdgtv3uLiL1sfbSZRPwp2Flmw2+/okxXVhShVSm7zH7WfOXHWf1StkOMf2AW2rA7tRlS
         +e3dAtU4jKCyDlURnspmwPOvmph8SUlkXmBFFadQtdDqtrEJc/X7utrmVSAVIyf6ONOL
         2q/yOiKKwDnMdDOvYVYPklNjKwhqkyi6uEYIRHqFD2rtFGmNRRp8Fqxe/saVGrZOS5lN
         7KUkIPPkNRjKRYrdhMP+IRqefoIY6pgvvfEQQzUrBC9b8luyyaG/amF6QLkQCrISPEG4
         SAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702578612; x=1703183412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QetASKZewsl/SVZaczrwOedB50SATM0BRAON9Ictf9o=;
        b=OPg/P2S3Q5bnpXy2ixf2Zd9w9HddQe0zDxABda3W24k9a6KaXrwxcJPpDsLxONIGfT
         CQ/JHfT1Dq4QUeNLaFifpk2Wje8fITX5Ytpmbclz3Hdu1fS1XndjAi12Vdx7QVKSgRUO
         DMRFXEoAVSIbRrZAqvYqj21zidnorZu7NS/ngPpBdn7dQ6lAlSq+kyDF584Vcg71Wt4D
         Xs5bC+IC3KigMSMGPmyeuLyJExp/S8OmN5Q1fM/cpquOut6whQsUeKdyG3FQ1nkoP6n/
         VPit/INf3XlBS0JkzdyCmkEiB+pra/lfhXK3w9OTgrdcbQ+5MdSP7wbLk54oF+22/bF5
         2Eqg==
X-Gm-Message-State: AOJu0YzWSOxzacX7VRFEMaq3I/zlYOk3Gekb6s3IBKAeLVwV4Ic/R4hs
	LqGGiH6lZ+pupb4s03e/nRzkSn+0mJXQ1/LnDMk=
X-Google-Smtp-Source: AGHT+IGVsR3Bg2SIRUa6nru9SsS8PdT0VqdQPiZEXmMUqVJ326Gxz4LS/aCBDFKbPI9vyzmiOs24sJ4sbZcJhr0Vs5o=
X-Received: by 2002:a05:6870:9708:b0:203:39f3:3a2 with SMTP id
 n8-20020a056870970800b0020339f303a2mr2730097oaq.119.1702578612498; Thu, 14
 Dec 2023 10:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com> <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
In-Reply-To: <6cfb111def75c0f1549e7f004deac4e8a44365cf.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 10:29:46 -0800
Message-ID: <CAMKF1sp0W6W7dkGYCF--VVMqSvMKJBrWh=yRjRAX4s2Tfhj+wA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 18:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192398

On Thu, Dec 14, 2023 at 1:50=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2023-12-14 at 10:09 +0100, Alexander Kanavin wrote:
> > On Wed, 13 Dec 2023 at 09:57, Yoann Congal <yoann.congal@smile.fr> wrot=
e:
> > >
> > > The bluetooth support adds a bluez5 dependency (and,recursively, a lo=
t
> > > of other stuff). Disable it by default to avoid having to build all o=
f
> > > this when it is not needed.
> > >
> > > This decrease the number of tasks run for a core-image-minimal build =
by
> > > ~1000 (-21%).
> > >
> > > To re-enable bluetooth support in strace, add "bluez" to strace
> > > PACKAGECONFIG. For example, in local.conf:
> > >   PACKAGECONFIG:append:pn-strace =3D " bluez"
> > >
> > > Fixes [YOCTO #15323]
> >
> > I'm afraid I have to raise objections.
> >
> > First, this needs an explanation: what functionality in strace does
> > this disable? Is that functionality important from the point of having
> > bluetooth in DISTRO_FEATURES? Not respecting DISTRO_FEATURES sets a
> > bad precedent, and should be more carefully justified and treated as
> > an exception.
>
> This was raised as a question on the call on Tuesday. I appreciate you
> weren't there and the commit message above does give the reasoning but
> let me elaborate.
>
> The bluez support in strace is basically for protocol decoding. This is
> not something most users of strace use, I personally can never remember
> using it. Yes, if you need it, it is extremely useful. If you know how
> to debug bluetooth wireless, you can probably work out how to turn on
> the packageconfig.

For more context see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D88=
2413

>
> The downside to having this enabled by default is a significant
> dependency chain increase (21%). Sometimes we need to think about the
> big picture and whether one single packageconfig is really worth the
> increased build cycles it places upon everyone by default.
>
> > Second, why is strace even needed in the context of
> > core-image-minimal? It's not installed into the image, so I went and
> > checked:
> > util-linux-ptest needs mdadm
> > mdadm-ptest needs strace.
> >
> > Which begs the question. Should we continue to enable ptest by default
> > in poky? Should we create and use a ptest-less distro configuration?
> > It does pull in a ton of extra stuff all over the place which
> > lengthens the builds a lot. And the resulting ptest packages aren't
> > even used until one explicitly requests one of the ptest images.
>
> This was also asked. We did use to have it off by default but then
> nearly every package upgrade broke ptest since the upgraders didn't
> remember to turn it on for testing. I decided on for poky, off for oe-
> core was a better compromise.
>
> > As an example, I saw an oe-selftest-armhost yesterday, which ran
> > nearly 17 hours:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2587
> >
> > If you go and look at what tests in it took the longest time, you see:
> > 2023-12-13 15:45:22,812 - oe-selftest - INFO - RESULTS -
> > runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd: PASSED
> > (32620.46s)
> > 2023-12-13 15:45:22,794 - oe-selftest - INFO - RESULTS -
> > prservice.BitbakePrTests.test_import_export_override_db: PASSED
> > (12789.45s)
> > 2023-12-13 15:45:22,789 - oe-selftest - INFO - RESULTS -
> > overlayfs.OverlayFSEtcRunTimeTests.test_all_required_variables_set:
> > PASSED (35205.79s)
> > 2023-12-13 15:45:22,781 - oe-selftest - INFO - RESULTS -
> > minidebuginfo.Minidebuginfo.test_minidebuginfo: PASSED (15395.76s)
> > 2023-12-13 15:45:22,782 - oe-selftest - INFO - RESULTS -
> > multiconfig.MultiConfig.test_multiconfig: PASSED (11098.06s)
> > 2023-12-13 15:45:22,776 - oe-selftest - INFO - RESULTS -
> > incompatible_lic.IncompatibleLicensePerImageTests.test_bash_and_license=
:
> > PASSED (24012.67s)
> > 2023-12-13 15:45:22,775 - oe-selftest - INFO - RESULTS -
> > imagefeatures.ImageFeatures.test_mandb: PASSED (19394.74s)
> > 2023-12-13 15:45:22,762 - oe-selftest - INFO - RESULTS -
> > devtool.DevtoolExtractTests.test_devtool_build_image: PASSED
> > (27341.75s)
> > 2023-12-13 15:45:22,760 - oe-selftest - INFO - RESULTS -
> > debuginfod.Debuginfod.test_debuginfod_qemu: PASSED (25784.11s)
> > 2023-12-13 15:45:22,759 - oe-selftest - INFO - RESULTS -
> > containerimage.ContainerImageTests.test_expected_files: PASSED
> > (19453.84s)
> > 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> > buildoptions.SanityOptionsTest.test_options_warnqa_errorqa_switch:
> > PASSED (10492.68s)
> > 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> > buildoptions.ToolchainOptions.test_toolchain_fortran: PASSED
> > (11367.46s)
> > 2023-12-13 15:45:22,743 - oe-selftest - INFO - RESULTS -
> > baremetal.BaremetalTest.test_baremetal: PASSED (24196.04s)
> >
> > The same a-full selftest, but on a x86 host has these times, quicker
> > than arm but still measured in hours:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6179/=
steps/15/logs/stdio
> >
> > What do most of these tests do? They do indeed build
> > core-image-minimal (sometimes full-cmdline or some other images), and
> > sometimes in multiple variants within a single test. But they never
> > use ptest. And so we need to find a way to make it happen faster.
>
> Once a given build has run through the system, things do run much
> faster but this is basically the performance issue I've been mentioning
> in the weekly status reports. Even the above packageconfig change in
> this patch would actually speed a lot of these up, but you're objecting
> to that.
>
> The tests themselves are actually quite valuable as we're way beyond
> the point I can work out which patch will break which features. Some of
> the tests could undoubtedly be improved. If we disable the ptests for
> the selftests, we run the risk of not reusing sstate so a better
> question might be, why are all the tests not reusing sstate more
> efficiently?
>
> > I'm going to get some numbers, first without any changes, then with
> > your proposed change, then with ptest dropped - this will take a bit
> > of time, so I wanted to get the concerns written and sent first.
>
> I don't think dropping the ptests is the right approach, we should
> likely focus on sstate reuse?
>
> I am also pretty in favour of this patch.
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192343): https://lists.openembedded.org/g/openembedde=
d-core/message/192343
> Mute This Topic: https://lists.openembedded.org/mt/103146402/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

