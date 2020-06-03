Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.9428.1591173873801077391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 01:44:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eGd5R/JA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id g10so1046702wmh.4
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=QHlQQgA2+jv3UwOBtPNzC9b1B1/UiCCztKxbWw8Sgrk=;
        b=eGd5R/JAKFUZPfUDTeBQj5lSETTTry/aX2VUUtGnrsfua98f+PqdcizGuIMcD7acMK
         tEuYBmb6uFJeA2hTQ8OmJsJPunYUlfsJfd9ohQRZxD6pnzTougQmpM7oa+2OJKCX030P
         qgb8MTU2sZCHt3xQOviGVmz3RvAbNO8MI++Qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QHlQQgA2+jv3UwOBtPNzC9b1B1/UiCCztKxbWw8Sgrk=;
        b=DM1fxnQoQjaTBHPJf3P0S4IoWNtvxC5sYc4SMZMkhjl4nwDw+CTLiKvbq1D78LRouP
         Gk3OUUNj5jYy5ZFiWqzhpa5WKZOcRlZRJUK1yNfztjhDZ82ScWhPNbWICNZb5TnzI223
         crK0VJSjahtsZuRzAMvIiMDGl5fNwkiUevChWP0UkQFoNcy2zpp9PUYo0omX7NeNRoGI
         vc8/2YhzxiOYZsGfwo4e7ZjmCfQB1z5kK2yJMqFrjyCsp/S444gt4QG568kIcvEuOh8h
         Uq7Yit/sGf6AjvxjKqWBJ1u2ZMPf27lZWN8UgV45bY1TTorrbev//sDTJrFAd8OkkyeO
         QcIQ==
X-Gm-Message-State: AOAM530y5MJpF6yNj3/0DRaoM79sgS9XNpqpsgavt4OplJ8h+QrI4JEb
	QeZVfgASBQjbjsB6ZBZ0HrObGyrChPL53g==
X-Google-Smtp-Source: ABdhPJxwzN8uIvKQxKG1hwW1KMzPXAXbM02i0jBJ5i42wyxa3qis3808tk0Gsq5+3755Ow+dw6kprA==
X-Received: by 2002:a1c:230f:: with SMTP id j15mr8128094wmj.100.1591173872368;
        Wed, 03 Jun 2020 01:44:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g18sm1885892wme.17.2020.06.03.01.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 01:44:31 -0700 (PDT)
Message-ID: <7deef78bc70f79f48cc8d9da5c0e18bcb305cfbb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ruby: properly append PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jun 2020 09:44:30 +0100
In-Reply-To: <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
	 <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 22:44 +0200, Konrad Weihmann wrote:
> As ??= assignment will be overwritten by += in any case,
> one can't define a default of PACKAGECONFIG in this recipe.
> Using _append instead mitigates chances of accidental overwriting
> the default
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-devtools/ruby/ruby_2.7.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-
> devtools/ruby/ruby_2.7.1.bb
> index 3dd9fb0a62..3d7d095fbf 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
> @@ -12,7 +12,7 @@ SRC_URI[md5sum] =
> "debb9c325bf65021214451660f46e909"
>  SRC_URI[sha256sum] =
> "d418483bdd0000576c1370571121a6eb24582116db0b7bb2005e90e250eae418"
>  
>  PACKAGECONFIG ??= ""
> -PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
> +PACKAGECONFIG_append = " ${@bb.utils.filter('DISTRO_FEATURES',
> 'ipv6', d)}"

Shouldn't this just be:

PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

?

Cheers,

Richard


