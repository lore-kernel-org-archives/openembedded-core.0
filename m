Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44E9C54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 01:45:35 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.39044.1747964728268516813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 18:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bvJyB0T0;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso7922862b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 18:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747964728; x=1748569528; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztKnWD5cdEo52Es4zgMVcq5vA4XXEXULcYXJIy8EYMY=;
        b=bvJyB0T0loRJI0S6rXW56mNIGpGgrsaek8GNpMwBwaq0olxVQrd4qmEQWrbbt91wEd
         fnFAkZcZiwJO5sN7ZLTgllpXcAdqZw5sOfGMEkZPxHQiuAd/x8mxcKn6MdJqtZTi7Nqk
         MSw2VgyDs8mjlHDlXxuNnFPJQ42RKG9XqX/2mMfbDaznd7osaOaPqfu2Z8qGx4I/ICS5
         cIZA8X8D+Cvl7tPF7O6BVdWsIZyyxa+EwlLss9MaXWOmRoJrkNsqIHw+sWkossxAH3iU
         OSjRJGMy+GdA/iJwotEM0TxEWkrB4ZtERdSrYydc46TdoulZ8xDC3ym3CX7dVls9k4aO
         dMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747964728; x=1748569528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztKnWD5cdEo52Es4zgMVcq5vA4XXEXULcYXJIy8EYMY=;
        b=JQu/uznk6zNAev/UupJquTKrwg4fh8YwHTR4U+P+o0I5SlL0RwmHIo4Qp1AB5sFQrZ
         KmMxHcCN96MqhVg61dEFvgdEG/sfJX+3/Zc1x4tpwgP7zlF+WFNIhhTk1bSwftBxbhDb
         YqYMPkVDvuQLSvPyHf2Igpci3H0hvBwK7F87nEMKho9y9SziiStvYkRwaTCsEOJ4XgrH
         lQ+0NW6f10kqC5eGDYJkQ/MEXHyyANcoSDTOpGuR/mp1Z99yukdt1PCN7hidklYVdSrk
         sXeXXT7bU6blbUlnDT+nejKGzfYXZaz2Ikt0Um+w5gP9x66MFMew1kLYuerHFMdq3b07
         ebtg==
X-Gm-Message-State: AOJu0YzmGnGqpWAnfz+Db9IqXq++NXQozvUh3xwFKLVF649S4icnEJR7
	sluD1kYpoMBvsW99wo/aa+Ix2cWXwSCx/i98vvBAh9ZYpik9ngU0pjZ/
X-Gm-Gg: ASbGnct/wrYUK/IJXNE8el6yFLQ60iZgtYVsR3R1nu4XQg0xfkO7PU8uhrNklW1Zl8N
	fmpXR6DXxmo72M1b8X1zweMNep45kcvhEECH2Op9TkTU+tI8gtA1GBkZZrqU2C6f7C99Ahp9Nzg
	aAmt9JOYeQ+sQheS1c9HUQtTTz79eFV+xtCAffmBcMWmPoBcdXPSAyVYUTZu3oHXtBiwyz2KBqG
	+tTjvkShqTUDBmtxYDha3OwC3f8bgFqwYNPIX/U7TYTt9RZjcLe32Sgx7ZIz8TDpSBAxuehNcUF
	rHSu8zm11TPcAwFAfKGRqWyvJqnl6d31S6hjTk1uwAtlLpM/+QAj7Zq62pHj6Y5jYaD+qcR4znf
	21yF/wiHOofijYj05xIu52oyOhL8DwPySFCSEj3E=
X-Google-Smtp-Source: AGHT+IHHLlxHKFkOOYOwazw0qLdH3oHUBFmsVPqNdtVnhqrRmIpf4k7MzD55NUwis7iega1vMxZhog==
X-Received: by 2002:a05:6a21:3384:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-2170cc66ba4mr36404976637.10.1747964727581;
        Thu, 22 May 2025 18:45:27 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:7444:5952:9108:1ddc? ([2601:646:8201:fd20:7444:5952:9108:1ddc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e2765sm12275442b3a.19.2025.05.22.18.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 18:45:27 -0700 (PDT)
Message-ID: <08f939dc-0880-4a2f-80af-6e8d512bf8b9@gmail.com>
Date: Thu, 22 May 2025 18:45:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>,
 "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
 <CANNYZj9kMw3iqYi-tpWY19TbCTKjNHO2HDc=dXpu26efHDGbRQ@mail.gmail.com>
 <OSRPR01MB11597AA06EC57367CB529CBD19B98A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <OSRPR01MB11597AA06EC57367CB529CBD19B98A@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 01:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217159



On 5/22/25 6:22 PM, Yiding Liu (Fujitsu) wrote:
> 
> 
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org
>> <openembedded-core@lists.openembedded.org> On Behalf Of Alexander
>> Kanavin via lists.openembedded.org
>> Sent: 2025年5月22日 18:22
>> To: Liu, Yiding/刘 乙丁 <liuyd.fnst@fujitsu.com>
>> Cc: Khem Raj <raj.khem@gmail.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
>> llvm/Config/llvm-config.h and clang/Config/config.h
>>
>> On Wed, 21 May 2025 at 05:14, Yiding Liu (Fujitsu) via lists.openembedded.org
>> <liuyd.fnst=fujitsu.com@lists.openembedded.org>
>> wrote:
>>>
>>> Error: Transaction test error:
>>>    file /usr/include/clang/Config/config.h conflicts between attempted
>>> installs of
>>> lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64
>>>    file /usr/include/llvm/Config/llvm-config.h conflicts between
>>> attempted installs of lib32-clang-dev-20.1.4-r0.core2_32 and
>>> clang-dev-20.1.4-r0.core2_64
>>
>> What is the actual difference between the headers and where does it originate?
>> Before any multilib fixes are applied, this does need to be investigated. This is
>> repeatedly being asked in response to similar patches, and it would be good if
>> such investigations happen up front.
> 
> Let me explain it more clearly
> 1. This fix started from my original patch in April
> https://lists.openembedded.org/g/openembedded-core/message/215193
> 
> 2. Then Khem Raj raj.khem@gmail.com merged a patch set, claiming it would resolve the conflict issues. But in reality, it didn’t.
> 
> For the difference, I have pasted it here:
> https://lists.openembedded.org/g/openembedded-core/message/216811?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Cllvm-config.h%2C20%2C2%2C0%2C112624219
> 
> 
> I know multi-script or multi-header is the last step we should consider.
> But regarding this issue, if you or Khem Raj have any good suggestions, please let me know.

These are configuration headers and will depend upon how clang/llvm is 
built, I hoped that we maybe able to generate identical file by enabling 
all backends but it has more entries that vary according to multilibs. 
At this point this is best we can do, install multilibbed versions of 
these headers. This patch is fine to go in.

> 
> 
> Liu Yiding
>>
>> Alex


