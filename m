Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA911C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 04:08:34 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15382.1784606913445337459
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 21:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IvuTUhX8;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49558ce01afso17220815e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 21:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784606912; x=1785211712; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9s1hkhe6SjnLe10J8FJXkVSavPyO390Rp/PAXl5WCGo=;
        b=IvuTUhX8oBMsRvDv8TxkZOHu+aGAP2SEOw0BVYRU+kvRxPVwMGvvijM3HrosrMXiBY
         CqkYPZTXKnxDdCdulPJazk9GiPLVlzw5oneywkE0apMZRtfQ5Cb2CAHrKtwf6B7W0yPi
         1QW3Liwzwxs14XO3QoaA/2hvk5WNxndLLiGS8dDNQmjk9Zi06P7g+YelIruqM2R81p2X
         U+BKJWqA73dXlxhIMd1odtwTBIRkR0nta0oH/XW8UcLxSB+wnkYuOq7ScihA0PvQ7SG5
         dPyJPslCXsQF1A4rmmpSwpivpKZdXI3Dx7ej3JG1L/hKSiGunHvfLfqs+DgGhwVkC8+E
         e+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784606912; x=1785211712;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9s1hkhe6SjnLe10J8FJXkVSavPyO390Rp/PAXl5WCGo=;
        b=D0AJDqT0C20ssjgLhvuU2xCB6pZ1DDjatkjIj7xdswuR/mlU55z9B4CCaliB67NTkz
         wt2tHF7WhEG89XC8G/a4jnwF0n8khILr9GuH7mSHXhrjAnUYPS44/lHSefL93IHb3xi3
         Lt4uKXNwsxSCPRlhjq7guklkPf/qUVA1XUcKF1nzPh0yRf1P1RZntV1ndp4LPOITf+Ro
         u9FHNTeq2WeQ9U8JES9oyA+pfQUZZVio0nEaR/RSpUCgUz+j92bLjJF5fIUDkyFYZEct
         m6D12CnglNSC3bmaLxzdaEgFj/zd88AebHc5TjekVhbBERHZLM4UUo5GRcuYqtDaBcOD
         RBMg==
X-Forwarded-Encrypted: i=1; AHgh+RrUrQJ5fCputyLWQ1PsdEMRZzk2nXcqEYFTL36lBUJy7AEDzz+GQldQu6btDLG8gFwiipEmhUcQQB/MvI8/lhNz0w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmucpRW3c4jiXc5SchWaJsar7fMQ0XNfP7F42kg9boG6W9k5gk
	OugC2+Id9TIphjg/qRzRPAzbGMVbZrjWKUivJJn3xE2xtg6mpoNl4/wx
X-Gm-Gg: AfdE7cn5/Ck5rASvUnCWOVLCTEGjJrDzYntEwX81XjuNJNe4O28Txznln4KB5fS5OoS
	XuESgp54vCaefvUTu1unKnb+uT7r9bvvoM/4D2gfzH8UBrRJIcxDDYgx4VglE+XLjR8Ee1e2dg4
	RX+ANwHb8lwIEZrP50Q1nguh3TOboBrXVJHkgnLYKlSGv5Rvf+sm/8YxMbR0BXETN5WEKcFOdAg
	dLhCH3HP8Nu/6eZz7PoS3IeIWKrzANmi/xPnzw1w6+zSwXC2s+FxSvmIvosc18pRuOEPmT3ul7n
	n4gkq6a1gn9Pa3yRNixHYinQRhCEk2DLOFc3ekTIVTXqKekPBGhCo3DDk4WMYAS/qh7FCbewqeq
	f+p6oqVTKZR4y7Ju+rKkKDPrXsMpNE5VkNeGznFQGiNvCn6P8QfO8iGaT4NxZgzfyv6KqKcZkgH
	GFYLNUj0Jv7m8inrpUW6VsjHyZRgE7e2kG
X-Received: by 2002:a05:600c:21da:b0:495:3e08:ad24 with SMTP id 5b1f17b1804b1-4954a51b524mr130044135e9.33.1784606911481;
        Mon, 20 Jul 2026 21:08:31 -0700 (PDT)
Received: from [192.168.2.123] (BC24447B.dsl.pool.telekom.hu. [188.36.68.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f69e5eff1sm25969317f8f.19.2026.07.20.21.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 21:08:30 -0700 (PDT)
Message-ID: <49803c8c-9850-46f5-a554-3ad8700f9ae6@gmail.com>
Date: Tue, 21 Jul 2026 06:08:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] mesa-libclc: New recipe for forking
 libclc for Rusticl purposes in Mesa
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260719080108.1290998-1-zboszor@gmail.com>
 <20260719080108.1290998-2-zboszor@gmail.com>
 <4e508b63-8c6f-4b61-be3f-f47981e1bd31@cherry.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <4e508b63-8c6f-4b61-be3f-f47981e1bd31@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 04:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241495

2026. 07. 20. 16:43 keltezéssel, Quentin Schulz írta:
> Hi Zoltan, everybody,
>
> On 7/19/26 10:01 AM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> See the reasoning and discussion at
>> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43020
>>
>> TL;DR: LLVM constantly introduces breaking changes that cause
>> regressions for running OpenCL CTS with Rusticl and finally
>> Karol Herbst had enough.
>>
>> This fork is from the LLVM 22 version of libclc and contains the
>> necessary fixes to make Rusticl pass OpenCL CTS.
>>
>
> I think this may be too early as this is still pending upstream and is currently not 
> receiving support from at least one person involved there.

That one person's objection is now alleviated by not requiring
the mesa-libclc dependency exclusively. It was replaced by
a runtime check and a warning when not running this fork.

As a result, the mesa-libclc repo was rebased twice since I posted this recipe.

So the MR is still definitely in flux.

Hopefully, by 26.2.0, it plays out and gets backported.

> Also, aren't we going to have an issue if we have libclc AND mesa-libclc built at the 
> same time?

No, because they install differently names files or into different locations.
For mesa-libclc, the pkgconfig file is renamed and the install path
is ${datadir}/mesa-clc.


