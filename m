Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.55971.1600067614657163922
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 00:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Az22/XKk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id m6so17469752wrn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 00:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ylT39rLIAHKtJiA7/pQzeeql9GLYeWDneBEmF3fRuX0=;
        b=Az22/XKkC1M2LfzaguciyR7HZq8amG7VrqG8p/VxVdeGy9htM2xLCGNOke09Os/ZX0
         1kyPA6qfhZMD0Em/8MF8rSGoWs4SoFdhIFqUmeHtA/PgOq/Rqb5kPju2jb4Itay8Almx
         JhwI4ilK7hg9Hkxi44fUxjv5KT2NDrYEBxubg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ylT39rLIAHKtJiA7/pQzeeql9GLYeWDneBEmF3fRuX0=;
        b=i640o/Ig6crnkMfl2jlCu0yMJ/fWeur/XbS06tHlhyOs0xlGrbi4TCrNqPUgg6vJ+8
         kbrBkgBR6kEofv9gt+PN7+F0bKaaHZMmitUq/OoF7tnRvXY6mpduW3UwDk3iUJ46dL6e
         WutfQ5MEn4y+4Ad9RZuC7tQ6Me+NN12+p49ChuA1frZR24o4OxipzMuHYdAL+kKugoFp
         Dw4e1ObJRcKM/ThqX6MDvn5DZcbd2W8f/nE4ZsCspB/eBunFnWs1OkZoDoUBISDoFj+C
         8cY8iU81K/aWXFw87o5/ohhz03p6Z4KghHdUBEqVslPCprFQzVDCTT5YqghCb5gg0YqU
         Os4w==
X-Gm-Message-State: AOAM5306W9hQ29f7yHnnj/99TVUBEMz9CBnXQIdyoEwz76YsDSDhh29J
	mEDW67c/u9N2CnJZ+pzcQ4S7Eg==
X-Google-Smtp-Source: ABdhPJzu3eqBkP+Md6bbBw7NhJKa6ZCMQH5X+1n864L8DPAr815wZXyN9TKO+OugAY3zo07FdDCcDQ==
X-Received: by 2002:a5d:69c2:: with SMTP id s2mr14326047wrw.389.1600067612985;
        Mon, 14 Sep 2020 00:13:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.9.9.2.a.3.7.f.d.c.a.e.2.4.1.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6142:eacd:f73a:2991])
        by smtp.gmail.com with ESMTPSA id v9sm22616787wrv.35.2020.09.14.00.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 00:13:32 -0700 (PDT)
Message-ID: <82df031010def40bb2f2f1bfe160cbbb8330353d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] core-image-sato: qemumips use 512 mem
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: akuster <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.comt>
Date: Mon, 14 Sep 2020 08:13:29 +0100
In-Reply-To: <20200913035916.24165-1-akuster808@gmail.com>
References: <20200913035916.24165-1-akuster808@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-12 at 20:59 -0700, akuster wrote:
> From: Armin Kuster <akuster808@gmail.comt>
> 
> Fixes:
> 
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: Couldn't login into
> serial console as root using blank password
> WARNING: core-image-sato-sdk-1.0-r0 do_testimage: The output:
> root
> <<< run_serial(): command timed out after 60 seconds without output
> >>>
> 
> In another run, this error was seen:
> 
> Failed to reload daemon: Refusing to reload, not enough space
> available on /run/systemd. Currently, 14.3M are free, but a safety
> buffer of 16.0M is enforced.
> 
> With updates to systemd and Qemu we should revert: 499a31cf06 core-
> image-sato: don't use 512MB in qemumips
> 
> Signed-off-by: Armin Kuster  <akuster808@gmail.com>
> ---
>  meta/recipes-sato/images/core-image-sato.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-sato/images/core-image-sato.bb
> b/meta/recipes-sato/images/core-image-sato.bb
> index 673106eb6d..878e0eaa8d 100644
> --- a/meta/recipes-sato/images/core-image-sato.bb
> +++ b/meta/recipes-sato/images/core-image-sato.bb
> @@ -12,4 +12,3 @@ TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool
> nativesdk-glib-2.0"
>  TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-
> intltool nativesdk-glib-2.0"
>  
>  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
> 512", "-m 256", d)}'
> -QB_MEM_qemumips = "-m 256"


We have now seen:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/2452

with this applied, not sure if its related. We have seen this kind of
network dropout elsewhere but we don't seem to have good debug when it
happens.

Cheers,

Richard

