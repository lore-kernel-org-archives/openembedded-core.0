Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D55C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:09:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.13248.1739459368218812119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Jh+jra2Z;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dc962f1b9so573898f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739459367; x=1740064167; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lCP/zSHcoAnFTfvq8yTX4ImwUhUWYRIU44PCdZeHxpY=;
        b=Jh+jra2ZpkpFXJR06vsDW2588JNvI6ATo56mspX3K5o6DjH/vwHRTn1+sxCSU5eK7M
         9FYuFXf0SXXWvC0KQ4ttR8iekfSHhLobeE3zv4uREVOIN2i4MGl2Fdt2AvAbrCgM2Gm9
         pAK4rOsIiYckYqi4ijdQPnmQQ1ZpnJKQQr7xY8wp9zbHCAlEKO7ihZFbHPnCzlx8LBWE
         BidKTZfiIOI5G2pHLQf1ZVXNzcD4GNZTMH3oaiglFyGHVk5q+M9ktfuopOK/xRPj7kTu
         rzAWuv9CihKzjkPnNJGPElkAKcR6qQhr0vpaG6/HYyb4lLH8AJE08dRgZAUCatCm0N00
         UJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739459367; x=1740064167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lCP/zSHcoAnFTfvq8yTX4ImwUhUWYRIU44PCdZeHxpY=;
        b=MIlioJn2ROs8qEX4boW7BYIfYKnUGemqSxNd7TbC7T/Vw0qTJar9amycA5ZEqsKFIC
         lHZejXdGK96/y1rlNz0MgYdjQmgqCDP6xYxDaZNC0dB4+nNrxyRJrQXl1F1jie1+HKbE
         o7OMx5yr+hQk4Xw36Dr0xXJQ/oQKr5Cs85fwk2X3ude/QVgIa7V3P+fn3TfJ18rq4rik
         UerkbLH8KpzswXoHan+x4p3oEfk4wrgXDqpgAidZNIkyaUX/YQ2c/pGAWG26kpHBkF5w
         NnvpImMR7QkkKKuX9WxFKbMDUeu95VPCWBlIMD3m7fmd15loWV04uT1tkSSkMPFGbC87
         gssQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWxAdjy9K/PWWWyccJRhqesDSkD68XVoKY6kLpAGHLS5x/kBolM7RFoKXjsbzrFyo0HVnbkuHuGZrNwKKQmdT7Qg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy34gpBD7U44t+Kyj9pcJXWexw0yLfYREJtlMlCVBLYCNs/+TI2
	VFnB6SoOfjoHLpS4Q3GMDlKdNshZLhyLvSnVpphvlLlf9SoVCJIJ
X-Gm-Gg: ASbGnct9IZWkrXZ6hp43qJHLx3Y212zXGwNaYeb+s7UmkS42P9Yq1h65zCg+b70lfto
	YjYJaHWmQomSlv6MzYj/uxL9JRA9zeaXpYA0woyVCC1CzAru5sI1doOPy1vsAa00L8cW5jnE6I7
	rUcie/yv0SkPvhiplt+220YhdH0PXgDmdMZGx4xIM0pPYo0sln5ncEidk2O5bu+vhLSUuClKtSc
	hxxnRUTVJ4PI+Kn1ggQKVEUCYWPlgzdxCNibaLs44n/e1UbExUb9ggaDZFYUj81V1/ShbLziUJr
	b+86k+XXa0idzh6TQfIR+TDDXAIwTeW6XeyBCfQFDy3ZAB57
X-Google-Smtp-Source: AGHT+IHwofggAKhqkjxsxnPrWtOG8sNFYkXN3oyzNcrSMgACpt5Lpg/8iihizIw2OVy7xqIRfxlmDA==
X-Received: by 2002:a5d:6485:0:b0:38d:bf09:aa2b with SMTP id ffacd0b85a97d-38dea2ece7fmr8056713f8f.54.1739459366273;
        Thu, 13 Feb 2025 07:09:26 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5923sm2142842f8f.74.2025.02.13.07.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 07:09:25 -0800 (PST)
Message-ID: <16b4c8b4-2cc6-496e-87cb-a079691ad5a8@gmail.com>
Date: Thu, 13 Feb 2025 16:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20250212043532.1258912-1-zboszor@gmail.com>
 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
 <1823CA649EDDAA06.9844@lists.openembedded.org>
 <1823CBAB98621FC2.9844@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <1823CBAB98621FC2.9844@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:09:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211345

2025. 02. 13. 15:43 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2025. 02. 13. 15:20 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>> 2025. 02. 13. 14:36 keltezéssel, Mathieu Dubois-Briand írta:
>>> On Wed Feb 12, 2025 at 5:35 AM CET, Zoltán Böszörményi wrote:
>>>> This ships a crypto policy file for rpm-sequoia.
>>>>
>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>> ---
>>> Hi Zoltán,
>>>
>>> I believe we have a new issue with this version:
>>>
>>> | python/build-crypto-policies.py --reloadcmds policies output
>>> | /tmp/tmpqvyryz80: line 5: Bad configuration option: pubkeyacceptedalgorithms
>>> | /tmp/tmpqvyryz80: line 6: Bad configuration option: hostbasedacceptedalgorithms
>>> | /tmp/tmpqvyryz80: line 8: Bad configuration option: requiredrsasize
>>> | /tmp/tmpqvyryz80: terminating, 3 bad configuration options
>>> | There is an error in OpenSSH server generated policy
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027/steps/11/logs/stdio 
>>>
>>>
>>> Can you have a look at this error please?
>>
>> I tested the recipe on Fedora 41 with:
>> * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
>> * faking uninstalling it by renaming /usr/bin/nss-policy-check
>>
>> Both worked.
>>
>> Some of your build hosts where nss was not installed complained
>> about executing nss-policy-check unconditionally, which is now fixed.
>>
>> I think this is on a build host with a very old nss version installed.
>> Can you uninstall it?
>
> I found an alternative solution but it involves patching out 0
> most of the policy generators:
>
> <bad patch>

Wrong diagnosis.

It only happens for openssh and openssh server configs.
And it should be with with export OLD_OPENSSH=1.

Is it okay if I re-send only the first patch in the series?


