Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473AFC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 12:02:19 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.50181.1748347332547205738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 05:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UuE663hV;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32925727810so32727851fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 05:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748347330; x=1748952130; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQXnGuIl1CVxmwQ2Jeew6i4jTTb6t9qQ8bUWiA20LV4=;
        b=UuE663hV7uRRXz3LR0bVuFqQDVawEZGhau3ETbi7TF2sjkJgm1wmugXwQMKY75Ko8g
         EG21j//Kacc9g1aizlnlRRCV2+bsqjP18VOghbB9P0NINl36vlmuR7GjakJjG4wj5wqI
         3DXEOrJytvuy8qFr2MfC9+iNOWhliLQeZfX6LfpYtAo+nJ6Te+JpXaOqGyHys2eZjLAv
         7owp6zqJE4SVegCUNuyPfPb9Zq7sZi3Fn3K5yESzqxAN/uCZCmmcCGtXi3BoWcsD6y+f
         K3MKqOjuPok8B4aYW8rAjdkFAd44/Mqi0szOxfiY6zhde9eRYJOvYEfPy/AfXRQf0d5v
         UWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748347330; x=1748952130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jQXnGuIl1CVxmwQ2Jeew6i4jTTb6t9qQ8bUWiA20LV4=;
        b=dYGKUOtmud1S+u5nfEh7Q6k6F7PB/C4JJG8MQXURWF4lSFTsXaxOPKaY5myuVtWQBA
         PYc87QUfRGevXC6693F+XNkBnkb1fTklP9JmLYtBhmTu1pVcIw2St1FhaJ6JltL6PZyJ
         rLH1vkEqWxLTB3152YqZld4PdMENAx+jD255NoIA3L+7LG2GP39D6IBAdEKZQ5LT6pru
         agLG7yqhYToHGp9xecLMRY4aL1Wx3PQM0aV1ZH5h1cJ3qK1iaRz8F9h+tUComSd0ziST
         eZyVhjDtzE0xBnMnSZfliPCIO/zYduHONw2tRNIaDePZzar81Wyc6Hf1kfEgLHqMz6dj
         yCJQ==
X-Gm-Message-State: AOJu0YyGz2aA+Ltic381/q1c4+zbPDGzDHJiaVG+1uG1EMz8LNj0TyHG
	mzUO4bH0ZcWEZT1Ox/TX11xuvs46vZvYEtNsTAnBfwchxx7bANXCogN63quOkcP38iU=
X-Gm-Gg: ASbGnctFUTEE7LDvvuo9guungykILRBulJsfIts1+YUGkydna1rzCeQ+6ba8KuPvAVv
	i7RngsXC9gfUcn/5IG2lGk+dBUubX58d5M1KuQkv3HUwh45DrMmKnVjQNcSlsWW6Sc3W76tXb9Z
	iIn3d/h8cfgxJGy/q9z5Hssh3F/aqx2aBDGqHk8PbeekJD2uZNXjKFMNC2XJ3KCNX/Q03SLil7z
	XrfRqbvugZnxRVzBsOIo3QSg856/m2JQx+l+DDRo1Q0nJWDWyVrXQ/g+wJuwCl6L9LsO08j6Y2A
	7MHs7xfRCaudU/WVLwlc+tdWnXzgA3osaxLmPllyQkq7je8KZbYOU7WOh3VkVRPN/mHLytxFdOB
	9go7C+k4x
X-Google-Smtp-Source: AGHT+IE7A+jN8M+Pb+mYepCDIHqQGvfRLDtVT80s1imArwjj5Fe6anaCnHlV/FI25CCK45M3W/7vnQ==
X-Received: by 2002:a05:651c:2125:b0:30d:b31e:262d with SMTP id 38308e7fff4ca-3295b99421fmr41007241fa.8.1748347330387;
        Tue, 27 May 2025 05:02:10 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32935cc7657sm26075711fa.65.2025.05.27.05.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 05:02:10 -0700 (PDT)
Date: Tue, 27 May 2025 15:02:08 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v5 2/4] qemuarm64.conf: allow overriding
 QB_OPT_APPEND
Message-ID: <aDWpwEGlwKoeSnh9@nuoska>
References: <20250527090758.540188-1-mikko.rapeli@linaro.org>
 <20250527090758.540188-2-mikko.rapeli@linaro.org>
 <233e873f04683cf93055707ce37235bc8d9a2742.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <233e873f04683cf93055707ce37235bc8d9a2742.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 12:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217299

Hi,

On Tue, May 27, 2025 at 12:53:20PM +0100, Richard Purdie wrote:
> On Tue, 2025-05-27 at 12:07 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > It enables qemu USB support which causes a reset
> > loop currently with u-boot.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/conf/machine/qemuarm64.conf | 2 +-
> > �1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> > index d310445a34..f086729641 100644
> > --- a/meta/conf/machine/qemuarm64.conf
> > +++ b/meta/conf/machine/qemuarm64.conf
> > @@ -20,7 +20,7 @@ QB_SMP ?= "-smp 4"
> > �QB_CPU_KVM = "-cpu host -machine gic-version=3"
> > �# For graphics to work we need to define the VGA device as well as the necessary USB devices
> > �QB_GRAPHICS = "-device virtio-gpu-pci"
> > -QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > +QB_OPT_APPEND ?= "-device qemu-xhci -device usb-tablet -device usb-kbd"
> > �# Virtio Networking support
> > �QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
> > �QB_NETWORK_DEVICE = "-device virtio-net-pci,netdev=net0,mac=@MAC@"
> 
> I am very worried about merging patches specifically to disable usb
> (here and in the selftest) since that is something we expect to work to
> allow the graphics images to work properly.
>
> Is there an upstream discussion about why usb causes the hang and/or
> any estimate on when it might get fixed? I'm partly tempted to revert
> the uboot version instead of this.

Please allow downstream configurations to override this. They may not
care about USB emulation with qemu/runqemu. Several layers try to
build upon qemuarm64 oe-core machine but may need to tweak things
to get to a working test setup.

With Linux kernel AFAIK qemu USB works well, and qemu itself.
u-boot is a different beast but we have developers working
on improving the situation and I've notified them of this
easy to test scenario. u-boot side needs to sync the USB
stack with Linux kernel side changes and this is not a small
task. Sadly no upstream discussion link currently.

Not a perfect answer but better than nothing I hope.

Cheers,

-Mikko

