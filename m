Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3F0E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 11:39:51 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.61054.1735558785094954971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Dec 2024 03:39:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cnbj1nOz;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d88cb85987so74287746d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 03:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735558784; x=1736163584; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nagilekXIkwNyWbm8jay/D/61VRqBSPJH4PFLGsv4Aw=;
        b=cnbj1nOzm9PjiTMPTt+Clx96Sb2A/quieJGwF7qQj7qeo5kKcVqEMsSKkg7UkLvjtr
         T8BpVtj8PJ6Xh9PiQP7L7TiV/aDjbxbVSNbxn3fMcqarUXcmOm9epreETcRytHi1hSht
         GGleiZFzdnP4TTWpMcfqWtA2Iiag/c98/VyPSLYLbnWqm6HUOWGlbuXgO931630diPNK
         2fKK5O1AgbUnziAEfnH2m/yr91vNUBlhIVtLTxuu823IJ4hCbhpxmNvANnYkwiApPTPb
         /v5boEAGWKkXiRFzZfU3vp43OPvEfSkesRrNNBoCPSzACMbQa5xwMalGlJRVOS4luKcO
         w5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735558784; x=1736163584;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nagilekXIkwNyWbm8jay/D/61VRqBSPJH4PFLGsv4Aw=;
        b=dtyzwGGW0tfFNP3sbzgL2eREk5nSzkJpdYtz4E5Qy+QeCj1gX+5TA3ZpVeTiWQ5dnM
         upzjzSXXcczUuLJO9cM+Bpc35uy+5kgmLWqtRMp11demS5hf7DGWQa0/8G8bblgwut3B
         WG+kd30r584oaSuHKUJOwMW/Jb4VLM9Hmxz5JqDzNS81nc7YkWmIle3xePvOirkiLDw/
         UpUAJ622P1J1qTV+XczDyEHVvUW5Wy4erJBy7E+CtHoosc5fAUl6Y3/uMWH5wwCnActf
         WDtTMncyzWH19Rpbo5dB5p0lY9xKnt3zdhsXFyjeC46ckcDXzv2u8Z0WtYN0IzpYvS6L
         M+/w==
X-Gm-Message-State: AOJu0YwVKVx2QP9G+lTPTYx/6+Uxa4q8kHsN3IxSm0zIXdIiCLLF4GQ1
	5H4XTP1TldJAOe/0UC7G0UnZQ/xM2u2xpqi1u3J6VV0/yC3YP1r5XmRHCy8RwuakhjwBx6YCPdZ
	28oq4xCZJT04qOwJVhX9PAGuQoELpNw==
X-Gm-Gg: ASbGnctbdrHGSqesCPY9K3joXPpzHZlbnrxpv/59Z851khNmUd1HczE7zNcRhasL8hh
	sA6tJGzy7gysApK/cJ9372q5Gpvcqycf28nwwKZCA/drmq6gpwymGabh4feiV+PT8FQKk8rPO
X-Google-Smtp-Source: AGHT+IHSeOqv1Ym7F71Lsf/1b06dmQqCsRYwgNIOimHtFO3dvaRm5bdeo4Q12tKBmGWJJiYHy921QFcFHKtsYIc4xiI=
X-Received: by 2002:ad4:5ca7:0:b0:6d4:287d:b8d9 with SMTP id
 6a1803df08f44-6dd23582b1bmr561174106d6.2.1735558784000; Mon, 30 Dec 2024
 03:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20241228090618.700985-1-hongxu.jia@windriver.com>
In-Reply-To: <20241228090618.700985-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 30 Dec 2024 12:39:33 +0100
Message-ID: <CANNYZj_+d_ZQpeeXQ1MGkkxGpD=o4H7M86L87s2_Vx14yqZxMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] initramfs-module-install/core-image-minimal-initramfs:
 remove loongarch64 from COMPATIBLE_HOST
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 11:39:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209156

I wonder about this patch series. Shouldn't we rather check if
incompatible items can be made compatible, instead of simply giving up
without even trying, and then propagating architecture disabling
throughout recipes?

For example, grub does support loongarch64:

https://git.savannah.gnu.org/cgit/grub.git/tree/grub-core/kern/loongarch64

I'd also like to see what happens when valgrind is actually built for
that architecture, and have it documented in commit messages. And
kexec-tools as well.

Alex


On Sat, 28 Dec 2024 at 10:06, hongxu via lists.openembedded.org
<hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
>
> Due to initramfs-module-install runtime depend on grub, and grub did not
> support loongarch64, remove loongarch64 from COMPATIBLE_HOST
>
> $ echo "MACHINE = 'qemuloongarch64'" >> conf/local.conf
> $ bitbake world
> ERROR: Nothing RPROVIDES 'grub' (but oe-core/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb RDEPENDS on or otherwise requires it)
> grub was skipped: incompatible with host loongarch64-wrs-linux (not in COMPATIBLE_HOST)
> NOTE: Runtime target 'grub' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['grub']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'initramfs-module-install', 'grub']
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/recipes-core/images/core-image-minimal-initramfs.bb        | 2 +-
>  meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> index 36e8771c4a..4e210d1bf3 100644
> --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> @@ -32,4 +32,4 @@ IMAGE_ROOTFS_SIZE = "8192"
>  IMAGE_ROOTFS_EXTRA_SPACE = "0"
>
>  # Use the same restriction as initramfs-module-install
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
> diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> index b87e59f347..d6d8348731 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install_1.0.bb
> @@ -5,7 +5,7 @@ RDEPENDS:${PN} = "initramfs-framework-base grub parted e2fsprogs-mke2fs util-lin
>  RRECOMMENDS:${PN} = "${VIRTUAL-RUNTIME_base-utils-syslog}"
>
>  # The same restriction as grub
> -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|loongarch64.*)-(linux.*|freebsd.*)'
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
>  COMPATIBLE_HOST:armv7a = 'null'
>  COMPATIBLE_HOST:armv7ve = 'null'
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209113): https://lists.openembedded.org/g/openembedded-core/message/209113
> Mute This Topic: https://lists.openembedded.org/mt/110315561/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

