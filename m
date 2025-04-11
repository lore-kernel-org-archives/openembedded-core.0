Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F41BC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 10:45:50 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.22820.1744368343191042973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 03:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bUTFInEp;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3061513d353so19023791fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 03:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744368341; x=1744973141; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HXAZlh49fEqyeVtJRibymRJjOVySHzv0QXfGih2bxis=;
        b=bUTFInEpXYe3F2FFm1Ng+ss+Hr7uOlm8AHTxQne9xrnwRrTMZfkIA63kaY4G4v5jx6
         KQQ5kAb/jEpXkTTBDzeISk43eHMhhZJ9dgWZB/lw5tPCTeXifZQGsUgZT8a+G3ebqZLW
         wm/azPOyeTvVmW85MN9qvV6mlN2Gc7pkKKaCHjNQK9HA2VUQsbN41e9R9L3a/Nux1y3t
         2ffqGFfRPwaSYypHS1Gz+DXJ/FJJpyomGj1jVlLxG604ZSdURHSc2Q3z8G9vENuoE5tR
         Ee7m4zkot7iDBuJQIoBYcZgb6Sf7ROZmIqsVfw8X1WpKbydc2O2vd81neACyf9/cvryw
         oUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744368341; x=1744973141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXAZlh49fEqyeVtJRibymRJjOVySHzv0QXfGih2bxis=;
        b=WQm0MrPBH7SLmeIFB7z6Oeu2TCPWugz+h1qVFDJU+8RgvCoHKUg5Z8NkJ1AdGHVF7b
         Fhbh/txzZHMkBBTo2MbXKusTWgXxW8NnHIbYz235gcvUn2pADSyJGoW8WruX71Q+4cXG
         z7ynaZgTzH1rtf66mglMdBdHEb8SoW2yZgLk0cWb/CU2Xk42KDQGGzANu8m3Xzq9bnCn
         oDOX7lyDrZqgacyao1Ok8gSdM/Ky7HSqLKWXaLKTqwzhneVyuj8BPltBbMQr1+Wmd4Xn
         3KVT+o1AkccrMQZ2yKGa22oyx2/SL65OJFcPyD1rWosuqAnuhvzACjeA8ebIcF+58QRN
         UbhA==
X-Gm-Message-State: AOJu0YzlAzffv+efFQHbDutyOdAwokUO7Wb+SUlUJJzYtPXjoQN/KbSH
	bFHriZPt6aY0cvYVDDHHSfOGbqLhnAi3Lpr6VqAD+/TGKu6mWGVNyu+3hbJxyPp9MCF0zKM7FXc
	b0aQ=
X-Gm-Gg: ASbGncv6WHfTOEwYy1JwiZt2dYjNbmGmxOHrSXomGrwWFvjURy3fEjq1XBjR5n+aTlp
	0l/kEFT44nNCYVQ1Ja5yKyhVAssj4m3ClSkiSGECurxRanAdVSGpPFuuOHPsnBzaw8NDFni3eiu
	ahQc8zhPL01e9JEKsYQFBK/VrpMN+xUFrF3Rb3MWP/dqbx9+6KMyEbmsL/fIlBQ41XwHkeW3k9q
	bdNtD6FIRoDMpq6tOO/M0C+6AyIFBw+Fz1dQ6o7X1+V3+c7BJ7aoUFOUyj+mEoszLQd+e7D39rN
	KwME/KUvBrRMFLoHPfaIL8AFyvsI+piQUwBp8U/7fbIdMPbPFa7ecKvSkpcPBvim49MQlZBgJQ=
	=
X-Google-Smtp-Source: AGHT+IGoImj9toSvlD9H+h1jSdSkzmGKJKBwl8ytpsDjaVjFqRA7swHhNma07OiEKOvDcORFXj2GzA==
X-Received: by 2002:a05:651c:88d:b0:30c:557:72b0 with SMTP id 38308e7fff4ca-310499fb2admr5600941fa.14.1744368341152;
        Fri, 11 Apr 2025 03:45:41 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm7845671fa.15.2025.04.11.03.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:45:40 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:45:39 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: mike.looijmans@topic.nl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
Message-ID: <Z_jy0-3v8qVSyll8@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 10:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214731

Hi,

On Fri, Apr 11, 2025 at 10:40:25AM +0200, Mike Looijmans via lists.openembedded.org wrote:
> On 04-04-2025 18:29, Mikko Rapeli via lists.openembedded.org wrote:
> > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > and in u-boot. Boot without "efi" in systemd works with
> > EFI protocols but for example efivars is not mounted at
> > all so various checks fail in userspace. Fix these by
> > enabling "efi" support by default to avoid making
> > it machine specific. Fixes efivars mount to
> > /sys/firmware/efi/efivars etc.
> 
> Looks like all you need to do is include "efi" in your DISTRO_FEATURES for
> your product.

My product is actually oe-core and poky. Machine is genericarm64
which already has "efi" in MACHINE_FEATURES. I help Ross to maintain
this in oe-core/poky. Test target machines include qemu, TI BeaglePlay,
AMD KV260, AMD zcu102, rockpi4b, Synquacer etc. We plan to add
Qualcomm RB5 too but there is currently an issue with genericarm64
serial console there, some kernel driver dependency or module vs
built-in. I hope this gets sorted out soon.

> You're offloading your problem onto others. If your patch gets merged, it
> would mean that I would have to devise some way to conditionally remove efi
> from the PACKAGECONFIG again.

Sorry but sensible defaults are not optimal for everyone. "efi" support
in systemd is in my opionion a good default for oe-core and poky
when systemd is selected as init.

All arm and x86_64 machines in oe-core use qemu with u-boot or edk2/ovmf
in UEFI compatible fashion by default to test things. Yes, systemd
in rootfs will boot without "efi" enabled there but various checks
which rely on EFI interfaces can't be done since efivars is not
mounted.

Richard already rejected making systemd machine specific by
enabling "efi" support via MACHINE_FEATURES. One alternative
could be to enable "efi" in DISTRO_FEATURES for "poky-altcfg"
which enables systemd as init, among other things.

> I don't know what platforms you're targetting, but many embedded systems
> don't use EFI boot, and some even don't have a block device they could put a
> FAT partition on...

I target oe-core and poky defaults. This EFI support does not harm
platforms which don't have EFI firmware. Those configurations can
further optimise the setup including remove EFI support from systemd,
kernel, u-boot/edk2 etc. Many of default machine and distro features
and default packageconfig setups are not optimised for real products.
They are sensible defaults and good starting points. My argument is that
EFI firmware is so common as a default that support for it should
be enabled by default in systemd init of oe-core/poky. Upstream
u-boot defconfigs for all targets enable EFI support by default,
for example.

Cheers,

-Mikko

