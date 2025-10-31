Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32298CCFA00
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 16:30:49 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.20172.1761928240382648464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 09:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RqqoLpma;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-87c1a760df5so41923466d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 09:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761928239; x=1762533039; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=noSrnJPCRZFRPdvbssvzbUIgANfsXn0N+g6qN6l1H0Q=;
        b=RqqoLpmafkRSLJbz5p0ZLQ1m0+KZ8qccXuSSA3X+fTh/bBWp0sUi5DPvosgZA5fwuP
         JZOjN3s+cv1F2ULVyNm5SFM4EeVSpNphgX/EH73/b5ZhqHGOWdDYekIZBn0zMVMK0NUT
         rzQupDQLXNs2trqwZ5rmPR1cPgA8dh4HP/MeLKNQ+zCTpTrvUJsymPwODXkV4bVy/4A4
         d5L/bKMOTIQz9BvXIZ90B44ZcjN/9ulxCw8dOoD9NI/srEfiGQj6WHDpluB2ml8yZbBk
         GiHnq69DwuAJLT/2984FF2/sljorh5upZ4fJeuXyJU9lnp7WzvemwszwVyV5rSUJHSZu
         CoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761928239; x=1762533039;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=noSrnJPCRZFRPdvbssvzbUIgANfsXn0N+g6qN6l1H0Q=;
        b=tNo4pS0thN4PHP1hBn4WgTiqA1ZntaN2utZcbTe0qXwfHbwJC4QDmmZkEvwyGCQ6ej
         K9lC9U7b32/z+uxaPTerfZR+pP2YzbdUR8DdEprc/TbplaT0WjVU/Vvlclq2m7ZFJJUh
         6mgCixCstMaqfZAcDhh7dzs+7tvxjeKutfikC423Q7w/g6klEFnwstr+dztuAHpsy1UU
         gNkPkv8KEhWsNQBWUBQmjJSzJQJDqmtDu6oVxNlPwdLAhTVfYShLUvsqq47MZDdW1E01
         YrBiZ7tJMW8Aewg3SjIwgW3WL4PYCl8cVt8HOpG3vuhR+E4Oz3Z7vdNPwJAITm6APmEx
         3sDA==
X-Gm-Message-State: AOJu0Yz6SDBdTc3b3+E9lXURBfOIDUoeOP9WoNsugHRpWRHdgpoSYE0L
	rxpO6vAEUW5BYsVSykAZ83nmYIHsdELdDbqQ3/f2Jrj34wQcTPSQh6C4m/bXEwZ8dDDdJGvF4th
	C+eV+8ZW8PGZQJub8tP3WS9qOTsTWTg0qyQ==
X-Gm-Gg: ASbGnctwSbFyuE66H3QQX78GqpkjXmjsolXWwgMxXBLpat1+u9yvlh2VVqUyR1YjAqD
	30Kr0QAb9ZEHR8LwE332npTKF2Ssb1hmEx/0wySAaEsv3hKDTtnkSeVC/H7IUGXpck1I9bGA1x5
	fXvDGa/vlmhURPTY0x1pgRrRcJicG/CFT9NcJ26UBixAgKMVVNifKeQvHbwe4ZvtMnRJ+BwogtF
	QPF2IRJOWP8IxWvPUHp+JnAf0FMfPvRpaj5c6XJCh5wPIRHZo/RIkOmcMqnw23B/lwj2Ljc6Na7
	ZggQmjm+9hu95P6gCq+MW3t0dV5qcVNyXVPA1yhsFbtgYtTixDE+DuZQDw==
X-Google-Smtp-Source: AGHT+IF+m/FXpSi+4ktmBbvp/OTYUPs/1s40dtaw6H2j1pe2uXnzWo6jNLWeCHxhiUrSklDFrj3oxlW39Jcd4NNvAio=
X-Received: by 2002:a05:6214:468d:b0:880:439b:ac55 with SMTP id
 6a1803df08f44-880439bb0ffmr15338026d6.11.1761928239314; Fri, 31 Oct 2025
 09:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251031064504.461920-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251031064504.461920-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 31 Oct 2025 17:30:27 +0100
X-Gm-Features: AWmQ_bmqI8P-ge3hdABvHmsq4wkGDWLzfs8tw5WV6M27IOlWBhFrGHKu_YU-G_4
Message-ID: <CANNYZj89C_tuh8Gcd-PoicmPigwHpmvfqya+A=GdybH=t1rKHA@mail.gmail.com>
Subject: Re: [PATCH v2] icu: use automake ptest output format
To: jiaying.song.cn@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 16:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225549

On Fri, 31 Oct 2025 at 07:45, <jiaying.song.cn@windriver.com> wrote:
> +- Adjust indentation and timing output formatting

This needs to be separately justified. Do we really need those extra
tweaks, or can the patch be limited to just adding PASS and FAIL
prints? Are those extra tweaks suitable for upstream submission?

Note that the longer the patch, the higher the likelihood that it will
fail to rebase on version updates, and require tedious manual rework
against upstream changes. Patches that stay in oe-core forever should
be as short as possible.

Alex

