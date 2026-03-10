Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B556FD4F15
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 18:06:02 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1805.1773165961571549039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Mar 2026 11:06:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=agpFotsd;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5091d71aa11so1755171cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 11:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773165960; cv=none;
        d=google.com; s=arc-20240605;
        b=BITu9PgLacWkavgIDHaJV1OJ9z8iIkspgoerGYh0qe+AMbLYOIH9Vf24MUaObfxNKc
         ioGJ07l90WO/NXnXG+cjgG4cezPkxQJufSc6uKmEco8pK1BUH5ilXlPpOEXUaBTHFmzR
         ubwFZwU67J2C9mWO2tCsAhYInQyBGOFjyEh3s4AFYvhhwcMu1F2g3SdnoDYzNabINux4
         IBk+UR5MpOH//7paPEsAvsHuy63i5ydPaSlEev5vVTCNMaAYcDhdfsqfbwgHp8xPsZOP
         qD0G3kpBF/qW0kaJDqla9mFiZeAe5xy6Ze1uUFUaKebOp9e3oi6Se1gnW4Fr4nxEbtEP
         l8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X9skom4biyieZ10HMrxEY/J1luR/vIWxLYx7+S5FsPU=;
        fh=lokdjCdjsyY6KjBfIJktI8BQ5vhRQ0H3tAEZGfjN5Hs=;
        b=JeeLlwQrzB9rj2apozGLh2zR36MbLlsdKdIYpo8/nQ3tR66S7+lNQwBnbuQNDQm/M0
         ejdIFXcTv9GWceK3ZZIZ9djZKgZZx0J4XWDJ7FB/IBq9hbx0af0Jq60DVkesNL0cy8Fa
         lRIogzwwPqflQ8+E2K1K8NN3qi3hqDOl6zLXbE3Ftw1adNoQ+nNKbdSlR4B5crWUHNPN
         W4edTYBE3G8QFIAmUJsw1oZUPb9IUT9N/8YCgx0FtaOaufbiltSqVPhG5y79XPT92h3m
         OjNHrpQKLG8eyEu+6+JgmB8caI3RoyGDb0XdzeJ69SbsgsGxUGXIUw7PGchskxcFIcrq
         OT4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773165960; x=1773770760; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X9skom4biyieZ10HMrxEY/J1luR/vIWxLYx7+S5FsPU=;
        b=agpFotsdj6GdPa25nw5TJkb8AWA0GxAm4j5cmIvLllZlD5fI21GLrpzHahtaBKu6qf
         fQM19mrkaX6c4fF3ag6FXPc3FgVFwitoDIfJhCfFoFuQ5IBoi9QsbsQluh+WgEHo584D
         4yw+nXSDh2zOQyg+qdQtZleycadHoQlH7zAtG9aNJl1I0ciFPI284Ol5XEh8Hu1c5Wg+
         0WFDW7tS0txtVoe/RZRNhRKMPSzu6LQEOSmwyC3UOnRtxjEYEuZmrWYfuN4C5r03F3pq
         f7rbXryG6QNRqKw+L2z3G05UBhauBzth0Y6g34hY3Nh8KotupGeZWckKNMZ1D4X8csLi
         0pNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773165960; x=1773770760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9skom4biyieZ10HMrxEY/J1luR/vIWxLYx7+S5FsPU=;
        b=hnUjBTFZk0wz3cukTLidJGZwfNnigxTMYQee2fIDmcxNDq8unBBa2H9usrGhNhndmv
         80snQYiJP4aGojOwnX/YusrshMzOh2YXoJzMLfRo9QNRy4PHAiqmx8ctobhY9DEGFmaK
         BE/ZKrJ2J2Jb85pAa0fxwkM3NRxcmAZjUe43yGahdnQHvqaU0o5qIMZfOD9uVYaRd24c
         0twYuTyStgAD2cWz5xWr/K26P/P0+urI2ASBMRl8byBdRTrvi+8X39uOd9HVtX4USbdH
         ZipEY42PbRnY+hKP22spcS4uvcLJJoYHC9OVwD0ptlQeNZqMDJzYBppnCvoYwuxuft1Z
         3q/Q==
X-Gm-Message-State: AOJu0YzcmxhljKnJFAc/Cr5alNjYIYwzBer7siD8WYFWYhZYM16T5NMo
	c1XFXaqgp0tYyDwQ9mSshnpZp5/uhK0SlPSModKX97jm5udtJOby/kjFHcZ43ovz7PApjikCLTZ
	zNKhTDFyez3r87eMmW11ia2CxfpnMVjg=
X-Gm-Gg: ATEYQzxn9Ilh6QhumCQLv4tZHuTedj+sXQA5JU5eoq9NMAkw8g9P8lL8KntCggRbE3N
	SlHlfng723GyCfXg/kZ6fCGSm7UjK3q/T8YAHPYeFzps3NtquhP2CqX3HB6FEX/39jSmLXRSXnN
	/H5YhEMfkNE/pUzglDe0F6ciwOuv/JU+YUeJJKi3muWiqKU3XIWexztcj5lbf3obPC7TbOVvXEI
	hRagNyyBiAiuYYVPiRo5ebdqkSOh912DhBnCUFYx1/1EN0EBBQJqVRiKTwRRGX16bcvL5blnPos
	+7fufO/VVLI5zYm+SUDwDfSOUF5cf3bZqwmosYpquA==
X-Received: by 2002:ac8:5e4f:0:b0:509:21d2:2024 with SMTP id
 d75a77b69052e-50926109410mr53054001cf.31.1773165960285; Tue, 10 Mar 2026
 11:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260310174403.2309825-1-Hemanth.KumarMD@windriver.com> <20260310174403.2309825-6-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260310174403.2309825-6-Hemanth.KumarMD@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Mar 2026 19:05:47 +0100
X-Gm-Features: AaiRm52lFJaeyyhfere12zCt8uCnkZjIE-aq_wKuzOYcGA-9KuqP8EzsmANZNiQ
Message-ID: <CANNYZj_SxfY3QnscejqEtPz1C1aMMr94VkxYP2kZcXpkfEVH7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 6/6] ltp: workaround openat2 build failure
 with glibc 2.43
To: Hemanth.KumarMD@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	Randy.MacLeod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Mar 2026 18:06:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232807

On Tue, 10 Mar 2026 at 18:45, Hemanth Kumar M D via
lists.openembedded.org
<Hemanth.KumarMD=windriver.com@lists.openembedded.org> wrote:
> +ltp: fix build failure with glibc 2.43
> +
> +glibc 2.43 added native openat2() support for the first time. This
> +caused compatibility issues with LTP's internal openat2 definitions
> +in lapi/openat2.h. LTP's configure detects glibc's openat2() and
> +sets HAVE_OPENAT2=1, causing lapi/openat2.h to skip its own
> +definitions of struct open_how, RESOLVE_* constants and the openat2()
> +wrapper, resulting in a build failure.
> +
> +Undef HAVE_OPENAT2 in lapi/openat2.h to force LTP to always use its
> +own internal definitions.this is a workaround until the fix is found.
> +
> +Upstream-Status: Pending

It looks like the correct status should be "Inappropriate
[workaround]". You should also open an upstream ticket and include a
link to it.

Alex

