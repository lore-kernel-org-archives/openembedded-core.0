Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E79C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:06:00 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.33618.1744290352716060013
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oQgV8Yjy;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549946c5346so934094e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744290351; x=1744895151; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDO2FNxx6/tpwNtuc1IlN57llVHnrHrO3Jffw2y7yn0=;
        b=oQgV8Yjy3xZldUPoE1ktc+GunlGeE4qvUIhDLaAHE3wLMgokbtkOuurYO/ccfo6bp7
         r83S1Vd9mJROQjPbbKkAISagH1RvEgcjlFGHjlNpF0HPHKRskjtl7k53yVFzTB3ylboy
         /nj+U9J0GytWdngYHIbjU8+co+sXatpjZZdJviPJzay5l8+ncbWu3t8bAr9nSdxdaguJ
         dsueeVcnVViRYW+4QPrP0l8GLZjAEAiKWrV2QxauSUXK6jG877jR07A2VELH9Zsd3kPL
         KfkXyCyJH5xeaFZU0C+g8T1uc+tq4U7i9av3GM+6nDluTL4DFYRlBaivRMyg4yyagqAR
         ugpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290351; x=1744895151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDO2FNxx6/tpwNtuc1IlN57llVHnrHrO3Jffw2y7yn0=;
        b=dl0i2N5ufzCg8O9n8AcATUrCF63rz1lU23XFz1o5odd9WNy1rP0+QYw7mrrsEQqjWp
         TglCkckjRfMWA3iBSZV5vYHjns29Z/Jh78+0SqtG50hLrTeMCb4oZ2zQNY6BQn95G7lI
         t3AfDEd+7S0xbZt0uEBeTjJN/Wdfq6MYopV8IMEigYWOb6wT4Kqwb+PTRdP1LGrN68PQ
         TRZ5tY/76ofLg82eugziLi99vwxAH+0KuXxjr6BVRFF5K3b4o6zYwYndNu1b91L0LG+V
         6Ari0eXKLdi3umyXqBmg25HcPz8TRjZj9cwQ7TChglAhk1bnITKFCtU5NsKIt7Gid7FQ
         Fx/g==
X-Gm-Message-State: AOJu0YwaV3n8NM4ZWRQMIrTpeqzSqBNeUweA5tWWUBO8yBzpv5+hTh45
	GYKX6U4rZ1e2b/ih+k4qWDlNi44Vs8ymRteISmAHbaJoLHecj+FFszMWu8FaqWM=
X-Gm-Gg: ASbGncvd+P4KEYeEar9bir+r98dJQVoKMOBaEBMI/bOl5avbuMaiEqfCNZRNowhRWtM
	D+GB/QYn2wA7XssPg+QBJMgEOBVP14kil8tfYJa6yFL8VfB87XqVWg8jfhHt853NW5nlZ4o7MyE
	raJTEL3D97GXLeof2ar2i7GVxFfMrvm8JRqWlVoW+TVEK5YWQMBMQ+gnx2zi9r5MqqwGN9ropn7
	MjHUGfytydRe/QK/M0+8zVNezmMVjCt6z5I/9G3h4yjZ9UDorSdcwSwKfTXyyCi6VFR9cdqRMN4
	onDD5Glgey70uavRW9WSx+VKrtl+ZqCPnh+K4bB95NboLwhM/P0SoehqeTnUIkCiOXk54Pr/9g=
	=
X-Google-Smtp-Source: AGHT+IFuW7dKlgQjFbUsFeSls4TshhBMMtEfYCT87sWAiC0VrREkk3lnzlHenTm/f5Ridpk5gzy87Q==
X-Received: by 2002:a05:6512:104a:b0:54a:cc08:1394 with SMTP id 2adb3069b0e04-54cb08def10mr841254e87.33.1744290349108;
        Thu, 10 Apr 2025 06:05:49 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d240990sm147115e87.102.2025.04.10.06.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:05:48 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:05:46 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 04/11] core-image-initramfs-boot: add option
 to build systemd based initrd
Message-ID: <Z_fCKpjl83RXVFLt@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-5-mikko.rapeli@linaro.org>
 <382aea203534ca83fc8a493c8c0f8af924737d4c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <382aea203534ca83fc8a493c8c0f8af924737d4c.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:06:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214666

Hi,

On Thu, Apr 10, 2025 at 01:45:13PM +0100, Richard Purdie wrote:
> On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > If "systemd-initramfs" is in DISTRO_FEATURES then convert
> > core-image-initramfs-boot from shell scripts to systemd.
> > The resulting initramfs is much bigger than shell script one but
> > supports much more features like disk encryption and TPM devices.
> > Also includes udev which can load any drivers needed to mount
> > rootfs.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �.../images/core-image-initramfs-boot.bb������ | 20 ++++++++++++++++---
> > �1 file changed, 17 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-core/images/core-image-initramfs-boot.bb b/meta/recipes-core/images/core-image-initramfs-boot.bb
> > index 7258944751..c66c28db76 100644
> > --- a/meta/recipes-core/images/core-image-initramfs-boot.bb
> > +++ b/meta/recipes-core/images/core-image-initramfs-boot.bb
> > @@ -4,7 +4,23 @@ LICENSE = "MIT"
> > �
> > �INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev"
> > �
> > -PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${VIRTUAL-RUNTIME_base-utils} base-passwd"
> > +inherit image
> > +
> > +PACKAGE_INSTALL = " \
> > +��� ${VIRTUAL-RUNTIME_base-utils} \
> > +��� ${@bb.utils.contains('DISTRO_FEATURES', 'systemd-initramfs', ' \
> > +������� base-files \
> > +������� coreutils \
> > +������� e2fsprogs-mke2fs \
> > +������� os-release-initrd \
> > +������� util-linux-blkid \
> > +������� util-linux-mount \
> > +������� util-linux-umount \
> > +������� ${VIRTUAL-RUNTIME_init_manager} \
> > +������� ${VIRTUAL-RUNTIME_dev_manager} \
> > +��� ', '${INITRAMFS_SCRIPTS}', d)} \
> > +��� base-passwd \
> > +"
> > �
> > �# Ensure the initramfs only contains the bare minimum
> > �IMAGE_FEATURES = ""
> > @@ -18,5 +34,3 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> > �IMAGE_NAME_SUFFIX ?= ""
> > �IMAGE_ROOTFS_SIZE = "8192"
> > �IMAGE_ROOTFS_EXTRA_SPACE = "0"
> > -
> > -inherit image
> 
> Given this effectively completely changes the image, would we be better
> just defining a different image recipe for the systemd based initramfs?

I don't know. At least for testing purposes switching with
DISTRO_FEATURE is relatively easy. Though exact same thing
would work with INITRAMFS_IMAGE variable. I just started
with this approach but can change it if you prefer a
separate recipe.

For upper level layers it may be tricky if they need to modify
something but need to deal with two different
image recipe names and can't just have all in a single
bbappend.

Cheers,

-Mikko

