Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C5BC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 12:25:27 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.115223.1738671917844858627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 04:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uw8iI3pe;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-38daf156e97so250751f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 04:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738671916; x=1739276716; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fCcJQDBUA+P6aIhh9zibUkWbmLeIIwG1Tt5GeCjxDc0=;
        b=Uw8iI3pei/T+Kzm/7Zhqqa4j5KY9lZ5s0YvxNWzVG5ZyeqVQeLamUxBz7yxMj0ubnS
         r4PPjHDBc1gg+bt1uF9dIdyyMZ0Ayd+ysE9STz7Skce9mC6DKdaBtttzP2zvwNeQWUEk
         OAEQN31lEpROiR+MKROFSq4hXsIQDrLp+yQlmJMbKWU6AbQs+T4emIKgfMyT3CcQGViU
         AeX6Gbt8SiKqRTqHUVpicXZrxOI29fZBh8oslnE6PXkGujFbRO0Us6ZBB4HF1magIKH8
         agXyz0PNrxISH0xn4RfI1vgsPgKkqzRIV4k73K65d3Y2BhBDWmrZSByqiXoA+SPRlFGn
         W7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738671916; x=1739276716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fCcJQDBUA+P6aIhh9zibUkWbmLeIIwG1Tt5GeCjxDc0=;
        b=wGih2qNeeriR8+VMsqC+/9mlLz60BF03rZf/WEsNFyHJZm5gw2XcQhHOl1fy0BDO5W
         3puDZhTICBjzIC4MK5NIEXBJdgnIEHajJWqyXYH7kWr0NJ2+lgZnLZeDjPOIbJPI5ZkJ
         hHmnU+5v+71k59T/wxd8AUv7WoVJiBk22d4Qa1cGu3Vkr+BuhD8015V+9OCpR11PBxJG
         K5LGN4DW2sNRoTKt5Np+QGjikDjKn20sDifjAcynpYXqhDrcto8BZZ4+t5MKQeMXUIg9
         6M+RGF/kO7WkMpoioitnmgZ3Jb3eA5Vn1D7yxUgL0muws6xgOTO36hZJIWbobm3KN8/Y
         rbYQ==
X-Gm-Message-State: AOJu0Ywt8A1MFxt40H7/TrCT84fQlUqbEeYEY5vbUALkIVGd4I5BFG5c
	KK+uLe8I5/z2wfle56dsMCOjHjAef8qUR6DaBwrcbMuU0Jb2MgkS
X-Gm-Gg: ASbGnctGoTD4yIO9RlVP5Vd6R57PLaxqE9s1eDDd64/90DjXtDMTMvN5mw/DSlKbmTG
	Bj3mvqfT1vi5sV40ZiNcrB6gjMMsYteaVDS7Wblio9YFzV+qd8HUj+Kw2KnHkeP0cY1gUWlLpfE
	wbwVvgXscQHWV04+mOV6VK8fHTei95juG4/Ys8EPMiz++azdthWgXQPqQCttB0AT1J+ahgQVowq
	oj5/aeTbukwM15xyS0XpJpzjuetDSJ2Ovvrgx/ZOGrfKWYkGg5/PzIrf5bgGo52398GkVtTHGL0
	rY/4kSmfw4RDN0TUUKA7lyNnz42s8RmO3dMOUlleO+DduLVb
X-Google-Smtp-Source: AGHT+IFbEpWdiVyo8B6fODWV14INh/yFwqX8bL1MVNUzK6XuMw47S7FbH/g3CIfumFkMn2p/21bPsA==
X-Received: by 2002:a5d:5f51:0:b0:385:efc7:9348 with SMTP id ffacd0b85a97d-38c519321aamr19682569f8f.1.1738671915972;
        Tue, 04 Feb 2025 04:25:15 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d4456sm192536995e9.7.2025.02.04.04.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:25:15 -0800 (PST)
Message-ID: <86aaec61-ae0c-45d7-8e53-77c58739752a@gmail.com>
Date: Tue, 4 Feb 2025 13:25:14 +0100
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
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj--uwXoWM2r-PLz=--6uzd37jnhaqu12vrXcY+pqutO1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 12:25:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210779

2025. 02. 03. 13:37 keltezéssel, Alexander Kanavin írta:
> On Mon, 3 Feb 2025 at 13:24, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> +        # Test rpm-sequoia's default built-in policy
>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>> +
>> +        # Test rpm-sequoia's default built-in policy
>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>> +
>> +        # Test rpm-sequoia's default built-in policy
>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>> +
> This should be set just before the signing actually happens, and not
> only in the test.

I decided to actually ship a crypto policy file in the rpm-sequoia
recipe, so dnf / rpm can use it on the target system. It is also used
in sign_rpm.bbclass and in the test case.

I have already confirmed on my Fedora build host,
that with no policy file present (either at the default path by
renaming Fedora's own file in /etc to simulate a non-rpm based
host or using a non-existing path in SEQUOIA_CRYPTO_POLICY) the signing test case fails.
I will send the new series once the test case succeeds with
everything in place properly.


