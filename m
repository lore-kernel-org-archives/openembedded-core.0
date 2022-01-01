Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763B3C433EF
	for <webhook@archiver.kernel.org>; Sat,  1 Jan 2022 09:17:57 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.23482.1641028676016973336
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 01:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OnhctQwV;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id v22so25871004qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jan 2022 01:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R2c6y9MJplrVrcbRlkQuxwfYwn8sT4j3gO8gngxzw2s=;
        b=OnhctQwVcZ5s/6m5wKSiMam7v0ymGN2TTd31vpsBYth+lmIVn6Zv3BkcassoqaTlxS
         30XNS6QzIavuDCBfL0EoF2vtZUzRt2R8d4U9pqmk5LIepaj0d+1LM4UiKNDAjQT+glBv
         lcS1Vs60vLE98mZJbP/38EnXBrpos4WtNBDAd0/Lo5M+qHM61eCYr/VjbiAw63+39bDv
         Oa4ICBX9WFOn+wx4J/EcZ0HVlOV4tRdtZG7hC5XqL54YOu6/arfGmdOvDmKu/GCQmU/0
         LdTHUOqM08QYGhoYODB5Vt9A5DL+TKeu/TeSGe650Zh++RrAYUbliQHHrrNTjLz+nhbA
         EpBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R2c6y9MJplrVrcbRlkQuxwfYwn8sT4j3gO8gngxzw2s=;
        b=a5W7a5YiYtsak/vYRmiC/fQ9d+ChNSyrXMgGafu/Mq4hWE73HWnFxRuxejK9SpGpy5
         fmkNJm2L2uMRzs2mial3Zp49SwHc31P1dv/FroZIIW9b/Kuyr0KdnGZAcg1Hd4y0qGkX
         Ksx7Qp6xn8ZcV5UZqqjv3YWA91CFYRuWWui6IJhsH2qNq3O982KjjkdE4HwT1/Ziqw0r
         De+u0wYrfT+5ZhQZH6LUTKxt+1vQFJrDpwI5b1eHfl4rqNN9xqXPsXzOs7j/0ofwchiL
         iU41VhTzoSpZpZ0aRGD22TVGqF3HvFRlideergtRL/DwxDjf5CrWh5UqaHj3WaWeFhWI
         wHRA==
X-Gm-Message-State: AOAM531PwxTgcRTY3lKjkVikuySW0/v/eex0ue9ElLNlUrqutnVaHh1Z
	6lck3X82PaCPSR6PgCWeZnpXKl9yWzHdreUCqM4=
X-Google-Smtp-Source: 
 ABdhPJyVOl8pLeJSmDaL4EGjPYnAKfWxmRpiXMywTkeuyN7zezIgEIdVaBO8/HmQuiQ/PU5mQ4udLyGrg2ro1uIDc7k=
X-Received: by 2002:a05:622a:1386:: with SMTP id
 o6mr33413625qtk.64.1641028674993;
 Sat, 01 Jan 2022 01:17:54 -0800 (PST)
MIME-Version: 1.0
References: 
 <58e0250eb36fccc1e43bf6f667073e87bac0a82f.1640615708.git.esben.haabendal@huawei.com>
In-Reply-To: 
 <58e0250eb36fccc1e43bf6f667073e87bac0a82f.1640615708.git.esben.haabendal@huawei.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Jan 2022 01:17:29 -0800
Message-ID: 
 <CAMKF1sotOO+qcYj9SxT-g6pMTpyShzfR4Oks_+i783J1Stkr7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] musl: Fix building with pure LLVM toolchain
To: Esben Haabendal <esben@geanix.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Esben Haabendal <esben.haabendal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jan 2022 09:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160093

I am getting dependency loops with this patch for musl/clang with llvm
runtime now see

http://sprunge.us/5qlw7b

On Mon, Dec 27, 2021 at 6:35 AM Esben Haabendal <esben@geanix.com> wrote:
>
> From: Esben Haabendal <esben.haabendal@huawei.com>
>
> When building musl with a pure LLVM toolchain, we need compiler-rt instead of
> libgcc-initial.
>
> Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> index 06b0e060d015..2b307482c7aa 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -23,7 +23,7 @@ PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
>
>  DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>             virtual/${TARGET_PREFIX}gcc \
> -           libgcc-initial \
> +           ${DEPENDS_COMPILER_RT} \
>             linux-libc-headers \
>             bsd-headers \
>             libssp-nonshared \
> @@ -31,6 +31,9 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
>  GLIBC_LDSO = "${@get_glibc_loader(d)}"
>  MUSL_LDSO_ARCH = "${@get_musl_loader_arch(d)}"
>
> +DEPENDS_COMPILER_RT = "libgcc-initial"
> +DEPENDS_COMPILER_RT:toolchain-clang = "${@bb.utils.contains('COMPILER_RT', 'libgcc', 'libgcc-initial', 'compiler-rt', d)}"
> +
>  export CROSS_COMPILE="${TARGET_PREFIX}"
>
>  LDFLAGS += "-Wl,-soname,libc.so"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160029): https://lists.openembedded.org/g/openembedded-core/message/160029
> Mute This Topic: https://lists.openembedded.org/mt/87977893/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

