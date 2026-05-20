Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF94CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 10:36:30 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9201.1779273386397139711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 03:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Er4NZeGC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so68631625e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 03:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779273385; x=1779878185; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fQ9aYeoXKXEPm51f8HqHOVbJZMWzXc1Lfr+JI6ID6ao=;
        b=Er4NZeGCmISouOcpxUnUfolI1QvqrTwRM8kMXCDldr9mwBpuxkzY3dfy4hRi9VQxSo
         SIEJVhtWEcaIbplEeWsHFI2dFUnOElXdgG3W0/sj1fC4AweejiJ3s/E2IfdrcXW9lTW6
         wMQ8rUCyoTa/MiT57q2FqYTznW5orDa678QC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779273385; x=1779878185;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ9aYeoXKXEPm51f8HqHOVbJZMWzXc1Lfr+JI6ID6ao=;
        b=i9nVSV7RCYYBjSiW5DTVNC5gJ7lcUmLanHGC027eyDDXSg3KU7njl8vwyzoR2RHQF1
         f4OgkZtvOrAnHxRTJk8aYFX7p6ECA95tPhQ0iCjlaAG1pa1RyMpbLjPIf6gPoRETlEFj
         lPYk85va5vLVam7T7cJIiZJmigAgWWM60J+pF3th6aavRWQMW808VRt8KsR9Cpn1mdVp
         eeWrehejhExcGuK4xRdUQbIzNZmjrQhWKSjgWTtvo0DRKwBavkKMCKrDxxzjWm3blk8D
         UR2bej8G8aTUgNdYfHWfgLW9tqwk/M3Y7DLzsGhtXImM9fPms1eO0pr8xRKK5QkqcSlu
         LZ/A==
X-Forwarded-Encrypted: i=1; AFNElJ/H7GioXNr/KQDYp6I1jK2zGxW74PKw9zjaNuR/vnUVGA1zx/EPoU3wUy1JVfWXPtkTH3N0DcOk8uzS9fUDDZq/ew==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwQSR+PyS4x570GY4A9BWXEcsKRQZHhkoxwAx4zelt5VeJ6MtyI
	ugz1m2ij0DKUt4Q4HQEV+HhmbDP2sqchZNg6hLbbS3Qbdo0dR1TPlsamtMN/KLAGAEc=
X-Gm-Gg: Acq92OG/64h+u+GJMt9G4Bj9j52HzaDW3XRGkBT22BXS2ATth7thG/kVsqj+ocgi6Zl
	9UWK4t+7acWTkB9eNGwtdIpdtL03aBKJOmJo5Qjilk7TMvPNbCLHr5ZvMK/CwHZC0m82cE1rZ3d
	Fzypy+8I7maVOcu+/p80aQZerqw+TVMEttkhkU7eB3ZlBxNAQ7Abk3vMbFjaVziqMyZyzOiCFd1
	9Rv5lsbhp3nTIALasiaJ5rdDYGvg7TMXpA1MfxyfGFl1PtGXBkkuxFfCI8nqy3BV+de51HmsKGH
	4vj45Ml8ycvi7WfdaVOoERvYGCe2zoyRCjp7L/1eYCDViEHC84g2x2T/K9K3Ntw0NHfaH2mjipp
	s7rB1rveFuSErAlTjSfPKk6033/ffhaZ3eRYv4HyVZNjtEVlaWP0E+dVgPLLH+IPSvDDp1UqrV4
	1Tetmure04bWTkJASUmt/l5AGdTTGTJVrDEqbab3bzW6/3geKClEEazsY6sW20gwx9jcj0y1jy9
	CQ+rR+jgD5v4R7N
X-Received: by 2002:a05:600c:4fc9:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48fe60e58ecmr334766875e9.10.1779273384620;
        Wed, 20 May 2026 03:36:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ba52:db3d:42e4:2c0d? ([2001:8b0:aba:5f3c:ba52:db3d:42e4:2c0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm380059955e9.14.2026.05.20.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 03:36:24 -0700 (PDT)
Message-ID: <6c03f986e436cacfacbf9bef36bb4e37d75b7cf8.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] qemu: fix iotlb_to_section() for different
 AddressSpace
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Quan.Sun@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>, "antonin.godard"
	 <antonin.godard@bootlin.com>
Date: Wed, 20 May 2026 11:36:23 +0100
In-Reply-To: <20260511205209.511914-1-Quan.Sun@windriver.com>
References: <20260511205209.511914-1-Quan.Sun@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237442

On Mon, 2026-05-11 at 13:52 -0700, Quan Sun via lists.openembedded.org wrot=
e:
> From: Quan Sun <Quan.Sun@windriver.com>
>=20
> Backport upstream commit 854cd16e318e ("accel/tcg: Fix iotlb_to_section()
> for different AddressSpace") to qemu 10.2.0.
>=20
> The bug causes incorrect memory load/store when CPU access goes through
> an IOMMUMemoryRegion that returns a different target AddressSpace, and th=
e
> fix replaces the section_index lookup with a direct MemoryRegionSection
> pointer stored in CPUTLBEntryFull.
>=20
> Note that the fix primarily targets ARM/RISC-V, but since it eliminates
> iotlb_to_section() and performs the lookup based on CPUTLBEntryFull,
> it may also help address some currently observed QEMU boot issues
> on x86, e.g. the https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1625=
9.
>=20
> AI-Generated: kiro-cli
>=20
> Signed-off-by: Quan Sun <Quan.Sun@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0...tlb_to_section-for-different-Address.patch | 274 +++++++++++++++=
+++
> =C2=A02 files changed, 275 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0001-accel-tcg-F=
ix-iotlb_to_section-for-different-Address.patch

I noticed this failure on one of my current builds:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/80/builds/3615

which looks a bit like some of the errors we were hoping this fixed?

Cheers,

Richard

