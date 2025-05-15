Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0925DC2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 17:22:26 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.18414.1747329737886520213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 10:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y4r9y4g6;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f63ac6ef0fso2367487a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747329736; x=1747934536; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=llmhcbkPv6eO37Xd5IvoEpD46IblKCX3QYh3eptQRvM=;
        b=Y4r9y4g6aGsP01Zd/kiLUbTDD4+1z3PS0QhDRZRyFbakROPa19XQjo1SIxV5/xpeFD
         hv36nB0ReEWnRPbIxQb7vrgXIqo2joMbQUVvtB50lqjm5/73NStnYDNbXcW8jcF2cBiM
         RmKrtbmPhBK3bQHb+fk7SSeTMbbMacJTK/04iACwT+UtXr0kIy1HM3wEuv+KuKTLIjTM
         ZUjxBh4Y/FKvp66dfebaQAax9KG4APUid8ksgrGdqsRFus/gB1Q8UZ83D3EVu4+TQU9e
         g6z0QakncAeLXNPQJJaVPpSFTGN/uhv9mev3HMxPv5/lD/7+SLLbsedc8jUEAtSNg/ES
         26JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329736; x=1747934536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=llmhcbkPv6eO37Xd5IvoEpD46IblKCX3QYh3eptQRvM=;
        b=VprgX3SICIvgIBoK11B5SQZLrsZvdoRH1rLwRpcnG8AMpkgFopxPpPmZfOMv84yuNO
         DK9A0AuW4hRVoNbDhkXOdsK4gICW3OpSZ5G5iJN3wtrzDoiy0tlwxSz/cpHmSqRHDul+
         2QksA/BLRwWw++O0r2xza020eUQL+9TzTKJGyO2B022+OuR1zZ7LZ5XAUH9DivTvaGHN
         1pF4xPUKPrUNbexoGj7qZTY3Au5j+gQVbuSWGjjVy330QGOrwWbtZgemXX2m0Mv60PJM
         xoXEfWisvMNYd2X0Gkbir2rGqk64b+AZq8k/W17r1aT00oEiyD0enaHi/kQ5G+xuZDEM
         l9kA==
X-Forwarded-Encrypted: i=1; AJvYcCUIObiHYvd8upP1j1Ongp5DKVOojx+Hr4h1eIal7jm1P0UlsSx8nqON7IRxyBwdWVVs9R7c5cEcBf1xJq1+vk94Rw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwgoGZNGWlqPnmua1WSrJ+OvsVD0W+/vSA8qzGJkmynxey9Aopz
	H2aBc7SgB7iimOx3eiMeek48ChHqplQNLpIkPAyf59mP9zv33yS+hg/A
X-Gm-Gg: ASbGncsq2yo/dsiki/yy7efe6u4SxeXJ6VFTva70L94Ir+PVxXVOZkWL6/AR0yk8sq0
	c0sV+7BTvMqKqv8LfsmlRIkkzniBd8+gO7oOzjQdofwWHCSCaujbQYbCXlqaaTQWgsN0FMGVe7E
	O02SM4Sq/iii0iCGZSREComC5ayq2Ou2jFbFWa5AQmEP2Jt9n0xSvVJl/kgOeMcA1/Zr9q2fWEK
	dj0SZPX/oS7yRU94Obe86pg6d0G3Nj6Ncc83JcEa6TDF6AfK5IbLkIPfZis1GLyn/eYoDXWOPDe
	PlcwTnXHer9RQ6IX46T0BZo4PWs0KEjemO1bQJFygmrP8/xZ7MKDUFWbagpMM/9w7I1Qfw==
X-Google-Smtp-Source: AGHT+IFeoekfMjuH9lQBJhV/taNv6WuipO6a/7gdryFzauzz3krJh4cbpTLcNGqGOL2Z9BrtMacoow==
X-Received: by 2002:a05:6402:1ec4:b0:5f7:f4ff:6267 with SMTP id 4fb4d7f45d1cf-60090122d6bmr140474a12.17.1747329736064;
        Thu, 15 May 2025 10:22:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac32a55sm111164a12.58.2025.05.15.10.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:22:15 -0700 (PDT)
Message-ID: <eb99f3a5-db10-4fab-9043-8fb171572770@gmail.com>
Date: Thu, 15 May 2025 19:22:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] zip: fix a buffer overflow detected issue
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
References: <20250515145108.617315-1-liu.ming50@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250515145108.617315-1-liu.ming50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 17:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216699

On 5/15/25 16:51, Ming Liu via lists.openembedded.org wrote:
> +
> +Reference: https://bugzilla.redhat.com/show_bug.cgi?id=2165653
> +
> +Upstream-Status: Pending
I think for the status "Backport", or maybe "Inactive-Upstream" would be
better (while still keeping the reference)

