Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BE7C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 19:33:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.37677.1702582428638233859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 11:33:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KGeGKzIE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A27140004;
	Thu, 14 Dec 2023 19:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702582426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8Xt5fGoJKj3BmV9WxY/VvS9XEEdzRsXcbr4tanMZMM=;
	b=KGeGKzIEgBk3z6DqlKchXEGtWXFN+DCBUJEgyfUSOGa0r2o2XcVpWYZDVDI37p/BhXh5m8
	y2Pgf2M+kL/29dPjP3tGPHSy43NzllQek8DRdgzL9afbUSwpb2CAdByOAgXXG1VT4V3x3I
	/bvgdcvO8It346Ui5jZw422lbma+v5zijcwUf/rSy9mIZujYIEBI/xhNuNLMG19D65eYtX
	mUP1sdMsBjx5rf20fMlxHzI0muaPIuuNVcxx3MhR7gzGH4Z1OinzOyjJE72vWu5QYK8l6E
	h2OavFpnezPWStkSeng4Qha4KxD7UOG24cCw9PDORzenfOnrndHbFqcCvMfAKg==
Date: Thu, 14 Dec 2023 20:33:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>,
	openembedded-core@lists.openembedded.org,
	Tim Orling <ticotimo@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
Message-ID: <20231214193346baddfca0@mail.local>
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
 <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
 <CAMKF1spsMdx55xzBT9VEb51my-fE4GeLCq5m3do-5-8AKr-BqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1spsMdx55xzBT9VEb51my-fE4GeLCq5m3do-5-8AKr-BqQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 19:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192401

On 14/12/2023 10:53:05-0800, Khem Raj wrote:
> On Thu, Dec 14, 2023 at 1:10 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Wed, 13 Dec 2023 at 09:57, Yoann Congal <yoann.congal@smile.fr> wrote:
> > >
> > > The bluetooth support adds a bluez5 dependency (and,recursively, a lot
> > > of other stuff). Disable it by default to avoid having to build all of
> > > this when it is not needed.
> > >
> > > This decrease the number of tasks run for a core-image-minimal build by
> > > ~1000 (-21%).
> > >
> > > To re-enable bluetooth support in strace, add "bluez" to strace
> > > PACKAGECONFIG. For example, in local.conf:
> > >   PACKAGECONFIG:append:pn-strace = " bluez"
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
> >
> > Second, why is strace even needed in the context of
> > core-image-minimal? It's not installed into the image, so I went and
> > checked:
> > util-linux-ptest needs mdadm
> > mdadm-ptest needs strace.
> 
> I looked briefly into util-linux pertaining to mdadm needs in tests, there
> are 4 tests needing it.
> md-raid0-whole, md-raid1-part, md-raid1-whole, align-512-4K-md
> 
> and all of them are marked as
> TS_KNOWN_FAIL="yes"
> 
> See https://github.com/util-linux/util-linux/commit/7519c3edab120b14623931d5ddb16fdc6e7cad5d
> 
> I think we can skip running these tests as well and safely avoid
> depending upon mdadm for util-linux ptests which can break the depchain as well.
> 

I think dropping the mdam ptests was the plan seeing the amount of
breakage this does on the AB.

> >
> > Which begs the question. Should we continue to enable ptest by default
> > in poky? Should we create and use a ptest-less distro configuration?
> > It does pull in a ton of extra stuff all over the place which
> > lengthens the builds a lot. And the resulting ptest packages aren't
> > even used until one explicitly requests one of the ptest images.
> >
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
> > incompatible_lic.IncompatibleLicensePerImageTests.test_bash_and_license:
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
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6179/steps/15/logs/stdio
> >
> > What do most of these tests do? They do indeed build
> > core-image-minimal (sometimes full-cmdline or some other images), and
> > sometimes in multiple variants within a single test. But they never
> > use ptest. And so we need to find a way to make it happen faster.
> >
> > I'm going to get some numbers, first without any changes, then with
> > your proposed change, then with ptest dropped - this will take a bit
> > of time, so I wanted to get the concerns written and sent first.
> >
> > Alex
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#192339): https://lists.openembedded.org/g/openembedded-core/message/192339
> > Mute This Topic: https://lists.openembedded.org/mt/103146402/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

