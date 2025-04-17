Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD029C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:06:36 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.5219.1744884390398340374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vq1YX8no;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0618746bso4025695e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744884389; x=1745489189; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eNweG4a4+iQRwIuWiN/LQgNgDvbVcH9Hcj59ysEAKI=;
        b=Vq1YX8noHInS3abvP0nNzlxQuFrj1ZkRkE/8WNPd/W10kyOUEgZeub4xy+sb7NdbzQ
         T3txP2pBn1CMHh8P3uJKvmYCVp2I6SS4JjpRwG6S3McVWDGWmTsYp/pwo5l0aA1cx8ra
         Mu5HNnnVF4lPjkhSs1GW5vQC3Z/Gez1O6U0Xw72xUzxI/MrXJBOy8smb0tZXSo9OK8f7
         cRIz6sTuZVarbnrfhK/3LWhwu/yCHIGgSbCQP7T0Bk/U6MrDwQOalCKU9+Jug5zw/jU3
         MihV2thiY+lks9N6PirZZPw0kvp4vJC6H0YHgQo43BPp9ahLtLJJyY7YvPWViyNuJp16
         efaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744884389; x=1745489189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eNweG4a4+iQRwIuWiN/LQgNgDvbVcH9Hcj59ysEAKI=;
        b=fY5Dd05laCvjxv9xwaU2PCud29EFNvnT6iFhckKvU9sk7lfBxvJ0kBSp8598IkI6EF
         6ZdSc3EDHZpnG4E5gWfk4bcv4CCUkcJBQ9kU5nmJsLBoZ0fkA/g6Nq0qUgi4OLLMkYKb
         rBQ1kvKRcuAiSXMTLJL9DVZPbR7T1sQyvi2mNp7FmiBIAtvZE96/PYeZrkeBPLU73lrM
         jrLSVw9wsHoFMJA2dLHKYlHWwFMeIrG0UXFlgWebErZMEkuD2R1Y567qGUzsnEc4k2yG
         cMoQjCRoRC6Ru0tfTLMIA06a7d3gnKHk9f47ewYtcRPvSZsTQYqUScC+NQzsLcZXN81W
         /jmA==
X-Forwarded-Encrypted: i=1; AJvYcCV0dphi9NUbx0QIpb86oKETnJ46mKf4ZmFFri6mn+w7S7qkMKZiFvgeN/vB9ldBZhKNL8tGClhNmG8L+jpijuVBmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwJASjo9WTm1CYdp/gPqC6MyhgZg8MNEF5/Ywe0bOcRBgvnBFXN
	adO8yeOEArLGNCHtn/yqlqI/V0XAO4UAD7VbBTIUil8NgisMFjTg
X-Gm-Gg: ASbGnctbLxFysHrJGbMcu+21wspOcSN6FLZUHd2gXB+1QFdhg2POoMm+0aHlUqIUlvy
	sTseHENUYVlMzQjArU9/N8lLiprh7maUJNaM1eujn5JF5COUanrFEEiEISt779+TD/5dFC2nDDT
	jaucRFW3NNTYPDXjX0ZPC61SYGprdqgTyBP/3VCrm/E1YMhY0sG5dGLsb6b/5aoSllRpXsYrtBe
	4zrxKG60wxFFS06EBfqaU5fWYTQ7TuUav0a8mREYQxhN7/KH/ronIVSKvsM4JpoyklIH21taPi8
	zhbmwYF3g4HGNg2H0SRqPqFyoO9Lj3u/ATPcZlI6a7BMNNCk
X-Google-Smtp-Source: AGHT+IGo7csSzQJNzuhljY+2TA9jVUC//IwN5JpC5F9zn64AILc2Elx9cMMupysCvOPSegmwBh5mTQ==
X-Received: by 2002:a05:600c:34cd:b0:43c:f597:d584 with SMTP id 5b1f17b1804b1-4405d6cc6e5mr46459665e9.29.1744884388486;
        Thu, 17 Apr 2025 03:06:28 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b5abc3fsm48042565e9.37.2025.04.17.03.06.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:06:27 -0700 (PDT)
Message-ID: <b7eb53d5-7b32-449e-b854-f81e7cb03306@gmail.com>
Date: Thu, 17 Apr 2025 12:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
To: chuckwolber@gmail.com, richard.purdie@linuxfoundation.org
Cc: thune.a.tran@boeing.com, openembedded-core@lists.openembedded.org,
 Chuck Wolber <chuck.wolber@boeing.com>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
 <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
 <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAB=6tBQsqNJBqFsocxDQM9sOwz5S3w5HqkOO2cLuvH8OmSQ4kA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215050

On 4/17/25 06:39, Chuck Wolber via lists.openembedded.org wrote:
> On Wed, Apr 16, 2025 at 3:07 PM Richard Purdie via
> lists.openembedded.org <http://lists.openembedded.org>
> <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>
> %< SNIP $<
>
>
>     I suspect this causes some regressions in our automated testing
>     unfortunately:
>
>     buildtools:
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1396
>
>     meta-mingw:
>     https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1430
>
>
> Would it make more sense to add self.context_executor_class.default_cases
> to the list of paths returned by get_sdk_paths?
>
Well, the missing tests is one thing, but the other one is that the
errors are thrown by tests that were not meant to be executed (at least
when it comes to buildtools - haven't checked meta-mingw yet).

> ..Ch:W..
>
>  
> -- 
> *  Opinions expressed are my own. |
>  --------------------------------|------ "Perfection must be reached
> by degrees
>               she requires the slow hand of time."
>                                  |       -Voltaire*

