Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73BAC0218D
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 07:25:49 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.14297.1738308340785748799
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 23:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=lm0tPKpV;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso2573065e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 23:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738308339; x=1738913139; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c1bmEpGfeBvPGTkyAkEQp85RP11HNY2Hkvl8Or6Zcto=;
        b=lm0tPKpVd9R37Aml7sPKYyJyQRfq8Qe2tmcW9E8Eh0NgD54G3b9lLW6sNy7seABYd/
         y+iT9UoUPaXMt5QCygkqMMKRMwCQiz8ivJYu0cSRrChKWpsilbqh5gSDkV7ElNtoXb7j
         0667O+z/VPfXwL5WIvnIxVKULj004ExjmUCckpJAQ+kaa+RbzzE4fv3JGeLuHb5FJ3mk
         zgGo09WMx6micV7sT9m50D2CQlABp0nbIlNTqetreXNxpa+B2Ki4dtJP33QjE4hitAP4
         LMJxiC1KVojti0s1F2SByQZtqcylpJTzEmLa7RpkVvM5WWXeutF+rFZWUJpAfZukPHL+
         PXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738308339; x=1738913139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1bmEpGfeBvPGTkyAkEQp85RP11HNY2Hkvl8Or6Zcto=;
        b=UBnPA+h0lskHlAx4dwVfeLMzBVqWPo9chmyP93wJ0Yg3NphIvPPdlrCSt/YKrkRof7
         axGprrzSbqafVN11A4HSyyqOcUBaULZnvPz0T7XZ5i/xEtiriOzHb8htwKRiz7wnieXP
         HEQKUyp09i/cYlcAASn/oEsM87uGu0I6vdc2JFOHgpon+AUxTUOHL7NvQKp/wkuPPwpd
         7OVYB03dnG4zyb95mIHI0u/TCTHyIDgoATFx35mHTNyp6arzf4yJzOL4KyPBu60ej08k
         kyDZbeTFilf4sTT0qpcOF5dMX613YffwuIuH6AQ560bRc+trFTsJGtBVCk2kYXa5ztoc
         XMRw==
X-Gm-Message-State: AOJu0YzJRsbeoGvha0zta20WXEqXv5PfuC/j7TSYub5D1PiJDyh1JH2K
	ESuiinGli21CdaeWbWlYXS26oLOFgkJkUZ0W89bRP7bcdHvkrklIFHzCT9/4agOKjS1n+aUZahk
	DpI8=
X-Gm-Gg: ASbGnctiq8eCXSSajo6o+2j6IraW6WfrT1tseFs5vbkbYITKO+sgPJw9Y+LplTbU+oC
	mvfJ+cOSr4yGZxhTey4mbSlDoByhq+dkrBsU8mD4lmYM092KYgyQ7wIOcy2RCuluCFttdiFPqw7
	jf/Ehfob8M3VWO6FKlPYFms8tp972wQUBY0K8kgOftYg2Sp1Ss1GTxkstjY0ZHMDZKkfZVlTPMb
	L0V4Q7tdL115zG3fjzmvJFXRNT+4ktfOFJv8lya7I8cplNnsF3MTsqa39WtFt9UCv8wYSGpraBW
	87pGcp1EkfU0wFDz1pF3rLIZsvtYfiCIQdKf6oPV
X-Google-Smtp-Source: AGHT+IGxCn4VsFXUBi/7S7oSFgSUG11ObQdWdJ6Nm0gbdG/S6jTRHPUrlkJxnMMnODlc6L5aSTHmeA==
X-Received: by 2002:a05:6512:3b86:b0:53f:67be:507 with SMTP id 2adb3069b0e04-543f0f24fb5mr757824e87.16.1738308338580;
        Thu, 30 Jan 2025 23:25:38 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3088b29sm4453121fa.42.2025.01.30.23.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 23:25:36 -0800 (PST)
Date: Fri, 31 Jan 2025 09:25:33 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] systemd: use getty generators by default
Message-ID: <Z5x67SnX6xrXoF_N@nuoska>
References: <20250130175901.938043-1-ross.burton@arm.com>
 <20250130175901.938043-2-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130175901.938043-2-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 07:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210473

Hi,

On Thu, Jan 30, 2025 at 05:59:01PM +0000, Ross Burton via lists.openembedded.org wrote:
> systemd can automatically create getty service units at boot time by
> probing the hardware: if will check for a list of known hypervisor
> consoles and also spawn a getty on every active console.
> 
> However in a historical attempt to change as little behaviour as
> possible, we disabled this and instead wrote hard-coded units at build
> time that respect the SERIAL_CONSOLES variable.
> 
> This variable may be acceptable for fixed known platforms, but is not
> usable for generic machines. The genericarm64 machine for example lists
> a number of potential consoles:
> 
> - ttyAMA0: physical ARM PL011 uarts
> - hvc0: hypervisor virtual console
> - ttyS0-2: physical uarts
> 
> We have to list multiple ttyS? names because different platforms use
> different devices: specifically on the BeaglePlay the Linux console is
> ttyS2, with S0 and S1 being the uarts connecting the expansion port.
> 
> However, it's not ideal to randomly open ports and hope for the best:
> with kernel 6.7 onwards a power management/tty bug results in system
> hangs if a getty is sitting on ttyS1 (see #15704).
> 
> A better solution is to just use the getty generator in systemd: this
> will automatically spawn gettys on any hypervisor consoles found and all
> of the consoles that Linux is aware of. On the BeaglePlay this means
> it puts a getty on just ttyS2, as expected.
> 
> The fixed configuration recipe is still present for people who wish to
> have absolute control by simply disabling the serial-getty-generator
> PACKAGECONFIG.

ACK, we have also found that systemd and udev handle serial consoles
correctly when supporting multiple devices like rockpi4b, synquacer,
AMD KV260, zcu102, AVA, qemu etc from a single build. 

systemd-serialgetty did not work so well.

Cheers,

-Mikko

