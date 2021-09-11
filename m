Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web08.8852.1631394697310313313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Sep 2021 14:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KVLx9Xq5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id g74so3697248wmg.5
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Sep 2021 14:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YClWcaNz4hScoX0PBvM7B+3qeDfa9+gRP8y2gwqNONU=;
        b=KVLx9Xq5Djf1RQGYEGzRSn+IxgF9q+g1jGURUdR4IZ8oJYwn9WQkcpm7wOKIm44/pZ
         Jr/7ujPG7jldB/5vTXvmSuO2Gubc5JxOYbwegUkr9zdhLRYu916uN/wSLgie240Euc/c
         3PAek6SRsjlWdw5V3V/5bPdDJjMi44eLTtrVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YClWcaNz4hScoX0PBvM7B+3qeDfa9+gRP8y2gwqNONU=;
        b=1p5I7sjM+96jaqNrmqnAWDa1Pq8boduhhfM9PJFwyaym0wI5RX8uRAPgaNp9WtpeXF
         wY8NzLwuy0OR8g/HTXijFpvsgcjxx2kI2+4nvu59jlTsJYKGAqDUyN7Slt+Ql1IvRmLF
         OX+jXvtOG/JgdshkClTpEghHK+ksMgTnvIb+TITdNGnluP7vpPnHMqUc1Sx+9v0NPEnE
         jbz2s/iD80vgqBJWIqEfa4OZlJ/NQYjWLH7fM5B2Rd4QUNu2aPa5M0Z66kkV7vtfJCn0
         GNQenVsESOFhgdSz9WqDeShyrHLilBTzLWj1f5tKRqnza5oS+QhOyijXgW8CLuNAaZc5
         JE0A==
X-Gm-Message-State: AOAM530OZE1w1V5Gn5ZyiW2pSx6tmL6OXA0CXdCfg99Cfn7ZC0BvafSh
	RBFmLLBZjoa/oh5oQMseZTUhFg==
X-Google-Smtp-Source: ABdhPJwEmX11HjLxi3GpRgIUU273GQdDIdWxUtfr4q9TaOPDFRxHMznTI+mGbiDQ+LdRbsRZoK2XWw==
X-Received: by 2002:a05:600c:4f94:: with SMTP id n20mr4023229wmq.110.1631394695689;
        Sat, 11 Sep 2021 14:11:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:65df:1d9c:d97e:b357? ([2001:8b0:aba:5f3c:65df:1d9c:d97e:b357])
        by smtp.gmail.com with ESMTPSA id f7sm2456223wmh.20.2021.09.11.14.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 14:11:35 -0700 (PDT)
Message-ID: <a02f5ca73dcb4fb2d9d8c76e6fc5f6f0001a2361.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] [hardknott] module.bbclass: Improve kernel module dependency detection
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Charlie Davies <charles.davies@whitetree.xyz>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Sep 2021 22:11:34 +0100
In-Reply-To: <20210911202850.24488-1-charles.davies@whitetree.xyz>
References: <20210911202850.24488-1-charles.davies@whitetree.xyz>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2021-09-11 at 21:28 +0100, Charlie Davies wrote:
> If a kernel module recipe specifies a DEPENDS on another
> kernel module currently the module being depended on
> must have a name starting with kernel-module- .
> 
> It is perfectly valid to name a package without the
> kernel-module- scheme and instead use:
> 
> RPROVIDES_${PN} += "kernel-module-my-module"
> 
> in the package's recipe to provide an alias package
> name.
> 
> This commit introduces functionality which will search
> through the RPROVIDES aliases of each dependency package
> to allow packages not named kernel-module- to be
> recognised as dependencies.
> 
> Signed-off-by: Charlie Davies <charles.davies@whitetree.xyz>
> ---
>  meta/classes/module.bbclass | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index a09ec3ed1e..c4f052234d 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -6,11 +6,25 @@ MODULES_INSTALL_TARGET ?= "modules_install"
>  MODULES_MODULE_SYMVERS_LOCATION ?= ""
>  
>  python __anonymous () {
> +    import oe.packagedata
> +
>      depends = d.getVar('DEPENDS')
>      extra_symbols = []
>      for dep in depends.split():
>          if dep.startswith("kernel-module-"):
>              extra_symbols.append("${STAGING_INCDIR}/" + dep + "/Module.symvers")
> +        else:
> +            if oe.packagedata.has_subpkgdata(dep, d):
> +                data = oe.packagedata.read_subpkgdata(dep, d)
> +                key = "RPROVIDES_%s" % dep
> +                rprovs = data.get(key)
> +
> +                if rprovs is not None:
> +                    for rprov in rprovs.split():
> +                        if rprov.startswith("kernel-module-"):
> +                            extra_symbols.append("${STAGING_INCDIR}/" + dep + "/Module.symvers")
> +                            break
> +
>      d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
>  }
> 

This looks a bit like a nasty determinism issue. The original code only looks at
DEPENDS which can be determined at parse time. The new code will depend on what
is in the pkgdata sysroot which may or may not be present leading to varying
values of KBUILD_EXTRA_SYMBOLS. It will also have a pretty heavy overhead though
reading extra files.

At the very least this code needs to be scope limited but I'm not sure how
KBUILD_EXTRA_SYMBOLS is being used to be able offer more advice on that.

Cheers,

Richard



