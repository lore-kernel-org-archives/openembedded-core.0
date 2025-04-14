Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB7BC369B5
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 20:48:58 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.5215.1744663733985721003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 13:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AR36AZ69;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4766631a6a4so41943271cf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 13:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744663733; x=1745268533; darn=lists.openembedded.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2l1x3NoaL6Xv2UNoKez/soI2hXOVM+hY+i285dBaec=;
        b=AR36AZ69X9H24TTugTHcy4dVXoUvdYjklDI9W4Ht1ZbTaCVwaaexRL+BSRMk8ViDoS
         oZPi+ZHnxGPEJOx2V+Uy+kgQ5Tzxxj5rg73Ay6sgbdpyuDR22mUvJtXIWyFy0mSfTGXW
         Ma2BNMFRPprFYqLSIMI5Bm8PYu6HNUV1JmV2X1GkHW3Hbdmt9l5VMV6YRzTC4bAZJ/ck
         DJeoLi6/2AHrpfJHgx2h0xwlotL42KvpG+4j+/wMs3g/80qCLs4AFiYQmWbspIBTj6YE
         RU298vNqtszPQZP9D1K7mgzqZeVvpqKtRfa6XfXlvfsZ42tw12Y+Ev0/FAu4FJ/c94fK
         ONiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744663733; x=1745268533;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2l1x3NoaL6Xv2UNoKez/soI2hXOVM+hY+i285dBaec=;
        b=rRq19tGyorNZoJpvy7GiF1oFV18NdFqPqpP2MCdAAd5skcvlq5BqCmaiJectoNThZv
         Wq4OjXMzxkkee8nS0oOuJY46JTOoQHcJFe9qiHZzfwXy0ntcI+RjlE2CZv6aJLfABTxQ
         Gegb16jZwbyzocJbegzIUfTEs90wQ+n5y3iXMOAJRTcl3enCItUYQwdScBtoOMggODJE
         py+fgN6EglDzSb5R5H7uBiXWpvadGGQUfWBwyF5GnFFFTQtfSMJjDHb4RQ7WculR85/x
         Brq104JjP5c4mb3MdrOPsXxK0lz6xRwCnR/hqiRmeufqp9rgK4zd37uSDndPl9Ehe3LS
         p+hQ==
X-Gm-Message-State: AOJu0YzZNuLIywqE0scDgmGuwSZVCjlaDn2tOUvX4E25bbMKctlcK/qn
	wkBNlEPorCvMzFrJG6GOYJ1oXac2jui9Qgv+jXjthshyO70XMICv
X-Gm-Gg: ASbGncu5/oSoXHXa0TGbY7zHTgiSMqmuaqkdzwlxKzLHmQFRWG+zfJApiA01g5LNHmO
	fXdhxW7Gk6GI4FapfvOJ05rqzNe9SpAn2UXAPWHr+cD18hrR3a+rLWXsb/8q8dVVMRnp/SZW/dh
	XQUvqFH0HYxKUBs6A4rZi/f0x56d3LriXrTHmEA7oe9lZlxgQrHJM/nUJXlohxrDny9oxkTmdON
	8FG5jsRBwedDO2pf7Km11SR0di9zSQhHhxuX7wJ1C6UEM8DjEa+Mklete8gUeEzgN0PDrZO5UcN
	a/6i5Ci52r8Cj99Gax3uk3O3dqvakZCDn8KtIn/QcchTSv6fqC8N/ACZqR4T7DN/pIUM
X-Google-Smtp-Source: AGHT+IFJj58ZuTJfjzxfZeRebCw4n7vWtMGxjXW/PxQpv8WmGZUxm5QS+ly/os8EQmX5t0RBVYZ+Cg==
X-Received: by 2002:a05:622a:15c3:b0:476:7112:4add with SMTP id d75a77b69052e-47977540acamr225171871cf.18.1744663732947;
        Mon, 14 Apr 2025 13:48:52 -0700 (PDT)
Received: from localhost (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb175b0sm79354211cf.19.2025.04.14.13.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:48:52 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:48:50 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 11/11] image_types_wic.bbclass: depend on
 grub-efi and systemd-boot on aarch64, systemd-boot on arm
Message-ID: <20250414204850.GB9290@localhost>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-12-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404162932.447699-12-mikko.rapeli@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 20:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214811

On Fri 2025-04-04 @ 07:29:32 PM, Mikko Rapeli via lists.openembedded.org wrote:
> On x86 family builds, grub and systemd-boot are always included and thus
> get built and deployed before wic image builds. On aarch64 builds
> that was not the case. Result is that some builds added systemd-boot binaries
> to the wic image ESP partition and some not, though bugs in wic plugins
> contributed here too since missing files were silently ignored.
> Boot of such images fails since firmware is not able to load the
> default EFI binaries.
> 
> Adding EFI_PROVIDER to WKS_FILE_DEPENDS_BOOTLOADERS is not possible
> because of parsing order so adding grub-efi and systemd-boot
> to aarch64 and systemd-boot to arm depends
> which makes sure their do_deploy is always executed
> before wic image is generated. Thus systemd-boot and grub
> binaries will get copied from deploy directory to the wic
> image ESP partition, and boot of the images succeeds.
> 
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
>  meta/classes-recipe/image_types_wic.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> index 10888bc12b..b2f450026d 100644
> --- a/meta/classes-recipe/image_types_wic.bbclass
> +++ b/meta/classes-recipe/image_types_wic.bbclass
> @@ -113,6 +113,8 @@ WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native
>  # Unified kernel images need objcopy
>  WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
>  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> +WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
> +WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot os-release"
>  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"

Will this not add grub-efi and systemd-boot to any arm-based (64- or 32-bit)
images that are built? I realize that many arm builds are moving towards
grub-efi and systemd-boot, but I'm pretty sure there still exist many that use
U-Boot by itself, and for these builds adding extra, unused code will not be
appreciated.

If anything, this should be behind one or more appropriate *_FEATUREs.

