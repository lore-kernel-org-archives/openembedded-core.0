Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249BCC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 19:36:41 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.37697.1702582591392128393
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 11:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cesCMsCo;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-591341db3a1so2473687eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 11:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702582590; x=1703187390; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3DTNFDkeeYhG1y9P/Y72YoiMW/Ti41sgy5JCd/juxw=;
        b=cesCMsCox8QeMBofgNx+rmb0MPZPO5KbbJYsb23eKgsjdOYNZ0OGAQ8wq906Kf2j3R
         RgCjYGho6N7wulA74yLiQpAU693ujoGZVXe/9NW2I9lGxYPchVs9TSZj1IK2bFGaZTAf
         9F/JKO5HJByN5/w/c68XL/gZgE/8QT8P9IWWKl1W8xrG+rzrhePaQlcpR7+IDbWXKM90
         j1aS63qGKjVklNrNeMSRxYk2V4e2sKmi+8geWgIjKpd6f4b3WMOIA3iIlqPFEuC/4bJ4
         51lAbvMrseyGkwMmUv6e3x+MigL5Jhb3QQlt0PdiamCmrVFIB1PVDF7ReGwncP7tIVBh
         8Dkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702582590; x=1703187390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3DTNFDkeeYhG1y9P/Y72YoiMW/Ti41sgy5JCd/juxw=;
        b=HElflaP2co1xwb5ZuK69mOozLvNHCZMkyDJBg1EbuGXND9lHJEQ1HE8pUjWepsCulR
         pZFzTRAhl7NmGQcgBii7d/NbDf9tBJTWeyiJKUeb8Grjso7kpgb6qNwJg8I0hZjWpxKs
         7ToH0AB2bQkcHHGgGH4nOMggJM/LEZdud8011yYPOZo27I1IyNpp/tLaT54yZQ806JNe
         FjoDYLeuaJv6gYSdNu5Ep//VJA8kfzYwbdl0ZeBrnRC85ubgWW7O+oScXQo8hMHtDWAh
         fwhSUD3+gayB+Zs0fygEY686EsFIJmd8a8MwavK9Hf7Mb6vIH6kN53EnSev5araOdBWi
         yhCA==
X-Gm-Message-State: AOJu0YwOTMmmCKOGPe3O00AHENfHoeyWdAoM8wDgW6jCFyvYiyR7d7DJ
	kuxJc3mdGAZzQ9pvEYL1uZs9PM2wdMXVlyCe6xI=
X-Google-Smtp-Source: AGHT+IEfY0B0e0Pr2v+cA/WrpxIxTdkWtRac6Ioo5HcGMuU4+ukvTi8wfSZWtNUiVbdT71Xs4P3HRxxtFaVGJ0R7Xl0=
X-Received: by 2002:a05:6871:7284:b0:203:5c00:bbfc with SMTP id
 mm4-20020a056871728400b002035c00bbfcmr742928oac.4.1702582590672; Thu, 14 Dec
 2023 11:36:30 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
 <CAMKF1spsMdx55xzBT9VEb51my-fE4GeLCq5m3do-5-8AKr-BqQ@mail.gmail.com> <20231214193346baddfca0@mail.local>
In-Reply-To: <20231214193346baddfca0@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 11:36:04 -0800
Message-ID: <CAMKF1soTi3X-eZf6+pd+hS3FpTvxSO7kR4ievYgM_F2N_8AVFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 19:36:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192403

On Thu, Dec 14, 2023 at 11:33=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 14/12/2023 10:53:05-0800, Khem Raj wrote:
> > On Thu, Dec 14, 2023 at 1:10=E2=80=AFAM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > On Wed, 13 Dec 2023 at 09:57, Yoann Congal <yoann.congal@smile.fr> wr=
ote:
> > > >
> > > > The bluetooth support adds a bluez5 dependency (and,recursively, a =
lot
> > > > of other stuff). Disable it by default to avoid having to build all=
 of
> > > > this when it is not needed.
> > > >
> > > > This decrease the number of tasks run for a core-image-minimal buil=
d by
> > > > ~1000 (-21%).
> > > >
> > > > To re-enable bluetooth support in strace, add "bluez" to strace
> > > > PACKAGECONFIG. For example, in local.conf:
> > > >   PACKAGECONFIG:append:pn-strace =3D " bluez"
> > > >
> > > > Fixes [YOCTO #15323]
> > >
> > > I'm afraid I have to raise objections.
> > >
> > > First, this needs an explanation: what functionality in strace does
> > > this disable? Is that functionality important from the point of havin=
g
> > > bluetooth in DISTRO_FEATURES? Not respecting DISTRO_FEATURES sets a
> > > bad precedent, and should be more carefully justified and treated as
> > > an exception.
> > >
> > > Second, why is strace even needed in the context of
> > > core-image-minimal? It's not installed into the image, so I went and
> > > checked:
> > > util-linux-ptest needs mdadm
> > > mdadm-ptest needs strace.
> >
> > I looked briefly into util-linux pertaining to mdadm needs in tests, th=
ere
> > are 4 tests needing it.
> > md-raid0-whole, md-raid1-part, md-raid1-whole, align-512-4K-md
> >
> > and all of them are marked as
> > TS_KNOWN_FAIL=3D"yes"
> >
> > See https://github.com/util-linux/util-linux/commit/7519c3edab120b14623=
931d5ddb16fdc6e7cad5d
> >
> > I think we can skip running these tests as well and safely avoid
> > depending upon mdadm for util-linux ptests which can break the depchain=
 as well.
> >
>
> I think dropping the mdam ptests was the plan seeing the amount of
> breakage this does on the AB.

Good deal, I also see them happening on musl so I went ahead and cooked a p=
atch
and posted it on ml. Musl util-linux ptests have 4 less fails now.

>
> > >
> > > Which begs the question. Should we continue to enable ptest by defaul=
t
> > > in poky? Should we create and use a ptest-less distro configuration?
> > > It does pull in a ton of extra stuff all over the place which
> > > lengthens the builds a lot. And the resulting ptest packages aren't
> > > even used until one explicitly requests one of the ptest images.
> > >
> > > As an example, I saw an oe-selftest-armhost yesterday, which ran
> > > nearly 17 hours:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/25=
87
> > >
> > > If you go and look at what tests in it took the longest time, you see=
:
> > > 2023-12-13 15:45:22,812 - oe-selftest - INFO - RESULTS -
> > > runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd: PASSED
> > > (32620.46s)
> > > 2023-12-13 15:45:22,794 - oe-selftest - INFO - RESULTS -
> > > prservice.BitbakePrTests.test_import_export_override_db: PASSED
> > > (12789.45s)
> > > 2023-12-13 15:45:22,789 - oe-selftest - INFO - RESULTS -
> > > overlayfs.OverlayFSEtcRunTimeTests.test_all_required_variables_set:
> > > PASSED (35205.79s)
> > > 2023-12-13 15:45:22,781 - oe-selftest - INFO - RESULTS -
> > > minidebuginfo.Minidebuginfo.test_minidebuginfo: PASSED (15395.76s)
> > > 2023-12-13 15:45:22,782 - oe-selftest - INFO - RESULTS -
> > > multiconfig.MultiConfig.test_multiconfig: PASSED (11098.06s)
> > > 2023-12-13 15:45:22,776 - oe-selftest - INFO - RESULTS -
> > > incompatible_lic.IncompatibleLicensePerImageTests.test_bash_and_licen=
se:
> > > PASSED (24012.67s)
> > > 2023-12-13 15:45:22,775 - oe-selftest - INFO - RESULTS -
> > > imagefeatures.ImageFeatures.test_mandb: PASSED (19394.74s)
> > > 2023-12-13 15:45:22,762 - oe-selftest - INFO - RESULTS -
> > > devtool.DevtoolExtractTests.test_devtool_build_image: PASSED
> > > (27341.75s)
> > > 2023-12-13 15:45:22,760 - oe-selftest - INFO - RESULTS -
> > > debuginfod.Debuginfod.test_debuginfod_qemu: PASSED (25784.11s)
> > > 2023-12-13 15:45:22,759 - oe-selftest - INFO - RESULTS -
> > > containerimage.ContainerImageTests.test_expected_files: PASSED
> > > (19453.84s)
> > > 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> > > buildoptions.SanityOptionsTest.test_options_warnqa_errorqa_switch:
> > > PASSED (10492.68s)
> > > 2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
> > > buildoptions.ToolchainOptions.test_toolchain_fortran: PASSED
> > > (11367.46s)
> > > 2023-12-13 15:45:22,743 - oe-selftest - INFO - RESULTS -
> > > baremetal.BaremetalTest.test_baremetal: PASSED (24196.04s)
> > >
> > > The same a-full selftest, but on a x86 host has these times, quicker
> > > than arm but still measured in hours:
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/617=
9/steps/15/logs/stdio
> > >
> > > What do most of these tests do? They do indeed build
> > > core-image-minimal (sometimes full-cmdline or some other images), and
> > > sometimes in multiple variants within a single test. But they never
> > > use ptest. And so we need to find a way to make it happen faster.
> > >
> > > I'm going to get some numbers, first without any changes, then with
> > > your proposed change, then with ptest dropped - this will take a bit
> > > of time, so I wanted to get the concerns written and sent first.
> > >
> > > Alex
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#192339): https://lists.openembedded.org/g/openemb=
edded-core/message/192339
> > > Mute This Topic: https://lists.openembedded.org/mt/103146402/1997914
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=
 [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

