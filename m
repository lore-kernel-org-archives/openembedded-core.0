Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B271C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 10:29:14 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.9702.1749724151457169948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 03:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YF4UM+cY;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso1418611a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 03:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749724150; x=1750328950; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+8GSJl1ZnxyJuggOHOtFQ7AYx3a0t3Xhb2Z5sRMaZI=;
        b=YF4UM+cY8wm+FqImaWxff/gFwfE1qGkrRzZUEhqJzfIFiuohWBB0Um4KpYJxgtZGZ4
         o87RgfvjOAhlENPH7V+oT4gmXy9AqZGfarHWq16AdqJFCnWznfZoLhxi8TT4I/lkcyJc
         zjeduvPd3Uo8LBYVIYs22k2ZchP2ro8oIWXwWQhPnKkBF2gyvekkUegSeLTCal5JVZ1M
         hwlzWfmLsODELDqbl5h4SHdBCtrisKXWHwg/nugyfgI3MviWafwnTX2+DV7FsGgkwiM1
         kWIDCbmsV4J0O+PUlrmb+0tk7SjLJD0jYA6Fr4y+sjr5KbNVwoBYmiau5TxIzr3JxgYc
         ppig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749724150; x=1750328950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+8GSJl1ZnxyJuggOHOtFQ7AYx3a0t3Xhb2Z5sRMaZI=;
        b=YLFgpX8x0G71grkLYBSgU4ScJ4a5mXjfQzltajxIc8+JsQRnGbwMVEE/tfx0VocwRW
         pS0To/wxbWQgFgD64Z/275ce5keyHQDBUp7SlKP5xx2+NNjK7y5q8a4GliFHcQ74kqxv
         i0jqzRSikJHYb9TZTKdNu1ig1hAZNeBnD7EwHlr6CR/Qp1o3ZWmqKjZxpqtSYzhda0jz
         hyOpyoeiWzLFFTWEdTzlW2paE4AkDrI4Jac5A4dkIJaQ89mxiW+TeI/UQ4kHwWlOVYLV
         2eUpvw1Zvb59+Z981cxuE58YpJ3F8/wwYewZHm2aniwA7NloZmnfvrcV+rBWqw5BH4mw
         xplQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2agMJG1RN4Uqh1hvpYM93pY1hgtgoXdc4xsbVO436l8a4ycb7KO5MubZJgAyBJ/vnO/iikHdWecAv/17wIrsWkw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx2OkyTwhjbSNsk4rjvPVnTiqEggPYJSQ6Dvy3ozphX4Rbh3k7j
	G1dWb3YuiJpEEs6G95qNVSNPUt7+loFwIRLjJDi8RejN6gkexB9I3AQp0xJKtUu4
X-Gm-Gg: ASbGncupScTtKxqUxgBl3IkQdRJnT7RlkykBygq169Y/oMesurJvNtJjQUSciy9vd4/
	jYtfbCv8ohel/mOilqK2tCluFK2gF5lvbqqKNom6VsH86hyk0m8VQX6Y3J4WouzATvWKWXrNxZW
	RWg7ynj1Kv7L0n4ix3frnU7+z30Wa/ZNJeY5HqHlgdnKc8PUutOGooTiU8VdBbngpgYn3iDpRSh
	GxzmHqY1eru/Q/8Cor2p5spQIXX9dFhPaku5UYoHY1jENmbsZG9N1sBHvRBC5KCX30pqObInBUx
	PiWutDaChx2HfZEdDVg8IFnFnJaH/FaXeExSqdUuHrA55oWHu6yKoQUFMhI/8TjdyvVWNQ==
X-Google-Smtp-Source: AGHT+IFWrp5vQ0XFKdaCZu4cbUpQ9QhQTb4caAAF7PEqylnmnlpMWN3Nzua9RJwPp1+ekm43u+1QGQ==
X-Received: by 2002:a17:907:3f8b:b0:ad8:9ab7:a270 with SMTP id a640c23a62f3a-adea93e62a9mr270956166b.38.1749724149197;
        Thu, 12 Jun 2025 03:29:09 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cab0esm111020466b.29.2025.06.12.03.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 03:29:08 -0700 (PDT)
Message-ID: <0b6715b7-a0c0-4bc2-8773-abf0b677c01c@gmail.com>
Date: Thu, 12 Jun 2025 12:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH V2 0/8] glibc: Fix lost wakeup in
 pthread_cond_wait (PR25847)
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
 =SunilKumar.Dora@windriver.com
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 10:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218502

On 6/12/25 11:56, Dora, Sunil Kumar via lists.openembedded.org wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> V2 changes:
> - Split the previous single large patch into 9 individual patches, 
>   each corresponding to an upstream commit, for easier review as requested.
>
Thanks a lot for splitting it and for the extended introduction, it was
much easier the patches compare it to the source.

One small thing: the recipe name is missing from the individual commit
summaries/email subjects.
Otherwise (for the whole series):

Reviewed-by: Gyorgy Sarvari <skandigraun@gmail.com>


