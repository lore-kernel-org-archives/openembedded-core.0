Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3DFC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:08:08 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.42931.1744016886013799923
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:08:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=OXnCgfk4;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54963160818so5135751e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744016884; x=1744621684; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AVnXr7TG73CkF/DuRm/QXTF7FxNL0p87cGwK12GR6YM=;
        b=OXnCgfk4bP7+jO59/apaglgzp802CDU0tGGRq86wUBJPhvoowkL4LMiwv5bpSb4QT6
         uCJMfWaAkICfrzp2Zi+1gtA9qEmmueCDnd8t6iaM0Pk+vmAdiKqqtmPrw/fs6mf7Y0aX
         4i91h9uKda5vnXfrxECRzXi+YYGWe7wf9l8S4TXn0wxfijZ/E+DL/4C0RjEaPaX4VPzO
         4yxfhkOu1fuVSWDuUNpfXLw3wfrNG0T89Dh3hI+qCMgNEaTTbkhFlgdxcmNGuLHK7JJV
         T8sW93YMZjZ9UP6VoVd7wo/8mbom5rffo5mff2DYfedHIqNPI0XWCcDojIcq7aqOJ/Xm
         n/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016884; x=1744621684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVnXr7TG73CkF/DuRm/QXTF7FxNL0p87cGwK12GR6YM=;
        b=oYZRXndPvKDyPsT3R2Ryjx8OrphkqgV3benkUqF+YVkwTckll9aV2/6tLLe6V9mVqW
         zVyhae5edQySqhhtkHsdqDVJFCdk/P17hFDY6A+6UgORUNK43VIoUqrobhX30M9S2K0d
         sBn4PmVJY6s6HHjfmLS8Bnza7N+lL3NIRUr0PCXd57YR9+rBv571MUOxolklZC1qmWe9
         fxEzLirZ90fO/sdaV70O29KEVF3cZ30pMp+V+S0skK/o4hL+kwjkvoGCDf6KrDnhK5RZ
         ZWe3+0jRFVZrKplawseoomjQCHDXBzf4wZmCtgOzQJjd9wKSoUHv3iFwD/pXXagvzvti
         Ux1g==
X-Gm-Message-State: AOJu0YyCwq7BomV6JRy4YTL/Z4ZfzDLtqcPdNPFARfq38WVxw4MoXzyr
	AvyneldQHWRWDqH4/o0YPj1sZL48xuxcj26+1/88q9cctmKoqrAwL8SVCZUBzk0=
X-Gm-Gg: ASbGncsS/Q4OcQCqkfvpgu7e7ej9WIUw5ZhF4KrRC6vbPw6ckNchYC1bectloqnHanf
	AJ/2zaq79vKFTiAaaM2IAiO2ZAUHeX4WFQRs3QlLjWomOzVJXHXRtrjLIKLmcQRPYQEQKPAUMFX
	0oKWhFYzqetF8H1Y+6Ej9lnWWB4bZCiKPPybbhcsKqkAMCFWZaXeR3LwUlF5xhwEX6oWVMWWFQt
	9+otMiEA8O91CMDuvupTaWZdqHsWMjcgaMTQO/scWqsRMVjPcWf75KqYqhLPrgLLkWYxNv7hFrJ
	5Sr1767ytKxVG1Ykd7Ac29yiVz3zEX2zSMXGv+vWDuLwJOr/4VUxAuV3o0tS9JbhYVX69inJICL
	jiQ==
X-Google-Smtp-Source: AGHT+IGX4sIrbX/Cm9o0ZVPTI/ZQtZFmdpk4IIL/v4r8MX2Nve+FxQiLuDti18JOpVErRWnSpeROCQ==
X-Received: by 2002:a05:6512:230e:b0:54b:ed9:2cf8 with SMTP id 2adb3069b0e04-54c232bf2b4mr2633983e87.10.1744016883822;
        Mon, 07 Apr 2025 02:08:03 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e672356sm1191945e87.230.2025.04.07.02.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:08:03 -0700 (PDT)
Date: Mon, 7 Apr 2025 12:08:02 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 04/11] core-image-initramfs-boot: add option
 to build systemd based initrd
Message-ID: <Z_OV8sGhAC-vqAll@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-5-mikko.rapeli@linaro.org>
 <0C447E0A-971B-4C9D-A8B4-9293962BF92F@oss.qualcomm.com>
 <Z_Nsx9Qntl9ghZwK@nuoska>
 <F2BE3AD0-A0B2-4760-B4EB-E4D18D4CD2DB@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F2BE3AD0-A0B2-4760-B4EB-E4D18D4CD2DB@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214407

Hi,

On Mon, Apr 07, 2025 at 10:58:12AM +0200, Koen Kooi wrote:
> 
> 
> > Op 7 apr 2025, om 08:12 heeft Mikko Rapeli <mikko.rapeli@linaro.org> het volgende geschreven:
> > 
> > Hi,
> > 
> > On Mon, Apr 07, 2025 at 08:01:41AM +0200, Koen Kooi wrote:
> >> Op 4 apr 2025, om 18:29 heeft Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> het volgende geschreven:
> >>> 
> >>> If "systemd-initramfs" is in DISTRO_FEATURES then convert
> >>> core-image-initramfs-boot from shell scripts to systemd.
> >>> The resulting initramfs is much bigger than shell script one but
> >>> supports much more features like disk encryption and TPM devices.
> >>> Also includes udev which can load any drivers needed to mount
> >>> rootfs.
> >> 
> >> Are packaged based kernel updates finally working with this?
> > 
> > Sorry, I don't get this question. What is package based kernel updates?
> 
> Using package management to update a kernel, e.g, 'opkg update ; opkg upgrade'.

Yocto project in general does not test binary package update paths. These
patches are still tied to the yocto build environment and don't generate
initrd on the running systemd based on files in the rootfs. That support
is currently not available in yocto, AFAIK.

These changes only enable building systemd based initrd image from the yocto
build environment.

One of the usecases which I'm testing is UEFI secure boot where
kernel and initrd are signed with keys which are not availeble
in the rootfs. The keys are only available on the yocto build
machine. The UEFI firmware (u-boot based,
https://gitlab.com/Linaro/trustedsubstrate/meta-ts ) checks
that kernel and initrd in the UKI binary are signed with
expected keys before allowing boot to continue. systemd
based initrd is then able to use TPM in more advance ways
that shell script based yocto initrd framework to e.g.
encrypt rootfs.

Cheers,

-Mikko

