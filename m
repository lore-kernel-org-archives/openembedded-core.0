Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7360BCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 14:10:34 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.14991.1727187023953821541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 07:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SwhQHf9x;
 spf=pass (domain: linaro.org, ip: 209.85.208.177, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f7ba97ebaaso51776801fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727187022; x=1727791822; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gM09mblx/8xfUtLfMu8pXfLGpXbjGr0EJuAoIHIU4CI=;
        b=SwhQHf9x8YxeYPM3zKjnFu4/SMnKika0aHT1y7Gp3Kxcs8rPd2UlDXgaO0S6WLIwVU
         6hxkAjJbgH6FVmMN6JkkrLrmjzya/e8QX843U5SMZDYcwUcOA/rdJUaKxxnS9MtFT73U
         11xZkoWS+gGvxbjlI3JLr8t1ix+vx3iBHzD2q4s+Txreh+BkuXEKy1m4yiJnd+6vu+U0
         r67PLFYJ1b6oZlYMRHVQ9r4wFjSw8Bi9zs0v9en8tGMsThH4U9BqVRA4xY6eFCrfeS2B
         MsdaZayoKDvl6mrhvd6RlJ6PHbE0KSbOovgFHeoH24s6AfJyjg8YZhoaNNRiGVXKFi7Q
         mG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187022; x=1727791822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gM09mblx/8xfUtLfMu8pXfLGpXbjGr0EJuAoIHIU4CI=;
        b=jf/r9avEhvPVu7FWTzE4k00asaoQ0P322tOQ0RJY3ZUsn9BDERcLh5thTmhaKsbVi8
         GArWXIpCy0sePPymtflOOfyrGCk2OdsvcGwXx4Sw1T9cM5ed4ajpLkf+KRHxhrEoJRGx
         mXrcwigvjbcOXUkSA9Fpv8Lo9yHr53JVwjMqAW4fgRik7Ti/MHI95g5rL3fbmFUnnoor
         NoWADMkNWFyOIe1haqaMA6xNgUFl3fr/j7XXdUji28IDQsDaXqFGe+Zcgng3LE21FvSV
         l++J2sdJjq7mMhDghcHFikpeYzbucdQdKJmtA3EVpAjCFYCai321v/0ZcFdy2czZAFqi
         4Mfw==
X-Gm-Message-State: AOJu0Yx8olXsIfi7uL2ntT1hvd8/4K98mZt8EYYWqnxg3JH1T8eqyspc
	4Jrm5Y77S8wRTEMDe9+ng+edDH2VC4GsEDq7r2TxTu6lL7ifcHZxPLOJHH6CutU=
X-Google-Smtp-Source: AGHT+IHezp17FFKBqAVs7U9zhixoD1pjxXnjqS95O3Fj1NaiC5yPNI4Z3k13WxuMZGly6NkfUrxZag==
X-Received: by 2002:a05:6512:10c7:b0:536:548a:ff7f with SMTP id 2adb3069b0e04-536ad3d5456mr7612192e87.58.1727187021986;
        Tue, 24 Sep 2024 07:10:21 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a9f46439sm167393e87.94.2024.09.24.07.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:10:18 -0700 (PDT)
Date: Tue, 24 Sep 2024 17:10:15 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4 05/12] image_types_wic.bbclass: set
 systemd-boot and os-release dependency for all archs
Message-ID: <ZvLIRwJC-jVgQskm@nuoska>
References: <20240922084128.9648-1-mikko.rapeli@linaro.org>
 <20240922084128.9648-6-mikko.rapeli@linaro.org>
 <CAMKF1so1E3aknix5Vt-00DPQfyLHVQ5dUjnK4LO2tsqRxp19+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMKF1so1E3aknix5Vt-00DPQfyLHVQ5dUjnK4LO2tsqRxp19+Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 14:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204863

Hi,

On Mon, Sep 23, 2024 at 05:10:35PM -0700, Khem Raj wrote:
> On Sun, Sep 22, 2024 at 1:42 AM Mikko Rapeli via
> lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > These work on all archs not just x86.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/classes-recipe/image_types_wic.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
> > index 86f40633eb..e02eb0b367 100644
> > --- a/meta/classes-recipe/image_types_wic.bbclass
> > +++ b/meta/classes-recipe/image_types_wic.bbclass
> > @@ -110,7 +110,7 @@ WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', '
> >  WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
> >  # Unified kernel images need objcopy
> >  WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
> > -WKS_FILE_DEPENDS_BOOTLOADERS = ""
> > +WKS_FILE_DEPENDS_BOOTLOADERS ?= "systemd-boot os-release"
> 
> systemd-boot is only built for arm/arm64/x86/x86_64 if I look into the
> systemd-boot recipe, so this will break wic image
> generation for other architectures.

Ok, I can drop this change.

It's a bit confusing how systemd-boot and grub-efi are used currently.
Both don't work and end up using only grub-efi. If intention is to boot
with systemd-boot, then grub-efi is not needed.

Cheers,

-Mikko

> 
> >  WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
> >  WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
> >  WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 = "syslinux grub-efi"
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#204777): https://lists.openembedded.org/g/openembedded-core/message/204777
> > Mute This Topic: https://lists.openembedded.org/mt/108587931/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

