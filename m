Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F2DC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 22:53:35 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.822.1646348014078442731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:53:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OiiPdGmm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ay10so10012517wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 14:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=X+eNv4+5GaY2PJ/d/iO7RfJ7VZH4vgkLL7s3cDnCtIs=;
        b=OiiPdGmmlNmjApmbZdZsKWFwN+vr+/uM9zAtrP4znCd0RS4sUKIfRfSr8HQ8HSOpzu
         sCpF6ZI8BOWZobf40mm5xixWHD2sA/W7ieaxzVSVc9jCPpFycjupPz+md5yZg2LLKKb9
         ZEcGn5KDmGpoOZYnFF2veS6KDYnQvWwh/59vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=X+eNv4+5GaY2PJ/d/iO7RfJ7VZH4vgkLL7s3cDnCtIs=;
        b=l+2T4UcrQ5j89mGYtwVJyk4gIoYf2gHHHuEAf62xcJhGjBbZXHBYc4pDz9OrtPLeVI
         o+VfRXPLOZ+p8sQcRXNE/SwA0lN6B4QF6kNsLX+IFfSWm56k2LZBEY//oxFNvgwp8iSi
         RmBLe9f1pmzM/LZ1cIu9EHXXBGCKizj1xVjoD7luhMKRvsh+Y0F7RYlZFmMG1M8o0dJv
         aAeUI3HBt1yZl21QyD3xzcvQ7WaGPrIfi/Vh8uFXKkeU+l8MmCR+YRxem84e6V0k7wEh
         gdEGbs6JIcyVeQLGS42R6MzFhux7u7wt4FLRf5jYvc5hZg/fzKHhXeoxATsGzajT1A+W
         IrOw==
X-Gm-Message-State: AOAM532uIhUWpX+j5royNoyUNrs0n3+cON5CSohehJwswhmD3LvFq8EP
	jzT0q/k0W0JHRh3atgt1WjZX1g==
X-Google-Smtp-Source: 
 ABdhPJzsPCEkEAx+EhuNbdxj+8HqUqjn2cdN08cF4ySX74/abqhUo4LTNaV8oQf9kKQs8hnyeaF3vw==
X-Received: by 2002:adf:80d0:0:b0:1dc:90a8:4a1d with SMTP id
 74-20020adf80d0000000b001dc90a84a1dmr27471772wrl.180.1646348012321;
        Thu, 03 Mar 2022 14:53:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af?
 ([2001:8b0:aba:5f3c:f5cf:8b05:e0eb:94af])
        by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm3521795wma.2.2022.03.03.14.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 14:53:31 -0800 (PST)
Message-ID: 
 <3912ca5523901721837cd3200b9c685cd5561313.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libical: Pass TOOLCHAIN_OPTIONS via CFLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 03 Mar 2022 22:53:30 +0000
In-Reply-To: <20220301041346.1703440-1-raj.khem@gmail.com>
References: <20220301041346.1703440-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 22:53:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162702

On Mon, 2022-02-28 at 20:13 -0800, Khem Raj wrote:
> This ensures that right sysroot is used during build, otherwise we see
> warnings in build about using wrong sysroot and it fails explicitly with
> clang
> 
> x86_64-yoe-linux-ld: warning: library search path "/usr/lib/gcc/x86_6
> 4-pc-linux-gnu/11.2.0/../../../../lib64" is unsafe for cross-compilation
> 
> x86_64-yoe-linux-ld: cannot find /usr/lib/clang/14.0.0/lib/linux/libc
> lang_rt.builtins-x86_64.a: No such file or directory
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-support/libical/libical_3.0.14.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-support/libical/libical_3.0.14.bb b/meta/recipes-support/libical/libical_3.0.14.bb
> index 717eb11e125..879ad8ed595 100644
> --- a/meta/recipes-support/libical/libical_3.0.14.bb
> +++ b/meta/recipes-support/libical/libical_3.0.14.bb
> @@ -18,6 +18,8 @@ UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
>  
>  inherit cmake pkgconfig gobject-introspection vala
>  
> +CFLAGS += "${TOOLCHAIN_OPTIONS}"
> +
>  DEPENDS += "libical-native"
>  
>  PACKAGECONFIG ??= "icu glib"


I gave this (and the cmake patch) a go and whilst it mostly worked, it doesn't
work on arm (qemuarm or beaglebone):

https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/4855
https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/3774
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/4829
https://autobuilder.yoctoproject.org/typhoon/#/builders/110/builds/3715
https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/4825

Any ideas?

Cheers,

Richard


