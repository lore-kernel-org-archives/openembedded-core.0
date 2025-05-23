Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED974C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 14:17:10 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.49087.1748009822791704353
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 07:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FeXJ3NBC;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54acc0cd458so12016767e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 07:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748009821; x=1748614621; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MeCobYbMR/ZYtIZKv0kORibwsbcvACHBQD9GtZJ3jTQ=;
        b=FeXJ3NBCiHnTqMNDoTbOhLFqeKwWmwfwdhYHACbPDRH+l1LFuMoHHPcE9oawXzNYbD
         9LgkjXKKmYuWB9Ge6/V2WmJf/1VxAVCkTDvVX9Q+oE1P80VJMIo6EG8MJSfpPoOzcvEh
         mAcBAdrhgwrr2/a1xqIPLol4SmscP+6COYgRMhgaYVnSPDShDJGnyGQjTMHIkL/GXeh2
         IFNOUW1m6iuM/G3hXW6aZWwCrCuVPX2CJu6Fn4bJbmYfdz+av7/xB2U6C8ZOrLQ1CUoE
         r3ixBSOcGBH9FVj0WyI3BW5s2qYLiMcSNukv1chTZFLRgsRWXfVrTsxPFF39dyHw6KE9
         JR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748009821; x=1748614621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MeCobYbMR/ZYtIZKv0kORibwsbcvACHBQD9GtZJ3jTQ=;
        b=osR9utm4XyFwdSwr/WR+DkOp7nBQNhiKekUz+OAvVJSTf26tY0Wlvm2nFQnMKdV8vG
         3gyeM+LTveSHQtc2UjJfsxtGdoFNm3FbwJcac6CxDo7JxvUx51uxAMHyCZke1HNKPti3
         wQfu6Xj17NkP6kBVJ/iJLwUaEAalBjh+ircwnlHU6SKZPZgQiFziLFmcLkbG6m2jN0zz
         9j675ewz50JcaNHbIMrL/b4phqmLPBV4WnZDXc746c0j+DHv8xUfnMW0M+X8cQXd1c4N
         DarwVFGnCQiY13rqazqb12aNVMaDijbcLZKuKgjQ+xuhxWnJnW2qCO7DKlT9kSui9F7L
         swYw==
X-Gm-Message-State: AOJu0YxOETdHrmnOD42uXPdVGyo4B7cRzNksqotsXjGmg7S5UqWSQSjj
	cKdH6ZC37tj1txUKzsYqeBAs7FEkeU6TLhhjvMRguy82mqliV7V7UaX5TO+jbux7CJY=
X-Gm-Gg: ASbGncsb4sawN6dNq4JTGxmIwSszZRImw/tmJzgWqm8WOHi3zS2oeb9F2rCpFvBv+c7
	XnnFUUHlkjrwTLxmOEud42H069Tjr/ziOxOD1745zh9fDm4VU2XpLQxSVkRO2u1++Qpjf95bQRv
	YqOAy8Cz/jmRef8pnYLk4uyHrmKY8LTw6kiGWAd8v9XA5r1Zp1Q1iSQ1+bz5lRhiKjqqKfl5ruh
	IwrHchYZ/yDsN6i+2K/eVu5sJlF2BGjqWdKpGS1J640WzNwM4OTLnfRpwy2StPuZOXTANHKqYDi
	3sDcgXhGKaEjLzd0DWrZNMC0K4IBAWMMUVwuE3471AOzK/sXHhpc6FJvM2k1VklVB9SLT5kNqQ6
	vmq26M0IU
X-Google-Smtp-Source: AGHT+IH7SYU55qZvZxwpBPxyxmQ+WE0/pIshvD3Fr98UpmrtWHWv/RNhoKrtz3hysYSHHlTYGAs6qA==
X-Received: by 2002:a05:6512:290f:b0:54f:bc10:6bae with SMTP id 2adb3069b0e04-550e71d0ba0mr10251168e87.30.1748009820493;
        Fri, 23 May 2025 07:17:00 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f7dsm3883249e87.117.2025.05.23.07.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 07:17:00 -0700 (PDT)
Date: Fri, 23 May 2025 17:16:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Message-ID: <aDCDWmpLM29OphfW@nuoska>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 14:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217212

Hi,

On Fri, May 23, 2025 at 03:15:51PM +0200, Mathieu Dubois-Briand wrote:
> On Thu May 22, 2025 at 3:41 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > Add a test case to boot target system via u-boot
> > using qemu with KVM. This was broken recently
> > and workaround proposed to u-boot. Test case
> > works with genericarm64 and qemuarm64 target machines
> > compiled and tested on aarch64 build host with KVM
> > support.
> >
> > Test execution time with full sstate cache is
> > around 170 seconds. qemu boot itself takes just
> > a few seconds to full userspace.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> 
> Hi Mikko,
> 
> I saw your other mail saying you will make an update, but as I had
> already picked these patches, here is the build result: the selftest is
> failing on armhost:
> 
> ---
> 2025-05-23 08:50:18,542 - oe-selftest - INFO - uboot.UBootTest.test_boot_uboot_kvm_to_full_target (subunit.RemotedTestCase)
> 2025-05-23 08:50:18,543 - oe-selftest - INFO -  ... ERROR
> ...
> QEMU 10.0.0 monitor - type 'help' for more information
> (qemu)
> Waiting at most 1000 seconds for login banner (05/23/25 08:33:29)
> Connection from 127.0.0.1:43786
> Target didn't reach login banner in 1000 seconds (05/23/25 08:50:12)
> Last 25 lines of login console (1721):
> Scanning bootdev 'virtio-blk#36.bootdev':
> Scanning bootdev 'virtio-net#32.bootdev':
> BOOTP broadcast 1
> ...
> BOOTP broadcast 17
> 
> Retry time exceeded; starting again
> No more bootdevs
> ---  -----------  ------  --------  ----  ------------------------  ----------------
> (1 bootflow, 1 valid)
> =>
> ...
> RuntimeError: core-image-minimal - FAILED to start qemu - check the task log and the boot log
> ---
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1749

Thanks, I will take a look. Boot to u-boot seems to ok so KVM is working on
the aarch64 build machine but something in wic image ESP partition detection is not
working in the same way as on my aarch64 build machine and qemuarm64 and
genericarm64 configs.

I will compare the runqemu and qemu-system-aarch64 arguments to figure out what is
different.

One problem I thought I solved was to change from virtio scsi to virtio blk emulation
but that seems to be effecttive albeit with a warning:

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2468510/raw_inline

runqemu - WARNING - Unknown QB_DRIVE_TYPE: vd
runqemu - WARNING - Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE
runqemu - WARNING - Trying to use virtio block drive

u-boot defconfig does not have scsi support but virtio blk works for disk with ESP
partition in fat format.

Cheers,

-Mikko

