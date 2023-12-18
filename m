Return-Path: <mattwood2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06215C46CD3
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:36 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.45509.1702910848672446660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVdT5WzC;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: mattwood2000@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3ba00fe4e94so2663333b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 06:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702910848; x=1703515648; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a0RAZB/9WKSDLT+aVLeJ4IIBZj+ukRc2ZPnl/7XEZfg=;
        b=gVdT5WzCq+0sgC86avX0anu2Odp7nhDOKdq6benJPllRYVX8WFjI7T5GygecSBNapq
         +tC9rhvHbAc4INvmFfu48s9o9w5wXQ24C5KP4CzvNu8jb6LaNI4eKKH6SH3vb7QaFSnk
         pFeisWhQl+UptVs2dPtObE50FDQL4zk6jDNveIYffXTEdca+EqHTLBRulxtRdEWzb1VB
         MAfPyE8fUxpuiVyC+wRoLcCTWyN1ZxbsIm4zkDyjk5hm1ouWFPNCHwuvieXexpL5Iwx8
         yMFo//GVjp0zXsnVDaKbY4hDebfTKOQU5EUH8MzvTDv7DF4v91YTs1mpnxDshWdoBB+Q
         WeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910848; x=1703515648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a0RAZB/9WKSDLT+aVLeJ4IIBZj+ukRc2ZPnl/7XEZfg=;
        b=CsJGDxQ7nzVunsWhuGTJU88m+6FUNw1E40W8donhvezGZ934i7pvByUyB/3Zvnx6Kp
         TBp30o+yu7X3UyRXcpz1wGmxDN8A2AmbFZcBXTx36nLMEqOQyW134SiEjkGGjJ/gNvqX
         cr23ykvWUWKeWzYyvFTxqQ785P8GvpF9shG2HwH9/d4G/9sji884vXz6dFRxybiStUZ5
         rCboWV/F1CHABe9took7K2k9kVe31ZnjsVvHUI+FSiNFgsIsF5xGkdGkmt2EfxaLghoy
         t54+9LXA50jCNw9wcaud7UIyF9ZPJhnGepMzQCfrk4D/BMyrVkihI8VuGVJ8l671yYbY
         o2tg==
X-Gm-Message-State: AOJu0YxhcufnWVCzrvqQh6JvI5Ok0HNxwTXfcAwH4WOAmTD/n2GcZdCG
	RdSTQqPH7TJ2x4JwwQWwVmQ=
X-Google-Smtp-Source: AGHT+IGfSu+wZeMzk/ZcG/y9M5M8WjlpirEqepvUxo3gBhh0o8UVk4OsD+lqzrKXmSSnMASBCI91/g==
X-Received: by 2002:a05:6808:198f:b0:3b9:eb73:aeba with SMTP id bj15-20020a056808198f00b003b9eb73aebamr21076505oib.34.1702910847897;
        Mon, 18 Dec 2023 06:47:27 -0800 (PST)
Received: from [192.168.0.139] (pool-96-252-10-169.bstnma.fios.verizon.net. [96.252.10.169])
        by smtp.gmail.com with ESMTPSA id de12-20020ad4584c000000b0067f2c373115sm2144280qvb.20.2023.12.18.06.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 06:47:27 -0800 (PST)
Message-ID: <b7bd3234-5132-4e2d-9e1b-5dd4fb969eaf@gmail.com>
Date: Mon, 18 Dec 2023 09:47:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] mdns on musl
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: Tim Orling <ticotimo@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <CADjezmaJ2RDnRc0S34iMMrY+-Ey2zqZ59s_qLXGYBCJu5art5Q@mail.gmail.com>
 <CAMKF1souVOjHqkd15+FX3NMGvggFFrhhR9nGs-BN53Y=yzYbSw@mail.gmail.com>
 <CANx9H-Cts0d7vRqaKSW4rPk__4=iEOG7pffaoUQBFn6mWDfWwQ@mail.gmail.com>
 <81df8e01-1431-4a9d-b478-4256f70fd555@gmail.com>
 <03E28F39-0599-4CBC-ABB8-BAF5732E8A53@arm.com>
From: Matt Wood <mattwood2000@gmail.com>
In-Reply-To: <03E28F39-0599-4CBC-ABB8-BAF5732E8A53@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192645

Thanks Ross,

On 12/18/23 07:40, Ross Burton wrote:
> On 16 Dec 2023, at 21:42, Matt Wood via lists.openembedded.org <mattwood2000=gmail.com@lists.openembedded.org> wrote:
>>
>> This is a fundamental issue with musl:
>> https://wiki.musl-libc.org/future-ideas
>>
>> I thought there was a solution using the mdns package (mDNSResponder from Apple), but I could be misinterpreting what I have read.
> 
> That doesn’t solve the “how does the libc look up mDNS names” problem.
> 
>> I saw a go implementation of avahi2dns, but this is for an initramfs so trying to keep things small.
>> I'll keep looking around but if anyone else has any suggestions I'd appreciate it.
> 
> If you want to stick with musl my understanding is that you need a DNS to mDNS bridge, so that avahi2dns bridge is likely the best solution.
> 
> Can you get away with not having mDNS inside the initramfs?
> 
In production for sure, but I was really hoping to use it in development.  For now I have switched back to glibc and can deal with the increased size of the initramfs.

> Ross


