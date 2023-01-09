Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77FEC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 14:46:38 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.73820.1673275595971083097
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 06:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n45j/s6e;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id q2so9076009ljp.6
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 06:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tr1+uFC7owvvfFzJq0q+CxKP2SZrl9Bi9HWoA+jX7A4=;
        b=n45j/s6eNJo5JYKfUFBl/L87gUaEcQoeyyuiUyidUbVLEqrg9bo/Hyhc02nJtS3AuP
         WBhmuf5CB90qzxolW3F7LWa3IGMU0hp1ZMQl4ESRBIug8uBXFXuToabA4r7LRblzicux
         Sj5v2Y2RdmZUDwTNN52zdhQY1s8HnmctIlDr442Z9va3bDZ4vGfVb2w/KWrywNC/K5nM
         NC0vmSFN/kd+TAVh4tPmvjiOcuJ+1C7VO/nmKqx6w3Uu3upTxrbWT843aFN+5ojCSHDc
         XuNVzpxWqZIGxUG+rcsNbdpbD2o5ixWGFtBF0DyxZTV2QwS45fvWB4lVZI+BEaA1t5zk
         FvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tr1+uFC7owvvfFzJq0q+CxKP2SZrl9Bi9HWoA+jX7A4=;
        b=cbfjjsOKXU+3t7yvSLRwDicSkUMqq3cqED+lD4BxzXbSnoMGKMFc7FfaxOOOnZ91l+
         Opn12zw6kpd5PSgPeu/kt46DJE7hUmZ0SHxno5DZwc8UnpFjYrNOgtNPHhv5+wQUvMr0
         C/T0FzHif1/bSfOSS7iuQ52OW2mDQphYgPgx5b+hmgqo17z0W1pvO6Tx7DDg3Lm2bByX
         kitav8/qWDGRPyrPwlheHQd0g3OobVVZ2GnNUY3KjGbcbhI0gIzlPcThxPI7vMKD2tjl
         xV12bpiKh5Cu+o13i8x9RQ3WK4yElCoehvpHE3HYw9lAZZZS+1jjVsfryjuQiyA0rGRB
         O+Hg==
X-Gm-Message-State: AFqh2krtprV1mCL3QDMER2nbF+WW3GqHVDoW4baSc7sI5MI4gGqRhqXx
	zWUC320Rj+W5+MXztD3QCBrx9AuWG9mC7FrdtmU=
X-Google-Smtp-Source: AMrXdXsL9lnafJHhMno9d7zbWU6HZszkZWPBCYZJ/wOPAZm9mOR2C/RrQXy81nscby/fIHoSeGm+zPJ7s2Wq1NrFHfY=
X-Received: by 2002:a2e:9d4f:0:b0:27f:f286:15e9 with SMTP id
 y15-20020a2e9d4f000000b0027ff28615e9mr2009473ljj.403.1673275593971; Mon, 09
 Jan 2023 06:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20230109140005.234301-1-yashinde145@gmail.com>
In-Reply-To: <20230109140005.234301-1-yashinde145@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 9 Jan 2023 15:46:22 +0100
Message-ID: <CANNYZj8EDDAFxR6bLbPxEVJiVr1LTOueTJwFG-m8UcWJPZZTCA@mail.gmail.com>
Subject: Re: [OE-core] libstd-rs: Build in the release mode to avoid error
 Issue: LINCD-7172
To: Yash Shinde <yashinde145@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 14:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175690

Hello,

is this the same problem as one addressed in mozjs recipe by this patch?
http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-extended/mozjs/mozjs-102/0001-Cargo.toml-do-not-abort-on-panic.patch

Also note that you send a patch that adds a patch, not the patch
itself. But we need to get to the bottom of the actual issue first;
work-arounds built on incomplete understanding cannot be accepted.

Alex

On Mon, 9 Jan 2023 at 15:00, Yash Shinde <yashinde145@gmail.com> wrote:
>
> When mozjs in firefox is built with DEBUG_BUILD = "1"
> in local.conf, it will fail with the following error:
>    rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
> /asymmetric.rs:57:
>    more undefined references to `core::panicking::panic' follow
>
> Switch to building libstd-rs in "release" mode as that works
> around the issue and builds mozjs successfully. This is a
> work-around that can be used until the root cause of the debug
> build error is resolved.
>
> (LOCAL REV: NOT UPSTREAM) -- to be sent to oe-core
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../rust/rust/LINCD-11387.patch               | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/rust/LINCD-11387.patch
>
> diff --git a/meta/recipes-devtools/rust/rust/LINCD-11387.patch b/meta/recipes-devtools/rust/rust/LINCD-11387.patch
> new file mode 100644
> index 0000000000..3e84aa7232
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust/LINCD-11387.patch
> @@ -0,0 +1,43 @@
> +From 45731fb0f735bc287e56b6fd6c93b56966195647 Mon Sep 17 00:00:00 2001
> +From: naveen gowda <pgowda.cve@gmail.com>
> +Date: Mon, 29 Nov 2021 21:40:27 -0800
> +Subject: libstd-rs: Build in the release mode to avoid error
> +
> +Issue: LINCD-7172
> +
> +When mozjs in firefox is built with DEBUG_BUILD = "1"
> +in local.conf, it will fail with the following error:
> +   rustc-1.56.0-src/vendor/compiler_builtins/src/int/specialized_div_rem
> +/asymmetric.rs:57:
> +   more undefined references to `core::panicking::panic' follow
> +
> +Switch to building libstd-rs in "release" mode as that works
> +around the issue and builds mozjs successfully. This is a
> +work-around that can be used until the root cause of the debug
> +build error is resolved.
> +
> +(LOCAL REV: NOT UPSTREAM) -- to be sent to oe-core
> +
> +Signed-off-by: naveen gowda <naveen.gowda@windriver.com>
> +Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> +---
> +meta/recipes-devtools/rust/libstd-rs_1.66.0.bb | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
> +index 8802e9790c..c5295187f8 100644
> +--- a/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
> ++++ b/meta/recipes-devtools/rust/libstd-rs_1.66.0.bb
> +@@ -24,9 +24,12 @@ RUSTFLAGS += "-Cembed-bitcode=yes"
> + # Needed so cargo can find libbacktrace
> + RUSTFLAGS += "-L ${STAGING_LIBDIR} -C link-arg=-Wl,-soname,libstd.so"
> +
> ++CARGO_BUILD_FLAGS:append = "${@' --release' if d.getVar('DEBUG_BUILD') == '1' else ''}"
> ++
> + CARGO_FEATURES ?= "panic-unwind backtrace"
> + CARGO_BUILD_FLAGS += "--features '${CARGO_FEATURES}'"
> + CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
> ++BUILD_DIR = "release"
> +
> + do_compile:prepend () {
> +     export CARGO_TARGET_DIR="${B}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175685): https://lists.openembedded.org/g/openembedded-core/message/175685
> Mute This Topic: https://lists.openembedded.org/mt/96152544/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

