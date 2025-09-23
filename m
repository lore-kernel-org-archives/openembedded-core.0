Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 670B5CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:42:21 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.15929.1758631300680638137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 05:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=w2u1lTQy;
 spf=pass (domain: linaro.org, ip: 209.85.218.44, mailfrom: tudor.ambarus@linaro.org)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b2e66a300cbso321221066b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758631299; x=1759236099; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i4Nt2aE4+GhEcqfBjIWNS2YuIKT2pRAkxhM6B8mRhWE=;
        b=w2u1lTQyOVbFeDjlOH3mXMC+lTE+w3IO/k49QSmF/KtC+x15+7D4seJ6ckoSDBtVbc
         skGHiJSlCBPfs6rFKKklaWL8m6BHCK1DF43P66DZdWwUu467k8qf/ROSWtH7X6WiOgCL
         K3Y2ej1uSNVbE7ecbzRyO8YXe7fj73kbrVX7m55rVJOV47t5DYESDbs6T3AfSnIL2X3G
         XSJDoOcrVvegdHNh13dvuFQMEoXYHTBhwOza/rO4YBT3M3IrFC9RS01rjDYI2QgAsC3v
         tyawvvllEgJulvxixdP98fGGTBnWul7yPzQOk5g0CY3HDz5+TLExWu6bHk8RdCgLTUJ6
         IcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758631299; x=1759236099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4Nt2aE4+GhEcqfBjIWNS2YuIKT2pRAkxhM6B8mRhWE=;
        b=Fil4nUNLUuRE3f8mmxfblTdZWKO+yWnahxcURC46jmVxuA6T7CiFNlmDqmsGOZNliJ
         1OvtvnKub5iudFxhzczpZRpE2Gjy1HzdmsAbnVstU3ogZj20WAVqD6q3La2g+JMM5y7c
         BYCmD8E/2O7Tfxt0Wapp23jwzfsGNSHiNhgtITuK1zBbuAQKxk89Nuv+i1UZCFQUuQc6
         zznIlNNGaxdDbvLB7K/alPC48Nf97Tvh21tc9/cQiWLgQx0b+zun3XW0U2fqHjC2ksky
         4z4YJc8pcScFZcSU5+hLRhLU1XdSdou6NGbBa9UYQOx3L/qdfoEuyXYMrWDv5h0KoOY5
         1KRg==
X-Forwarded-Encrypted: i=1; AJvYcCUh5QEBYQjX5F0F2ZJIwXhsy9P1JehiV/63kQf8R0IFJa5aDqJhs+4jkPlaDYvjhn59aDL/WYgiqVwOoIGYByWEBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YycNFxeCeNXmoB/bTVOkg5mlroSWLN2BkEXRSkAaTb2KaUe9z3O
	RmEaGBH5t9XkgOB8UiXX37WCoUGl+IOzH2CVR3OZDZu3QDgimlPNipRTMqB1ex3gF4IwxXn4/No
	Re6MA
X-Gm-Gg: ASbGncsGZ7isB/eJYPGFc67/JBc29j8ifSMwJvSgzFzA2wQ1//ZyYbPfsn6Iy5OPMSJ
	HmgLeHrcQpN2Xu1RtRCT63TNX9PU0MlGnswSVVmF9VObm2sF6QlEz1UqdQufGZU+LPWQqjSWbyE
	tJoLLfmUTrrW8g8lDVdoI0MiCPqG3WKvl+D3mQuU+TPGGCfigwDvylMQtN8nKZJ/YhUgQUVkyOe
	mP3KC0ZJy0DC1ert5iCRJrxopgONwBVNJLvgMFtI1drXqrFt9eqO4yW9UJgpwuPLF1R0Btgn/eN
	bpEQyEVpZDlfo8xt86x9rmDbij4dLjWI4Sa++MqB7xaBa6kjykuTcxgV6y/kUeoQSMVcS3/ppsL
	NIUonBSKa9D58dXKV+GfX0NZRmBcaxz2+
X-Google-Smtp-Source: AGHT+IGGkyVw1JEwtjgLnjEMMR+HlzzSu9oud2YrHkKXHx2riff/TrK9JM7D7qf4aeK0cUVpqB+jfA==
X-Received: by 2002:a05:600c:1c05:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-46e1dae0d4bmr21053925e9.37.1758630965019;
        Tue, 23 Sep 2025 05:36:05 -0700 (PDT)
Received: from [10.11.12.107] ([79.118.185.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1fc2fb59sm21195245e9.4.2025.09.23.05.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 05:36:04 -0700 (PDT)
Message-ID: <edd6fa44-ee62-4bd4-afca-e862507c23f5@linaro.org>
Date: Tue, 23 Sep 2025 13:36:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add lz4-native dependency for Image.lz4
To: Quentin Schulz <quentin.schulz@cherry.de>,
 richard.purdie@linuxfoundation.org, openembedded-core@lists.openembedded.org
Cc: peter.griffin@linaro.org, willmcvicker@google.com,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20250918-kernel-lz4-v1-1-b40ccf21bbe3@linaro.org>
 <2bcb17c0-d527-478b-9692-00a043a4608f@cherry.de>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2bcb17c0-d527-478b-9692-00a043a4608f@cherry.de>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223898



On 9/23/25 1:29 PM, Quentin Schulz wrote:
> Hi Tudor,

Hi!

> 
> On 9/18/25 3:01 PM, Tudor Ambarus via lists.openembedded.org wrote:
>> [You don't often get email from tudor.ambarus=linaro.org@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The pixel6 kernel build fails with "lz4: command not found"
>> when KERNEL_IMAGETYPE is set to `Image.lz4`.
>>
>> Upstream commit 0c7dc5bae1 ("bitbake.conf: Drop lz4 from HOSTTOOLS")
>> dropped lz4 from the global `HOSTTOOLS` variable. This meant that
>> the lz4 binary was no longer automatically provided to build tasks,
>> causing the compilation to fail.
>>
>> Add a conditional dependency on `lz4-native` directly to
>> `kernel.bbclass`. It ties the dependency directly to the image type
>> that requires it, making the build more robust.
>>
>> Suggested-by: André Draszik <andre.draszik@linaro.org>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>   meta/classes-recipe/kernel.bbclass | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
>> index eb03424dfc3e023842f7b67ef47468210af72cd1..003a155e794388efd3fa29c2c946b18542f4cef8 100644
>> --- a/meta/classes-recipe/kernel.bbclass
>> +++ b/meta/classes-recipe/kernel.bbclass
>> @@ -20,6 +20,7 @@ DEPENDS += "virtual/cross-binutils virtual/cross-cc kmod-native bc-native bison-
>>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lzo", "lzop-native", "", d)}"
>>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", "lz4-native", "", d)}"
>>   DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.zst", "zstd-native", "", d)}"
>> +DEPENDS += "${@bb.utils.contains("KERNEL_IMAGETYPES", "Image.lz4", "lz4-native", "", d)}"
> 
> There's also gzip, lzo, lzma and xz support for aarch32 per arch/arm/boot/compressed/Makefile.
> 
> Additionally also bz2, zst and fit for Aarch64 per arch/arm64/boot/Makefile.
> 
> What about adding those as well so we cover everything?
> 

I guess that would be alright, but maybe in a different patch? This one
adds back something that worked before, but no longer works, the others
are an extension maybe?

Thanks,
ta


