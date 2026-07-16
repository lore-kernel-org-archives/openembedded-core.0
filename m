Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64D6C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 10:12:10 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9634.1784196723527737509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 03:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P8l1dxaP;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92c7a0a701aso482132785a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 03:12:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196722; cv=none;
        d=google.com; s=arc-20260327;
        b=QiJD9q71D861/kefvEOzBAU3vZr0WCSWXfgc9hktPCsR/hVS4cBS2t3/pltw89w2GR
         b3eTQ1I5P81wU49FtIowJ0cxBJVYsv5uyfngdYfP6m8DbuY2p5nz09bv0bU9IdeXgqhs
         6dkolmgIydwYn0aXc0yWvvn4WSfk00tapYw0CwS75pGpUhPNn6W9dJkfJjS5lBboTJE4
         F146/81yFeUE1J4shm9cD3zG3sr7+YC+Noqvqkpm5EGTpgAdHaeZH22bXOUZB5lXv3vo
         Gu3CLvZMJyrVXAOMoCqDfD8Sv0KfkZ81stPIOYiKNf6oAv5YvpB2iZZV5D9zeja/tddW
         FjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mNEVmD2hs3qWP8q9xS4YRONBDUJPRcrKLOhzkxrqOuo=;
        fh=f3aCQIdyz8ZsVYtQsJMZUezkonOplPpK9irj81J5K5U=;
        b=PLN+S0Toe3I1iw9KbHYI0o0QRCeFLDKw7V9Bxy2Ggk4Ne7QP4V7AzOWiJc8625aqt0
         KC6rxfckpkGoRmZc9eFpjOuzABbytAzDpduEfLh3JO6WIQhHFvFJElKq3EYwS23XVylu
         dVxVuIhpc/48JokItqnhIbkEPdB+aUehgXNBUk39p+LzwvjtsbuKAnBpkBxkz7+jI6cN
         9FOq9wQgE5tDW99N3+DTUY191lwqZgLENlguCIFGylRKzL6qk/B7GTgIGtSlHU8/+91w
         UnH5ZjitS6ryGTloosu4aZNke79NEGcNnvaIcUDyYRxy4h026Z1G5Sf2WMWmmmq1d5tQ
         275g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784196722; x=1784801522; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mNEVmD2hs3qWP8q9xS4YRONBDUJPRcrKLOhzkxrqOuo=;
        b=P8l1dxaPRgE1ZiQetBngA1/SXJt7uZZaV8ADRZq8SUOR7aVTu6PCaSHwVPW9inI/Z0
         cwdEPSEdih9Cj8o/oMkzBB8961ZIPNYrLLbRC3cEVH/jZ9eeutdGKzd5RgiktNgTSomn
         h5zvIzBl6L3z9tRVbpQWl/2YrOxCjHlMS6XNvW7oOMLzybGS3l0t0+p3hcasEuipYut6
         2PyHr2UD9eVq7p7YHiTVmhnvsmDVgang+BVuMyOBzTaL4Z2NkV4DZ3nJAVMX5eDWjPQz
         qRzvhId1ucuYEjuJSbxhyF5Faslmx84FOA5XvnqklOjdHR7ffH4ZI6zeRWntH4Y7apau
         REKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196722; x=1784801522;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mNEVmD2hs3qWP8q9xS4YRONBDUJPRcrKLOhzkxrqOuo=;
        b=p4E0dNwf7DN9IqGPSgyiqB15r/ZSfMsMXVGDf6eAB0wCTsMvGMmdWoUoegrVCKk2FM
         7ajWTXBfo9ohvAx9ldst/ncpgXP+lGIX+uQRycMHc7YZN9V1YRUrcV+d2HChInqQm/FX
         dKDwO1qoqDLi8m8UDjKh/mkzkGOcbsm0F2kg+fT7wn62eDygL0oq8tMF492gy9Dl4TT6
         HYtDRTFVZyFgtsMlNpNnncImXouP3B4R+4x9SqvNl2vwDxQ0y24WyxVC4U88DWQ/R2xz
         dwR2T799u2n5ks5lR8ynpKbFlH4qwI05m6mEmXKVpY30Bw7LzT7BqZ08V99kkp0B33w9
         omHg==
X-Gm-Message-State: AOJu0YxfJCNdQvemWUWkSksBC98VQhU4cHEla7PB2lLHe4yvkjspgM2e
	eJ9dK9oKq1vSF7f6i95V3t4oAFnYzqGGEOYD0aPIlbsU/tKL+MzRw85T2WiglKv1J5YElC00MXg
	YZfZi442vE1H/LL5u+AQlcCqqPrPwaNY=
X-Gm-Gg: AfdE7cnmOzhpGRp1G+/83wvZCDIEtyEA7bvzpSNoIeVIjx8PaA7XSoLXdnSwliacRJr
	3hlwHiibqO4CLTwsT4vKBOT212CLMQYqb41ZfgDSDkm8JzYI5XHxus0heIVNdMiQgodMEZg82Ik
	PlRYWwqyvGfhRfS7yK2ey4vkyGyLjY82akmjEhB3pX3evvg05/54oBw0t107kQ/bP+AxNNx4f7n
	U5DTETQqlLLaMudJMVi/QHloNrzMEI8c1mggtTMlc1MC/4QEMAyld2HXk/tMx93BWNQdVASo4GU
	0Ag6NqhdC4S3tZyGdO3L
X-Received: by 2002:a05:620a:aa0f:b0:92e:7ba3:73e2 with SMTP id
 af79cd13be357-93083d948a9mr1003512185a.74.1784196722016; Thu, 16 Jul 2026
 03:12:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260713085833.3698049-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20260713085833.3698049-1-sundeep.kokkonda@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 Jul 2026 12:11:50 +0200
X-Gm-Features: AUfX_mzQ1FOA4JsXrEEVYT6lxKJ629Rab4UAZNY-6q6byt67YG9ppuzTNsytN8M
Message-ID: <CANNYZj8Lix=D0ShKrd=YDbkqKqgtn1ZWdV19L8gYVp3F9Yv9rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.96.1 -> 1.97.0
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 10:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241077

On Mon, 13 Jul 2026 at 10:59, Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=windriver.com@lists.openembedded.org> wrote:
> 0003-tests-assembly-llvm-issue-141649-fix-expected-stack.patch
>   Fix expected stack allocation size for aarch64 with LLVM 22.1.8.
>   LLVM 22.1.8 optimizes non-overlapping scope stack reuse more
>   aggressively (32 bytes instead of 48). This test is new in 1.97.0
>   and was validated against bundled LLVM 22.1.6.
> +++ b/meta/recipes-devtools/rust/files/0003-tests-assembly-llvm-issue-141649-fix-expected-stack.patch
> @@ -0,0 +1,28 @@
> +tests/assembly-llvm/issue-141649: fix expected stack size for
> + aarch64 with LLVM 22.1.8
> +
> +LLVM 22.1.8 optimizes stack allocation more aggressively for
> +non-overlapping scopes on aarch64. For scoped_two_small_structs,
> +it produces 'sub sp, sp, #32' instead of #48, because 2 non-overlapping
> +16-byte structs can share a 32-byte allocation. The three-struct version
> +still requires #48.
> +
> +Upstream-Status: Inappropriate [OE-specific, LLVM version difference]

Hello Sundeep,

the update is okay, except this patch's commit message: it should have
an explanation of if/when the patch can be removed, and/or an upstream
ticket that notifies upstream of the issue. These things are generally
expected of 'Inappropriate' patches.

Alex

