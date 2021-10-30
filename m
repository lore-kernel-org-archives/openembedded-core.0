Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF543C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 10:10:09 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.17561.1635588608228997156
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 03:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I2CpgYGJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 a20-20020a1c7f14000000b003231d13ee3cso13596114wmd.3
        for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Oct 2021 03:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ffBVeCVunCCiUUtTi+/PV8jcdTaZB/fl3+cIxtSnlKc=;
        b=I2CpgYGJ/q1B8aDyQ4CSjtq/OfxStJQxmE5hnI9pTam/LXmT08VE8hKbCn3BFLRAeh
         S1fxZyMJIei8lclrC6VD/0Uxz0D84OmeIANX0EdP0ccO0l4Xar6fdQli1HAJsGEqSRQf
         wOa9oY2aFtvTM4LML8+uGv6TKTXuXePIqLCOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ffBVeCVunCCiUUtTi+/PV8jcdTaZB/fl3+cIxtSnlKc=;
        b=mRyZIL5DpDpei4cla7wMHBZ3WLwSi/ClESeX3QsGTr/TBKFuwesZ9IuP5lSiIhfqGH
         tSPrDGV67jjQwE2pyR4lR+PA+9m3w4g1kf7tcSHvIzTd6vNJN8ADYU0RoubQndpcQyWg
         +mlQVkgajCAO+phzvJMrvP4y93WGOALkOV0hAkGIuto9ZWqxtIKRDOVo0n+OcpkB2jeS
         e1hfoStIhvslVG+ow25n0y2uSgwA60zhrgdf9rh7GMQFNmzSJxOSMEnFLWGp3QRRYtMf
         OzaA5GoRUOYGMWQ97d9t6pqomPFKfcECHvVdHKW5QLQeenEtaI3VxqUc31EkaFzLJ/AO
         l2vw==
X-Gm-Message-State: AOAM532KoL60Bk6fslXRjk8fgekOf53unM6D0vnccpYg8x3D05PoMGyd
	mSwdrWwYzg9NvDpc2xDsab5zFA==
X-Google-Smtp-Source: 
 ABdhPJwWQl8I4gCP+nKkboQPIMFS7iw/dZxirwnPGmcL7ounhcTSgdsVrPMj69VB5I+UyJiAy9b4sQ==
X-Received: by 2002:a1c:a904:: with SMTP id s4mr9649238wme.163.1635588606649;
        Sat, 30 Oct 2021 03:10:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:af33:8564:b018:31d5?
 ([2001:8b0:aba:5f3c:af33:8564:b018:31d5])
        by smtp.gmail.com with ESMTPSA id
 v3sm8231658wrg.23.2021.10.30.03.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 03:10:06 -0700 (PDT)
Message-ID: 
 <d4ceae27aca5b21cb70bed22c34596ceae369527.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] libsolv: Enable correct qsort_r on musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 30 Oct 2021 11:10:02 +0100
In-Reply-To: <20211029171022.1279107-3-raj.khem@gmail.com>
References: <20211029171022.1279107-1-raj.khem@gmail.com>
	 <20211029171022.1279107-3-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Oct 2021 10:10:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157644

On Fri, 2021-10-29 at 10:10 -0700, Khem Raj wrote:
> Newer musl now has this function implemented and signatures are same as
> glibc, current codepaths forces it on BSD path which is wrong for musl
> and results in random segfaults in apps using libsolv e.g. opkg
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Rebased on master-next
> 
>  ...s-Conside-musl-when-wrapping-qsort_r.patch | 34 +++++++++++++++++++
>  .../libsolv/libsolv_0.7.20.bb                 |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
> 
> diff --git a/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
> new file mode 100644
> index 0000000000..6f0dea2e9c
> --- /dev/null
> +++ b/meta/recipes-extended/libsolv/libsolv/0001-utils-Conside-musl-when-wrapping-qsort_r.patch
> @@ -0,0 +1,34 @@
> +From 06321f1a2aa89b8e028946e793344657eaad0165 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Thu, 28 Oct 2021 22:28:45 -0700
> +Subject: [PATCH] utils: Conside musl when wrapping qsort_r
> +
> +musl now has implemented qsort_r, the signature however matches glibc
> +and not BSD, current check makes it such that it falls into BSD case
> +when building for musl, which clearly is wrong, therefore instead of
> +just checking for glibc check for linux to decide which qsort_r
> +signature to use. This covers both glibc and musl
> +
> +Upstream-Status: Pending

Can we submit this upstream?

It is a bit unfortunate that it looks like you can't build with old and new musl
at the same time :(

Cheers,

Richard


