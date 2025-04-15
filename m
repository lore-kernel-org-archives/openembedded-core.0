Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9B3C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 05:02:11 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.13152.1744693322346078303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 22:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QobxSWGB;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-549946c5346so5785029e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 22:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744693320; x=1745298120; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2+Q5I6RBGw9eOudCmHJZDgANOKnxpVY8zubgqxMaZdk=;
        b=QobxSWGBR+JiGT7o0D0sqwXy1gByvpNyHYxGHYlZyOCI/iG25gD/AkY0fnldDu7hSQ
         y+GHiI1vZcIVOFWQ1ISA5glIHhQ5a2tWAvfHuJckxD8HJ0oSr8UNc8JAei4tp4BwbLgc
         kYeIn6JB4VddYRbVNGRtSuhT+fKsi2YSBRF68/dpo1OMhIVhYqv4bVUgtep+D7P+xICW
         1DKTn430M45oKPGKxfxfNBsd4qxeUE8Z0NlXNtWKK9OzaofHgcbVZ15WvrbzYVzBiN0y
         udcnpK603RMu/JeVnfZMvD6jxvUUG4Ya0xy4iRp12qEtAw/lwiW9FTYQQkVN/FnPmTGz
         vYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744693320; x=1745298120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+Q5I6RBGw9eOudCmHJZDgANOKnxpVY8zubgqxMaZdk=;
        b=VTWmJtzkt9mXI9TCMbVcxrF0KWzos6eZPEVWsogJaAEGXPc7qFX0TQgy9tq+/GpUgw
         WtN1WEFb1hzDepd3RUbN6rwpfn/grUOp+bURA/xR3yjxrGy8pLQ9Kt0EKlT8QP2YmDxz
         IVGSDlgVkEeXmzeHVb6qVkqAqmeCKwMmWHGBqutMgpNnCrwoWxMLJv2whSOcGb8quIot
         1Xc0q7ne0oxPFcM7jptVBkIgcc7voLqy2MfMHl45L8TA/+UCkwmI4V532XzTWuyCKGlP
         JVhpJ4RszF5COmw00oF5mKOjA9H7Sc0vHsFTHt7ca2zuLwVDmfsug6PdaUF6eH8lybLz
         Wk+Q==
X-Gm-Message-State: AOJu0Yxf/yFoYgV6Hs/2tAU498dBVPiFlFl9rWUY60v8nJOV+GGqcg4f
	B2CDVH65cN6WKHY1VPzHya1kz33lKO89Fv0eT/BIgvJKBYtoTWb/MzHD5JEp0Do=
X-Gm-Gg: ASbGncuSMUAVlbsv1eogFAXuz6TO9xJWrM27kmsgtyvX2uBTPDvfQRVB63NoHlaNMya
	MjXgboLl/wGQleaLi1DLNSr6a+KHPd+jVdx7Av/HjknYdO5FPAln1MUDra8WxIspWiCw+64+0pc
	TeUlZ6w4V1m0mla8iFmFnIOjkM+SS/F7jt5R77/7j3cGQRpNFjnIeK/DHCguJ61jI5LRctqggsa
	isdOPhpfypalbP9JhLCfNpzzQa1MAnCcDzX4Md+qaSdGPTsoSGIQhmFqS4CszSAs9Tb6/FKfjqq
	zMlO4NfwEASEWLuukxTTNTwnY4GW1ypy7FXxvRG64CwoYuPKwMEGARd+PtSQq397BrtC4knePg=
	=
X-Google-Smtp-Source: AGHT+IFamBpwQj8dQVquIfdxH9t9fCLyXapKqQQ65MR+YgiTtuefZ/3J6VxnRG71MA/k4r8M99Ucnw==
X-Received: by 2002:a05:6512:1584:b0:545:1db5:f224 with SMTP id 2adb3069b0e04-54d4528aab0mr3998813e87.11.1744693320403;
        Mon, 14 Apr 2025 22:02:00 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d123e44sm1302871e87.48.2025.04.14.22.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 22:01:59 -0700 (PDT)
Date: Tue, 15 Apr 2025 08:01:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 11/11] image_types_wic.bbclass: depend on
 grub-efi and systemd-boot on aarch64, systemd-boot on arm
Message-ID: <Z_3oRm6b1LB13b27@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-12-mikko.rapeli@linaro.org>
 <20250414204850.GB9290@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414204850.GB9290@localhost>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 05:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214819

Hi,

On Mon, Apr 14, 2025 at 04:48:50PM -0400, Trevor Woerner wrote:
> On Fri 2025-04-04 @ 07:29:32 PM, Mikko Rapeli via lists.openembedded.org wrote:
> > On x86 family builds, grub and systemd-boot are always included and thus
> > get built and deployed before wic image builds. On aarch64 builds
> > that was not the case. Result is that some builds added systemd-boot binaries
> > to the wic image ESP partition and some not, though bugs in wic plugins
> > contributed here too since missing files were silently ignored.
> > Boot of such images fails since firmware is not able to load the
> > default EFI binaries.
> > 
> > Adding EFI_PROVIDER to WKS_FILE_DEPENDS_BOOTLOADERS is not possible
> > because of parsing order so adding grub-efi and systemd-boot
> > to aarch64 and systemd-boot to arm depends
> > which makes sure their do_deploy is always executed
> > before wic image is generated. Thus systemd-boot and grub
> > binaries will get copied from deploy directory to the wic
> > image ESP partition, and boot of the images succeeds.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/classes-recipe/image_types_wic.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> > index 10888bc12b..b2f450026d 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -113,6 +113,8 @@ WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native
> >  # Unified kernel images need objcopy
> >  WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
> >  WKS_FILE_DEPENDS_BOOTLOADERS = ""
> > +WKS_FILE_DEPENDS_BOOTLOADERS:aarch64 = "grub-efi systemd-boot"
> > +WKS_FILE_DEPENDS_BOOTLOADERS:arm = "systemd-boot"
> >  WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
> >  WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux systemd-boot os-release"
> >  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
> 
> Will this not add grub-efi and systemd-boot to any arm-based (64- or 32-bit)
> images that are built? I realize that many arm builds are moving towards
> grub-efi and systemd-boot, but I'm pretty sure there still exist many that use
> U-Boot by itself, and for these builds adding extra, unused code will not be
> appreciated.
> 
> If anything, this should be behind one or more appropriate *_FEATUREs.

Sadly this variable is in DEPENDS and thus parsed early and thus can't contain
complex statements, not even ${EFI_PROVIDER}. If this is not done, result is build failure
from wic (with patch from this series applied) or worse silently missing EFI bootloader files
from wic images and a boot hang. And these on only some builds which did not run
do_deploy of grub-efi/systemd-boot before do_image_wic.

Here I copy existing behavior from other archs which I presume had similar issues.

If you don't use grub or systemd-boot, then WKS_FILE_DEPENDS can be set to empty
in distro, machine, image etc configs.

Cheers,

-Mikko

