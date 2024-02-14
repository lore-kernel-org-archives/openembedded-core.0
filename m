Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A07C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 11:04:41 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.39283.1707908676007122375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 03:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=w+lTPlrA;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d09cf00214so70367291fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 03:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707908674; x=1708513474; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B72z1/jWYRPXJjJ2wgFCF3Z7sDNsCTha6iAykG1Sxus=;
        b=w+lTPlrAXExjGejYZhggpdEWeLFPnIvR/aTKDgdaHDjzl0/Kuj2qIzUTCRVhNV/Cxz
         nJENHrIlDBMrLubFAOE1xMH3D8iSO3rax9+rtN0E1ab+50IKf77GA3NBwGshwSCuD90T
         7CIQwqGPfYKVhevStM5VLt+N4OYZKy1TvfTZS4BvuA5AyXll6DcvY13rmw8W/OHf+97l
         nUzmUys8aays0LdNLcQ08luLesIqO0vHqt/exFkyg1dccFQ3TyR6Ao+232JD7g8rWLBp
         TXzK33BtyxJ032KL0et6tlxYd8Lvw82WY6BHG3BsYf/Hm3H5/QaDP268b478Q/lgma0E
         bw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707908674; x=1708513474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B72z1/jWYRPXJjJ2wgFCF3Z7sDNsCTha6iAykG1Sxus=;
        b=jTZeAbMhC51tWOR2YHTG04KcV+ywljEagwzwCdnZEBVt4p1kaZtW6xARAjJ7ddBTjl
         qFKMNB1JIlD0OQRYNzmWdoQXuW4fz5n3BuJ8cnRVJ4yi3c+tt77AKl+0DGI0nuOCtSIp
         1DxQxvDMpsHhL/GtuQUDUW23hAqMoDf4nOiSOahz3juaoIjL7SI+XWof908qxoWKaPaF
         fe22JuDhlJysQE2o0KDXlAw8eC67Rkr97srzy+gQTEewVsbOf+gF1Ca2nt4h6D/8RRBT
         cLA2P5ExuzSpU5a3aH8PAtu2h2kdsKqw8z5H5q48XiXhsSuXKqgPNHAQxTpITvFUloT3
         VBRQ==
X-Gm-Message-State: AOJu0Yw1BBz2IMjYdAjZqMuAssZ1rprbUONCUN4A7qXyQU+daXgOWpfg
	WOXbkDOTQUHc6hZdZeSD8k9edyxushD9NFBHXAJb0ZNe8qbaf5ZydlrTeVIM38s=
X-Google-Smtp-Source: AGHT+IHt9eJD9JgNjZ36Cn7apBoQDpDTYAHBLlYXddXOYIqsGChCYlIPI+tS103oXw+00bkGsP1/ow==
X-Received: by 2002:a2e:8752:0:b0:2d0:e5d8:d33d with SMTP id q18-20020a2e8752000000b002d0e5d8d33dmr1543231ljj.30.1707908674044;
        Wed, 14 Feb 2024 03:04:34 -0800 (PST)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id j15-20020a2e6e0f000000b002d0c639e0cesm817551ljc.6.2024.02.14.03.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 03:04:33 -0800 (PST)
Date: Wed, 14 Feb 2024 13:04:31 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] qemuarm64: maximise the emulated CPU
 capabilities
Message-ID: <ZcyeP_-leKRqfafa@nuoska>
References: <20240213164223.263232-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213164223.263232-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 11:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195466

Hi,

On Tue, Feb 13, 2024 at 04:42:23PM +0000, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Instead of emulating a Cortex-A57, just ask qemu to emulate everything
> it knows how to (apart from Pointer Authentication, where we use qemu's
> implementation-defined algorithm which is vastly faster to emulate).
> 
> This does not change the tune, so the generated code is identical. The
> advantage of doing this is that it lets us verify that features such as
> Branch Target Indentification, which requires hardware support, is
> actually functional.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/conf/machine/qemuarm64.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
> index a096d964db5..63af4cd346d 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -14,7 +14,7 @@ SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
>  # For runqemu
>  QB_SYSTEM_NAME = "qemu-system-aarch64"
>  QB_MACHINE = "-machine virt"
> -QB_CPU = "-cpu cortex-a57"
> +QB_CPU = "-cpu max,pauth-impdef=on"

FWIW, this can also be risky and cause instabilities. We've seen boot hangs
at least with old qemu 7.2 and kernel 4.xy where serial console detection
did not correctly work on every boot.

If things work now, then great!

Cheers,

-Mikko

