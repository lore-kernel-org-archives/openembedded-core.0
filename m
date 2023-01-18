Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588D3C004D4
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 07:36:02 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.10390.1674027352928105046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 23:35:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qinq55gW;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id d30so45590783lfv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 23:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8BevGr7h9gMKqat6iYQ9c4irTTI+g3b5HYotLz9QI3E=;
        b=qinq55gWDtpixtf7TfUYaE80d9TZfNSmHQ7lyIRGJi8J9nGzU0FZjm/sjXxHpdTWQx
         eoiEeSXUOuDzj7qCF3ViZe6+v65MrlN/Qnj6MPv8iq12I52PDFjLEzJWuBbY85KS1dAP
         mHVvQFiAV0K61AgRk3VDOFzja11slJ13qGUBRRmmg/bAMWS54vdQL60e9WJwiljYSiwu
         IeZdmRvTCtDACbraeGpfe5Ytbbdt2Fb2UD7bVJo/1LvsS3zAJnopB38A1gP0QaAAkLjp
         RacezK5HBM3RjcMcRtRC7KdLWRk1lrC1poGKuP1pEFJ4U8N3ybFW0Qj16G+j0R4cjwm5
         UVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8BevGr7h9gMKqat6iYQ9c4irTTI+g3b5HYotLz9QI3E=;
        b=w9rN4MWEyXioXc23jmc/kpRps23hWXvGJIP7Uz0R0Dgu9hWv2KeXLVAZ1Oi+ApWosL
         xkywMvxOqpXR73ZVHjVOArhdXpojBG2cJtIUDDD7Fpcc+SalzcT1CTjLfexhhyrRwFKU
         x0IUe5P1OM7mMMKsLZxqF8cLzzx7zBwX/WJCucZVqFnYxa3WZ+of61mpROxVq2LTb0QC
         POWxvNoWdlw6djr4vlccR9jXhzRq6Yo0xn73fAOUqs1hVYDWOww67rD5MIVTwTCbOSpW
         9LQaG+8RI4ngOK2zS3MDCuNVoMyZncc+/ZtLNYJBUu2dFjzI76dE+POTqJHYuyp4VLiQ
         RCnQ==
X-Gm-Message-State: AFqh2kpGrdbfcSkP+UEbF37P8zIfHntn3igezUkqmxYscz+mqBZLApuE
	UtO8r4G6+taufs7eOvy1VfNiirEJgpWzu9ZfdTs=
X-Google-Smtp-Source: AMrXdXtKcjR3UChgEWxQOt34mll8SQn0PXjRiFh/SVWDDOcbYsVtnEqNMHioYHeQXo4yHucdOBGtNkr0t22ufhGEhc0=
X-Received: by 2002:a05:6512:3d02:b0:4d4:d087:9209 with SMTP id
 d2-20020a0565123d0200b004d4d0879209mr291030lfv.445.1674027350433; Tue, 17 Jan
 2023 23:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20230117231853.1511529-1-raj.khem@gmail.com>
In-Reply-To: <20230117231853.1511529-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Jan 2023 08:35:38 +0100
Message-ID: <CANNYZj-nJuD7X0pbuMKnvfcK+u59iiSfghm7mLA_vsLqJ-jMaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] mdadm: Define alignof using _Alignof when
 using C11 or newer
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 07:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176074

Please submit the patch upstream first.

Alex

On Wed, 18 Jan 2023 at 00:18, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...sing-_Alignof-when-using-C11-or-newe.patch | 52 +++++++++++++++++++
>  meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
>
> diff --git a/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> new file mode 100644
> index 0000000000..1c472886b3
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> @@ -0,0 +1,52 @@
> +From 82c893bb9e01f914a6bdef1bef943af746cfc3e1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 15 Jan 2023 12:42:18 -0800
> +Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
> +
> +WG14 N2350 made very clear that it is an UB having type definitions
> +within "offsetof" [1]. This patch enhances the implementation of macro
> +alignof_slot to use builtin "_Alignof" to avoid undefined behavior on
> +when using std=c11 or newer
> +
> +clang 16+ has started to flag this [2]
> +
> +Fixes build when using -std >= gnu11 and using clang16+
> +
> +Older compilers gcc < 4.9 or clang < 8 has buggy _Alignof even though it
> +may support C11, exclude those compilers too
> +
> +[1] https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2350.htm
> +[2] https://reviews.llvm.org/D133574
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + sha1.c | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/sha1.c b/sha1.c
> +index 89b32f4..1e4ad5d 100644
> +--- a/sha1.c
> ++++ b/sha1.c
> +@@ -229,7 +229,17 @@ sha1_process_bytes (const void *buffer, size_t len, struct sha1_ctx *ctx)
> +   if (len >= 64)
> +     {
> + #if !_STRING_ARCH_unaligned
> +-# define alignof(type) offsetof (struct { char c; type x; }, x)
> ++/* GCC releases before GCC 4.9 had a bug in _Alignof.  See GCC bug 52023
> ++   <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52023>.
> ++   clang versions < 8.0.0 have the same bug.  */
> ++# if (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112 \
> ++      || (defined __GNUC__ && __GNUC__ < 4 + (__GNUC_MINOR__ < 9) \
> ++   && !defined __clang__) \
> ++      || (defined __clang__ && __clang_major__ < 8))
> ++#  define alignof(type) offsetof (struct { char c; type x; }, x)
> ++# else
> ++#  define alignof(type) _Alignof(type)
> ++# endif
> + # define UNALIGNED_P(p) (((size_t) p) % alignof (sha1_uint32) != 0)
> +       if (UNALIGNED_P (buffer))
> +       while (len > 64)
> +--
> +2.39.0
> +
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> index 7298860241..1c4397509b 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> @@ -25,6 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>             file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
>             file://0001-Makefile-install-mdcheck.patch \
>             file://0001-restripe.c-Use-_FILE_OFFSET_BITS-to-enable-largefile.patch \
> +           file://0001-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
>             "
>
>  SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176066): https://lists.openembedded.org/g/openembedded-core/message/176066
> Mute This Topic: https://lists.openembedded.org/mt/96343396/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

