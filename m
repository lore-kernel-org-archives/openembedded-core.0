Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B699C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:12:20 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.31743.1744283530573084576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=VNK8nKgj;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499d2134e8so851911e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744283529; x=1744888329; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sH8NervwvEGNUCXfNrnfQo5E6yr7nFQwZ1F8xVacjA8=;
        b=VNK8nKgjnPBlDU83KWXDN69wpBFQiCyXvSoXMrRd6mtchF5APqWf4hLiwYntl13GVV
         geRo71pS7yyu4bJPGhifdRkr7biFPEFYJ4Fy0Hhkh+wngIw7kTd8dcpormZzml+VBZ/v
         rwpkpbEVFAr/Vbt80b/rCtHuZmumib1X3sm2LgmExwoHgkunm01lnjQfV/FnvBfY+iSe
         yD9gZ+zY8VWUzvI3IgWFzEMcq8S/jT8NtyOt3bQO/lTxHAGERlPHWolNiO+1gTLqlFQV
         HVbY7iRCf//wK+Z9G2FXO87MXOq62yI69C8sBByWqaYXRqpc9sbWdiqKt3IAlfnYO3D6
         ZahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744283529; x=1744888329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sH8NervwvEGNUCXfNrnfQo5E6yr7nFQwZ1F8xVacjA8=;
        b=XLfA9c4Ks050zFkhMIng55/8UOMbornwQej27wOx5FLhtu7ROLKO1aS7X08rrc/EI6
         5F174QkJZ1C0HMutZJQt/u0xj8j2h/+ejsMXNYhPVW9JZPAf6oSpUrvuRvzWG0peIQhD
         AvNrfh6vuTu6DtgYsVGn8fpQ94bV5ljTSPnPRB65ZTQLTBOJhQ/ePJq8LMuJHYiDYNPu
         QSQoWdNxOb5msfKpqtGglZ52CWFSSvAd9sVica1RRB4neYL8j0jSS21pDscMSjrIN90j
         rnjjZii+Wt8tiSnmT9sneGXewINRD5fjfDcAdIBHFcnPdO+nlXjJtrwQKZw1E3z9t1Rm
         A70g==
X-Gm-Message-State: AOJu0YzPQoD+tDwTwsAosZwmWWdaS7Ll4grHBs28BZN+Ckvqz6DeHeXH
	DwJK2KJK04taHkZrDaCCpXA3Ya+mrFbCxz5Lw4xq0AF8IpyXRkxX4sNJCMnvAjA=
X-Gm-Gg: ASbGncvBL7Eezhzb99sdLd/yCjuCtkjaDJTwZRI+nk1lbxEyn4YkYfUwcVwbgnX9CPD
	Pqr7EeHBlxQHiU3GytNR417V2ldnEJ/EgcvohPqVhZVpHiBYcpJA009imqjEqyuVqhvMT5jgWe7
	W1EKg1RQEKjmv1g0huQXKNYAqIf/FHKe734t4ts8IDaapBqp4IhGaEh9+ACR8DtQIqWDm0mISYF
	eFRfUZmiIijRQWGP97pbaey16HmmjKhFrCERfsiCuXLgT8gzGPJ6DXLVBz4OHFxRXrwdJzNdRO7
	O5B8axIwqoHvsXwI4CYalyR8tvZjyK2DWCnmNLcQBRuoXv2xvvHXz2xkK/GizngJ0CWuhWg5oQ=
	=
X-Google-Smtp-Source: AGHT+IGnHemGh6HihL5qU8XFk67E52EHKKUsJbwmdss3IO0+4rixrbrL1o5TSWIOtubIxFwE8spDag==
X-Received: by 2002:a05:6512:1106:b0:549:9044:94b3 with SMTP id 2adb3069b0e04-54cb6842892mr500023e87.29.1744283528438;
        Thu, 10 Apr 2025 04:12:08 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d5035easm119303e87.151.2025.04.10.04.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 04:12:07 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:12:06 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
Message-ID: <Z_enhh1PJ9ddQLe_@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214644

Hi,

On Thu, Apr 10, 2025 at 12:16:18PM +0200, Adrian Freihofer wrote:
> Hi Mikko
> 
> On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > and in u-boot. Boot without "efi" in systemd works with
> > EFI protocols but for example efivars is not mounted at
> > all so various checks fail in userspace. Fix these by
> > enabling "efi" support by default to avoid making
> > it machine specific. Fixes efivars mount to
> > /sys/firmware/efi/efivars etc.
> 
> My point is that many OE/Yocto-based embedded products rely on a fully
> redundant and power fail-safe firmware update and boot implementation.
> So far I have not understood how this could be implemented in a
> similarly robust way based on EFI as we have now without EFI-based
> boot-up. I would therefore like to see the EFI implementation remain
> opt-in until it covers at least the most important use cases for robust
> embedded systems. What I primarily miss with EFI is a reference
> implementation for an A/B update system without having to rely on a FAT
> partition without journaling. Please correct me if I'm missing
> something!

AFAIK, UEFI firmware update solution is so called "capsule updates".
How UEFI implementations handle this and if they are fail-safe is
up to implementations like u-boot and edk2. AFAIK, the standards
don't say which file system must be used and thus an ext4 could
work too for ESP partition. And note that fail-safe may also depend on HW
features; a block devices may report that write completed but
keep things on internal volatile buffers due to "performance".

This change really has nothing to do with firmware updates and only
enables systemd to mount an ESP partition, read EFI variables etc
by default without binding systemd to MACHINE_FEATURES.

All x86_64 and aarch64 distros do this already. Tiny distros can
disable this and/or avoid using systemd completely.

This really is a very minor detail of default systemd
configuration. Systems without EFI firmware don't break.

> Would it make sense to declare poky as an EFI ready reference
> distribution by enabling the efi DISTRO_FEATURE there, rather than
> starting with making recipes enabling efi unconditionally?

This could be possible, but then a decision would need to be taken
if UEFI support is enabled in poky and/or poky-altcfg distros
and how would non-efi be tested.

> Could something like this in poky.conf work?
> DISTRO_FEATURES:append:aarch64 = " efi"
> DISTRO_FEATURES:append:riscv64 = " efi"
> DISTRO_FEATURES:append:x86-64 = " efi"

Possibly. Why not all architectures?

Do you have examples where e.g. build fails due to
this change?

This change does not add new build dependencies. It
just enables UEFI support in systemd to detect
compatible firmware at runtime and do some basic
things with it.

Cheers,

-Mikko

