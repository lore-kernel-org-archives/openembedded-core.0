Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FF4C0219B
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 08:08:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.45905.1739174881427063302
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 00:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dwy70y1n;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38dd0dc21b2so1135093f8f.2
        for <Openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 00:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739174880; x=1739779680; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/401j2K102eNTKY8YJMfrVO/HzPr2zSi7EnrHn0Qtg=;
        b=Dwy70y1nbEbuqiP6LkZfW6UTrZJgkC8wdWmMsuUpg/riL4QaexRTl8R/c2Of+fj3bM
         2xkcMxKd+9U0c0dW9XTo027ZzJSG4VcP6iAeGHo59J2/6YliB8sD5WvM6Ldo/79i2LLk
         0C3SYoNO8eIqTh3t1Bxs+rXOU+AwnyfUt0KBA3gzybgYO+tgn8r4aO8hX/1wPi8m1Pq4
         EHFseI7mQVVChfczGu0xwqOcCJ+6M00X8TcOky3sxMOJFOmw88GUFuqG6xnLNfMPcXsM
         kghr8cUN9TP2gKjiK+MlrLj2/NU+iR/FgdVAFuaYCZfQ0RQpiNoEplkltbu+tSPZH7/b
         NEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739174880; x=1739779680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/401j2K102eNTKY8YJMfrVO/HzPr2zSi7EnrHn0Qtg=;
        b=ouJ0Dh1hiuus1rp08ItCIKSGt/OPVTqKxsf07Iv1J3C5kUdj9cZD+KdNGJ6plbNMYl
         3lsYbJenNtFqnsQerbMma8BgQyBdN6dYDg4rcJDA0b6OlbK4wa6lP1h+2oIJTZSLEzU7
         aU+bN0ifDpx0+3Mcoemx2NZC9PYYuCzvn0czhy/UPu+4RTM8tSm9NdKLjg3qXedGgeZu
         ZC4sBI7JorKceX+eakXMT2/mNqunOSHEiBlZ0cn0w0iX3y+2flBhXUNlFn5SAKDxDL6a
         AWYio+4gqG4OyqNBgX/GopH9QGXpy2zcBTdeP2dnbmoC464TP/A+2Y7KkrcQgK7EzGsO
         K2vw==
X-Forwarded-Encrypted: i=1; AJvYcCXx/JR/PXSYphub/6RVM82tquRVR2AhqrLsre+8mS71NKAWLYvBTQJ4CHWL5XQxqv9h07DSChboePuFFmi010wPmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzno4h1NdnacChOFfqQQ2xwVRLUNa0VsKGKsPHdpjFIdIwqa+qJ
	UqHjF92I6kJNczSoUXbY1onV0w8mOzfqQVnG5M5Q6DT8Eminf819
X-Gm-Gg: ASbGncvqyP98LqrWPq6nJVMqexizoasDiXKYn85PrLsGQpG/I9ciWe1PxtVEaroU+4J
	1vssugNkxiJHW9G6HwT7lKYssHLkiZ7UjtHxy5UgLbxV/X32wnHCHS9eNCXw+KeNrqy1dBqGD5e
	Itzw3OExKmTnGQg/afrhHV44In7YQCQBHg98Px3BCnRwV8iszNjOP9NYwjKmUyn81Y2JMHdpUDB
	REidzrhlfrKIdzgMouuCkoCr32CoP95FUuPj2DhqwCSBaFJ5/W36oCntCrZDaA4Jo+kOi+lpaOs
	OsBnx/gPgZKHjQLCnw6KZgeAmzlVSDM=
X-Google-Smtp-Source: AGHT+IEXCDgOR14srNKoJh8qmhJD2XycpQ/4zRJ8nnk1Wysn02q2vsTasdscjhnEjtYzW+4lHMO8XQ==
X-Received: by 2002:a05:6000:2cd:b0:38d:db7b:5d90 with SMTP id ffacd0b85a97d-38ddb7b6068mr4034967f8f.41.1739174879500;
        Mon, 10 Feb 2025 00:07:59 -0800 (PST)
Received: from [10.54.5.158] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm174739485e9.10.2025.02.10.00.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 00:07:58 -0800 (PST)
Message-ID: <1949d535-d442-476f-85b6-55b018c4057c@gmail.com>
Date: Mon, 10 Feb 2025 09:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] systemd: Build the systemctl executable
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Openembedded-core@lists.openembedded.org
References: <20250207071043.96282-1-uvv.mail@gmail.com>
 <26132cfd426a1494d8c42c1f8d1b6fbd347ee353.camel@linuxfoundation.org>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <26132cfd426a1494d8c42c1f8d1b6fbd347ee353.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 08:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211078

On 08.02.2025 19:34, Richard Purdie wrote:
> On Fri, 2025-02-07 at 08:10 +0100, Vyacheslav Yurkov via lists.openembedded.org wrote:
>> From: Vyacheslav Yurkov <uvv.mail@gmail.com>
>>
>> Instead of the python re-implementation build the actual systemctl from
>> the systemd source tree. The python script was used when systemd didn't
>> provide an option to build individual executables. It is possible in the
>> meantime, so instead of always adapting the script when there's a new
>> functionality, we simply use upstream implementation.
>>
>> License-Update: Base recipe is used
>>
>> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
>> ---
>>   .../systemd/systemd-systemctl-native.bb       |  23 +-
>>   ...-meson-add-install-tag-for-systemctl.patch |  25 ++
>>   ...2-meson-Bypass-certain-config-checks.patch |  64 +++
>>   .../systemd/systemd-systemctl/systemctl       | 366 ------------------
>>   4 files changed, 100 insertions(+), 378 deletions(-)
>>   create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0001-meson-add-install-tag-for-systemctl.patch
>>   create mode 100644 meta/recipes-core/systemd/systemd-systemctl/0002-meson-Bypass-certain-config-checks.patch
>>   delete mode 100755 meta/recipes-core/systemd/systemd-systemctl/systemctl
> Unfortunately this showed circular dependency errors in testing:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/76/builds/933
>
> Cheers,
>
> Richard

I believe the failure comes from util-linux. Any idea how to "inherit" 
conditionally only for target builds? (without creating a separate 
native recipe).

Slava

