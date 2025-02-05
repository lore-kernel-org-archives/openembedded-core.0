Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B812C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 04:39:45 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.5061.1738730375249341791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 20:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXBhPmmA;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38da72cc47bso1093780f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 20:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738730373; x=1739335173; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/43Iv1oSnz9ah9ZmhopR1qNUkcJeKTsCdeQzd00KOg=;
        b=aXBhPmmAyYY8wD+VbzOqv5iu3PHT7mvBk0kjWxmwpqdSYluQ5wTcdce0S7jl08NQDl
         8tHdWMhquDxL75LfirWG0N11OGofNKtXsMYmzoja6/ubB8BqNu2WFZCC6n08WPEboXRl
         tM9ezGQQrmhTR3ahrPVuYObcewGBEO9MY2AbDTn0zQbfR3fz5evCul62zmnJoyfEHv45
         Ei4b9LjNgAvXlfc83kYPzmduJCO/QfxhVZYBnpSv3iKOvdaKrKmqNmXGNol7yohbfAA0
         aC8WE3EkgfY4736zo1f+QFAfbc5dCnne9fNMw06d3GN5IL3g8jN67od/US/+BJQ2AbRQ
         Bfqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738730373; x=1739335173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/43Iv1oSnz9ah9ZmhopR1qNUkcJeKTsCdeQzd00KOg=;
        b=Ic3GNmJWjl/b3gK5/AFEKwEc7MBmM3Y2tFnBMwbuFramKLiDnUiVfxSATdZawJZfTz
         Y3NonmiPzAPtMbWYQtzrTVfdGRF8tyHc52fPAZh0cxIzdoLmdjPjlwozlLxlhlS0U7zD
         o/6/bnYCBc9GDsmavJsDtjjz/SyIlnJDblI3QaBU1t01iHvZJRDcSEZmMtL2/9gBWCTI
         qW7bXNoggO8q2DNqcl75JlP9SAithY3Omwx4vtsgXI84wqY58zV7gpqw4NQG9c6/f5aH
         ew5yLEeHBrJN7dAAyVwBFvXtpfbQ9EyCwPC3idVqdtOdyjMxi0nGQmOZxJ6qwjWb/IfA
         T7eA==
X-Gm-Message-State: AOJu0Yw1qJCNEOj616AD2/ItXy+ixIvIKJMAQABCDxQBE9XVR/zgD8DS
	7Eaw3Nc2uMvkF258Oe+WmE3C0+dRlKDpR7hqtG9v0Lm0YmbWIrL9
X-Gm-Gg: ASbGncvJWVUY9hv3mLqLjgo8cJFFpYi8FKjCwS5KJHHO081zuck4D5X+18dOxP84SCh
	8oxEsa/5yCH5/G3OyMrfY4igvaV8hlKKG0lca3hDmwDuuTttlwJi6TRiyPl1oiD44oLvyxSUv6N
	15BR2y8mrOlxi1FC91wqcrdduhqs3dO6Q0NGS2VhIFJWvrPChcDUp+PL8SYg+wlJKXy4DCteeeF
	50HACG2DXYGv0a5X/BgAe53f/o3A+4txFwtgT5CqBNbUXbi30NYJ3td/LWXdkaRYtyaIQIuhgKX
	sPboYnu8K+Hs2wBoNDIE5UK2clKDEuTnpd1pVjIVEAbKtXvX
X-Google-Smtp-Source: AGHT+IFKdskGp+HDEpnEb2B76UG7jjIn9NMqjD6R9O9q5X1yb6Iz79Pe18gnOT/4gD6PvPIANLZnuw==
X-Received: by 2002:a05:6000:1864:b0:385:dffb:4d56 with SMTP id ffacd0b85a97d-38db49766b5mr639335f8f.53.1738730373358;
        Tue, 04 Feb 2025 20:39:33 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390da8a02bsm8279885e9.37.2025.02.04.20.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 20:39:32 -0800 (PST)
Message-ID: <2e5f45d6-41dd-443f-9c45-1d4b66d8f879@gmail.com>
Date: Wed, 5 Feb 2025 05:39:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v5 2/2] oeqa/selftest/cases/signing.py: Re-enable
 self-test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
 <20250203122444.1513238-1-zboszor@gmail.com>
 <20250203122444.1513238-2-zboszor@gmail.com>
 <CANNYZj--uwXoWM2r-PLz=--6uzd37jnhaqu12vrXcY+pqutO1w@mail.gmail.com>
 <182100E5D19BBE2E.15786@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <182100E5D19BBE2E.15786@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 04:39:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210829

2025. 02. 04. 13:25 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 02. 03. 13:37 keltezéssel, Alexander Kanavin írta:
>> On Mon, 3 Feb 2025 at 13:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>>> +        # Test rpm-sequoia's default built-in policy
>>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>>> +
>>> +        # Test rpm-sequoia's default built-in policy
>>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>>> +
>>> +        # Test rpm-sequoia's default built-in policy
>>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>>> +
>> This should be set just before the signing actually happens, and not
>> only in the test.
>
> I decided to actually ship a crypto policy file in the rpm-sequoia
> recipe, so dnf / rpm can use it on the target system. It is also used
> in sign_rpm.bbclass and in the test case.
>
> I have already confirmed on my Fedora build host,
> that with no policy file present (either at the default path by
> renaming Fedora's own file in /etc to simulate a non-rpm based
> host or using a non-existing path in SEQUOIA_CRYPTO_POLICY) the signing test case fails.
> I will send the new series once the test case succeeds with
> everything in place properly.

I just sent the v6 series.


