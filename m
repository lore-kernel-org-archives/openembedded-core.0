Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.9963.1608298573682439709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 05:36:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C0Wnzhjp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id t30so2212037wrb.0
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Dec 2020 05:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ah+jTf13MFE4OmUa+45COfr5Z+4jw7LTebDPFR2sS1E=;
        b=C0Wnzhjpl5bFuGs2DfdXgg4AQrrfOoELZUu7IBOG99q9a5l1DG0OuC2RSw6u3BZLQW
         bclzwjmaGaR7zJnkFFQjTvcIpS1rxpOAXLZ+kAQEIx2e0ihouulOYJ1Wi1PDDehDXdSU
         k2MsWzCAWM9yL62HWmvttQ/kxY7DK3IFTynYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ah+jTf13MFE4OmUa+45COfr5Z+4jw7LTebDPFR2sS1E=;
        b=H8Vo+TYaZ5o47+fLdT0jsBLm3SHbJJC5Z2WRXlT2m99dayHckKUOXf7RjWzidTjZ8d
         /1lcUwpIPqMd2uDxV1PkZ+4ZNQKY6LPGh+l3eFpqtXk7cnwrh5vMjjQGF/l9sPJpEOxW
         +jP7W/952SpvElf+19mGSJ+Pg+cT4Xchuamledyx+7VL9aMCWWKnSDcCZfv6Fw7eZUSY
         CBY+71J76Tc8MeUkU2H1pouaevrwVGGSChhovnaRLLrImLoEStR0jNY4QgU912dYCl4U
         6n740kNmc5QcEs5946zf7xUXYDkg1l5Y1hhbMA19HXZJC65lKBgq4XhL9jPJs3KdKMsP
         Qu6A==
X-Gm-Message-State: AOAM531VGvNs5z2hYrlCm/AGXbNIqpEfRHBTQPuDqH9Tl2DL5VlTYdJz
	iPxTrFZPifNXrV3UGm2p4pCT/w==
X-Google-Smtp-Source: ABdhPJzfS1FZ80rzNTglsMqmqIzqchJwrma6MlLQ6FucwxZjoIJH/+8zZ+wMj8bf+6eIUkyHMuExCw==
X-Received: by 2002:a05:6000:10c4:: with SMTP id b4mr4679388wrx.170.1608298572087;
        Fri, 18 Dec 2020 05:36:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id n9sm13457385wrq.41.2020.12.18.05.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 05:36:11 -0800 (PST)
Message-ID: <befdc92a15ad20dc490201f6f87a56e79fe5714e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] ltp: fix rpc build error
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Kory Maincent <kory.maincent@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Date: Fri, 18 Dec 2020 13:36:10 +0000
In-Reply-To: <20201217140756.30688-1-kory.maincent@bootlin.com>
References: <20201217140756.30688-1-kory.maincent@bootlin.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-17 at 15:07 +0100, Kory Maincent wrote:
> Add support to tirpc tests build.
> Export incdir and libdir to have the right path.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
> 
> Change since v1:
>  - Use PACKAGECONFIG to enable rpc tests
>  - Improve ${libdir} and ${incdir} export
> 
> 
>  meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb
> b/meta/recipes-extended/ltp/ltp_20200930.bb
> index 7acf15b360..9da5d90353 100644
> --- a/meta/recipes-extended/ltp/ltp_20200930.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200930.bb
> @@ -42,14 +42,14 @@ inherit autotools-brokensep pkgconfig
>  
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  
> +export libdir := "${exec_prefix}/${baselib}"
> +export incdir := "${exec_prefix}/include"

In general we try and avoid :=, is there a reason its needed here
rather than just "=" ? If so, it might be something that should be
mentioned in the commit message?

Cheers,
Richard

