Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3587C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:01:14 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.22035.1636981273190064344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HPWt9Gqk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id n29so30481151wra.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qJKvgQijI2YcfMqtFevYoZmjU0VjPG7/RFgAp16QbxM=;
        b=HPWt9Gqkj+o79+4blZkOkDWrbRlY0fLQasXX4B7Et2FEgy/5IMQpjR0ALTQaVWuHFu
         OvkrGPsRPLdgdbqTtHRAqi5DuuvRxetNdL1UmYaKHzAm5580e8LRyqNWdlo/+tEKxo/l
         YayOEd7u7dL3IIeIge2lZ52UCm3c7fbzMrfP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qJKvgQijI2YcfMqtFevYoZmjU0VjPG7/RFgAp16QbxM=;
        b=ds8Mpq/9proaj7uGx4DOt8oTf21hzNX9/ToVRqBYKcFCm/5kFdln/CUweyAjLotuOe
         esJdZQ6/JOl3ZKbXz14jrnrzzqKrBARSCJr2b069vQIMgThiHNW9kIeGNUrhUmBXgxsQ
         D4AB32GgcdIE5iv/3L7IWSTzHRRC1E8V2chmJCqlMlE2xr96okb0ZQYhEK3qNKO4K6I+
         02s8CwIlcqb1ypnHp+JtZGNQHJtDKF1l7lbqDP7NBGbjsheKdpba3UFi0VthNU6YVyMn
         5HQ4O2isZTN1c7t3qGIiY5MN8SNb4oea1CrADzoUaUEhQntCNwYiWmCGRdrT5UEcbcmi
         Zw7w==
X-Gm-Message-State: AOAM533UW9PU6qc0yqycieZnty7/kAUrHGUpeSycEJKVVZXlhwdwc1wd
	8aWARGyH6qT7JCVuflyMjDE7AQ==
X-Google-Smtp-Source: 
 ABdhPJzEb5E2sE8jL4+fkUgmPODW4SGv+JgPd8nHtbF/FH7iujruWslx4ZnpBhU/zblyqYFDXuda/Q==
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr37018572wrq.71.1636981271661;
        Mon, 15 Nov 2021 05:01:11 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c4af:9769:123a:c249?
 ([2001:8b0:aba:5f3c:c4af:9769:123a:c249])
        by smtp.gmail.com with ESMTPSA id
 p12sm14468844wro.33.2021.11.15.05.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:01:11 -0800 (PST)
Message-ID: 
 <fe0f2c2c9f2c385d689857023a33146b746102bc.camel@linuxfoundation.org>
Subject: Re: [PATCH] Fix Bug-14613
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pgowda <pgowda.cve@gmail.com>, openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com, umesh.kalappa0@gmail.com
Date: Mon, 15 Nov 2021 13:01:10 +0000
In-Reply-To: <20211115125853.123820-1-pgowda.cve@gmail.com>
References: <20211115125853.123820-1-pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 13:01:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158287

On Mon, 2021-11-15 at 04:58 -0800, Pgowda wrote:
> Source:- https://bugzilla.yoctoproject.org/show_bug.cgi?id=14613
> 
> Adds TUNE_PKGARCH to PN so that it picks correct TUNE_FEATURES.
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-cross.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
> index bb625f4240..30c92ed395 100644
> --- a/meta/recipes-devtools/rust/rust-cross.inc
> +++ b/meta/recipes-devtools/rust/rust-cross.inc
> @@ -34,7 +34,7 @@ DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs vir
>  DEPENDS += "rust-native"
>  
>  PROVIDES = "virtual/${TARGET_PREFIX}rust"
> -PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}"
> +PN = "rust-cross-${TARGET_ARCH}-${TCLIBC}-${TUNE_PKGARCH}"
>  
>  # In the cross compilation case, rustc doesn't seem to get the rpath quite
>  # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't

If we do this we can drop the TARGET_ARCH piece since that isn't needed with the
more specific tune present.

Cheers,

Richard


