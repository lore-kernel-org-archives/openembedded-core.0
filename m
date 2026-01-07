Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561C7CFD625
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 12:47:15 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4923.1767790026239067948
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 04:47:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=F4FqzWqi;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so14923705e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 04:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767790024; x=1768394824; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lf12iD+9GCBkbP1FkohZthPFYMYEgpbTlpniQ4l2do=;
        b=F4FqzWqiV6H7S0B9dM24H6S4iq0XIVVdcUvSZws9xdrn/NxU+JvQ78Jv6XE3KOhw6g
         W+SRANh5+mZCYxcEuv0KePxav5/zD3GkhVAc0kng7d6Mw9zVaz9b1MjzrnvsF1Yiv2ji
         N6gRcPUg7XEwLe4n8CrniA2sin/6M2GjS6r9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790024; x=1768394824;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lf12iD+9GCBkbP1FkohZthPFYMYEgpbTlpniQ4l2do=;
        b=lGxvZtQf/zdkQ1KgCfBf2a3XC/FxT9TU9noKxZOsVrFOHfxEA24lavBjGZt9TufgLl
         ym0Jdl8EPsmaddD+i7pRcpGVcZl2Yb9mLmBxY6d734X3ldkRnf70Z7g4UFpyLbwfHbjU
         cZt4EWk4UPzz2fMQvQBqb2Q2hV0I71DsxjWt8dvVzr0ScAF8TM3fCLTNPcqWK3FxynJf
         3KG6JgzGB1BsjSi23IE2re4vyCLWr35Le/GVZcWC31YiItoJPjAmaLdQvC8x7thFYVJN
         +H1E5PZ6pu+GZ64jRuWwGenLOL3wxbEFYZjU+Zcy/RfA6kYLkNdGbj1IHbWrujeTR2Q4
         g2LQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtow4yOD0N52WesQTJzY/W8GC88IAqADK6wRNtVKKxOZO/7mCdeVS2Xrhz6+F5wqEMZMZEQ2PSJj6jVVkrAkg2cw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4IaRfHdp4dlO+UFBH9nX9SDJ+cmCjzDZuhg8Dd54CuB/t0VJE
	AeA5AphyMmaXtYVsTCPIOG6gX61NvGejm7kyuYeYnD69eY/5BOojTiKP6zj9qNwUVKQ=
X-Gm-Gg: AY/fxX6fY2yR1Do0sFIgH/HcI1wJQXHYEM2HoDbVsVYjsJfqauM5vVqeR1WWCHbOMnt
	A4buxigleMVnRr3M6cV6vbUqqqy5wm6chgmLRgU8RMMsC8KuC+02aW1GVrv5Rm9FO11SbGR+esa
	IrqM+rvr0jGnuERdD9DVOPGTrWMnPUsg0bNSMUoJyuR/m65yxxZx69bOW11iXXpErkdy1ni/AFJ
	vD7lTev+NUDX0LbpNJHNqXbF39PQUDNtjF9bmFoalqcU5L6/TL8DkuuFDnEwqu3meRM95oru15N
	NwYVTBHOHwdbh9zHoQOrEPq82q0l4zcWJrXiNIe5cMrKTDfSU7UbYiRb5Q5sUsa988fKF9UJD7b
	CrdHKSTQKTseoD6/4BpVk7ezxMWGsbWpQBXXluGIxtO598EQwXuoUqRz6fXgeWBOgxXXHuDjH3b
	A5KlNthENLbqP+oyxEiApkzTYQV6MTB8EfxHInbWernOK+kwKyp9Yl7nkEuN3Q0eGNPx/As8vPr
	OW9DbOSNCaIL6LHaJSIGA3swwdT3plNTODChIGBrXeX3fnEWAI=
X-Google-Smtp-Source: AGHT+IFusr633C403yYdInHa+2J3B6JJIMEi7EeVDZB+w+nJNLp120gPm+hlbHSen0z4ofE55GA3iQ==
X-Received: by 2002:a05:600c:4ed3:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-47d84b34785mr31348865e9.21.1767790024600;
        Wed, 07 Jan 2026 04:47:04 -0800 (PST)
Received: from ?IPV6:2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544? (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8717a48asm11406805e9.8.2026.01.07.04.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:47:04 -0800 (PST)
Message-ID: <04c34334-5342-4711-bcdf-177da37b6fdc@smile.fr>
Date: Wed, 7 Jan 2026 13:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
To: Paul Barker <paul@pbarker.dev>, "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Jiaying Song <jiaying.song.cn@windriver.com>
References: <cover.1767772757.git.yoann.congal@smile.fr>
 <34083b26ca1e5a52c627e41a1adbeaacf79dfa6d.1767772757.git.yoann.congal@smile.fr>
 <c19daed92270797942ebbb4b51c6f6b03fec16b3.camel@pbarker.dev>
 <AS1PR10MB5697BF5D70C1BCB02E7F1129FD84A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev>
From: Yoann Congal <yoann.congal@smile.fr>
Content-Language: en-US, fr
Organization: Smile ECS
In-Reply-To: <5549493a25264654b39a48522691b15feece176c.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 12:47:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228998



Le 07/01/2026 à 13:32, Paul Barker a écrit :
> On Wed, 2026-01-07 at 12:19 +0000, Marko, Peter wrote:
>>
>>> -----Original Message-----
>>> From: Paul Barker <paul@pbarker.dev>
>>> Sent: Wednesday, January 7, 2026 12:49
>>> To: yoann.congal@smile.fr; openembedded-core@lists.openembedded.org;
>>> Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
>>> Subject: Re: [OE-core][whinlatter 04/11] python3-urllib3: patch
>>>
>>> On Wed, 2026-01-07 at 09:08 +0100, Yoann Congal via
>>> lists.openembedded.org wrote:
>>>> From: Peter Marko <peter.marko@siemens.com>
>>>>
>>>> Pick patch per [1].
>>>>
>>>> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-66471
>>>>
>>>> Signed-off-by: Peter Marko <peter.marko@siemens.com>
>>>> ---
>>>>  .../python3-urllib3/CVE-2025-66471.patch      | 930 ++++++++++++++++++
>>>>  .../python/python3-urllib3_2.5.0.bb           |   1 +
>>>>  2 files changed, 931 insertions(+)
>>>>  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-
>>> 66471.patch
>>>
>>> This seems like a very large patch for a CVE issue. The changelog entry
>>> in the patch also says that the API of urllib3.response.ContentDecoder
>>> is changed.
>>>
>>> We should look for a narrower fix, and only take this if there is no
>>> other option.
>>
>> I originally didn't want to patch this CVE due to this reason (and didn't patch it in kirkstone).
>> But since this has landed in scarthgap, I decided for the same in whinlatter for consistency.
>> Should we revert it from scartghap?
> 
> I don't think we need to rush to a decision.

On my side, I need to do the whinlatter 5.3.1 release build on Monday.
I propose to set this patch aside to not block the release and the other
patches.

For scarthgap, we can revert the current fix and add the "proper" fix
when we have it. I'd rather avoid a patched->applicable transition on a CVE.

Sounds good?

> 
> Have any other distros patched this CVE? I see it's still unpatched in
> Debian [1], and Arch Linux is on v2.6.2 already [2]. Ubuntu has taken
> the patch [3], we should check if they've modified it or directly taken
> the upstream commit.
> 
> [1]: https://tracker.debian.org/pkg/python-urllib3
> [2]: https://archlinux.org/packages/extra/any/python-urllib3/
> [3]: https://launchpad.net/ubuntu/+source/python-urllib3/2.5.0-1ubuntu1
> 
> Jiaying Song: Any thoughts on this? You did the backport to scarthgap.
> 
> Best regards,
> 

-- 
Yoann Congal
Smile ECS


