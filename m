Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F68C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 09:08:21 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.16454.1752829700924713822
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 02:08:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tKDBtcIN;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55a10c74f31so2043102e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752829699; x=1753434499; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PIKVGUVDfieNu2nrIftAy2SQSwe2w9AEHQTvbyT9R1w=;
        b=tKDBtcINK+EUox8cG0PyWoFe25ilD9W3Muk8pa/iby1Osux1EUu9PsmUFG3XgzFm/C
         vtQY02ZB7R7ccUB3fcXwS8JfzcbqrGGJRdIZg49zy7rnZeEAoXsO9d/N2JTTFCUh4atb
         h2cRWJo+5dnd1g9DGZQKL44dJl8dJjsztuF4Lu21EpvwmbWM3UONnoaOYMqbDjSlcRS4
         PCWXmD2SLCha/xN+WorhWp2fNDEFFOWJKJMR62Jk2qwoJhZnc5PReOX3EwNUF4/+tbmC
         O5L+BWvPZYNm1JYPYoK8tUgoi2d8cZm/wMeGIQ9r6mIprtd3bWHtllvcO5Jwxs/+TC0t
         gAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752829699; x=1753434499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIKVGUVDfieNu2nrIftAy2SQSwe2w9AEHQTvbyT9R1w=;
        b=UijwKRqikNlavTahnQ7klhUB/KFbiTdymqt7T4/BsxGK+mNkEnYU4gjJVVZCMucB42
         R/F5hszM3WHukVZklkv9eLpAFd5091jEgY1LND8rv+7LAllB6Noqgk4GXL2+vA8zom6s
         gtYF18p/DxcIqi9NY1ToOaHL2qIRkl4ptKgTq62OLvAVtQBCxbPWxqyB5SCP280r3zjd
         zYgV4RbNyepqeLjCu27S9z3d2MfGrjTR37RULpnFB2VpVUGSOdqhlMSVWfm+yn8cGDBv
         W+7AAWi6F51UpQ2oC+z7H96swXpjhmak6WwBDxWEYD/lTF3xVmz/U6WlVn01UBDiOKqD
         jK5g==
X-Gm-Message-State: AOJu0Yz9GzGk98jRmW2nxCE3aSZ6UNMBYcfnkYcU/NSK5PlpRRJ/RAmh
	HPt6HDGukLJgAj6e1pL92GOcm7sv3QJNkeoIatNrTviJkLYsE47qWoExNEcVNUsd7y8=
X-Gm-Gg: ASbGncutokePxz0Vp+49YGIFUzpgeG1pP9h8Few5sYZc9o0BC+U9G5AhrBmHn+McKtP
	keQNhCVA9HaRdclAG2VXx32+LWf5goMZ3edOKx47YQ2gedFMJD5GMa48hga4Hd0Dd4HsxZfM/J+
	yOpmpeTKxZzCLnwxEBVKE0PjB10D5MlZjsMDALUSRnAgPUrI7Lzk+gpYFIjykPBnxYAuCs1xC9K
	99/JBiAChi/28SLRFYnAUv+UMNG6qhshH6djgoB0BwF8McoWAZ7cnJAVXXAFx4KYPpmz8KNa3ZH
	tlNc/4aqzE4dJWh8ub95YO+fKOga9LemwJBimIX4lwzCxQH8VE9VYknyrBDGjy4qPALXl1GyXan
	MiE20HISTuv6baDoDWySj5a/fU+o0Y2Ir1XxhMXXQY9IeOzJmn6bUFTh05ydJ
X-Google-Smtp-Source: AGHT+IGybTZ4nBKzD5ujZ72miUHAUAL6x0A3mj5uqNuFUdEto0bOfpQoAAwaTDfrNdcAKLk+cTV9cw==
X-Received: by 2002:a05:6512:3ba0:b0:55a:2f6e:99bf with SMTP id 2adb3069b0e04-55a2f6e9d3cmr749703e87.37.1752829698872;
        Fri, 18 Jul 2025 02:08:18 -0700 (PDT)
Received: from nuoska (85-76-141-8-nat.elisa-mobile.fi. [85.76.141.8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d910c7sm181761e87.151.2025.07.18.02.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:08:18 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:08:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: upgrade 2025.04 -> 2025.07
Message-ID: <aHoPAE56DPoEITOA@nuoska>
References: <20250716080437.189201-1-mikko.rapeli@linaro.org>
 <DBE6M18ID41K.956HRERV352W@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBE6M18ID41K.956HRERV352W@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220589

Hi,

On Thu, Jul 17, 2025 at 10:19:45AM +0200, Mathieu Dubois-Briand wrote:
> On Wed Jul 16, 2025 at 10:04 AM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > From: Fabio Estevam <festevam@gmail.com>
> >
> > Upgrade to U-Boot 2025.07. Added patch for build race condition.
> > Removed qemu KVM USB workaround since issue is fixed upstream.
> >
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  ...-Makefile.lib-fix-_efi.so-dependency.patch | 116 ++++++++++++++++++
> >  .../u-boot/files/disable_CONFIG_USB.cfg       |   1 -
> >  meta/recipes-bsp/u-boot/u-boot-common.inc     |   7 +-
> >  ...ols_2025.04.bb => u-boot-tools_2025.07.bb} |   0
> >  .../{u-boot_2025.04.bb => u-boot_2025.07.bb}  |   4 +-
> >  5 files changed, 123 insertions(+), 5 deletions(-)
> >  create mode 100644 meta/recipes-bsp/u-boot/files/0001-Makefile-scripts-Makefile.lib-fix-_efi.so-dependency.patch
> >  delete mode 100644 meta/recipes-bsp/u-boot/files/disable_CONFIG_USB.cfg
> >  rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.04.bb => u-boot-tools_2025.07.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot_2025.04.bb => u-boot_2025.07.bb} (64%)
> >
> > v2: added upstreamed patch to fix build race conditon, removed qemu kvm workaround
> >     fixed upstream. Would be nice to check if builds now pass.
> >
> > v1: https://lists.openembedded.org/g/openembedded-core/message/220004
> >
> 
> Hi Mikko, Fabio,
> 
> Thanks for the new version, I really had some hope, but it looks like we
> still have a similar fail:
> 
> ERROR: u-boot-1_2025.07-r0 do_compile: oe_runmake failed
> ...
> | arm-poky-linux-gnueabi-ld.bfd: cannot find arch/arm/lib/lib.a: No such file or directory
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2123
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1971
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1907

I still did not manage to reproduce these but added delays to some more linker
calls which hopefully exposed the same issues. Fixes submitted upstream
and are in v3.

Cheers,

-Mikko

