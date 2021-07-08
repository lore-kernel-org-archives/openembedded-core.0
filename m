Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.8701.1625728073769021544
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jul 2021 00:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d8w20eNF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id w13so3380958wmc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jul 2021 00:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LW6jBM00vU1Fd0tHKvCyuAQaIDjto01EWuUqo/7k38k=;
        b=d8w20eNFKbu9Ks/gDYiabRQhzhffNYCTsd285GuM5B6YaqDzth2t5s08nthWjaZgiK
         lOG3pyaAKhh7MzIJKoGczqdNIxhxkUzMPJLaGeyPXN9kca4r+2yLuRUGTu3gCTtpdF6+
         yGvnfGUiBfhAbf1jOzkPWT0QZ93t+/YWdsEYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LW6jBM00vU1Fd0tHKvCyuAQaIDjto01EWuUqo/7k38k=;
        b=qfubgXFSBh9TZ5EhMkpZ5+Q90MFCIit060b62OW/YaQWZbRxqDpL51F+gT+MiEzYUr
         Z5qttAakfBqJcooytTDeVCM993uotawkVcSQ1x4JjUfiC+cCYEvxw/G0JvPnpkT7Bhym
         6uAPEsn9XJOn+SeU86vL1M1xwjgkocOOm5Wyw+pL38HSnVHbMOrOHenL/7ptM5vYlFfx
         jOvjgh9+/l94IsSwz1evntIvlGCpRnZTHXqFwZDagMGb1GyP3034PjuUNg2xIONQujDY
         h8OYO3ZSVx5HOtB5FBvdR3ruJzPOAh89KOHwgDaXB4SC9RTRjb+Yd/Wfe8rnRWcE51wU
         FbwA==
X-Gm-Message-State: AOAM532VSauoxo33IsOQVn38NNjXb2+mEtQSQ+81IYXmQa0cO5BuyNET
	jBHTbFJUL9zyN6lq7t4zaT372A==
X-Google-Smtp-Source: ABdhPJzcPr3ZAWwBCm69lXJIWdUrpS/1puuEUGAOvIwFDni2HEc3FJ8+ZjoxRKq3x0+r/5kcoveTIQ==
X-Received: by 2002:a05:600c:4304:: with SMTP id p4mr3384876wme.43.1625728072121;
        Thu, 08 Jul 2021 00:07:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:226d:2875:5aa2:565b? ([2001:8b0:aba:5f3c:226d:2875:5aa2:565b])
        by smtp.gmail.com with ESMTPSA id b20sm1129450wmj.7.2021.07.08.00.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 00:07:51 -0700 (PDT)
Message-ID: <54f75f5235de458ba76f53ed6ef77a98092b9da7.camel@linuxfoundation.org>
Subject: Re: [RFC][PATCH] libubootenv: exclude from world build if no u-boot config
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>, 
	openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com, otavio@ossystems.com.br
Date: Thu, 08 Jul 2021 08:07:48 +0100
In-Reply-To: <20210706155551.8958-1-peter@berginkonsult.se>
References: <20210706155551.8958-1-peter@berginkonsult.se>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-07-06 at 17:55 +0200, Peter Bergin wrote:
> As a fix for failing the world build for targets not using u-boot
> as boot loader libubootenv is excluded from world builds if
> both UBOOT_MACHINE and UBOOT_CONFIG variables are empty.
> 
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>  meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> index 306296922c..6774290ea5 100644
> --- a/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> +++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.2.bb
> @@ -28,3 +28,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  RRECOMMENDS_${PN}-bin_append_class-target = " u-boot-default-env"
>  
> 
> 
> 
>  BBCLASSEXTEND = "native"
> +
> +# Exclude this package from world build if there is no config for u-boot
> +EXCLUDE_FROM_WORLD = "${@'1' if not d.getVar('UBOOT_MACHINE') and not (d.getVar('UBOOT_CONFIG') or '').split() else '0'}"

To be honest I'm still struggling to understand the problem here.
(I'm also not sure we need the split() above)

You previously said "If you just want to build libubootenv you should be 
able to do it for any machine, with or without u-boot support as there is 
no build dependency between libubootenv and u-boot." which does make sense 
to me but the above doesn't seem to be much better than the original
inherit?

Perhaps we should be doing something like:

python () {
    if d.getVar('UBOOT_MACHINE') or d.getVar('UBOOT_CONFIG'):
        d.setVar('RRECOMMENDS_${PN}-bin_append_class-target', " u-boot-default-env")
}

since the recipe is marked as machine specific (which I worry about in 
itself).

Cheers,

Richard

