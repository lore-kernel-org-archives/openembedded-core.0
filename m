Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF169C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:22:25 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.10262.1738149742875401685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:22:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5x3mLlQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso44604545e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 03:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738149741; x=1738754541; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r+fGPNsvK066977XVCx0h6znHvuyUSsxCkVJMZimjkQ=;
        b=Q5x3mLlQfHUFItFiwFBUqITAZSYacZFlC+YNtw7PKvwDMIQYSbrWl7tuHHlgwJKXrb
         rUlnwVqf5O7sxmTWS4SDJO4prTHOEUu2kGyV5W5Ry5IX974hEZ033KOqFjnVT/a1j+i/
         CXDU/exl+S2QXn758VSdCsbWYHfHoFsSVl5xdbsD5rB6Sx2V4QmdAQB6eYS+dzeAGGAg
         VKxtLO3UE7j2hoe5sNeoX4RKgjgMxiks7B1dq1+Ges0WRl8UuWPzwrVTqQB2bZSzuhgE
         Ra/S5Iy/vwzMMOQIrKtdUXbdAyl0DF2/s4FVkg4FrbBtLCIgSw/LG0BBg14c0tvRZI1J
         bTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738149741; x=1738754541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+fGPNsvK066977XVCx0h6znHvuyUSsxCkVJMZimjkQ=;
        b=YWUVnmN5gXCWI64WGEKpwx2FDr9DlYofGjHPLs1sSYojMyNel7BGsxMaiUYPOx8W0o
         +uxTZexkM//kceZYt3BRVpJ8Z4YzfVpXyys/VGiWdTEpDX8NqADd/B8Twnfz+o60F/rY
         Hps9YCB+Bx03zIxTZRV3D7Ve6Lf+JQ4v8OUH2+6w9korSumu3l0fC7hjDareXtYufLeN
         TeI3Igr4uoQfLt4GkwMcahE1znB3iwHVPXfojAOAZuFGRmQOk5O8RafLCUcrK6tixQ2I
         zJ0Bhj8DJroFGUtKf/2Y8aErfVkPBTkOOOYXggz9ZUCvWHJdgXMKKWzSsZMmkrQHQghV
         gTKA==
X-Gm-Message-State: AOJu0Yz2Jx1m8cD4YMrS9g53/iyZ57azDN/7RS3/l84YJEXynm9deWwH
	9g7kRGApi4324wdBQzhmdB6B+vG5VFFOR8NOk8l2R55o6m1SukiQ
X-Gm-Gg: ASbGnculS/Ei3NThsRJ/dtkw5zti/IOYI3NiHICZtR7aAL0W07F2PXV2LCWDvkZ9uuo
	Os4i482csA28HP9/FTP6og/KH6V/atWm4GTGIIf0kk3NTvZpPggp4lIrPABnukjyHNubmYF3aPU
	Lqwq9VyUS4VulwKOZKI8HqmIQ42JSCi17hLlYsMsBvWoPaRCe36H/+bg5AwjtygOu9QDNTpd26K
	Aukk29Y9yJ+0kgi48hWjsJV/OE2KtZF/rrKET3/Iw2YZyoHn2rxkvXk7mS+uVDbw2RzHNFgYSdB
	UJI5XxsVuq5qrLQ6F7btZhLLM39tnI8F5XuHLLtuH4WcyZ6h
X-Google-Smtp-Source: AGHT+IH3v3ORZm76cl5jh4cEeSf7i9ecm0SdMYxSwxienFN+YhDDT24IF2wtWneihP0neJdszzw8OA==
X-Received: by 2002:a5d:584b:0:b0:38a:8b2c:53ad with SMTP id ffacd0b85a97d-38c51e91b14mr2626072f8f.39.1738149741143;
        Wed, 29 Jan 2025 03:22:21 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17662bsm16781377f8f.4.2025.01.29.03.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 03:22:20 -0800 (PST)
Message-ID: <55e9cc3c-3113-4447-b7ff-d774d9974021@gmail.com>
Date: Wed, 29 Jan 2025 12:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2 2/2] rpm: Re-enable signing
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129104150.2391653-1-zboszor@gmail.com>
 <20250129104150.2391653-2-zboszor@gmail.com>
 <CANNYZj8V4Zq96iFLPOjBzVJsDpb3f-m99UGNnUjS9dd0qRsvTg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj8V4Zq96iFLPOjBzVJsDpb3f-m99UGNnUjS9dd0qRsvTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 11:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210375

2025. 01. 29. 12:06 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 11:41, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>
>> -PACKAGECONFIG ??= "archive"
>> +PACKAGECONFIG ??= "archive sequoia"
> We can't do this. This will add 14 minutes of rust-native to
> everyone's builds. Rather you should adjust PACKAGECONFIG for rpm in
> the selftest (and your local configuration).

I'll look at how to customize the configuration in the selftest.


