Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA00C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 08:58:50 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5634.1745139524449524210
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 01:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R6gaH6pa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so2808705f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745139523; x=1745744323; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hyVkxHQg+1Q0d422FSkb/Ke/IDdrzN3qgoFv44Vr71Y=;
        b=R6gaH6pa82+s4wfQRx6WhTms6NYfF4Lojsg9FboUrwNIL8UqihHPDslIOhWpju9hMC
         c8EgNoEkvOYhRVswMuICZSjzX1u4faXHQgmv1YVVfZUNwtjLH8dpDisNJz3TaM2RFjRb
         B+BqekOzGlk2Wh+HF24TGFSTBmV9k9bpEyOUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745139523; x=1745744323;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hyVkxHQg+1Q0d422FSkb/Ke/IDdrzN3qgoFv44Vr71Y=;
        b=otwJ8Mr57O+SbwdL57jXmILqmO/SO3TnvUGGR1v37i4wrIG2CcgAqV1GWGpjxVa8kI
         x7Hl+aw8zZXAhJAbBD66B6zPoPEwU9U/JyhG46wuPiE07cXWKsjJt8+T8SrTAz3tW0Ny
         hPVa6FjOnvI2LsIeXSjwXmYJqt/g4CIg/FIUhDZsTguMadDXYWmRdaLFcElMZFnrmx26
         c74IWsXO8OTih5N5p1Xcyl60fboWxK8WEoEe3+PhuE7RcOmnFscOuFjND/ofOYFwluqH
         vXJLECf+6vPZh+drWlrNAYOiqgF19kk0HdRtvwbr+kYGByc9pTEvQgIQl4Hh0D8Xq0gH
         OJKA==
X-Gm-Message-State: AOJu0YxA4KwvM1bLB+UWt4i29V+yJ4IOct8SFxw9Z6sb5v/qUmyJSloY
	jO+6U25TVzeykB4euP9kcZLylpZBykiH0h0uSqAmZEuqeHAQoOBo+P2wDFtanaY=
X-Gm-Gg: ASbGnctrZlDxtfKYHjLqRzMR6oI6V5/8yOGoF4qlapTMp2709WjmEQhHt4GUK3Bu+f0
	FwHFaEPEJG11vcGmXhfo8t2suy+P8ddNcHszkjTt0TgUljheyd7g7pGFryzWcxZe9lrzG1g978J
	Yb+skm1aZ8KL9ntOuaSgyVwmoAKxviSBspBOztjYyq27VBmq/HYcanJeKQm2BUfo4MK+lvD/Qs6
	ign26veQqOEbqgxFQ9nRX3wFHCdVLWtd+ltL+j8zKvMKembjQQKs+sf4gmtwoLH0KDKVMyp9ba7
	Cp7YXPTTfcU6uS+6dMvM4yZvAmQzt/QLHOW3l1AWC/BJDoSJOLBaijcLg1fisVIZUp8eb5FQqry
	3UCrnMhG0GQ1hQFn2xLu9HbpgbSNivg==
X-Google-Smtp-Source: AGHT+IEvdzdMqu2cSTa/TvpbZMSq4PjGwpgxfYLewcChb1RW79ZaLd3CEEEgm2hommXYjgT8LIxkPQ==
X-Received: by 2002:a05:6000:4284:b0:39c:2678:302e with SMTP id ffacd0b85a97d-39efbae5c77mr6704181f8f.45.1745139522765;
        Sun, 20 Apr 2025 01:58:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d83:c080:c463:70fa? ([2001:8b0:aba:5f3c:7d83:c080:c463:70fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9dbesm91352015e9.7.2025.04.20.01.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 01:58:41 -0700 (PDT)
Message-ID: <0da9657f7a33ece23b31415e225e099964fef5b2.camel@linuxfoundation.org>
Subject: Re: [OE-core] 0/2] linux-yocto: -stable and config changes (for
 current release)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 20 Apr 2025 09:58:40 +0100
In-Reply-To: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
References: <20250418195446.1914594-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 08:58:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215151

On Fri, 2025-04-18 at 15:54 -0400, bruce.ashfield@gmail.com wrote:
> This is the iommu configuration change you were waiting for, but I
> had already updated to 6.12.23, so that -stable change is coming
> along with the meta/cfg update to pickup the configuration.
>=20
> If there are any issues with the -stable update, I can attempt to
> jiggle the patches such that the cfg: iommu patch brings along the
> 6.12.23 kver bump, but not the actual -stable update itself. The -
> stable would then follow later without an associated meta data
> update.
>=20
> But since that is a manual operation, I wanted to send the patches
> as-is and let's see how they do on the AB.

Thanks, I'm not too worried about the kernel version bump but there was
an issue in testing with poky-tiny which looks related to the config
change:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/1422
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2099421/raw

WARNING: linux-yocto-tiny-6.12.23+git-r0 do_kernel_configcheck: [kernel con=
fig]: specified values did not make it into the kernel's final configuratio=
n:

    [NOTE]: 'CONFIG_IOMMU_API' last val (y) and .config val (n) do not matc=
h
    [INFO]: CONFIG_IOMMU_API : n=20
    [INFO]: raw config text:

        config IOMMU_API
        	bool

    [INFO]: config 'CONFIG_IOMMU_API' was set, but it wasn't assignable, ch=
eck (parent) dependencies

    [INFO]: selection details for 'CONFIG_IOMMU_API':
        Symbols currently n-selecting this symbol (no effect):
          - DRM_NOUVEAU
          - VFIO
          - XEN_GRANT_DMA_IOMMU
          - IOMMU_DMA
          - FSL_PAMU
          - MSM_IOMMU
          - AMD_IOMMU
          - INTEL_IOMMU
          - IOMMUFD
          - OMAP_IOMMU
          - ROCKCHIP_IOMMU
          - SUN50I_IOMMU
          - TEGRA_IOMMU_SMMU
          - EXYNOS_IOMMU
          - IPMMU_VMSA
          - SPAPR_TCE_IOMMU
          - APPLE_DART
          - ARM_SMMU
          - ARM_SMMU_V3
          - S390_IOMMU
          - MTK_IOMMU
          - MTK_IOMMU_V1
          - QCOM_IOMMU
          - HYPERV_IOMMU
          - VIRTIO_IOMMU
          - SPRD_IOMMU




    [NOTE]: 'CONFIG_IOMMU_IOVA' last val (y) and .config val (n) do not mat=
ch
    [INFO]: CONFIG_IOMMU_IOVA : n=20
    [INFO]: raw config text:

        config IOMMU_IOVA
        	tristate

    [INFO]: config 'CONFIG_IOMMU_IOVA' was set, but it wasn't assignable, c=
heck (parent) dependencies

    [INFO]: selection details for 'CONFIG_IOMMU_IOVA':
        Symbols currently n-selecting this symbol (no effect):
          - VIDEO_INTEL_IPU6
          - VIDEO_TEGRA_VDE
          - TEGRA_HOST1X
          - DRM_TEGRA
          - VDPA_SIM
          - VDPA_USER
          - VIDEO_IPU3_IMGU
          - IOMMU_DMA
          - AMD_IOMMU
          - INTEL_IOMMU




    [NOTE]: 'CONFIG_INTEL_IOMMU' last val (y) and .config val (n) do not ma=
tch
    [INFO]: CONFIG_INTEL_IOMMU : n=20
    [INFO]: raw config text:

        config INTEL_IOMMU
        	bool "Support for Intel IOMMU using DMA Remapping Devices"
        	select IOMMU_API
        	select IOMMU_IOVA
        	select IOMMUFD_DRIVER if IOMMUFD
        	select NEED_DMA_MAP_STATE
        	select DMAR_TABLE
        	select SWIOTLB
        	select PCI_ATS
        	select PCI_PRI
        	select PCI_PASID
        	depends on PCI_MSI && ACPI && X86 && IOMMU_SUPPORT
        	help
        	  DMA remapping (DMAR) devices support enables independent address
        	  translations for Direct Memory Access (DMA) from devices.
        	  These DMA remapping devices are reported via ACPI tables
        	  and include PCI device scope covered by these DMA
        	  remapping devices.

        Config 'INTEL_IOMMU' has the following Direct dependencies (INTEL_I=
OMMU=3Dn):
                PCI_MSI(=3Dy) && ACPI(=3Dy) && X86(=3Dy) && IOMMU_SUPPORT(=
=3Dn)
        Parent dependencies are:
             IOMMUFD [n] PCI_MSI [y] ACPI [y] IOMMU_SUPPORT [n] X86 [y]
    [INFO]: config 'CONFIG_INTEL_IOMMU' was set, but it wasn't assignable, =
check (parent) dependencies


    [NOTE]: 'CONFIG_INTEL_IOMMU_FLOPPY_WA' last val (y) and .config val (n)=
 do not match
    [INFO]: CONFIG_INTEL_IOMMU_FLOPPY_WA : n=20
    [INFO]: raw config text:

        config INTEL_IOMMU_FLOPPY_WA
        	bool
        	default y
        	depends on X86 && INTEL_IOMMU && IOMMU_SUPPORT
        	help
        	  Floppy disk drivers are known to bypass DMA API calls
        	  thereby failing to work when IOMMU is enabled. This
        	  workaround will setup a 1:1 mapping for the first
        	  16MiB to make floppy (an ISA device) work.

        Config 'INTEL_IOMMU_FLOPPY_WA' has the following Direct dependencie=
s (INTEL_IOMMU_FLOPPY_WA=3Dn):
                X86(=3Dy) && INTEL_IOMMU(=3Dn) && IOMMU_SUPPORT(=3Dn)
        Parent dependencies are:
             X86 [y] IOMMU_SUPPORT [n] INTEL_IOMMU [n]
    [INFO]: config 'CONFIG_INTEL_IOMMU_FLOPPY_WA' was set, but it wasn't as=
signable, check (parent) dependencies



NOTE: recipe linux-yocto-tiny-6.12.23+git-r0: task do_kernel_configcheck: S=
ucceeded

Cheers,

Richard

