Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BBC5C63686
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:56 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.9192.1649924686492842499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IdOHNtkm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id r13so5841361wrr.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Apr 2022 01:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xOSZ8NwcxwJ7YB5nJ60x3gFuR4NB5nQ5MTa00habGOw=;
        b=IdOHNtkmqY8+7FLl+TkVG2mmDPsbF9k09Uy3i2hyPoGuhsPrUX9Gj/YUGbjxR5k4E5
         A1IiFaJEg0BsZhCDnNvZUdnxZqVUDtACjbibbsjaj+69QtGksSVP/v94lZwXQDG7ue1B
         3LDZ0E1qY7/3x9zIjee7MK1+li7WTOidKOWH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xOSZ8NwcxwJ7YB5nJ60x3gFuR4NB5nQ5MTa00habGOw=;
        b=1nBZ6xoVaPdyI/SOtFaewyJ0N1mtORlWTwwa16LyQqDeZwKOzau+2WPt0mCERBxbnr
         GjV+TyjltJm0MdMDwuTBbmtCztDMkMymg+Tv9vI0jCerQTZ4bv318U1lT7PKoggv0O7b
         irI7qnlbSqyGfgwuSH879IuPPmrcKfo2TMPlb4mou/5MmvXcXehax0GWGiErms+8EEQv
         wMLb6K3ox3fXBA93qnTq0t4vmPdZ2UKFq66KgBzq1SZvMmXN4BJvQZBg0b2bGocfW2GR
         qtR76wj55nBcFX+06nupsdLcZ1GknBVaFiKwqlKAir5iFltrEj4whFauaVl4f+qvtkd3
         77vA==
X-Gm-Message-State: AOAM532CYJE1m5MSeZ3w1LvzWEoFOqAtvtUj0OxLL/bHiypqPtM03FOd
	S7D3+IPbB5fcO41M5u1YgWk/7njSlOQ26A==
X-Google-Smtp-Source: 
 ABdhPJx6ZgQ9erpRN13CIM6fp74mdJeHoqfro1ellK3NU3gLnRFcCdVPbqbQQ1lzq2ACg6oaFWFmlQ==
X-Received: by 2002:adf:d1ea:0:b0:20a:2823:9e22 with SMTP id
 g10-20020adfd1ea000000b0020a28239e22mr770906wrd.332.1649924684461;
        Thu, 14 Apr 2022 01:24:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:353f:5203:2a56:f190?
 ([2001:8b0:aba:5f3c:353f:5203:2a56:f190])
        by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm1457175wmp.44.2022.04.14.01.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:24:43 -0700 (PDT)
Message-ID: 
 <3aecd18edbf93fdc9b1ef46d510d02f57660ffc9.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] ccache: Fix build with gcc12/mips
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>, Alexandre BELLONI
 <alexandre.belloni@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 14 Apr 2022 09:24:40 +0100
In-Reply-To: 
 <CAMKF1sp=C6PieVv=cMZYppQgpwcq7A15AjXAZvHEvtGMpD1geQ@mail.gmail.com>
References: <20220412170331.3234683-1-raj.khem@gmail.com>
	 <CAMKF1sp=C6PieVv=cMZYppQgpwcq7A15AjXAZvHEvtGMpD1geQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164396

On Wed, 2022-04-13 at 22:48 -0700, Khem Raj wrote:
> Please drop this patch, since it was a gcc bug which has been now
> fixed in gcc trunk [1] and we will have this fix in gcc 12
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105234

Gone from master-next.

Cheers,

Richard


