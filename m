Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.26527.1628531607228810587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 10:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ThLHFQGn;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id q11so4329551wrr.9
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 10:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sy+ZJgm6i06DOpM0zNFd8asnXTAe7oa1txZxe+DntKM=;
        b=ThLHFQGnRLntzdRXtTBEaxFzdvSw2vdE3ZSvuff//uBLO4qTrMATMMTb8dE/4QJocY
         GLA8ZtvQSLy6R1Ft+zpdw2fC7UbktHrlcdfjNZ5ITkFHHDMjjHi/XZtNTQsE4UQhzpeu
         0Gi/EEdJT0nJZydu4nnwNeMKuwloExP/waisJy1l953Y6wvKJ+NgaZe7h1vrvdscdk28
         8TxS1bVT6uSwXDC4Q37eRM5NW+NG6i3ygi6Bwdo38WqYHq++O0dItaPrEzibPJBvNR4+
         BVBrj4Juxg69qqSlbPCsNUa4tjcRkgq5B+/QB72SUroxWW8Zzy8ELZagfvls5JA4AQMu
         8e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sy+ZJgm6i06DOpM0zNFd8asnXTAe7oa1txZxe+DntKM=;
        b=VQy2A1WBOBLq7gP4Unwu4INVPgNTkLHlIAYTLj5hJp25eBnU+qco/+OxuQ4fDlANm7
         AIkAFeDHgLE4l4SQGnL3FhI7oNJjD/4eI72+9S+Gp9VFWEiPEXvBuL92m+ob6gUF0j6T
         I8TJ7PNja5fPt8+7o8O3DDIP0jJmfPyursSu3eyovUuGj7xfo2aH0QbJFTRWJISkD2eS
         ZMVH70IHQ+JALZLemwXW6e9W4JXAP+sQh4Pgz3s1rIuoawLf8F0bdo9uyBcVWXh/lJR0
         7ber4exc+CPt5G2j39/o41EGXROFbh5sok+QAJ/g1p9VtWfZWpft9nGawkqVG74N31yT
         tAxA==
X-Gm-Message-State: AOAM533Uc3M/y42blCDIPe70FDk09RneX+4oLwGLLOEGCIGyAIXvJp8I
	c1dbQSeJ5JUsqrdsooj7WAYZHDpuYIwQCe5BEn6yyg==
X-Google-Smtp-Source: ABdhPJzuZoxfcZTQ8ASTa2ZP9ox2WrV7zWpUumK9i3ey2imhNB5uapeOCxf10Y5u9qMNfHY7Gr3xtxvEm3g1uMpCPwg=
X-Received: by 2002:a5d:5987:: with SMTP id n7mr27050232wri.260.1628531605520;
 Mon, 09 Aug 2021 10:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210803051138.30790-1-qiang.zhang@windriver.com>
In-Reply-To: <20210803051138.30790-1-qiang.zhang@windriver.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 9 Aug 2021 18:53:14 +0100
Message-ID: <CAAnfSTtD=Vz-3SY0UYBh62en9Z_WMzWP7iRQPynmJPmCR+PiHQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: use monotonic clock for condvar if possible
To: "Zhang, Qiang" <qiang.zhang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Aug 2021 at 05:41, Zhang, Qiang <qiang.zhang@windriver.com> wrote:
> The timeout for threading.Lock, threading.Condition, etc, is not using
> a monotonic clock, it is affected if the system time (realtime clock)
> is set.
>
> This patch will make condvar use monotonic clock.
> Refence: https://bugs.python.org/issue41710

That doesn't quite make sense to me.

As referenced in that bug report,
https://github.com/python/cpython/commit/001fee14e0f2ba5f41fb733adc69d5965925a094
uses monotonic clocks by default.  That was in 3.8.0 onwards.

So, why is this change to pretend that the semaphore is broken needed?

Ross
