Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2970EC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 10:42:19 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.49237.1742208133664033373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 03:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oD8PHcRv;
 spf=pass (domain: linaro.org, ip: 209.85.208.176, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30762598511so44633091fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 03:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742208131; x=1742812931; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JmBA/VsX4d4xsLhdk7+sQivB2d65XLiWpTLM/F5i8mE=;
        b=oD8PHcRvKe4R9iH3Pr4eHkScLceEN0wpbmx3xj7/clNyoPam66VXnHgvk+XUz+BNqO
         JfnTGFaP2KaMKY6QKxkuZrCXVfombtJgR5Xl+zDTboCN1EfpU1VF0kMloEKknI5btJoq
         Xz7OS1LUOi3Snob2mFj1fF2k+E1r+hrVHBAWDdNDt7rK5WoN0Ea8JYr2GpoIp3ZU8DLn
         Ekegv2vikQr9FPaM6GVKl+Qdjg8Oprxouwg3g7pn9IuuCbwzsKIAWmxBNHjMly7J4YvG
         4pUrWyEZv1Mr3OuyJFdYfAa5POotAugSBu/59DFIooVaP2rUpuX3f0BG2inaknl1x4RH
         OoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742208131; x=1742812931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmBA/VsX4d4xsLhdk7+sQivB2d65XLiWpTLM/F5i8mE=;
        b=f+BUJgW9ImuDoYaM9XmEarOveBzUL98uYOFhEsat4zv4M7uur90O/Jg0WhipY5fsCK
         L0e4E+X+aRlBa4Q0pmVNcmKJWIFnms7YrQHTlYE8X/A2ZIyTGmNrVjBeAi8VhCU2xvO0
         CqF3AZBZaihSHGhaHCdEj3ZJj/2tlnu3LDc7p6gluhx5JkAEbgQ1Wc44QdiVmQfhErY1
         Xq1+bzBMZzTE3FFxDdi9KmQNpoMDRcQifVABlb3UTz0bY7TzbdaRpYhdz/HiTyZflLt9
         3++JU0VA+BqdsLSo44abtsCtceOEii7sexO0RrSsuAgHK/wull1uyna89dvojDS93kAW
         apnQ==
X-Gm-Message-State: AOJu0YwbM99xggFPvWRxWdLUFkEh7lxfYFI3hfZOqKhG4A6vo8ezSA0F
	ba2rDJgHECDS4CFhdZuMRV7wRlpUpGfex+OkLviqarsx87L3HyKhpRLEMpA10MY=
X-Gm-Gg: ASbGnculxWl5ovxmB0NkhmQULm4DiYykIwlOM7E6k1ESDwkWmQmLidVNkkf+5XsKM8p
	l3KS4/QeLwdKDbpkPxnb6JRR6AzpAWrleE9bYYD3oioz1oTNAO3WJxo2Wm1avfggnfPCHucm73E
	k9cCG6SmRC3DK2Jp25qXpWsmvFGoRziZOkqcpm9X7ZVNEoZwYU1T5RSOPn13B4lrTsUJ321NJRr
	oUyZASzvtJO21k5qIws0duF4BdWMyXFcqeHMz4tyhji63O6Gbs8uLcLLfZ3Cqs/7neyU6oeXjmY
	0EqNV8YX2JWdMH7EIavJG6Mzmk6KHBA6OtwSvjNphkUnPS/OWXOaEe0NeZ3IQ+i84shsUfq+CdL
	eif8dg7E=
X-Google-Smtp-Source: AGHT+IEGQHZo21K4/ovdm6dZYbgAY9oiehioQiTuiTeO1sak+xxUom9CqNzjntUsIYJ4RAteeMNnqg==
X-Received: by 2002:a05:651c:1541:b0:30b:cd68:b68d with SMTP id 38308e7fff4ca-30c4a863421mr66466901fa.10.1742208131466;
        Mon, 17 Mar 2025 03:42:11 -0700 (PDT)
Received: from nuoska (85-76-96-35-nat.elisa-mobile.fi. [85.76.96.35])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0ea468sm15043921fa.41.2025.03.17.03.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 03:42:09 -0700 (PDT)
Date: Mon, 17 Mar 2025 12:42:07 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/6] systemd based initrd and modular kernel
 support
Message-ID: <Z9f8f81oAafcCJBi@nuoska>
References: <20250314111942.304800-1-mikko.rapeli@linaro.org>
 <CANNYZj-DPWnmHev9jS2WR=ZUJMLbQ_CKVVupeKjUYkhN8w65aw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-DPWnmHev9jS2WR=ZUJMLbQ_CKVVupeKjUYkhN8w65aw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 10:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213069

Hi,

On Mon, Mar 17, 2025 at 11:37:29AM +0100, Alexander Kanavin wrote:
> Note that the feature freeze is now. This has to wait.

Yes, I'm aware. Just posted this out as it is 'done' on my side
and need feedback.

The kernel config change RFC is also out but that in current form
breaks things so need feedback how this could be fixed, for example
in specific machines configure features to compile as modules,
and/or which usecases must work with the single kernel binary
without initrd.

Cheers,

-Mikko

> Alex
> 
> On Fri, 14 Mar 2025 at 12:20, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > systemd based initrd supports more security, encryption etc features
> > than custom shell script ones but oe-core lacks support for it.
> > Convert core-image-initramfs-boot to create systemd based initrd
> > if "systemd-initramfs" is set in DISTRO_FEATURES. Includes a test
> > for this initrd to mount rootfs via Unified Kernel Image uki.py.
> >
> > Sadly the boot time is really slow, e.g. over 30 seconds with
> > systemd based initrd. One of the major reasons is the large
> > amount of kernel modules built into the linux-yocto kernel and
> > processing of their udev events in userspace. Thus add
> > kernel-initrd-modules meta package to easily install
> > subset of all kernel modules to initrd. The subset
> > supports "mount rootfs from any block device" but
> > doesn't include graphics, UBS etc support. Without this
> > generated meta package, initrd recipe needs to manually define
> > which exact kernel modules to include which breaks if
> > those modules are built into the kernel. Thus the initrd
> > becomes machine and kernel config specific and hard to maintain.
> > With this meta package a generic initrd can be created.
> >
> > Separate changes to linux-yocto compile a lot more drivers
> > as modules but they depend on these initrd changes.
> >
> > Mikko Rapeli (6):
> >   systemd: use serial-getty-generator on genericarm64
> >   systemd: enable efi support if in MACHINE_FEATURES too
> >   uki.bbclass: drop serial console from kernel command line
> >   kernel.bbclass: add kernel-initrd-modules meta package
> >   core-image-initramfs-boot: add option to build systemd based initrd
> >   oeqa selftest uki.py: add aarch64/arm test with systemd based initrd
> >
> >  .../recipes-core/systemd/systemd_%.bbappend   |  3 +
> >  .../kernel-module-split.bbclass               | 46 +++++++++++
> >  meta/classes-recipe/kernel.bbclass            |  5 +-
> >  meta/classes-recipe/module.bbclass            | 37 +++++++++
> >  meta/classes-recipe/uki.bbclass               |  2 +-
> >  meta/lib/oeqa/selftest/cases/uki.py           | 76 +++++++++++++++++++
> >  .../images/core-image-initramfs-boot.bb       | 28 ++++++-
> >  meta/recipes-core/systemd/systemd_257.3.bb    |  1 +
> >  8 files changed, 193 insertions(+), 5 deletions(-)
> >  create mode 100644 meta-yocto-bsp/recipes-core/systemd/systemd_%.bbappend
> >
> > --
> > 2.43.0
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#212832): https://lists.openembedded.org/g/openembedded-core/message/212832
> > Mute This Topic: https://lists.openembedded.org/mt/111696849/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

