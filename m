Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5FFC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 21:02:00 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web09.12.1666386113048364291
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 14:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HrNIDrSV;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id g7so7236244lfv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 14:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MTSXM3YtXBveB7H3j3PAjb9uSk0XxuX8T7tRQIlS+GY=;
        b=HrNIDrSVMl/ENgpgaUJVVsqm0mgEOw4vZFIw3OEEJhw5XV8albA5BVv5z3sOen7AYL
         3+P8Z8Q3k0O+r3+pUOypeAV7q9t6KLaI8312U9RSEtcuuu2mGcWaoiuRulA+XOZigTbe
         adFpdXq6rsFHigGCCuIVn7wxpnRBxHgzF3/kfQVrFyBKz3eCoz1Im+k/1zdAl2Sh1Cnf
         Xgn9WSSQgbJeRDDW/U3BDjNl7BobtI8o74dfpcpcnPiGwUhhPmJJITohMM1RzkgpnieE
         1AW0Bkvk5jyhm2bgTXhuRplwojOOWSBA86F2ZtDy2BVKXQ3+LqHmNaPcUVXNm8DY6YBB
         TeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MTSXM3YtXBveB7H3j3PAjb9uSk0XxuX8T7tRQIlS+GY=;
        b=da7ddAHhjy4/5HXSUwW1eiAHOywUO1/UaRST14MxhXbLnfpP+wiCOp7UWlJsmxkog9
         rcTvEGAM4M8c7KTLQlF87k+iRDrgq9szHoes0tT5H4g5tOz1kzuOKsY9vvHP8FTC5R7c
         Fzz/Qnq94a8wOTKh0hVRfO+iQLpr8jU1mKfS1TovTetGmMEyRvjfQ17vEOtMi5+0Qd0v
         tBbt1wNoib2QZ4nN9zjCLEhh64iJ3YKCkUjJdfNmaz/cUmBUMacB+W2HWRNBcX4Rr0V9
         We8Cog7Ic+0PXZ1IjH/ly6ntugEhB7ymUJVwIFZOPTOAqN622m2sypqCjQqClnH8FW6l
         HnAQ==
X-Gm-Message-State: ACrzQf2lRMzL1q7FZ9d0gliHLm8ycu1YHjFOeqB73Ge237FdgJBFN45Z
	7UhPPtdkvdSXGjATsyrOiAKoOy69fQTypj+rQEw=
X-Google-Smtp-Source: AMsMyM4SKpa2T/ICtO1zuLxjE2C9xEOhqwvkidbZrFrOlnqYbH9rTZhZFon/M088giaweI88noP00c9dbuD6XpyRtyI=
X-Received: by 2002:ac2:51bc:0:b0:4a4:712d:1b83 with SMTP id
 f28-20020ac251bc000000b004a4712d1b83mr7111379lfk.345.1666386111224; Fri, 21
 Oct 2022 14:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20221021200514.1918359-1-raj.khem@gmail.com>
In-Reply-To: <20221021200514.1918359-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 23:01:39 +0200
Message-ID: <CANNYZj9X45DmDddF=p=4ZVkwAN5q2a8TB3ref27_rj1YiRFhYQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 21:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172045

On Fri, 21 Oct 2022 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
> Update the arch part of tuple to consider OE's names
> for riscv32

> +--- a/vendor/crossbeam-utils-0.8.8/no_atomic.rs
> ++++ b/vendor/crossbeam-utils-0.8.8/no_atomic.rs
> +@@ -49,6 +49,8 @@ const NO_ATOMIC_64: &[&str] = &[
> +     "powerpc-wrs-vxworks-spe",
> +     "riscv32gc-unknown-linux-gnu",
> +     "riscv32gc-unknown-linux-musl",
> ++    "riscv32-unknown-linux-gnu",
> ++    "riscv32-unknown-linux-musl",
> +     "riscv32i-unknown-none-elf",
> +     "riscv32im-unknown-none-elf",
> +     "riscv32imac-unknown-none-elf",

No. Updating this patch with every rust upgrade is already a pain in
the ass due to rust checksumming, it needs to be upstreamed in some
form rather sooner than later, and you just made it worse. Please
let's do a proper arch re-mapping.

Alex

