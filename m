Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.22953.1593613217899318749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 07:20:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FFmbcWMH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id o8so22621692wmh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2020 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=4R0w9EhOjZNW93j3X1ctiCon9cYO18Nu6sZfcBqm8l8=;
        b=FFmbcWMHMD+P8V1yoU7iqTyydlECw1R0jpfaHBLCMAh0OobFO3EprQDUjiEe9A9XWo
         eLFJlDONCe5qE5v43tnJ8Y+xj9Z11mSVFT8sjostas8U9iWqdIiMcKd0AxvSaslNfK/5
         ZlYFC5eX1j7bL1JMntaWUa7x8sumKkV9EZauA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4R0w9EhOjZNW93j3X1ctiCon9cYO18Nu6sZfcBqm8l8=;
        b=TtYvsSlVbKEqJxICGdxuPAHdJ0fwDuqbL41/UyqYhqbrd2dvIMwVQpSGqBRlxQCzF7
         epql1js7bq/5DLdzm54fG7DW6eyZWNZuKJXcZZqzz0FaUG3xjxylmwoV3apyIY6ksess
         aVVEJLxLx5l1vhtbQgCN9byx3SNtSnzQZnT09NPDLgiDvZtgWLPJV8TC203VMeTNRk5B
         l3E9SGoMRsKIbke5IV3t/z92OMKa4dvkOqPjfr5LxXHVMTXBjX5xLFJAas7lqGuAJOoZ
         LB/oTKC/yTvbWmENffAFgT6iAhWxBF2GnAfIBNVdWPiZVxEDVDB3+LR09Pf8p8jZIJl2
         8eVA==
X-Gm-Message-State: AOAM53367/18bkQk7u483dRx3RlG5EuKRMJPXNykKjeaJjstTLZgn/aY
	4SYRvLi0oKmxn99Ckgq/ue40DQ==
X-Google-Smtp-Source: ABdhPJznzhPfwwnsAMcJQ0RqSWUfi2w7FU4NTKg3tHpWCethcPwqxPtH+vLOIHnbiqMx38kYi4nHbA==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr27140411wmg.93.1593613216335;
        Wed, 01 Jul 2020 07:20:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l14sm7388191wrn.18.2020.07.01.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2020 07:20:15 -0700 (PDT)
Message-ID: <77a85da756bb3519f495da8d1653f98ae439c771.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] python3: add ldconfig rdepends for python3-ctypes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 01 Jul 2020 15:20:14 +0100
In-Reply-To: <20200701023318.3887430-2-mingli.yu@windriver.com>
References: <20200701023318.3887430-1-mingli.yu@windriver.com>
	 <20200701023318.3887430-2-mingli.yu@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-01 at 10:33 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The ctypes module needs to use "ldconfig -p" to find the
> library path and it simply has below logic if no ldconfig
> installed.
>   except OSError:
>       pass
> 
> Before the patch:
>   >>> from ctypes.util import find_library
>   >>> lib_path = find_library('archive')
>   >>> print(lib_path)
>   None
> 
> After the patch:
>   >>> from ctypes.util import find_library
>   >>> lib_path = find_library('archive')
>   >>> print(lib_path)
>   libarchive.so.13
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/python/python3_3.8.3.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.8.3.bb b/meta/recipes-devtools/python/python3_3.8.3.bb
> index 2eb2a422e6..abcd16e63d 100644
> --- a/meta/recipes-devtools/python/python3_3.8.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.8.3.bb
> @@ -350,6 +350,7 @@ FILES_${PN}-man = "${datadir}/man"
>  
>  # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
>  RDEPENDS_libpython3_append_libc-glibc = " libgcc"
> +RDEPENDS_${PN}-ctypes_append_libc-glibc = " ldconfig"
>  RDEPENDS_${PN}-ptest = "${PN}-modules ${PN}-tests unzip bzip2 libgcc tzdata-europe coreutils sed"
>  RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-tr-tr.iso-8859-9"
>  RDEPENDS_${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', 'tk tk-lib', '', d)}"

Throws warnings in test builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/2123

Cheers,

Richard

