Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.11111.1632142143071535493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 05:49:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A1O73Oq6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q26so29333298wrc.7
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 05:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=6nmb/KyVq4JJ3lJsuu/SUZPyOwEstDIMAwpil9CZpKc=;
        b=A1O73Oq6FrfGGuHhlzi1wyAlrR7lYLI9D2nSPiHX2GC9VnlDjxs3EQRwRXSy69Rcsp
         0Vx47nDTswKLnWWwwOLA1vfvL1GhTOaqMeVwbQeT/AvYOLPsLONFKDu8wM2cv/CXd5rt
         +GBa9eikrUwrjhPxiMFAOGjPMwQWmz1AH/ako=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=6nmb/KyVq4JJ3lJsuu/SUZPyOwEstDIMAwpil9CZpKc=;
        b=HDoNs91IK2PP5unCc0uobmGyX1YBW2e58Si2vdZu7R/uX10rfWdICGs/umaSsmnzze
         7yaukL0W4fGxvqrSPUIeZJHMc7wJ+dH+MrOX1piCeJpsZq/CZAEs3Qc4OCIvWItKoG3/
         tenE6t0Ts1LyvLRiNplGfCIOmEe6E77/ozq02tGmYVQbCpnfYSJZPHzxcyyMy6FYF/h5
         XGP1joHEtD9QtvTu1pQ74wlsi3jrbN5/aCjP/qww8ZlobTEL2NdmABJmZ0aN55BeBds0
         /LEErEZgZSZAOJh1XZ7mtOAGghi9IGwm38kcBdwgT2OyYY7Wr/jTB0cvCwI9EbMcdQVB
         6YTQ==
X-Gm-Message-State: AOAM530au+e2wWbcoV0eAOerAJj5KDfDqVgRaZVX/UBcO813bdjbQhPZ
	q/dTVgMhX0yHbdXLrbDIGlmBt019Xdo82S3H
X-Google-Smtp-Source: ABdhPJyVqVQ/d2nqA08J92dUDI37x5/JiENmqzsvCwrazKn0qAFJrFPMo5FHbDvKvEh5T002sid39w==
X-Received: by 2002:a05:600c:26d4:: with SMTP id 20mr28953191wmv.40.1632142141397;
        Mon, 20 Sep 2021 05:49:01 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7173:466e:b128:3e8b? ([2001:8b0:aba:5f3c:7173:466e:b128:3e8b])
        by smtp.gmail.com with ESMTPSA id e2sm16044014wra.40.2021.09.20.05.49.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 05:49:01 -0700 (PDT)
Message-ID: <e22062ab2915a57b1bff1217c911a97c3c647e30.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 14/14] layer.conf: Extend recipes not to install without explict dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Sep 2021 13:48:57 +0100
In-Reply-To: <16A68880435BB472.28512@lists.openembedded.org>
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
	 <16A68880435BB472.28512@lists.openembedded.org>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via lists.openembedded.org
wrote:
> There are several dependencies which recipes have which are not needed
> at runtime, only at build time. Extend the list of these from bison to
> include quilt, patch, meson, autoconf, automake and ninja which should
> reduce the amount of data being included in native sysroots.
> 
> This speeds up and reduces the sstate needed for image builds for example.
> 
> If this change breaks recipes, it probably means they're missing an explicit
> DEPENDS on something in this list which is a bug in the recipe.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/layer.conf | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 307ad7e2237..b3cc8a249e9 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -48,6 +48,7 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>  "
>  
>  SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
> +  *->patch-native \
>    *->quilt-native \
>    *->subversion-native \
>    *->git-native \
> @@ -90,7 +91,16 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>  # (e.g. X -> Y -> binutils-cross -> bison-native) no longer meet the
>  # dependency incidentally. This improves determinism and avoids build
>  # failures when people switch to external toolchains.
> -SSTATE_EXCLUDEDEPS_SYSROOT += ".*->bison-native"
> +SSTATE_EXCLUDEDEPS_SYSROOT += "\
> +    .*->autoconf-native \
> +    .*->automake-native \
> +    .*->bison-native \
> +    .*->meson-native \
> +    .*->ninja-native \
> +    .*->patch-native \
> +    .*->pkgconfig-native \
> +    .*->quilt-native \
> +"

I've marked this one as an RFC since it caused a fair bit of pain even in OE-
core due to recipes having pkgconfig class inherits missing.

We do really want to do this and correctly mark up the recipe dependencies, the
question is whether it is too late for 3.4 or not. We could go for a smaller
list for now too but I wanted to hear opinions.

Cheers,

Richard

