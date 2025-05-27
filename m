Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1B0C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 07:17:47 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.45698.1748330256957056074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 00:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=phdIWvWd;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so3704272e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748330255; x=1748935055; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap0IdB/0oL13lFkPYDFm99KpjVBIILW5h/fJuRDlbac=;
        b=phdIWvWdXmLLaxeN/LjHdXQ3sbD6pM/zpiQ0IIcpnQ2TsLrioWbNRcklbusnRJ5IYV
         WLd2h8L0j4kKoPEFdW95fR50kUmHa8Sv/K9SmQatrK4IlO/1KTR2dR/6ic52S+DK/bCB
         qwhODx+z6GTMr0wS4J+WHH+XWrtbs5W8dol71Ldz1Emztomn4VQTLU52Z/oW/Skg8Ajc
         FeJcP+d2QF398CndABUH5m2Jwn9IG6GcfjMo7waoTRlyCCnEhPMKN/wccdSj9FQAWaKG
         TBmWr6uwhPmgxaJqi4ahhEZdaYUJjho0RFSlW6EWf6l9C2bzo31UAyXDsBHDXH9e5oMv
         lfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748330255; x=1748935055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ap0IdB/0oL13lFkPYDFm99KpjVBIILW5h/fJuRDlbac=;
        b=Jy8RhDT6y5u1lJ+JahyLuHImHi4aYYDRYiBNeNY5GiSIxi8cDKLqE+FSW7T/dshrhi
         r3E1TI4JVa/TBdMT+jcuOTmpn/G1iwSg5WJLouIsOxd+s2wwei3Obk8ysItTjWUXTAtw
         +Yb5K0TGy3kvOSEOWkPqA1w0iqmp51yqR3CEBRzHQxUaMVU0XlmVqMRYbMZeiEuvgqTv
         mjOlPgVhxTZGJuuoRuwZI8fQ2BrwPRsDAOK9FUNraKrTDJcsPFvkkqXuyGNuPAuQaMDx
         BKZ09qitEVdZz+TDwW/RMj4Ozh4H22x25l1hojaP3GsPadJDnGDR3Nth6K/qcHBukeho
         wRww==
X-Gm-Message-State: AOJu0YzeN2Dvx24yEZP/m/udrrbrL1Be3zkvpM0olOeuvRxnN3gfM2hC
	I7/+cS/gggFIA7zjydWCAsFKciJgLWWSExeyY+j4lShwmEV7XaCxMgqlEXCM0I1Cq6A=
X-Gm-Gg: ASbGncss0q18TUVHFyj21dSGLbrgLd/R9lzvTsyl1h0ZQCZTc8OGSpNZly5rvk5e73T
	o7UuQqDmtPxN5ISXy9Aswcbrethc1yIM7IWL+UsSWvOJ/Tp9znQ8sC36faA7lxKuQYwNnbhCXrD
	4tFzbwrCYYHMXLYLHcMg4xwFtgmojoK6K8hJh/y7zhqJjv7jE/UMZX+hfPbyy0kk5eBFCxlBF6L
	/g2T3XfxsInS2NnB+PH6+09cbQgIi/apwLtgikkNnj+BLLQ2wo3m/hbm3ZUn/x3n4UgBhdUpx36
	vW2BNueHfnWA1cXVC39C6UodmR+h6gxY+7XhcJmoLhP2+6O8MLjEf4lLef8BWXY+ptIU0lechcE
	O6SLzX/s4YVBQ6wl4kFI=
X-Google-Smtp-Source: AGHT+IEPmuMPWII7X1xzLl4uOcOYjE9SdNonfcw9rMGDu83rLBRdsyG3VKQm/Qd9un1Jh1rQUFf4/A==
X-Received: by 2002:a05:6512:1092:b0:553:24ed:d666 with SMTP id 2adb3069b0e04-55324edd6cbmr1486452e87.13.1748330254897;
        Tue, 27 May 2025 00:17:34 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f18sm5466494e87.158.2025.05.27.00.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 00:17:34 -0700 (PDT)
Date: Tue, 27 May 2025 10:17:33 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Message-ID: <aDVnDQPSPFFeYgYG@nuoska>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org>
 <aDQqIZgXepLP3xXD@nuoska>
 <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 07:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217284

Hi,

On Tue, May 27, 2025 at 08:34:52AM +0200, Mathieu Dubois-Briand wrote:
> On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
> > On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> >> On Fri, May 23, 2025 at 03:15:51PM +0200, Mathieu Dubois-Briand wrote:
> >> > On Thu May 22, 2025 at 3:41 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> >> > > Add a test case to boot target system via u-boot
> >> > > using qemu with KVM. This was broken recently
> >> > > and workaround proposed to u-boot. Test case
> >> > > works with genericarm64 and qemuarm64 target machines
> >> > > compiled and tested on aarch64 build host with KVM
> >> > > support.
> >> > >
> >> > > Test execution time with full sstate cache is
> >> > > around 170 seconds. qemu boot itself takes just
> >> > > a few seconds to full userspace.
> >> > >
> >> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >> > > ---
> >> > 
> >> > Hi Mikko,
> >> > 
> >> > I saw your other mail saying you will make an update, but as I had
> >> > already picked these patches, here is the build result: the selftest is
> >> > failing on armhost:
> >> > 
> >> > ---
> >> > 2025-05-23 08:50:18,542 - oe-selftest - INFO - uboot.UBootTest.test_boot_uboot_kvm_to_full_target (subunit.RemotedTestCase)
> >> > 2025-05-23 08:50:18,543 - oe-selftest - INFO -  ... ERROR
> >> > ...
> >> > QEMU 10.0.0 monitor - type 'help' for more information
> >> > (qemu)
> >> > Waiting at most 1000 seconds for login banner (05/23/25 08:33:29)
> >> > Connection from 127.0.0.1:43786
> >> > Target didn't reach login banner in 1000 seconds (05/23/25 08:50:12)
> >> > Last 25 lines of login console (1721):
> >> > Scanning bootdev 'virtio-blk#36.bootdev':
> >> > Scanning bootdev 'virtio-net#32.bootdev':
> >> > BOOTP broadcast 1
> >> > ...
> >> > BOOTP broadcast 17
> >> > 
> >> > Retry time exceeded; starting again
> >> > No more bootdevs
> >> > ---  -----------  ------  --------  ----  ------------------------  ----------------
> >> > (1 bootflow, 1 valid)
> >> > =>
> >> > ...
> >> > RuntimeError: core-image-minimal - FAILED to start qemu - check the task log and the boot log
> >> > ---
> >> > 
> >> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1749
> >> 
> >> Thanks, I will take a look. Boot to u-boot seems to ok so KVM is working on
> >> the aarch64 build machine but something in wic image ESP partition detection is not
> >> working in the same way as on my aarch64 build machine and qemuarm64 and
> >> genericarm64 configs.
> >> 
> >> I will compare the runqemu and qemu-system-aarch64 arguments to figure out what is
> >> different.
> >> 
> >> One problem I thought I solved was to change from virtio scsi to virtio blk emulation
> >> but that seems to be effecttive albeit with a warning:
> >> 
> >> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2468510/raw_inline
> >> 
> >> runqemu - WARNING - Unknown QB_DRIVE_TYPE: vd
> >> runqemu - WARNING - Failed to figure out drive type, consider define or fix QB_DRIVE_TYPE
> >> runqemu - WARNING - Trying to use virtio block drive
> >> 
> >> u-boot defconfig does not have scsi support but virtio blk works for disk with ESP
> >> partition in fat format.
> >
> > I reviewed the runqemu and qemu-system-aarch64 arguments but could not see major differences.
> > One difference is that autobuilder runs with tap and I with slirp networking, but that
> > should not affect rootfs/ESP partition detection in u-boot. I've sent out v4 now.
> > If this still fails on autobuilder, then I'd need know what config fragments
> > are applied. I've configured qemuarm64 and genericarm64 with
> > ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS += "slirp"
> > and SANITY_TESTED_DISTROS = "" to conf/local.conf. Maybe autobuilder
> > scripts add something more.
> >
> > Cheers,
> >
> > -Mikko
> 
> Hi Mikko,
> 
> Thanks for the new version, but I confirm it still fails.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772

Is it possible to grab the full boot log
/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1032659/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log.20250526163143 ?

It was referred in
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2499407/raw_inline

That shows multiple tries to boot qemu into the rootfs.
One of them try the ext4 rootfs image which should not be possible
since the test configures wic with an ESP partition and
u-boot should be able to detect that if the block devices
was correct setup in qemu.

Maybe these logs are from previous test and not the one which is failing
which could be the last boot try in the log.

> About the configuration, I believe everything is there:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772/steps/14/logs/stdio
> 
> But anyway, here is the configuration on the worker:
> 
> $ cat conf/auto.conf
> MACHINE = "qemuarm64"
> DISTRO = "poky"
> SDKMACHINE = "aarch64"
> PACKAGE_CLASSES = "package_rpm"
> DL_DIR = '/srv/autobuilder/valkyrie.yocto.io/current_sources'
> SSTATE_DIR ?= '/srv/autobuilder/valkyrie.yocto.io/pub/sstate'
> RPM_GPG_SIGN_CHUNK = '1'
> IMAGE_INSTALL:append = ' ssh-pregen-hostkeys'
> SANITY_TESTED_DISTROS = ''
> BB_HASHSERVE = 'wss://hashserv-eu.yoctoproject.org/ws'
> OE_FRAGMENTS += 'core/yocto-autobuilder/autobuilder core/yocto-autobuilder/autobuilder-resource-constraints'
> 
> local.conf is unmodified (local.conf.sample).

Thanks, I will try again to reproduce. Something is different
but what...

Cheers,

-Mikko
 
> Best regards,
> Mathieu
> 
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

