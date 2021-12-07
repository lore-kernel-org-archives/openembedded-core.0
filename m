Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561D6C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 15:45:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.68726.1638891949501231757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PQYR+v7D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id i5so30424830wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=x9xFueKT7+12qXe3qmfhuaXnOpXpWJL+0as3s8FUe58=;
        b=PQYR+v7DD+EZm8LLSqCRc7pSDwTmA2ypm09Wv6iY+VBprvwo0XnyU7gFX5WH23QMeu
         Hzrrv5Iy/5xDbRozXujlh535LT/OixcrNK2L45DPys59yKn3OMOAbdk8UZ1kFTo+4v17
         RJLa+6BmbfohyPkHoo/vCyBSgcCPV7l3Y2mvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x9xFueKT7+12qXe3qmfhuaXnOpXpWJL+0as3s8FUe58=;
        b=dguy+j7JDCFlIoUtOXkDnaRuhZu9BDMDjtAhUtZ091j0OQ+qyPIt81gog0gA36ZHWI
         RTaZl6ndd3jqMomZcLEmMtv/FcDznuwZoPsaBuIeiKJXRPV8o274rfS23rZEyUu8XHZM
         M42Bo2zADTlIH2vH904B4gCyX/dwj7sjXLaLI7TgH7EwAwlRGQWZ8IyQ0ZyPEswP0hfU
         dOHtwWYSlhs1uj8TzU1wGBJkm3kYl+yf3+7Xfh/ILESbo6bG/BBHnLYG/3ix4KusYzxJ
         zhHGGkDsEjW0x4yPXQ4ztvyAPkz1f3Eqibkxr0l6bEdn+aNt+qrrEDJpAdjZj0q/Cicp
         zjsQ==
X-Gm-Message-State: AOAM533gIYyUV/cWEs7nOnbza7RqYdrmdex5IVtXkLMuwTRt/5Fclhbl
	KvbbSOirZrUEHdl0IlidSlK+JA==
X-Google-Smtp-Source: 
 ABdhPJzB2GZPGsdAUkuJUtwyAmaowZjueTgGggIpA/tP65e4uf6x0dN3rdqIZB2dPidA2SzVK6w9vw==
X-Received: by 2002:a5d:68cb:: with SMTP id
 p11mr52014616wrw.262.1638891948065;
        Tue, 07 Dec 2021 07:45:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a?
 ([2001:8b0:aba:5f3c:a430:ef69:a06e:8b4a])
        by smtp.gmail.com with ESMTPSA id
 t4sm2808570wmi.48.2021.12.07.07.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:45:47 -0800 (PST)
Message-ID: 
 <9dd70fe87463e8d9cfa9cb0c612ecbc7bd150b7d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] recipetool: Set master branch only as
 fallback
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Tue, 07 Dec 2021 15:45:45 +0000
In-Reply-To: 
 <20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20211206080406.3249-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 15:45:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159309

On Mon, 2021-12-06 at 09:04 +0100, Stefan Herbrechtsmeier wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> The commit 'meta/scripts: Manual git url branch additions (dc53fe75cc)'
> sets the branch= parameter too early to master and thereby breaks the
> -B/--srcbranch option.
> 
> ERROR: branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>  scripts/lib/recipetool/create.py | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

I think something in this series is causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2926/steps/14/logs/stdio

(the other selftest builds also failed)

Cheers,

Richard


