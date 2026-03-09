Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CA6F3C24D
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 23:19:20 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28284.1773098350268958088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 16:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ISZx4oYE;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-66f747175d8so7093233eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 16:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773098349; x=1773703149; darn=lists.openembedded.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8va+OSMliF1HLhto7Fk2E/YwhB9nk0AlM6y8ywEyNQ=;
        b=ISZx4oYEaB5wJWqV0CGzZVcBhqu9FRk3EeHjB50j+5EN+b5Hijh2eZSBcXSTdfn62V
         gFZKNxmp7bjP6qW9Ambz7pb37zDCm7nJQG9kjebmDRfdfuhDkVjbcTam46Qqt9j/Kzf9
         72H+/Ioy4Rqoq0FMBJZ6jo3wYsftByzQHlZCj/ZRkWz3LCHfKkU0LyCECHbYUTobk1TR
         OzVvv24/7uPevSGURYjrZc6Mw5BOIT1aW/zqUor6ZClzLuJWfajdDXocErcB+/7Wfqgf
         EJs0C5L4j/V5e2ubmhLgeSpupriMDAqzmZs6YMpxsDoll2W54UyaqwwvvY/HpxbstFn0
         fNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773098349; x=1773703149;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8va+OSMliF1HLhto7Fk2E/YwhB9nk0AlM6y8ywEyNQ=;
        b=h5toKGIWJijKUki+xMPHyTRTuvlJwH3DXKmOwUok8BVQuclRvdPKzA74iB15BwhC8L
         QEL4xHuPk14vO+oPLEto22wgVf++wgQ1T1Ry1elJRFlZtm9thCOlAR5v3/Y6/RSf+t/+
         Wjv2EgIuoddoprRFWYuNDzJZfQnKaenZh46q/+vknmgUV1vlkDPKL0JmmWYp3YKQhvj4
         NVfMxneC+TSte0XQOU5vP1Dm9S0m7lNObeo/1GafZd9h5NejXYRU15A7ly0h9nBobMAb
         UVK/aH0TCUgvivRk3PcWvOdsD3dJBCEk0nE0/LUW+oWd9iAFwFMXrOJj6/w95Mjo0vx1
         cDhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAOOWcLCnxH4hjn9RGi9A7vsuhDt+FUCQymHMBYJftT6oM6riv0XNh2fqHqIdlnoFPrrAd4BZo6VejavIGlkryBA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBmo0iyzooV+kKzlD7kz1nG0y8wBkI8bsRu6hArqdCb9jisu5m
	mCJJWIJHx8zW3GLB1mpM46/WQgpU6JtmxPJKusNbRWqQHYaP/3fFIzY6
X-Gm-Gg: ATEYQzy+Lw/xJ8rkHKK6szVhqJ1n5lhB+B2Af9BGm4Sy4gARo1pOiySCOYWCd5QlnB4
	V0SU0pmNNcwm00c/kGNgvf+y6lOoFToUbmVCBuQwb7MfMwQXhkmOY+78gB+Zj/BgtJFqfDoikSi
	SJAQHtcPwYVY7P/t0UHFnqdmNmkUz3jwkX8yqOy8+bIF4GsCVzTZ4/bxkWQnO2l+XKsg48dpU92
	rUUOypB2XbKXfIW8YKngsJM0ZtABudmnjeop6PloqtK+HyZ+UTxFVn7RjSHKl0HkgV/lkEX1yie
	8W7RtEm1kPuTBcuk/Mpf7wZJHM4YpbBHxrwAj8O0WqMedxDKpBLYzKhj502Oi7RZHcLGX3O9bUQ
	lL8+Xyc3N0yH/J2oAXkxSKc0iFsV/HHSC17R/IX1HS1DOf8kInlggIz/1XREkEkMqsT4yEB01eb
	kD7+SRY/py4rMUsD7fIkEnw7KMFhXk3loPcSZkxt0CsSP1QVEjrAN35bjefY2AOkeUEFIX7yhlu
	cLl
X-Received: by 2002:a05:6820:1995:b0:67b:bb4e:4a0c with SMTP id 006d021491bc7-67bbb4e5fa0mr1276156eaf.41.1773098349429;
        Mon, 09 Mar 2026 16:19:09 -0700 (PDT)
Received: from [172.26.252.3] (97-118-253-141.hlrn.qwest.net. [97.118.253.141])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67badfd8485sm3886984eaf.5.2026.03.09.16.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 16:19:09 -0700 (PDT)
Message-ID: <07131edc-be81-4c9b-a3b7-6d5b5b865be7@gmail.com>
Date: Mon, 9 Mar 2026 17:19:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: yoann.congal@smile.fr,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
Subject: No listed maintainer for stable releases
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 23:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232756

Hi, Yoann

I believe you are the current maintainer for stable releases.

The contributor guide [1] asserts that "The list of stable branches
along with the status and maintainer for each branch can be obtained
from the Releases [2] page."

I could not find a maintainer listed on the Releases page.

[1] https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#submitting-changes-to-stable-release-branches
[2] https://www.yoctoproject.org/development/releases/

Thank you!

Clayton Casciato

