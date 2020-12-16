Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.11416.1608138022081096973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 09:00:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I3+KtBtF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id x22so3031432wmc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 09:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=R2aoUw0eGemHcZF2bbPiQWWkpG51zEkb9KeWIRiFqf8=;
        b=I3+KtBtFtCM5MmMQF2pNQuuA0MIIjb0XZPKSyMOYXPEyVLhPQaHeFwa5n7ZwCtGvi9
         l8wd+GifvyqG7Ca7b9BaTkfijk5sBxxuJ5dZFjnMzNPHxlGAxHOtsO4cFUP8d+yp2YDD
         Tns3hIDf4jNyVFeGGhLBkDFNKAikuGJtLemg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R2aoUw0eGemHcZF2bbPiQWWkpG51zEkb9KeWIRiFqf8=;
        b=VepMX0kuQ0d62bp5YuVsOg+Gj2UwyCjbFt34kTEMAM4aCaOZAwi/qTyGaqyl7nSl/L
         +Qf2nm82M8AwP9IVol1MHaMOSqE31NuXQk9fInakdHn6m2E0LlsvnzsB8lOI1XJwJKol
         mfouNUlM7vkfUXwBweY2PiY34dfD7PnzdWw/E5WUP9LWR6d09yN4kUC9As70TI23iLNK
         3CdSecEvxYTGkWBGpmFFrWp9gerWJPylkCkN+Q5+sLy2A2hJ/XxdN5H1dX7SnUUUxXxe
         Qd0auM0FRJVryn1svXCk+juSOOOjAWlQcrSSSWfbqJJwcFR2DYkxw6sSakl0nhhBXWVE
         RDAw==
X-Gm-Message-State: AOAM532Eh5TCJQTBtx8XwG91EyFBxXe4SQMM3gsQJuHIE8ysSdj5Z0S6
	9bwyYIza+8GOEfx1ii7XInNBOw==
X-Google-Smtp-Source: ABdhPJyugNswaD+sKsVPCz6qD75RRcScvD4slPxNkq9vTndi+4XigrioavvmfiHhvGiucSpt4/IK+g==
X-Received: by 2002:a1c:6746:: with SMTP id b67mr4284359wmc.8.1608138020583;
        Wed, 16 Dec 2020 09:00:20 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id w21sm3475175wmi.45.2020.12.16.09.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 09:00:20 -0800 (PST)
Message-ID: <497c9433b74b13fc96510739deb4b41d2ea2fd5e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v3] iproute2: split ip to individual package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2020 17:00:17 +0000
In-Reply-To: <20201216164510.9823-1-okaya@kernel.org>
References: <20201216164510.9823-1-okaya@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-16 at 16:45 +0000, Sinan Kaya wrote:
> Move the ip tool into its own package. Useful for size constrained
> systems that only want the ip tool.
> 
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  .../iproute2/iproute2.inc                     | 47 ++++++++++++++++++-
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 403d264308c..c7a3d547dae 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -46,32 +46,75 @@ do_install () {
>  # The .so files in iproute2-tc are modules, not traditional libraries
>  INSANE_SKIP_${PN}-tc = "dev-so"
>  
> -PACKAGES =+ "\
> +IPROUTE2_PACKAGES =+ "\
> +    ${PN}-bridge \
>      ${PN}-devlink \
>      ${PN}-genl \
> +    ${PN}-ifcfg \
>      ${PN}-ifstat \
> +    ${PN}-ip \
> +    ${PN}-lib \
>      ${PN}-lnstat \
>      ${PN}-nstat \
> +    ${PN}-rdma \
> +    ${PN}-routef \
> +    ${PN}-routel \
> +    ${PN}-rtmon \
> +    ${PN}-rtpr \
>      ${PN}-rtacct \
>      ${PN}-ss \
>      ${PN}-tc \
>      ${PN}-tipc \
>  "

I accept there is a case for splitting out ip, the patch now splits out
every binary though? That isn't what the commit message says...

Cheers,

Richard



