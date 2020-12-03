Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.4312.1607032019292963138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 13:46:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Pbw+TvNS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id a6so4016944wmc.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 13:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nDUwMSOC31NZiPbPq4HmSSvQpazHuPzunjebTs5Jpp8=;
        b=Pbw+TvNSRsppaD/yvKRljeCSGO9Lg1eLf9ZcRsoIyYVDj16IZgnelyu59z7SVFWuVr
         Ja28UpshtAmOSTa9aPyLNwfWcVfxe560B2ArPFdw10pJWCP6S0z9yVRECFU6M6tKE1Rr
         g0FxcQ7vXQAeSqtWlN9qqZFvghryxD5nph8RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nDUwMSOC31NZiPbPq4HmSSvQpazHuPzunjebTs5Jpp8=;
        b=caKpocZIahvHEeRRSlDXRZ/HeNzCsv8J/Sa9gdJ+Ha476eGh+/6iYIG4oGx8TkTbqn
         e3cPUxX4G3zXTUSEdGV2Jz3BW2fX+bCkVk3T+niWW36Y6+A2MycCPtnXRqHJqhc2qJit
         1ZEQYHAIHe7UwJsZnWwHyLy+SP3/+Hy6eYEp30XGCnyz6U/p3oihS1yIAAsCynkXZ/kK
         CSo34xqL+Q7bhidHbLZAxyNk0kz9s9lUDAt5JUt8e4MuGclVYT4M3wIDfouAf78A84oE
         r9WOzF5zTKrFVaVGVXURF+4Z60qnf97+nIpICYoJMq3mYCOYbn147H6ue2tWRp3YuqEp
         pDUw==
X-Gm-Message-State: AOAM533tuyg89ahTA54Rx2t7V0aM0YZVrizSFvCzkyzPdv2TT9RKGcj3
	QHv7RYMZvoa2NPlTPXOKhVEvfQ==
X-Google-Smtp-Source: ABdhPJz+AxY6cvCnr+KVQH2Fp0YqTlRGCWjKAGivEJ+IDIpSKKP8qF0SpXioLfe2cSrKIqJiBGLlfQ==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr844870wmi.20.1607032017749;
        Thu, 03 Dec 2020 13:46:57 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c4a7:c281:e12e:8d29])
        by smtp.gmail.com with ESMTPSA id o15sm884248wrp.74.2020.12.03.13.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:46:57 -0800 (PST)
Message-ID: <0e71119d79e63390fb66d1ab77ca692623c2724d.camel@linuxfoundation.org>
Subject: Re: [OE-Core][master][gatesgarth][PATCH] populate_sdk_ext: use CUSTOM_TEPLATECONF variable to enable custom templateconf.cfg
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chandana kalluri <ckalluri@xilinx.com>, 
	openembedded-core@lists.openembedded.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Date: Thu, 03 Dec 2020 21:46:56 +0000
In-Reply-To: <1606774047-25380-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1606774047-25380-1-git-send-email-chandana.kalluri@xilinx.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-30 at 14:07 -0800, Chandana kalluri wrote:
> The current implementation will always pick an existing templateconf.cfg if
> present else it will use the one from OE.  A user might not always want to pick
> an existing tempalteconf.cfg even if its present.  Introduce
> CUSTOM_TEMPLATECONF variable to provide an option for the user to specify if he
> wants to use an existing custom templateconf.cfg or not
> 
> If CUSTOM_TEMPLATECONF=='1' then enable custom templateconf.cfg. By default
> CUSTOM_TEMPLATECONF is set to '0'
> 
> Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> ---
>  meta/classes/populate_sdk_ext.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
> index 6f35b61..d1f61d5 100644
> --- a/meta/classes/populate_sdk_ext.bbclass
> +++ b/meta/classes/populate_sdk_ext.bbclass
> @@ -24,6 +24,7 @@ SDK_INCLUDE_NATIVESDK ?= "0"
>  SDK_INCLUDE_BUILDTOOLS ?= '1'
>  
>  SDK_RECRDEP_TASKS ?= ""
> +CUSTOM_TEMPLATECONF ?= "0"

Please use an SDK_ prefix for this since then its at least consistent
with the other variables we have here. Other than that its probably ok
although I'd prefer not to have a ton of these variables but have
configurations which "just work" for people. I think this is a sign
this code needs reworking somehow.

Cheers,

Richard


