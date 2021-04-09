Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.9035.1617974001192816429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 06:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XzNrfkFi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so2221863wmg.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Apr 2021 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mPABByDsg3FqBdYAmdXURcRq1P5g5XXGKD6t0KnQ6cQ=;
        b=XzNrfkFisuTSCoO294xDFo1SEJFDWdOgazCgol6iMHGhWRo9zGicZDGGf7FV3Om6dV
         TfGKFFyiUzz8X1kIVqYEqW8AZxW3TL9Pz0zL8OCwAkeknSGu4xuqujG6VyY8P8L6ItjX
         w+R0r9ri27Wq7VEnFqUpHflneX8TsLfOYbDtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mPABByDsg3FqBdYAmdXURcRq1P5g5XXGKD6t0KnQ6cQ=;
        b=HTecRBpDqzW0SEu5oKYru3aBPIgfIDU/9IHVjgLC3RC/VQy1J44X0kEYJl6gSL2RD6
         WmgFnhzLzlGtg5vKUG3U9qdzXThl7lLsg6BLPcuBBeE6Rt5eyEpOthu6gVAhahUvTBuu
         e4MRepCIefAqDhCE7IMeUHqmBetAsAruO0oPkVULCwSy7bNbkWHMmrR253AchZqCdpp7
         irQYfgyhkXBmrLVED4qlCmXkay4eUlfmdujsvf1y3oxdtwGcqjKoVM1eJJgTU041Oc2X
         qKcRkGUt/I4CM8stOS8SuAK5cykkylbl4IWZ+G/Hu+o4qOMR4h6S4ZjkvguABhzdm3Gh
         iNNQ==
X-Gm-Message-State: AOAM531FU9/3ZqodrtlXc049JPUoJ5GVaRy4RCxEfeOcaQttrW03T9MZ
	+ZZL3qdmhJfGkwiA8i0+LbPbZg==
X-Google-Smtp-Source: ABdhPJxk/2k5eDdJ9fvSdgSrpEHJs96Ol/PJX70+EEt9oNSDU36ojPH1b3wnfPipLO6/D61pRfE8fw==
X-Received: by 2002:a05:600c:4b98:: with SMTP id e24mr4062296wmp.160.1617973999592;
        Fri, 09 Apr 2021 06:13:19 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc? ([2001:8b0:aba:5f3c:434b:3ea0:b8b8:6ecc])
        by smtp.gmail.com with ESMTPSA id e13sm4767013wrg.72.2021.04.09.06.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 06:13:19 -0700 (PDT)
Message-ID: <b98452fc42b604fc8e2c0593d58c125efc0011cd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] parselogs: ignore floppy error on qemu-system-x86 at boot stage
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 09 Apr 2021 14:13:15 +0100
In-Reply-To: <20210409090329.3177554-1-yanfei.xu@windriver.com>
References: <20210409090329.3177554-1-yanfei.xu@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-09 at 17:03 +0800, Xu, Yanfei wrote:
> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> We can disable floppy drive by BIOS on a hardware, but an empty floppy
> drive is connected by default on qemu-system-x86. Linux usually detect
> the device and modprode the matched floppy.ko at the boot stage. Due to
> we don't specify a floppy deivce in qemu boot arguments, then the errors
> about floppy reading comes out.
> 
> It is harmless and normal, so we could ignore this error message on
> qemux86.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01402.html
> 
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>  meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
> index 4714741aff..1bb0425521 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> @@ -88,6 +88,8 @@ qemux86_common = [
>      'tsc: HPET/PMTIMER calibration failed',
>      "modeset(0): Failed to initialize the DRI2 extension",
>      "glamor initialization failed",
> +    "blk_update_request: I/O error, dev fd0, sector 0 op 0x0:(READ)",
> +    "floppy: error",
>  ] + common_errors

I'm a little puzzled about why we don't see this on the autobuilder. Are you
configuring qemu differently?

Cheers,

Richard


