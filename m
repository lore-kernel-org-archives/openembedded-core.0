Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8AE8C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:45:30 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.24796.1748249125098240942
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 01:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Nf4Y/OJs;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e98f73850so2735222e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748249123; x=1748853923; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dg12kgrBtv1uLYEi7KFezTUUZGdSRa1VC8PHCroerWE=;
        b=Nf4Y/OJsST8Pj33enqUAx896RRHnevO2U67J+A1ABjRwjmOiQH8KptY0jVX52NRwpD
         RNOKxmwQbLzeuF6JzN+8qwK882/hqi9AhhqzMxMbp2rQ8aq36iLyiVodTloyNWrZHGXB
         C1eO0vX6LcPuyminpv3AV3VfeC6BHXjPCeutye8nqXg/0Z8rrCaRNhYLaapoQ/IcRj8+
         XFs3H2ouJfGks2ClCd3FSCRPCCGfOM4DavFso7W9BV8BOjdJCd8Dqszg4I7FEKNajhJv
         xWJDHOs0PmW0LrYaFn+Ph2DkxcTfb74oVS4iOd0eROIE3wylzIg70jpkJ2lloSUfNUeX
         Z/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748249123; x=1748853923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dg12kgrBtv1uLYEi7KFezTUUZGdSRa1VC8PHCroerWE=;
        b=P91IvkPmsKRp8Hr9I91vhnmKSoseDVmEHGRpnXMVZZPOnOqkRTHi3gH6O16nO0Xp4U
         OVzKQnuod4soInwPCCCG9bxDanAILrjuOaQQYngplM5ENmq5OQZM6Qes3CfOah5FcSyC
         4+TZLansK9OHBp8ZTQtQ/5SZ1+54/CR/IdZ2vg07OzAnp2gtV1tJQ7Ll6j08txlIyuFd
         kyqC0U8XBhR31azVqeihxPi7msOdQdKkQd00fFTG0ByO/FPf+SVUiFKiGscHFvHDAfmw
         jvrUyPDBsjjVHGDCqno5eWULRKqkoTJ9M7/f9yv1xKWNU13STUTjcbYi/qL1gUvmBy7w
         9ZHg==
X-Forwarded-Encrypted: i=1; AJvYcCUyVPQs4SE49utSskBitEYlaOw8900qoJUvhJD5+taTQ+J/sZIyJfq3Q3yQ6Hik/4870ZQzAUzd//M2pVjgHzsGuQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz5Ly9Nx14/GZj0zPkBsR9AcjlYYLeVqtEWbjDm1SqZW/soCfbT
	I89+gjjaTh264gRmZmeLgghxGeDtltcj6KdPpRkVqudFkZmJhylEUxHWFn55ANagC9M8DZVAn17
	95dIYOec=
X-Gm-Gg: ASbGncs6WRpTViRYB9aCZiJvndxaB3iNQQbR2PwlkWRtOmK/NwWX8Y467Znh5tzxU4Q
	dKHa9K4LpLY5wgrHlvU6xIOdAojPZqOpjzZTPT6pYWX1mQHwu0bZ8CuqDlZ1YkHZstFAgcNen+b
	hSYhn20MR4yrOYnAp1aY+0zhwnYsvvHGIj3M8T0BmVkHelVgMX5uUBCcaWl5S5uQrYtA3sjEe8/
	gPA4vE5gIbOFNZ4Vfb4HWvyh4toD+fIxpXH7e7oWYtOIH0Xtx1SwPsd2SG/GgLGUxp8P8ugOnJA
	dGqnUMwf3g/kK3dwGawTgx/vquhz9ujW13SR9X8iIooh2PhU8q7nl7UEfhMzLKEPN0RUENjgY95
	7ZD5GjgMZcSAZ7jNM25I=
X-Google-Smtp-Source: AGHT+IGUEkLFsaW2haPp102jCs86/f3xs7VEgXMWT8YNLffddHDYDXkdRNhPeOD/N4CbzrDy7Tqe8w==
X-Received: by 2002:a05:6512:b8c:b0:551:fe24:7878 with SMTP id 2adb3069b0e04-5521c7aeea2mr2177482e87.17.1748249122900;
        Mon, 26 May 2025 01:45:22 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55322a5e846sm305468e87.53.2025.05.26.01.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:45:22 -0700 (PDT)
Date: Mon, 26 May 2025 11:45:21 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Message-ID: <aDQqIZgXepLP3xXD@nuoska>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18422DAC420B1606.3062@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 08:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217261

Hi,

On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Fri, May 23, 2025 at 03:15:51PM +0200, Mathieu Dubois-Briand wrote:
> > On Thu May 22, 2025 at 3:41 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > > Add a test case to boot target system via u-boot
> > > using qemu with KVM. This was broken recently
> > > and workaround proposed to u-boot. Test case
> > > works with genericarm64 and qemuarm64 target machines
> > > compiled and tested on aarch64 build host with KVM
> > > support.
> > >
> > > Test execution time with full sstate cache is
> > > around 170 seconds. qemu boot itself takes just
> > > a few seconds to full userspace.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > 
> > Hi Mikko,
> > 
> > I saw your other mail saying you will make an update, but as I had
> > already picked these patches, here is the build result: the selftest is
> > failing on armhost:
> > 
> > ---
> > 2025-05-23 08:50:18,542 - oe-selftest - INFO - uboot.UBootTest.test_boot_uboot_kvm_to_full_target (subunit.RemotedTestCase)
> > 2025-05-23 08:50:18,543 - oe-selftest - INFO -  ... ERROR
> > ...
> > QEMU 10.0.0 monitor - type 'help' for more information
> > (qemu)
> > Waiting at most 1000 seconds for login banner (05/23/25 08:33:29)
> > Connection from 127.0.0.1:43786
> > Target didn't reach login banner in 1000 seconds (05/23/25 08:50:12)
> > Last 25 lines of login console (1721):
> > Scanning bootdev 'virtio-blk#36.bootdev':
> > Scanning bootdev 'virtio-net#32.bootdev':
> > BOOTP broadcast 1
> > ...
> > BOOTP broadcast 17
> > 
> > Retry time exceeded; starting again
> > No more bootdevs
> > ---  -----------  ------  --------  ----  ------------------------  ----------------
> > (1 bootflow, 1 valid)
> > =>
> > ...
> > RuntimeError: core-image-minimal - FAILED to start qemu - check the task log and the boot log
> > ---
> > 
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1749
> 
> Thanks, I will take a look. Boot to u-boot seems to ok so KVM is working on
> the aarch64 build machine but something in wic image ESP partition detection is not
> working in the same way as on my aarch64 build machine and qemuarm64 and
> genericarm64 configs.
> 
> I will compare the runqemu and qemu-system-aarch64 arguments to figure out what is
> different.
> 
> One problem I thought I solved was to change from virtio scsi to virtio blk emulation
> but that seems to be effecttive albeit with a warning:
> 
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2468510/raw_inline
> 
> runqemu - WARNING - Unknown QB_DRIVE_TYPE: vd
> runqemu - WARNING - Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE
> runqemu - WARNING - Trying to use virtio block drive
> 
> u-boot defconfig does not have scsi support but virtio blk works for disk with ESP
> partition in fat format.

I reviewed the runqemu and qemu-system-aarch64 arguments but could not see major differences.
One difference is that autobuilder runs with tap and I with slirp networking, but that
should not affect rootfs/ESP partition detection in u-boot. I've sent out v4 now.
If this still fails on autobuilder, then I'd need know what config fragments
are applied. I've configured qemuarm64 and genericarm64 with
". oe-init-build-env" and then added TEST_RUNQEMUPARAMS += "slirp"
and SANITY_TESTED_DISTROS = "" to conf/local.conf. Maybe autobuilder
scripts add something more.

Cheers,

-Mikko

