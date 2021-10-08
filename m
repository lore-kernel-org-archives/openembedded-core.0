Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9E1C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 21:12:25 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.1214.1633727543953598775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 14:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b6P2ucfo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id e12so33441439wra.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 14:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=95fVqFYHIowC2/NCx1IabQ4bkxmOax8G9U4GCghzGBQ=;
        b=b6P2ucfo+lnm2xnS8whaiffnRnrSauATgzEOW45CtKvrOmMf/VoK/Km+lzjhhWa8Tr
         xN7oYzI3/Z8iAETJxUpiXnxStvxTxWp5RnLuJ4+cOFF7o/4OgeSUSD9/ZQ+Pc7w76ETk
         CIdW7Sm3kz9/RV1Ceav35UZ4PoiH0w1TBk2PQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=95fVqFYHIowC2/NCx1IabQ4bkxmOax8G9U4GCghzGBQ=;
        b=7amPlSlRKBNa5Tzk1Asbgmb/jJZYT/Kfv8VbSvjid9jZ/RpdAuZn6uAoCIkZhi8L1m
         OpxaRzMD7kV7OxRuDjsIjyPcUzBIi5oniVzknh8wofevuk2TnP0mmGMRdh27vgDyPgBO
         xwmWi/hIPmZ+WV4TYGb+d5h9splyaTFGOfa6x3tOsFggmE8kltU9PIYrRgkTDgOTfoTD
         bDWnriO3Cg2hpJd0CDQ22tTYxfSoCaJp2jMw752QjDNqvtmItdokGj+z8LBlOtKQ93ca
         qzc7YFRDIc2m5lKwrEiausgXcq1OStKpLB9U3lyzgHStMMsR4H6zOKpm0vnYBky+8qai
         w3tw==
X-Gm-Message-State: AOAM531FMYPfrNGXM1ak9Fmrk4OXSJEo6uwqTlAWQhPnrTBlCx7AcpEF
	ojGovj0TD572Bx98WYQBFONqzA==
X-Google-Smtp-Source: 
 ABdhPJx7ojncECgxsGi2lWemU6lYHoGW4+JgwNr+RxONmzNkyJCZQXrckG2A8fdSArIJ5MGRClu9OA==
X-Received: by 2002:adf:ee8f:: with SMTP id b15mr7031406wro.126.1633727542333;
        Fri, 08 Oct 2021 14:12:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5e9b:24eb:82aa:ef28?
 ([2001:8b0:aba:5f3c:5e9b:24eb:82aa:ef28])
        by smtp.gmail.com with ESMTPSA id
 g70sm259026wme.29.2021.10.08.14.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 14:12:22 -0700 (PDT)
Message-ID: 
 <2c39d3ead1cee72e752e9aa990b5fd3c9173712e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ffmpeg: fix CVE-2021-38114
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kiran Surendran <kiran.surendran@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 08 Oct 2021 22:12:20 +0100
In-Reply-To: <20211008164857.91699-1-kiran.surendran@windriver.com>
References: <20211008164857.91699-1-kiran.surendran@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 21:12:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156785

On Fri, 2021-10-08 at 09:48 -0700, Kiran Surendran wrote:
> backport from upstream
> 
> Signed-off-by: Kiran Surendran <kiran.surendran@windriver.com>
> ---
>  .../ffmpeg/ffmpeg/fix-CVE-2021-38114.patch    | 67 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb |  3 +-
>  2 files changed, 69 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/fix-CVE-2021-38114.patch

Master has 4.4 so this doesnt apply? Which release was this targeted at?

Cheers,

Richard


