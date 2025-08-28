Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 140C3C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 12:45:05 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.19962.1756385103847942018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 05:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SyiI5e3V;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-afcb7a3b3a9so124249266b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756385102; x=1756989902; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UBZZlf0OY1LXq/ifHI+eiRWp3pNEiDFmaACOu91apbk=;
        b=SyiI5e3VJL2EjWe+Egkmnm8xrRsx2/+sgwpDtk9Xi9g/ghgLcFiVsTThgDtwGL79ed
         2LE/3U0mpqu6i+gWGYd2g8fyJf8O9bthRQAnvkasJ0znI2TckgX2OXEqz93YGijyOUJo
         VclKZMHSKL/ZB2Q5X4cH5DCrQBd3QvnEfNVFQ1Y/GjpCDYLbQtm0C6JiwE/pYOI2DDDy
         JMzQhr6Ycq1ZrCgkiCchz8nmJApYuHaQLTE5hc+IPyE56IJatoP3uqYLBs4KoaL4acwY
         e3iV3URfvf7/oNvcyJcTorQLA8rVXEHbYr0OHEMF6RBXIYQ5VnJPaZYeJm1ZqALS+7uV
         ILdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756385102; x=1756989902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBZZlf0OY1LXq/ifHI+eiRWp3pNEiDFmaACOu91apbk=;
        b=sjUmLveWQAKcSkFqjSBxMhJntdoFLViY+6bbAZR7ShCi36Kqk6TTSHsC0SXwpoUmRc
         HSKLcwc/YnfZhzA96ZvacazO5Tx+xOsDZJZ9bmrZnzSaYL/665a9l83NRgtLHc2BmRqt
         iwwuioPkx/jHkuJxiPl/5h959ZZAIdIItbdqrm7587mhzglXT+HQwedUs/9FY5pp0Rhj
         wOCzccGDzirUzLotp0kMzGf6d8WPUpQBN25D641sKVdmsQeX2LxOhTWeq3SLO/MDydOa
         z21NV2PbGAiK8Y4lPHXT5eErbJwRjmbu5+C4vgEJBr99jj7t/nR5ml6m3gQOe0Y+6zID
         UE2g==
X-Forwarded-Encrypted: i=1; AJvYcCX8OtZFCb+PuV5dIj5TPhwEgm8EWXhOmVPLl0tZ79vIFheum86XvkmPX75q3oBIuDSxzEU/EHMbjrkSdVh8q1wabA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5wox9n1qEBSy6Y+4TlAkmuHIGll7LblK8ZQO3vqEXY2E16wpu
	s7DnRiXQ+Y6ftbLajL+dLs1rDQK21gOySqMf4PRIKN48/9DwLYCjMa8Y
X-Gm-Gg: ASbGncuXqVMwtnGFEmlStzQtSaiLaWfvBtGgkN+A7HNmRDHZpAqUi4Rr1mS2Zd01J6j
	1y5hXAeYjwDsiS1/qrvrc7g0Ip9mZOgckT5p/CwNKR5siF3iOet1vQI6d4vztkuUXafcT5Ihiqc
	8jEiTx7WMRn+XVTgZBkHZkyvrzlKBz0fM/fjwH8dRnar8d7TtEx619wtwwbaPVnKdgSF8IxE71C
	NFoggVMDCxPWRNLmUtbm371Nx+AMyPI1MdlyhL9a1I4M59Jsl31bU0x7WHd2A0hr32b6qr6U3MW
	nyz2n+5rdUFx8S9z8/6DQAMom/JayOXyP2sjXZAEkgTnzmn+i/qh2xQKt4Dg+h2uH7jfTjNcv7y
	lkgN8voCaFSOaKbtT5zpvHW/tswgpF6WF46U1ygPVAA==
X-Google-Smtp-Source: AGHT+IHWe0QR/ghZbAMousLQMfqORZw6TDfgCNJ1Y76P8iYXkIOglWAUpN2tX3o3Or5BGMBSofx3mQ==
X-Received: by 2002:a17:907:3d09:b0:afe:6fca:2efd with SMTP id a640c23a62f3a-afe6fca2fd2mr1473976066b.26.1756385101850;
        Thu, 28 Aug 2025 05:45:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe8d03f94asm764651666b.57.2025.08.28.05.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 05:45:01 -0700 (PDT)
Message-ID: <e3cafe69-7bf2-4084-9dbd-5255b538267d@gmail.com>
Date: Thu, 28 Aug 2025 14:45:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ptest-cargo: move run-ptest rc variable
 initialisation
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20250828120544.2982231-1-yoann.congal@smile.fr>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250828120544.2982231-1-yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 12:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222570

On 8/28/25 14:05, Yoann Congal wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> ptest-cargo run-ptest can be generated in two fashions: generated from
> scratch or appended to an exiting run-ptest file. The rc variable used
> to track tests failure was only initialized in "generated from scratch"
> case. Which lead to errors in the "appended" case.
>
> Move the rc variable initialisation to the common code of both case to
> fix this problem.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Cc: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta/classes-recipe/ptest-cargo.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/ptest-cargo.bbclass b/meta/classes-recipe/ptest-cargo.bbclass
> index ece25ff1eb..e35de1042e 100644
> --- a/meta/classes-recipe/ptest-cargo.bbclass
> +++ b/meta/classes-recipe/ptest-cargo.bbclass
> @@ -103,10 +103,10 @@ python do_install_ptest_cargo() {
>      with open(ptest_script, "a") as f:
>          if not script_exists:
>              f.write("#!/bin/sh\n")
> -            f.write("rc=0\n")                
>          else:
>              f.write(f"\necho \"\"\n")
>              f.write(f"echo \"## starting to run rust tests ##\"\n")               
> +        f.write("rc=0\n")
>          for test_path in test_paths:
>              script = textwrap.dedent(f"""\
>                  if ! {test_path} {rust_test_args}

I'm not sure if this is correct. This value is what's returned at the
end[1], but here it is set to 0 unconditionally, even though it might
have a previous value.

As an example, I have almost sent an updated librsvg ptest patch[2] -
while writing v2, I noticed that it has not only C, but also Rust tests,
so I started to add them too. The resulting run-ptest script first
starts with the C test that I execute, and partial result is stored in
the same variable. And then at the end ptest-cargo appends its own
tests, and continues to use the same rc variable.

One thing I gotta admit is that this rc variable is kinda hidden in this
class.

[1]:
https://git.yoctoproject.org/poky/tree/meta/classes-recipe/ptest-cargo.bbclass#n122
[2]: when I get around it again, I still believe that it will happen...

