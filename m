Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.4644.1618699580398549224
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 15:46:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bozhS9mt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id s7so30088254wru.6
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Apr 2021 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=dlxvhxTonJwlTRhW3O/PxrdCqt84BbrygsFDYNtjN5Y=;
        b=bozhS9mtb/O7TrB3V9Yp5BLBNQ2XqbmMpjrjsMH+ZYVA6w/cxnE8/0aHiLbQJCQbLR
         YfDD7nHTVcz4LBnKFOD0HF/3YeVcDJ/1uqRRf1X7U0ocv+3GQyF9I+Wb/TBhBgQFlLts
         2niDrbd+SOkEi97syz1cPEq3AOsmnbmlJad1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dlxvhxTonJwlTRhW3O/PxrdCqt84BbrygsFDYNtjN5Y=;
        b=Aj/ddoETPt70aRq33Fq0fXxTmyUt3w8jx137t2A9oYjzUjMARgECVxge/h4+SXz28g
         VY0b4dW4zNvH4x8Pu8iHLiXn7YI+P5IOQ0AFEs3Rbz8+yFwQ3UBMTEPmgAnc46tvxw19
         xRwvpLW+9ZHGmT7nY6mwIbIrB509Or0Hu747l0sRZyjTbSaGr5zLlms2ZZE1jmIsQJkM
         0frzwWInEMYHLGI/gmwKO4AMV92H8kid7QyEQLOHznvMcvBgfBKeSTLd8rilc6WN2Y+6
         wOQQRAIIAVw4jYHPejTVarybvs9jg251qJZ2x+wvPs8CzTkoquw7iwXM0suyZ9l0tQNr
         LIVA==
X-Gm-Message-State: AOAM533iHVFQhZTB7KXdby29/XlK/WfSbitsdmxC7e+SnZu1ivOCJxnA
	60BXEv5MTROS3qJfe1+ZtmfhRw==
X-Google-Smtp-Source: ABdhPJwuwiOIT0/qkJw9aDidXCj8ONNOiISw+TTJUIPp+zM4S+FEgmYlNz5uFExRpEonvKRwHc78jw==
X-Received: by 2002:a05:6000:1843:: with SMTP id c3mr6296520wri.361.1618699578809;
        Sat, 17 Apr 2021 15:46:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6d3d:a3c6:3e:d74? ([2001:8b0:aba:5f3c:6d3d:a3c6:3e:d74])
        by smtp.gmail.com with ESMTPSA id 186sm14338251wme.10.2021.04.17.15.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 15:46:18 -0700 (PDT)
Message-ID: <0c8c71ddd1847a6596f7cd02b7a8132e4ece5b2c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] perl: fix startperl configuration option for perl-native
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
Date: Sat, 17 Apr 2021 23:46:17 +0100
In-Reply-To: <20210416222834.273394-1-paulo.zaneti@gmail.com>
References: <20210416222834.273394-1-paulo.zaneti@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-04-16 at 19:28 -0300, Paulo Cesar Zaneti wrote:
> Unlike vanilla Perl "Configure" script, perl-cross "configure" does not
> derive "startperl" from "bin". It instead derives from "perlpath".
> 
> This patch aims to fix "startperl" configuration option for perl-native by
> correctly setting "perlpath" on perl-cross "configure" script.
> 
> Signed-off-by: Paulo Cesar Zaneti <paulo.zaneti@gmail.com>
> ---
>  meta/recipes-devtools/perl/perl_5.32.1.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
> index b28040c7fb..82c2922066 100644
> --- a/meta/recipes-devtools/perl/perl_5.32.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
> @@ -95,6 +95,7 @@ do_configure_class-nativesdk() {
>  do_configure_class-native() {
>      ./configure --prefix=${prefix} \
>      -Dbin=${bindir}/perl-native \
> +    -Dperlpath=${bindir}/perl-native/perl \
>      -Duseshrplib \
>      -Dsoname=libperl.so.5 \
>      -Dvendorprefix=${prefix} \

Also caused:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=master-next&id=ea4ad00a36fccdd7015f57b410d10776a037a485

and probably other failures in the build. I dropped the patch from -next.

Cheers,

Richard

