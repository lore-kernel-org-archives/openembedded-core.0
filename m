Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540DEC5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 18:10:57 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.20427.1708452654852149847
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 10:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=TTVBCXAu;
 spf=pass (domain: baylibre.com, ip: 209.85.219.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-68f41af71ebso38525516d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 10:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708452654; x=1709057454; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vWEZZaftsnIQtnqexhli+tUIfZwnGkTAPbzxdj4GIEY=;
        b=TTVBCXAu8xI/5C94vKCCGad4sdTPF+xrHGGPgPuu5TYnoSuckD64/dsZJsClc5+ei9
         pRv7Irt76NvPzV98PtP2NuqMjB8mt+iCBTJPUFjWuWmiIv35b/wlsW2xe7JkunJ9GI/o
         IscvfNM+vy7E8pqJ4wsLmjkJrOFmsEiURhYimx7TzRJO1ZkdsBG1rsoFHLHGX0ahn+PI
         wSyDqFyvp3hZbQWWzO5lxE3nA5Sat+ijxQ478oNg3K8dZLvdSAE9uZGzUFh9jH1CWAPD
         a8WdnXmT4evMQOvH8KONAUMzeOyo1KDDyOm0XMa7lXxPHxmpyiSqi3SLFBZL3GdKtoSG
         Vqow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708452654; x=1709057454;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWEZZaftsnIQtnqexhli+tUIfZwnGkTAPbzxdj4GIEY=;
        b=F1NEgHa2EiPIjGqjluTpGpuaLc0wB2mrZaRF1RngffVopZlsEG6+Krqk7tvNdA4cnT
         yBdn6Gj4iIWkg3dnN+8iQyUgCgtmmTxwIPs3QfJ1W2w1VmzeQT1rqXEuqsAm2kKi2sB5
         ukk6Uo+uqu+Rcyv45d6WIcKHJZBMcgtRdXH/lwi1P1tLDxVF1qTFtkmIPxrWJye/Lwau
         ZeiuPEBTDDVyWjzs44nFTNm2P5sP0IWuHh9CN70rVnrqUXs7/CyixExm8LqAxCf6DfDO
         gEWBQasH7Uno/+xaeihImtQeAvZAoRC9wTb9BkssXJhXvRyhBXTRKJYjt6mGwo4U1IcW
         lHAQ==
X-Forwarded-Encrypted: i=1; AJvYcCViPqY8mPn0arlkGGG4S7FvhMWUDSO/a01OqQfRJfg/Tx+mraVpgqdTExQatlU90C4kuZMcVJre44vGGPfAJ0augN4V/TgcNkZrzCDuLfpIzv6pbpfkZU1L
X-Gm-Message-State: AOJu0Yye3MN0WO9ODlkqnPLEnqrisRonRI82Lgr6ZBc7bCKNmAbgNW4/
	IsGov5ypfiO+Rb2uLE6b58g2HjOXex4M7PjO+27UDa8dJbGkTr/qEK4GeZItz2c=
X-Google-Smtp-Source: AGHT+IGNLLCev9OjVTD3fxkVaxrdwC2G5/QI4JeRCRFiDtZ7rltOeaTpluh24TEnJMz/rE0jjVGbfA==
X-Received: by 2002:a0c:e3cb:0:b0:68f:8c18:42a7 with SMTP id e11-20020a0ce3cb000000b0068f8c1842a7mr3075643qvl.32.1708452653950;
        Tue, 20 Feb 2024 10:10:53 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ol16-20020a0562143d1000b0068f92234e2fsm813795qvb.109.2024.02.20.10.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 10:10:53 -0800 (PST)
Message-ID: <41f0a202-1259-49bf-8260-d3c2b5944eae@baylibre.com>
Date: Tue, 20 Feb 2024 13:10:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] python3-numpy: inherit python_mesonpy
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Tim Orling <ticotimo@gmail.com>, openembedded-core@lists.openembedded.org
References: <cover.1708363628.git.tim.orling@konsulko.com>
 <c57f8a02b11dd08758cb9881ae82db985dbe5ee4.1708363628.git.tim.orling@konsulko.com>
 <9ce2c246e5de18f1ce8fe2c81d42c20a3f87b480.camel@linuxfoundation.org>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <9ce2c246e5de18f1ce8fe2c81d42c20a3f87b480.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195922


On 2024-02-20 06:33, Richard Purdie wrote:
> On Mon, 2024-02-19 at 09:30 -0800, Tim Orling wrote:
>> Replace the deprecated setuptools3 bbclass with python_mesonpy.
>>
>> The build-backend has been defined as "mesonpy" since:
>> https://github.com/numpy/numpy/commit/942fb8caf33a65e449fbf198ecf1cd39be953248
>>
>> The vendored meson-python was dropped in:
>> https://github.com/numpy/numpy/commit/6544e33ac7a3a600c2fb565401c811a17ecdb3d5
>>
>> While we are at it:
>> * Drop ${PYTHON_PN} and use python3 instead
>> * Sort RDEPENDS alphabetically
>>
>> The ptests run, but we still have issues with sufficient memory and
>> free disk space (the reason python3-numpy is in PTEST_PROBLEMS).
>>
>> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> This looks to introduce a reproducibility issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4399

Hi,

I've filed a bug for this: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15406

Let's stick with the existing backend for now and I'll fix it ASAP.

Trevor

>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195913): https://lists.openembedded.org/g/openembedded-core/message/195913
> Mute This Topic: https://lists.openembedded.org/mt/104451074/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

