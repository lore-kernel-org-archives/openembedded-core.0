Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51FD0C4321E
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3987.1650374248379459578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 06:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V9kzZrYL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id k22so22405445wrd.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=VO+YD6NNrvPZSQIBvH2gvreiOKiyfTVezaQQukzNR3Q=;
        b=V9kzZrYLJ0rWmusQQS5FMQxH2WwzatDXXKnIxBEcgFoAR42t1RmnT721QC+Ve+QVWI
         s3eNNuPsEK7G3CQlStVxnwkM3bt5/eTZG4fMsUYf+VFJg9e8H83dJ24ILK+KJ8UetiJ7
         i3X+roK+wFvTBm9P/IpJK+WF4AVPTPx5R6w0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=VO+YD6NNrvPZSQIBvH2gvreiOKiyfTVezaQQukzNR3Q=;
        b=6xWV5TEcszbWBfy8+FTH66RoOy4HqsveFqR+6nwVFH8kkDG+f29Dy2L5Mtd7hUijAS
         UdqTn3/tanNVMEA0CTu+2vRjU6Hpw+QEQ5K7cQ8PlY0qM2S/9ru6e3g9/obiQuNzGqKh
         nupfLSQaM+1DRltNyNAWCEopbEog137CPSVLR1EG8u2P1746orJoRGIZWp3xc/lYGJVR
         YrOqroYSr0oGfya5jDHHTjkP6k/Gs+fw4Bs7fkL4ooN0EhqSXP9mwPQ1V4J8VCK5C02U
         lTx/nhykYt6V+XBO4PiV8UfwDZbTERNJSlBKlehc3aA127WQrbvtQdwUllvZ0rRZjtoP
         bUxg==
X-Gm-Message-State: AOAM533cYNQXeo2auq+R8NJsW2bfgitvwNIeGF0cvIXbVYDLxDHd0VFZ
	tj55Stmccm8eN2QTrfA7HyzbDg==
X-Google-Smtp-Source: 
 ABdhPJzdxX7yQ1XhGlmBVxXADPQ/WevojDJZii863Q8AbK7t+ciM9vhDOMY17SLQOw4rilyxY7p/dw==
X-Received: by 2002:adf:fc87:0:b0:207:9db9:8bec with SMTP id
 g7-20020adffc87000000b002079db98becmr11474454wrr.649.1650374246807;
        Tue, 19 Apr 2022 06:17:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:224f:e0f5:68e1:5371?
 ([2001:8b0:aba:5f3c:224f:e0f5:68e1:5371])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a056000008800b00207b3fa7fc0sm14197915wrx.108.2022.04.19.06.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 06:17:26 -0700 (PDT)
Message-ID: 
 <9d7e2301b84cc6cd46bdd831fdac6debfb3ee512.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][kirkstone] lua: fix CVE-2022-28805
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2022 14:17:24 +0100
In-Reply-To: 
 <9e6a5e5366b6c6ea6cfb666d7e26d287ba9a42f0.1650303227.git.steve@sakoman.com>
References: <cover.1650303227.git.steve@sakoman.com>
	 <9e6a5e5366b6c6ea6cfb666d7e26d287ba9a42f0.1650303227.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164629

On Mon, 2022-04-18 at 09:04 -1000, Steve Sakoman wrote:
> singlevar in lparser.c in Lua through 5.4.4 lacks a certain luaK_exp2anyregup
> call, leading to a heap-based buffer over-read that might affect a system that
> compiles untrusted Lua code.
> 
> https://nvd.nist.gov/vuln/detail/CVE-2022-28805
> 
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../lua/lua/CVE-2022-28805.patch              | 26 +++++++++++++++++++
>  meta/recipes-devtools/lua/lua_5.4.4.bb        |  1 +
>  2 files changed, 27 insertions(+)
>  create mode 100644 meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
> 
> diff --git a/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch b/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
> new file mode 100644
> index 0000000000..8a1a69d60e
> --- /dev/null
> +++ b/meta/recipes-devtools/lua/lua/CVE-2022-28805.patch
> @@ -0,0 +1,26 @@
> +From 1f3c6f4534c6411313361697d98d1145a1f030fa Mon Sep 17 00:00:00 2001
> +From: Roberto Ierusalimschy <roberto@inf.puc-rio.br>
> +Date: Tue, 15 Feb 2022 12:28:46 -0300
> +Subject: [PATCH] Bug: Lua can generate wrong code when _ENV is <const>
> +
> +CVE: CVE-2022-28805
> +
> +Upstream-Status: Backport from upstream: https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa

For consistency this should be:

Upstream-Status: Backport
[https://github.com/lua/lua/commit/1f3c6f4534c6411313361697d98d1145a1f030fa]

:)

I tweaked the patch.

Cheers,

Richard




