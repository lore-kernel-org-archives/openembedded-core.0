Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070E0112584D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 15:26:45 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.415.1773242802216647949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 08:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UG1la5Ci;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-482f454be5bso12746025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 08:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773242800; x=1773847600; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0R05NS3iglplVFduN6RFcVFkHlUB8vGC5rLWxHjcli0=;
        b=UG1la5CiL/JbIep3nCVFukGjJOCFZgP3qut0wrAVv3I4Vwrqz//qpo0+1zKf+8HdYP
         gk+ZFUAkeUcm33MxS+wEsKeuf+Z8lwpQtXZYbwWYGrR7bE4ueRPhdzuU3B0YFF7oTiXH
         kn+I3mljMZLg9cbvKs/7/GmXvi5kjZNU5Ykyg/3cbh4VoOSlRWZ1HT0wyiKDpEOwGFXW
         m4OkDBQiV7HJGBlSJrOx4dUp4SBjWorSpa1ZSzW4twJRfidOxSImNCEqKwtI+2Zg7LZT
         CU+n0LWYk6mMVSrlamkmPRX2BMLthvla4FXiU9OlKN0su0YyY7hNBM33OGU8Wa8P1mdP
         lniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773242800; x=1773847600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0R05NS3iglplVFduN6RFcVFkHlUB8vGC5rLWxHjcli0=;
        b=KYBWVgEBfxYEygPiZ7LhI5Ox53TgeXbMAcD5eHx+cT0FQxRqg8puSvrvDogMn2d3mm
         bIUSu1VS0aG+InvAMuz65K71y7ImsqTRZOU67j1UZJVRbhB751OAduHJ6zuFHUiFsSte
         hVTGW1vjkRETgeubrKSxLgTYUsDj6K8umoDLR2CB8kKHaLsMVELv2qzlTNrSISNfZ7Ww
         9tTeaIaMSAkghYJ9SM+hv7rgAdDUrV88ke/7H6n4yJnPaZWwYcNjgPrJk/lKInaxbvQ2
         9QNarMGTejfD7OxvgK+hDKEccB15e1ckVCcQGEoONgzK9/QBwOc115RDovQs1GjqXz6m
         S7+w==
X-Forwarded-Encrypted: i=1; AJvYcCWnO3NAxxv2lU993LH+xJGTHi8KO2YJrKaYjwmDspZ2pavFvbjsXSarTY9VSHIQ2B4/21hGnfeNhCdXkoJ8eygNZg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzjKPkK24fUvMtjhxkCKpSQSFYLABmhwh8fqQ0G4Nn4t7OD7xtx
	DRRhEluSGdbKdrrveXQ9EzQK6B8AEE9KfEDs2uCyA95RWPCcN1s6PXfj
X-Gm-Gg: ATEYQzwihHYK34ARGoPpsN0bBJF4h4B2jqRsAOJWj3Y+OsVh5LqTkzSbjBgQzORsLGz
	p1GUdCWK40DCCGy440nXSEf90+ZR2VnyaUCEELff9k8vI90pJAqX80PKZUq5lMhdTWSGJdo6qsh
	mGkPIU2MBEstZaGyyUaU8UlFRyjvZTtfOu3t966o+kk15FPJy29C9KW1uOOx9iZlGNWRHHW9aWM
	kD5sGWUUw3nR85UachE9IeXCS+fC6KKsFAhs9l1YztE+RWhhgKZFGGVLsiNZyEQowG4s1btINxo
	rEW32fcb7kCTCgqNO21y6E5xQBHJaDddYQLvBiBC5XmGe5DdIcH56hrRo9BGtZW+yShdLtn97RB
	k7oPCyT790gsFMhHQyF7t8kPkQ0JeRLJHsLM2FnOmtaIiipWS3UGuuBAqUlZTsbOS+VFy3PLQue
	R9OJWfrF6YQJyjjZrins9/uihpt5LjHPLoJpgDdkTOmzy5X4dXaEQ7pHIpzNT5kyN5tg==
X-Received: by 2002:a05:600c:848d:b0:485:33b7:573d with SMTP id 5b1f17b1804b1-4854f56a0a2mr159945e9.1.1773242800151;
        Wed, 11 Mar 2026 08:26:40 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm290226615e9.10.2026.03.11.08.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 08:26:39 -0700 (PDT)
Message-ID: <c6cd5404-31b6-4030-ab15-e45f27af9679@gmail.com>
Date: Wed, 11 Mar 2026 16:26:39 +0100
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
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <AS1PR10MB5697D86B88010E0EE7666332FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 15:26:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232894

2026. 03. 11. 15:02 keltezéssel, Marko, Peter írta:
>
>> -----Original Message-----
>> From: Böszörményi Zoltán <zboszor@gmail.com>
>> Sent: Wednesday, March 11, 2026 14:43
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
>> subpackage
>>
>> 2026. 03. 11. 14:40 keltezéssel, Marko, Peter írta:
>>>> -----Original Message-----
>>>> From: Böszörményi Zoltán <zboszor@gmail.com>
>>>> Sent: Wednesday, March 11, 2026 14:12
>>>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>>>> openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to
>> ptest
>>>> subpackage
>>>>
>>>> 2026. 03. 11. 13:44 keltezéssel, Marko, Peter írta:
>>>>> These INSANE_SKIP assignments are wrong.
>>>>> Use GLIBC_GENERATE_LOCALES = "all" (or select just those you need) in
>> your
>>>> distro.
>>>>
>>>> It doesn't help.
>>> I'm not sure why it down't work for you, since it works for me and for Yocto AB.
>>> Did you added it to your distro settings and not just to a recipe?
>>> The explanation about this is at: https://git.yoctoproject.org/meta-
>> yocto/tree/meta-poky/conf/templates/default/local.conf.sample.extended#n61
>>
>> I added it to my distro include file.
> Have you verified the final value via bitbake-getvar?
> You are overriding the default (otherwise you would not see the warnings),
> So possibly you added it to a place where it anyway overwritten later.

Yes, I just checked it. It's not set from anywhere else,
only from my distro include file. It's set to "all".

As I said, setting it does not help with all the build-deps QA errors.
Previously it wasn't set at all, and I have not seen a similar QA error under Yocto 5.3.

Isn't it possible that the ptest subpackages for bash, gawk, m4 and others
have just gained extra locale-base-* dependencies that previously weren't there?
And now they are not being covered by DYNAMIC_PACKAGES in glibc-locales for some reason?


