Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9C8C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:10:16 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.17975.1702545012742626170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MyfyKkY5;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cc43f9e744so3927091fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 01:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702545011; x=1703149811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tFRn6RUMKFknSU2CZiLCiu1RS865qRyz2XBuHWlV4Zg=;
        b=MyfyKkY5ckcWixJFSUM21oMWQsiqX3H5L0vfS+xP7VjqICI0aHSksvPQRdCLJw3dvE
         INkKwZSgO+0wfM/v0/pQ4BdzkWIXcutXugx4fKOgUD02RAqOKFtCLDxMr9Ih2hIxSCw0
         BVu13QxWgI8LirkG460Y/ciTZx+DQdZrH9E6hfpjMeTKAvJlQ83VI+zxY3Oqc7sIcDGb
         QpGLoxELX0hLw0xgK4WtD6hSmThTEhw2ctuFZMuLXnhTKcjkbopcjVfN+Ku0BZluzUYj
         A+MhAUiEk1JUZM/+I/rZvUKy1e1AME1WUPPd3QMWIbncCb3Gh51hUAr/BAerll0N0X4X
         JaYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702545011; x=1703149811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFRn6RUMKFknSU2CZiLCiu1RS865qRyz2XBuHWlV4Zg=;
        b=gbegMP0JWKmAxAFyYrVj3Kl2hCVhZlEwlPmyV6Su9Q8aRhgSpLabCkkelpTt6QLEm3
         zvHv2gfPa9pSlRyY9KefAiau3VVnJg7fQLhoQAjRcMWXoMt/x4Zv9J5Xrw/4DmGKmemX
         zqrBUi7oSIfvZn7V453Hd445sYj70k7iSKrXVqJTyNXXHE5y7/nSACs/B5h8PJGELOhd
         o7yRV3pi3ahTAOjvCWErMj8uHIhPDZNz3xfaNSzcXPwbiGUDo4UMEELMVOWmCEKZ+NOa
         UHxYPAl3CrCk95ghVNENrMRvXSudo1oaXRJ6J2YuKG72QgA1yejT0nRg9fbLQ4Sp2BXD
         lyZg==
X-Gm-Message-State: AOJu0Yz7s1f3hgOdJa0bYPnGj1KPSyeaJgnmbncLS9iB/o+GRDUDPEGf
	/6PsAtt/lWZo0sDjBqfntfTjFgiGaFFM4V4+wPY=
X-Google-Smtp-Source: AGHT+IEC/2jFhdVQqWtOK5DnQ+OTDpYUr3mYKrcYlWHYLWziScZygN0pO+/TUf3AAOeRoRwhvgiJ05DSZQsGiEYwg0Y=
X-Received: by 2002:a2e:be05:0:b0:2cc:2853:a6bf with SMTP id
 z5-20020a2ebe05000000b002cc2853a6bfmr1527251ljq.45.1702545010751; Thu, 14 Dec
 2023 01:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20231213085657.2552223-1-yoann.congal@smile.fr>
In-Reply-To: <20231213085657.2552223-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 14 Dec 2023 10:09:59 +0100
Message-ID: <CANNYZj9mWiEZRf_snYJ0eRcirn746GbkZSekLV3-XVcHjaR6bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] strace: Disable bluetooth support by default
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org, Tim Orling <ticotimo@gmail.com>, 
	Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 09:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192339

On Wed, 13 Dec 2023 at 09:57, Yoann Congal <yoann.congal@smile.fr> wrote:
>
> The bluetooth support adds a bluez5 dependency (and,recursively, a lot
> of other stuff). Disable it by default to avoid having to build all of
> this when it is not needed.
>
> This decrease the number of tasks run for a core-image-minimal build by
> ~1000 (-21%).
>
> To re-enable bluetooth support in strace, add "bluez" to strace
> PACKAGECONFIG. For example, in local.conf:
>   PACKAGECONFIG:append:pn-strace = " bluez"
>
> Fixes [YOCTO #15323]

I'm afraid I have to raise objections.

First, this needs an explanation: what functionality in strace does
this disable? Is that functionality important from the point of having
bluetooth in DISTRO_FEATURES? Not respecting DISTRO_FEATURES sets a
bad precedent, and should be more carefully justified and treated as
an exception.

Second, why is strace even needed in the context of
core-image-minimal? It's not installed into the image, so I went and
checked:
util-linux-ptest needs mdadm
mdadm-ptest needs strace.

Which begs the question. Should we continue to enable ptest by default
in poky? Should we create and use a ptest-less distro configuration?
It does pull in a ton of extra stuff all over the place which
lengthens the builds a lot. And the resulting ptest packages aren't
even used until one explicitly requests one of the ptest images.

As an example, I saw an oe-selftest-armhost yesterday, which ran
nearly 17 hours:
https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2587

If you go and look at what tests in it took the longest time, you see:
2023-12-13 15:45:22,812 - oe-selftest - INFO - RESULTS -
runtime_test.Postinst.test_postinst_rootfs_and_boot_systemd: PASSED
(32620.46s)
2023-12-13 15:45:22,794 - oe-selftest - INFO - RESULTS -
prservice.BitbakePrTests.test_import_export_override_db: PASSED
(12789.45s)
2023-12-13 15:45:22,789 - oe-selftest - INFO - RESULTS -
overlayfs.OverlayFSEtcRunTimeTests.test_all_required_variables_set:
PASSED (35205.79s)
2023-12-13 15:45:22,781 - oe-selftest - INFO - RESULTS -
minidebuginfo.Minidebuginfo.test_minidebuginfo: PASSED (15395.76s)
2023-12-13 15:45:22,782 - oe-selftest - INFO - RESULTS -
multiconfig.MultiConfig.test_multiconfig: PASSED (11098.06s)
2023-12-13 15:45:22,776 - oe-selftest - INFO - RESULTS -
incompatible_lic.IncompatibleLicensePerImageTests.test_bash_and_license:
PASSED (24012.67s)
2023-12-13 15:45:22,775 - oe-selftest - INFO - RESULTS -
imagefeatures.ImageFeatures.test_mandb: PASSED (19394.74s)
2023-12-13 15:45:22,762 - oe-selftest - INFO - RESULTS -
devtool.DevtoolExtractTests.test_devtool_build_image: PASSED
(27341.75s)
2023-12-13 15:45:22,760 - oe-selftest - INFO - RESULTS -
debuginfod.Debuginfod.test_debuginfod_qemu: PASSED (25784.11s)
2023-12-13 15:45:22,759 - oe-selftest - INFO - RESULTS -
containerimage.ContainerImageTests.test_expected_files: PASSED
(19453.84s)
2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
buildoptions.SanityOptionsTest.test_options_warnqa_errorqa_switch:
PASSED (10492.68s)
2023-12-13 15:45:22,758 - oe-selftest - INFO - RESULTS -
buildoptions.ToolchainOptions.test_toolchain_fortran: PASSED
(11367.46s)
2023-12-13 15:45:22,743 - oe-selftest - INFO - RESULTS -
baremetal.BaremetalTest.test_baremetal: PASSED (24196.04s)

The same a-full selftest, but on a x86 host has these times, quicker
than arm but still measured in hours:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6179/steps/15/logs/stdio

What do most of these tests do? They do indeed build
core-image-minimal (sometimes full-cmdline or some other images), and
sometimes in multiple variants within a single test. But they never
use ptest. And so we need to find a way to make it happen faster.

I'm going to get some numbers, first without any changes, then with
your proposed change, then with ptest dropped - this will take a bit
of time, so I wanted to get the concerns written and sent first.

Alex

