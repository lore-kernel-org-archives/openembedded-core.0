Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.8359.1615739716437183451
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 09:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b3B7Xr+R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id g8so6743543wmd.4
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=zZ5hKKhRUcfYl7sP9uch2gbZ4rlS3avpN6dziOXC2Yc=;
        b=b3B7Xr+RSwFnP1sxcpH2QlUx3zGgvlX3haH1+MqYXu1E21lBDDrREVrEXUNXv+lBgn
         AomM2UpCO1KfybU7iaWCxF2zJsKwQthgnhRdMgCpXiSZolRZNn0K6XgtiKPKCdByC36C
         CzFdli4LnyTNNpoVHZbRLlb2OVM9z+nYdCeV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zZ5hKKhRUcfYl7sP9uch2gbZ4rlS3avpN6dziOXC2Yc=;
        b=SgkVZy5WBLZr1WjD3OGsmXEzvcMOJXG00Fr8cjDy4JX24df5m7cyNoJyMRe9Cfu5hF
         2AsKLQ7TmPU0RIoQBwE028bkWzSrErACumWyFDiIEyMKXsFmGaOD5SGPaTKpC3yJFVx0
         O7PZXCgPju6kPz3Aa8vBtx/zj/NMkeO2AaWuO5Avwhsbdy6MahkX/Tqs5JV8CphWOX+C
         8DaCPijTW79XpJ9mG53EyvfXea/RGh8iTCYQPcYxS8ATBjry+erA0jWmAK4NsBXW50qD
         3MHsBPbMSSbSlxWGYuIzAParSgs5+GHpwDBTtXUUkaqHtykpYnJMC4oFq2nCgB2xbO/S
         ezmg==
X-Gm-Message-State: AOAM533oQyECrq8kag6+cwMNOY982iqSxV9XIRTf7sIUoyGmw8MSUzLx
	W8FDhJuwvPwQfI5BihMYcsEIyg==
X-Google-Smtp-Source: ABdhPJy2ZFp3Aabylo6BxGuUGhwsvKtJUa5Hcn3eQKRsEj6/stF3g5D4eaXCu8Y5iaJKX4TGy+eewQ==
X-Received: by 2002:a05:600c:21d4:: with SMTP id x20mr22358412wmj.58.1615739715012;
        Sun, 14 Mar 2021 09:35:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9c7e:acfa:71fe:22ea? ([2001:8b0:aba:5f3c:9c7e:acfa:71fe:22ea])
        by smtp.gmail.com with ESMTPSA id u20sm17140762wru.6.2021.03.14.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:35:14 -0700 (PDT)
Message-ID: <3d64079d725c3c0ddd31a117bffe41f64002970b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] base-files: exclude METADATA_REVISION for signature computation
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Sun, 14 Mar 2021 16:35:14 +0000
In-Reply-To: <20210308055241.13462-1-Qi.Chen@windriver.com>
References: <20210308055241.13462-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-08 at 13:52 +0800, Chen Qi wrote:
> A previous commit changes poky's DISTRO_VERSION to include METADATA_REVISION.
> 
>   """
>   poky.conf: do not write current date into distro version, use git hash instead
>   """
> 
> This results in base-files do_install depend on the METADATA_REVISION, which is not
> expected, exclude it.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 94299431f6..338e75580f 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -144,6 +144,7 @@ do_install_append_libc-glibc () {
>  }
>  
> 
>  DISTRO_VERSION[vardepsexclude] += "DATE"
> +DISTRO_VERSION[vardepsexclude] += "METADATA_REVISION"
>  do_install_basefilesissue () {
>  	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
>          if [ -n "${DISTRO_NAME}" ]; then

Unfortunately this causes cache validation issues and hence 
multilib conflicts:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3222

Cheers,

Richard

