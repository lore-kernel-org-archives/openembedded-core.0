Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657E6C48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 13:23:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.12749.1708521832847422416
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 05:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=p6ELge0O;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512d19e2cb8so822166e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 05:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708521831; x=1709126631; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5NQRUghrJJsAFAR2pToz6SztVMgIdhBmYfRmJAFPwe4=;
        b=p6ELge0O8jm8fEGhC+PkF5UDWFRyjEoG5S19OSJbQZaF/ylrrqSNaIFPtGzV3i1gqJ
         +G81TI3NQwPIguk8xk3RzunEJ5vElDswsi/CatFqQbm0Id8x+wEhkXKFdaZ/NOU6arI0
         zY4I5GzwgahVr0ULb5q4ZBNzog0zLs706cGnSd5/xhO4T60wS3ePmE3AZOrJk5R3Rrn4
         IDVR1pwdbFtCXzXVsyz6WLOPv/2tPoLPuktiTyYUghgk/Yhiv2djVzXNbIVZeyfgCJ0w
         ApNa+K6NCREVfgwUbDo99741TROjXcyf/j4COWhMB0HoJMCcRPe/SLrWkwDdxeYNEtQd
         LW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708521831; x=1709126631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NQRUghrJJsAFAR2pToz6SztVMgIdhBmYfRmJAFPwe4=;
        b=soT6OIoHnZU25HwGZErN4TWHsTILhwNLD/v5jSWD+a2PqunLpNxTX1wz272n+hvOPM
         cZ1Zyt/rXlMa2pVUYcwn2gpchlhJe23VgzFoutRkHYWdLXZhxS7zOM3GJri+Y4RVYyV5
         s3FMb9rtSPh132IHAH5dp8ygBZ8j0OvzmuRe5hsi0y4AZnjttnnJDn8eNtI96BnuL/C4
         roR1rPRWdTWOSaCihG2GP2CxrJKFhbYN4sCNynCFN5T8YuvAIO9AT9efhzskDp3VhgUR
         Op8hvobd5YdzahLYz8W6YWAKVBoqz94bBh8PDsVs8tgWtkTL90PRgVZOyZj3QBL8LTS9
         FQqg==
X-Forwarded-Encrypted: i=1; AJvYcCVdNyLVoZXN98s9QesRwvb3RIpyH9m/HDAF+GvRdVthM9yAG2bsHc1bSgPe+g3p6nuVEKubXsLaX+vxjZZ+oUXG82wzEPKkGAeZJAh81dQErkZChNCF3wIx
X-Gm-Message-State: AOJu0YxrazHVaRhkNps3EjhK3qPKuEqE4cVrxBIWZ2y/f5BG3TZS0eMU
	Ia/koUYxC+LYBKuWzu983aYlp18Cju/zKpMNSKtqrLRPdo20Sq0gXG+24YxyE+4=
X-Google-Smtp-Source: AGHT+IEGpSg1mROUl5p7/YkY6Enor38YnSgNWFzLmi6/cn1FA2SIrTVypldm+968FxFjog5/3/dmxw==
X-Received: by 2002:a05:6512:3d24:b0:512:ae18:74a1 with SMTP id d36-20020a0565123d2400b00512ae1874a1mr7822618lfv.11.1708521830897;
        Wed, 21 Feb 2024 05:23:50 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id t17-20020ac25491000000b00512ccd966f7sm399045lfk.256.2024.02.21.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 05:23:50 -0800 (PST)
Date: Wed, 21 Feb 2024 15:23:48 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, poky@lists.yoctoproject.org,
	openembedded-core@lists.openembedded.org,
	openembedded-architecture@lists.openembedded.org
Subject: Re: [Openembedded-architecture] [RFC PATCH] Add genericarm64 MACHINE
 using upstream defconfig
Message-ID: <ZdX5ZJAVibNJQj7x@nuoska>
References: <20240221105723.1501833-1-ross.burton@arm.com>
 <ee6a686362c533dc70c442b64c96ca23b8bde45c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee6a686362c533dc70c442b64c96ca23b8bde45c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 13:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195971

Hi,

On Wed, Feb 21, 2024 at 11:21:39AM +0000, Richard Purdie wrote:
> On Wed, 2024-02-21 at 10:57 +0000, Ross Burton wrote:
> > From: Ross Burton <ross.burton@arm.com>
> > 
> > This is a new 64-bit "generic" Arm machine, that expects the hardware to
> > be SystemReady IR compatible. This is slightly forward-leaning as there's
> > not a _lot_ of SystemReady hardware in the wild, but most modern boards
> > are and the number will only grow.� Also, this is the only way to have a
> > 'generic' machine as without standardised bootloaders and firmware it
> > would be impossible.
> > 
> > The base machine configuration isn't that exciting: it's a fully featured
> > machine that supports most things, booting via UEFI and an initramfs.
> > 
> > However, the kernel is more interesting.� This RFC uses the upstream defconfig
> > because unlike some other platforms, the arm64 defconfig is actively
> > maintained with the goal of being a 'boots on most hardware' configuration.
> > My argument is: why would we duplicate that effort?
> 
> Can you point at the policy/process which decides how a config option
> makes it in there?
> 
> > The "linux-yocto way" is configuration fragments and after a week of
> > hair-pulling I do actually have fragments that boot on a BeaglePlay, but
> > to say this was a tiresome and frustrating exercise would be understating it.
> > 
> > So, a request for comments: is it acceptable to use the upstream defconfig in
> > a reference BSP?� Personally I'm torn: the Yocto way is fragments not monolithic
> > configs, but repeating the effort to fragmentise the configuration and then
> > also have it sufficiently modular that it can be used in pieces - instead of
> > just being a large file split up into smaller files - is a lot of effort for
> > what might end up being minimal gain.� My fear is we end up with a fragmented
> > configuration that can't be easily modified without breaking some platforms,
> > and badly copies what the defconfig already does.
> 
> Let me play devils advocate.
> 
> I do understand it is a pain, equally, once you do have it working, it
> is something you rarely have to touch again for a given board.
> 
> In the context of linux-yocto, I suspect we'd end up with a few board
> specific lists of config options (fragments) that board *really* needs.
> genericarm64 would end up as the sum of all those configs, plus any
> other bits which you really want in a generic machine, presumably the
> genericx86 machines have an idea of that.
> 
> The advantage here is that you give the users three options:
> 
> a) the kitchen sink upstream "systemready" defconfig
> b) the genericarm64 machine defconfig which works most places and�
>    is�'guaranteed' on our target test platforms
> c) a machine targeted defconfig with only what a board needs
> 
> Developers/users end up in different places at different points in
> there lifecycles.�
> 
> For in depth development, you might like to be able to cut the kernel
> down so you'd not rebuilding tons of stuff you don't need/use/care
> about each time, nor transferring it to a device during updates.
> 
> For a specific product release, you again might want to trim it down to
> what it needs.
> 
> If you're shipping demo software, a full systemready image would be
> much more appropriate.
> 
> I think it comes down to whether the fragments are usable and testable.
> We have a list of targets we want this new machine to run on so lets
> start with those, define genericarm64 as that set of fragments combined
> plus the generic pieces linux-yocto adds, then go from there. If you
> add a new machine to the test matrix, we add a new fragment. If someone
> wants to add new config, they need to show a machine using it.

FWIW, we have been using upstream kernel.org aarch64 defconfig plus
few board specific fragments and few extra features for our testing needs.
I have been very happy that several major kernel version updates have already
been done this way and zero adaptations needed on our side for the
ARM SystemReady boards and firmware which we support. A simple CI run to show
passing test results was sufficient for a poky update with new kernel
major version.

The implementation here looks pretty much like ours. Looks good, thanks Ross!

More details of our setup:

https://gitlab.com/Linaro/trustedsubstrate/meta-ledge-secure/-/blob/main/meta-ledge-secure/recipes-kernel/linux/linux-ledge-common.inc?ref_type=heads
https://gitlab.com/Linaro/trustedsubstrate/meta-ledge-secure/-/tree/main/meta-ledge-secure/recipes-kernel/linux/ledgearm64-kmeta?ref_type=heads
https://trs.readthedocs.io/en/latest/

Cheers,

-Mikko

