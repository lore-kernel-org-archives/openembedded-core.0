Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14ACCC54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 08:54:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.46752.1748336044551458474
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 01:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CBQVIrmW;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55220699ba8so3045355e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 01:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748336043; x=1748940843; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GhBb+ncGPkD3aNr1Jms2s6u+cyqe2CTF5w0XcB0FPYo=;
        b=CBQVIrmWTqsqcTQiT+QVfin3CcbXReD3gk5lIIU/HxOSkmTes5uxmmsD0k2+UfG8CB
         gUIXKLYaEdZaHLy+/6fbbubP8vFaWG01qSk2TisuZTv60OHNQbAuMY+wvsbm6qCGWCL6
         casBJWhSe/nbKYpRGoEmXdaZ8+Dhn0byAzHH+VxtOMEFmnMvwabYFyHWbyB6qDVRwGbz
         9X/x6g9ZcQNKE0GH/ezcCsfkWENjZ1ZyUiUh9aFhGjQobO5eeL42/yGJqmc6zkH154HO
         YunlnWmHSNMr50Ih34aRaDLC5ivbSQ3nMrPtP96qnlORYLsXn6U8t/lrJ4eoLt+j7ARx
         dt9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748336043; x=1748940843;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhBb+ncGPkD3aNr1Jms2s6u+cyqe2CTF5w0XcB0FPYo=;
        b=kZWtvxtBjs+cG1ps0MxZSqLHvI+fHfDxEWNJAKIf0WGqYwXte6j835eNnTsMQ8JJii
         6qwkUThNWl+yLaJd+lv10Aw3hwZi9Sn4b5P5J2D6V7G0p/1EdZKKLU/GA94eP8DpHG/b
         t64Ry12gZd3RI16S2fsuP6HCelUYbqIo39ipuCNDmQeNpxZbWPxtHlY562yNGHru7nz7
         EPzLuwvr5cH/NukBnPxroMnETlI6x0s4otdOQR6Mr2blZNXBjcGqwEK688YNmhGbO2Uz
         L5P31Z6jciQKHrdXMB4KGPAr1ypzYqMu1DccqXnSmpv9RFu5ohhHrUdkFYQDje+Vb/qc
         pA0w==
X-Gm-Message-State: AOJu0YyHTZShdUQ2ZHSF2sXBbvbIANvp3qEwe9C2iUkai9AN8VftBgXl
	i4BacosJvIdwd5Dx0HxAjsLcLOdIf+NobHATvzVOjpr5/5gkHSB6381nc9mYXQEQztE=
X-Gm-Gg: ASbGncusp8IaAhmN49wVx8Ygrl/NFibFcMwLvtNjNVmbfCVCGS18ITjzYMs1Vsga0Yu
	hbRhLizFaDZZ8b6Z3DaYMGNLsGCW3trvNyxUgcUdNSvIdBohRDEtaZNi/OEYeSI+kZ23fWipY/G
	2bso/MmHb/YLSrIeCQ0t9Vbb9/fOMlX6aY+l5b5BUl88rNBXTMwspuEjwXH1O8TOWlgEJUfyck3
	KfB6IgVRJRex3PBk+oRM2/QQgRg2op/wz4YPXIN6rzXj0KOPTxyO5iN9K8c5XotHJcjSLfydDlz
	K05D6XUchtsAoBP8otPzZZGCPNfhoLFTz+1DVNcgKG9GDSPNq0nbUpyRJNgsiHvCdRmzzfH8nV/
	WyjnM
X-Google-Smtp-Source: AGHT+IE6VIitEA+7muwXzAcv9ImlthD+2QxMvSzGWnltrAspB9rgPyUuqXtoBuBurKh5x3QNgOnlLg==
X-Received: by 2002:a05:6512:1393:b0:553:29ca:c92c with SMTP id 2adb3069b0e04-55329caca2dmr260530e87.25.1748336042593;
        Tue, 27 May 2025 01:54:02 -0700 (PDT)
Received: from nuoska (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5531ff09f5esm900135e87.98.2025.05.27.01.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:54:02 -0700 (PDT)
Date: Tue, 27 May 2025 11:54:00 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Message-ID: <aDV9qIaaHZu88OQe@nuoska>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org>
 <aDQqIZgXepLP3xXD@nuoska>
 <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com>
 <aDVnDQPSPFFeYgYG@nuoska>
 <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 08:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217289

Hi,

On Tue, May 27, 2025 at 09:43:02AM +0200, Mathieu Dubois-Briand wrote:
> On Tue May 27, 2025 at 9:17 AM CEST, Mikko Rapeli wrote:
> > On Tue, May 27, 2025 at 08:34:52AM +0200, Mathieu Dubois-Briand wrote:
> >> On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
> >> > On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> >> >
> >> > I reviewed the runqemu and qemu-system-aarch64 arguments but could not see major differences.
> >> > One difference is that autobuilder runs with tap and I with slirp networking, but that
> >> > should not affect rootfs/ESP partition detection in u-boot. I've sent out v4 now.
> >> > If this still fails on autobuilder, then I'd need know what config fragments
> >> > are applied. I've configured qemuarm64 and genericarm64 with
> >> > ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS += "slirp"
> >> > and SANITY_TESTED_DISTROS = "" to conf/local.conf. Maybe autobuilder
> >> > scripts add something more.
> >> >
> >> > Cheers,
> >> >
> >> > -Mikko
> >> 
> >> Hi Mikko,
> >> 
> >> Thanks for the new version, but I confirm it still fails.
> >> 
> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772
> >
> > Is it possible to grab the full boot log
> > /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1032659/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log.20250526163143 ?
> >
> > It was referred in
> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2499407/raw_inline
> >
> 
> The file is gone :(
> 
> I will launch a new build so I can capture the file.

I finally reproduced this. The ESP partition is missing grub-efi
binaries and only config file is there. I have fixes pending for this
missing dependency on aarch64 and of course was building with them
in my tree. I will add a workaround to this test case and
try get to rebasing the fixes to wic...

Cheers,

-Mikko

