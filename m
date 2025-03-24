Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED09C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 09:01:21 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.34946.1742806874015080712
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 02:01:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=qouJi/Kv;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499d2134e8so5035765e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742806872; x=1743411672; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdACWdEfZrLOgCU+tKmM+5RV8JS26ShtEvMrw6PTAeA=;
        b=qouJi/KvP+3wnmMtcd0Nsc1D+cL7Sz8kQn9Q8Wktn4WwS0DtnlfDLUR7woqR+8bWHu
         VqQFMMUDn2itqOOzWcquQEQpdYRIaDDlSvt5vW4kzzsVj639zJWBfd6FPkgAM4EG851w
         pdzDxJFlU1utNj8/euq4VTu3JURx442ufdZ1ZzFTc2zAJPf5fLTSB9mw7Gl3V2zwf4io
         GF9oymG65ZF2+5/Om7TErZIJq1k+Sh8nU/PTsfvM6PCmM5wA01hS+MTZSj//68XA8uOw
         hgKhUeelZYiTh5fJvULo+gjCgM4VR9g19l8tuKTsUM7GG9++G0iCOlqFc4qHAdGAsIKC
         d1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742806872; x=1743411672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdACWdEfZrLOgCU+tKmM+5RV8JS26ShtEvMrw6PTAeA=;
        b=j8Dw4sVlWlLKpxBBJsIC6n5oBQ5Mt7/UxSr0Ln6Em60w2RiQ+gVglxXHigeuO6ymLe
         2vcaOHNH1VPkW18MQZiMVdEreACPcDwxMsoGP5zgz6IfrCY5IPOogfafKkaPHKRTYVXM
         D/8D4FNIe4EQZ5f8TyDg9gl1dvkaIf9bDXnj7MyTR4DxjSPqOkf0zcyaVHoTxpL/lgfU
         UvXEmuhro/0vSqNyo2tMEjyoPj8E6Pf6orRDQ42bmHf03xYorVqajr20CFdln8Lex2ww
         EFaC0DQQQF0Thd5cIE2599lkMiJhgZvoxDpuRmXTNm3DowG/25L8cGRVWlbj8252pFi4
         eDmg==
X-Forwarded-Encrypted: i=1; AJvYcCU64S7fIw87OWKlq9Y0M7Lp7P6zduEbvZJljOxmTIAvEJXcwS9V7RXkGaa5bo0a4yRdep083/ovwaWTndQQEyTKFQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YykPpKlJkzg4BBmn7XSquZPgrVk+uMtV6sWlEKG6zsIp9a7RhXL
	p1TFSxR04cHG1FK+pZOVFeuqD+b62TCAy4zWo4kFsZ2tEK9NJAhgeDg7Cf+K8ks=
X-Gm-Gg: ASbGncv1lhWAOgiFgjk4nx05kQvrjX52WzodwVX9oBTDwT4GF9BlWL1gt0rx2QR/YCR
	Di6Z8OcgdWRjXdjlkRnOuXgStec3ArKtFf1pIoL9OF2sv9+3LfUtX/+nR3hh7v5IvMzNlTbBXs+
	OdOkDGgJKT1UeAJa0imv86Ugg1LKoUUi1s8d1wDP1iZ21R+XT74SaeWkFUIExIzLzSE35rJEEIc
	2O5+C5NqaY1z0S4BqFOy4NPN2k4C3twMrg2A/LqZ25QQk+i7Z6Z2KsFqeZgfShX3mc7Zzbi6PAO
	t0xSZY3q3EQedOzS8OXp3DbyWAJOdydermpl+7OuwkvkwolXBjz32DRQCeGrj6R6kTIMHrf23ND
	f9kGaEBVAYVNj
X-Google-Smtp-Source: AGHT+IHFxmyhTLoyhGrF1blIAidJkI2960o3W7FgkZbFLtyDi1Q71cyzG4V0ZwUkumxWUJhCmsqJZA==
X-Received: by 2002:a05:6512:2247:b0:545:2fcf:642d with SMTP id 2adb3069b0e04-54ad6479f26mr3867387e87.6.1742806871944;
        Mon, 24 Mar 2025 02:01:11 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ad64688f9sm1050543e87.15.2025.03.24.02.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 02:01:09 -0700 (PDT)
Date: Mon, 24 Mar 2025 11:01:06 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 01/11] systemd: enable efi support if in
 MACHINE_FEATURES too
Message-ID: <Z-EfUqkUG5WnuGup@nuoska>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-2-mikko.rapeli@linaro.org>
 <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
 <Z-EJ7EqalYachfbb@nuoska>
 <C27BE692-BD0E-4928-B510-02EA5FF51991@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C27BE692-BD0E-4928-B510-02EA5FF51991@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213519

Hi,

On Mon, Mar 24, 2025 at 09:50:42AM +0100, Koen Kooi wrote:
> 
> > Op 24 mrt 2025, om 08:29 heeft Mikko Rapeli via lists.openembedded.org <mikko.rapeli=linaro.org@lists.openembedded.org> het volgende geschreven:
> > 
> > Hi,
> > 
> > On Sun, Mar 23, 2025 at 10:53:59AM +0000, Richard Purdie wrote:
> >> On Fri, 2025-03-21 at 15:25 +0200, Mikko Rapeli via lists.openembedded.org wrote:
> >>> For example genericarm64 enables "efi" in MACHINE_FEATURES
> >>> and in u-boot. Boot without "efi" in systemd works with
> >>> EFI protocols but for example efivars is not mounted at
> >>> all so various checks fail in userspace. Fix these by
> >>> enabling "efi" support if it's in MACHINE_FEATURES.
> >>> Fixes efivars mount to /sys/firmware/efi/efivars etc.
> >>> 
> >>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >>> ---
> >>>  meta/recipes-core/systemd/systemd_257.3.bb | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>> 
> >>> diff --git a/meta/recipes-core/systemd/systemd_257.3.bb b/meta/recipes-core/systemd/systemd_257.3.bb
> >>> index 64fb8fe69a..9bc4532021 100644
> >>> --- a/meta/recipes-core/systemd/systemd_257.3.bb
> >>> +++ b/meta/recipes-core/systemd/systemd_257.3.bb
> >>> @@ -69,6 +69,7 @@ PAM_PLUGINS = " \
> >>>  
> >>>  PACKAGECONFIG ??= " \
> >>>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> >>> +    ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
> >>>      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elfutils', '', d)} \
> >>>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
> >>>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
> >> 
> >> This makes the systemd recipe machine specific which isn't currently the case.
> > 
> > Can we enable "efi" in DISTRO_FEATURES by default?
> > 
> > That would solve the issue without checking MACHINE_FEATURES in systemd recipe.
> 
> If your DISTRO doesn't enable it you can either pick a more suitable DISTRO or send patches to fix your DISTRO. Changing OE-core wide defaults is the wrong thing to do.

The DISTROs I care about with this patch set are poky or poky-altcfg.

When systemd is selected as init, it currently doesn't work in initramfs
on UEFI systemd even when MACHINE_FEATURES has "efi" enabled.

Cheers,

-Mikko

