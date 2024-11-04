Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C13BD132D2
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 14:24:23 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.58597.1730730260103860734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Nov 2024 06:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rx3WXW1a;
 spf=pass (domain: baylibre.com, ip: 209.85.219.48, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cbe9e8bbb1so31556086d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 06:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730730259; x=1731335059; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXYBscAt9EKh7tkSHi0iU0+wqCohtI9zyMCsx78JlbU=;
        b=rx3WXW1aIV6BV9MXj1tcdPkjR0KVYkDz8cM71u1UfWlkvWUn4X80y7SuyDH82lmKO+
         t/6T/++JQY8+U74kCGjnVYaec9xX7C8mxZU5TopPhpqrDPLicWPywmpHROps0Wt4OvyE
         jurpXEO+GJ3QeeaHiKS3U8QQs9dQ7uulLGeKf000XUD6cvmq41agBkU4U+khIMbw5Oa8
         RhrVjkMRw1+zPDqVkMSzRTlfYSnxEFet5sq0/frT91ATqcdFWT2cI5+p0TwPf7x4RuZp
         WQTjFdgTWSWynjJpdT6xmxQabf+oOaURkZG+/eP9VuOPzKQfuzH+blLeZz83cKL2o2Bz
         lJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730730259; x=1731335059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXYBscAt9EKh7tkSHi0iU0+wqCohtI9zyMCsx78JlbU=;
        b=NuJUr5GjGRGOoTvxmfop9K+w+V5d2v6v37QCMAsXFH/gnB+/yGMssJeHldOVw5dUVg
         oeHjbHlMrK17r53R0hfkDwA28NAvc4i2aMzQWmJ+gHxKSDnhzAT2eEltgXDTlzMmEX9f
         r8547BvZB/v/cg7a5Yp7an2MLe+t8bAYVKe9UvI1v5hPdgwPvOYLWdC4yMnlzuy+OI9v
         GZXzz6Isp7DUqFrNgpSnjLCpBRMSPsCKrcSGEPSuUgccRZMreuJQmaoiLQQF0lsywPh+
         RspXgVkk/8PM01JiTu9FVQRTeNg/NKxHuWWQa6srM7WgP+51biVjUg5pzmfUOGryeOOy
         mOhg==
X-Forwarded-Encrypted: i=1; AJvYcCVUMadYaA7skH5vZbha4CybQPwC4q01KEzOcExzOS6AUmwmzPgVijsv1Ex4cbn4OIlld/KXL6loixWdwdxe9XOkNw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyX6QwDIiLC0ComYcNRm9Ny+E96bwlIkJIbNiuQwPb5dhiIljFD
	wRlTkBDFFTh9XcH+mDe8cO7lLUff5vltKd07zcmIfTMzlJGmFTHypABP8bWGg7g=
X-Google-Smtp-Source: AGHT+IEgZ6ozNKSVk+HQfQGjQE5RlJzImcZriadLknT2NfzVIOzyzasfXeuDt3l8lkLlKYg1MHorFQ==
X-Received: by 2002:a05:6214:5905:b0:6cd:69bd:ad06 with SMTP id 6a1803df08f44-6d35c19d4b0mr192914306d6.50.1730730258839;
        Mon, 04 Nov 2024 06:24:18 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d353f9f451sm48202326d6.25.2024.11.04.06.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 06:24:18 -0800 (PST)
Message-ID: <b76706a2-11a6-4615-baaf-dec8fcb4d7bf@baylibre.com>
Date: Mon, 4 Nov 2024 09:24:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
To: Ross Burton <Ross.Burton@arm.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20241029193745.2919129-1-tgamblin@baylibre.com>
 <ZyJBQBRRsLFov02a@bootlin-mathieu>
 <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
 <53C5ACAC-FD02-457D-B24D-42DDB1568859@arm.com>
 <13BF7241-1A92-4653-B4B9-FEA628356BE1@arm.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <13BF7241-1A92-4653-B4B9-FEA628356BE1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 14:24:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206682


On 2024-11-04 09:20, Ross Burton wrote:
> On 1 Nov 2024, at 21:47, Ross Burton <Ross.Burton@arm.com> wrote:
>> On 1 Nov 2024, at 10:08, Alexander Kanavin via lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org> wrote:
>>> 2. The second issue is slightly trickier. There's a number of
>>> generated c files produced by cython and they contain lines like:
>>>
>>> static const char __pyx_k_srv_storage_alex_yocto_build_64[] =
>>> "/srv/storage/alex/yocto/build-64/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/numpy-2.1.2/numpy/random/bit_generator.pyx";
>>> PyObject *__pyx_kp_s_srv_storage_alex_yocto_build_64;
>>> etc.
>>>
>>> This needs to be fixed by tracking down where in cython this stuff is
>>> generated, and replacing real paths (or parts of them) with something
>>> reproducible, like 'reproducible_build_path' or similar. Then this
>>> should be submitted or raised with upstream.
> I’ve got a prototype patch that fixes this in cython itself, meaning a pretty large chunk of horrible code in recipes (that silenced the buildpath warnings,  but didnt actually fix reproduciblity) can be removed.  I’ll hopefully get it good enough to post today.
Let me know if you want help testing - I started looking at the PR you 
mentioned over the weekend but didn't get anywhere yet.
>
> Ross

