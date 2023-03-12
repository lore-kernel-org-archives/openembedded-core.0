Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95980C6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 07:31:01 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.62599.1678606255618235425
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 23:30:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Duf6gk26;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id b10so9619564ljr.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 23:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678606254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5ek/PI1beZ8+Y9K9uNDhOOmPbPgSs3RVB+Wam5sk528=;
        b=Duf6gk26PxAXyimKB5/AFqKtsdtqQ9dyCsOZlxsqHIPGgnYns9cElqzis86nZxU4c8
         2+chxGqBSKthSTBx7Um1QUVeXscvZUR+v8rVzi4CYL2F+1dVkLzImpp7OiiSQJZqnzGL
         g3hUBgrA3qDFiVqK7rc/vOIkIrI5YnTRowJSh8RglwEWEIcQWb5LI3XzISxpu50SjSH5
         wgIdC+bagko0ZCi2RjyvDtdQymmn19hHwwP0eqODhigLXnqTBg/GE7je9SREUFlClifE
         VYv7nYSL1pDpwpRXYB2ER8DaUI0u1e3HztNANR04yrJxgNxexx1VbSIvR/pvFuYsr3Z8
         F3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678606254;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ek/PI1beZ8+Y9K9uNDhOOmPbPgSs3RVB+Wam5sk528=;
        b=rmTwNMOEVwL3ILlAah4vpb7tgIUHVN2QXpmypA4HEHHC0qK13VncOXyeWQhxxZNVzU
         kcfeR0IQpsneI9MjaA+GrSdIHd4vEt9DsfPchPpm52PH5p+hTURl37hkhP0OnOWnuJVv
         udmWoMa5Ook/mXgImstcCYugc3sz/6eOmQ9T25zutPpXu91MbHqsvnwrWdjZqtZMuHmd
         dms0vt83HYiM1SzPSq1H7H9HDg8D+kjIUpk0xBW/S2T7tTWlGCVN7cK5ebxOvyZc+K0N
         xjUcJF7ShWX3iKvitzHbK808WfDqi8aSyS3O+vzKl6DYbIYxdH8m66bVq5UEnmjsa7Je
         +NvA==
X-Gm-Message-State: AO0yUKU8lhowIdwwObkNc6Q/bX/bxPP0+GXTeFT2nryRL0QU/zJubCbq
	zxEjQDRef0VXTKZnPV+//uKCPPBBzrjzjqj06SzrRsf+
X-Google-Smtp-Source: AK7set9uAkgDdwnluK97lC22BExN0vYKuhMXbBTQl1VfdyfJmHlFDHZT1F2rTKYCra8JtSC1GKAPRpw4dmiFe1pW6o8=
X-Received: by 2002:a2e:aaa3:0:b0:295:a64f:9d50 with SMTP id
 bj35-20020a2eaaa3000000b00295a64f9d50mr9502982ljb.5.1678606253591; Sat, 11
 Mar 2023 23:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20230312072422.2626859-1-raj.khem@gmail.com>
In-Reply-To: <20230312072422.2626859-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 08:30:42 +0100
Message-ID: <CANNYZj8fy7m1_fzZKyVCoKTd2-c8dnas-0NYkif89JXf7fPOnw@mail.gmail.com>
Subject: Re: [PATCH] systemd: Fix musl fix patch
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:31:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178377

How can the issue be triggered? I did test this on musl, and so did
the autobuilder.

Alex

On Sun, 12 Mar 2023 at 08:24, Khem Raj <raj.khem@gmail.com> wrote:
>
> Current patch with fail when stdint.h is in include path before this
> typedef which can also happen with re-includes. Therefore shunt that
> by defining __DEFINED_wchar_t which helps musl builds of systemd-boot
> recipe
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...rc-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> index 927f914848..43173ac32d 100644
> --- a/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> +++ b/meta/recipes-core/systemd/systemd/0004-src-boot-efi-efi-string.c-define-wchar_t-from-__WCHA.patch
> @@ -21,17 +21,16 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>   src/boot/efi/efi-string.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> -diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.c
> -index 22923d60f6..22a8d1ef71 100644
>  --- a/src/boot/efi/efi-string.c
>  +++ b/src/boot/efi/efi-string.c
> -@@ -2,7 +2,12 @@
> +@@ -2,7 +2,13 @@
>
>   #include <stdbool.h>
>   #include <stdint.h>
>  +
>  +#if SD_BOOT
>  +typedef __WCHAR_TYPE__ wchar_t;
> ++#define __DEFINED_wchar_t
>  +#else
>   #include <wchar.h>
>  +#endif
> --
> 2.39.2
>

