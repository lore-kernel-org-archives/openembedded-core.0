Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B936109447E
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 14:02:57 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11440.1774101776734702793
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 07:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FuYdnNMO;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso22440155e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774101775; x=1774706575; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KYegC91uiQpD8ixdsLOj/DAv6PM06DJC6c78vUPk1DQ=;
        b=FuYdnNMOB2L4yLZAQ3Hu9tugLduewBeSd2Ya9hUXP+HhU9DBf7oOao9CdiwHuQZp+9
         BG7im3p6nUmmhIA8QrJVGw1rKgG1VscwqFmlitw3BnTEAQnEEm91HDAeCPZE4kTViHcj
         EteJ4JCLUR9BcVksvtuG6VajzgwFEteNTnTgP0ZM3wRpReFmHk+wH+9AKoM/F1z6QAg5
         AQEtghfSyfDsZCHpH53CaBui6X2uUSMnU00slycGwt3Ts6hspGAnWUZu2Hs5yk2Gs5ec
         OxkvHsvPA0OUGY6Y8+78FeFaJW7EU8G97K4kD1M1s7qxmChCyFS7kc10uD9J2uTDEOSx
         K5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774101775; x=1774706575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYegC91uiQpD8ixdsLOj/DAv6PM06DJC6c78vUPk1DQ=;
        b=lbHDhsi8V4JW8P5kDx69SzEOoc6wrKY9Iqvo/Nza0WZsaZELkcnHmIrhckgrAjmcT0
         mtpNWntFhd0FuEg8OKlOJYxrlj72xrIqw+KqL1Dd4qscm06QEZgXM3AP1rWn2ktdD4NU
         AXO08nAuhKa0MNzqb6kteah2tYpNgsYqcOtwD4A+ex8lEU6YfiAvbeRPh0l5n8Br77Jl
         brALgU8YMWC30JL93vKVNNQaVjNqNytRxAZ2SADROZqRtquGidEao2HFjovY6+sU5rGK
         aDcPIALy5IYkOqIWwbA604miQYszYFUZp0Mwsbp41p1Ld/hnbOJ+MvQyizqsLN8cne2D
         n72w==
X-Forwarded-Encrypted: i=1; AJvYcCW6llvTYZlAaQZbgUSYoQ6atBapFDCfUGDMg2bjcGZAYmaP6ae2V9z37f3zLl9tu8Rn1RK3nLUU9t2+iVjV5ZQxqw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzAd+BrMrjGrDeMwLno9Un4L/kcy+09gdR1LqQwj+9YNs2i8Njh
	hukDBgdz/o/JsJMTPHXJeX8hsUVdLXSrEwl8evCHzI/HFYMzZZvrtN5m
X-Gm-Gg: ATEYQzzrEV2ju/27twTFLKEa7+VzB3Eq0QB0v+kFmgUDOVJDywATVnT1n2eysXPYFVw
	UxQ9f50dsmHC+F4UonvB3CTGBVmi5NyxwjeFUyDoAGg4sgCAt4thhOV1nMNqn/ipCKkHd1ocsnU
	bJy+ZfAS+DmY0U3aJMUd8wXaXcNoeL6ralbRw24rcoL15CvYNxDQwGBfJWVr7NqO14ICK59MhVW
	qix7OmKwc+kJNRK4mOHstgbvUKZX6lG/jJ9sflfU71uJtM9NSXw2tWoVHOjeyBKCW0HaVe64kPC
	ljOcmEQurK+q1jxBb2a5V/o4w+GyIgY2H5am74gYt7Mk6Nn1MjKyLv369TjzblhBVHifSic21pF
	9R8Aj1fwglwe6m8J3kQxAg3ll+KEMS7ngxeoy4FTyPoSWR9bVqKgIpWEgEnbuk9hXXtoVG7aY3j
	uH2DaMXfo8U60HSyOr4vK+oqQTS4A3sgOTkFSK1arOymERCZLBE2dzYtU=
X-Received: by 2002:a05:600c:828d:b0:486:fe39:28b7 with SMTP id 5b1f17b1804b1-486fedf8fcbmr97065675e9.9.1774101774946;
        Sat, 21 Mar 2026 07:02:54 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6471a297sm15085518f8f.37.2026.03.21.07.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 07:02:54 -0700 (PDT)
Message-ID: <8723b2eb-3931-4aaf-a406-e17fd62fa72e@gmail.com>
Date: Sat, 21 Mar 2026 15:02:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [whinlatter][PATCH 0/4] gn: upgrade to latest revision
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260321073820.1403645-1-zboszor@gmail.com>
 <DH8CJYGCGVWY.CKRVLGTIY6JG@smile.fr>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <DH8CJYGCGVWY.CKRVLGTIY6JG@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 14:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233663

2026. 03. 21. 10:19 keltezéssel, Yoann Congal írta:
> On Sat Mar 21, 2026 at 8:36 AM CET, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> The latest revision of gn is needed to build Chromium 145
>> for whinlatter. Nothing else.
>>
>> See https://github.com/OSSystems/meta-browser/pull/963
>>
>> Please merge these into whinlatter.
> Hello,
>
> Sorry but general upgrades like this are not acceptable for stable.

I can keep the gn_git.bbappend in the meta-browser PR.

But then it's not better when every layer shipped their version
before moving it to core.

> Is there a verifiable stability promise from gn upstream that would
> somehow make that acceptable? Note that I'm not familiar with it.

Chromium updates carry a lot of CVE fixes, too.
gn is just a build tool for it and other projects.


