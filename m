Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A1DC28B28
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 10:37:49 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.49174.1742207861207982916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 03:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZiB5eTkd;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e900a7ce55so61874916d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 03:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742207860; x=1742812660; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6VNawSKM/nKSwGe55phvRtPAcDLTmvA544n/ejbPmxU=;
        b=ZiB5eTkd7potC+tiNq1aKfDD2zGt8PIfLCGaw/GtkVnNecJlwJrl19PUYUa2DcKkzs
         GEJpGxjxsrrMvhaRTuiPEKJbvybmbjTrwmOUFop8IZx0IDrxCMFl1rC0S2TIBv/ZVMUT
         CVYKqINZ+oTKlZ2h+XvlvLWOV/MjC7qYBad0nFcoFy9O0ytWOH+IDlQEtVwNfSxIDJXT
         MaVxxpK7D4cH029tUGpsGlXC/FbwZvybjYnDm8exKfTBBafi83qFPeeXsD04dQcPdlH+
         bY3bcKK1V/URAEVfinIFi4w6ozLgPRtabzniiQVOjC+X6YUZwHykcJD8zXwrK0u7hQ2Y
         02nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742207860; x=1742812660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VNawSKM/nKSwGe55phvRtPAcDLTmvA544n/ejbPmxU=;
        b=NbUlAlXf5nNXC206tVMU207r6OIOpf/QtA2o7r7CmhGfS++qQJm1C+ErgPTvewiMn9
         ZsVYw9JzZ2PPZJQcUEyAugOd9pdyEksVTf0qkXMuvKoiuOr6KK5AKhOB4u7KsA1gpb3N
         tfJGtPEuZReHg0hS+4vu6L0l37GBPmBMETuO9/if4NZm2rpaLaGY304Mv92gwJmibrvn
         Is6+tChzabw48WUACqa9LhbEZoaLWRoehObf7I7QLTmBeN6LRlTN4i+3F0dDnt4R42Bh
         06lH0Qr/OLN/8x4BT4Lwg6VU7MnKMcX/nmcnTPa12AAMA2c66SearLthxndo4e2uweZ/
         Md/g==
X-Gm-Message-State: AOJu0Yye3AocrSIMvW9sQnpSkQXR9V7Yf+QMyIVEe6MdnHEe5Ns3dFf3
	rJBodKlIUV/e3zhY6KFKO58wTgSVqgvoLMSyJ02S30YFHxbe9yVF32EgsMi/Wy3fO9k0eg7Hp13
	2q7wuT5eahkif3fgU6XhVXLuCUuA=
X-Gm-Gg: ASbGncvl6K5ujNpo+fRwCn60UY1EAk1qEjcjFNu6yCOXUKo7Zmg8f3aOGsn5TvXTP9y
	myJAsNlZZZeFMVAS+M0PFUzyDOhDIB+RSzKtxEvHhSRMw6W2GR6YrRze+AzYWI5q0Py+mXRImVf
	GRaQdDxLJfLzdz7AXbiQqeoHVJmCNm/BgOINC4ACp+OuirTORnyOGqoGOjsCgJ
X-Google-Smtp-Source: AGHT+IFd3vndqMq5Ac1/7Ga7k4s+Y8ZtO3ZFzaM5+xP3dZSllnzZkFXpE0yRCMDwT1nw7a76ZhIAJg3QmgNHGUBFgp8=
X-Received: by 2002:a05:6214:258d:b0:6d4:1ea3:981d with SMTP id
 6a1803df08f44-6eaeab38f55mr140098746d6.43.1742207860158; Mon, 17 Mar 2025
 03:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
In-Reply-To: <20250314111942.304800-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Mar 2025 11:37:29 +0100
X-Gm-Features: AQ5f1JrTpZWDVNsyUMy32OGj-2cgoa_nTwUR3wa2dio-rG-3Z9zfRYE3mVWFPjM
Message-ID: <CANNYZj-DPWnmHev9jS2WR=ZUJMLbQ_CKVVupeKjUYkhN8w65aw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/6] systemd based initrd and modular kernel support
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213068

Note that the feature freeze is now. This has to wait.

Alex

On Fri, 14 Mar 2025 at 12:20, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> systemd based initrd supports more security, encryption etc features
> than custom shell script ones but oe-core lacks support for it.
> Convert core-image-initramfs-boot to create systemd based initrd
> if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> for this initrd to mount rootfs via Unified Kernel Image uki.py.
>
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
>
> Separate changes to linux-yocto compile a lot more drivers
> as modules but they depend on these initrd changes.
>
> Mikko Rapeli (6):
>   systemd: use serial-getty-generator on genericarm64
>   systemd: enable efi support if in MACHINE_FEATURES too
>   uki.bbclass: drop serial console from kernel command line
>   kernel.bbclass: add kernel-initrd-modules meta package
>   core-image-initramfs-boot: add option to build systemd based initrd
>   oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
>
>  .../recipes-core/systemd/systemd_%.bbappend   |  3 +
>  .../kernel-module-split.bbclass               | 46 +++++++++++
>  meta/classes-recipe/kernel.bbclass            |  5 +-
>  meta/classes-recipe/module.bbclass            | 37 +++++++++
>  meta/classes-recipe/uki.bbclass               |  2 +-
>  meta/lib/oeqa/selftest/cases/uki.py           | 76 +++++++++++++++++++
>  .../images/core-image-initramfs-boot.bb       | 28 ++++++-
>  meta/recipes-core/systemd/systemd_257.3.bb    |  1 +
>  8 files changed, 193 insertions(+), 5 deletions(-)
>  create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
>
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#212832): https://lists.openembedded.org/g/openembedded-core/message/212832
> Mute This Topic: https://lists.openembedded.org/mt/111696849/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

