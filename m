Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACC5CD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 12:05:40 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.134413.1712664336168422612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 05:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=xq4yPzS6;
 spf=pass (domain: baylibre.com, ip: 209.85.222.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78d496add91so227308185a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712664335; x=1713269135; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hj652LgWrjdJzo73ysmj/X/DJydv58wWizohEy33RWM=;
        b=xq4yPzS6iyJBVUZ1jCbKCfojwCF4YLQ4L40tvvQS5WKV+lX++bub1lOZ5esZJqN7St
         yAGnC4jsCbeaN5mExpp7uzg2TBLAP06VKW/6Ad2vXw0H0+eDgbIrh5hPmKi+tL3G+W40
         8tJggV2v+U9UXjqZAB2z60DFEU58UK0+ZbEbT4Ty+k02gIJoa+3kcWxwwCP2qA7jeg2d
         bIqHOuwrzdV2TorodZ9fzXBdI4Rb0Dmmw1UjZy3HYUFOUeJiVplcWMUwsFuHetSlLUXl
         /RyFNdiQUtvoGGzFKD0VpOtkl4Wbis1cnDTQq7euyd2Pa8oXb2OuaKGsUJgvSw5OBjkr
         sFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712664335; x=1713269135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hj652LgWrjdJzo73ysmj/X/DJydv58wWizohEy33RWM=;
        b=TIrfCjnZUgqj62zUi0mNlLR6lIUxZBU0D1jt1TflJR5ohcicYMdnIsTEooDCJviexU
         u0j03PuOmAlCJ9gKskg0d7zYwT8AJQh4qSvs8CsNyBLVPGzmIpOMFUphB4mvb8k04WGi
         OtbRUN/kq/xrKLLhr4Oq7Y/YAjkES9R0CpJ+2Kg6210ZhWqVoG1oa7+Tn7aJSWCOOHvV
         DA0tu+8MNe4IKju4y7IXsFFoY8EmNeE/mXqfbsmylarjHag67g8sWJvIOmsXdC8H7try
         xmjho839T/OvlHQkvIQzk/EdW1skwUL/fQNqbJ9Y5JLmqB0FhfXc8sENuTuLnkld04nC
         QRKw==
X-Gm-Message-State: AOJu0YwYFR3Mq173lFGN/vMGsR42nFALG2gorDZn7jrxrJoWKRxpygKe
	XjTtQgaqUka7fNfNuKLG3ZLPENvPk9RN4ukxp6KGU5qn2SzwfC2eZ0B9ueNMBT4=
X-Google-Smtp-Source: AGHT+IERel4ZO+98NJDm3rxpkc5pIc4rkkijxjcpe8yOh2lUtd8yYdZ9hlOXJnEvFOMEmJd2qQgSCw==
X-Received: by 2002:a05:620a:1123:b0:78d:6546:f6e9 with SMTP id p3-20020a05620a112300b0078d6546f6e9mr5415770qkk.70.1712664335289;
        Tue, 09 Apr 2024 05:05:35 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id w2-20020ae9e502000000b00789f3c50914sm4055493qkf.33.2024.04.09.05.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 05:05:35 -0700 (PDT)
Message-ID: <10450bd5-fd42-460d-9f24-ec89a52a08b1@baylibre.com>
Date: Tue, 9 Apr 2024 08:05:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 28/33] python3-pycparser: upgrade 2.21 -> 2.22
To: Alexander Kanavin <alex.kanavin@gmail.com>, wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
 <1712646620-16608-28-git-send-email-wangmy@fujitsu.com>
 <CANNYZj-FKvirKBxqGRX3j0OmDG5=uhbEtn1j1uKAXjWzJuqPog@mail.gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj-FKvirKBxqGRX3j0OmDG5=uhbEtn1j1uKAXjWzJuqPog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 12:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198064


On 2024-04-09 11:29, Alexander Kanavin wrote:
> On Tue, 9 Apr 2024 at 09:11, wangmy via lists.openembedded.org
> <wangmy=fujitsu.com@lists.openembedded.org> wrote:
>>   LICENSE = "BSD-3-Clause"
>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=2c28cdeabcb88f5843d934381b4b4fea"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=9761c3ffee7ba99c60dca0408fd3262b"
> License checksum change should be explained.
Thanks for pointing that out. Odd that patchtest didn't get it this time.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198059): https://lists.openembedded.org/g/openembedded-core/message/198059
> Mute This Topic: https://lists.openembedded.org/mt/105417654/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

