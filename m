Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09576C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 10:03:35 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.20386.1644228213748674943
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 02:03:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bP/cIrpM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id f17so23757897wrx.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 02:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1KacVYH6Ruj9HDhtP7t5v/9i9XXqsq78B21DSPEFwy0=;
        b=bP/cIrpMHHHjBARw4ULUKHZc8DY8gV5ZVksjIbOtRvzE+dlHTFiO7yghX2nDWIbJ4c
         InuqGHZhZNRQO8hMp1pjNXem/rQjftOdoxFqQtdYsohSZUX8ovYlffTQuTUEkKZ06KWO
         7M3W+/uP7OZPemfzk/cQTnqZnDVUf5c5RXfTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1KacVYH6Ruj9HDhtP7t5v/9i9XXqsq78B21DSPEFwy0=;
        b=jyaL1JnGXlJWGnnlYNhlHe9eIoe3EJHv9b4ZPQGtI1WAtN9PAjam3NH7pl5bK5P0YA
         nCxhaWFOUbJypwSRshplsiSrMdHL44hc+fMF/k2uDWo5GaOny9Q0LvtwG/IxYazXXRfS
         AU5t2Ms/CWdg8Qh+Nt29mBjfb3MlsVWsbcOYp/daNOLQ+25Nkkfax8V1zh+vJbzeXdSx
         9ANo2Oppq5mZNnIH9UZr6RZVD4Yh4X0zNFdGu0AMW52goFC7rYuLeb6C8dwzEYD/u1O2
         IGlMOnVw3I6o4i9EvceGFNq1eCFUiIRKRhmshQKBoB2WLycEIGR//eynVdioeVokWueb
         0qyQ==
X-Gm-Message-State: AOAM5302R5Y0clszmyjJb+lu7zXsknxOQaJA01TM8bdXU4TmO2xcSAQo
	7/6orKt/IryBe0dYMWwdlrIn/Q==
X-Google-Smtp-Source: 
 ABdhPJzUHKx43zN9JoJR1C2IDuelF/xB1Ukh6O7cz0Ik8Oo70N8LTvNIk4sPDTT+f/FnXxGlJT/n2g==
X-Received: by 2002:a5d:6a0e:: with SMTP id m14mr3735287wru.167.1644228211876;
        Mon, 07 Feb 2022 02:03:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6244:607e:d5da:d0fc?
 ([2001:8b0:aba:5f3c:6244:607e:d5da:d0fc])
        by smtp.gmail.com with ESMTPSA id
 i6sm9786876wry.33.2022.02.07.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 02:03:31 -0800 (PST)
Message-ID: 
 <318d02584b3de93e9f4be79ac001e0577f125639.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] git: restore reproducibility on centos 7
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 07 Feb 2022 10:03:29 +0000
In-Reply-To: <20220207091621.756173-1-alex@linutronix.de>
References: <20220207091621.756173-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 10:03:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161457

On Mon, 2022-02-07 at 10:16 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...-do-not-force-RHEL-7-specific-build-.patch | 30 +++++++++++++++++++
>  meta/recipes-devtools/git/git_2.35.1.bb       |  3 +-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
> 
> diff --git a/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
> new file mode 100644
> index 0000000000..e0f702f327
> --- /dev/null
> +++ b/meta/recipes-devtools/git/git/0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch
> @@ -0,0 +1,30 @@
> +From 3b2505435bc6f982226eff84bad6bf9a36381573 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Mon, 7 Feb 2022 10:13:15 +0100
> +Subject: [PATCH] config.mak.uname: do not force RHEL-7 specific build settings
> +
> +This breaks reproducibility as git builds on centos 7 use
> +different flags than git builds on other host distros.
> +
> +Upstream-Status: Inappropriate [upstream needs to check compiler and component versions properly]

I'm struggling a bit with the Inappropriate patch status. I can't help wonder if
we should have something like "NeedsRework" to illustrate something where the
patch itself isn't appropriate but the issue itself should be handled upstream?

Cheers,

Richard




