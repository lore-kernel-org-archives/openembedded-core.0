Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826D0C28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 11:51:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.50434.1742212261371012754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 04:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DEcSI/0j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d04ea9d9aso8493605e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 04:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742212260; x=1742817060; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y+TYm3oAZRUH1inKXDhvxVvnJ4Y6R3MXYChA17wirM=;
        b=DEcSI/0jky81GFa333xobepbQ+ykF+BtkbQGbP0Jk8y6WK4HNtuHB4JXo1I7i2yswE
         b2/rH76UHwY6GxoJcDwdcZ710LckZqY1lOxeDMdIsn2T595Zt3/eYVDnsib+9rn4Y1/t
         e8ZZvQb9ncGN9kxA7xNbdo5f5WBfCgsuoGOtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742212260; x=1742817060;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8y+TYm3oAZRUH1inKXDhvxVvnJ4Y6R3MXYChA17wirM=;
        b=nwjkQrlTuuNmobqyeahsOajpo5Y8FBvF2tZzeEg4hYyT6SdZdnuK/tKQXJAZoz6Zr/
         +4h2oleMyfBqDfIesQQVzzV6TpixZmUzJz3+wnW0tC2xjzYWULjtw9Th1dxnrqAMoZfl
         kSQ/matRCvBc+EQx213IG6l39WLxl8rE49MM5O0fFHqsSRF+gDHOHgpNE2QvwxNiIrhD
         5iPdxkUfNCUAPGCTtI2xrFbuWBQCXIHMNF0mcbBCvqyJfGX7QoMvW2DK0iBUMhelKRHt
         FCHDWo8Wxatn1xMBny37vmEsldBDoaKVS0z0ROAqtI9FqXKR1hNDtflGZz900KDLFvl6
         TuSw==
X-Forwarded-Encrypted: i=1; AJvYcCXw7WEokQvH5A5p9M4Q5mTjlRTTkwO1JY04dKshdBeBo86vpzRpWN/jhHgBeqbGOKPyYQRHcLZnCT2uFRaL46etQw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWaO7Lfoi2y2nYVPzYEj+X+8E8VjGTsiEg5lmSq7IqHAzK0l3U
	RRI8pd0OO+zl89nDcOlL+t1CJmTmzW2v3lCbWmdHQ60nD9u9O5QMWwCiYd9G1Go=
X-Gm-Gg: ASbGnctEi7kWmudbwGZIrOlgvr29hNSwfOVDADxzRMvFpBlFZgfD7qwEqSNHvSyaLfE
	Q2jTTVkO6gE4lUIjw+M/k6wlnb/cruPh3u0UgNpdwp1taJCYsCE9mSdKUt23udIDdwzUSDeEVDx
	ERDtpp/64s/3QYOsQkyWwIYdYrR6awK1fAVSqyTI6dNxLy+yyVuWXXxH7HpqaqQd9jF8RrqGHnB
	otGGkkHXjRBab2zWgziDkQZtEvgB7IabPcFXGQovTgjJcrVaGzisWMxJ5LGVkNw/FlqvPhiIMPF
	5/jDEOjvxdNCRXeHwfgHZxs+8s/kp2Oh0/Voh2c4fGZuMFfiSYJ5aDamXz0KDrpVpwA2rjtroZX
	p2DqFTO0FZMMFwiq3mdD+Nj/SmWzVBi3ALnhXaw9GGWjx
X-Google-Smtp-Source: AGHT+IFCTvumvKWd7vMCeEkBuTv1l2x2vhOHOhbx3/V4d8tUQan3EDp0zzc3+ynM8WOmbOneQEPVEg==
X-Received: by 2002:a05:600c:34d2:b0:43d:4e9:27f3 with SMTP id 5b1f17b1804b1-43d23c9c437mr89779085e9.9.1742212259767;
        Mon, 17 Mar 2025 04:50:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:eadc:d6a2:789c:c5c2? ([2001:8b0:aba:5f3c:eadc:d6a2:789c:c5c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fad4dsm103448815e9.29.2025.03.17.04.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:50:58 -0700 (PDT)
Message-ID: <d9313e60692d537081323a532bd154493efc5975.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/6] systemd based initrd and modular kernel
 support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2025 11:50:58 +0000
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 11:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213077

On Fri, 2025-03-14 at 13:19 +0200, Mikko Rapeli via lists.openembedded.org =
wrote:
> systemd based initrd supports more security, encryption etc features
> than custom shell script ones but oe-core lacks support for it.
> Convert core-image-initramfs-boot to create systemd based initrd
> if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> for this initrd to mount rootfs via Unified Kernel Image uki.py.
>=20
> Sadly the boot time is really slow, e.g. over 30 seconds with
> systemd based initrd. One of the major reasons is the large
> amount of kernel modules built into the linux-yocto kernel and
> processing of their udev events in userspace. Thus add
> kernel-initrd-modules meta package to easily install
> subset of all kernel modules to initrd. The subset
> supports "mount rootfs from any block device" but
> doesn't include graphics, UBS etc support. Without this
> generated meta package, initrd recipe needs to manually define
> which exact kernel modules to include which breaks if
> those modules are built into the kernel. Thus the initrd
> becomes machine and kernel config specific and hard to maintain.
> With this meta package a generic initrd can be created.
>=20
> Separate changes to linux-yocto compile a lot more drivers
> as modules but they depend on these initrd changes.
>=20
> Mikko Rapeli (6):
> =C2=A0 systemd: use serial-getty-generator on genericarm64
> =C2=A0 systemd: enable efi support if in MACHINE_FEATURES too
> =C2=A0 uki.bbclass: drop serial console from kernel command line
> =C2=A0 kernel.bbclass: add kernel-initrd-modules meta package
> =C2=A0 core-image-initramfs-boot: add option to build systemd based initr=
d
> =C2=A0 oeqa selftest uki.py: add aarch64/arm test with systemd based init=
rd
>=20
> =C2=A0.../recipes-core/systemd/systemd_%.bbappend=C2=A0=C2=A0 |=C2=A0 3 +
> =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 46 +++++++++++
> =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> =C2=A0meta/classes-recipe/module.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 +++++++++
> =C2=A0meta/classes-recipe/uki.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0meta/lib/oeqa/selftest/cases/uki.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 76 +++++++++++++++++++
> =C2=A0.../images/core-image-initramfs-boot.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 28 ++++++-
> =C2=A0meta/recipes-core/systemd/systemd_257.3.bb=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> =C2=A08 files changed, 193 insertions(+), 5 deletions(-)
> =C2=A0create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bb=
append

Unfortunately this series seemed to result in oe-selftest failures on
both aarch64 and x86-64:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1242
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1110/ste=
ps/14/logs/stdio

Cheers,

Richard

