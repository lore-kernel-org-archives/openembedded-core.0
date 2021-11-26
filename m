Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C4FC433EF
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 08:12:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.21513.1637914378282200121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 00:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JZPBnQ73;
 spf=permerror,
 err=parse error for token &{10 18 _spf.google.com}: limit exceeded (domain:
 linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 133so7441876wme.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Nov 2021 00:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=F6MgbyiykqQg0xcjpuo6esR8+WjyTCVbr3ogj2BL2R0=;
        b=JZPBnQ73aAgPgtxhf7fj4jZwJxStJjY73Xr71Vt/nIbSy4nCg2IfoTji9a3+5LZsl/
         I8y3iyLoSQdqaRISugGVWlPnYtrSHsMWDj5HGa3gu9Zfs8Q9OEcRMVTkktK/9AYJdqR1
         HWYYfgTatxYoSOkC8kglTShQmApF5y+GUbe3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=F6MgbyiykqQg0xcjpuo6esR8+WjyTCVbr3ogj2BL2R0=;
        b=GkTKDachQ09HSxKfRU0XOowrkTEHotE6J4yAjyFF/pSopE3BVb/WVn8rkgoSiWo54k
         7Y0ZNzZVmIE+QzS/iGRBsGcQcLVJ92fEdBCvxOhF23KPt3w0Tsf2t9SBk7zvaA+tyCre
         C3OcNpd/qZTV+uVUbzDHnU9yzJUuDUv2NmwhSRlyNatLPjLjLp3ZGCpf7neE72wzeDum
         whH7bGL74/h4m4PlXgCz4nLRxdxbPRE4dESM/PENd8GbYM6oJyYArCIZfh+7pAXBpXme
         lCtkyoLBOC4AMjNees8flVS8RAmdSwNDQx0VVIsckV7Uv22p1jax8v0VmSRokiE53KLF
         5lAg==
X-Gm-Message-State: AOAM532kmu7Iaq/6rgcrGa9jhOi1jgoOQvaA5BK4Lx0q6n6fhKo0sHRg
	OTQ5gJ9BUbIq2UACDuGpj0SGAw==
X-Google-Smtp-Source: 
 ABdhPJzhDtaok5owbrP3vIJG3Q0PHUtuf1prlgmBWAyRdjKLe7ESimQG/BZt186erCsYrCJAtBHAxQ==
X-Received: by 2002:a7b:cf18:: with SMTP id
 l24mr13827267wmg.145.1637914376680;
        Fri, 26 Nov 2021 00:12:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f21b:9c01:debb:ef34?
 ([2001:8b0:aba:5f3c:f21b:9c01:debb:ef34])
        by smtp.gmail.com with ESMTPSA id
 q26sm5050278wrc.39.2021.11.26.00.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 00:12:56 -0800 (PST)
Message-ID: 
 <c97ac7bd35e447da2b6134b1d7a5a98cd56b4a9a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] openssl: fix
 EVP_PKEY_CTX_get_rsa_pss_saltlen() not returning a value
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 26 Nov 2021 08:12:53 +0000
In-Reply-To: <20211125111003.1051893-1-ross.burton@arm.com>
References: <20211125111003.1051893-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 08:12:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158826

On Thu, 2021-11-25 at 11:10 +0000, Ross Burton wrote:
> Backport a patch submitted upstream. Specifically, this fixes signature
> validation in trusted-firmware-a with OpenSSL 3.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch | 89 +++++++++++++++++++
>  .../openssl/openssl_3.0.0.bb                  |  1 +
>  2 files changed, 90 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch
> new file mode 100644
> index 0000000000..5c76485b5f
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch
> @@ -0,0 +1,89 @@
> +Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/17136]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 425191c295ada8510b0ee87d292ef18b7a45d062 Mon Sep 17 00:00:00 2001
> +From: Tom Cosgrove <tom.cosgrove@arm.com>
> +Date: Thu, 25 Nov 2021 10:17:15 +0000
> +Subject: [PATCH] Fix EVP_PKEY_CTX_get_rsa_pss_saltlen() not returning a value
> +
> +When an integer value was specified, it was not being passed back via
> +the orig_p2 weirdness.
> +
> +Regression test included.
> +---
> + crypto/evp/ctrl_params_translate.c | 10 +++++-----
> + test/evp_extra_test.c              | 28 ++++++++++++++++++++++++++++
> + 2 files changed, 33 insertions(+), 5 deletions(-)
> +

I suspect this may be from this patch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2586
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2865

Cheers,

Richard



