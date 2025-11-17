Return-Path: <fbberton@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DC1CE8D6B
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 11:00:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6767.1763377232671497636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Nov 2025 03:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IbzpBLE/;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: fbberton@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47755de027eso29124575e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 03:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763377231; x=1763982031; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xPaIdDkTLtmrUbhw1hx+R1H6UQRPrHpfijcAd4SJc9E=;
        b=IbzpBLE//p+pxdIE60y4lqBLbHu9s+JtyTlMoS3mzONq1s1HqtaQOI6edkmtnZNqyD
         SUYDA20fPz1XWCXrftPoN4UNML0FNJNlJhpQRfHLykJD7Wvsner/QLBmZXKdlxkdBcpN
         9G6GRzhg4JNZJMxHEGyBIaV4fatJV6CnjELcao5GkH0V9eQm0yoY2XRPOWqDKct9oR/M
         Bt0lK4f2aXV24xxjeaGcRtF3hVCXTJwDKOM+lLXiGIny3oMp8FdV4qZsueMKSSpCpRHl
         H9clVEEw4StK0CjolGl1sVUDF/DsSP/u+IhtsV+Q3auMD5OHOWKwoetmcFr4ffT5hirR
         cp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763377231; x=1763982031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPaIdDkTLtmrUbhw1hx+R1H6UQRPrHpfijcAd4SJc9E=;
        b=Zj8WB2lVFTKX1WdiMHrFiuWbsWbPpyH6d1Y1BGY68lnL4PSd0KVGigSWvTn0brt61G
         fIjj/SNMYivEZ1HETEKuZpKC15tbc6QPtGTH6aZOzVoX7LRaPGtWYM/sYxy/yszH9RmE
         dyhVKzXp9sLTGmBuVaCXqfdxl2555dOO8j4ymdNpnn1bvpbzsu6MDhCHP25ury3zuyLG
         nwmr6n8IPRqE0Y6/RgT+1jThEbJn8JArq6fxCxeL9uvBRLauNkej3xI/AcgAyu8NDHJB
         1d8kRTRuQpaxKfWJi5ptBhHWlgLSH+k6hmfIcPQ0TQ5IDJjtwaXCpH1grpGuaAxJ/pgX
         rgNg==
X-Gm-Message-State: AOJu0YzWVlkY2a3a6jWkBforjeBbjB6m9P4CH9uf9DyabrjvmgzStSAh
	dZFWTz2jZotTOi+3sqtABLcetc6IygURYKtSS8grF1sVSRL5JSoa6AIt9kULVg==
X-Gm-Gg: ASbGncuAr1LtbugEhDvGANn7+q4+rGqvy8894XU/mREE2MMb32ypN5A/cQ9nnXljWT5
	B3Vgk5ol2bb2hhoEyWLv7PJdO8pmGSsojutB2FFFrTeQkLJuAMCEsX/BxvRg/ybqSuJu/9/d2Ze
	0Spt335hG/zk1whQfgX7/MVGvqKZoxWYb0cpsP05Qk77/FIU6DW4cXPpwOL33romJat3dDhBHY8
	XqVGL2ndXg4aEr2gNfIHNTB+PWttIUcRAoKuXeWtQeFLudBsCqeffTi03CGK+PDrVsEbpdUawzR
	w/4kmMrzvI6pQ9ilDtxF9UKHxyDOx9YSKl3ornVSeIJVJlmwTHiqVYsh+tBZEmISNu6gfX19vpK
	n5UB9NTcGa3btSJDuqJD5DdcGojOlEzylHwMQ2DpW+DrIJzvYgIgBYzt3AU9IfxyItTR+dUrdyd
	cN1q7WsmGnWZiwAVmgfzqCNcwp9v5A
X-Google-Smtp-Source: AGHT+IHM5g5k91RqAuZXRovmi54QuQ/EiHPWbM9nIGJK+jlTKeXavGDyYbUWxmUOhRDy9C+Tru8X8Q==
X-Received: by 2002:a05:600c:2d56:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47798f7383fmr45661275e9.3.1763377230741;
        Mon, 17 Nov 2025 03:00:30 -0800 (PST)
Received: from localhost ([213.205.68.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477988060e8sm58805875e9.5.2025.11.17.03.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 03:00:30 -0800 (PST)
Message-ID: <f9065462-3f92-4299-8887-04880e1ac087@gmail.com>
Date: Mon, 17 Nov 2025 11:00:29 +0000
MIME-Version: 1.0
Subject: Re: [OE-core] Thoughts on SPDX for files from meta-layer
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com>
 <6df562d0-8ce8-481a-a913-11bae6e0abaf@gmail.com>
 <CAJdd5GY8rkuNt2G4tSwG1Bfc3vaG8+ojBb0Hs+nEsj=r3Nt1Lw@mail.gmail.com>
Content-Language: en-US
From: Fabio Berton <fbberton@gmail.com>
In-Reply-To: <CAJdd5GY8rkuNt2G4tSwG1Bfc3vaG8+ojBb0Hs+nEsj=r3Nt1Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Nov 2025 11:00:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226492



On 11/10/25 20:21, Joshua Watt wrote:
> On Mon, Nov 10, 2025 at 10:18 AM Fabio Berton via
> lists.openembedded.org <fbberton=gmail.com@lists.openembedded.org>
> wrote:
>>
>> Hi Daniel,
>>
>> I'm working on something similar and have shared what I have so far, https://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_0_1_spdx_add/116223136.
>>
>> Could you please take a look?
> 
> You are correct in the observation that Files don't have a download
> location, so externalRef would be the correct thing to use instead.
> Otherwise, I think you're trying to do something pretty similar to
> Daniel. I'll leave some comments in your patch

Hi Joshua,

Did you have a chance to look at my patch?

> 
>>
>> Best regards,
>> Fabio
>>
>> On 11/5/25 14:54, Daniel Wagenknecht via lists.openembedded.org wrote:
>>> Hello,
>>>
>>> I've looked through the generated SPDX files for a project recently.
>>> I' m specifically interested in the downloadLocation property that is
>>> set for entries in SRC_URI in recipe scope SPDX files, as our list of
>>> upstream sources we need to monitor for security information is based
>>> off those values.
>>>
>>> We'd like to extend the generated SPDX to also cover files from meta-
>>> layers, that are provided via file:// entries in SRC_URI. The files
>>> provided via this mechanism are mostly configuration files, systemd
>>> services, initscripts and the likes, so one could argue that they
>>> are not relevant dependencies and thus do not need to be traced in
>>> SPDX, but we'd prefer to properly trace them in the SPDX documents.
>>>
>>> Are there any thoughts on this, prior discussion that I've not found in
>>> the mailinglist archive or external resources on how such files should
>>> be treated in SPDX in general?
>>>
>>> I'm considering implementing this as outlined:
>>> - for file:// entries in SRC_URI determine which layer provides the
>>> file (via bb.fetch2.local.localpath())
>>> - check if the layer is modified via oe.buildcfg.is_layer_modified()
>>>   -> modified -> abort
>>> - retrieve the layers URL. This is more involved since what
>>> oe.buildcfg.get_metadata_git_remotes() returns might not be the URL
>>> that should be specified in the downloadLocation
>>> My approach would be to introduce a per-layer variable that specifies
>>> it's public URL.
>>>   -> no public URL for the layer found -> abort
>>> - create a SPDXRef-Download-recipename-X entry for the file with the
>>> downloadLocation set to the layers url with commit and subpath of the
>>> file in the repository specified
>>>
>>> If the layer is modified or a public URL for that layer is not
>>> specified the downloadLocation would yield a NOASSERTION value.
>>>
>>> I'd be glad to get some feedback on those ideas!
>>>
>>> Sincerely
>>> Daniel Wagenknecht
>>>
>>>
>>>
>>>
>>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#226132): https://lists.openembedded.org/g/openembedded-core/message/226132
>> Mute This Topic: https://lists.openembedded.org/mt/116135395/3616693
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


