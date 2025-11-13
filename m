Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F16CD6E54
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 19:00:53 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.513.1763060447465375671
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 11:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQJ4qXQd;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so624800f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 11:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763060446; x=1763665246; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ya1o13fbJ1bjvY4VPsZCHOIoqp8DDMdLGBe8OpLBcx4=;
        b=bQJ4qXQdOwXQoR+jXAwGJMdsyngt5NjizgOYLwYz3siFt7Rtuyt4r5iUQb2wD23XqN
         6PixkmB2MC3FVrW8MPQRTTjc04QNaA7K5CFvhy6NDYKaqpZIHgh1dsdF/5e9AikSlZAY
         BqujZ4jFGPnM0769qv/SMRZa1pI34YblrO6JnQD0+lNQFB7whNGiPvY6iqN0xowIeG7Q
         +MdYUacQ9jiUcmSOrJQVEJo+NR4NnYTnrEQureBDEfvCaaRR8fijMldagskA9VuQcj8v
         N8jFgcVGmR9ixH61VPngQupBseuprvXsVkfPbraJIGc3/WKhgfNqlaZfNPkNLYnAzTb7
         NLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763060446; x=1763665246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ya1o13fbJ1bjvY4VPsZCHOIoqp8DDMdLGBe8OpLBcx4=;
        b=revuUzjH1Y70wOjAAI4JrNx6OidSprSpApQnlK3Fm48HJFPctFq8+h2P1BQqlvSYkm
         5F9BqXD3pTgbuEEsvJ2oXhds58AIea+M4jvLI2txtOKgnjrJzMbkZSxHy9qZmbM7RtsJ
         cbCKiJI9HdFLfZWd3P74b/Eta2nVTsvwNw9ovLzsmK6xjeGRSc48SiS/EYsUFMVtaA+u
         chbCqW15TNkDICehlIouG4URua0f5Fj/tImnq3Vn1XF61iOx3bfj52sOQJ1KhDdh5FmW
         ALd7zj5U20KxaCojcGYofkujliCYMbdTb4bRWa3yQ9QcnjY19bkZ9kHE/L2wG7ABWrPd
         JVQA==
X-Forwarded-Encrypted: i=1; AJvYcCV3eiyYAI5tXqKnFPrMTwUQ2XUFJnkZ9Pni447eafTO/bFzm5jL8SWHuYWretEmupFiGQ9SiATiAQRmss68e2Mmww==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzsu+YGGIftJ7wgP/MJOh6ttPC6ZPRVDsx6R3PUjGgC9gTB7JGJ
	c2kThGG9709jwfjQsCgFi9J0MR1fk0U2jbOqH/JYGF9wWdVR2l9aEV3T
X-Gm-Gg: ASbGncuuaHLw2G+/PCQN381S5WzU3JLgPMzve5V2PJQcA+LZBqT3kJPzAp082JoIOpS
	wBWwl0nidhgx/bCsnpbQBIJj8TT+a5ZSOXgqlH6SmcfV3y1bovS/YzTUWst60Kg9S7THp6wACG4
	NBnsBonegnatYdvkqGHOBmrkdosBdN0yJZLz6AniThKryrjxsz6BmJHUjH/zlzvwLCaedxnsTVC
	/vAPcCmX8ZJAq5CvXQasYJxVEPzzXnJ6MnXD+oK3cC9UIRysXtzoXDl/DqqSERo9lnHUG3KnSRI
	Btj44DKXh+H8kX7Jy/TtSQHG9pzRI/zKiPzw3s9RPKrMuS31qE7ucBFuPCz9eGX7tM9VPEQc/NO
	z7PuKaNgsktjPJjWNH1T0QS9mlVc7Qy1x+NMkCqUxLvLTT4IRf/7u4KK95C7rwtHXYfCBdGTxKi
	9iOWOeSgoo4JR6ilM63Q0=
X-Google-Smtp-Source: AGHT+IGvFTXaKtWzddHTKGLBEaiQPvwJLr95hcYorQBaNKUd0bUG/4GjjmRcZt7ojFG6oeuDZx+vzA==
X-Received: by 2002:a05:6000:230c:b0:42b:3023:66a6 with SMTP id ffacd0b85a97d-42b5936beb2mr387753f8f.40.1763060445526;
        Thu, 13 Nov 2025 11:00:45 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e91f2dsm5778280f8f.19.2025.11.13.11.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 11:00:44 -0800 (PST)
Message-ID: <f61eeb80-5cd6-4969-a896-160aa6093886@gmail.com>
Date: Thu, 13 Nov 2025 20:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Yocto Project Status 11 November 2025 (WW45)
To: sjolley.yp.pm@gmail.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <CAK5yBb_cCBzptP=w_yhx9GSwz2m4sO43i2o99ERRA-F9H3KACg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAK5yBb_cCBzptP=w_yhx9GSwz2m4sO43i2o99ERRA-F9H3KACg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 19:00:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226261

On 11/11/25 16:47, Stephen Jolley via lists.openembedded.org wrote:
>
>  *
>
>     YP 6.0 (wrynose) and the next LTS releases proposed timeline:
>     https://docs.google.com/document/d/1BlvtPxpYsxHkeL10DFBQzBI9q_1HIk9r2FPxlfsQ95U/edit?tab=t.0
>     <https://docs.google.com/document/d/1BlvtPxpYsxHkeL10DFBQzBI9q_1HIk9r2FPxlfsQ95U/edit?tab=t.0>
>

For YP 6.0 M4 there is quite a big gap between the build and release
dates. I'm curious, is it just a typo, or intentional?

