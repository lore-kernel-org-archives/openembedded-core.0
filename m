Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.6215.1608119451921788158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Dec 2020 03:50:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Isk0N+mn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id r7so22905239wrc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Dec 2020 03:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mPLLKNXJAG8/Z9vUzpaIxCtYoPcdgfTjEKanII9JkjI=;
        b=Isk0N+mnxWqBZkUM43RRTl7O+p/qzjPK7/XEFh/2BYe20WRHoTqr5M1SUSnDCH3io9
         1AMgV/75nZmbNJeweJglVpfWObm1nns7hM8ixQv/hEbL5w/fdEZ8zxfQQgrfjtfWEwHe
         qzf9j95ZJCXWLRG8m+lagTMn1HY4qvtKoQdo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mPLLKNXJAG8/Z9vUzpaIxCtYoPcdgfTjEKanII9JkjI=;
        b=AUJ/hCj4DCvYXgtsZc8NurzKBgdZixDVirl6NVnmItGRoo6Bz5wxoStABZONobnQm/
         G4ZNC+HFRoEyCrCd77TTuGIVnLPWNVoFF3PH7Wq1nbApMJhJnc/qob+elXpOOq/sTOzu
         dTAA2x8N33pmyR9D1Texs7/IzDPNWzDrRhI9xxl9IX2wWNFskWmpj+IY6LSg+tcfMmMX
         pH5fqFoWRqLpWlAIH0jbsESpwlgwdL7fTwAarzIp2KL77rJpoKjM8ySPkwqgd6gp/Pdk
         hUfrxUB1W1SeO5qai8noKuuKKl1HVwna79Sv4Ez5kAgImE53mt0oqCK3L6bXf35zH7+L
         vPPw==
X-Gm-Message-State: AOAM530RkrBFykHIBaKzLN5nSa+OUHbja/E1NojhUcrC/HwWblZkFg/U
	/XQPkbIelD15ZsXhQWSyl2o8sw==
X-Google-Smtp-Source: ABdhPJxJ1a+NsKJCYvojc04txeA84z1BvlTBJIGs7yt26sCXccQNlNUvR+1P9xzv7nvOfe0zvnxQ7A==
X-Received: by 2002:a5d:4bc5:: with SMTP id l5mr20240971wrt.15.1608119450045;
        Wed, 16 Dec 2020 03:50:50 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id 125sm2290660wmc.27.2020.12.16.03.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 03:50:49 -0800 (PST)
Message-ID: <fdfd532cceb2c81874e4a0ac6a9a27014a14808a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [meta-oe][PATCH v2] iproute2: split ip to individual package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sinan Kaya <okaya@kernel.org>, openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2020 11:50:46 +0000
In-Reply-To: <20201216024141.22439-1-okaya@kernel.org>
References: <20201216024141.22439-1-okaya@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-16 at 02:41 +0000, Sinan Kaya wrote:
> Move the ip tool into its own package. Useful for size constrained
> systems that only want the ip tool.
> 
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  meta/recipes-connectivity/iproute2/iproute2.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> b/meta/recipes-connectivity/iproute2/iproute2.inc
> index 403d264308c..f4d882d3ece 100644
> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> @@ -46,10 +46,11 @@ do_install () {
>  # The .so files in iproute2-tc are modules, not traditional
> libraries
>  INSANE_SKIP_${PN}-tc = "dev-so"
>  
> -PACKAGES =+ "\
> +IPROUTE2_PACKAGES =+ "\
>      ${PN}-devlink \
>      ${PN}-genl \
>      ${PN}-ifstat \
> +    ${PN}-ip \
>      ${PN}-lnstat \
>      ${PN}-nstat \
>      ${PN}-rtacct \
> @@ -58,12 +59,17 @@ PACKAGES =+ "\
>      ${PN}-tipc \
>  "
>
> +PACKAGES += "${IPROUTE2_PACKAGES}"
> +PROVIDES += "${IPROUTE2_PACKAGES}"

This doesn't look correct. Why do we need to add all the individual
package splits to PROVIDES?

I'm going to guess this is because you want to do:

DEPENDS = "iproute2-ip"

somewhere? If so, that is not how DEPENDS is meant to work, even after
this split you'd use:

DEPENDS = "iproute2"

If you want iproute2-ip specifically, you'd use the package namespace,
e.g. 

RDEPENDS = "iproute2-ip".

or is there some other reason for this? This is basically the issue
with some of the other package splits too, its not using the build time
verses runtime namespaces correctly.

Cheers,

Richard

