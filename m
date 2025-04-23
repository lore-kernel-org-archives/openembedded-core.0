Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDABC369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 10:24:36 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4953.1745403870962494900
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 03:24:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NX0NdzLU;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-549b159c84cso7184197e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 03:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745403869; x=1746008669; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RWWqdgJtmCXIykrbKs/PNdPV3lMHPopjP/ByPhCdZo=;
        b=NX0NdzLUV3ZcN8nUL9Fv7hlWGm+XSjvTSFZL41erLaSEGNWLJgzVB1L8EglZbgTcom
         z+PoDnpb8LC/H54csEgoxTOt8QbQ7311dHnSEXqLTSv909B66Z5eyvWGsPVZEmOy20uZ
         Wpb+AKyVVXHXHHG8tF90ffUNDY2B44VIJh7i0G62XN6EdT5YQqj0HxkTF6W5RWqXQz6N
         Wl0qfWaZLw9+peAf9ykmgpNqcbmoSu4Lx+RLq/KzognbbN1SFBiNNShP54B63nT2WKIt
         ATRQGZuh3B1MuDIi1gGFMRRZfhXIW03KPSU8ixvOvMvNAzMhyuQCKAiuQxdQ5LB34i9G
         di5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745403869; x=1746008669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RWWqdgJtmCXIykrbKs/PNdPV3lMHPopjP/ByPhCdZo=;
        b=nPcoQnX8FS4TYSIr9NGoSidSAZrRsBq+uVnL6RzxLoeLMQgMSMDMXnKn1ZKZAwyHKe
         cavjKk0vtVZbrAnigNBgL+bJi+zft6WTxCPaw03TXplcDCibgWrXr7ysJTdku/TP69d0
         y8nLHHblFHLXiQMsgFaz+iNCKY2cNQtWZXqV98mdd09zZlWJiGZ8ago2vYy3jj/BAklf
         U3MUZCZcQ0p7gU8bqcGCpLkd5r7hKeSr6ihVUVplt7i8hUZics45GwWak0ZHS0Wz6RVD
         RFvAySDGQloXvDGLtfXKDtOA9NUemNvQvoMuygNaWqE0vRhklOflJuTbQleZWomohqk4
         Bnew==
X-Gm-Message-State: AOJu0YxiLI2BthuBgQIGjxDjGPmm720rRG65FifSW0SARUEh5oihejUU
	NtoAoOWd91+zjbK9NJ3y9xFXu4RVJiT/Hvk3ytv4XrGd3r3P+d/h7/uwRhtR2uTNUvhFXAMp8UH
	Yz9Q=
X-Gm-Gg: ASbGncuhIh3+ATu8OVp2UqT5Lx1bp8AtPQQ3lUPsYGv2VrpzZPvqjLYXpXGOe28Tmt1
	aenH33VP72V+QXvdJgbWLhhtk7yMKCYUo8Dq3AQLUXqI+jBe6t+Nvr2vDXDcSi2BDnCGUgA0Yd+
	6ov1lAbvT52JEcqZ7vsKd6StHeGe6cX3AO8kwTu9ZTw3/azD5E6rEzgrUY6gpzFxDGMSYklioV2
	uk0VCFNz2+Tzu9v114InQk++KAGlAFsVD2u00q5K7E/AgEEywKS3RJ9SxME4jJfdhCq0XfEntRi
	nXAYYqWr5+O43ceY+hKiqpWedUkpdmwAI3xhSB1EGD/ls5Hvg7hAabunIJTR5m9G0K6j4JvjdA=
	=
X-Google-Smtp-Source: AGHT+IG8VUoH7zd28/uitjZhqzfSJGevm6ZVWapLha2HHGa1Lfo5cHOEsKXN7cENg2gg7aUQ5LXPXw==
X-Received: by 2002:a05:6512:23a0:b0:549:4e7b:dcf7 with SMTP id 2adb3069b0e04-54d6e61d772mr5204331e87.3.1745403869065;
        Wed, 23 Apr 2025 03:24:29 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e540e17sm1483729e87.84.2025.04.23.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:24:28 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:24:27 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, bill.mills@linaro.org
Subject: Re: [PATCH RFC walnascar 3/3] genericarm64: add ttyPS1 for KV260
Message-ID: <aAi_26B8GiJ_GocG@nuoska>
References: <20250422190053.3244331-1-ross.burton@arm.com>
 <20250422190053.3244331-3-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422190053.3244331-3-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 10:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215276

Hi,

On Tue, Apr 22, 2025 at 08:00:53PM +0100, Ross Burton wrote:
> The AMD KV260 has a serial console on ttyPS1, so until we can dynamically
> detect the console under sysvinit we can add it to SERIAL_CONSOLES so
> this platform has a working console when not running systemd.

So full circle back to
https://lists.yoctoproject.org/g/poky/topic/109273447#msg13461 then :)

To me this change is fine but it's also ok to not apply this and focus
on "poky-altcfg" distro with systemd which is much better at
detecting HW support at runtime.

NB, should this have been sent to poky list?

Cheers,

-Mikko

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-yocto-bsp/conf/machine/genericarm64.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-yocto-bsp/conf/machine/genericarm64.conf b/meta-yocto-bsp/conf/machine/genericarm64.conf
> index f5000402e51..eb79475e9a9 100644
> --- a/meta-yocto-bsp/conf/machine/genericarm64.conf
> +++ b/meta-yocto-bsp/conf/machine/genericarm64.conf
> @@ -28,7 +28,7 @@ WKS_FILE ?= "genericarm64.wks.in"
>  EFI_PROVIDER ?= "${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd-boot", "grub-efi", d)}"
>  
>  # Try to bring up a selection of physical or virtual serial consoles
> -SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0 115200;ttyS0 115200;ttyS1 115200;ttyS2"
> +SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0 115200;ttyS0 115200;ttyS1 115200;ttyS2 115200;ttyPS1"
>  
>  # Allow u-boot to be built for use with qemu-system-aarch64.
>  # This u-boot is _not_ suitable for use with real hardware, and the expectation
> -- 
> 2.43.0
> 

