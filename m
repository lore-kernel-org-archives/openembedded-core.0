Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74432C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 09:55:28 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.48257.1748339718760079686
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 02:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=hkuFrifM;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-549b116321aso4314945e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 02:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748339717; x=1748944517; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lmYqoxH/SDdT6sL8shpiySRP+cmfiXX+zIJtyTugbrM=;
        b=hkuFrifMWAiRhyuSQlar0Y1VF8ZDsFExGmWr7WTi4IJ22WbxM9mcng7aMzvJtlrKh9
         YPpx14oTw116+4ouO5YPSAICL6s67brqb5cMJUky4O6AVf79ArTAhu4MtTxEg67SiAMV
         Ij2BVbTRLJekgY2UHI/NguaHe2qVMm6SiFthWh2Jeiww09LhpH/jXtkH4isDPqZ4P7Ti
         9fWw1bns/SCtiNkY/1zhmHUuNA/+wAmihNH2MCxjZK1kvrUS5qpIVvTUNLjZvM8YRs1y
         SwJ51qWdbQBa6BDwMPilgWHhQDHxdyMKxEqdcRkWJ3x2wNVK+OnSeEwtykVciwrQmNPK
         5cTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339717; x=1748944517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmYqoxH/SDdT6sL8shpiySRP+cmfiXX+zIJtyTugbrM=;
        b=TE8tt48wuyCGoVh58KAvKu27Y4AZXs/1rSE4FqVrMUOWi3538VerxDoirQk9E03eaT
         HPkYLADJTqyQ3ptZD2cK5VYJlqn34WH60xb3o7wcgkIV1DUiQk5WE+DI0a159/xE4nnb
         mhEaOKozegTXUuMf2tW5CxzD8QRT++ZhttEPubIwwWQXfbu5XclvDGEvdEclOkL9sINg
         oJq0sWIljrMmRSrDnTC5y6uAdctUWUFS4RLNZba1POE9fBIm+3DL4vGwCUGrcQjR4mjm
         C/FUfD+GvuWZ8j1qBykadMSCy5vpI/zl9z/vIBSuBrlBEG2P8p5AkHERfvGT0siHqDtz
         HjvQ==
X-Gm-Message-State: AOJu0YwYKVr8ZGoDLsJTVdNFRCc7XcLeaY0hX0q8B73/9azLyOQXYORj
	DCkJ+q4w3qg61gSpVMCdc5E7GtCBjhF5xRdmkEco+KzMFnknSX5LYSIpvaYlNd/kOEY=
X-Gm-Gg: ASbGnctFcVduOYecWWeqdIofFo+qgBr43YT7oFd6o2xIj7razl+IshPmtD7QMu773T7
	DIjwYP6aebH+Z3bkGjmdGbhbfU5lwNnJm8tWNHQX8nkb86bhNCznEgUYCQtBjCwWeMGuWE8dPUS
	kjZaVKPSniQGjuy3rjQ2bVS7xA2SLWMnW0MSRL0URwHQSvb+yQ2fKe031ujCvG/llKFdy/3AymC
	p5cXEgC8UNRW7wuV68sqSjpl+5znU3zGcF2ZrwQDPB9AfRp9E11HGVb5x6gx43AkRHpJeCoyPzE
	j7vatAqAa0qfUlKVtXpFJ5V2RKD0j/PWSlp8OKpMh5+2YbK/d5UODx9nUTXQJSseLKM4MDg4nXn
	qCP2H
X-Google-Smtp-Source: AGHT+IFbqf0IFZURU9z+pVLO6ep8rpYoQHnr+1nsoEr0GfN919zWbFQbBAcgyNdAHrKBixGO5hEh6A==
X-Received: by 2002:a05:6512:2388:b0:553:22b3:1a3b with SMTP id 2adb3069b0e04-55322b31b34mr2222801e87.44.1748339716677;
        Tue, 27 May 2025 02:55:16 -0700 (PDT)
Received: from nuoska (2001-14ba-48e-3a00--183.rev.dnainternet.fi. [2001:14ba:48e:3a00::183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532a11e771sm119677e87.47.2025.05.27.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:55:16 -0700 (PDT)
Date: Tue, 27 May 2025 12:55:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
Message-ID: <aDWMA7d77g-JX4p4@nuoska>
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
 <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
 <18422DAC420B1606.3062@lists.openembedded.org>
 <aDQqIZgXepLP3xXD@nuoska>
 <DA6QFY5IH472.13Q6AXZPWICCU@bootlin.com>
 <aDVnDQPSPFFeYgYG@nuoska>
 <DA6RW4W11Z6L.1MNI997UJXXB5@bootlin.com>
 <aDV9qIaaHZu88OQe@nuoska>
 <DA6UBTHJ83S9.34WKJTD4HEHZK@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DA6UBTHJ83S9.34WKJTD4HEHZK@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 09:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217297

Hi,

On Tue, May 27, 2025 at 11:37:33AM +0200, Mathieu Dubois-Briand wrote:
> On Tue May 27, 2025 at 10:54 AM CEST, Mikko Rapeli wrote:
> > On Tue, May 27, 2025 at 09:43:02AM +0200, Mathieu Dubois-Briand wrote:
> >> On Tue May 27, 2025 at 9:17 AM CEST, Mikko Rapeli wrote:
> >> > On Tue, May 27, 2025 at 08:34:52AM +0200, Mathieu Dubois-Briand wrote:
> >> >> On Mon May 26, 2025 at 10:45 AM CEST, Mikko Rapeli wrote:
> >> >> > On Fri, May 23, 2025 at 05:16:58PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> >> >> >
> >> >> > I reviewed the runqemu and qemu-system-aarch64 arguments but could not see major differences.
> >> >> > One difference is that autobuilder runs with tap and I with slirp networking, but that
> >> >> > should not affect rootfs/ESP partition detection in u-boot. I've sent out v4 now.
> >> >> > If this still fails on autobuilder, then I'd need know what config fragments
> >> >> > are applied. I've configured qemuarm64 and genericarm64 with
> >> >> > ". oe-init-build-env" and then added TEST_RUNQEMUPARAMS += "slirp"
> >> >> > and SANITY_TESTED_DISTROS = "" to conf/local.conf. Maybe autobuilder
> >> >> > scripts add something more.
> >> >> >
> >> >> > Cheers,
> >> >> >
> >> >> > -Mikko
> >> >> 
> >> >> Hi Mikko,
> >> >> 
> >> >> Thanks for the new version, but I confirm it still fails.
> >> >> 
> >> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1772
> >> >
> >> > Is it possible to grab the full boot log
> >> > /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1032659/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_log.20250526163143 ?
> >> >
> >> > It was referred in
> >> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2499407/raw_inline
> >> >
> >> 
> >> The file is gone :(
> >> 
> >> I will launch a new build so I can capture the file.
> >
> > I finally reproduced this. The ESP partition is missing grub-efi
> > binaries and only config file is there. I have fixes pending for this
> > missing dependency on aarch64 and of course was building with them
> > in my tree. I will add a workaround to this test case and
> > try get to rebasing the fixes to wic...
> >
> > Cheers,
> >
> > -Mikko
> 
> Oops, I replied before I saw your own reply. Thanks for the update!

No worries, it's good to see the confirmation that issues are the same.

Maybe these files could be captured fully from autobuilder in case there
are failures?

Like in this case, it's a race condition which is not so easy to reproduce.

Cheers,

-Mikko

