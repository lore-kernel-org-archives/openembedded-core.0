Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A730C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 13:35:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.22354.1633268121548088802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 06:35:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UhuHxkI8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so16625233wmc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Yo1j7MzhxqWA+57wM67jyoMAkBQc/O2MwgSJSa0et04=;
        b=UhuHxkI8EMnR12eBW86BbThs6yvjbgqLvq5Wmff93LAEKg7vhlV6FFRXuL0K2by1xY
         j41PqQUFGyUk5K3RwKcKO4xGbf5nfKfdkY++cYBA3gVAzCpJZkzr8JLQKrbeXX5sSCoU
         a53fH1SnpkQLrcVX0UKubPnF9XXxjN5Dm+fLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Yo1j7MzhxqWA+57wM67jyoMAkBQc/O2MwgSJSa0et04=;
        b=fJhX5s3ExRrKBbQCJ9AifwRRpyZuqUSTVzggcNhKf3EMEY86RY+RA3lyW08zYrYhzP
         cOT//zzDJ7ySBUILZqgrQz4U4Qvxiv0zataLQKRgkncwWwCEVczjzcrKyvLAek8vml22
         VN2ntvuwCb3g2WdYfh2U+tAW4JeENVK7w1nYU9M143djcfnj5M11ZeMR+UkOLsYorYUc
         7vvZMStkUebRZ0/jnFNztNTx2aGTABwiz075gscqrlqyIlqdtg+mMtsXEiX2Ak+cSNKI
         ywFE8JFNrxA/J5A6dcJTH7zkBMc7Nt7ta+ofIaF9T+5MIFnQ24rpw/zNklph3nr5JBK/
         WMeQ==
X-Gm-Message-State: AOAM530sLQJsDAtsUFzaW+s6WEnkKhmAUMvVfLKBzxDA9PFDSRqZ6j64
	ngON2Bp449LuQ5eXujOZ14fMwn6CJj7suzy7
X-Google-Smtp-Source: 
 ABdhPJwwi7/wtSZpWQJ3pmrv/0RGbTZVc67KEbWlifFiWA5DRZHdMFV1I65N69M33ixq/iNvcAv8CQ==
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr2887037wmd.40.1633268119712;
        Sun, 03 Oct 2021 06:35:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6?
 ([2001:8b0:aba:5f3c:8657:7fac:b2bf:59a6])
        by smtp.gmail.com with ESMTPSA id y5sm8045773wma.5.2021.10.03.06.35.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 06:35:19 -0700 (PDT)
Message-ID: 
 <96f84cbbf6a5652b7a7a16ffaa5cdbd2bfeac5f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/5] image-artifact-names: Use
 SOURCE_DATE_EPOCH when making reproducible builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 03 Oct 2021 14:35:17 +0100
In-Reply-To: <16AA56A68DAA9487.23650@lists.openembedded.org>
References: <20211002221803.2283254-1-richard.purdie@linuxfoundation.org>
	 <16AA56A68DAA9487.23650@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 13:35:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156552

On Sat, 2021-10-02 at 23:18 +0100, Richard Purdie via lists.openembedded.org
wrote:
> Using DATETIME means the deploy output is not deterministic. Use SDE
> when using reproducible builds since it is consistent for given input data.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image-artifact-names.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
> index 3ac8dd731a6..df9e17c6b0f 100644
> --- a/meta/classes/image-artifact-names.bbclass
> +++ b/meta/classes/image-artifact-names.bbclass
> @@ -4,7 +4,7 @@
>  
>  IMAGE_BASENAME ?= "${PN}"
>  IMAGE_VERSION_SUFFIX ?= "-${DATETIME}"
> -IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
> +IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME SOURCE_DATE_EPOCH"
>  IMAGE_NAME ?= "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
>  IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
>  
> @@ -13,3 +13,10 @@ IMAGE_LINK_NAME ?= "${IMAGE_BASENAME}-${MACHINE}"
>  # by default) followed by additional suffices which describe the format (.ext4,
>  # .ext4.xz, etc.).
>  IMAGE_NAME_SUFFIX ??= ".rootfs"
> +
> +python () {
> +    if bb.data.inherits_class('reproducible_build', d):
> +        import datetime
> +        d.setVar("IMAGE_VERSION_SUFFIX", "-" + datetime.datetime.fromtimestamp(int(d.getVar("SOURCE_DATE_EPOCH")), datetime.timezone.utc).strftime('%Y%m%d%H%M%S'))
> +        d.setVarFlag("IMAGE_VERSION_SUFFIX", "vardepvalue", "")
> +}

This patch is incorrect. It breaks images as they have noexec do_unpack tasks.

Cheers,

Richard





