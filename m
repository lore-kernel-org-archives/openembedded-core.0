Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FCCC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:27:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.13680.1739460424085911855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:27:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A2la6rIy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43937cf2131so7245945e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739460422; x=1740065222; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5vvKyMx9Uok7kClyphySmS7qnfuLL92Z+2kqwhDm9yk=;
        b=A2la6rIyHWyZc94qcxYFGguFvBSiAZFakPjFCNL0LchgejupdFY7IfSrKWoPyxLL6Y
         My9AoUHTRRgzMO36DHRodbhOYtpRFOahM/UXxmFnf4Ezd7JHj5KjwfwksIT6UKNPRy7a
         pdXBsknjKkVe1CVn3l8z3j5DbSNuGUM0jhVn2d3zH89uLWevK5quXu+a8ijQivxgEmQ1
         73kVKvmj+/T3XGHQWCfyFnrwdY+NqVpVWavjHyi5sPNm3/rzUKIcQgO7wlM796wXqSyu
         I5tWff/Mlh6CpA8PpNsCmomdIgiHouhOtxYjPG9JByY/TN4nCyV/evdY7c43ScdHFpOb
         W/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460422; x=1740065222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vvKyMx9Uok7kClyphySmS7qnfuLL92Z+2kqwhDm9yk=;
        b=xCXtSDkRJ9JqPQoWtJsQKBKZRsLiVuUw891puOvnuq2ODHBtQ95+BSYl+QSLt242rQ
         Mg2iDVer73Eswd/nW/ZrqHpkce4W9uBihIbZ1Khb2sUJk6yNxOasFJ2PsZIK175P9ddm
         CZcdDjpvSQKQYwyWrVljr2Nq7wssDp4hmZKQwmBhKdWxnszecodhQ4jRhDg7f1i4v86H
         heJVOC9bvhSUlMxyGaMH44uNO+YCrpCww831DjA+9+WnpKMzA4NydUJnnY5/6wP4Wu5a
         bWVQIyVkJOZQUPnEDw3WvYHiWFlb1uwxCVzCWCXl3YeuqMv1TcTOVeAtyzCKvhkusO3y
         f/lA==
X-Forwarded-Encrypted: i=1; AJvYcCVL3kf+vVhYAdhDZVW4NrXV7ZH6QhGqtm0tNBLK0fE7M22vXc+NqBOemz9E4Dhf9+qBW9nYZJCbXxTU4gXW49biGw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSqwm/5doWL+H5yRqhaNprM9sSQuEScbHxMGakUfwKk+8puO1b
	0OzeZ3VKK7NQ3v/tZ2AxQiw00MpLUh1bTnq6lELi0vo88fp1fycS
X-Gm-Gg: ASbGncs6fv+A6PsxFZnMpqUHUSH7mQT7lOh4BCXeH3NHPPox3I/PoxAJuGGRgzJgckN
	kt0uaKsebBmUJl1HB4NJMsh1I+FeCsLnyl0s6m1zU9NmXRDArixi6gBn14SWa7/FNnYIur9AQQD
	TEdmxFnYk/mhO0vRCrr18GabTvxpVi3yeMOMwD1sdCPAp0RQTBncBlSkg9Aiuojqs+8QPb8WLU0
	0i3heZ1/uZsqrSQgyDR9++tnzK7AkFX1vhY6QXb6nkWdY5MPUi7yVZ1HetK5FNr3n1xdB0EDf1s
	nWNCshw7hpM5hx1P1F27bt6ChLaB3p7B/pyt4rYX1ZvO1qYF
X-Google-Smtp-Source: AGHT+IFT/YixtPHjpsqf8BtrgIYN1tiTruCoiX7zmyjVqWEjN4jL/EdkHIvLwGS1LKXjfLN/yiQUiQ==
X-Received: by 2002:a05:600c:3b0d:b0:439:5747:7f2d with SMTP id 5b1f17b1804b1-43959a840eemr63873475e9.21.1739460422122;
        Thu, 13 Feb 2025 07:27:02 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25a0fe5esm2192656f8f.99.2025.02.13.07.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 07:27:01 -0800 (PST)
Message-ID: <8f8bc643-200a-4683-ab8b-bdec41cb285b@gmail.com>
Date: Thu, 13 Feb 2025 16:27:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
 <1823CA649EDDAA06.9844@lists.openembedded.org>
 <ecec863d-30bc-430b-9705-1ab720117550@gmail.com>
 <aaee021d000c6419c813d9b095f3e092aec15a72.camel@linuxfoundation.org>
 <3cd9d088-f691-4252-88d9-74fbd6ef80eb@gmail.com>
 <CANNYZj_-7X7bbXwX0hcj68R7z7YqaFQ=5gwZKE3dQiGpubaMqg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_-7X7bbXwX0hcj68R7z7YqaFQ=5gwZKE3dQiGpubaMqg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211356

2025. 02. 13. 16:16 keltezéssel, Alexander Kanavin írta:
> Generally it's best to resend the whole patchset, as sending
> individual follow up patches doesn't scale for maintainers, they can
> easily lose track of how to combine everything into a non-broken set
> of commits if many people start sending partial patches at the same
> time.

Got it. I re-sent the whole series with this small fix included.

>
> Alex
>
> On Thu, 13 Feb 2025 at 16:14, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2025. 02. 13. 16:06 keltezéssel, Richard Purdie írta:
>>> On Thu, 2025-02-13 at 15:43 +0100, Böszörményi Zoltán wrote:
>>>> 2025. 02. 13. 15:20 keltezéssel, Zoltan Boszormenyi via
>>>> lists.openembedded.org írta:
>>>>> 2025. 02. 13. 14:36 keltezéssel, Mathieu Dubois-Briand írta:
>>>>>> On Wed Feb 12, 2025 at 5:35 AM CET, Zoltán Böszörményi wrote:
>>>>>>> This ships a crypto policy file for rpm-sequoia.
>>>>>>>
>>>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>>>> ---
>>>>>> Hi Zoltán,
>>>>>>
>>>>>> I believe we have a new issue with this version:
>>>>>>
>>>>>>> python/build-crypto-policies.py --reloadcmds policies output
>>>>>>> /tmp/tmpqvyryz80: line 5: Bad configuration option:
>>>>>>> pubkeyacceptedalgorithms
>>>>>>> /tmp/tmpqvyryz80: line 6: Bad configuration option:
>>>>>>> hostbasedacceptedalgorithms
>>>>>>> /tmp/tmpqvyryz80: line 8: Bad configuration option:
>>>>>>> requiredrsasize
>>>>>>> /tmp/tmpqvyryz80: terminating, 3 bad configuration options
>>>>>>> There is an error in OpenSSH server generated policy
>>>>>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/1027/steps/11/logs/stdio
>>>>>>
>>>>>>
>>>>>>
>>>>>> Can you have a look at this error please?
>>>>> I tested the recipe on Fedora 41 with:
>>>>> * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
>>>>> * faking uninstalling it by renaming /usr/bin/nss-policy-check
>>>>>
>>>>> Both worked.
>>>>>
>>>>> Some of your build hosts where nss was not installed complained
>>>>> about executing nss-policy-check unconditionally, which is now
>>>>> fixed.
>>>>>
>>>>> I think this is on a build host with a very old nss version
>>>>> installed.
>>>>> Can you uninstall it?
>>>> I found an alternative solution but it involves patching out
>>>> most of the policy generators:
>>>>
>>>> ================================================
>>>> $ git diff python/policygenerators/__init__.py
>>>> diff --git a/python/policygenerators/__init__.py
>>>> b/python/policygenerators/__init__.py
>>>> index 0e3013e..180fb2a 100644
>>>> --- a/python/policygenerators/__init__.py
>>>> +++ b/python/policygenerators/__init__.py
>>>> @@ -3,34 +3,8 @@
>>>>     # Copyright (c) 2019 Red Hat, Inc.
>>>>     # Copyright (c) 2019 Tomáš Mráz <tmraz@fedoraproject.org>
>>>>
>>>> -from .bind import BindGenerator
>>>> -from .gnutls import GnuTLSGenerator
>>>> -from .java import JavaGenerator
>>>> -from .krb5 import KRB5Generator
>>>> -from .libreswan import LibreswanGenerator
>>>> -from .libssh import LibsshGenerator
>>>> -from .nss import NSSGenerator
>>>> -from .openssh import OpenSSHClientGenerator, OpenSSHServerGenerator
>>>> -from .openssl import (
>>>> -    OpenSSLConfigGenerator,
>>>> -    OpenSSLFIPSGenerator,
>>>> -    OpenSSLGenerator,
>>>> -)
>>>> -from .sequoia import RPMSequoiaGenerator, SequoiaGenerator
>>>> +from .sequoia import RPMSequoiaGenerator
>>>>
>>>>     __all__ = [
>>>> -    'BindGenerator',
>>>> -    'GnuTLSGenerator',
>>>> -    'JavaGenerator',
>>>> -    'KRB5Generator',
>>>> -    'LibreswanGenerator',
>>>> -    'LibsshGenerator',
>>>> -    'NSSGenerator',
>>>> -    'OpenSSHClientGenerator',
>>>> -    'OpenSSHServerGenerator',
>>>> -    'OpenSSLConfigGenerator',
>>>> -    'OpenSSLFIPSGenerator',
>>>> -    'OpenSSLGenerator',
>>>>         'RPMSequoiaGenerator',
>>>> -    'SequoiaGenerator',
>>>>     ]
>>>> ================================================
>>>>
>>>> That should work with this old nss version according to
>>>> the log.do_compile output.
>>>>
>>>> I can't see an easy way to make these imports and list conditional,
>>>> so the patch would be "Upstream-Status: Inappropriate".
>>>>
>>>> Since it should only happen for the native build, the patch can be
>>>>
>>>> SRC_URI:append:class-native = "..."
>>>>
>>>> As far as I know, /usr/bin is filtered from target builds but not
>>>> from native builds.
>>> We only allow access to things from HOSTTOOLS, nothing else is meant to
>>> be used, even for native builds.
>> As I wrote, I misdiagnosed it. There's no problem with nss-policy-check.
>>
>> Does HOSTTOOLS include /usr/bin/ssh and /usr/bin/sshd?
>> Because the test_config() class method only fails for openssh and opensshserver.
>> They can be ignored with an envvar.
>>


