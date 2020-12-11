Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web09.9956.1607705628235705860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 08:53:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LSxp4Juv;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id hk16so2645923pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 08:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=nkDLZI//j3vrg/+UCml7JhV88bp8ym1ur0q3JixjGCw=;
        b=LSxp4JuvuUkW8Leo5t6FiuUhJwC4n8UPme5qpNk+uz/AfHCqMn7HvnlVG0PGmEaEhR
         ra8oQwpGx4R01RZCkvpsVpqtJlGwnXxUqG197pyPeOjElSKQuygDJUTKRJJV3t6EAr1F
         Z+6Al9aDc2lp7gy9O3ARh1j9N4SUPkQOL+HhoGWXsYvbJh7M7TnZtB/uEhZj41xqZCQA
         ehQ6fR0x2OxYK5VidPw/n0CzoHmZWF4fO8Y8PRAOGTLmGpVMZBUbGqYEvYDMcDlQ4vPp
         Lh4xqDiV6JzA2cT0FrnXrbiOY8LbXJqDHHHym7qk+xtEQtfFVPa5+WSkDKiwvE1tJJlI
         zEew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nkDLZI//j3vrg/+UCml7JhV88bp8ym1ur0q3JixjGCw=;
        b=ZW3g1A6AGurv+8n4NKvy23avoE8A3gZQJlnicgRwOyemcKSeRFFoZlDCwe6cy5Nfdh
         yIo52F9doK19iEo729mn1k3MUM5TQaqBAAIzXUITbJK04H9PeVvMQ5nuA4sVqPxs7hRC
         RmqIpXx2WpYnYS1hsAZ/T/BdE3Tb8WsL7/D4Qp6g0RwXI07AKYGI0yg+MUV108Wyn3qm
         XZ3NBn4X1QnUo23saLru77lPGtZvhtATTC1Ul41uEsQx2DSRaXS4ddBqD3djJfdNy2G7
         tTmCSfOWO4KeLVDQ4MqQljpqsXjdGub5pXlHqi0MvmrYqyUJtLDhImlUrVkl0GIIS0SL
         yaxw==
X-Gm-Message-State: AOAM533jkteEYBf411PkEuNh6z18JD1XUegyH70L0XozHCIamCzFB6JS
	9GqV5xW0twA3+y4o8jP3vcn2pWi4lbGq4Q==
X-Google-Smtp-Source: ABdhPJyzWh9fMA4BpO5+7P7fTVkWSJEe51yJIsAlwDgJOLm1IG3x/s+KAGNT20fEGgjvvDeJvtqmsg==
X-Received: by 2002:a17:902:6905:b029:d9:9114:280d with SMTP id j5-20020a1709026905b02900d99114280dmr11995102plk.74.1607705627030;
        Fri, 11 Dec 2020 08:53:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::5bf5? ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id k129sm10944187pgk.1.2020.12.11.08.53.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Dec 2020 08:53:46 -0800 (PST)
Subject: Re: [OE-core] [PATCH] kernel: set COMPATIBLE_HOST to *-linux
To: openembedded-core@lists.openembedded.org
References: <20201211160922.4125554-1-ross.burton@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <51192976-54f1-a6dc-6be0-0780c3006338@gmail.com>
Date: Fri, 11 Dec 2020 08:53:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201211160922.4125554-1-ross.burton@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/11/20 8:09 AM, Ross Burton wrote:
> The target system triple contains whether the target is Linux or not,
> so use it to avoid situations where you can attempt to build a kernel
> for systems which don't support Linux.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes/kernel.bbclass              | 2 ++
>   meta/recipes-kernel/linux/linux-dummy.bb | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 1a444efabf..2f1006ddf0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,5 +1,7 @@
>   inherit linux-kernel-base kernel-module-split
>   
> +COMPATIBLE_HOST = ".*-linux"

does this cover linux-gnueabi and such tuples too ?

> +
>   KERNEL_PACKAGE_NAME ??= "kernel"
>   KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>   
> diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
> index 649fc04dd1..95dc85ff2f 100644
> --- a/meta/recipes-kernel/linux/linux-dummy.bb
> +++ b/meta/recipes-kernel/linux/linux-dummy.bb
> @@ -26,7 +26,7 @@ DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
>   
>   INHIBIT_DEFAULT_DEPS = "1"
>   
> -#COMPATIBLE_MACHINE = "your_machine"
> +COMPATIBLE_HOST = ".*-linux"
>   
>   PR = "r1"
>   
> 
> 
> 
> 
> 
