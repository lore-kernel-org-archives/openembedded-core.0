Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF85BC021BC
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 10:43:29 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.2861.1740566604052239621
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 02:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fr7FBjfk;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abbdc4a0b5aso143031166b.0
        for <Openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 02:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740566602; x=1741171402; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/4Hm9TW2Nz9rh98FJyARl6bbitW8o7Gjq1jLzxIawiw=;
        b=Fr7FBjfk+XDIEyW0mpNwcwTZc4cSfJc2BNwR/zaYTbW9VqYyyV2V4H067uwUAWiRyp
         wvfe0EsX7FPadeiF5Oubtz8RVFy8tgrrS/vSH+owrMM5IU3HNOZtRPOpdOm+FQzNalB9
         zJFHD/7mlwGfmGWZ9JJKBpqx76wYhnngqczMGij3APH+byu+NsXsllKYlhTX/HksBz/d
         VHqY2nmlmxyMJMmThLFKnNQ0fw9iNm3LvsGrR84cDiqy2ltsfFFXplRS5XRQa5MEqRjB
         a4himYEkR53uE8Ndt+Mw0P7jyW34Dd0jSby8jHiK94Un4vkvbR+azJfNkJvRfBUxS+Lf
         VlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740566602; x=1741171402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/4Hm9TW2Nz9rh98FJyARl6bbitW8o7Gjq1jLzxIawiw=;
        b=QwVqrklVqybIcbbOvf+XVCv9xDBTF4eGJioIJduXeXLGZYYVQdRkNnyUvcVAkol1N8
         cCkj+F9AP0QpaxpsIp0+Ag1m0qJyDHCY3nJB29ABYp1pvh2JVf6/ipYNOLixXAgMDsVs
         UYxBjjqu0VCigGoQoshEEExkr5Z8MEchIGyA9Ljaq/Le8S5xKlVlBOreYgjDzVKC5T+o
         PBICcMduyFkl1VysiYuO8h2N7Hrruxw749lTOHSmWhFIC7wf0ObBzwpTGO478ypNyczO
         uUgeQN9aSPrB8ZKX7g0czjRDpYYZ5bjJZErqDAuAfadhXbmYP8AZRAtJoIvUXfzKPc4M
         55Lw==
X-Gm-Message-State: AOJu0YyV2aoGdjjGu/lI2AlJ4JbZgoTArmFrFYewBYxywzAAq2tTW86C
	POAmLyMbbXp5Mp/QenqkG7SzlCjRyY+dua0OcuwJSWBR+/YVHroJ
X-Gm-Gg: ASbGnctDnCdHfH9fp2Yrntu8B3hd5eTWo4fw63daaCXS5aEIiGS0F16ZErsT/TPMfZq
	Rzxdzqfd8MXX+ZUixpQZMe9hHs8PbkPcQUSfhyslgiS5YchXeUhDaUTqpdPpZyH3uQGUlX6lZxJ
	L6Ku3KeHfovmN+F8QmEB2nmRvAIIodomvwk0payVa1wEtmOiA9xpdO8Q45lEsjg5c+h6bDjWf2L
	s+tkDKfRRndYCl6z9IL2mNvGHjAIEpAxOyEOFEZWZFsVfp5LUMhOItxJw7AqM7OqgWuydPRTg2P
	yLbFCtJ5xpDJ4Px1WcN1P4VCwma6MJCSidto
X-Google-Smtp-Source: AGHT+IEgLmCEI6FZB/EUDsmI34UNHiYluQY5v0PPpdzRwereCJI8GLpvrVvZCfGmmroiIDY+rvNaXg==
X-Received: by 2002:a17:907:cf91:b0:abb:bb82:385b with SMTP id a640c23a62f3a-abbeddc5eb9mr2324173966b.13.1740566602188;
        Wed, 26 Feb 2025 02:43:22 -0800 (PST)
Received: from [10.54.6.182] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2046462sm303403266b.130.2025.02.26.02.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 02:43:21 -0800 (PST)
Message-ID: <2b44ca06-2d0c-4df9-9d3b-76ac5dcf41cc@gmail.com>
Date: Wed, 26 Feb 2025 11:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
To: Ross Burton <Ross.Burton@arm.com>
Cc: "Openembedded-core@lists.openembedded.org"
 <Openembedded-core@lists.openembedded.org>,
 Alex Kiernan <alex.kiernan@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20250219103908.42513-1-uvv.mail@gmail.com>
 <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org>
 <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
 <A5978220-EBAF-4C51-8587-76498A346624@arm.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <A5978220-EBAF-4C51-8587-76498A346624@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 10:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211951

On 25.02.2025 15:48, Ross Burton wrote:
> On 20 Feb 2025, at 15:33, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
>> Isn't is supposed to be created on first boot?
>
> Yes, ish, but our rootfs is read only at this point:
>
> [    7.639766] systemd[1]: System cannot boot: Missing /etc/machine-id and /etc is mounted read-only.
> [    7.641135] systemd[1]: Booting up is supported only when:
> [    7.641844] systemd[1]: 1) /etc/machine-id exists and is populated.
> [    7.642588] systemd[1]: 2) /etc/machine-id exists and is empty.
> [    7.643279] systemd[1]: 3) /etc/machine-id is missing and /etc is writable.
>
> On 20 Feb 2025, at 16:03, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>> I do know that it was a horrible thing to get right when I rewrote the
>> shell script in python (which I'm very glad to see the back of):
>>
>>     # If we populate the systemd links we also create /etc/machine-id, which
>>     # allows systemd to boot with the filesystem read-only before generating
>>     # a real value and then committing it back.
>>     #
>>     # For the stateless configuration, where /etc is generated at runtime
>>     # (for example on a tmpfs), this script shouldn't run at all and we
>>     # allow systemd to completely populate /etc.
>>
>> It may be that this behaviour was wrong in some cases, but at the same
>> time, I remember spending a lot of time getting this right!
> It certainly looks like it’s “tricky” to get the right semantics here because the range of potential use-cases is too great.
>
> I believe we should be writing /etc/machine-id at rootfs time if systemd is being used.  Currently this is done in the systemctl class if it writes links, and then in the rootfs class if the rootfs is read-only.
>
> I think we should consolidate those into the rootfs class, and give the user the choice of whether to treat the image as booted or not by writing either “” or “uninitialized” to the file as per https://www.freedesktop.org/software/systemd/man/latest/machine-id.html#First%20Boot%20Semantics.
>
> tl;dr: if it contains “uninitialized” then this is the first boot, otherwise it’s not.  By always touching the file we break the ability for anyone to use systemd-first-boot or ConditionFirstBoot in their own units, which seems wrong.
>
> We’re about a week from feature freeze and getting this merged would be great, do you think you can finish this off Slava?
>
> Thanks,
> Ross

I definitely gonna try. But I might be missing something, because I 
thought it sums up as follows:

RO rootfs -> empty machine-id
RW rootfs -> no machine-id

And it does work that way when I rebuild my image with or without RO rootfs.

Richard, could you please point me out which test actually failed? I 
looked at the logs, but most of them were "Skipped".
Does the test explicitly remount rootfs as RO perhaps?

The other option to have a real machine ID will probably mean to build 
machine id and leave it up to a user to decide whether they want to have 
such image. But I don't think it's wise to add this option now so it 
ends up in the next release.

Slava

