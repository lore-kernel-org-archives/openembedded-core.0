Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AC7C3600C
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 07:43:21 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.33783.1742802192959305758
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 00:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=ZoW6iEeq;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30613802a6bso43008511fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 00:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742802191; x=1743406991; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eIQMZuAd1o7/k/xr9OzhTGA6BtL7vgk2r/5T9N0lYmo=;
        b=ZoW6iEeqwn9tR3fE1VZX84KV1ekVy6jleIlpx8weqbDAHR2KTssp9Gag/bOHmsXhkA
         xEKgW/1zrh2Oqiu9udMKdwIRaJAF06NiJiu/Mh1kH3kQq17Gyz3ytc37VDNaSAooXA9j
         5R4y9m0l20dMnEKpWiwu01SN66vXxVe+k5INqkKz9ATrYJEUby3BszFIBuD9bV9KJNTS
         Xp/P6PCqBNIeKxoo+D27f6o1bctQckV8OeoimLhroSAwJeYevsqG5petRWW1R9hv5M2G
         opSHd7ExNTUqjJqHCKdOvc6vPtfLSydxupn5I/3WIv9Rn5lI6x3LjKghl0SjZ2te/wIL
         ++sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742802191; x=1743406991;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIQMZuAd1o7/k/xr9OzhTGA6BtL7vgk2r/5T9N0lYmo=;
        b=uFnEZbnjFrVWxfFLBxTDlm5KB37PUE39T29b+9LzjT3BalxUmAh1ZZC4IiOd6D4X5X
         ja1A/9ZX9ki/w0TEBmdB+YyXk4O7xt6dTsYlPCk3mZ3IArZLL+E2Ev8Gtj6SPwH0DnuR
         7oIdIaJCPGvsecX+wSdZM57qWRZs3R1ZGMRe23nOsSBPUf8pdXuiFEiTY9coiXIjI2fp
         bupcMG/kVf4SKTGNUjNWq04sfuOjyLiBfBWrIlaMaqF4gbyzvXPrlQoqiKfyfDV5v0sS
         G1w7bzzjTxLirHHn8c472Mr7MPwrNpyZ6XPiZg9bU/opgkNy4YB3dyZuX6jV1S/8rlGR
         l4nw==
X-Forwarded-Encrypted: i=1; AJvYcCV+PItz9FzK8MCChu6aB1kN2L/r5AgLss8NxW6zjXptN1sWCp+CaAKOnI5/BtRbwoQXnN3F0aylEfMb21RsiG8NqQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzi9XYSXP2vIqLj2+5JpxpS16LZpj0X61IS2+mBXouQIlb5dbGv
	Y6FhldRI+JCASdW5scaNo6eEghs0P9spbJa6xHoNiof/pBRDEZhAynVeUhYgl9U=
X-Gm-Gg: ASbGncsYJwN9bTr644P494b3opfOrfOW+6kpC2DRBTcoKpMsb6DO0qecwiedZHh2HZq
	1t4FSGZz94esPBwoIHq6/ZhIzUwuujA/oK9pAx5ELuyyL2Bg1OmY3Z8/8hPZKC7lyYPdgEiEdUW
	nJlR0uqcqh2fbyOndm8iM0AroBOZw+/CCTCpPefQfX4FrkXNyWczIh8Hzy75YaZkumWF4VgeMyV
	kBjOf73OHv56umxNK5VPq1ZXrxujYF2kK8M2GYf0RuD3y0vbhn5LIoEdHwV/zP5UJYUTYg8Fk34
	eObyN6RjYJxg+0fI8kkUIOj6v5NTc052m6EjdyxzZfV8afZYMoBcDxORj5TyQ/YzYKxuCJnXjMx
	Dcg==
X-Google-Smtp-Source: AGHT+IFNwvVddv5VexcRV+UoTsno4+lr/FPXi+E3pUwJBMSctVLgLsi5YlZoybm5jgyirQK+i49UvQ==
X-Received: by 2002:a2e:90d9:0:b0:30b:b184:a8ef with SMTP id 38308e7fff4ca-30d7e234ef9mr32530391fa.14.1742802190925;
        Mon, 24 Mar 2025 00:43:10 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d914054sm12913581fa.108.2025.03.24.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:43:10 -0700 (PDT)
Date: Mon, 24 Mar 2025 09:43:07 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 01/11] systemd: enable efi support if in
 MACHINE_FEATURES too
Message-ID: <Z-ENC7b_-K6L6tV5@nuoska>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-2-mikko.rapeli@linaro.org>
 <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
 <182FACA25EBBEBE7.22661@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <182FACA25EBBEBE7.22661@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 07:43:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213513

On Mon, Mar 24, 2025 at 09:29:48AM +0200, Mikko Rapeli via lists.openembedded.org wrote:
> Hi,
> 
> On Sun, Mar 23, 2025 at 10:53:59AM +0000, Richard Purdie wrote:
> > On Fri, 2025-03-21 at 15:25 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> > > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > > and in u-boot. Boot without "efi" in systemd works with
> > > EFI protocols but for example efivars is not mounted at
> > > all so various checks fail in userspace. Fix these by
> > > enabling "efi" support if it's in MACHINE_FEATURES.
> > > Fixes efivars mount to /sys/firmware/efi/efivars etc.
> > > 
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > > �meta/recipes-core/systemd/systemd_257.3.bb | 1 +
> > > �1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
> > > index 64fb8fe69a..9bc4532021 100644
> > > --- a/meta/recipes-core/systemd/systemd_257.3.bb
> > > +++ b/meta/recipes-core/systemd/systemd_257.3.bb
> > > @@ -69,6 +69,7 @@ PAM_PLUGINS = " \
> > > �
> > > �PACKAGECONFIG ??= " \
> > > ���� ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > +��� ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
> > > ���� ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
> > > ���� ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
> > > ���� ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
> > 
> > This makes the systemd recipe machine specific which isn't currently the case.
> 
> Can we enable "efi" in DISTRO_FEATURES by default?
> 
> That would solve the issue without checking MACHINE_FEATURES in systemd recipe.

Or we just enable "efi" support in systemd by default, or bind it to the new
"systemd-initramfs" DISTRO_FEATURE.

systemd in initrd doesn't work if the EFI ESP partition isn't mounted
and for that the 'efi' support needs to be enabled.

Cheers,

-Mikko

