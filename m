Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2159106FD81
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 09:24:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6463.1773480248120349280
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 02:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZIBOwZ1;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so28922565e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 02:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773480246; x=1774085046; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XAsSWsliEWdC0O57jJKnT3wy1EWDYRiOIUaWheZHEw=;
        b=eZIBOwZ12Us40EYPluznzT070Xv7UBiMQyGTBjlKWKoZXKLSaDWNn+r+feOgtmvIZE
         sTNiB7x8K4j+VGeezi0pJ8Ui0jWQqVmSAHsARYd5SVGivI9h7NAtAN6GMSlAx6HCvQlU
         3a7gdphg7aTWcFxKRtKjjUvm/lMGy+cLqRoRBUPq4ZBkmzj+/XZRI8D187wWMybv7WcS
         RTvQN23VKr3oa9g7aeF+/TRnoybqrcatHFKp/oJDADfShkxPo6TwbFVgSCoLAZHrlN0f
         bSkzpX8IA0eaZ3iUInjUKEIJXP6mlk6C0MrrHh34E18r4TA4mwBJHy9NOxo5GJFAOcnX
         egWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773480246; x=1774085046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XAsSWsliEWdC0O57jJKnT3wy1EWDYRiOIUaWheZHEw=;
        b=LlFW92igQxqD9df98utRNO4Q1MGTvFOpkV1Appjp5S1iwRnUXTFLLkw+lSDLXxtBsl
         UxvNRK30NJWheZimwRwri7zWoHcb3X6alp7HK3R9tvPcBvFG7rZdmQZZnOWlMIbOVECM
         HizWQSBnqNqqGCcJnlvX7oByzq/3vdLZXZ490r/vK3tl5d7JRFJUjchp8CoX6as+hKKd
         mn50NAaibkwfnSXbqk6MQ0nBsvpqFBxG3IKCjDa4H+VZ0Z/04pGMAekl3/6e1KYKafEy
         H3NKgknO6Cdb0Em+xsenna/SEehKWADJsJacYdVYZRxKaezL0heRuhHV1RKfhdc2amyb
         a4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5CCD0cMGsn1WogPUBkUXrvSE1xGhIiWcngjbNYKm39b97uIf0ZwX0eEJE0ebZtGJo6ntEEmGcSpaAno68TFshNA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy929TRq/v5vQKLngeJGBjmTGONn10N56CrQJRafihb9kUX9Xuq
	WMRdKE7INnmetIJ7c1FN2trposlxaVomF31lbEnpVpjwORO5CrL/qNHx
X-Gm-Gg: ATEYQzwsuVFXZDTM3nPntPwUJJvU46z2z+I5Yt0ai9AX1geP0rd9SVkjnp7ZGFHcA0e
	YNoUd6dgwpgOljtlK+kGSWaPyARwW1GhuvqthUZS447osMFNpuXJ8KnncD/0wC5mhInNJHXW+gp
	Qxz3n/vr1R6fDf0a9CY9V1zlEh0MnOWayXed3RO+hs7njH1lqnFIXw54PoKlfznjIYEeiD1G9Gk
	S2lSv7wycPv7QMmUK2EtnGoAwIaYXUrMZQjPFSJf8Cajjgk2mkUZcjsvbJFZJ/qfb83Gg+x13T9
	hrTZI4EtjK3mNWqPAt10kF5kjF9d8SjLiyiq8lbZo1ts/G81e/qs4a9PuNFWGpobYF5QGA68b4j
	j4M+T/PvHNd5qI/OBrMg0bRQYuqH8YQJ0aMi7Ya/VTg6mN3XViy6+JA7keRyPbd88Myv1XWXfux
	ofrRBlCR9Ee8wJSaMsGLwKxoWtZLL6yt8Xujle+naEQLwxz3wlfZRrW/U=
X-Received: by 2002:a05:600c:4f8b:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-485564981d8mr112254275e9.0.1773480246230;
        Sat, 14 Mar 2026 02:24:06 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b544sm26412359f8f.20.2026.03.14.02.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 02:24:05 -0700 (PDT)
Message-ID: <ba5d8ae0-f057-4b48-b523-0bf17bf25705@gmail.com>
Date: Sat, 14 Mar 2026 10:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260311122922.4160133-1-zboszor@gmail.com>
 <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <8be68784-e846-4ddb-9127-e4e6082347aa@gmail.com>
 <AS1PR10MB56979EB1C738893C31052E3EFD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <f2f689b6-1600-40dc-94d4-6de8906b2490@gmail.com>
 <AS1PR10MB5697D86B88010E0EE7666332FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <189BD2EF133E31A4.2476321@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <189BD2EF133E31A4.2476321@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 09:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233074

2026. 03. 11. 16:26 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2026. 03. 11. 15:02 keltezéssel, Marko, Peter írta:
>>
>>> -----Original Message-----
>>> From: Böszörményi Zoltán <zboszor@gmail.com>
>>> Sent: Wednesday, March 11, 2026 14:43
>>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>>> openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
>>> subpackage
>>>
>>> 2026. 03. 11. 14:40 keltezéssel, Marko, Peter írta:
>>>>> -----Original Message-----
>>>>> From: Böszörményi Zoltán <zboszor@gmail.com>
>>>>> Sent: Wednesday, March 11, 2026 14:12
>>>>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>>>>> openembedded-core@lists.openembedded.org
>>>>> Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to
>>> ptest
>>>>> subpackage
>>>>>
>>>>> 2026. 03. 11. 13:44 keltezéssel, Marko, Peter írta:
>>>>>> These INSANE_SKIP assignments are wrong.
>>>>>> Use GLIBC_GENERATE_LOCALES = "all" (or select just those you need) in
>>> your
>>>>> distro.
>>>>>
>>>>> It doesn't help.
>>>> I'm not sure why it down't work for you, since it works for me and for Yocto AB.
>>>> Did you added it to your distro settings and not just to a recipe?
>>>> The explanation about this is at: https://git.yoctoproject.org/meta-
>>> yocto/tree/meta-poky/conf/templates/default/local.conf.sample.extended#n61
>>>
>>> I added it to my distro include file.
>> Have you verified the final value via bitbake-getvar?
>> You are overriding the default (otherwise you would not see the warnings),
>> So possibly you added it to a place where it anyway overwritten later.
>
> Yes, I just checked it. It's not set from anywhere else,
> only from my distro include file. It's set to "all".
>
> As I said, setting it does not help with all the build-deps QA errors.
> Previously it wasn't set at all, and I have not seen a similar QA error under Yocto 5.3.
>
> Isn't it possible that the ptest subpackages for bash, gawk, m4 and others
> have just gained extra locale-base-* dependencies that previously weren't there?
> And now they are not being covered by DYNAMIC_PACKAGES in glibc-locales for some reason?

Setting GLIBC_GENERATE_LOCALES = "all" is not needed, it seems to be the default.

The issue was that I also had this in my local configuration:

LOCALE_UTF8_ONLY = "1"

This was not a problem up to Yocto 5.3.

bitbake world and ptest packages should also be tested against UTF-8-only configuration.

>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232894): https://lists.openembedded.org/g/openembedded-core/message/232894
> Mute This Topic: https://lists.openembedded.org/mt/118259058/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


