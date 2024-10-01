Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46E3CE7D1E
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 12:47:19 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.80748.1727786832329961848
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 05:47:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Ve1KySGF;
 spf=pass (domain: baylibre.com, ip: 209.85.166.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-8324124a172so269109339f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727786831; x=1728391631; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EBFTX2lnaKRkbmJFu5GCDimHKxusC0EGfVk0Edv8xFc=;
        b=Ve1KySGFMPEd+uYS5ptJU268l+SNmnuzJtC4a52znxz7Nwo4Vq1nPhH8rBaC+BooV1
         1Wi7CCwwlIZvEX5YQDoFabYWid/HRh+nc4JB4g2neYOOaVVvSpGePBYRtaQhzl+0Fb5L
         ajbNkYBVdB6I4bWXdOMbYeNOnf4oNvGmafvOPDIoNHP2zeOfCuldd3d1JZ9SCeAZLAUY
         3TwxCUnEmsW+H44z08Ie+wz9r5s0pRBjEHanvxyxrMFtIDO7+C6kvvYHXpnW+dJt1kC9
         Kh/ygQ1ggstAATIzUTmEInDkIENhlCn8SXGYT1ScUx37oN6z94LV3T8Mxk5xbsJ9Q10Y
         tedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727786831; x=1728391631;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EBFTX2lnaKRkbmJFu5GCDimHKxusC0EGfVk0Edv8xFc=;
        b=fssCZx1mUUQkHS2DItBxik/9ZDr0gmoC+kalPjZskT1MoGTLATeZxKt+9Q4C6Zkzk7
         xYIH/EWLJrYkxiomxlso1h/l3Cc0hQyaMnRTooMp6Wmt5v5NOzsBmiaDFOd0Ic5BZTES
         Is/7kAnKaA3/gpo8BMEumDhOI8/arIK7KYCCeR5t1UKHKlTmCekVgKhkwstLoYLdSxny
         qINpFUxRYYFnmvr82ztDuI/rszc0+BHqsxp3MxOUubGe9ThZAfOm+tSl/BYsstNkESZ2
         OxK73En3fRjqh8c1HnTCqSng2QTmHXisnp+DLbXOxVbu5mbokO2q9slILt1Q0wlGUofw
         gZ6g==
X-Forwarded-Encrypted: i=1; AJvYcCX2gcdVPYXNsu+SFmhcMXp7dt0YmN32KaK5eErHqXRcQWoGyleDbR5D9A2RjjIAJD4vBjQ0nnRVcQYuOcTAhQ9H1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyL5Xfc+uUM+XwlwJAXXhL3bXd3hpHd5TV/nvNPERpITNzrfyrM
	HbB+7AKjad/0oycUUbkHMmKbktsRnAO1o56ulNTxJhimPe8BUHfLL7MnLBwGinCWSsyEEIrjt7r
	xwGA=
X-Google-Smtp-Source: AGHT+IHyVL2YalWtFCHKtvIT6lw1w8auoPpjMOxDxyY8aJsoPQ3TIp4zJnSt4J1v3tochynDpSPA/g==
X-Received: by 2002:a05:6602:6b87:b0:82c:f85a:4dcb with SMTP id ca18e2360f4ac-834931d0945mr1240990239f.6.1727786831411;
        Tue, 01 Oct 2024 05:47:11 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-834936c8ad2sm278226739f.15.2024.10.01.05.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 05:47:11 -0700 (PDT)
Message-ID: <776f425a-eed8-4611-8c90-d79a2b56703f@baylibre.com>
Date: Tue, 1 Oct 2024 08:47:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 6/6] patchtest: use black to format libraries
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20240924115503.1599651-1-tgamblin@baylibre.com>
 <20240924115503.1599651-7-tgamblin@baylibre.com>
 <87ee2add3b3814aa41f6e0b6758dee068a1ab54f.camel@linuxfoundation.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Ross Burton <Ross.Burton@arm.com>, tim.orling@konsulko.com
In-Reply-To: <87ee2add3b3814aa41f6e0b6758dee068a1ab54f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 12:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205161


On 2024-10-01 07:45, Richard Purdie wrote:
> On Tue, 2024-09-24 at 07:55 -0400, Trevor Gamblin via lists.openembedded.org wrote:
>> Black makes things easier to read.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   meta/lib/patchtest/mbox.py                    |  44 +++---
>>   meta/lib/patchtest/patchtest_parser.py        | 106 ++++++++-----
>>   meta/lib/patchtest/patchtest_patterns.py      |  84 ++++++----
>>   meta/lib/patchtest/repo.py                    |  32 ++--
>>   meta/lib/patchtest/selftest/selftest          |  92 ++++++++---
>>   meta/lib/patchtest/tests/base.py              |  86 ++++++-----
>>   meta/lib/patchtest/tests/test_mbox.py         | 144 +++++++++++++-----
>>   meta/lib/patchtest/tests/test_metadata.py     |  94 ++++++++----
>>   meta/lib/patchtest/tests/test_patch.py        |  39 +++--
>>   .../lib/patchtest/tests/test_python_pylint.py |  45 ++++--
>>   scripts/patchtest                             | 113 +++++++++-----
>>   scripts/patchtest-get-branch                  |  54 ++++---
>>   scripts/patchtest-send-results                |  66 +++++---
>>   13 files changed, 660 insertions(+), 339 deletions(-)
> I'm a bit nervous about this change for a few reasons. Firstly, it sets
> a precedent where others will want to do this on other areas of the
> code and I'm not sure we really want to do that.
>
> black is quite opinionated and I don't agree with everything it is
> changing. Some of the code does look more readable before it made
> changes compared to the end result, particularly around how it is
> choosing to line wrap the code. Some of the changes are also just
> rearranging things for little gain such as changing quoting characters.
>
> I'm therefore in two minds of this. I do want to empower people to
> maintain code but I don't want to end up forced into taking style
> changes I really don't agree with :/.

I agree that it may lead to a rush of reformatting efforts that aren't 
desired. We certainly don't have to take this patch now if you don't 
want to, although the more minor changes (e.g. the quotations) were 
actually a bigger part of the draw for me when I ran it.

On the other hand, some experience with using checkpatch.pl in the 
kernel has me wondering if we should be considering standardizing our 
formats for Python scripts and modules (over time) anyway. I have no 
strong preference on which formatter would be best (to be honest, I 
haven't even tried the others like YAPF or Ruff). Black, however, seems 
to be the one recommended most, and though it's opinionated it helps 
keep things consistent (the example above where the string quoting was 
sometimes single and sometimes double drove me nuts every time I looked 
at it).

Is this a reasonable goal for some distant release? I've CC'd Ross and 
Tim since they're also doing some Python work. I might bring it up at 
the weekly today.

- Trevor

>
> Cheers,
>
> Richard
>
>
>
>
>
>

