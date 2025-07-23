Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E58C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 00:15:42 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.2583.1753229736052331624
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 17:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUwS6YUs;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60efc773b5fso3857050eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753229735; x=1753834535; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JniC4SVVx1YGOyP4HI+F0SAjhpMOxsW0ZQpRX8CbvQQ=;
        b=fUwS6YUsMiHQlo5jw1C1fBfC87wijWfNdGf7QR53CXfQ+MouwB75bKqeEIaXs9vt9P
         NZ44wBjGdPmwQXZgQROvaYsVEsSH11PsFOEb4/NkyOszBvE/freqRipd4Bt7udgWQr/Y
         Udl6vesmLsiqMSdk/rRzMrXW+AO58wsr5zgDEeb5F2tHrfzcnHxajx+N32T01YlVb7s7
         eUnDiCbYjM/XngYtZdvoTTd0Gb72PAG4KLglQq7ze097DP3Jub7ZsIIKfMznzw0NDFsn
         5bXUEvSrbAvFfxfb50MILClcTKX9BijSGYcim4nYwyw0vmopc44LhLCoAyElflg91hMW
         Gb3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753229735; x=1753834535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JniC4SVVx1YGOyP4HI+F0SAjhpMOxsW0ZQpRX8CbvQQ=;
        b=r3FNt1+H3DNEWa/enXVb3281yu9R9z6ML3lf0sfGmUoUrHxTJBwwdPPg/b1oXYijU3
         L8C3+72W45SEGFbeL3xhg9/dhjtXmbB+PCuFJ5jws2f4awqM3NX1o43qqsyO6sgVI7/U
         Vook6jffUp5g4+YvR8QwD2OXFN5RbZXs+YEc1o6heSYbKcVwudt4js7lgQivKtgYWfyv
         XVr0FDTG+Zs/nqawEJ20hu3B818w3y28r4dhixGJWZ2YeQgceVwu8BymragBlw9v7YQh
         eKQYBw2qqcoY+cSNLYaghrNI0D6uXS/VW8DBo7E9IadWQJ7ZfCnkFz2+M0UsRFiYzuny
         gswQ==
X-Forwarded-Encrypted: i=1; AJvYcCVb6qB8Obyk7unjGW/OEBS0+PHMcVGd4A/+VamHcEohSu0djIZs1Vfoa2X2L3daQy68a3lWo3ZbZs9hFtG33yOPjw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9Q0SK+Srz4WAK2x/T2cOBxZm0KE4bGW4GlEcrG8cc5SmdprxF
	n4ul/bmFN+Le4/wDeg3i7mMa7G5mhq5hM5PJiQEnbgvDCCTJZV8jA1BJ
X-Gm-Gg: ASbGncthZAZL1ht7NFc2DHpTHTsgmLDa+9al/EuGynjuyWdBrs9yB4v7jJ1uuXP45wF
	smd2Hn0hOh9idDRjFJ75EqIsZFPR8gg7GywtNLYpi6Y9snB9tLgiIbkljVPtVTEUooSfdKsg1su
	JbiHNfTJ44Iy1XoDC+C1PSxtQoTNbNgotwug09pN4ChHkPIxD2S4368LN0JF9ct/9Y3hJrtIHqR
	0i7gR6gY4WUgBvNgCgddVV+ez68zV6uoe+FHl9l+CPMaqm6y92S+Umdpe4t4T3rtDuXvd+LV6Jh
	qT7pg8M2dAnq4lYKjBhqXRhQxJ3Ht0gGVxsNjEnqP+2nl9xwGmJxAaDP6n2WBBI429KAXJ/apsJ
	AH7bEoDAY8QAaS8LcLZW3RL6xq6BiP007oX2CN5TUeEZDwndb/m9LL/EELceadDQi72/Gs/AMhd
	ZZruB6wuY=
X-Google-Smtp-Source: AGHT+IFMKJLlkguttTUopVo3o1nh1O1sbAH8jJdW5PpLR0CpcefAm7h/kUoSg5gG8Yzaj2qURLnXZw==
X-Received: by 2002:a05:6870:5489:b0:2c3:f8e3:bdb9 with SMTP id 586e51a60fabf-306c72e3e50mr719040fac.28.1753229735070;
        Tue, 22 Jul 2025 17:15:35 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:3526:883c:c31:cfec? ([2601:646:8201:fd20:3526:883c:c31:cfec])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-30101cd81b0sm4803218fac.16.2025.07.22.17.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 17:15:34 -0700 (PDT)
Message-ID: <bbc32afb-93f9-4fb6-bdfa-879aa5548a50@gmail.com>
Date: Tue, 22 Jul 2025 17:15:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] feature-arm-crypto: Add +nocrypto to -mcpu when crypto
 not in features
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
References: <20250721165844.3092533-1-raj.khem@gmail.com>
 <1af2a290-983e-49c5-8c43-dfc0f46bd746@cherry.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1af2a290-983e-49c5-8c43-dfc0f46bd746@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 00:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220759



On 7/22/25 1:37 AM, Quentin Schulz wrote:
> Hi Khem,
> 
> On 7/21/25 6:58 PM, Khem Raj wrote:
>> When crypto is not in tune features then add +nocryto to
>> -mcpu explicitly. This makes the behavior between clang
>> and gcc match. Currently -mcpu=cortex-a72 has different
>> behavior in clang and gcc in terms of what features are
>> considered default. Clang's philosophy to enable common
>> features but maximally, gcc on other hand takes minimal.
> 
> The docs seems to be saying the opposite though?


It was in contrast to clang, not CPU specifications. clang
tends to enable more than gcc by default.

> 
> https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html#index-mcpu-2
> 
> """
> Many of the supported CPUs implement optional architectural extensions. 
> Where this is so the architectural extensions are normally enabled by 
> default. If implementations that lack the extension exist, then the 
> extension syntax can be used to disable those extensions that have been 
> omitted.
> """
> 
>> Clang therefore enables crypto with default set but gcc
>> does not. crypto is optional on cortext-a53 and cortex-a72
>> while, this is not as common but Broadcom SOCs in
>> raspberrypi3/4 have dropped crypto for cost reasons [1]
>> This results in illegal instruction traps [2] [3] when building
>> components e.g. chromium, qtwebengine, weston etc
>> with clang using -mcpu=cortex-a72 for rpi4 target.
>>
>> Adding +nocrypto makes it behave like gcc does today. We
>> do have separate tune if crypto enabled cortex-a72 cores
>> are to be targeted (cortexa72-cryto) as DEFAULTTUNE
>>
> 
> Not entirely clear from the commit log why we apply this unconditionally 
> to all arm cores now.

Well, crypto is add-on which was optional earlier (armv8a) but
is part of CPU in newer cores e.g. arm9. I am not sure what more
we can add here.

> 
> I guess it could be as simple as adding
> 
> """
> armv8-[ar] and armv8.[1-6]a have +crypto and +nocrypto support, so let's 
> explicitly disable crypto whenever it isn't requested.
> """

They are not limited to armv8, one can specify them for armv9 cores ( 
e.g. cortex-a725 too

> 
>> [1] https://forums.raspberrypi.com/viewtopic.php?f=63&t=207888#p1332960
>> [2] https://github.com/llvm/llvm-project/issues/85699
>> [3] https://github.com/llvm/llvm-project/issues/90365
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Cc: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Looks good to me otherwise, so
> 
> Acked-by: Quentin Schulz <quentin.schulz@cherry.de>
> 
> Thanks!
> Quentin


