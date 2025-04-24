Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E70C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 15:38:26 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.971.1745509105135209058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 08:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQQhmP/6;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so2354443a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 08:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745509103; x=1746113903; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tjm8ornYzG9JEPInjpizNF2rnX7whh4XFUuR23lKNWg=;
        b=VQQhmP/6Yj+OpEBEKdOnziOqsNukl/KIc/8ofkL9gxFHuCJaKnoMN+1pXbXbmNh8mH
         0+DR7XyLw1x8AB2s5NEZLLrVpXHihjozyIPg3NzncSyi1i7jTjYiTjg7mEmwO+0J4aLX
         rtOiur74QpaAaI9faoOW8d5bcULTWrJSm78P06jwSMS3m7FDMieUWYDvYixY+WbqWokg
         GjY8j7ibj4QR1KQi2H2faDgl3/ByOqF2BTSsyExstOTRyAneGy1/5Lbc1vNzNkMPO4uX
         G1gjJRS9FkF8o3oYgUW+fHE09pgIWxwh7g0ArOwOruep0c64sxj/obT1TtqDnWJFe4hW
         NZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745509103; x=1746113903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tjm8ornYzG9JEPInjpizNF2rnX7whh4XFUuR23lKNWg=;
        b=MSjNwNxcboSKgiPivqmwk3lK83n1lT+3RwOR+/4YffTJ/BbwPWfM7vfD4ffsLz7ObB
         vkSTHy8YbeUNVN9JZE1nxTcPalmRstMctvCuO+wZxj+c+UTZnlMISew+eMjArlm8ZZpf
         Ru4P/WmCTWeg10xDlyTww/c6BvPcyVL4D5SOWLzjZMnOG60uyGMoHYXE82tnETUnC3Uu
         aaZlV4nUTME21ahftcukT4St+niC1PiCcUK8lvAmKLMxJp5Psb4tAGK8y+CbJ7MvE0qI
         nE8czYd1ULUiJuHHx9AdSQpJmcJBfjKbTG1Z0RiTwoYYwZvEV8DnbvhLjKJLgGw+pNd1
         Vztg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Hqi2b4k2sAV1hh9APi++kqZ0tyvrBaBDZrw0yj2u2GILLFknbTVQkI2JufVq7/LLgqNSs+PKNC3d+MOGAB6zcA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzcl8oexSQluVOglVnqlrBHvBzBOq67Ui3j2UbxM+9Dwtr46zCW
	d6tjsQqBoYylp5TepjieRq7+QLNSSRx3HXUHpakvUyfLZvviJSDx
X-Gm-Gg: ASbGncvEsyJ2Z5d3Km1axonbfXleJbGi7nB6gzm2yltChCFdUcxrqWpQ0rOAOw1D9y9
	8GrPydZLzlJp7oQ5oJaEo2xi9iLPCWQNWBkVJHFPhedAumihfByVLzQN8IeSY2ACBAtKsXRKzWs
	9GhYKqmBPT/5BSt2c6GI8rWtzA093yZn29HGGQB6SwDRsoTcSCCt3Y01Yy0xgL9fthwcOjDsxb1
	ntgB8arfFEcF6K96WIzKJTYh/tT3xkowOjSgz43nTWvZzrM5D+1OjDLGDdRUoFHXI3s5z12h2Q2
	+Jpu6TG1zkWJBvTJYLdfZO6x3avin6AZBwa3DIIEn/qnwNYW
X-Google-Smtp-Source: AGHT+IEuoOKCVJkRxuMZfuKyF4yPcFeuznqoQrV/mnQD7Czc3oP7kMguqXpaotvaLtzlO5ro4/BToQ==
X-Received: by 2002:a17:907:3da0:b0:ac7:2f8b:6844 with SMTP id a640c23a62f3a-ace6b40760cmr5953366b.23.1745509102919;
        Thu, 24 Apr 2025 08:38:22 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59bbeaaesm125336466b.107.2025.04.24.08.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 08:38:21 -0700 (PDT)
Message-ID: <0d7b1d9c-a42f-4acd-ab19-6fd7c540695c@gmail.com>
Date: Thu, 24 Apr 2025 17:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] kernel-module dependency mystery
To: mike.looijmans@topic.nl, raj.khem@gmail.com,
 openembedded-core@lists.openembedded.org
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
 <656f5ffc-98b6-44e9-8308-51495e1961d7@gmail.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.26c21c88-3e9a-492b-9d2d-79874402141f@emailsignatures365.codetwo.com>
 <68e3c223-560c-453f-b1b5-9bbfc0f9a17d@topic.nl>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <68e3c223-560c-453f-b1b5-9bbfc0f9a17d@topic.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 15:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215389


On 4/24/25 08:58, Mike Looijmans via lists.openembedded.org wrote:
> On 24-04-2025 04:25, Khem Raj via lists.openembedded.org wrote:
>> On 4/23/25 5:34 AM, Mike Looijmans via lists.openembedded.org wrote:
>>> I built the same image for 5 different machines. Only one of them fails 
>>> with the logging below. Note that all machines install the "kernel- 
>>> module-dyplo" package, and on 4 machines that succeeds just fine.
>>>
>>>
>> how are the five machine diffrent with machine config metadata
> Here are the conf files:
> https://github.com/topic-embedded-products/meta-topic/tree/scarthgap/conf/machine
>
> The "tdpzu9" triggers the issue, it's the same SoC as the tepzu9 and all the 
> tdkzu* machines. Only difference is in the peripherals. tepzu9, ttpzu9 and 
> tdpzu9 are the same SOM, just on a different carrier.
>
> So the only difference in kernel configuration is some variance in drivers 
> that get built.
Is there a chance that that this is the only board using an out of tree
driver, and CONFIG_LOCALVERSION_AUTO kernel config is enabled? If yes,
those two factors sometimes aren't playing together nicely with Yocto.
>>>   * Solver encountered 2 problem(s):
>>>   * Problem 1/2:
>>>   *   - conflicting requests
>>>   *   - package kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b- r0.tdpzu9 
>>> requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of 
>>> the providers can be installed
>>>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
>>> kernel-module-dyplo-6.6.40-xilinx- 
>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
>>> kernel-module-dyplo-pcie-6.6.40-xilinx- 
>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>   *
>>>   * Solution 1:
>>>   *   - do not ask to install a package providing kernel-module-dyplo
>>>
>>>   * Problem 2/2:
>>>   *   - conflicting requests
>>>   *   - package kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b- r0.tdpzu9 
>>> requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of 
>>> the providers can be installed
>>>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
>>> kernel-module-dyplo-6.6.40-xilinx- 
>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>   *   - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 needed by 
>>> kernel-module-dyplo-pcie-6.6.40-xilinx- 
>>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>>>   *
>>>   * Solution 1:
>>>   *   - do not ask to install a package providing kernel-module-dyplo
>>>
>>> I'm on "scarthgap" branch.
>>>
>>> The "kernel-module-dyplo" recipe can be found here:
>>>
>>> https://github.com/topic-embedded-products/meta-dyplo/blob/master/ 
>>> recipes-dyplo/dyplo-core/kernel-module-dyplo.bb
>>>
>>> The isue at first glance appears to be that "kernel-6.6.40-xilinx- 
>>> g6a2cb0f14db5" mixes the git version hash from the module itself and the 
>>> git hash of the kernel. There's no such package, it should have been 
>>> "kernel-6.6.40-xilinx-gd7b52381656b"
>>>
>>>
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215326): https://lists.openembedded.org/g/openembedded-core/message/215326
> Mute This Topic: https://lists.openembedded.org/mt/112412917/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


