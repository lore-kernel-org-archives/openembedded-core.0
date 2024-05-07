Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF23CC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 19:57:00 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.3776.1715111819068048026
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 12:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BG0LLRZP;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51f2ebbd8a7so4236411e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 12:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715111817; x=1715716617; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w2FLJxBhsPMnraW2sD8XUXlrd/loFZUlsL59B5effM8=;
        b=BG0LLRZPYehTHDwqE0HnpsF4RQWI+P/zD1E8/zUUU4yjSGEhN8jXOb5/2f454WGmiI
         KCnEfvEHldo4mZtbLUCmBm4Yfo2F9o5JCPXQjYdrzvsgkShfdqCEeW+pmWWYFICueysb
         T08SfIFWnzV/2r0yXrYkuISEs5Krmk08ehIgeksuA9kpJpLcWc77iIECDj89LGDgo4MU
         9avZEpXVwpPX/JU+qfqNoIGOwn2treLITECTp40tef8ZpQQGp2Vb83FZrpXVT4LkXIg3
         jhDLRMI7jOZH6eCs0GG34jurE2jf6sOniRqmLFoI7wrKIAkEUko5VpKhhGzWTxzBCeDu
         U4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715111817; x=1715716617;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2FLJxBhsPMnraW2sD8XUXlrd/loFZUlsL59B5effM8=;
        b=sYaSq3lzJZ1/ai131nxR/MzTbDKXHsxvqok6J3GavVT/TCGm2PaNSlOX0UJaKzmbIB
         2eYnmklqvKMnw3q943tYXxbzdesLGxQKEPDfbnkN1k3T7iJ/O2bkpafcTJpcsI1NTYNq
         tk8y5aO9JKRHZfgbRzDNL5/GOYbFPCIGm/kCXvZodewG8Z1+664KbtRZqtZx+JY0z2jo
         DCjSfiJk/U6TBqIK3eEBnj6BB7nrvnriybyC0ksspD7WKn3WjzWoI8S/Qdg0C8iUj0MN
         NnbLD4Q3Xc4K51hvCgJaUO8YBBoVIE82D19Gd3M/hp1wB7TrB+ZytOqH0pSKibW5prou
         xY2w==
X-Gm-Message-State: AOJu0YwT9MrNBejvJurc+3fHCiCajrnbA0bMfY+FKHVnLkU+A/gTS7MT
	/ThjuLP5ZpSmJJ6g6a5mYM/xj0w5Z/0/Gkieu601PzVBTqoOPPWpyeymGGHX7vGyvh8Mvq68P8N
	73UNREHDMo4j7LOC23Mh5nB/uen4=
X-Google-Smtp-Source: AGHT+IHBxHpmCf5dg8bk3MPYN1EIT09GHovARua2nkGHp1h11bRcwOWXCN4lZCVSoihkJHCicP2/hWyxo2kTKRlEr0c=
X-Received: by 2002:a05:6512:310c:b0:51a:c8ba:d908 with SMTP id
 2adb3069b0e04-5217cf3b079mr296736e87.62.1715111816912; Tue, 07 May 2024
 12:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-7-raj.khem@gmail.com>
 <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com> <CAMKF1soraS1+kfj9jkSqOo6LiaZnOOqzj9PimZXssfDu0kuHqw@mail.gmail.com>
In-Reply-To: <CAMKF1soraS1+kfj9jkSqOo6LiaZnOOqzj9PimZXssfDu0kuHqw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 May 2024 21:56:45 +0200
Message-ID: <CANNYZj_dZEQgVtihxZ-PtiBHBB44OqMF7ebLKQTEg7Bt+rrJCw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 07/11] kea: Remove -fvisibility-inlines-hidden
 from C++ flags
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 19:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199104

On Tue, 7 May 2024 at 18:13, Khem Raj <raj.khem@gmail.com> wrote:
> Firstly I am inclined towards removing it if we can, since I think it should be
> packages to decide to use it, then they can maintain it better from testing POV,
> However, there is something
> to consider w.r.t. to this option. This does help in optimizing loading DSOs
> by reducing the number of PLTs and improves loading time for DSOs which might
> be quite meaningful for embedded devices that we target. However, we only
> enable hidden visibility only for inlines so it won't be full benefits but we do
> have better default compatibility.
>
> Since we have had this option for a long time and it still seems
> relevant, I would
> think it would make sense to do some benchmarking on a sizeable C++ program
> perhaps chromium or webkit, and see the difference in DSOs sizes with
> and without
> this option and also benchmark the loading time of the resulting
> chromium package.
>
> maybe we will find that the gains are not as significant, in that case
> we might drop
> it from defaults.

I digged deeper and this is where I think it originated:
https://git.openembedded.org/openembedded/commit/?id=ddd6d1fd26416a3766d754eeda4237a680a65520

Ah the simpler times of oe-classic, when one could bundle four
unrelated changes into one commit and explain none of them.

Benchmarking I have no time for right now, just wanted to point out
that adding the flag was never justified in commit log. Can you
experiment with webkit?

Alex

