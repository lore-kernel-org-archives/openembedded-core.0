Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B93C83030
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 19:01:45 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.23539.1751742099930793933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 12:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJfdHb0J;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6faf66905adso14532906d6.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751742099; x=1752346899; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HrhXhIP6okdLfyrUQg6ozCr5hBybGtUlXGlVYdzfS0Q=;
        b=HJfdHb0JjZ/9jakZtY5JwdRudR1t0huokWdiKMEFWBWgwvkUJ9b0nFPqLZ1QUjiQfF
         AW3to08NizfDtycZPSBCpGQsxOvpxBD66GR/qPe2r6K5PPzegbACnVA9hDTWiY+itcgq
         Ob17mOma42SED7IA1/Mi6N6F+WIhUuZu9PXkoUFlNoouA59RNdh0ukV31ym+0TW7dfII
         SXjXSswJVliiHYmO18R7K2pepMnMtqSgrnuOQCa3UP5IR3ldpOX4IqX2SU00HbtvDxpM
         OYoJrmnRMk0S5LIHeTI+H8NmGAQkvowzuGKM9N6Wd4152q7bHkNNBMTTczY+bHnTDfN6
         DEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742099; x=1752346899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrhXhIP6okdLfyrUQg6ozCr5hBybGtUlXGlVYdzfS0Q=;
        b=fpTlRf1weWVsJjvlPfJZ6ozsAvT63374w/zLMWGUbC0uVZhGTLwCoRP5Qc6XEwBG4Q
         EEHcssntKPvIzMeku0Og0UO/Ld6DxuAFZeaYNL+vBBzR0wlnMdfaj8t7f0TPhYJ/VscH
         0iwC5DkmiNilHmx80r/+5jl1v8UgpmYOnA+NkT9gmK4aSbWa49qKTISkyu6iuG+mkdFv
         ED+pD68gTXw+ReAq3GtL/vozTAnbyGVvItJKzW99Y9xBzzwSF6qwxcMcEsvWeS6yAvQC
         LlC3mihx79I7WBfF+7Aiy9nItIn5c+nKQNTqkRqrJV0LWAZXxf8mpu4qK5lWbEEGIMWP
         ZB/g==
X-Gm-Message-State: AOJu0YwqYu3/Kg4KliCYSjHXbKB0yjdVnLF1Hu98R2hqzuBYLrT3poSo
	Ppgcnv0JBaQ9J8TJi3C9HQJXi0dhdZXk3Crrm4oHwxRvBj96Jn9OD352Mp0L3/NtGV8f4r+Q1NW
	MtqsxHaPfR+rgV5R4tQHAlyADXu+ipDJu6sTu
X-Gm-Gg: ASbGncvH0iEQgpZxGTA/LU2ergjwmf9uxMeu3SDkbYE6gbd1iOJisiacpyW6GfbuCdZ
	6B9XNj14+gblmU1rvKY58xLYNllKXf38jJpibZ6z6E+tOFVGIulwRSYdgQJuKAiVA29MLMU5muh
	WiW6T8fgjtkQFdmRgIPJ0cTWlgK+AEQ1E4B7w6WAdr9LHE9HDXsTijGE3PmdXUR9blus2REwDS/
	qUn1Q==
X-Google-Smtp-Source: AGHT+IF/vym96EL18XHRzDN+px1ipDbXj2Tm0i8OZ/+P1LP+uBOXD3zRdi1R0hCQ4ZeReNVuJOgqkwdSjVgDLwwpWSM=
X-Received: by 2002:a05:6214:5d0f:b0:6fa:c5be:daca with SMTP id
 6a1803df08f44-702c8b71c41mr113746006d6.7.1751742098700; Sat, 05 Jul 2025
 12:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250704053856.2446627-1-yamane07ynct@gmail.com>
 <CANNYZj80ZOUN4F6L6ypWRJFC0OX_6GYqkDEYyq3KV5nCXgaYag@mail.gmail.com> <CAHZ3=rrQfxdOo7sVz-P+-Fegi_i1VhvL=pVVrs7dHAi7K4cUdg@mail.gmail.com>
In-Reply-To: <CAHZ3=rrQfxdOo7sVz-P+-Fegi_i1VhvL=pVVrs7dHAi7K4cUdg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 5 Jul 2025 21:01:26 +0200
X-Gm-Features: Ac12FXxV_SwCLc5tUge4blr8-T7U18DTm7IOzuQEpKq1jW0R_x-XeArsE0vHkiY
Message-ID: <CANNYZj9d80m2E3PHjDrMFfH3e7gu6Zw8=-7o6WwfzjzhLG+U-g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: Add ptest support
To: Daisuke Yamane <yamane07ynct@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 19:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219959

On Sat, 5 Jul 2025 at 20:50, Daisuke Yamane <yamane07ynct@gmail.com> wrote:
> Enabling KVM on qemux86_64 and running ptest, the intltest test was
> intrrupted due to oom-killer.
> (I'm not sure why, but it seems that qemuarm64 didn't trigger the oom-killer.)
>
> |          TestBug22584 {
> | [   30.217322] intltest invoked oom-killer:
> | gfp_mask=0x140cca(GFP_HIGHUSER_MOVABLE|__GFP_COMP), order=0,
> | oom_score_adj=0
> | [   30.217717] CPU: 2 UID: 0 PID: 278 Comm: intltest Not tainted
> | 6.12.31-yocto-standard #1
> | [   30.217719] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),
> | BIOS rel-1.16.3-0-ga6ed6b701f0a-prebuilt.qemu.org 04/01/2014
>
> Increasing the memory for qemux86_64 from 256MB to 512MB caused the
> test to pass in 28 seconds.
> In this case, should I add icu to PTESTS_PROBLEMS, or add a patch to
> skip tests that fail and add icu to PTEST_FAST?

Neither. The correct way to run ptests is to build
core-image-ptest-icu image, and use that with runqemu, rather than add
the ptest package to some stock image (which I assume you've done
until now). This would also match how autobuilder is going to run
ptests, so any issues it would have can be directly reproduced.

As you can see in meta/recipes-core/images/core-image-ptest.bb, ptest
images by default have 1G of RAM, and that can be increased further
per ptest.

Alex

