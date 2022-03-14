Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE4BC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 13:45:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.26256.1647265521587935320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 06:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y+a9absK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id j26so24091005wrb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 06:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PDs5VMasHhjG0JFNTEUWMXl821/lgruIo7w59PblB6g=;
        b=Y+a9absKOg9hk1zQe+LQ7zg/7tQtAXeIUivH6TWz4q6FapLZVIlSSIHAIzxsmQAjUf
         FKcfJ64o4m7OchRjcJpOilE7oqHBXFlHedOgwX6Ssgdpp6PG5zHAI36O8ZBzN5DhO26F
         xi/2IqLZt9AoEuC+lkWtc4M/A8RuWxMm2fYh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PDs5VMasHhjG0JFNTEUWMXl821/lgruIo7w59PblB6g=;
        b=aAo4/W/P5yt+lSAB7oS91ezVWtdM9lPhkJb711hu4VPGHA1iJIlIQnSpc83sopRdHI
         mau89toTvuMnynqZr72IREpTPFieuPpPAORN1z24L6XuQ3kRuI7hkVukRQDCe3xKLEjI
         Kme9fwr5TdSkhfU/pdpVwEwLfiQ9gx5fyE9ns57imhRnAOW2tG2pCi7v3XIDfU4O2ncu
         cSI/Ei6v0n1bA9upKf4JTrPO8m+Q9MzbTytJEfn/8jKQzBGn9laPfOIH3hiPwZuuxJ58
         jC3lvgmL9Y9orPieXj8e8ddl//cIvCyhwrGUvEIyhXOr/riobn/2OCmGD2Zg7niS14j4
         lhvA==
X-Gm-Message-State: AOAM533yC/OmPul9ytL4+Tx3EFccwu7Xm/MYMMU7iyPiMwemSV8zclWv
	mZTgDCnbix+6zF318L3t97ktcw==
X-Google-Smtp-Source: 
 ABdhPJxI2hxHnlJVJIniUNbDQ/UkIr2AOYa0Qp7TxI0nw3iM9wKp61KM2/B7Tv11IWQVIRTjUecJQw==
X-Received: by 2002:adf:e6cd:0:b0:1ef:db24:7ad1 with SMTP id
 y13-20020adfe6cd000000b001efdb247ad1mr16102746wrm.233.1647265520034;
        Mon, 14 Mar 2022 06:45:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5edf:6bc1:541a:c26f?
 ([2001:8b0:aba:5f3c:5edf:6bc1:541a:c26f])
        by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm58256wmb.1.2022.03.14.06.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 06:45:19 -0700 (PDT)
Message-ID: 
 <af998e903fb8c67e2c19adcc59225b84e1f92384.camel@linuxfoundation.org>
Subject: Re: [OE-core] Building python3 without readline fails for Kirkstone
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Mar 2022 13:45:18 +0000
In-Reply-To: <1fcdfa7197764e3ebeeb5ace0b99a550@axis.com>
References: <1fcdfa7197764e3ebeeb5ace0b99a550@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 13:45:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163139

On Mon, 2022-03-14 at 13:39 +0000, Peter Kjellerstedt wrote:
> We have readline support disabled for python3 for target. It works 
> fine for Hardknott and Honister, but fails for Kirkstone with the 
> following error:
> 
>   The necessary bits to build these optional modules were not found:
>   _curses               _curses_panel
> 
> The problem can be recreated by adding the following to local.conf:
> 
> PACKAGECONFIG:remove:pn-python3:class-target = "readline"
> 
> and then building python3.
> 
> Any help to solve the problem would be appreciated.

I'd have thought that those modules being missing was probably expected if you
disable readline?

Cheers,

Richard


