Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB80AC433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 06:04:15 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web08.7113.1666332248482748352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Oct 2022 23:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iPzNRXl1;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id bu25so3380148lfb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Oct 2022 23:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5obev/rGXESW8c9bVlXmNVWHoALc1xPQwjb5UBStP64=;
        b=iPzNRXl13oKJtfVyAbxSlEFNJeBr92qxOib5k8IhzdFZ9QUPFlqH5PqHfb1+8I4l6Z
         VbqSdEmquUc0iN5+jokD8Cx+6FaEtHYKZcJ1vdqiiYhAqxn3DVvZnLH7HPxTmgejAFLF
         xoS6ILZrUI/QOAFXxVIdYCYlqn11tcF4sxRNadU7DQDuElbZi7ZWprplatbIuVH9fTKN
         TiUE6H6sgM7obx4tzhop1Dwy/zIwokYVT1TNFP0yJv58HH9CqVrBNulMEDuGHJ5xPp1e
         oDB/S9jwqJz+BbWmOtzImHZCXTMqIL5iWCRqCJ0ryQ8ABjChF5hRvPVujxPEL4drdmGc
         vfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5obev/rGXESW8c9bVlXmNVWHoALc1xPQwjb5UBStP64=;
        b=PVFX95saBKNpZ1a+vNskBN0abOvcnd647+Dj+1qEVMP6VGgOX1KzjfyGotPS+cQ26i
         pS/aHdBcUQ8MzPUufiO/0diA80z5+otqk/dTwWQgfW8+onP4ifueQE88FxyiCwYC5Mpl
         1nivjXPRZcDkQ8qYXwSu3wPIj6xQ3EC+vYf+YBUSbefRvU13CCf5HA/08Z7eBOTH/bpV
         kYY1y03yqjxXOX1pnE5QodI2SYfs/O45AqmdcWJ7EQM6zMBpkbGhKlLuYVUGMCD2xngt
         VBtLTSNtSb/FiCwAaE8UfQB/8+bk/0YUDLhlUjGhvCZ2hF67jJP7l0peaoKsIIlX58Yp
         19ow==
X-Gm-Message-State: ACrzQf2YNQJEJ9Dh7dWoNcrvHWeN1GU9F+hdXQKbzgqfDu2xwK3vars3
	BmvmWua/VjTLJ0QdrbHI3T7e3s03ows+D61k5CE=
X-Google-Smtp-Source: AMsMyM6wnFkkor+IFIvsls/6skTh7cKqVujEOPWeXyU5o+IX9nLG/KNDV3qSNU4hTM8wbwYONFhsCL+h9w4fgZ4hp0M=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr6312935lfv.131.1666332246179; Thu, 20
 Oct 2022 23:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223004.1665512-1-raj.khem@gmail.com>
In-Reply-To: <20221020223004.1665512-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 21 Oct 2022 08:03:54 +0200
Message-ID: <CANNYZj_-7o3VNCONa1sTgscrWOZtSKy6iB1mL6pOT40wt5fTow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 06:04:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172009

We carry this patch, so that manual per-target fixups like this are
not needed, and crossbeam's internal lists are used properly:

https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/rust/crossbeam_atomic.patch?h=master-next&id=f4fe7cdaa7fc5785c55bd507c897f4d25d43cffa

Is it not working somehow? Does the list itself need to be fixed?

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

