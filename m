Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 178FAECAAD2
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 21:56:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.18604.1662069406349729261
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 14:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TKHGVGz/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so230429wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 14:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=ltWvybZwUQC5DrJvI53LK+UMLIva7+owDzY/wFnLIxk=;
        b=TKHGVGz/Hf8cqS7WgRiPLlzHyaYIILDZQ/nWDOWmrSAhjS6DeCoEJiUB3WaAEeRGcb
         kZh9MvgzWetywO+EVcZkpUvcnkH482zl8E9Egct8pD3bHS6fHBmTr/uHlZYWOo23AxCo
         oc3sOtjJnXsDUJhx0FesmSTDVTui/3APHMzqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=ltWvybZwUQC5DrJvI53LK+UMLIva7+owDzY/wFnLIxk=;
        b=T2zKWazEMoJA+L1aWebVGe8vdIgbqDCM4q0xJXBmhBMj37pMr030DWSlssZ40iHYjF
         2aBAi9xwYvAR/Mk6EnaZLQeJxUO4Pki/kdRzUCJ6yZ4wN2eVdGXQRZr4oHPqFqQglgKS
         loh1syD5QoxZMxz/dimd4HenLfa8SCXWjUEg3zvJTiHVluG5bD2MvpA3Yi2VCNSbCl7T
         DbaZc1KqA/0MIp2zQ1LiiMlPD71ejFJ3/fyYqbXWDeQoZWn8AwpLWbwqI1yCt3jMBwoa
         l8EbWECGEtbZUwccYb0bWSAhu9Oi4rZOPd17JnDGRdR3LFKWVr8S+RS3QIoxzv1iQKb4
         dRCQ==
X-Gm-Message-State: ACgBeo2j5en0GxCHTjY81TjKJuWSGsIOh7kFQlZ/l2VFKWZyp4inMTxf
	E4QGS2kLMBtCoDvwvwh5qSfyqw==
X-Google-Smtp-Source: 
 AA6agR5wKZEgr5sMPztG9Dk2g5Q4cKZKKsr/ZFBAoreoICu0EZUe0nnZ/QunEjUE0a+7r6pbzYkBtQ==
X-Received: by 2002:a1c:4b01:0:b0:3a5:94e8:948e with SMTP id
 y1-20020a1c4b01000000b003a594e8948emr653979wma.197.1662069404652;
        Thu, 01 Sep 2022 14:56:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e969:460c:a8b4:e544?
 ([2001:8b0:aba:5f3c:e969:460c:a8b4:e544])
        by smtp.gmail.com with ESMTPSA id
 v64-20020a1cac43000000b003a844885f88sm258984wme.22.2022.09.01.14.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 14:56:43 -0700 (PDT)
Message-ID: 
 <bfb53742faabb17392588d9083c838b97f69283f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] rust: Use libc++ runtime when using clang
 with llvm runtime
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 01 Sep 2022 22:56:43 +0100
In-Reply-To: <20220901203228.274513-1-raj.khem@gmail.com>
References: <20220901203228.274513-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 21:56:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170228

On Thu, 2022-09-01 at 13:32 -0700, Khem Raj wrote:
> meta-clang has options when it comes to C++ runtime, default is to use
> gnu runtime, other options are llvm runtime and android runtime. This
> patch helps when a distro is using llvm runtime for C/C++ runtime. It
> informs the rust build system about right C++ runtime to configure for
> when such a setting is used.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebase now that 1.63 is in
>=20
>  meta/recipes-devtools/rust/rust.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/=
rust/rust.inc
> index 284347dedc..3a7b993ee8 100644
> --- a/meta/recipes-devtools/rust/rust.inc
> +++ b/meta/recipes-devtools/rust/rust.inc
> @@ -107,6 +107,8 @@ python do_configure() {
>      # [llvm]
>      config.add_section("llvm")
>      config.set("llvm", "static-libstdcpp", e(False))
> +    if "llvm" in (d.getVar('RUNTIME', True) or ""):
> +        config.set("llvm", "use-libcxx", e(True))
> =20
>      # [rust]
>      config.add_section("rust")

My concerns about "RUNTIME" as a variable in OE-Core stand. We need to
figure out the naming properly for this before it is used here.

Cheers,

Richard



