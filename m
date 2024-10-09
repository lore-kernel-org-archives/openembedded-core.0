Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F2CEDD85
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:30:30 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.11965.1728465629862147246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Oct 2024 02:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@dynamicdevices.co.uk header.s=google header.b=B75Itc7I;
 spf=pass (domain: dynamicdevices.co.uk, ip: 209.85.218.53, mailfrom: ajlennon@dynamicdevices.co.uk)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a994ecf79e7so56078566b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 02:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dynamicdevices.co.uk; s=google; t=1728465628; x=1729070428; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1z4ngbRLaX/O0FiHlCCKhRX3ytUJuGaxpdZvOX3WyQ0=;
        b=B75Itc7Ie4p/tmeJtU4JxQYPzHMY0Q3iTMNF0O2L4PHs35NIoAujMkEAfS4omjVCgu
         +ICZ1rvnlboyNWUn/Y0BCsaW5VlUfNe/0HqSs5FcMEQ0PS/01Qj2oTDpX3oTNeRFYq1x
         FOXBqortMr7hWEs4CZe1uVgTM9XLUwcq0ZCLR/Ird2kHtTksZiyp4Ah0f1kHYxnbrc1a
         tS8vkQh4MaF2QdfFlQGkVt23MpsoayxzSLwo/SHFD2ygu6kquvIpPHNh2CpIqfOsbum9
         +QNoTgsIL2CygSRk0GCs0ezafjXgCI5N8ITWiupYKyGp8nVOmW/HVnqq6aF+0bMT7Yq6
         NWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728465628; x=1729070428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1z4ngbRLaX/O0FiHlCCKhRX3ytUJuGaxpdZvOX3WyQ0=;
        b=c5ERlKOigdRO+GIAXPYHpBtxsqk9Yk8LfjjIAsicujNIYlURj/NZNztna/ctdQUv/C
         AQEL9novjx10S6HczBrQ/GVBROZ21XpZvNOlgVWbLn2th+Py96StUsOTJEGBBd7gMXxb
         D1enVEGUgtV2eSYdrgiDVZwKgDOwihgNEM82ka0zY0sqPx063YtHBKS5QEa1WYnwxQA7
         Nr/SG6xcXfk4Yq2Kqupf3AdurboEyy3uPHzjY0V9y/bpRpN1Kgz3zYO4MQ4OddvJpyLH
         YeC1E2v72VqWTzRY6IDRkf1DMYZj15fLyO1OpK2xD9WBEe0lqtAZ+DrPrDVPkhTw30DD
         aBxQ==
X-Gm-Message-State: AOJu0YwrnPljBAl2AxAAG62v0KuO6ASLjSfE9fpGtEYHX0O9Vhgi5vZX
	1D/wyiE+q3u4nobdKVcbdcVhN7dfm/RG1rO6Wr4D/aNyV1EIQu+7xxiXEBGXUuY=
X-Google-Smtp-Source: AGHT+IHUxotE6sKwM6DeR+kPmJwPfUqjttGcvx1guN6TnsMRGkfaIOQVI1s/pC+PiREDpO7SyeA0xQ==
X-Received: by 2002:a17:907:94d6:b0:a99:7736:f14 with SMTP id a640c23a62f3a-a998d314e85mr137417466b.52.1728465627985;
        Wed, 09 Oct 2024 02:20:27 -0700 (PDT)
Received: from [192.168.0.54] (cpc110923-live30-2-0-cust643.17-2.cable.virginm.net. [86.8.146.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99309aa6afsm621059666b.112.2024.10.09.02.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 02:20:27 -0700 (PDT)
Message-ID: <89e10295-dd91-4c85-b28d-dd1214e3d08a@dynamicdevices.co.uk>
Date: Wed, 9 Oct 2024 10:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [styhead] gcc 14.2 fails to build for cortexa15t2hf-neon-poky-linux-gnueabi
To: Khem Raj <raj.khem@gmail.com>, zboszor@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <8d4ad42e-eed1-46c0-a255-2fef4462ae96@gmail.com>
 <CAMKF1srVfpkFB5fXWg=FmyROvxpciOyYSNWo0e+wutbY8jZGSA@mail.gmail.com>
From: "Alex J Lennon" <ajlennon@dynamicdevices.co.uk>
In-Reply-To: <CAMKF1srVfpkFB5fXWg=FmyROvxpciOyYSNWo0e+wutbY8jZGSA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 11:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205357


On 08/10/2024 16:00, Khem Raj wrote:
> On Tue, Oct 8, 2024 at 6:11 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>> Hi,
>>
>> I have observed a gcc recipe build failure in the meta-mono CI here under styhead:
>> https://github.com/DynamicDevices/meta-mono/actions/runs/11232177725/job/31223236463?pr=231#logs
>>
> is this failure persistent or one-off ? how much RAM does the build system has ?
>
Hi Khem. I can help with the build system:

We build in a docker build container (Ubuntu 22.04) in a Proxmox 
(7.4-18) container

ref: https://github.com/DynamicDevices/yocto-ci-build

That Proxmox container has 24GB memory, 8GB swap, 4 cores configured.

>> The meta-mono CI uses the cortexa15t2hf-neon-poky-linux-gnueabi for its ARM32 builds.
>>
>> Is it a known issue?
>>
>> Thanks in advance,
>> Zoltán Böszörményi
>>
>>
>> 
>>

