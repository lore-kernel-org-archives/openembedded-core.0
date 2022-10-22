Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E784C04A95
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 19:56:45 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.2025.1666468595137108552
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Oct 2022 12:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H9WXFIJo;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id bp15so10577453lfb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 12:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ACp5LLuIFfb7R7hlPo/VTlFAi6Yem1zw2HU1/TrmvuE=;
        b=H9WXFIJo7ueJzxqrbwjP13qoBoOcaZeX8/St205is7S5P227CsbtmhnI1BMQFjSf6p
         AOM0X4RTDkWuELf4FM1LIVNDuSAXrAM0J5hh6IwUiFfw4xKfRKQCxRdOvOEI7ue/DYSi
         Z8qvCnwLp/16x9vYWSoM+WKMlj9hgfRFUE+kqN9C+Ix7vbDSBFFrOpQlEtUp1Ix6r8xi
         oC/nlXqzqr7pPlcMBR0RGs9SQosQhGxy9FBWqXdAPP+DZg/3vEcDp7mRBqsHofxt4tzf
         hOOJXEmGa2Cw9IGyUCoNab+L8DbhX1Txa0RNzL6pOmnED1AT5I1jWqJJSmObVb4Vr6qq
         mT2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ACp5LLuIFfb7R7hlPo/VTlFAi6Yem1zw2HU1/TrmvuE=;
        b=ttcbATthb74cwjXtPKiPHSSqcB1wlAl9xQE8rQkSNf+9bpndznmxNDxwO70MxxYTNM
         4yWG0MRslZXxXrjoqUOd6ONPwSmaakcIWlBUh8heWez8W4E19LSC0zvfKf0VDonqL2mP
         Mevbp4ZR9xPErZo+zygys/52lrpKbyfRmeqoovQxWLG71ogWWB7jOKZfBPTLXfDAgF/S
         86emDiq+ebbGuxeO8TXhQ7QjvzVs+w5iQuB1Ew1WXTQA3HkO9EVQ414E7DCqo3cPQ4Yo
         Bp9i+/1la9s9hmrXT3K0k07Tobso/W5ACr6Simp0K5w8H7v3X5Kp4+J+3CviWKeaHQRk
         SpHg==
X-Gm-Message-State: ACrzQf0RWuUXKpbeaY8EYu2BhaaUwOSg153kNb1m9iwknDhgVDXv4FUC
	AK2LRfjUXX2dNqJ2DVduE5ya2lcuNOOZ+dfYkzQ=
X-Google-Smtp-Source: AMsMyM6AgSj/s0SOI0THiCONawi6zyAsziWRWGaC8jsXDL6fnPiTB+2SRfXls8kzJQP9mFU/qLqblNjgWDAcIkeEA8w=
X-Received: by 2002:a05:6512:3989:b0:4a2:7d73:495a with SMTP id
 j9-20020a056512398900b004a27d73495amr9034297lfu.492.1666468593156; Sat, 22
 Oct 2022 12:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com>
In-Reply-To: <20221020223004.1665512-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 22 Oct 2022 21:56:21 +0200
Message-ID: <CANNYZj9qeOhAPdyJFDpPi1M-JVw6aKt8QEr-pMt9asOG-n6TrQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 19:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172064

Ok, I'd like to understand where the failure is exactly. I just ran
'bitbake rust' with poky master (rust 1.63) for qemuriscv32 machine,
and it succeeded. How can I see the fail? Did this become broken with
a 1.64.0 upgrade in your branch? (which I believe hasn't yet been
through the autobuilder, and so might show similar fails for other
targets without atomic_64 support)

Alex

On Fri, 21 Oct 2022 at 00:30, Khem Raj <raj.khem@gmail.com> wrote:
>
> riscv32 builds fail since AtomicI64 is not available in sync::atomic for
> this architecture. Therefore it needs to be opted out and the way out is
> to pass it by RUSTFLAGS, however rust target recipe overrides RUSTFLAGS
> before exporting it so its better to piggy back on the variable its
> using which is RUST_DEBUG_REMAP
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust_1.64.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.64.0.bb b/meta/recipes-devtools/rust/rust_1.64.0.bb
> index 1f9dbd3cce..b05f188d9c 100644
> --- a/meta/recipes-devtools/rust/rust_1.64.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.64.0.bb
> @@ -9,6 +9,7 @@ FILES:${PN}-dev = ""
>
>  # Used by crossbeam_atomic.patch
>  export TARGET_VENDOR
> +RUST_DEBUG_REMAP:append:riscv32 = " --cfg crossbeam_no_atomic_64"
>
>  do_compile () {
>      rust_runx build --stage 2
> --
> 2.38.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172006): https://lists.openembedded.org/g/openembedded-core/message/172006
> Mute This Topic: https://lists.openembedded.org/mt/94464934/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

