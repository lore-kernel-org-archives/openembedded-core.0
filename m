Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527C4C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 09:52:58 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.33147.1741773174563678145
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 02:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dxeuqmpc;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-46c8474d8f6so52648861cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 02:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741773173; x=1742377973; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D6tOw4nC6Mnzit1VZX1iphXft/kxf6U8Thkxr4VehUY=;
        b=dxeuqmpcfwIZRccuYEtWHHe1VsJKv3U6xAgrX6VVQ2Td1kWzwUf+RVNQWS9X9302i5
         1JTU5XK5AUO7cVPVtKVEVCLZiKF0V4g/jAbBBgMTgyHwBlrhfx04z83UA2RSRImvhgEx
         uLz5nPoGh/2z3XwexrKa8ZkMuNWVaXjfzzs7ZQcQbubjjJA/vbgthXR2dW+BDiFx8L9W
         uGy/jaN/p9g8MXioHETdgfL8uiO8RhEKZmiFsraUnLG5KS1/LA213U7xMLAhF4aISGrG
         CPsZzYsr3jezI7OfsKGgC65NIkNf61gkNjEpxvCClL95kKSiq/9w6+EZECr49zlwtO81
         +vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741773173; x=1742377973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D6tOw4nC6Mnzit1VZX1iphXft/kxf6U8Thkxr4VehUY=;
        b=gZpB8X39vW6e0wWS88KcrMIhkIWIlYJfMMbOoNN4Yecqq1db+D4hEVPuhnFWJ7vXC9
         L2bdxizgciTar27B/UzkfJHcu1X8u671qrTvETms/R+Mda9p9bCttOOcb6diFYyKQ8Pw
         zaw/x+xsj4tbR5yj1rVtuZa6bWktco1WlEkAp0ps2FNY5vEhVRVmo3hghzNGMnFWf7VK
         gdFOENGH9vRghzP4u3R1WFOv7YjH6BCxkLZZiVKIAgRUrq0EBWM6GtnYnttmMcIOcJV9
         mAW7QrRgJsGZM2l5fsrCxuEssy/dPM/F+o1JycLGgzdkyDIXKgqQChLtlc6QS6nYyj2U
         BqvA==
X-Gm-Message-State: AOJu0YxDgxwhvjNGfAE5Rem5LbOXK4dOG9UmF+F6DPvWB09j8MIc7hDt
	VXCKLvOUH5SrnlVEXKFix+CnyEWBCjLWncANoU7Ee/QWrzwzx85sJVFhsFQiW2VMKKMzGLqtQUG
	3Ne+8HwqGIw+ZX+Q2ykoReQfWMx1Q2g==
X-Gm-Gg: ASbGncvL/unJKbIMNTgWPNbcUjiIfzOyiD3aV1Gd5h5m6W9jN0dTKtAgC2tYwjxuMh2
	iBkQ39W9mKKaoZ/UhmLG2ocAW48m1NTaNUURUFuBdARxXaPm743fLNDtWeEhloUFUiyxQTLrE4d
	0niJg2nP97GYgOpd9GDum6aLqN
X-Google-Smtp-Source: AGHT+IEeNKF6xuwDylp/CTEcJ1pTWe3mdFHjLdq/sMrI7KaspQZFjmyzspDBHUpEGLXP+HkhOOH7r36hQqN93D0gdiY=
X-Received: by 2002:ad4:5d68:0:b0:6e8:92c6:9396 with SMTP id
 6a1803df08f44-6ea2dd2791bmr114690666d6.27.1741773173518; Wed, 12 Mar 2025
 02:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250305134459.2275598-1-Deepesh.Varatharajan@windriver.com> <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250305134459.2275598-2-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Mar 2025 10:52:42 +0100
X-Gm-Features: AQ5f1JpTKK_6uRY_Dmqhb1WDWSQA04h2BH-KnmKPJQM3A5AdMG7dEHk1Z5V5WDU
Message-ID: <CANNYZj-sGPdJT9XghUQQ2XOvn+QatnH0fqP7_Kg5WQHYmyXtmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4 2/3] rust: Upgrade 1.82.0->1.83.0
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 09:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212642

On Wed, 5 Mar 2025 at 14:45, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> +++ b/meta/recipes-devtools/rust/files/revert-Zdual-proc-macros-additional-check.patch
> @@ -0,0 +1,43 @@
> +rust: Fix build failure for v1.83 when lib32 enabled
> +
> +Because of the following commit ,
> +https://github.com/rust-lang/rust/commit/68034f837a39387e49fc7d7c5b088f5372a1127e
> +when we enable lib32, getting build failure because there is a check for target
> +support for "-Zdual-proc-macros" flag not functioning properly when lib32 is
> +enabled in the build environment. So for now reverting this commit and bring
> +back the previous behavior, where the "-Zdual-proc-macros" flag is always
> +added for building proc macros, regardless of the target architecture's support.
> +This would bypass the check introduced in the patch, allowing the build to
> +proceed without error, even when building for a 64-bit architecture with lib32 enabled.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +diff --git a/src/bootstrap/src/core/builder.rs b/src/bootstrap/src/core/builder.rs

Please do not add new 'Pending' patches, especially without specifying
the reason for not submitting them. They tend to stay 'Pending'
forever and are discouraged for that reason.

Rather, submit them upstream before sending them to oe-core, mark them
as Inappropriate (with reason and link to upstream ticket), or in rare
cases, explain what event needs to happen before 'Pending' status
becomes something else.

Alex

