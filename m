Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web08.7097.1628073114638413387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 03:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CoRdImgV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id k4so1698975wrc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 03:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jfuJhY+eHnVddaXkzApKt6+twGqFODSP7dFfCrHjy60=;
        b=CoRdImgVH6JJHbQI/60YND3ze+2WoKT0AYUaRwWjgT0KMr5RVgmd6mcyVhc7UWW1AN
         gEWq1WDXaPYuC1MKDLoB7oSIrW8G0Tp4v06tUzozY+T9pHvFX4wqHZS+8uWfeZyfVMgY
         XFgDc9bXHG0QzMnJiEGeYEkfVJiojwB0fYbpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jfuJhY+eHnVddaXkzApKt6+twGqFODSP7dFfCrHjy60=;
        b=QYyWTWMPvfo8GZt1MVoegsrxrGwN9icIbN74l4I5v8zT29dvBWSewLin6AMnsiMu41
         jR6669EmGX8qoPbu48kEEkp5MB5ImLgiR+P9l56j/97cFlttwmJaxmnL6sWkh/+T4svh
         PY1zbMeboGBpulp0Az7wDJoTNZcKgupTJVbWyLF+aQlJKxHL44QFmgczyrWuwzPf7LxM
         jM1DbMCMZRRTunR/bwXT/FIXouNwJlZKumKtsegYHcjrv0CtyehAqtyRVGeDEC5ppIXB
         HkaUrLahs/5Mxe6kLetUA1/3DV429y7vwhAecvUNAbZjVuNzeT/qvHIh0hyaM83h2eTz
         s8Ig==
X-Gm-Message-State: AOAM532OpLUoHVd+q9g0MrzTMsU9uEwM+2PnSt/ky2Fug9s1ArihNGdE
	HHXryojUlEzRQSUvLJYlwVMyng==
X-Google-Smtp-Source: ABdhPJya5byQ4ZhAJ+I3ru9h+0s5UAVUeR1qfLD0jwmS1R8MxzUbKIAuX7mOqzazXoa/+jlBcSCMRQ==
X-Received: by 2002:adf:ea4b:: with SMTP id j11mr28078369wrn.156.1628073113044;
        Wed, 04 Aug 2021 03:31:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa? ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id w5sm2364893wro.45.2021.08.04.03.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 03:31:52 -0700 (PDT)
Message-ID: <3abc2853445a6f54a68cca95a87ee63925bf1588.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] convert-overrides.py: handle few more cases of overrides
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 04 Aug 2021 11:31:51 +0100
In-Reply-To: <1628040485-45946-2-git-send-email-denis@denix.org>
References: <1628040485-45946-1-git-send-email-denis@denix.org>
	 <1628040485-45946-2-git-send-email-denis@denix.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-08-03 at 21:28 -0400, Denys Dmytriyenko wrote:
> Add task-configure and few more supported values of TARGET_OS override.
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  scripts/contrib/convert-overrides.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/contrib/convert-overrides.py b/scripts/contrib/convert-overrides.py
> index 6505b18..23f63a2 100755
> --- a/scripts/contrib/convert-overrides.py
> +++ b/scripts/contrib/convert-overrides.py
> @@ -36,9 +36,10 @@ vars = vars + ["mipsarch", "x86-x32", "mips16e", "microblaze", "e5500-64b", "mip
>  vars = vars + ["class-native", "class-target", "class-cross-canadian", "class-cross", "class-devupstream"]
>  vars = vars + ["tune-",  "pn-", "forcevariable"]
>  vars = vars + ["libc-musl", "libc-glibc", "libc-newlib","libc-baremetal"]
> -vars = vars + ["task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
> +vars = vars + ["task-configure", "task-compile", "task-install", "task-clean", "task-image-qa", "task-rm_work", "task-image-complete", "task-populate-sdk"]
>  vars = vars + ["toolchain-clang", "mydistro", "nios2", "sdkmingw32", "overrideone", "overridetwo"]
>  vars = vars + ["linux-gnux32", "linux-muslx32", "linux-gnun32", "mingw32", "poky", "darwin", "linuxstdbase"]
> +vars = vars + ["linux", "linux-gnueabi", "elf", "eabi"]

I have reservations about linux and elf being here since this does lead to 
a lot of false translations for OE-Core. Since OE-Core is now translated I
guess that isn't the driving factor so I'll probably take this but it is worth
being aware of.

I did just have to retest a translation of core so I now need to filter all
these out the diff...

Cheers,

Richard

