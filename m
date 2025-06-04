Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FAEC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 15:17:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.19259.1749050219180943513
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 08:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d+5q/qO2;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d7b50815so30607545e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749050217; x=1749655017; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utGsTb02NBNJ7GFioxXIo1gTkH2MZcqNNg9yqCPkAYs=;
        b=d+5q/qO2A3AoFoiZABxbT5FNTqlj7A9pGZ/EQQyPtlbr5eUwNijp2pkmyO4B3u9/xd
         HHXVeOErkWHQw50GfQJ2v/KgGPJWpQmmuVFQtQe7KbWf1TYTx9S/Icm93JqwwiXyYtn+
         7jGX/omBd+yT91PgfkezpTCEb3sgHeHsaP2LJVxeLXRviwOWDvlPu2XCoPXxWtSMeR+N
         vyfOGqQ5aDTTp2bY0dQFAsDBJBqUP1ncDJxgwDXwKkUjy38RkopkxkQ9IOHRIPwf7G5W
         uNH3FyxmKd4NLx49d0GYhNUh48ZeiHTb+0SQHRXZNxVc7VS7u2fXKiHsfgrm84eF/+CE
         DGYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050217; x=1749655017;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utGsTb02NBNJ7GFioxXIo1gTkH2MZcqNNg9yqCPkAYs=;
        b=EWwWnQaupfjBP5dw6gBty+cp2yjqn99kYbyfdRJu0LWJys39uKAG9YwtWqSxGm1KRI
         fPMhY3OECBQhT1oUscN/AYg6AhiXrM4qpBixAl4xMJS+2HUZeG19ReJCjzHG6lXrdAq4
         mwrIU8GKtevMt5zG8z3rasw0YdceqlR/2oiSIYFHP/Pj1TYODvhqlAeyGgUnJugb2cFE
         zscx7kWUIQtP0vnu6ZtV6LZAmqsKEss3F/zmKcyPmHBOcN5FffW1tkE5rGgf78im3fSd
         tNoJg+Kihr45gzHw7LhG+J+ABlP4vDpZUS4oiztjZWCT6PT3WdpxD9/9VcWse2NzCT8b
         tBCg==
X-Forwarded-Encrypted: i=1; AJvYcCWheuoqdppiLaDiKNqBWBhzUMwzaxnQkCNlHQQgvXYInylZ4gwhfJUpCIQbRNr164ZaLiYpiS+ZlLM9jiWE0ZlQGg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRxhTT593FSfGwIxXaVXuOEb/7VTWebQ2DKhIpFco/l4APsMB3
	ODbTpQFeAgwfpVUoaXXIpIBLkIWXtzV/H2v8D7Z7fMZxZ/RS1xNa5BVO
X-Gm-Gg: ASbGncuLTqK1QsVkFiVwfpA01NeskPzg6PBuEOtfUUm3ExC2jt/ZctpouAprOftCJIv
	d4wgQ8Q9So3f5SuUa699IhOzHX0xxB5zbGH6THCVm9qDZAuDi4MQaf2C0BBR0YytbFnNDULDFOh
	A48qeszT4+olDGCKdV3Zj+9jWTxJ+dZfDiYbcXHZh+Rb8LE/0KCecqHw0IOaa3CXjFzb3au0Wy7
	GgWlfUEdsNaqj+HDhzn4q8fjANcAxx+HgRvPMUFs9y7RYMy3JOXdE9ku4o+mzixcTk2hxBQ3OPY
	DXmr2G/zDTzmLBu/uYWuHNWUv0UNp+7MJwe+CxkJJWyW4yuaL63w26aGwpM=
X-Google-Smtp-Source: AGHT+IGDWr9uYvGgGm/vHCCP2C/la0Gw5uMOm/QTEa8h7yo57MSehcI5G1V0i+nqVpqr09GAmJ9Glw==
X-Received: by 2002:a5d:584c:0:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a51d985961mr2671458f8f.49.1749050217179;
        Wed, 04 Jun 2025 08:16:57 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606da099aebsm1570615a12.63.2025.06.04.08.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 08:16:56 -0700 (PDT)
Message-ID: <4832019c-26dc-4f50-ad31-3145fda752a2@gmail.com>
Date: Wed, 4 Jun 2025 17:16:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: pthreads NPTL: lost wakeup
 fix
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250604144814.3103080-1-sunilkumar.dora@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250604144814.3103080-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 15:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217956

Unfortunately I find this quite hard to review due to its size and the
number of commits included. Please, would that be possible to add a
separate patch for each relevant commit, instead of one mega-patch?

