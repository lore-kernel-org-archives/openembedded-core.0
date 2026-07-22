Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35587C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:51:34 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47168.1784724685353850936
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 05:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=NelZEu77;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495590dde14so35655815e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784724683; x=1785329483; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ocx6pCV6KcJ8okONPXqj6PyzCvU+5+3OJr6TZ2mOVcA=;
        b=NelZEu77RJpndPeeeh0jwtIYOG497RhvJJvrUK/t/2aI734f+a+aGgekoDeddqu9PT
         rjOGh2QUtgmBJp81XeF6XN+45mi2YFHHzljs6e7HKgOI+a2Nl9Gpr1RHoDhIDxWpf2Ig
         waSLppbBwwsqXkfH0T8f+Tz1n2dF4F341w/+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724683; x=1785329483;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ocx6pCV6KcJ8okONPXqj6PyzCvU+5+3OJr6TZ2mOVcA=;
        b=NQc0QbkI3nN8OTg/c58RR6n1AqBaENUSApeneLATlwvobaiWSLtX9d5xpMVvaai4nc
         LJjko2ws1x3iWNwuvjNDQlSPv6ulbZvp6pZLrWqyICkGQDoPg25HwS7fsQhmSTYY9rmt
         EbdceEmIanTsg0VtCuBKcZTfAyGHAxHxyZmVEOj800Ocj2qlOEikr/2RCSjaz3ftagVr
         vG0aKD9eW17VAfJWmUxvsW7FOwgLmRvZxD9uJQd6hB1zvb2aH7iaeno5ebxOsU4PqagI
         1OcPwTDg3JL+HTbBrkgGJ17D7tb5G1SXF+BBs6pj2DRjdAhdSKuNEqqNtx+9eayYQ1jw
         5lDA==
X-Gm-Message-State: AOJu0YxV9+QsKUJGqXZ13wB/iP5lazFotQ05WmHnnGNsqlGXqU71rVyj
	H5yy+1PMiOnvVCKjFgWJsUBtoAyQS7bXg6Woz3GsYv8oOsSYxFMGpU1u4fbYkFgEp10=
X-Gm-Gg: AR+sD13fVWaaOdWHFFPOtPCzuEfsoSmI7T/Wzui1/CFSYmcV2EST/X7HKKiNUHJMatD
	LvcR+sQyySIOKzNmizQDh/waIBJ7nTGxTcaTEI7gCMj3WCPwKuwDP3kU1vq6HPqro3p9anjHqUs
	QmUpz/Wcdzs/VWVlEglb0cLZ76Iy5seJ3BVrh3u9nEmg5oLh69nIB0luzPL7QAu2QdGPwb2OYfZ
	PvVAC9vaRJW98FXARqli49HBdckJ7N9ph7LJhCPfjXXYCkIqBoLbuhwfl+0jtyGwlDm2cUXBmpK
	Xi0wxaICHXUX0+BUcVF9RRDlbrIjaFBzCuNZQvMmjoawtPOSxRtlgzgpYSsChO/lQ/TWrV3oAfP
	7AqyXsjTjxACAMCvnejO6xqvVCRjISvOPJjyWQK0KcEoRD/elJTpPLY5n2pEL+Fnw0BKv0D9gW1
	mAi8ixFCCj0sd3AJrT4EVmZlQLlj6x/YWFuMhyOCP7Due1DWsYR1TBZ9m+ttMeWNAsOSKWC3JjX
	+AmpEi8INWzKk0yalXR0IR6
X-Received: by 2002:a05:600c:48aa:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-4954a516183mr173140385e9.28.1784724683493;
        Wed, 22 Jul 2026 05:51:23 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956537c6besm135762115e9.8.2026.07.22.05.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 05:51:22 -0700 (PDT)
Message-ID: <5d0996c2-0aac-49d5-8858-e1f2a4512c6d@konsulko.com>
Date: Wed, 22 Jul 2026 15:51:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] python3-chardet: Upgrade 6.0.0.post1 ->
 7.4.3.bb
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
References: <20260722103621.1810876-1-leon.anavi@konsulko.com>
 <CANNYZj9fX1aBA+3TA_GvvFmbr6Q+YO+6_K5NzUTskaYKU13W-g@mail.gmail.com>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
In-Reply-To: <CANNYZj9fX1aBA+3TA_GvvFmbr6Q+YO+6_K5NzUTskaYKU13W-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 12:51:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241688

Hi Yoann, Alex,

On 7/22/26 14:16, Yoann Congal wrote:
> If the situation has changed, I think it should be addressed in the commit
> message.

Sorry, I didn't realize the changed license controversies are so big. 
The referenced LWN article from March 5, 2026 discusses the change from 
LGPL to the permissive MIT license. After that on March 22, 2026 the 
license was changed again from MIT to 0BSD. Probably that doesn't change 
the situation much considering that 0BSD is also very permissive.

On 7/22/26 15:15, Alexander Kanavin wrote:
> On Wed, 22 Jul 2026 at 12:36, Leon Anavi via lists.openembedded.org
> <leon.anavi=konsulko.com@lists.openembedded.org> wrote:
>> License-Update: Change 7.x license from MIT to 0BSD
> In addition to what Yoann said, why did you write MIT? The previous
> license was clearly LGPL.

I took it from the latest git commit message related to the LICENSE file 
of chardet:
https://github.com/chardet/chardet/commit/64eac3b1824913a001ce255f766a54d423fed5c6


>
> What prompted you to work on this update and add ptests for it?

The existences of tests that import pytest in the newer versions.

Best regards, Leon


>
> Alex

