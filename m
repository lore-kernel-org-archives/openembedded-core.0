Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B45F46139
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:55:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19421.1774277699260649105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JXOcKihH;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439b94a19fdso2733009f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277698; x=1774882498; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yUI+xqdgA28juZ7U+F4kErDPi1HFOWV+i6z4jJXUVN4=;
        b=JXOcKihHdAQYZRF3CW63QsdKbLOJAkcnjTtrhjkdYl8PSNrEiDMzfBEx4DRjNGxTrK
         xP2LbJ3jhYGI8PZ9S9lUufLrqpJwWub2MmiOr2PTDzFaR2nU5hQ0g5NpYL709WyW62K3
         q8NRyy45cfOHEEH/+yIhWrlbLDg7/OdmYfDbDmFkyj3SLMk3AxST45A4yzIv3k60SUYj
         wvZOeR3Ut3fmqnHZGN3tupwRI5iHIHj+mnc/E5+6d6ntYZWRSTOn5scycv+u4/sR8tBX
         rF03wds8WAp+dFP3pisf+2Luwj4JYoLCILGUTtGT9bomxefTpKAgrsbVDu5wFZCmafk5
         Hbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277698; x=1774882498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUI+xqdgA28juZ7U+F4kErDPi1HFOWV+i6z4jJXUVN4=;
        b=leeuzZkut8xc2kUKsxs2UEP5y8TPn0vgtg9U0OO0PaM6D5rTI7vmC2D7GDVJ2iR3g5
         owJC10lUZ9QKgh34sot11FUBQzBnw0Y0XJdKCG/e1oBO6qGKdMHvG8emcJkQNLhl/N5P
         i4JNlcIRJ0YwEWw1LPsw1apna/ogS18/6yzELE3icXK1QqLwtriGzEx214aTtoPw2Hj1
         Pze0mYRftAr5m0/sifygiU29H+RILbiUsh6RSxluT1O8oOtdMf6VLAuY0d64JuMNhzQk
         2yTbY1L3WmNSKWutbzKXfQ9/5pp7cZ7/9VyeImdC5WGMZ9hDzWRCNDrJmXPySJ148Ksc
         1aLg==
X-Forwarded-Encrypted: i=1; AJvYcCVeq8A1I7c8DXXMdDg4LD1tjAsSVMFhZC5/SlqtO9zfTB26MlbmONhy97i6YM/4YG5BTlZYrcj8TUMUlSHGRT+Bww==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPouSGB7XI/yc1T3TJywpnxBuzZ2u0bggRNzibeGbLM87zzTfP
	TlPcr79Tlip897VTRgruBZliKqTTEZSKY0Yys2REX1l5AqZ3rmgePdZ3
X-Gm-Gg: ATEYQzxrmHNTq6HuCfx8DFAE03weKsG4WAiqsWhhyFucQxX+taC9R/QbG+ewo1ju78k
	lTP/8K867uTzCzVviOVuZZOFXq6JsUKTVuRKCSNGEGOsDfRTiFCURDECShSHXeeGeRjVKW59rxl
	jdAdJ5CgM/N8CriirhRCJDDnm8jHfeJwWfmVQaBzM1Abzor5Pg20XM/Mx9+8+2QEawSwttNvqJq
	49XJMaK+8hm6sMpsj8/8o01Nx9SOHI2jFhObom5dLIulH+e78tU5OeWc/xd4rDXCfuyp7EO9d2u
	dz5sG3TZAgoTcmnCurIdyeVAH/WJIFq03r8z0nLcAknPuQMLU8GBal7gsDBqGQg3EcNZ3uizpWd
	saQ+Rwsz2ELo/8ib5wYL/AVkXB/BV/ebKCyH4ASCWB+gwphUy6u57xwmGWQs6gUyYQS2PKD5+Zb
	+P0H9b6C1YUOn8bt99K73rzuNp4z0Lv/Xl8T5eGLZQr/eCEAnlNBDSJYM=
X-Received: by 2002:a05:6000:144a:b0:43b:47bc:c147 with SMTP id ffacd0b85a97d-43b64271cd4mr18802813f8f.45.1774277697440;
        Mon, 23 Mar 2026 07:54:57 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c7fsm29979792f8f.23.2026.03.23.07.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 07:54:57 -0700 (PDT)
Message-ID: <68fe6fb6-5e00-4854-b5d0-9b18f8a4db09@gmail.com>
Date: Mon, 23 Mar 2026 15:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: "Zoltan Boszormenyi via lists.openembedded.org"
 <zboszor=gmail.com@lists.openembedded.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20260312120024.3745232-1-zboszor@gmail.com>
 <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
 <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
 <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
 <CAMRc=Mc29fgKQ8vMYyTB7eHzhrbxp44o02Tq73dYhjTz45FHEQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMRc=Mc29fgKQ8vMYyTB7eHzhrbxp44o02Tq73dYhjTz45FHEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233743

2026. 03. 23. 15:45 keltezéssel, Bartosz Golaszewski írta:
> On Mon, Mar 23, 2026 at 3:40 PM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2026. 03. 23. 15:34 keltezéssel, Bartosz Golaszewski írta:
>>> On Mon, 23 Mar 2026 15:23:52 +0100, "Zoltan Boszormenyi via
>>> lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>
>>> said:
>>>>> Any hints on what could be wrong? The same config builds fine without the
>>>>> new option. It's just a core-image-minimal on poky with a few python packages
>>>>> from meta-openembedded.
>>>> The problem is that now the directories are
>>>> ${libdir}/python3.14t and ${includedir}/python3.14t
>>>>
>>>> Note the "t" suffix.
>>>>
>>>> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb
>>>> b/meta/recipes-devtools/python/python3_3.14.3.bb
>>>> index 7a1ad1e386..492f2f93f0 100644
>>>> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
>>>> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
>>>> @@ -47,7 +47,7 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>>>>
>>>>     CVE_PRODUCT = "python:python python_software_foundation:python cpython"
>>>>
>>>> -PYTHON_MAJMIN = "3.14"
>>>> +PYTHON_MAJMIN = "3.14${@bb.utils.contains('PACKAGECONFIG', 'freethreading', 't', '', d)}"
>>>>
>>>>     S = "${UNPACKDIR}/Python-${PV}"
>>>>
>>> I think it's more fine-grained, because I'm seeing this:
>> I also see other issues popping up, first in python3-installer-native.
>>
>> Probably this setting ("python-freethreading") should be a
>> DISTRO_FEATURE and then the python3 recipe would use that
>> to enable its PACKAGECONFIG.
>>
>> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
>>
>> I suspect that both native and target builds of python3 would have
>> to use the same setting, i.e. DISTRO_FEATURE and DISTRO_FEATURE_NATIVE
>> must contain python-freethreading. Some build helpers (skbuild, etc.)
>> does not seem to distinguish correctly between host python and target.
>>
> But is there a config for which it ever worked?

Not really, this change was just a stab in the dark.
Probaly it should have been an RFC patch.


