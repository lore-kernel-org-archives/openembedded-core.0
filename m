Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 549A1C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:03:16 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web09.26384.1643277794779146528
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:03:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XoX2KOHO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso1509219wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pXwTrGYJzKiIESvYuISwxsB5oyzQIJEjNGFAWUdS554=;
        b=XoX2KOHO5XPWinMEy9rjBoND7ej9mm17uEo25BoCMqOeTGto+mPM+ifoHYKScpqKOb
         pcHcbruFGzJGkkysxuSJ58nv0nNIbVSq0+IeDB70RUAF+lQ8HhOiQ3zrkFtHt5HqLxVG
         VIdyVTgl7rF+SHJboxFcXwwZni/kyKESNfOBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pXwTrGYJzKiIESvYuISwxsB5oyzQIJEjNGFAWUdS554=;
        b=z/Df5jo4USXV6Y9iU+lmtMzcOt28tP3Grr+0ekdJBCRshuyrZOck49ExMudcDMyC3G
         nF0MaE/7Uhz0Vqy7RJLxa50JWPKPOjaEA3ZfoatJ+TnGurkrg0BHZplEJ6d/8q3bkU+i
         YksJZ//bsiE071SDoYU1f8mqSMNq5ZNH/XN2e8DUd4GgX4rWTnJry7+PcS5RmCn2snLA
         xDbBjdmoRHNnV7Yvv59R6uVTs0xhl89TZ2KWGOLTt0V1h8WryvwjIDIPj8SuS814yR4v
         EmxueXmpbo9zkFc2SrCmmMa+X7hFhGrKnRtWFte8q/VRuOECRv/+reIiFwfm8wmIs5Id
         gmuA==
X-Gm-Message-State: AOAM533M5aH/F/24O19QTPu7Cc2MxZ8FgjNcwPNVWg8lkHMQUKsXAA5O
	h9kh34WJfYic80vj+uRnU6ihWw==
X-Google-Smtp-Source: 
 ABdhPJzdgUDn9HxrGlxR9IYq3ef2GbJJU3OwSNx3TT6Hpj7yKK0FQCkOOhnMevbG5qb2Pn43xCC1cg==
X-Received: by 2002:a1c:a5d0:: with SMTP id
 o199mr11080614wme.65.1643277793151;
        Thu, 27 Jan 2022 02:03:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2fd2:4bdc:d986:ec95?
 ([2001:8b0:aba:5f3c:2fd2:4bdc:d986:ec95])
        by smtp.gmail.com with ESMTPSA id
 d9sm1815727wrp.14.2022.01.27.02.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:03:12 -0800 (PST)
Message-ID: 
 <f94b3d48518c00276d36321d76ecc1b27019f0ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ruby: Fix build on riscv/musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 27 Jan 2022 10:03:09 +0000
In-Reply-To: <20220126044142.2409754-1-raj.khem@gmail.com>
References: <20220126044142.2409754-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:03:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161022

On Tue, 2022-01-25 at 20:41 -0800, Khem Raj wrote:
> This fixes a build issue that started with 3.1 upgrade
> Fixes
> > ../ruby-3.1.0/vm_dump.c:916:38: error: use of undeclared identifier 'REG_S1'
> >         dump_machine_register(mctx->__gregs[REG_S1], "s1");
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...ine-REG_S1-and-REG_S2-for-musl-riscv.patch | 30 +++++++++++++++++++
>  meta/recipes-devtools/ruby/ruby_3.1.0.bb      |  9 +-----
>  2 files changed, 31 insertions(+), 8 deletions(-)
>  create mode 100644 meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
> 
> diff --git a/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
> new file mode 100644
> index 00000000000..8821325c0fe
> --- /dev/null
> +++ b/meta/recipes-devtools/ruby/ruby/0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch
> @@ -0,0 +1,30 @@
> +From dfb22e4d6662bf72879eda806eaa78c7b52b519e Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 25 Jan 2022 20:29:14 -0800
> +Subject: [PATCH] vm_dump.c: Define REG_S1 and REG_S2 for musl/riscv
> +
> +Upstream-Status: Inappropriate [musl bug]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

Is there something open on the musl side to resolve this?

Cheers,

Richard


