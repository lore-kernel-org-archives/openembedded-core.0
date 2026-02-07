Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6428FEE0AE9
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 15:13:13 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6487.1770477184861947471
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Feb 2026 07:13:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eHfsgoBI;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45f126d4794so2067498b6e.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 07:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770477184; x=1771081984; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=02H+KDcw+36lChFhXaWvQyduGE+Lh8j/NL971r4FK0k=;
        b=eHfsgoBIE3iKtO4veiHAsYuKnT5fhOmetLKJHDzYI26YNqItAFzimu7wZcYM9/2WXM
         +d0kT3vW8tyVNCXCNNOeeZZFYRhVhU/cqj3zHp2rSfgHBjLAo/eRVQA6oLsb4P2xKjBv
         Z6YZQ2r/jBF/cQPZ5e5mG5x7mNcTUqi7Dr+MJobejDP13VF8WrKG1hHAEAUYyoj7i4II
         oVxkyth5y1KcZXZ9VkdoI3nOzf4tAmxQ+MaVIiSDuie8iuAJ7REzShtpHTGw5mRotEkV
         oaE0IDcy4FDAHsSJ8mjoVEkw/n045CtFbcmlzm6ZufMp/O4pjNGB940DYxyp4uRtrGwJ
         qBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770477184; x=1771081984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02H+KDcw+36lChFhXaWvQyduGE+Lh8j/NL971r4FK0k=;
        b=FWtT5+YaxHWFLh8pg+HIPclsxNWyF40LpkmLjJOUbux9L7OLhCzosWtJxX9Pjhesgq
         7Ik8nDCzu/3bDWQ+/8ifXxq1Y23Fxf0YAEzo1Ec9DZ/hKDYfW7cRZAvp5x74Z1cXE/K/
         er+L3Cn2RInP49h3U6ZAYla+MFheFlesPd6NFf0MtsSmgGNWedrEYVSbn9kT76Ud8dnX
         DxBQ1m0oxeCgkHvtAHzbJkJ1209DLIIZegdRiRr3ZJt57Hfav5t2ysSXXT8C8SmZqtAi
         jPj3AZinayRre2+sgFxSpVXbopooqnzQXpdK+X6Ov9T+9Ga89LD9d7zSN8DE7axRBYMQ
         7Y+g==
X-Forwarded-Encrypted: i=1; AJvYcCUPw8/KHn/e8T9hat1QStXpGDgP905JgtrOh7d7D3+i6yrra3nr6ol2QQ3nAftT2RnYykev8xeTR13xXAkHJZ8d/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgpzZ6VT3+RpUdpo4W4N+hd2VsqSwRCJCYi3V44FMXx5XguKyy
	2KiUT6s1dkimZY3A9/MLG0b1UHi0dFvH1D07fYXex4/7cdRUxPj5Jmhg
X-Gm-Gg: AZuq6aIAoHPDbna/J/lVwKeWJvkOSB9EVRTVQvo6EUxDy2aKcc+iheqSrrlyVh5o4in
	O7m1rBNi4NoiddPJ0buA7O5s+oDWmUj2BF2czk+Kdt3nnts6XoDLwUSdBjZBiJrXecmYl5C64hu
	SZdf4mA6cLZJ1cdg4rM64HiFxkTVoi/dTEsTTkx+VPIBv5dZvSuQh62kCFqkJfCDg12BYG6lcu8
	TZu6i+u60HjxngJ8X0n/8yemNl6Za7QfwNEkJYH1fANwzRka9kWbu1Brlj9HcOT5/AGk+L5z9Yy
	ZJhJ2O1KTeKPuJr1xZo8DjDvK2IfVe6Cgk8ck2DUyaQhbXGBGpzFkswAlcz7C+0SsjY1mHSFLfH
	8dJYk7UMFxt0tNVYiJXtXP05zxyXVzscwCYjqbKi+HgUUssSryfDnXZrxUNE4jGE1KDeutg/Tx7
	TB7WPQQOL4JUS+VUXGQzCrJzchrQ00TsucFLz0VAspmx5wMdGayjAe7WAjVkfSXPKd
X-Received: by 2002:a05:6808:22a8:b0:45e:f411:242 with SMTP id 5614622812f47-462fcace900mr3383452b6e.44.1770477184007;
        Sat, 07 Feb 2026 07:13:04 -0800 (PST)
Received: from [172.26.252.3] (97-118-253-141.hlrn.qwest.net. [97.118.253.141])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-462feb0d786sm3400302b6e.11.2026.02.07.07.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 07:13:03 -0800 (PST)
Message-ID: <c5abc604-1758-484e-ac1f-e6c956bf37f3@gmail.com>
Date: Sat, 7 Feb 2026 08:13:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] probably a simple question regarding running
 "fw_printenv" on SD card partition
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <0b4b896b-3101-ab92-1911-21c3622f9a7a@crashcourse.ca>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <0b4b896b-3101-ab92-1911-21c3622f9a7a@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 15:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230671

>   i've tried various combinations in that config file, including stuff
> like:
>@
>   # MTD device name   Device offset   Env. size   Flash sector size
>   /dev/mmcblk0p7      0x7e000         0x2000      0x200
>@
Hi, Robert

You specify the device offset, so the block device [1] should not also
specify a partition.

The flash sector size should not be specified.

Double check CONFIG_ENV_IS_IN_MMC [2], CONFIG_ENV_OFFSET [3], and 
CONFIG_ENV_SIZE [4].

With CONFIG_ENV_IS_IN_MMC [5]:
"[ENV_OFFSET and ENV_SIZE] are in units of bytes, but must be aligned to
an MMC sector boundary."

[1] https://github.com/u-boot/u-boot/blob/v2025.01/tools/env/fw_env.config#L25
[2] https://github.com/u-boot/u-boot/blob/v2025.01/env/Kconfig#L193
[3] https://github.com/u-boot/u-boot/blob/v2025.01/env/Kconfig#L564
[4] https://github.com/u-boot/u-boot/blob/v2025.01/env/Kconfig#L601
[5] https://github.com/u-boot/u-boot/blob/v2025.01/env/Kconfig#L229-L230

Clayton Casciato

