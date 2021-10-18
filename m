Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E6DC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 12:53:49 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.35727.1634561627580772528
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 05:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I3fUq5a6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id y3so41365675wrl.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 05:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=drC2gBN/DHsySNt81amEs7R5WnbMqPHuj0w9PS1axu8=;
        b=I3fUq5a6ArNAbync74+O4CAQnvXIqWmBwar3DjHKbfsxkKu449uN+mfdUiQMkrYGKe
         U+H6QWXsm3LciJGVe3bYi40o9EHowr7bg/1vY+liQEBdCuSu1bX22DEB1lopQFklzekw
         /rs9zyNlUDmJ6S5zdiH1PnyrirJsF3gmBehbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=drC2gBN/DHsySNt81amEs7R5WnbMqPHuj0w9PS1axu8=;
        b=UrcXWiBYfbT8cMlBsxhH7sNWTv6XV3VnVi5zzO+uLkimAdKXY0gBZSOt1vW9Mla9is
         0hx3PWIRftxl753VC+0IZ0dsQJy6uCo2MWLU0lrtJYs52K/DezNm1rvIdJrJVuoUX3oE
         3SNoDPlFcc31XZ0ZxV753k6OO3eogazOgC2pN5xMLpr/wQ+Kv5icQEtmMAWJLMFB7JoG
         09Z38ybyu+3Zt9mfpI02jNsqmgJOb3i7tNOFqZq9TDAric9+twIjQKo+FtQ9Xgm07Z4X
         c08FnOxzql0JdnfIZwQpo7U0a48IYzVgqSekXPLkluCBZg6fZ0M5RSyAfE9mX/YiFDBL
         d87Q==
X-Gm-Message-State: AOAM531IJ/BANWkUmIIS9aEkuXc5eX3Qmxu+7whlFnLedridv/5EdQvM
	0z+zoahLRPMS6ctLqu8Ek8YCeQ==
X-Google-Smtp-Source: 
 ABdhPJxevtexfMceB0/u9CyG7LeuF+FfDzC534+AiFNtU615UyENSdYyN0qT0zhxprfwHuT68XNjaw==
X-Received: by 2002:adf:a549:: with SMTP id j9mr35573023wrb.123.1634561626048;
        Mon, 18 Oct 2021 05:53:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1325:5a42:b4ef:5218?
 ([2001:8b0:aba:5f3c:1325:5a42:b4ef:5218])
        by smtp.gmail.com with ESMTPSA id
 k17sm12210996wrc.93.2021.10.18.05.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 05:53:45 -0700 (PDT)
Message-ID: 
 <76aaa9e236f1d4519d84f770da9a6e101bf13f4f.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] state/staging: Fix directory not deleted for race
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Date: Mon, 18 Oct 2021 13:53:43 +0100
In-Reply-To: <20211001072440.18158-1-pgowda.cve@gmail.com>
References: 
	<6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
	 <20211001072440.18158-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 12:53:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157057

On Fri, 2021-10-01 at 00:24 -0700, Pgowda wrote:
> Modify the SYSROOT PATH to fix race around issue when rust-hello-world
> is run for two libc one after the other.
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-cross.inc | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
> index bee7c9f12f..09d0078d17 100644
> --- a/meta/recipes-devtools/rust/rust-cross.inc
> +++ b/meta/recipes-devtools/rust/rust-cross.inc
> @@ -32,7 +32,17 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
>  DEPENDS += "rust-native"
>  
>  PROVIDES = "virtual/${TARGET_PREFIX}rust"
> -PN = "rust-cross-${TARGET_ARCH}"
> +
> +# Modify the sysroot PATH based on the libc used to fix race around issue.
> +def get_libc(d):
> +    tclibc = d.getVar('TCLIBC')
> +    if tclibc == 'glibc':
> +        pn = "rust-cross-${TARGET_ARCH}"
> +    else:
> +        pn = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
> +    return pn
> +
> +PN := "${@get_libc(d)}"
>  

I'm wondering if we should just add TCLIBC to PN unconditionally? Do we need the
complexity of the conditional code?

Cheers,

Richard


