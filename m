Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4211FD2447B
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 05:49:38 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.5116.1728625768709387986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Oct 2024 22:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=zxo/9CfY;
 spf=pass (domain: linaro.org, ip: 209.85.208.169, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fac3f1287bso16876431fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Oct 2024 22:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728625767; x=1729230567; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XCLeDV0GL2tPjDMikVh5yLbkqar8pvnFhsOAIv4Hfyg=;
        b=zxo/9CfYuWWZXqa04kNITfBwKSC9XrKaTpLn/JOAY4QYFJPUdEtLvtKtBsMVBdEzMr
         1l3v6DL7tvZQ/NbouFVVTvtiNxoeYfJdmyvbsq3A+e2hN7vVHbLFuoD0F8YygYnJFyZl
         a79XmsrARqHnLTxG4NrqBlSuHp8mwfu7iJYHa45WRG27RYYMTU54rMwmuycspFe13vKY
         KOf02w0VgR7toZTg/VC3fQIb1EBL5zCmsflsvkOaMtAkPSf67XGw969p8YacA7lJW5Pm
         pEAA8Z7eubABMuBFTLm4eG6sudiK3I2hehs5V7oJlKasLy2u906iYcpKZmb2+QRh9dp4
         bfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728625767; x=1729230567;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCLeDV0GL2tPjDMikVh5yLbkqar8pvnFhsOAIv4Hfyg=;
        b=ZyDbeqVmg4D7RNbXtZpS0rISOUSQjs+6EqCATOpQqsShoYkqa28gNJCjP/fnh10nD1
         1lPTc8JFUGg/QHEQ5Br/zrS850djnmInwbrZckLik6KZ7/68ZrE6GL2xYJcLwRahGh0d
         Q0lIMBoFQWzoJhzgQl6D1d1PSRQuBWve1as1YkQS1I0w7IJY1z/7G5YjnRGBGfnmd0hL
         QDeUhZSLguGDJLNHZ178bKb+XBEqB7VzC5fM1E7j4D21qnT55rNUVig3H/MU3aFTcVeT
         a7t/FK2Hjwc5TEscdB/5FqzPEbsJowS356jQ4dCAeRLAfCS/QLCMeF+UvYmX75Lf+ADw
         mrLw==
X-Gm-Message-State: AOJu0YytYeH49Cfm3yVsSkNB2/x2kKGt+Q0BGwN7DUP6XdJh8U2kMLgE
	3VqvltUh9OIFCqOqx1QOx6RA2diB4xoyqga68Ox59ihalUeUhBt0R8SWlMb/hjk=
X-Google-Smtp-Source: AGHT+IEnNVXjbMAmPA+t51Vf+K3LKCQFSJUbGC7PoGgO/tzA7K215XlhYBjYLGEIJEO/3+68XeAsCA==
X-Received: by 2002:a2e:b791:0:b0:2fa:d723:efc8 with SMTP id 38308e7fff4ca-2fb3275640bmr4138791fa.26.1728625766668;
        Thu, 10 Oct 2024 22:49:26 -0700 (PDT)
Received: from nuoska (2001-14ba-7452-eb00--183.rev.dnainternet.fi. [2001:14ba:7452:eb00::183])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb29fb4b61sm2606181fa.128.2024.10.10.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 22:49:24 -0700 (PDT)
Date: Fri, 11 Oct 2024 08:49:21 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 0/8] systemd uki support
Message-ID: <Zwi8YTfncLhMWDtA@nuoska>
References: <20241010085647.439990-1-mikko.rapeli@linaro.org>
 <D33B3B0D-0404-4FE6-8E3D-0271585B57A0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D33B3B0D-0404-4FE6-8E3D-0271585B57A0@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Oct 2024 05:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205656

Hi,

On Thu, Oct 10, 2024 at 08:21:11PM +0000, Ross Burton wrote:
> On 10 Oct 2024, at 09:56, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > Tested on qemuarm64-secureboot machine from meta-arm with changes to
> > support secure boot. Slightly different configuration tested on
> > multiple arm64 System Ready boards with UEFI firmware, real and firmware
> > based TPM devices. Tested with ovmf firmware on x86_64 with selftests but
> > without secure boot which seems to be harder to setup in ovmf.
> 
> I thought I followed the instructions to enable genericarm64 with UKI, including changing the WKS image, but when systemd-boot pops up its menu there are still two entries: one presumably the UKI, the other from an explicit loader.conf:
> 
> root@genericarm64:~# find /boot/ -type f
> /boot/EFI/BOOT/bootaa64.efi
> /boot/EFI/Linux/uki.efi
> /boot/Image
> /boot/core-image-initramfs-boot-genericarm64.cpio.gz
> /boot/loader/entries/boot.conf
> /boot/loader/loader.conf
> 
> I’m sure I’m doing something obviously wrong - any idea?

I think the wks file still has initrd=... in --sourceparams
which installs the initrd and a boot.conf.
With uki, only "loader=systemd-boot" needs to be there.

Not sure how kernel still got installed to /boot. Maybe
it's in IMAGE_EFI_BOOT_FILES?

Since uki.bbclass embeds the kernel command line,
wks file bootloader entry to append to command line
is not effective so --append="rootwait rootfstype=ext4"
should be UKI_CMDLINE now.

Cheers,

-Mikko

