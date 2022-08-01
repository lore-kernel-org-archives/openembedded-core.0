Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA4FC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 18:04:45 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.730.1659377076717368500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 11:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=sHwaa30g;
 spf=pass (domain: konsulko.com, ip: 209.85.160.175,
 mailfrom: trini@konsulko.com)
Received: by mail-qt1-f175.google.com with SMTP id h22so8663927qta.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 11:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jZvx0P37soKUHnkVpRY/J25F9aGcuLUDVzMldH87xKc=;
        b=sHwaa30gGk96XOkuxjOH7iBhVB71pHMUcdEnhQdq8uou6lLGSEjctvOMPQ2Hd0BdkE
         ujIF1SDVViE1kxzS4wN4739KhEJLuNcGxkD3XOR4rcHR1CMrCT1QCBc/65ROnAQgV8ZT
         Il2+d6tnnr6skO9EYhJZ66cBQZnTjoehPMb+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jZvx0P37soKUHnkVpRY/J25F9aGcuLUDVzMldH87xKc=;
        b=Yc3IFQx4j9Cm5teBfklUZYrmAwUhS8RqSCLNuHUAkmD6mBnoQatwD8OzgyROEiDK46
         j9Vp5J0gj4W6RgvA71zCczE27+HsaPYmhpd3Ki0XmlCcKU26JJyHQ5XKwGH6lrEeYrtU
         qia//pmmyM3hA7D58IpQexifVytd4JqoxJeLglhtfQCLJ5b7wpSb4RG4xbrjFUgs5E0J
         9Ji+mYngZj566XH9Mk0uHgJqMP89DsRgC4w5ucb2oCTlX0NlaFn9+bfrsXFsG0WMtcqg
         4bKoZzM4LHAzPYdcN8D6dntVhSSy3miY7ttqjg+QDlb1Us7SL4Z3ENFPN/peLD98NIPi
         oHKA==
X-Gm-Message-State: AJIora93OsBqnvCBYolKiarsixD3R+i40f6p3w2YzNjLF8yxUVa00m9u
	y7XI7QEP0qVKqGzxFobrf1HzGA==
X-Google-Smtp-Source: 
 AGRyM1tXRf+N4i3QhC/bhkZ4PavV5HecLVhCw/4uOdwGK16NHyLmXHGtluQyob4YN1FBeFOJiSx/Rg==
X-Received: by 2002:a05:622a:189d:b0:31f:11f:a20a with SMTP id
 v29-20020a05622a189d00b0031f011fa20amr15799312qtc.73.1659377075750;
        Mon, 01 Aug 2022 11:04:35 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com.
 [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id
 y25-20020a37f619000000b006b5e3bf0eb8sm8661773qkj.19.2022.08.01.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 11:04:35 -0700 (PDT)
Date: Mon, 1 Aug 2022 14:04:33 -0400
From: Tom Rini <trini@konsulko.com>
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dunfell][PATCH] u-boot: fix CVE-2022-34835
Message-ID: <20220801180433.GW1146598@bill-the-cat>
References: <20220731110127.15278-1-flowergom@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220731110127.15278-1-flowergom@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 18:04:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168757

On Sun, Jul 31, 2022 at 01:01:27PM +0200, Minjae Kim wrote:

> i2c: fix stack buffer overflow vulnerability in i2c md command
> 
> CVE: CVE-2022-34835
> 
> Signed-off-by:Minjae Kim <flowergom@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

