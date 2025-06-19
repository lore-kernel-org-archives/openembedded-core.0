Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673DCC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:56:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.132.1750341400838925459
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=y7+MHkZ9;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d3862646eeso53386185a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750341400; x=1750946200; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=638W7tTiajjnES6RI/cYBiwtgNaCd/Kpu6z9Q5k2Th8=;
        b=y7+MHkZ9vkiKexZXZAjugbK6w2Hrz3sD/GC215FoROAn/Yx92FLDvwM6qipOJHppav
         noVSFwcI8/rXWlMosWv7yjN+tkdIoZ3SxC/c4/aQnomGG0h7KEB3XRUp6+f368vtvC25
         T4TRFcRpfWGfAx4bxxlkVz98hEzUp9mP8nwtFvLivkESPKLKpO6L4E6A2mydLGj2Pl18
         I+sr0pkqkg3gf7MyB4A6rdO3P+aE5qGKtphklSvJLtZLn4SDZg95yTHVwLBZsrXdCOzH
         Y0FVeEohANF4ojF/xygyG9FgL4umPe+vjOs2Y6fTYxXGy067i8WbeCw6LbCYskn2qyB5
         KVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341400; x=1750946200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=638W7tTiajjnES6RI/cYBiwtgNaCd/Kpu6z9Q5k2Th8=;
        b=pmkyCbFTG9kcSJgXIAS5f1cHic4jEhV+7sMu7OQ2/GRuy9XeqvhRzP+ApTtqsN+lud
         h3x9hgv+zmkBFySDva4fMZQy4dCAeoBoK3ikxSPEC/JD16IswzbnpbKc5jx9VmBCRIT/
         dOtmepND2SXy810JoKWjnRBjasZ+5povag1DCpyYvZ6MnXS+h2l8vZ58toJx+IbM/rmi
         yRajZ/2FUtqUIUnei5JmI2I6n1vi9cwZe9ADIx8C8kE3I4tM5u6d3ZQ3nA0Mzg97KvJJ
         q0oh7ovv75XxoUFf5d6wIjEVq3cnyXdq9M13gSbW0CKGHWYB3Kkd6EiMX/vX41u1w0N5
         ox9g==
X-Gm-Message-State: AOJu0YxLfnbzTxwuDc8+TkGG0wAPJo86EDoG5eMQz4rfmCRGaFComS+T
	E3DfspeN8C+YW2T0enypzXGzBRjBVjeyr8v7n/wsJ4MalARM5dB0VmDj06dTOu6okirEW8DbF5i
	cAAlG5Vg=
X-Gm-Gg: ASbGncvgQj+yha4v1oyWiaZVAqlOJ5QJMXwMWkQzrHd/WxcZaCgR5OIAY1DaUmqzNzD
	ELSo8Y/79QSuvPps/slRYesag34NhPEjXjDr3fDaOXt4C9Ur8Nu6HSKraS0IAVnZrwILZpeZXRE
	pY4ziZhM0QxadozbUvQM2cO7mIGvH+RoksEAyR9noMAy3sJpthggUStaNAHOstziMj6VSgfz/r9
	9f1gZYJ1RO2WEu234mij5kmgJ385Bz/0g0mHQf0tdVt4lKFtIPVq6Uxl+Hu18qmmOXhA1aIj/kP
	jRXIaQjTYczWVVPW+IYzj+rEJisM8z/iFf4qCm2faDLkaWuxl3ZTZvH2GBiMQzXCT+zM/BOQuaN
	27rcX9uiUvAt4x60YKarX4u9/oofgyA==
X-Google-Smtp-Source: AGHT+IGaaFqp56kq0edAQHwWcG6K9lF2hUesxtEObectjPgY1+PhCB4s6nEEmuZAjk523YdYk1khGg==
X-Received: by 2002:a05:620a:298c:b0:7d0:a101:f33a with SMTP id af79cd13be357-7d3c6cdc310mr3256522485a.27.1750341399734;
        Thu, 19 Jun 2025 06:56:39 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd016091adsm7605916d6.64.2025.06.19.06.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:56:39 -0700 (PDT)
Message-ID: <faea5093-ff00-46b6-a347-9da522ed0422@baylibre.com>
Date: Thu, 19 Jun 2025 09:56:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/5] python3-colorama: add recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
 <DC6B7B7A-BBA0-4F04-B08D-16DF23229A6F@arm.com>
 <e9f8371e-9752-4de7-9e3b-55932f3c3e3e@baylibre.com>
 <4a1aac8047e8389316f94c3358d8f52229574a59.camel@linuxfoundation.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <4a1aac8047e8389316f94c3358d8f52229574a59.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219085


On 2025-06-19 09:54, Richard Purdie wrote:
> On Thu, 2025-06-19 at 09:49 -0400, Trevor Gamblin via
> lists.openembedded.org wrote:
>> On 2025-06-19 09:31, Ross Burton wrote:
>>> On 17 Jun 2025, at 16:53, Trevor Gamblin via lists.openembedded.org
>>> <tgamblin=baylibre.com@lists.openembedded.org> wrote:
>>>> +inherit pypi python_setuptools_build_meta
>>> So this package uses a modern setuptools to build.
>>>
>>>> +DEPENDS += " \
>>>> + python3-hatchling-native \
>>>> +"
>>> So this package uses hatchling to build.
>>>
>>> One of these is wrong :)
>>>
>>> I suspect the recipe should inherit python_hatchling and not have a
>>> DEPENDS?
>> You may be right. Trying out a build with the change now. If it works
>> I'll re-send.
>>
> I did tweak the version in master-next since I needed to retest other
> things as well. I think it has tested ok...
I see that now. LGTM.
>
> Cheers,
>
> Richard

