Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF092C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 18:53:40 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.31463.1702580012263750576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 10:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdd0Ti2d;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-59067f03282so5077256eaf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702580011; x=1703184811; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INHXB3Vs1CmCmjFcHWkDYmzGPiUqLOMZnt3ZsHojuhs=;
        b=hdd0Ti2dUNNyfPR5pb53DsdcsTaw3SONFOhj9jyNd0QbnMoLjvo5FWVV3Ju8PBShP3
         TGBTKzzxnfwQW5nQxirHLwsuJ7oDMUkeRDT0SEs+hAp911FteFRL40grih1DanR9fjBx
         evU4zw39RRT7FgOYiYAuA2v8/O6HNlkvsWEp7hzF1DepSWSNWShvLA4rCwnXsfyVXXgZ
         qcMuBa7LDVrI6nI1Hw31NyIvwy3RuUhRSEcGb7tyX4LRAbpV9xIhz/agZ/JSiJN3QyYO
         k87+gIDbFbRQGO5i5JhyOKuuKAfAaWcRdSMbG41BqwrtWcE76ZxMd28NW5u68aBQQbBo
         O/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702580011; x=1703184811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=INHXB3Vs1CmCmjFcHWkDYmzGPiUqLOMZnt3ZsHojuhs=;
        b=DkET4rvG9xYWR1K7ayiKJ4E2yhLkHDPt6nWl2AZKdrvGEiSD6JROic62v5E1YWp2/R
         1NHHKQY00Ld4zGdtIiZ+AAHwEwG5M0dnW9LaqIF8Od9sH/f0E12WQtT2ZTiRYRqj5rO/
         tTGM9LdXizvcqQLxUG7RLa0N4pafQJ8/P0D7zqFenL/BbLVEKO6gzO7IRJOxkMlWowZU
         7LXiXRMeZ5mhYLCFWUcO92AKX9jxtHgeLbIlx/4vJ95fjs0H0Jgoxvqa0NvTCV6y6gUz
         msY0SA/ySipDSOeQOhWW2ActqR4nbdpbVnf/jVKrZCIU95XJl1Ue1KH/4iGJUlpteZ4e
         b0/w==
X-Gm-Message-State: AOJu0YwaiOnTKqeK95r3IMlRGBJf88ll+y48qXQz0w6e9n48fMsO7Wnb
	KSkFh89DVa1YfdsZg1vIwUkgvlES5xc5jrXcADU=
X-Google-Smtp-Source: AGHT+IEsRU6M6Ud7thTOaVmdcfsJClG6BHnaKcztWM2DxECXIuY4BEkQcSj48IBbTmOdBT+wvR+z/QjpD+VAons5LLs=
X-Received: by 2002:a05:6871:3a24:b0:203:38f1:cb63 with SMTP id
 pu36-20020a0568713a2400b0020338f1cb63mr2617222oac.18.1702580011303; Thu, 14
 Dec 2023 10:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr> <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
In-Reply-To: <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 10:53:05 -0800
Message-ID: <CAMKF1spsMdx55xzBT9VEb51my-fE4GeLCq5m3do-5-8AKr-BqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	Tim Orling <ticotimo@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 18:53:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192399

On Thu, Dec 14, 2023 at 1:10=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 13 Dec 2023 at 09:57, Yoann Congal <yoann.congal@smile.fr> wrote:
> >
> > The bluetooth support adds a bluez5 dependency (and,recursively, a lot
> > of other stuff). Disable it by default to avoid having to build all of
> > this when it is not needed.
> >
> > This decrease the number of tasks run for a core-image-minimal build by
> > ~1000 (-21%).
> >
> > To re-enable bluetooth support in strace, add "bluez" to strace
> > PACKAGECONFIG. For example, in local.conf:
> >   PACKAGECONFIG:append:pn-strace =3D " bluez"
> >
> > Fixes [YOCTO #15323]
>
> I'm afraid I have to raise objections.
>
> First, this needs an explanation: what functionality in strace does
> this disable? Is that functionality important from the point of having
> bluetooth in DISTRO_FEATURES? Not respecting DISTRO_FEATURES sets a
> bad precedent, and should be more carefully justified and treated as
> an exception.
>
> Second, why is strace even needed in the context of
> core-image-minimal? It's not installed into the image, so I went and
> checked:
> util-linux-ptest needs mdadm
> mdadm-ptest needs strace.

I looked briefly into util-linux pertaining to mdadm needs in tests, there
are 4 tests needing it.
md-raid0-whole, md-raid1-part, md-raid1-whole, align-512-4K-md

and all of them are marked as
TS_KNOWN_FAIL=3D"yes"

See https://github.com/util-linux/util-linux/commit/7519c3edab120b14623931d=
5ddb16fdc6e7cad5d

I think we can skip running these tests as well and safely avoid
depending upon mdadm for util-linux ptests which can break the depchain as =
well.

>
> Which begs the question. Should we continue to enable ptest by default
> in poky? Should we create and use a ptest-less distro configuration?
> It does pull in a ton of extra stuff all over the place which
> lengthens the builds a lot. And the resulting ptest packages aren't
> even used until one explicitly requests one of the ptest images.
>
> As an example, I saw an oe-selftest-armhost yesterday, which ran
> nearly 17 hours:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2587
>
> If you go and look at what tests in it took the longest time, you see:
> 2023-12-13 15:45:22,812 - oe-selftest - INFO - RESULTS -
> runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd: PASSED
> (32620.46s)
> 2023-12-13 15:45:22,794 - oe-selftest - INFO - RESULTS -
> prservice.BitbakePrTests.test_import_export_override_db: PASSED
> (12789.45s)
> 2023-12-13 15:45:22,789 - oe-selftest - INFO - RESULTS -
> overlayfs.OverlayFSEtcRunTimeTests.test_all_required_variables_set:
> PASSED (35205.79s)
> 2023-12-13 15:45:22,781 - oe-selftest - INFO - RESULTS -
> minidebuginfo.Minidebuginfo.test_minidebuginfo: PASSED (15395.76s)
> 2023-12-13 15:45:22,782 - oe-selftest - INFO - RESULTS -
> multiconfig.MultiConfig.test_multiconfig: PASSED (11098.06s)
> 2023-12-13 15:45:22,776 - oe-selftest - INFO - RESULTS -
> incompatible_lic.IncompatibleLicensePerImageTests.test_bash_and_license:
> PASSED (24012.67s)
> 2023-12-13 15:45:22,775 - oe-selftest - INFO - RESULTS -
> imagefeatures.ImageFeatures.test_mandb: PASSED (19394.74s)
> 2023-12-13 15:45:22,762 - oe-selftest - INFO - RESULTS -
> devtool.DevtoolExtractTests.test_devtool_build_image: PASSED
> (27341.75s)
> 2023-12-13 15:45:22,760 - oe-selftest - INFO - RESULTS -
> debuginfod.Debuginfod.test_debuginfod_qemu: PASSED (25784.11s)
> 2023-12-13 15:45:22,759 - oe-selftest - INFO - RESULTS -
> containerimage.ContainerImageTests.test_expected_files: PASSED
> (19453.84s)
> 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> buildoptions.SanityOptionsTest.test_options_warnqa_errorqa_switch:
> PASSED (10492.68s)
> 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> buildoptions.ToolchainOptions.test_toolchain_fortran: PASSED
> (11367.46s)
> 2023-12-13 15:45:22,743 - oe-selftest - INFO - RESULTS -
> baremetal.BaremetalTest.test_baremetal: PASSED (24196.04s)
>
> The same a-full selftest, but on a x86 host has these times, quicker
> than arm but still measured in hours:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6179/st=
eps/15/logs/stdio
>
> What do most of these tests do? They do indeed build
> core-image-minimal (sometimes full-cmdline or some other images), and
> sometimes in multiple variants within a single test. But they never
> use ptest. And so we need to find a way to make it happen faster.
>
> I'm going to get some numbers, first without any changes, then with
> your proposed change, then with ptest dropped - this will take a bit
> of time, so I wanted to get the concerns written and sent first.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192339): https://lists.openembedded.org/g/openembedde=
d-core/message/192339
> Mute This Topic: https://lists.openembedded.org/mt/103146402/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

