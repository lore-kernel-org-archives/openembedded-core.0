Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.4564.1626936657304264136
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jul 2021 23:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UKmtlKuf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id f17so4697565wrt.6
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jul 2021 23:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=TxEhMVtoaOBK3Jk60JkJQdXJ7vqtbjkYFCraPUA3Cb8=;
        b=UKmtlKufooRh8DSQdYGeh2mFp7nMEdwjuSbFGw/Ij8I4W/POGjtCWVNpCdMbsrcZYY
         IxsEmICXwgRHW6u+g0FKPrWIQBQGv7j2bpHU90vUdUFUh5WjDyZSrrr0bXgCzB63og5v
         txN+TcPP89GzUM77tbHSYL+ibs+VIR5wKDazQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TxEhMVtoaOBK3Jk60JkJQdXJ7vqtbjkYFCraPUA3Cb8=;
        b=GHLqbdqyBbQRY1WKOZVqZCpps3NcTqs/D4ILPmW3gAmJk1ytgbhfOjZiQhrMeJuvP3
         tJiMzMTRNFuWXqbqWWW5cAG2bXLH+oCLJoL9+a7TYmNdrRO52JCYX3i6n+kGmRKYuuvc
         rCLioVSkcZWnZwUYAiQEQctExFK6hMO9D1JDxWK2Z6X6fVCxGyZkyYwzBJdwOSinG2Kz
         PalFhTr1AMUwPzOqIZPwcb+MudMtJ5Aa1ThEcVyEjLKif0naTAdDwP1tZPP7+YSV3ztw
         hWMtBEEqv6GFcUT7jLrOBDa+e25vUfGBgNSNWynI58KGC/fe8CU/2t38rH0ubGwR6tPv
         uq0Q==
X-Gm-Message-State: AOAM530gWE+GE+s4aN1vE5KK8ZaMDHFMWsnryVCl3tnRAdPO6cxwa81X
	h2c48g1dYVtkX5+5xe6MHCVi0A==
X-Google-Smtp-Source: ABdhPJwFM1JDL5dRoQXZdC8H4sqKbbKS+u1zcqESYGIV1a7wCE77hAulkMjXQO0kepUyl+I8D1PL5g==
X-Received: by 2002:adf:d235:: with SMTP id k21mr46909999wrh.222.1626936655610;
        Wed, 21 Jul 2021 23:50:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:40b3:3f27:e412:a801? ([2001:8b0:aba:5f3c:40b3:3f27:e412:a801])
        by smtp.gmail.com with ESMTPSA id t5sm29386187wrw.38.2021.07.21.23.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 23:50:55 -0700 (PDT)
Message-ID: <54d3039017ea1c3931551bb2ed22f23e14640b32.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] buildtools-tarball: add testsdk task
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 22 Jul 2021 07:50:54 +0100
In-Reply-To: <20210721135458.427938-1-ross.burton@arm.com>
References: <20210721135458.427938-1-ross.burton@arm.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-21 at 14:54 +0100, Ross Burton wrote:
> Add a testsdk task, which is essentially the same as testsdk.bbclass but
> the test case directory is changed.  This lets us exercise the
> buildtools tarballs at build time.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-core/meta/buildtools-tarball.bb | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
> index b5dae176bf..67a6d81ddd 100644
> --- a/meta/recipes-core/meta/buildtools-tarball.bb
> +++ b/meta/recipes-core/meta/buildtools-tarball.bb
> @@ -99,3 +99,14 @@ TOOLCHAIN_NEED_CONFIGSITE_CACHE = ""
>  
> 
>  # The recipe doesn't need any default deps
>  INHIBIT_DEFAULT_DEPS = "1"
> +
> +python do_testsdk() {
> +    import oeqa.sdk.testsdk
> +    testsdk = oeqa.sdk.testsdk.TestSDK()
> +    os.path.join(os.path.abspath(os.path.dirname(oeqa.sdk.testsdk.__file__)), "buildtools-cases")
> +    testsdk.context_executor_class.default_cases = "/home/ross/Yocto/poky/meta/lib/oeqa/sdk/buildtools-cases"

This looks like a good idea, I'm happy to see it but I think the line above may 
need a small tweak! :)

Cheers,

Richard

