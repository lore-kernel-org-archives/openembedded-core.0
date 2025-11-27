Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED45AD11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 10:46:15 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15949.1764240371569557024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 02:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J9AijKPt;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-429c4c65485so679575f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 02:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764240370; x=1764845170; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wqc1ecUyW9WMX52o0FG4qQm6X2Q9bldPUCnwpmYm9NU=;
        b=J9AijKPttUvMQsSXWU9+RZT+ur48QW0NiC9XOeZ0HYk6LCiN6HIMIGo/UdDmgS+lQb
         PzJpaQ3WhgdQ0TUQx7LtfL+nVX/sct5oiQxeaFDZuDrilUnftaFXne16Q3Dab51S5gR4
         kNmiJ0FbXuKIMg+EnvH4Ts3VzqewQIKvc7vS8SJZZAUMo4GNlHrGQ8zm3fi3rr2ZFpbK
         kG4MPBmuYu74TcYfYrpOS3lOnUwubqwurtNC6ke/eMV2zx/NgqtnbdAjc0TB3zlqwi2X
         pP8IhsUt4SEF4ZOBgofACpvTstwE9XzJp75oVJuk7L6A2wlDy/lq1cn4GkrYhxCbTi1c
         pupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764240370; x=1764845170;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wqc1ecUyW9WMX52o0FG4qQm6X2Q9bldPUCnwpmYm9NU=;
        b=KFfui2TDDDG6xggl3I5tlqFJYhyPnDrdBIfsC1saUSNHH/vEi2jD3trKzsfS9+gBJ+
         bA0pGhNc46Dw+DOWXH0dwIras5NnkQdBeqrRgOpABTw41z94gRzw3kH+ASw5TS8wFMRv
         iLxCF7SLp9IPLUqIm7dvuzqhY6U9IdtmyOwK1vcaxko7o0jr982fCEHz5jwABglFM6DK
         6U/BMTvO4EiYGu9PFbLPfiSjzODY8iYoNSLGjUa4TiyxOeNlZDSC3EFpUXYh6KXOp6YB
         5rIovuW0b3t+TzfDr51BVZtiKaLsh34Q5tX6KpICb3lHU0hF9hzLCB41b12lfpoIbnoA
         UwMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoLDy4pm5Qu9xN/l4pHjFP2LlnItH/jCCaXwm685I7w+7I1QpVBsJVnI3ADRFyGxcg4WP3Ww8LMBFmB3qlbvDF1A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzA0r63/RP9OpWjC2usf//fYDO2JRfrAA4t2/NzvYHUwLPkzqYs
	n9SDkCzg1IoWVgHeuKbilLhf+Lm/emTCX1HqDC8oJnz2PvC28mmz7ezF
X-Gm-Gg: ASbGnctVqcGo0Xm5yUouFLqJLAzHfDD7qvGfA7sfZqinXbCZSGZ6B4WADTRj6KIEi/K
	w1pNasN0dr3WUktumBg/gxEhUnPCjPJw1fjC1TP7aCk3HifVzytj023roGIT6B2vyVKWwiiO+/q
	CNaDoeyxKaKGJ6BmjMrBFEs/t9lQEbVYZ+JQfDhfrcbbpa5EgFKpPdQzBOM5kFUvNQeZ+4+mrq7
	5o8Zc8SBChYzmY/adbjZRQGOg6hgNnggcE9jAw6vOmaLD2XBOEkewy0mkcc6v8sjzMQuiwF9Mwr
	tyuT0hUHcUoDQASkLAWsCruEnbRLDLdsPBOh/lP62pMV8ZQWRTyrEUw4PdiMfPSm3PuHS8WcQCc
	vs0RhLgL/8jY7fnilI9WGcXRdtF9+vZoECbp+e/L43sRUy/tRPCbXIDN2/xDPhOrnRFdA94y6qP
	sMjaCs1AdHMQCPUSBcdg4=
X-Google-Smtp-Source: AGHT+IHmEWxEVfUvt6CCZl1+12RFI9HL3E/XIIPn3guqGjEgOTQgMVeqIHF506xZ0xm/qfqIiZawyA==
X-Received: by 2002:a05:6000:2c11:b0:42b:3131:5436 with SMTP id ffacd0b85a97d-42cc1cedb16mr23496335f8f.16.1764240369758;
        Thu, 27 Nov 2025 02:46:09 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a2easm3065632f8f.23.2025.11.27.02.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 02:46:09 -0800 (PST)
Message-ID: <73131023-79db-445a-8341-0b455dd586f6@gmail.com>
Date: Thu, 27 Nov 2025 11:46:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] linux-yocto.inc: remove riscv-isa-clear.scc from
 KERNEL_FEATURES_RISCV?
To: michael.opdenacker@rootcommit.com,
 OE-core <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>
References: <3a1b9adc-9ac6-44b7-824f-10f5e08f6d37@rootcommit.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <3a1b9adc-9ac6-44b7-824f-10f5e08f6d37@rootcommit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:46:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226830



On 11/27/25 11:20, Michael Opdenacker via lists.openembedded.org wrote:
> Greetings,
>
> I'm getting the same issue trying a master build on several RISC-V boards:
>
> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Feature 
> 'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will cause 
> configuration failures.
> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Check the SRC_URI 
> for meta-data repositories or directories that may be missing
> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Set 
> KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
>
> OK, I can set
> KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"
> but is this a clean solution?
>
> Where are all the arch/riscv/tunes/riscv-isa-*.scc files supposed to be?
> I didn't manage to find them anywhere...

Do you have the yocto-kernel-cache[1] repo in your SRC_URI? The scc
files come from there

[1]: https://git.yoctoproject.org/yocto-kernel-cache/tree/arch/riscv/tunes

> Thanks in advance
> Cheers
> Michael.
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226828): https://lists.openembedded.org/g/openembedded-core/message/226828
> Mute This Topic: https://lists.openembedded.org/mt/116498794/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


