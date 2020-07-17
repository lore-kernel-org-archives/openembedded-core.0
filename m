Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.5995.1594966475546432724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 23:14:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Otamcam4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id j4so9728678wrp.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 23:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Jy4A4ljjKptRZplez5DvZ+Jfa/1hjb1FWlQloIQkY2c=;
        b=Otamcam4MTTCCTttV92GYn+DEbzgjVZR/yAy07Nr0f+ePfolkwnQCsZzi0mWlZyrfP
         gnB4mHFsIxVOidm06ymqaoHoZvovGFzyGUprWhHBpDoMcazaC6u3dTT0rrhn3Cdg01Bo
         +xYdoWziHosxJz6JUD+babmDplTwGsLT/Ne2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Jy4A4ljjKptRZplez5DvZ+Jfa/1hjb1FWlQloIQkY2c=;
        b=lLg22snpYeYk3rvD7c5oFI2CFDKwWTsnzMBK7LgihmQqNbnvEuBnX+sve/FcQFUn33
         aM8RAY/p7Whv1yt3BsDoA6plbTSLu2Cx4MqUbMv5YnJslZ6g7t6/3bplOibeVf/mS1I7
         z5XkQD4PExUZjkIZ395KtxoBTAjLM3tJZdf74W5SX2kMtwZg5dm9YeFn5f0JJ1OOOskM
         jElKiEUu4qZQvf00pcf+zxAsC6ygvxKiGYqhejKVncmUg23iPr9xZJVpX8OCSF53h6wh
         IY1dG2bVDuw5KkyWmniEAo/uI1F54jo/E6CMz16fbGDjfoVadk51Y10AUK1ZH2irJ+Sa
         ll3Q==
X-Gm-Message-State: AOAM530kUpcaJ4xmuJ1+iHejb66FtTCVxbybCtSxPU3PyRULlLlMyEyr
	YXJpIjlj3icjpBdEEMvoB4fppQ==
X-Google-Smtp-Source: ABdhPJwwUAQFSfKnnG6J+kq3/qE19T1p8IULAo6SIO0Vr2Ao8TiORQ8IKCAbhUvWRGZr3/OxDhLPNA==
X-Received: by 2002:adf:d842:: with SMTP id k2mr8868928wrl.239.1594966473889;
        Thu, 16 Jul 2020 23:14:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id h23sm11619882wmb.3.2020.07.16.23.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 23:14:33 -0700 (PDT)
Message-ID: <b9cce6cf64c1afa1f389262858bc5b0dab04d6f3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] help2man: rewrite recipe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2020 07:14:29 +0100
In-Reply-To: <20200716115546.3724268-2-ross@burtonini.com>
References: <20200716115546.3724268-1-ross@burtonini.com>
	 <20200716115546.3724268-2-ross@burtonini.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-16 at 12:55 +0100, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Instead of being explicitly native, use BBCLASSEXTEND.
> 
> No need to explicitly depend on autoconf-native automake-native,
> because
> the autotools class does that.
> 
> Don't explicitly disable NLS, but use the gettext class.
> 
> As this recipe isn't needed in early build anymore there's no need to
> avoid reconfiguring.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...2man-native_1.47.15.bb => help2man_1.47.15.bb} | 15 ++++++-------
> --
>  1 file changed, 6 insertions(+), 9 deletions(-)
>  rename meta/recipes-devtools/help2man/{help2man-native_1.47.15.bb =>
> help2man_1.47.15.bb} (66%)

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2185

configure: error: perl module Locale::gettext required

(from no-x11 world build)

Cheers,

Richard

