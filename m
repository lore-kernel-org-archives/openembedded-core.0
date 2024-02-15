Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3591AC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 06:41:15 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.8711.1707979268310790105
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 22:41:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=G0aQZXPF;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51288b2b549so209526e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 22:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707979266; x=1708584066; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gpZ5vvV6K42Z15OE1gY2SX0cQkuLAYyMfEwXqdVaBwQ=;
        b=G0aQZXPFfp3Z7dOkpTvLiAoeyQiKlx9FFb+PmQLN3Vo//VZvWcTQuGGQ/+TJ6sOlkl
         ZUPOSS96InKkNZPxrFsvET3dAkyKMFfzHLREXpYL9tm4Rp139FY7pz8bePWp3U5RfVC0
         rDmPpUjFgvO1luxImJWyuz420y3cAvCa4Tf4k0LdMfC4Dsdm7hx144umEl34Oy2PhES0
         nwgg0mDdzFIkmPVRAXAnJFYQE3i2saERVtPbFmNNslnYshRop3mRJM7cbMEzthuE4fDu
         X+7WYW++JFDVwYzmFP31d0if8lo4v/JcVy7Z4M6vSnKeZ6/39TAxgyLAjT3syYC7V757
         ubeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707979266; x=1708584066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpZ5vvV6K42Z15OE1gY2SX0cQkuLAYyMfEwXqdVaBwQ=;
        b=QqJXqVBMTxWJiNFnpoWls94WGA6okhi7xtxt/B5ecy/c/y7feYGqtvVmefo6/f/y/5
         60n3SpB9PYzUQ3rx7nOrz6ephfraKAEe5D1jFClt8Z1Hh9enZ4+irda7HkhXOqqah/+Y
         cK5huBSacA3NGsEdxY1QjHELWdwmpCEzDDACUfuioi0rUynD23SCyEqa/cwhI1dftJB1
         TBQxD+D7sFXbh/5ywtMxDWE2i9u8p7RhLojgjWJdMz8CrBAZ013Cst0YA4nILW3U+YTq
         eupSpqFZLGOXjRh97ZzpwQ1rakkngq9IRqX79MeIV17Qol/+oKMr8ka0uH3JGka6Qd7e
         l6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ+z9AaLARqrC3nZvLFK5XxbJmQf6MLDTZBOmOc30H23bBN4q4Ucifpiks2t+X79skSs+rUxlHdklmIn2YzgNQGxVkF7/TQvd2CY4GNZZ/5eoXnqRw4s0/
X-Gm-Message-State: AOJu0Yw6dJOZx7RrhPPqCJkneyt+3z/ElZr9u4P+XWb+sy63zQ/nCKxO
	JOXgL8XpOcuLtJxPp+HRdLjfo+repqIHRBaQ0rWY/3Qmgw8SLLFs30uIStJOHfs=
X-Google-Smtp-Source: AGHT+IHoC6e/KMPjW8xKO9DWA8ktKQFgRe4DPbNZJGXJ69mTpOylMxq3Fyr2aWdKOU7zW1OeeG1GvQ==
X-Received: by 2002:a05:6512:124c:b0:511:85ae:8985 with SMTP id fb12-20020a056512124c00b0051185ae8985mr770981lfb.53.1707979266264;
        Wed, 14 Feb 2024 22:41:06 -0800 (PST)
Received: from nuoska (62-183-156-220.bb.dnainternet.fi. [62.183.156.220])
        by smtp.gmail.com with ESMTPSA id d23-20020a0565123d1700b00511850a1e34sm117663lfv.255.2024.02.14.22.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 22:41:05 -0800 (PST)
Date: Thu, 15 Feb 2024 08:40:59 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemuarm64: maximise the emulated CPU
 capabilities
Message-ID: <Zc2x-zmJVO-F4IXm@nuoska>
References: <20240213164223.263232-1-ross.burton@arm.com>
 <ZcyeP_-leKRqfafa@nuoska>
 <0337531C-A455-4011-8641-F892DA243B81@arm.com>
 <e766df8fcfd7a1dd0b8452df9ad0257006ae1be8.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e766df8fcfd7a1dd0b8452df9ad0257006ae1be8.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 06:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195504

Hi,

On Wed, Feb 14, 2024 at 11:27:52AM +0000, Richard Purdie wrote:
> On Wed, 2024-02-14 at 11:06 +0000, Ross Burton wrote:
> > On 14 Feb 2024, at 11:04, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > > FWIW, this can also be risky and cause instabilities. We've seen boot hangs
> > > at least with old qemu 7.2 and kernel 4.xy where serial console detection
> > > did not correctly work on every boot.
> > > 
> > > If things work now, then great!
> > 
> > It worked on the few tests I did locally. I didn’t run it through the AB 
> > yet to stress it in any meaningful way yet.
> 
> I did put it through last night:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6566
> 
> and things are still running. The ptest issues so far look unrelated.

optee xtests are triggering a reproducible RCU stall in our testing with
--cpu max,pauth-impdef=on and qemu-system 8.2.1 from Debian unstable.
This does not happen with --cpu cortex-a57 on this qemu-machine version.

Example test run:

https://ledge.validation.linaro.org/scheduler/job/80815

+ xtest --clear-storage
[  285.552965] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  285.557211] rcu: 	2-...0: (2 GPs behind) idle=a1c4/1/0x4000000000000000 softirq=32180/32180 fqs=2004
[  285.559304] rcu: 	(detected by 0, t=5252 jiffies, g=75961, q=5749 ncpus=4)
[  348.573538] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  348.574771] rcu: 	2-...0: (2 GPs behind) idle=a1c4/1/0x4000000000000000 softirq=32180/32180 fqs=8797
[  348.576032] rcu: 	(detected by 0, t=21007 jiffies, g=75961, q=22677 ncpus=4)
[  411.593692] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  411.594425] rcu: 	2-...0: (2 GPs behind) idle=a1c4/1/0x4000000000000000 softirq=32180/32180 fqs=15573
[  411.595536] rcu: 	(detected by 0, t=36762 jiffies, g=75961, q=40851 ncpus=4)
[  474.614478] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  474.615567] rcu: 	2-...0: (2 GPs behind) idle=a1c4/1/0x4000000000000000 softirq=32180/32180 fqs=22375
[  474.616871] rcu: 	(detected by 0, t=52517 jiffies, g=75961, q=57789 ncpus=4)
[  537.635868] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
[  537.637129] rcu: 	2-...0: (2 GPs behind) idle=a1c4/1/0x4000000000000000 softirq=32180/32180 fqs=29112
[  537.638621] rcu: 	(detected by 0, t=68272 jiffies, g=75961, q=74773 ncpus=4)

The qemu system runs UEFI compatible firmware with u-boot, tf-a, optee etc configured for
secureboot and Linux kernel 6.5.10, initramfs and rootfs with systemd is slightly
behind poky master branch.

This was the kind of issues that we saw also one year ago with max CPU settings on qemu
so the root cause is still not identified or fixed.

Of course the problems could be in our specific configuration with optee and u-boot
based UEFI firmware also on qemu which doesn't need them for basic usage.

I have not yet tried to reproduce this with a local build using native qemu from yocto
build via runqemu/testimage.bbclass.

Cheers,

-Mikko

