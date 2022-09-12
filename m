Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EEEC6FA83
	for <webhook@archiver.kernel.org>; Mon, 12 Sep 2022 07:32:57 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.4857.1662967968841944984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dppFRy6j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id cc5so4061410wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=JkowUJ43lUDW/Tb8P5ouIDj2JYeqJY8d2a1EkowlKcY=;
        b=dppFRy6jBUKEmM5j7oWJEeRRffjKMa3BK8I2lIkfwSotPfniSjN1zWO7Hs6C+2I2FD
         U1JA1e+yHsB8jTlzTGczeLfncbTu/1U02/ZBHScw/3noN1GlxPVCdjRsT4cRK5hjaLX8
         KGf04YQ8uRea/SPIhbuDnY6aBolfuLL0NuGbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=JkowUJ43lUDW/Tb8P5ouIDj2JYeqJY8d2a1EkowlKcY=;
        b=3aq9Olb9znUtxLoRANH6iYT0/f+sEtDQfqZT3jIQwCywEGztkBkqgfD6DBg/L2hji1
         qgYyh51AkxKzON9pqWl6rdyy88BQtUV8vtsShe47ih4RV3Te/CwVJjqNkZRTirHNWzSz
         gsfmhJ2rFWAkELvJFb4VF8nat/13iZpnzeAX8X7xx63gcBOY4JoPyD/72bgkZjSpmy0t
         knRfCO7FZkozCErN4M6gTlWbe4vIrumffO4tCkjsYd8deKDpxrMRVjTP5SOA1jChuwp5
         Y2oW7dSuu+dFEpAy1RijfvCUYvqhAdfoeGWhG5ExGhofgSz31pwb1xI+QslccE7vOHSI
         Kj0A==
X-Gm-Message-State: ACgBeo1Li5sxxAQuQ19j5JTaWgKENbFHPDuZVQ4rNmv2edJrO6VTDHMD
	46kTdwXsyZfuw1xCXukueSlKYw==
X-Google-Smtp-Source: 
 AA6agR4G4chwmiDW+t1Eh3Ix9rL4ZpPPjVAua1SCDQWkqeM5Daaodtr1zuwKPI46rEeNhEKOfR11kg==
X-Received: by 2002:a5d:6609:0:b0:22a:3965:d5ad with SMTP id
 n9-20020a5d6609000000b0022a3965d5admr9128902wru.62.1662967967235;
        Mon, 12 Sep 2022 00:32:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e7a0:efc:484a:7ca5?
 ([2001:8b0:aba:5f3c:e7a0:efc:484a:7ca5])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0ac700b003a331c6bffdsm8972084wmr.47.2022.09.12.00.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 00:32:46 -0700 (PDT)
Message-ID: 
 <1af72bce2477a28ef6a75fe23d813e2aee3e4593.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] rust: Use libc++ runtime when using clang
 with llvm runtime
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2022 08:32:44 +0100
In-Reply-To: <20220911232844.680121-1-raj.khem@gmail.com>
References: <20220911232844.680121-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Sep 2022 07:32:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170524

On Sun, 2022-09-11 at 16:28 -0700, Khem Raj wrote:
> meta-clang has options when it comes to C++ runtime, default is to use
> gnu runtime, other options are llvm runtime and android runtime. This
> patch helps when a distro is using llvm runtime for C/C++ runtime. It
> informs the rust build system about right C++ runtime to configure for
> when such a setting is used.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebase now that 1.63 is in
> v3: Use renamed variable RUNTIME -> TC_CXX_RUNTIME
>=20
>  meta/recipes-devtools/rust/rust.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
> index a33eb00e25..4e78b5ea6f 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -110,6 +110,8 @@ python do_configure() {
>      # [llvm]
>      config.add_section("llvm")
>      config.set("llvm", "static-libstdcpp", e(False))
> +    if "llvm" in (d.getVar('TC_CXX_RUNTIME', True) or ""):
> +        config.set("llvm", "use-libcxx", e(True))
> =20
>      # [rust]
>      config.add_section("rust")

We can drop the True from the getVar as expansion is the default.

Cheers,

Richard


