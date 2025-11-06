Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C7BCCFA13
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 20:49:51 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8070.1762462181873544835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 12:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ZQ7Zy2Ej;
 spf=pass (domain: smile.fr, ip: 209.85.208.182, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3737d0920e6so671501fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 12:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762462179; x=1763066979; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2bGtve1WxwOVF+FZV2V8vXfx8NEXSnpEJBsbqfEJSj0=;
        b=ZQ7Zy2Ejk0KOsxzxZ0auamsuhxuTj/wCXwMTuFL+UERApXMffw4/K965RkgkdVHOgU
         MI/xMLu3UfUNaqBnD2k9S4gRFRRr2nOMTUzhd5bl9ENKLKZEt7YbJySJX/2CikiS8adE
         eFjROvRB3sMdPSGS3bI77cUycb7uyqGI6Z7A8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462179; x=1763066979;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bGtve1WxwOVF+FZV2V8vXfx8NEXSnpEJBsbqfEJSj0=;
        b=S/AUe/lRSszpXYGv8hYfdrSVqBZa5BGSNz/QqS8b0oEmTqKEYsVOCqnwLhu/pIw4qn
         uqmVC0vKeSnS3y3jq/dsolyvsDGuevm0MUXW7X/6vtrzJUCFOMrzRfRCvSyN8Qzxo5qk
         y5voGRvc82KXruhssHu6j9hZqC00lai3DPZvV5YcmCtlZIzvBq5UQW0WZZ6hY+IGtseu
         S68s54036fV8SGrFAyxl2YILcG/3YvJvD3h+SJwfh466MLmn5BdW95QqPZOcxQFBpTLm
         MqPF4mhrPE45aB4QAOzOmdGiGF6BowzzKuD02GnYxtvXPd+ods5sBsEg3kckqFJLhHeN
         hEsA==
X-Forwarded-Encrypted: i=1; AJvYcCWQBb5DbH7G6HoTz3Fjqv0IceHzbjefX1FmU7ya2SLoi39lcmTfklgy3udQq/a3IS+4wT4cJYQ1JHKHzy/Go/6ykA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzloFOv/AjeGvqJztmoDqH2pFdNJaTge6G1Rqe48POZGFCoHlbN
	F9lJbZxaF8Cco3IKZJlURwK5W2WkOwO4YaE5dMgG+7MLFyvP/78S6HdMlT6HDfLAilw=
X-Gm-Gg: ASbGnctnouX1sdVdriHcIceYK/x4++TXqtefj9YqaO4iI5Qq/088U0wNTgpo4gYyzve
	QyxbNs24FmPyxqwCiUN1t4E8gbUGeUAa956kr4UgWdYNQTTVhAbHnd/R4uhkKgV4gy19x5HofN/
	IlootdSmYZSnfOvgoETBD/gG5shSGtP2TT/+iKYAN5t6l8qumUBbnpUAZE0lk6KQ3wN/LGBeTyj
	CpqTTY6a1IFENTdU2fdhAaLOiXoD8As3F11XRVMr/fNjhFiSekx1QMRHQeym9nB21FG8yjypAYI
	bbJupVEChkMYxdo1/MisPx9fnxynuXVZSI6qG3vLCD1aokBqLzwrRmDWgbjoLj1aeiJdOiN29y+
	mMxkeiBYrgtAIJOjMZC6tD8RpzOH/gdcODussdXEsE3bNK7G467bBXaMBGQe6+gXnp3wv8ZHEd3
	yjCfM07gJ8HY3D872SuJFsVjUSl5+PDsNcZjqZ/riZOoOejax181kvnXQQXVgwBjb44k0arS+kd
	f8CPhFA/BBaNOgOCZ8zRUKYp/yqxdjNgUh0lfTpCl9L+HGYDWLhrQ==
X-Google-Smtp-Source: AGHT+IHM6VbxjJSs6JtVijcWy4Iahi0Yz5Ia5xv9ZLv1RH8Zw7k520ko11aMsH7uihpRXuksGAqQCg==
X-Received: by 2002:a05:6512:3a86:b0:594:2c1f:75cf with SMTP id 2adb3069b0e04-59456cadbffmr169903e87.57.1762462179389;
        Thu, 06 Nov 2025 12:49:39 -0800 (PST)
Received: from ?IPV6:2a01:cb00:1331:aa00:328f:d57b:7553:b0cf? (2a01cb001331aa00328fd57b7553b0cf.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:328f:d57b:7553:b0cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a594e2fsm951479e87.99.2025.11.06.12.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:49:39 -0800 (PST)
Message-ID: <87c75249-d612-48fb-a4c8-0e4100a8e564@smile.fr>
Date: Thu, 6 Nov 2025 21:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC v2 3/8] rust: install Rust library sources
 for 'make rustavailable' support
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com,
 sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com>
 <20251105130942.833204-4-Harish.Sadineni@windriver.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20251105130942.833204-4-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 20:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226002



Le 05/11/2025 à 14:09, Sadineni, Harish via lists.openembedded.org a écrit :
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
> 
> The `make rustavailable` process expects the Rust standard library source files (e.g., `lib.rs`)
> to be present in the `library/` directory under `rustlib/src/rust/`.
> 
> This patch ensures the required sources are available by:
> - Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
>   during the snapshot setup.
> - Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
>   `nativesdk` class, making them available in the SDK.
> 
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-devtools/rust/rust_1.90.0.bb | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
> index e7f3985332..857d679e2b 100644
> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
> @@ -54,6 +54,11 @@ do_rust_setup_snapshot () {
>      # and fail without it there.
>      mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}
>      ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${RUST_BUILD_SYS}/stage0
> +    
> +    if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
> +         mkdir -p ${TMPDIR}/work-shared/rust
> +         cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
> +    fi
>  
>      # Need to use uninative's loader if enabled/present since the library paths
>      # are used internally by rust and result in symbol mismatches if we don't
> @@ -318,6 +323,13 @@ rust_do_install:class-nativesdk() {
>  
>  FILES:${PN} += "${base_prefix}/environment-setup.d"
>  
> +do_install:append:class-nativesdk () {
> +    if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
> +        mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
> +        cp -r --no-preserve=ownership  ${RUSTSRC}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
> +    fi

Why not just adding this code to the "rust_do_install:class-nativesdk()"
function defined just above?

> +}
> +
>  EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
>  rust_do_install:class-target() {
>      export PSEUDO_UNLOAD=1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225761): https://lists.openembedded.org/g/openembedded-core/message/225761
> Mute This Topic: https://lists.openembedded.org/mt/116133830/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoann.congal@smile.fr]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Yoann Congal
Smile ECS


