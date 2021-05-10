Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.29426.1620640104296978302
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 02:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FLJT3x9S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id d11so15895891wrw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YV0VwiCAsZC/AYIL+oWMp6EXdSQxuAqoYkmZY3uqAw8=;
        b=FLJT3x9S7wm4FABXvyzCk2aOwCYJw8EyVAIex8aygo00fExpGnGOE/HFsc7dVE1J0O
         dnZPlSGLuB7XxZ/RuK78hKYCGZ8SKd/cso12Vg7bXXtu0BU5ZFmWTa2aoy9/9KF8rDCK
         VcQplMgTbLVC+kbqL2gQaMcH1u1Xlg9uTft2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YV0VwiCAsZC/AYIL+oWMp6EXdSQxuAqoYkmZY3uqAw8=;
        b=ccg1EMi4O9Y1OAWMAk2Gh7RM8F/ve/UW1tOD2cmJi0+d3Elh0nV4JWzjtvY5x1IylM
         nxwSzh5FpH7NXWqGFZDhfU8J+Yx4XR4vGgL+sZ4z91hs7DUbqWlhwE6K+Ny59b3URcZV
         i1++8U1UYYHMDD/osIPkDHu+royW7CyKf1FTbTdqQ1HNCyT708jDtiF66rnpICtJFZ5g
         MXBPiPvkRoil06HPGdVoKmUxB7D4sFkFPh+sXlpTPJJJ56QR854zz5kAY2lhkBIqW/D9
         1mo5kD+A0HmP/QWCzcvAVYI8exzuLCjFzSd6c80wQs5y8A1ob1eSDD7vyHZgj8rpC1mE
         UcyA==
X-Gm-Message-State: AOAM531+ne4AExcMUXUdOpyMuyLuH7IpxMR7Wrl7Ie4N9vT7PgxKOYfc
	A1GTkAJLdF8J9+KsSDcVZIctag==
X-Google-Smtp-Source: ABdhPJwWoOxGWkP+DDbqLwEcSvg7+rnq7tHENqSChFmGbFhaZ86IFCo7yyi8Bb860jHl0JcwtpNhKg==
X-Received: by 2002:a05:6000:110d:: with SMTP id z13mr29542630wrw.92.1620640102772;
        Mon, 10 May 2021 02:48:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6? ([2001:8b0:aba:5f3c:67a1:e913:59c9:6aa6])
        by smtp.gmail.com with ESMTPSA id j7sm18890857wmi.21.2021.05.10.02.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 02:48:22 -0700 (PDT)
Message-ID: <5aa52a186119be3add2555d6dbc89f348699aae8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rng-tools: disable the CPU affinity mask
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 10 May 2021 10:48:21 +0100
In-Reply-To: <20210510023310.5516-1-mingli.yu@windriver.com>
References: <20210510023310.5516-1-mingli.yu@windriver.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-10 at 10:33 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> For the jitter entropy source, each task thread will create an internal
> counter timer thread when the system clock resolution is under 5MHz.
> 
> But it will introduce high cpu usage for a long time and also make random
> data generate too slow if sets the CPU affinity mask of the internal counter
> timer thread.
> 
> There is no solution until now and the Upstream recommends to disable
> the internal timer and think Jitter RNG will not work due to the coarse
> timer. Check [1] and [2] for more details.
> 
> So disable the CPU affinity mask as a workaround to avoid lots of context
> switch and too high cpu load for a long time.
> 
> [1] https://github.com/smuellerDD/jitterentropy-library/issues/37
> [2] https://github.com/nhorman/rng-tools/pull/123
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...tter.c-disable-the-CPU-affinity-mask.patch | 48 +++++++++++++++++++
>  .../rng-tools/rng-tools_6.11.bb               |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-support/rng-tools/rng-tools/0001-rngd_jitter.c-disable-the-CPU-affinity-mask.patch

Thanks for investigating this upstream. From an OE-Core perspective, I've very
reluctant to take what looks like a very board specific change which the upstream
is advising against. The issue is that this will affect all hardware, not just
the hardware which has the issue. I think we need to find a better solution.

Cheers,

Richard

