Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.3134.1594408108504742755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 12:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MnIDhjHu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id z2so7005329wrp.2
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=co0CA6egoH7KNYP1cKrSlyqXtot8dOTeCoDw5S1wPck=;
        b=MnIDhjHuoaTA/ua5/XmpZrShZEsyP+PICUPbCKWqlXLUv4YTTHqZbYGdlX7LZB/ByW
         GcVcjcMePg/db45It7T9Ul15bYQOMVQMag8+XUdaa6DdD8xQukQMWapcGKBY0hhkcGjl
         B+e1ImEynbpwyuH52lnjxFqWE2B1g8AneBiBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=co0CA6egoH7KNYP1cKrSlyqXtot8dOTeCoDw5S1wPck=;
        b=WOq2oC1Mn+sH3Yk8Du0ZAy0xhZijnVSmOsCopBdBQnJgowKVpa/HSjsmS+rJ86wUaD
         7BNuT/4oYyn+hLTTRDe/C7v1Z9uDmAW144LbS9z87tssyPjpdEWXbhAXIuN2tP/MjZ1x
         DQ8Y8CIR6G2W/sVtB6CHktG1jPZaTJZVkMB51WMZuxBIknhTUWzabsH/CLYtyUI2p/RY
         DQbHTpCduEr5sGbveux4P0Ujhj77bzq6ymCGE2WFN9+6JzDNlmqfeAhjzK/36KFkZO5c
         iz6aNsAzRcbA0Y9h2ELjb3zmWxGnnv0u5jnOrNjplvu8FJaB5XffjE6czZwEL+NrqUKb
         sPaw==
X-Gm-Message-State: AOAM532ojsQ7MA2nBgqUS46YwwPtbUSsqbtRgk9cpOYwT6nX8qzIdKFU
	iy5iCnH/QpVf7H8f9ocSu8cA5A==
X-Google-Smtp-Source: ABdhPJwDGBUXhvDH9YYEfywTSCrh2HoidTZq6pdvdBLhXL25fNslIJvD+MJXq7EhDrOiXqtIQ5UVaw==
X-Received: by 2002:a5d:6748:: with SMTP id l8mr76807836wrw.347.1594408107072;
        Fri, 10 Jul 2020 12:08:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id g3sm13048863wrb.59.2020.07.10.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 12:08:26 -0700 (PDT)
Message-ID: <b21eb07708fa1c6dc6d7159bbbc7e3cab7ea1a6a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] distutils: put tests to ptest package
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 10 Jul 2020 20:08:25 +0100
In-Reply-To: <AM7PR05MB6881765BB66D07D02E10727EA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
References: 
	<AM7PR05MB6881765BB66D07D02E10727EA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-08 at 20:44 +0200, Konrad Weihmann wrote:
> Put files from installed tests into a ptest package to avoid having
> them in an image and to avoid having more runtime dependencies
> than necessary.
> 
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/classes/distutils-common-base.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
> index 94b5fd426d..e3b36574aa 100644
> --- a/meta/classes/distutils-common-base.bbclass
> +++ b/meta/classes/distutils-common-base.bbclass
> @@ -13,8 +13,13 @@ export CCSHARED  = "-fPIC -DPIC"
>  # the python executable
>  export LINKFORSHARED = "{SECURITY_CFLAGS} -Xlinker -export-dynamic"
>  
> +PACKAGES =+ "${@oe.utils.ifelse(bb.data.inherits_class('image', d), '', '${PN}-ptest')}"

We can't do that as for recipes which inherit ptest, we see duplicates
in PACKAGES:

https://errors.yoctoproject.org/Errors/Build/105653/?limit=150

(recipes from meta-oe failing with this change).

Cheers,

Richard

