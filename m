Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41B3C6FA82
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 21:41:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.17897.1662327699139061995
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 14:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XiNd7TgZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id bz13so5615235wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 14:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=r7LZ234JJAWw/5crds6cCm7AinuWp+a4BY33HhTwp0g=;
        b=XiNd7TgZGoScEvoDvzw1BK6krjCUIhiU6rPxmJLIkQ4Yl4lAPPkstyuiR3k6jrfpN5
         5GzV3TE/0ygyGkMM2zAx8AbGy8M/9iSZSSb7mGQgZHBpRBZnaNuJWQhk1ZOHPWo4VUmJ
         /sXaHXbfb+T2yRJyUrjfW0bt+hYL3HWdud13Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=r7LZ234JJAWw/5crds6cCm7AinuWp+a4BY33HhTwp0g=;
        b=cuT0Ke2KUkoJ5SAofyZkf3B5EdfMlsTMbiz1PeAZEwKj9YlM79ixd/hGg85J0HTSmn
         P+0mA4XifQxoTPs0P1cCht+k41/sYCnaGJ3WqVqq09rP45sfcdPuHpj0676AaGVWjKLn
         4rewtFC55iM4GV8RuI3RO4KmEqlhOQEYDMHB0AE4gvJooy568LLN4EyO9zvY+TBoEflV
         s1huKAVbJm6/xYjmaso2wPfBVnFljGDyh+cNkz66EBoScl3VZ8v5S98oQi36ERsCvbGH
         GX2nbm94vY1JVefUAst+OPu6Ty74utqeh/VEbiG1Bm/3BAFTcZKvUQj3JcPxEsDkPkfw
         6GEw==
X-Gm-Message-State: ACgBeo2morj2GZdrw5XlDnFnmCuntu+9AcIogiTfKhADVxxpAGbVaGHr
	NCnCtBjhSVR/GIniZ73UsM8SUQ==
X-Google-Smtp-Source: 
 AA6agR4+pDyGeeU7AyGOgJtWVttOgVixnKZjWr7miE4K2uU4L3q/FLXv855/raN9/qQqHLkx5qTdFQ==
X-Received: by 2002:a5d:47aa:0:b0:226:dbf6:680c with SMTP id
 10-20020a5d47aa000000b00226dbf6680cmr18858465wrb.581.1662327697362;
        Sun, 04 Sep 2022 14:41:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:df52:563:aee3:2030?
 ([2001:8b0:aba:5f3c:df52:563:aee3:2030])
        by smtp.gmail.com with ESMTPSA id
 i4-20020a05600c354400b003a2f6367049sm9344332wmq.48.2022.09.04.14.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 14:41:36 -0700 (PDT)
Message-ID: 
 <18246fa7e54cb51ecc6e1db0db7ac03bf276d5d3.camel@linuxfoundation.org>
Subject: Re: [PATCH] rust: Fix cross compilation error for rust-testuite
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pgowda.cve@gmail.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, vinay.m.engg@gmail.com
Date: Sun, 04 Sep 2022 22:41:35 +0100
In-Reply-To: <20220904070859.2706350-1-pgowda.cve@gmail.com>
References: <20220904070859.2706350-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 21:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170296

On Sun, 2022-09-04 at 12:38 +0530, pgowda.cve@gmail.com wrote:
> From: pgowda <pgowda.cve@gmail.com>
>=20
> Fixes the following error while building the rust-testuite
> error: linker cc not found
>=20
> Signed-off-by: pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
> index 284347dedc..a3d93eca4a 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -116,6 +116,9 @@ python do_configure() {
>      # Whether or not to optimize the compiler and standard library
>      config.set("rust", "optimize", e(True))
> =20
> +    # Override default linker cc.
> +    config.set("rust", "default-linker", e(d.expand("${RUST_BUILD_CCLD}"=
)))
> +
>      # [build]
>      config.add_section("build")
>      config.set("build", "submodules", e(False))

I suspect this is resulting in:

WARNING: rust-1.63.0-r0 do_package_qa: QA Issue: File /usr/lib/librustc_dri=
ver-f2e4e0d5a644441f.so in package rust contains reference to TMPDIR [build=
paths]

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/5731
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5809

and more. Certainly one of the patches is causing this :(

Cheers,

Richard

