Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.34140.1607952963969042615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 05:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QMBwy0OV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id e25so15283804wme.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=k0W5ovPGBlxbXXHgyfxCf1WV4S1fQxeesWwdSuhy6do=;
        b=QMBwy0OVvzl04LxvnUJtlyeIyeUc9Rj2WNB8SCxhQKHsqD+3HG1lMbMTOqvOICQQFB
         tlOf7Zsmc+WoYMgAWxdNxRBzUySWfC5tPWjNz4m8rFEZT+EDr5BraxS52FF91w830fkW
         NVVMnfwZ5I4iXQ/vdMBahUpOpS4MIMqIrOY64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=k0W5ovPGBlxbXXHgyfxCf1WV4S1fQxeesWwdSuhy6do=;
        b=ZoVcgGEKVU4A3c1ry4JmYyaekmtOg5849dnZTjvXq9v9l+CV1gCwfB/YGPtRNwxvVd
         jB2N3mwEjbjAYN2EdrUHq+QSLJzymMcvwPdpEOfvBpSk6d/Dkj0N2TMA2l6g0qFqON/M
         RY3QhFmCt5FJNQ9bdQh/HIdD2RJNSCQ09OWlb+b9dusSx8m4JFzoyrcyFqC2RClxGqGl
         freHu1QW0pblpsvpCbN8wm6DTdrjipUcrTcf99d6eZ1/uDWdc0xO+z3Ed4cANqU+aiFR
         zmOa1OhvvjSNgpUKiamvJEjentD9QC+pJrf3rPefRvwboh7gpQ6DzPMADWR6mpDBJVd9
         AoVw==
X-Gm-Message-State: AOAM530hG0Z6v/h0upA9mck7NdQiCJyIpmjyVaSWbHxcjH5+h3SwPiW0
	z6hVjiAG8M3SEEnja36KFdrNWg==
X-Google-Smtp-Source: ABdhPJx+HaqHgm4DfFnml16LNT3j8osOjGP6ZMtOEWdrMq7TK855Fx4FyQApvricoH4KzY6OhRINQA==
X-Received: by 2002:a1c:4c0a:: with SMTP id z10mr27367179wmf.95.1607952962425;
        Mon, 14 Dec 2020 05:36:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id m8sm31186413wmc.27.2020.12.14.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 05:36:01 -0800 (PST)
Message-ID: <785c22d923a4c97fd32a5395d6914195318c721b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd-boot: allow building for Arm targets
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alejandro Hernandez <alhe@linux.microsoft.com>
Date: Mon, 14 Dec 2020 13:36:01 +0000
In-Reply-To: <20201210163242.3329917-1-ross.burton@arm.com>
References: <20201210163242.3329917-1-ross.burton@arm.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-10 at 16:32 +0000, Ross Burton wrote:
> systemd-boot work on 32-bit and 64-bit Arm targets (assuming the
> firmware
> does EFI, obviously), so allow it to be built.
> 
> Remove the SYSTEMD_BOOT_EFI_ARCH assignments, as they're never used.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/systemd/systemd-boot_246.6.bb | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd-boot_246.6.bb
> b/meta/recipes-core/systemd/systemd-boot_246.6.bb
> index f92c639810..453351d1b1 100644
> --- a/meta/recipes-core/systemd/systemd-boot_246.6.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_246.6.bb
> @@ -47,15 +47,10 @@ RDEPENDS_${PN} += "virtual/systemd-bootconf"
>  
>  # Imported from the old gummiboot recipe
>  TUNE_CCARGS_remove = "-mfpmath=sse"
> -COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
> +COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
>  COMPATIBLE_HOST_x86-x32 = "null"
>  
>  do_compile() {
> -	SYSTEMD_BOOT_EFI_ARCH="ia32"
> -	if [ "${TARGET_ARCH}" = "x86_64" ]; then
> -		SYSTEMD_BOOT_EFI_ARCH="x64"
> -	fi
> -
>  	ninja
> src/boot/efi/${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE}
>  }

Breaks meta-intel ?:

https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1012/steps/12/logs/stdio

Cheers,

Richard

