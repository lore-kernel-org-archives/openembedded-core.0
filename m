Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C111C433FE
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 07:58:01 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.7959.1648799879982444151
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 00:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ezJX05qb;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id y36so522192lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLRK48m1qVZXwT8uOwARaaKa/Yw0iL2YzUJDm+ki1qI=;
        b=ezJX05qbnTfdgmroikrjtGIp0e4nchRLhYD5KmQUdqZAR+HELoExJi8LPRqkzhbJp9
         WzbvCgVZHK7FZAuah5UIzIPLcpLCCyN4gMoE4jENW8U0Ln/kabt/HDliTd5eDsMbaKqu
         OdiVA1LQNUmVMZwaXHXkTuUESN4iviSMleltGxXt52kd/PG+cp1tqm1PMzGKLumVt4Id
         F0w7lZCNEO4gcCe7J7rfyFDTAA/A6IPUTUQkUUKz3ifi6c9NPumyYeRoGYyEebl3KGET
         EdEwG39oIPWRkFuV8ZZUlWZRSjz9EMrEiVwnZB+hGwjp/OcSVaCj7LEGDP2PVXPMDI5u
         0FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLRK48m1qVZXwT8uOwARaaKa/Yw0iL2YzUJDm+ki1qI=;
        b=JkREdyEJdyDEs8mhdIzWNPCzib/HIR1bSc1uofLVNpaGgTpTZEYM3nNP1dR+pFbtbN
         5Lw8BnvMz5RbDKYTUmHza1dtyR7DIW+4Pw2ZL7DFH4dF1U3suey058IzGLd+5fijP0Kr
         P2HdTmXsxt5oZC6gxepGdBcJnZtu29vaJKsyD4aIzok3J4sZvh4jI13erRsP6pv2FOyw
         3On4kDSBhyS2fxfV07YS1v5qOHf78b6XEJaQfXJsH0px9z822svOgrYcssEFAz7cxEvL
         G8QrV1Gp3fb7zCSw7Ig/7sv3j9ueHmztiV9ZVmCOH3jdrIkunCiA0iaU7WqQKaEY2r0e
         sIwg==
X-Gm-Message-State: AOAM531xiheB6S9PJhVMcP2m3DH269i5V0yXCvUAGMPoNPXPG020QRc4
	NqkJ0TyA7daqo+CRbHb68fh6hZhPzXY7+hD9eD4=
X-Google-Smtp-Source: 
 ABdhPJxp4kWpx3aC1V3v1FVaq8H8XkrITG++O8XS++NsObR/NDxG8Svc7DD+rj2KS3ufCdSTWNM56L2sJixgfkQxKpg=
X-Received: by 2002:a05:6512:321c:b0:44a:2109:201f with SMTP id
 d28-20020a056512321c00b0044a2109201fmr12867718lfe.26.1648799878028; Fri, 01
 Apr 2022 00:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220401060152.8255-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220401060152.8255-1-sundeep.kokkonda@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Apr 2022 09:57:46 +0200
Message-ID: 
 <CANNYZj_ed8mxVVmvyqVYAvGq4+Ghh+_5=jUX8czUX0VuhsLORA@mail.gmail.com>
Subject: Re: [OE-core] meta: rust: Bug fix for target definitions returning
 'NoneType'
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>,
 umesh kalappa0 <umesh.kalappa0@gmail.com>,
	pgowda <pgowda.cve@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 07:58:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163882

Can you please explain why changing arm-eabi to arm fixes the issue
and provide the complete error?

We do build rust for arm machines on the autobuilder, and there is no
error like that occurring.

Alex

On Fri, 1 Apr 2022 at 08:02, Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
>
> The build shows below error while building for arm machines.
> Exception: TypeError: int() argument must be a string, a bytes-like object or a number, not 'NoneType'
>
> All the target definitions within tspec dictionary are generted as
> NoneType. The changes will fix this issue.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-common.inc | 28 +++++++++++-----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
> index ceeee97863..6236c43d5c 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -119,22 +119,22 @@ def llvm_features(d):
>
>
>  ## arm-unknown-linux-gnueabihf
> -DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> -LLVM_TARGET[arm-eabi] = "${RUST_TARGET_SYS}"
> -TARGET_ENDIAN[arm-eabi] = "little"
> -TARGET_POINTER_WIDTH[arm-eabi] = "32"
> -TARGET_C_INT_WIDTH[arm-eabi] = "32"
> -MAX_ATOMIC_WIDTH[arm-eabi] = "64"
> -FEATURES[arm-eabi] = "+v6,+vfp2"
> +DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +LLVM_TARGET[arm] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[arm] = "little"
> +TARGET_POINTER_WIDTH[arm] = "32"
> +TARGET_C_INT_WIDTH[arm] = "32"
> +MAX_ATOMIC_WIDTH[arm] = "64"
> +FEATURES[arm] = "+v6,+vfp2"
>
>  ## armv7-unknown-linux-gnueabihf
> -DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> -LLVM_TARGET[armv7-eabi] = "${RUST_TARGET_SYS}"
> -TARGET_ENDIAN[armv7-eabi] = "little"
> -TARGET_POINTER_WIDTH[armv7-eabi] = "32"
> -TARGET_C_INT_WIDTH[armv7-eabi] = "32"
> -MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
> -FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
> +DATA_LAYOUT[armv7] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +LLVM_TARGET[armv7] = "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[armv7] = "little"
> +TARGET_POINTER_WIDTH[armv7] = "32"
> +TARGET_C_INT_WIDTH[armv7] = "32"
> +MAX_ATOMIC_WIDTH[armv7] = "64"
> +FEATURES[armv7] = "+v7,+vfp2,+thumb2"
>
>  ## aarch64-unknown-linux-{gnu, musl}
>  DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163881): https://lists.openembedded.org/g/openembedded-core/message/163881
> Mute This Topic: https://lists.openembedded.org/mt/90172076/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

