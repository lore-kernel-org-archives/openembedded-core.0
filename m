Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77DED19518
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 20:03:19 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29911.1769457797718413718
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 12:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KOCSXN5a;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8c5389c3cd2so572968385a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:03:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769457797; cv=none;
        d=google.com; s=arc-20240605;
        b=AAXGzz6Xkl5xs6KUVMhrXY9Uh7RA+yjVvdkl8zGeyipLFLZDQSqQ6dHLLoDGT9HpYW
         OyVV798vAAo/9F9M6zaZMwJ2yh0JPTtNEYnQ+NQcikJHPT2KvhTV86W6QPX9HdTOTU2v
         n7qKY8DrQPxWD0taD3evmZvHQOB3mG4538XflpZ3z9YpjQWVikr9d8Qd71PGOS5ETwAa
         /2xnKOjpE0aWFEIWo/9ZlVuhsi2kWd9KvGKMDFcCfuVeIhC3ra3LCwwSGrBXRpZ3BJQe
         Ko0u1Fu3Lioyo4pfIDCvu5+OLifQVWhRZIB1cA2xVlj7q246EV/FijIS7SOlk8bUWYkd
         bPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RYYNUgCHfR4AgXn42JG/rNW5gEfGP0r+LybwpNfb/uk=;
        fh=lokiJlAtW9qnFfMvP1IYisM6SyYPCLLXL8yJBh0eyMk=;
        b=XqoSM1AFFRrAI1UpmrwQW3mXd24hPUttyrVbPBU1lAFnKWvWT5weBmjnUpUaw64JyU
         gx4IMByWPfTWLJLhzTTu6PXNB6g02ky/FO6rHrDZR7saXt8of6b2EMPY2L0He18+8vEe
         eI6BEDNYuHz4IJ0IymLVzg/KbmjaY1tAx3k+6ilBKQGCO92rSBqBtJwOBuJbJLzeqRRj
         6bGtDzz1Ryy0tXuqJB2krC66xyml7FHpwiGCxGbPxhuhjueoU8vDIcsZ+61n1pH1U4Lx
         iZemxABTSUFDLggZxw7FOKRE0t9hoSisoy1Htd7XbxMMv0iEFiDyLhPk0dL+RV2yGPZw
         AdVw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769457797; x=1770062597; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RYYNUgCHfR4AgXn42JG/rNW5gEfGP0r+LybwpNfb/uk=;
        b=KOCSXN5aIT7QtTSP2xi7Se8R3B87oJ+9RMvCwkLMJpoSN8hkzS220L3eXoPIS8G3bE
         MPFdhbKrklOTDJ0mtcRFPYfndGH6Ci5wzHtRzPmTRh0tgpvwAKo2Yzo2CQsa8jnKNeZh
         Y0hZtc/oBpi91EHFY/s1tugEKMH1w1oGN94WZymWmsQ5tR88q1F1P/iB/AJweW5pyoiQ
         TL3xQf363HKEi+P8e/7iD+3514TE9o4BGHrHV+5OP1L1yzToznrEc4Cv7aZrgzb/2mvl
         GVZsCu5qf9Eu6fBPlFjTSp+a8w61j1HsF36Myff5eLYugXIgksDtxTsrUpEKlJpJ18fY
         GYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769457797; x=1770062597;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYYNUgCHfR4AgXn42JG/rNW5gEfGP0r+LybwpNfb/uk=;
        b=KCsljlLKXkqofnBP28DNnQFT/ZyfT7/mX2CiXiy2GDI906AHjNk68gg1ukX01crfZJ
         5MS9LMWblKaVJeCmxN68iZm7WkqJ08GtRfKAmWimumVoRp/m5BlyOQEIs8/JetILzAkr
         c/j/8bQ3RgNgih2sQQCxWJpJPFpb9BxazE2iKv4hQnxZ1+ZCCPk6bg11+rIDc83DEU+y
         1mxVGof2NVTbypuCRb+xIAaVUWVyTSeiX8OODY/QonPpqZ/seJBxPxlIOQ/UOiVy0skj
         Jg/UyzEx0bfqf9hyGRFWeIPWUSZICXLuTtcdBkgwnZ2l2XfK/c4gCFOm6ECOHRaHLLUk
         C2Ng==
X-Gm-Message-State: AOJu0Ywbk3tnxhw5ukjPSfZ7tVIyiIJeB1H9pk2kjijBx6+L8EOMQjho
	0jGlnuRGnQfSCJ6yPxdAoVYDbvF+25cu+yQt2kJGz9fshzSofiP6OK/0dVvFZ7EfgrxBDOaRs0j
	WR3zF7wdQ0IvwcLHcl57Ge6X3wy9KDZx5Eg==
X-Gm-Gg: AZuq6aK3Ulq5CVoPUyy2JaVsNOV/wehPjY4cjCf+tkSym5A+3mjlsYBFLNVsHP0CMHN
	3C11XvjkRdBdBq7wtvOhPxJjZRdCYavelGswf7h/PGViqRKxcXUl0k5aAcorH0hMiNVujNgTjmc
	Yq4RvIt8Zg4Hsv9qQ0G4zNYdeqzUuhAe6OepGSxMZL1E/Sw7k0Br5hq3942DpxgCF7GlAR3EHe4
	D+En5OagqWad8PdtKTTpKrUxPTIfKsoIkhWIy4gfUaTLTP02lNQ9eCy4WdP9St1LzUBYGqodsTu
	lmBjeZ4q0doqTKfCmhGpt/mrsLoxKvuIhavJpCYK
X-Received: by 2002:a05:620a:468f:b0:8c6:aaf3:cb3a with SMTP id
 af79cd13be357-8c6f96e5f2cmr691193385a.85.1769457796532; Mon, 26 Jan 2026
 12:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20260122025736.187410-1-colinmca242@gmail.com>
 <CANNYZj_2p1G8EseLFXAnbbUcuSbZxmQ-2V=TaZUSX5CKAiLdXA@mail.gmail.com> <CAAyLwgRoRG6COWS5==ScEiG99rqRsEbjqgn60LixdwUqY3purQ@mail.gmail.com>
In-Reply-To: <CAAyLwgRoRG6COWS5==ScEiG99rqRsEbjqgn60LixdwUqY3purQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jan 2026 21:03:04 +0100
X-Gm-Features: AZwV_Qikr7Qmv9eQ76oUSCcdx4KqJTh4jHVtJgpyrfwpdQ0t6si3mFt1dmfX4gg
Message-ID: <CANNYZj9cOSUw-vqC62bnZoA6MnokxeboHKeF1wGUEBRSyw_7cw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: Add legacy-openssl packageconfig
To: Colin <colinmca242@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 20:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230024

On Mon, 26 Jan 2026 at 14:56, Colin <colinmca242@gmail.com> wrote:

> Lastly, the openssl-oss-module-legacy package is enabled by default in the OpenSSL recipe, so by disabling this support by default, I'd be introducing inconsistent behavior.
>
> I'm happy to push up a v2 patch disabling this packageconfig option by default, but I think that should be accompanied with a patch disabling the openssl-oss-module-legacy package by default as well.
>
> Please let me know what you think would be best.

Thanks for the extended answer. Basically yes, I think we should start
by looking at openssl itself. It would be good to make a couple of
patches:

- adding a packageconfig for legacy, and enabling that by default (to
preserve existing behavior)
- removing legacy from the defaults (for a more secure build, if
openssl itself isn't willing to pick that default for its users, which
I disagree with)

Then the changes in these patches can be reviewed separately.

python3-cryptography ideally should auto-configure itself at runtime:
if legacy is present, it can be used, if not, then it's not available.
Otherwise, there should also be a couple patches for it:

- packageconfig for legacy, enabled by default (basically the current
patch as it is is alright)
- removing legacy from defaults (would be merged in lockstep with the
same change in openssl)

You can add the various supporting links and other information in your
message across the patches, as you see fit.

Alex

