Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEA2C87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 20:40:23 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.14248.1754772021430350933
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 13:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GLOeFrcg;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e8fd07da660so2564027276.2
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 13:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754772020; x=1755376820; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmfrYZODrUwH7m+53lcdElW8gZHlI4etE+65yqpuTKs=;
        b=GLOeFrcgYS5iEy1XFYOG9EDwclmZiKZffi8b1atQxU++lBAZw1TMPz61mjA2Q2gYCK
         s3C++dDu15bf78HlJrJc4GFh3JBF3BjAlIxj8fJeKGxRto248xpLPvNONw93EIfPL3nn
         knZvIYamovGyZIet++YRHz4dC9ZUpKssvVOmkJsUrl1KC2KiICiHwCgLU5aFqcz1HUmQ
         tNcZL5aMXLsDJzRf5rZQO9Zo1+l1TsQi2WS/pUKXE2NWckp1vW+6VLL7ysT4BLpsSu+s
         F52jMgP1T1LMBUM1VaJPvbxe2f2EpHh1VKwNVLxy+zN7cESG/C0X3U5krYKHldYCwVXD
         m7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754772020; x=1755376820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TmfrYZODrUwH7m+53lcdElW8gZHlI4etE+65yqpuTKs=;
        b=B6xDWgJsdAHkqJPXl2hj4YqhdBoVcNtqYcSxsuOv6/2SpVlC+kzYiMkc1fswUUD/1u
         3n0wNuUm852uS0h0EJZvcwXYSoXB+VHdxfYfWdOiBhgE++oLV9eXSbcWHt93/8d4tTq5
         D7bJIHPeO/ap+/DKgUz3wiwcoHJGPNRRLZI+m93xAK65azn3UGfTZLULi6zQiu2a5BJI
         mExuVu0jovMWcMGuQCqiwqd7YI1d2LY06w9GYEPGlJo4xQ5dbkGJfqCIipRET8IxFM+U
         qiA8gUbhnxkOgdekwZAluezEEPIN7Yo5g6xnHHCO/jdxabqzWzDgM1ajAF1g/gZfrTCv
         cTMA==
X-Gm-Message-State: AOJu0Yw2tEaBqazb290qqbOgkFEX7Ex5pf+ejHsjxAhLPklV+hDmgfxZ
	QuHt6I5e46ITbTC/C5g0quArz3XRjTjNFqs7OPP6sMxjZ/K0yJmaCIFBqUJasUTyvE0IufES27K
	08EeaKYccnMZjP1jy5jumuclI7jxHG5PvxicMBSA=
X-Gm-Gg: ASbGncvoUiBW4QPkiBus7qJeOsTtsxZ06n+vxU4c73TXAgPY18wn0pPQ4+ndcacI6KN
	CkXWsL0F1ADGUksScM9F7GGkZCZQrS9B58RVrxunPASGP8B+dCPm9E/gg7CqmnD7smDsf7tDKVL
	QrsjgpIYiRMYVQ16L9zwnHN7BmcwtpTc1Dq0ZQIAT7kLf4oeRAXzAWul39SWo8tssmHUAFxu7q6
	XUVsQ==
X-Google-Smtp-Source: AGHT+IGnNBBfO8imk81WZQUZhi8u5Suq1stAlD9xyb6hcO4cMi7CnxSlFyKLk0QAG/czBCYXFVmUYwwh1g6VsyBUD54=
X-Received: by 2002:a05:690c:4447:b0:710:f39f:4d3f with SMTP id
 00721157ae682-71bf0ce406fmr86358897b3.5.1754772020410; Sat, 09 Aug 2025
 13:40:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250809191406.59132-1-skandigraun@gmail.com>
In-Reply-To: <20250809191406.59132-1-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 9 Aug 2025 13:39:54 -0700
X-Gm-Features: Ac12FXxh23T5-eiCPlnLDdqYpvN7dTa5cwtyfIs36P02zZLEjPWE5X8_MwpbYa0
Message-ID: <CAMKF1sp0zxSF4DdcFFsbEpBFYKxSi=-iY=N+nZvHouZtC70Z4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] webkitgtk: fix compiling for 32-bit Arm
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 20:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221691

Thanks for chasing it down. This addresses the root cause.

On Sat, Aug 9, 2025 at 12:14=E2=80=AFPM Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> When compiling for 32-bit Arm target, the compilation fails with the
> following error:
>
> | .../webkitgtk/2.48.5/sources/webkitgtk-2.48.5/Source/JavaScriptCore/off=
lineasm/ast.rb:1004:in 'Instruction#lowerDefault': Unhandled opcode addq at=
 WebAssembly.asm:739 (due to WebAssembly.asm:739) (LoweringError)
>
> Add backported patch to fix this error.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  .../webkitgtk/fix-armv7-compilation.patch     | 32 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.48.5.bb  |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilat=
ion.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.pat=
ch b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
> new file mode 100644
> index 0000000000..a857d55ae4
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/fix-armv7-compilation.patch
> @@ -0,0 +1,32 @@
> +From 7999ecd5ee4ea3123f7e75634d2bc57f57ca7070 Mon Sep 17 00:00:00 2001
> +From: Justin Michaud <jmichaud@igalia.com>
> +Date: Wed, 6 Aug 2025 21:14:26 +0300
> +Subject: [PATCH] REGRESSION(2.48.5): [WPE][GTK] Does not compile on ARMv=
7
> + https://bugs.webkit.org/show_bug.cgi?id=3D296921
> +
> +Unreviewed build fix.
> +
> +* Source/JavaScriptCore/llint/WebAssembly.asm: Replace addq with addp
> +  for sp on armv7
> +
> +Canonical link: https://commits.webkit.org/290945.344@webkitglib/2.48
> +
> +Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/7999e=
cd5ee4ea3123f7e75634d2bc57f57ca7070]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + Source/JavaScriptCore/llint/WebAssembly.asm | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Source/JavaScriptCore/llint/WebAssembly.asm b/Source/JavaSc=
riptCore/llint/WebAssembly.asm
> +index 1ac3e2accf3c..bd9041404eb1 100644
> +--- a/Source/JavaScriptCore/llint/WebAssembly.asm
> ++++ b/Source/JavaScriptCore/llint/WebAssembly.asm
> +@@ -736,7 +736,7 @@ if JSVALUE64
> +     storep memoryBase, Callee[cfr]
> + else
> +     loadp [sp], ws0
> +-    addq 2 * SlotSize, sp
> ++    addp 2 * SlotSize, sp
> +     storep ws0, Callee[cfr]
> + end
> +
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.48.5.bb
> index 947996450d..35b8ee2a90 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
>             file://sys_futex.patch \
>             file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-s=
how.patch \
>             file://fix-ftbfs-riscv64.patch \
> +           file://fix-armv7-compilation.patch \
>             "
>  SRC_URI[sha256sum] =3D "bb64ed9d1cfd58e8b5e89ccad71dd31adfed56336bad7695=
031ad0b668e1987c"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221688): https://lists.openembedded.org/g/openembedde=
d-core/message/221688
> Mute This Topic: https://lists.openembedded.org/mt/114620347/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

