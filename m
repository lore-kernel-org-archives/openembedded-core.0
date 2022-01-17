Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB94C433F5
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 11:58:54 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.10229.1642420733827387684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gbn0jI10;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so23767139wmo.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jan 2022 03:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=qMn/WVCrAj+CceCZEv1HHSoNhF2LGtoJ4TSXFSgyc4o=;
        b=gbn0jI10QR9ZW/Uec9yHV9l+4lNs3RuuwwpO+gTEOmiVzAp/b6Sz7NZFjeVBzaGzYb
         OEbCpQb35fDM42hfZqRUnb9UDPTk76va6HulexpCPCYSx/A6VaURyPhdE0ZN3noy9cyJ
         PzbhwVZxGmxcSEgikqRClp4qOJejFuP+wcmT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qMn/WVCrAj+CceCZEv1HHSoNhF2LGtoJ4TSXFSgyc4o=;
        b=C/dqdLOKYy85gZY69whMp1YjCLvMgUAuz+ekLYo5zsTwrzRi4z26x6p1C2zDY/gUsj
         lk5sW2gfnH02kXzt84Y566Tu2r0zQQ9ZWAg5GOug+V7CtbZ+1/JxTlzympPm3+5WKYsl
         FlReOsRh5mpjY2ItHjmyGM8vV3JrWNc0Zm0stpUlVT6oMoTnMvenVq+a1earvjVxTQKr
         anJFBrDgWEmCVqCqS6WSX/DASbPlV2foEiOVEPPkPmgwQYCdARuHVidTtPUwCIoNap6p
         KDYqXvXGEwacBL7b67+7C6Do9ci/vchFuZpRBZBHiR+ds2RuvMPLD5qszNkvdV+VBKC/
         PeCQ==
X-Gm-Message-State: AOAM531n8kPzwaPtdXb1ngK1peP1/t7WqQG4P11LfibNz0H583mq6Z5f
	pwfJWvXx56g3yl8J/Bvzixbijg==
X-Google-Smtp-Source: 
 ABdhPJwF3vKbYEB9vU9CsaP/JQTBUfn0qfWYQ5at+9yC7f8BgCCBnXtZDrMuvNzdZ8m90oKtHuCO5A==
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr10230048wry.110.1642420732308;
        Mon, 17 Jan 2022 03:58:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36?
 ([2001:8b0:aba:5f3c:aebb:d0f1:6c03:5e36])
        by smtp.gmail.com with ESMTPSA id
 o13sm5637329wrc.5.2022.01.17.03.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 03:58:51 -0800 (PST)
Message-ID: 
 <e2e42bce092c256054de37491276ff955c916709.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/2] kernel: Rework kernel make flag to variable mappings
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul.barker@sancloud.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Jan 2022 11:58:50 +0000
In-Reply-To: <87262ad4-ba0b-3d22-deab-ffff56ca1b84@sancloud.com>
References: <20211014202630.2927426-1-richard.purdie@linuxfoundation.org>
	 <87262ad4-ba0b-3d22-deab-ffff56ca1b84@sancloud.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jan 2022 11:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160642

On Fri, 2022-01-14 at 14:39 +0000, Paul Barker wrote:
> On 14/10/2021 21:26, Richard Purdie wrote:
> > In 2017 we added changes to pass the BUILD_CFLAGS into the kernel
> > via BUILD_CC. This isn't really correct and the upstream kernel now has
> > places to pass build cflags, ldflags and more. Update our kernel
> > make flags to correctly use the kernel's variables. This addresses
> > concerns raised by kernel developers.
> > 
> > If this breaks some usecase please report it so we can work out how
> > to fix it properly.
> 
> FYI, this change back in Oct broke the build for Linux 5.10.y, 5.4.y, 
> 4.19.y & 4.4.y kernels where CONFIG_UNWINDER_ORC=y (which is set by the 
> in-tree defconfig for x86-64). The build failures sat on my backburner 
> for a long time due to other commitments but I finally tracked them down 
> to this commit and looked for solutions.
> 
> For 5.10.y, 5.4.y & 4.19.y there is an upstream kernel patch which can 
> be backported which will address this. See 
> https://lore.kernel.org/stable/04598430-7383-b725-2f5f-3f2b16aaca36@sancloud.com/ 
> and replies for more info. Hopefully these branches will be fixed with 
> the next round of stable kernel releases now the backport has been 
> requested.
> 
> For 4.14.y there is no trivial fix upstream. The backport I did for the 
> other branches depends on the KBUILD_HOSTLDFLAGS variable being set in 
> the kernel Makefile which was added after 4.14.y. Personally, I'm happy 
> to leave 4.14.y broken in this case and workaround the issue in 
> meta-linux-mainline by disabling CONFIG_UNWINDER_ORC for this series.
> 
> I don't think any changes are needed in oe-core, the info is now here in 
> case it affects others though.

Thanks for sharing that info, it is useful to know which versions have the issue
and what people's options are if they run into it.

Cheers,

Richard


