Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E4ECED60E
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 06:23:17 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.9573.1728454995214625123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 23:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TYo+fudp;
 spf=pass (domain: linaro.org, ip: 209.85.208.171, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fada911953so4487081fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Oct 2024 23:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728454993; x=1729059793; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/5upI3+USq18MO18EfIiZUK4Hh5Dt2Xo423iibG1Yyo=;
        b=TYo+fudp/oRs+KPuwbwPKuterIElYy71ephuR2u8LGZcPmxsnbwRMPbaQijKK9xfAA
         oJQqFMQKR7Mq5iPNC0jg0ukFsj1QKvE8J5bFr8jivrhlPkS8zQ3Ka8eTvKjKpqWz9XxT
         uYm6e0Fmdmk+k4KNyO+eoEnvzz2dpuxsrjkYfpemHQbxU3sraC7YgrtVhWy6MJ/mvy2R
         NPEXp7kFIUlEkGpUrtdoEvhUxDwyqu5S6Mlp1bny3/23sdZw5nHnZNSpGrnYYiZ4Bnvc
         t4fDgmN9TRG8nJ9Me+38E5k14MhxLuly4iKSIaIEQaRlDIiQcbc4VPH5fv11fiX9kYH0
         jYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728454993; x=1729059793;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/5upI3+USq18MO18EfIiZUK4Hh5Dt2Xo423iibG1Yyo=;
        b=smsb5OOcync1w8TeW52mjrYkCc4UEBmjS5GyQuvqk0OgvDT3eGkPJgx0hp63O5MPYy
         96qJDE8t+8IiFBYPV4XibJU/jn9boSugoSDE4eiCabLC5QN5unT9QOrGjPrJcnPetJD7
         GgnArjKFsHtJtz1i5Zi9PvLUZaPVCwPnSRWBcPoCz6+YKg2iliUX0P3IhA9A81VTmDcq
         mvDwzToyt55x47dcrSJBOO2kcC6lw+Dy2y8dvgdgCCf8MY/vcuq6q0rm1eYF2vgK9Kxf
         OCGsj9ruNvhyfO+R48wOPywGIwVNOXQkAdpmcPV2kMVRdeQodAG3kVT8FiBmS3KAeS18
         gokQ==
X-Gm-Message-State: AOJu0YyGTx00Eyr3ChVvhgAoyC2iIgvNE8/BhXDcVeaNeDFCLNnArCui
	Uuv+n+4kNrkTVkJMhNRkLg7ZW2IvKy/VD+pzKeKgHgX3wgOGmZTAE4tU6SdDvTs=
X-Google-Smtp-Source: AGHT+IGZpkMRZ4eBG0LUCV0FWc+ld/uIxUAecz4LtGRNK85YeM0UXQm+y9U+s7FOCNuWL3j0pExaqQ==
X-Received: by 2002:a05:6512:b99:b0:539:a353:276b with SMTP id 2adb3069b0e04-539bdb056e9mr1793875e87.23.1728454993208;
        Tue, 08 Oct 2024 23:23:13 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff2346csm1423127e87.210.2024.10.08.23.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 23:23:12 -0700 (PDT)
Date: Wed, 9 Oct 2024 09:23:09 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 00/11] systemd uki support
Message-ID: <ZwYhTe-g2-Qr4BOD@nuoska>
References: <20241001082821.26115-1-mikko.rapeli@linaro.org>
 <3171DB81-B36F-4E01-B65F-346841300E69@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3171DB81-B36F-4E01-B65F-346841300E69@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 06:23:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205339

Hi,

On Tue, Oct 08, 2024 at 05:09:16PM +0000, Ross Burton wrote:
> On 1 Oct 2024, at 09:28, Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > These changes enable building systemd uki images which combine
> > kernel, kernel command line, initrd and possibly signatures to
> > a single UEFI binary. This binary can be booted with UEFI firmware
> > and systemd-boot. No grub is needed and UEFI firmware and/or
> > systemd-boot provide possibilities for boot menus.
> > The uki binary can also be signed for UEFI secure boot
> > so the secure boot extends from firmware to kernel and initrd.
> > Binding secure boot to full userspace is then easier since for example
> > kernel command line and initrd contain the support needed to mount
> > encrypted dm-verity etc partitions, and/or create partitions on demand
> > with systemd-repart using device specific TPM devices for encryption.
> 
> Something in here breaks a wic/efi image when I don’t touch anything else.  eg genericarm64 with systemd:
> 
> U-Boot 2024.07 (Jul 01 2024 - 18:07:18 +0000)
> 
> DRAM:  256 MiB
> Core:  51 devices, 14 uclasses, devicetree: board
> Flash: 64 MiB
> Loading Environment from Flash... *** Warning - bad CRC, using default environment
> 
> In:    serial,usbkbd
> Out:   serial,vidconsole
> Err:   serial,vidconsole
> No USB controllers found
> Net:   eth0: virtio-net#32
> 
> starting USB...
> No USB controllers found
> Hit any key to stop autoboot:  0
> Scanning for bootflows in all bootdevs
> Seq  Method       State   Uclass    Part  Name                      Filename
> ---  -----------  ------  --------  ----  ------------------------  ----------------
> Scanning global bootmeth 'efi_mgr':
> No EFI system partition
> No EFI system partition
> Failed to persist EFI variables
> No EFI system partition
> Failed to persist EFI variables
> No EFI system partition
> Failed to persist EFI variables
> Missing TPMv2 device for EFI_TCG_PROTOCOL
>   0  efi_mgr      ready   (none)       0  <NULL>
> ** Booting bootflow '<NULL>' with efi_mgr
> Booting: virtio 0
> No loader found. Configuration files in \loader\entries\*.conf are needed.
> 
> Looks like the /boot partition doesn’t have what it should in.

Ok sorry about this. I missed meta-yocto-bsp/wic/genericarm64.wks.in setup
when changing wic uki generation to uki.bbclass. I'll send a fix.

I hope this was the only one.

Cheers,

-Mikko

