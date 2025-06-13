Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541B4C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 12:32:41 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.9255.1749817957561432596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 05:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UOCVhiFW;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad8a8da2376so347575266b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749817956; x=1750422756; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yw5DbNSVRrH4XJgpRmyivfhh4yMbmzHe5yNIJuBRkfw=;
        b=UOCVhiFWIJwABNilcv4ci3jQtx3mwAk/a3fu9PHLuNr2FySh9g5JOKcw5frjGxwXw8
         tngkUSbN5Ks4gwaPhNzySlWE1fcv3Fqc0s1aE+Ml13Yc1j6r7sxCOG38xMay0DOLvgPL
         xTe+6G8o0diyPngGDdZMSXFaBJCZ+hhD3oQA+kJP2SDhwh5W1mznTdQf47TjMW/2zjYU
         BrRTERBYqCPHSUfQGnYs0PTMNBdKFsTh+vZh1+5EppOK7qriHIjayWWJ3EwkdGsEZAKT
         uEhl0+O0ciyxLu1auMCVZHsEuOC1NWKLo39u1lDozjwNt6NFY2pol2t2+D8NqVW7vfed
         qK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817956; x=1750422756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yw5DbNSVRrH4XJgpRmyivfhh4yMbmzHe5yNIJuBRkfw=;
        b=XTgJ0/JZZC9gZkqTTszFLyd1UBSacQe2099Snotv5OGX5JL3/KqEDoiV3uzgtsOln8
         pkY+PKaGFYf3gqmgw6a8pru2hzpBoLBzdWOcjzMqvzItsrpocoBOnqHLcPELKX0yz+3s
         663wg7XtXcODKLL68lNKM9B1BKFMEySl5046hChzisdillzjFYsehYXgryfbMgDjFMlD
         YWbeUrCZESAFIdTaDEe3CM9myeQ2E2eR8vn/qsarGinwHFwEAh6+V1yDaepfTOgGDpbn
         fucrb3kPelE8enHipp4pcTnEiMMZEFyFaWJbuACA5dacwrj6UGtgeocQ7XNbsk9HzODI
         +SqA==
X-Gm-Message-State: AOJu0YyI4DiE3GOr+Lo9VBLLlWCgYVo9ZLo92y/nGwlESoL1ptxKfJ3F
	5rXUvPZm02kSxjka3C2ILLgxKUer7l1LR4m7duSqyRLmeG2FbTiY7MZp
X-Gm-Gg: ASbGncv8x0HBsrisMVFLvow6X/DU7fuO/tfLIN+2aVtt5RpP2dW2PgmhIAQJK1CiV/C
	wg0wfi2e+zprmlmq+bJPOoyzU1xnCTs5GEeA89L1G2wfsgn8J28RuC7Tn/OMjZvuJ6b4gObc7/H
	vnJXnW2eCKynEBwjRoLK8YSuJRMLDUkuD8t1LcR05hd/GyFcyNhIVAOLPq1V3M8mcfH4wjXNWMy
	NuStmBMOkzJvolXEw9UYSzqpbYXM4y+arTUDpwVbskJgkSsoAhw3Um97lJi4jcROJmrSxN/fxkd
	Px0xB366+3c7zn9O2gL4WunDJWkQokNZ/HefpgcE4p2TdQM4SsEOpoznYCkmgAzTMYvl7KHA1BB
	4bcdU
X-Google-Smtp-Source: AGHT+IEUcCSSsxnb7faUDiEM3pXKC7xzvmx76MA0sbjMNSWpuqWmWnpGA0POODuuCuMuEPeYu0jSYg==
X-Received: by 2002:a17:907:d27:b0:ad8:96d2:f42 with SMTP id a640c23a62f3a-adec5c3e53dmr300935566b.36.1749817955553;
        Fri, 13 Jun 2025 05:32:35 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c6b64sm123887766b.65.2025.06.13.05.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:32:35 -0700 (PDT)
Message-ID: <a75d2071-2b1e-4322-b4e9-8a17ed913683@gmail.com>
Date: Fri, 13 Jun 2025 14:32:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 1/9] bitbake.conf: set
 BB_GIT_DEFAULT_DESTSUFFIX to match default S value
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex@linutronix.de>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
 <9708ea34-8a8c-4704-951c-d4e8b0973fc7@gmail.com>
 <CANNYZj-hVH+RgfGYVekiCNnGU5-rNJmWp-XZZKx+g_a4Tb=7JA@mail.gmail.com>
 <18489765F96109C1.12911@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <18489765F96109C1.12911@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 12:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218599

On 6/13/25 13:41, Gyorgy Sarvari via lists.openembedded.org wrote:
> On 6/13/25 13:25, Alexander Kanavin wrote:
>> On Wed, 11 Jun 2025 at 20:35, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>>> Possibly the recipes would need more modifications than this, especially
>>> the ones using default ${S} (maybe?).
>>>
>>> I tried to apply it on the current master and build some base recipes in
>>> a clean build dir. I tried to build git recipe (was curious how it
>>> behaves). First gnu-config-native failed to install, as it couldn't find
>>> some files due to the move. I fixed that, but right after pkgconfig and
>>> binutils failed to patch - the src is in .../sources/git folder, but it
>>> is trying to patch in .../sources/${PN}-${PV}.
>>>
>>> Or am I missing something?
>> I just realized: did you take the necessary bitbake patch?
>>
>> https://patchwork.yoctoproject.org/project/bitbake/patch/20250610094334.1653567-1-alex.kanavin@gmail.com/
> Hmmm.... quite possibly no, I grabbed only this series. Let me give it a go.

Yup, thank you, that was it, mystery solved.

>> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218591): https://lists.openembedded.org/g/openembedded-core/message/218591
> Mute This Topic: https://lists.openembedded.org/mt/113566716/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


