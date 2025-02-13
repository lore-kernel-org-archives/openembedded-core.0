Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE229C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:40:41 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12375.1739457633783955971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=igUjHzX3;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso456822f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457632; x=1740062432; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJTJHfDLbuZSw0V8GLIBXASwNuyZR3oNx5fKO1e8uNw=;
        b=igUjHzX3mguhsqgRb/DqpYix9HXCtKIUGBRaRcfwPeA5z3gTJjroT5JT1m5Hx54pw/
         ywl5jnNWKBkYra4qqgoZMbLnwC6GP3OhPYL4l2Tv5f4574eF316DU22/QwAgAdtoI5K0
         u/L9ulMQidVFw9Bc+dsT0yGGL7Xyx4Dbv7F2UseS6/MnPEFDxYTjd5w488+f7hNLWBLN
         bWzZWkmpZ+YJlogkFF72hUTu5ByC7k9bEqs385k8Pjb3h5/LS+Na/NarjVn97RRYalLm
         18q+FbBAKJDJIEf9xWnsxXZSaDv36ppQobxO1TMNNkDoFo3LivXijf2AVDorbUAn4MFK
         Vnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457632; x=1740062432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJTJHfDLbuZSw0V8GLIBXASwNuyZR3oNx5fKO1e8uNw=;
        b=svwwP2jVwM1oXtNx7TsRvqY0osQkXO0byEIm+afuGGTBebnQObif3nBcEj+Je0HaN4
         yGLwX4bDSGLKnj7I3HxNzTfOe2OmINaNVQbRIyiMq+2O2iIc+jeGstCTh7rAVSd9DxUd
         5Fx/vfcioddnAqVafHrodGGg6xKZUD48+oyWJ8Fvl4eISKtOUQfkbEE12tsR0gTGTXfU
         qBAlMocuHSnwOaCNpNYMrd4bKGjGPR8Fp55jdTgJbeJXAoUcrDjWwBfAFoCplY4Kgu9O
         pplGPFX5J5qNcriHztL7AXOusSBHeG2OYg4aNWuM5JPyOIeE1alTrCljyonjioWKqH9p
         GbSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmqzAxZ8AWNzdkzKNsokoYrf0HS3mnBl12tTYjDm4nC9Wi4/pjQ64KEH83zdQf836NLyqHyAhIpNTw9kjy2aF1Bg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywp2gJjKV8rjvVM1N4M2Gv4H8iDd4eUJQIgaiCBaCOD1HKFu8PM
	Kpms6Octa1tIDBF71PY05PM9t1bRJQ7z7NGzVDfFsXLqS6DZ9RQL
X-Gm-Gg: ASbGncvAtdEaLM3zu4/TnVfFArWmCqnublPfRJRR6RKDG1hcYsny7fhp1Yw6OMDNozg
	PVEFvmYItzKZoSloA1S7KpvNmkhvF0LFQvZETv5ncNqG89NCuUXQzDpJJ91OHs/7IVfN9d6xUbm
	At1hpSGqR2PPZl1n9XLB5SVyelXuAGefRQ7W7GsC/x10vIt0y1KOmuaoi04rGQ2+qWDr6W7kX3M
	XRiA2BhgYyp9ubOQRoSlIkAv/dOy8eKLkisY7ekYlXa+PMw+tlErnxvycatQ4SQf+LMeN9bc2u4
	Yap5r0VMAIgbrfN2Hec5sVAkTdXQFyXCO7KwSKwd4jUpre2D
X-Google-Smtp-Source: AGHT+IEpoJOMIUFeDQNSaTx4NB8PNSbSrzVBWXsHPf5w4yhVvbcZM6InbPRqmMHFsa+6m4/Ejig5iA==
X-Received: by 2002:a05:6000:154c:b0:38d:b610:190b with SMTP id ffacd0b85a97d-38f2451a138mr3874559f8f.46.1739457632062;
        Thu, 13 Feb 2025 06:40:32 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25913eb6sm2089567f8f.51.2025.02.13.06.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 06:40:31 -0800 (PST)
Message-ID: <be38f090-6953-4d0d-968d-000f41f680c0@gmail.com>
Date: Thu, 13 Feb 2025 15:40:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
 <eb47ba1c-fac3-49a1-9d5c-d56168c39595@gmail.com>
 <32282675112f0a8c60ed09c9799971bf0fa03803.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <32282675112f0a8c60ed09c9799971bf0fa03803.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211342

2025. 02. 13. 15:32 keltezéssel, Richard Purdie írta:
> On Thu, 2025-02-13 at 15:20 +0100, Böszörményi Zoltán wrote:
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
>>>> python/build-crypto-policies.py --reloadcmds policies output
>>>> /tmp/tmpqvyryz80: line 5: Bad configuration option:
>>>> pubkeyacceptedalgorithms
>>>> /tmp/tmpqvyryz80: line 6: Bad configuration option:
>>>> hostbasedacceptedalgorithms
>>>> /tmp/tmpqvyryz80: line 8: Bad configuration option:
>>>> requiredrsasize
>>>> /tmp/tmpqvyryz80: terminating, 3 bad configuration options
>>>> There is an error in OpenSSH server generated policy
>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027/steps/11/logs/stdio
>>>
>>> Can you have a look at this error please?
>> I tested the recipe on Fedora 41 with:
>> * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
>> * faking uninstalling it by renaming /usr/bin/nss-policy-check
>>
>> Both worked.
>>
>> Some of your build hosts where nss was not installed complained
>> about executing nss-policy-check unconditionally, which is now fixed.
>>
>> I think this is on a build host with a very old nss version
>> installed.
>> Can you uninstall it?
> We aim to filter the environment and work the same way in all cases so
> this sounds like host contamination.
>
> I think we may have to just stop it using it from the host
> unconditionally.

It's not used unconditionally from the host anymore.
It's detected via shutil.which() so if it's in PATH, it is used. See:
https://gitlab.com/redhat-crypto/fedora-crypto-policies/-/commit/032b418a6db842f0eab330eb5909e4604e888728


