Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6FC7115B
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 13:49:24 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.15558.1750340956806046091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 06:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=zkDL2Edx;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c597760323so65172685a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 06:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750340956; x=1750945756; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DiG6fnhvPPbn3+KW+bpCWiawPjuyyHdk+ig1x8XJXRA=;
        b=zkDL2Edx89zBbgOaWN2eD51NYiAVUbJE2yUGdLQ0Sujp+J8bR6SVAy4sPmIF0HFa09
         5drAZ1cg0EHWs7RqHUH355Mw2Xc0+kn7nNVSELBWFqnGpZVdLCypMIUwO2B6+vi5NBOk
         6AN05ouZ3AhFhCmrWdExdaBzoskuSmGRx9E3oJTxzZ39NuxLHvV1VqYVZrP3FvIGsYcM
         gF/1xn9ugVORpo+dux1vY8CpLgMTiu7ppVyQ8MQP5s2VzkrP9ioagJbe1tzo85br2xJ9
         0YroeUrIH3J98qP1npbWRCVYC+NB9zc5R6qOVGHecO3qVaxChED+5KM/e/7kqlTFqKrk
         UxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750340956; x=1750945756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DiG6fnhvPPbn3+KW+bpCWiawPjuyyHdk+ig1x8XJXRA=;
        b=ORoTK4+Aq6msvqoUQ63PqMnorCHwlJLYCISCleyASOn4hmus/xKWNZ/tEm+czxZDbX
         l3aUuXN5qBgBHrqsGnDI7yqe7lFyyHsdbhVIIVVf6Vi6arHaY7e+OmRCBFJq40l+g7al
         tTQHx0v3TiXYW8vL+nK+DXfrFqu3F92iymP7YjVQrdzReu1+imJk6pAN3UDHy62XyQrf
         fIuQr3CLfY96QtFyp1FN0Hjki0bkswYAbBZkaTBdgTl8PybD1zoZNAOITg8mJe5cpTtt
         f9CrcnV9OQ3ukSEhseM7GnANhE0WdiBXjhm20320GkLqVCWPtvdmvn5cCMKMYvW92BXE
         jQLw==
X-Gm-Message-State: AOJu0YxR1JInnMSNuhn+cXv3PC0OF4dGYOM+M4ETEzaiPyDklb1Y81O3
	SM6QekRE4ZIdPWeI8ymkm5JeI8oh8rYAW9VRk2cT7WZqmQFGN70mnzaTdpedLqt1kTE=
X-Gm-Gg: ASbGncvsrRd9Me5WAovC5DlqOSq0zrEnudycvKNNhciuyWEPpcZc1iUl7Ak9TT8IX+t
	upvAEkFF6HkMegMGNLezgm7aVKQCh+NzAhCVuwhMq8JtueBpORJ9K6pm0y1ZWXHLbMOXPnTjmJ+
	od+dXbbBN3xvx3MuY6cmebfRonIjlyfNij2hQF7wws3l/6FPEvlhIvJhe0zrD102WaqisYz2SOX
	ZbYePwL1esr4aZFhqWzO9O0ndmoLlf9SpPQMlCIzjB1JzC06RhS8AOvT1iGSw5aRAV2mCeCWgIF
	eXcqLf/K+2fvxG5g0re34B1LZQEDSJGEOCyJ4sg/uxOcEg1uBkJi5A9cWLqkLhPudO0xpS+jQ4N
	8tdQJ2m7pI5XElqrZMfui3WnVDKd2+w==
X-Google-Smtp-Source: AGHT+IFpcIElWHdkC0tn0aVpsldvhAWz7AFJOu4ywTEGfTUAGMx/itcL9T8lE/oj/YepWr8h2O0ehw==
X-Received: by 2002:a05:620a:448b:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7d3c6cdc741mr3573305985a.37.1750340955667;
        Thu, 19 Jun 2025 06:49:15 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8eaccc4sm895286985a.74.2025.06.19.06.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:49:15 -0700 (PDT)
Message-ID: <e9f8371e-9752-4de7-9e3b-55932f3c3e3e@baylibre.com>
Date: Thu, 19 Jun 2025 09:49:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/5] python3-colorama: add recipe
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
 <DC6B7B7A-BBA0-4F04-B08D-16DF23229A6F@arm.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <DC6B7B7A-BBA0-4F04-B08D-16DF23229A6F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 13:49:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219083


On 2025-06-19 09:31, Ross Burton wrote:
> On 17 Jun 2025, at 16:53, Trevor Gamblin via lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org> wrote:
>> +inherit pypi python_setuptools_build_meta
> So this package uses a modern setuptools to build.
>
>> +DEPENDS += " \
>> + python3-hatchling-native \
>> +"
> So this package uses hatchling to build.
>
> One of these is wrong :)
>
> I suspect the recipe should inherit python_hatchling and not have a DEPENDS?
You may be right. Trying out a build with the change now. If it works 
I'll re-send.
>
> Ross
>

