Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26688C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:15:02 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.13384.1739459699494358417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gM4Yp+lY;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso7445635e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739459698; x=1740064498; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OpoxU/RvxhbwRis2IVkBSSKtNjDpSk/sEVFLl08xXlk=;
        b=gM4Yp+lYuUeHpKaIgpyKX6CmF0nEzyXVnY4heKGl/GJrFcQ6/C0mUVrcfulnrMK21O
         hCn4Y3fcm+PEzlxcCxl9M1h2/Fs2HNL1MjXl6MJgOkZBZyJ5UnuYQyXGJil59WBC9sKA
         rLPZXG6kv/NLKHCQPotx9xqeKnR1MTYNEZZVY9FIiM5nniB+2L0t9EpZBnCQSxCyQMaQ
         BhueoXGBxcRSH2wlharyTL8ubWxYxqlNDiggupoQ39nygLIsrlCnivy0cK+Lx6/6mnFS
         sR8A52gZiRIMbu8RUfAPl0oFttF+xgx2553/2ZUPDBwClvfO3DMQNqRGjwyftCO6Greg
         nCyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739459698; x=1740064498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpoxU/RvxhbwRis2IVkBSSKtNjDpSk/sEVFLl08xXlk=;
        b=EyChxZWyTcMQmhHJ6xo3etanbMVss1r8akPpt3Wu5wbnYauP8P4lRhp3Le1H6DiQXb
         wQt8LmNX55VNDR00V8b8VOs7R+LjOluIgp2+92vWfr0+HvWNq77iCT1snS5HmiQx/RxX
         4lRUOfxgXXyE2bmMxFS//ypcW8Jm/vFVJauf3iOFAgwl5jVS8bckzlqCpew3r34ZxzBx
         XZoduymtRTHQ75Zxg6ety3nb18Plr8isR6mSFSnF+wyDIf5uxLvXShfUuUzakImC1DMM
         rXBpaAenjpqIHtMjbj11/K2OWJQc6jHA7LyAM/0DtZozi83RMvTmvPWRms+AROet2Dko
         V/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXbBYZMuQPthvxLeUr9aras6TJuPvxo99tHrKCV5fn1abnRn1vVCGOVbYgou9zlBoyFdzUduvZsvYRXBvg0EuxRlA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwNr9eUJ7mRI8IcNs5/0Ac6ROyWNH1GIhJlKO7oi8L5rb0dGpmS
	WNT2/YOBHAx0dK0vyS8P9rqx6q5VqeD9snQdclmz1sVoBueCBI2N
X-Gm-Gg: ASbGncv8LFXijCUEhW/fgt6gjUr4A5RknC+Cv7ZvsiexwX5OYB69UjgI5+8IBLh4Aog
	B1z5qtdVk/Dln9KhpdI4ejpRuJQNnCqeAzQuDssS8zbKv4bq1r0LBSC+f46jMvNmDHlhGEvoVeN
	A/fH28iEvkY49AU2jCPCBG20cgUGdTkooQAmdUiksYRpd2vvHz4tJarB5mw9g73aRlpom4H1h8d
	z4WtiI/uARRhRFdXchkQu/vj+i0Ecc9IAmQOo8Fxg6OFpeQPgOUaeL2IRGIWkkDHhLxLwBVX+yl
	EcQENLSVne4egRJ2BPofGjZ5XybKOOgO1/hh2fLxEJIw/ttp
X-Google-Smtp-Source: AGHT+IEQlLpVSvBmVgheRvNDxuWsju65uKjUlN8zEzwT4FtY0z+qTu6oc9YUeSFf/xhoL8I7wEB+/A==
X-Received: by 2002:a5d:598e:0:b0:38f:21ce:aa28 with SMTP id ffacd0b85a97d-38f21ceb0famr5894531f8f.36.1739459697480;
        Thu, 13 Feb 2025 07:14:57 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395cf084d5sm30400615e9.1.2025.02.13.07.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 07:14:57 -0800 (PST)
Message-ID: <3cd9d088-f691-4252-88d9-74fbd6ef80eb@gmail.com>
Date: Thu, 13 Feb 2025 16:14:56 +0100
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
 <1823CA649EDDAA06.9844@lists.openembedded.org>
 <ecec863d-30bc-430b-9705-1ab720117550@gmail.com>
 <aaee021d000c6419c813d9b095f3e092aec15a72.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <aaee021d000c6419c813d9b095f3e092aec15a72.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211346

2025. 02. 13. 16:06 keltezéssel, Richard Purdie írta:
> On Thu, 2025-02-13 at 15:43 +0100, Böszörményi Zoltán wrote:
>> 2025. 02. 13. 15:20 keltezéssel, Zoltan Boszormenyi via
>> lists.openembedded.org írta:
>>> 2025. 02. 13. 14:36 keltezéssel, Mathieu Dubois-Briand írta:
>>>> On Wed Feb 12, 2025 at 5:35 AM CET, Zoltán Böszörményi wrote:
>>>>> This ships a crypto policy file for rpm-sequoia.
>>>>>
>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>> ---
>>>> Hi Zoltán,
>>>>
>>>> I believe we have a new issue with this version:
>>>>
>>>>> python/build-crypto-policies.py --reloadcmds policies output
>>>>> /tmp/tmpqvyryz80: line 5: Bad configuration option:
>>>>> pubkeyacceptedalgorithms
>>>>> /tmp/tmpqvyryz80: line 6: Bad configuration option:
>>>>> hostbasedacceptedalgorithms
>>>>> /tmp/tmpqvyryz80: line 8: Bad configuration option:
>>>>> requiredrsasize
>>>>> /tmp/tmpqvyryz80: terminating, 3 bad configuration options
>>>>> There is an error in OpenSSH server generated policy
>>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027/steps/11/logs/stdio
>>>>   
>>>>
>>>>
>>>> Can you have a look at this error please?
>>> I tested the recipe on Fedora 41 with:
>>> * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
>>> * faking uninstalling it by renaming /usr/bin/nss-policy-check
>>>
>>> Both worked.
>>>
>>> Some of your build hosts where nss was not installed complained
>>> about executing nss-policy-check unconditionally, which is now
>>> fixed.
>>>
>>> I think this is on a build host with a very old nss version
>>> installed.
>>> Can you uninstall it?
>> I found an alternative solution but it involves patching out
>> most of the policy generators:
>>
>> ================================================
>> $ git diff python/policygenerators/__init__.py
>> diff --git a/python/policygenerators/__init__.py
>> b/python/policygenerators/__init__.py
>> index 0e3013e..180fb2a 100644
>> --- a/python/policygenerators/__init__.py
>> +++ b/python/policygenerators/__init__.py
>> @@ -3,34 +3,8 @@
>>    # Copyright (c) 2019 Red Hat, Inc.
>>    # Copyright (c) 2019 Tomáš Mráz <tmraz@fedoraproject.org>
>>
>> -from .bind import BindGenerator
>> -from .gnutls import GnuTLSGenerator
>> -from .java import JavaGenerator
>> -from .krb5 import KRB5Generator
>> -from .libreswan import LibreswanGenerator
>> -from .libssh import LibsshGenerator
>> -from .nss import NSSGenerator
>> -from .openssh import OpenSSHClientGenerator, OpenSSHServerGenerator
>> -from .openssl import (
>> -    OpenSSLConfigGenerator,
>> -    OpenSSLFIPSGenerator,
>> -    OpenSSLGenerator,
>> -)
>> -from .sequoia import RPMSequoiaGenerator, SequoiaGenerator
>> +from .sequoia import RPMSequoiaGenerator
>>
>>    __all__ = [
>> -    'BindGenerator',
>> -    'GnuTLSGenerator',
>> -    'JavaGenerator',
>> -    'KRB5Generator',
>> -    'LibreswanGenerator',
>> -    'LibsshGenerator',
>> -    'NSSGenerator',
>> -    'OpenSSHClientGenerator',
>> -    'OpenSSHServerGenerator',
>> -    'OpenSSLConfigGenerator',
>> -    'OpenSSLFIPSGenerator',
>> -    'OpenSSLGenerator',
>>        'RPMSequoiaGenerator',
>> -    'SequoiaGenerator',
>>    ]
>> ================================================
>>
>> That should work with this old nss version according to
>> the log.do_compile output.
>>
>> I can't see an easy way to make these imports and list conditional,
>> so the patch would be "Upstream-Status: Inappropriate".
>>
>> Since it should only happen for the native build, the patch can be
>>
>> SRC_URI:append:class-native = "..."
>>
>> As far as I know, /usr/bin is filtered from target builds but not
>> from native builds.
> We only allow access to things from HOSTTOOLS, nothing else is meant to
> be used, even for native builds.

As I wrote, I misdiagnosed it. There's no problem with nss-policy-check.

Does HOSTTOOLS include /usr/bin/ssh and /usr/bin/sshd?
Because the test_config() class method only fails for openssh and opensshserver.
They can be ignored with an envvar.


