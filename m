Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D25C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Nov 2022 17:40:23 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.2506.1668706816719835585
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Nov 2022 09:40:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Uu5yaF8e;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.41, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f41.google.com with SMTP id i21so3599883edj.10
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 09:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=waWRNA2vcYzS3D0i2XEtFXNxJ5Q9X9hrqZyvpu7PwiM=;
        b=Uu5yaF8e4OY6tK9j21+rjDNWe9yic5iQHqZlc0URHh8qCeP4NobrEcHcHpyox6JXoy
         OuEgUh2wLlx7SwFOJUK/7gfZZ87gjQB4nrqluNavgW+vcgA51R3DEyPVbM8Oru0tMqrg
         gld+Rs73HWXL+A7QmXmJSAJ/ZeopnGsEIrWE8S6s/S1/uNxwZXQmeREG/5N7mVIAoj/c
         wrEILRZuX5JFP5uwPqRH/Uq1HuNGvrH04RzniGDnNdtlmFccMttgTn9JAHau4CLSOFfp
         REGDgeQjaMUQIQ9g0WmdFL7DU8i5NkuDBoYFw5GyqQiBjfb7p11cVFxa5I8Teid+9foP
         3MUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=waWRNA2vcYzS3D0i2XEtFXNxJ5Q9X9hrqZyvpu7PwiM=;
        b=Exf7SBFZa8fCkzqN28LE1sQ7P7CF3JOPLULha1YUabNc5pipO+HBt3qizLtDuQLd26
         jWd2eCD3iN4XEJByhGhR5wGD1B03emRwrF8x9NvStb1zULT/R4XTCt2d05fmFD3E8vax
         I5rHOio7gukc57NDg20KH+dtMvxZ0hZfIdQIWrFtcjIVCGjNkz1gsu74ov+dcNpM0pLh
         BWNgmA1qFrze0V69cEpWU9G80FPtkClb8KhwBQAYdbmfFZEroL0hvZ6pm/DYBC0V7glI
         7mltqWwN6TdxlyNe9f6VzUDbLmcqOZDHqcgPy6M0lVohApV74D6moVa+oZFc5WrkjMdX
         u37A==
X-Gm-Message-State: ANoB5plK7jx///6v6xTxKFAF0rKqUELaelISEbmjqIqS06oidybns6ug
	MSiM2/i+SlyOc6l/3H2syJzWHj4orqOoszDa5FrMgw==
X-Google-Smtp-Source: AA0mqf49kZNX3ekgkovo9UG28hDwqwtRy5c+5X+zjDWOQ4SFB6ilx5piarJxnOr28GZZrvNjpP9vvnH9B2UPxSdc8oA=
X-Received: by 2002:a05:6402:3886:b0:463:ab08:2bc6 with SMTP id
 fd6-20020a056402388600b00463ab082bc6mr3071050edb.143.1668706814866; Thu, 17
 Nov 2022 09:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20221117122122.257937-1-vkumbhar@mvista.com>
In-Reply-To: <20221117122122.257937-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 17 Nov 2022 07:40:03 -1000
Message-ID: <CAOSpxdYBHseGq-r-Wohei7STkHZNm6GpvnqqPPUM75awpNmR1w@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] qemu: fix CVE-2021-20196 block fdc
 null pointer dereference may lead to guest crash
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Nov 2022 17:40:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173446

This patch breaks the qemu build:

https://errors.yoctoproject.org/Errors/Details/677989/

TLDR:

TOPDIR/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-qemu/4.2.0-r0/recipe-sysroot-native/usr/bin/i686-pokysdk-linux/../../libexec/i686-pokysdk-linux/gcc/i686-pokysdk-linux/9.5.0/ld:
../hw/block/fdc.o: in function `get_cur_drv':
/usr/src/debug/nativesdk-qemu/4.2.0-r0/qemu-4.2.0/hw/block/fdc.c:1369:
undefined reference to `blk_create_empty_drive'
collect2: error: ld returned 1 exit status

Steve

On Thu, Nov 17, 2022 at 2:21 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>
> Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2021-20196.patch            | 50 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 28caefef07..e601cee890 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -112,6 +112,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://CVE-2022-0216-1.patch \
>             file://CVE-2022-0216-2.patch \
>             file://CVE-2021-3750.patch \
> +          file://CVE-2021-20196.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
> new file mode 100644
> index 0000000000..3d65c1b2f1
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
> @@ -0,0 +1,50 @@
> +From b983146dcebd7dee9a727f3b83ad86361ef58637 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Thu, 17 Nov 2022 17:37:08 +0530
> +Subject: [PATCH] CVE-2021-20196
> +
> +Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> +CVE: CVE-2021-20196
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> +
> +hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
> +
> +Guest might select another drive on the bus by setting the
> +DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
> +The current controller model doesn't expect a BlockBackend
> +to be NULL. A simple way to fix CVE-2021-20196 is to create
> +an empty BlockBackend when it is missing. All further
> +accesses will be safely handled, and the controller state
> +machines keep behaving correctly.
> +---
> + hw/block/fdc.c | 14 +++++++++++++-
> + 1 file changed, 13 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> +index ac5d31e8..a887369c 100644
> +--- a/hw/block/fdc.c
> ++++ b/hw/block/fdc.c
> +@@ -1356,7 +1356,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
> +
> + static FDrive *get_cur_drv(FDCtrl *fdctrl)
> + {
> +-    return get_drv(fdctrl, fdctrl->cur_drv);
> ++    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
> ++
> ++    if (!cur_drv->blk) {
> ++        /*
> ++         * Kludge: empty drive line selected. Create an anonymous
> ++         * BlockBackend to avoid NULL deref with various BlockBackend
> ++         * API calls within this model (CVE-2021-20196).
> ++         * Due to the controller QOM model limitations, we don't
> ++         * attach the created to the controller device.
> ++         */
> ++        cur_drv->blk = blk_create_empty_drive();
> ++    }
> ++    return cur_drv;
> + }
> +
> + /* Status A register : 0x00 (read-only) */
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173419): https://lists.openembedded.org/g/openembedded-core/message/173419
> Mute This Topic: https://lists.openembedded.org/mt/95088297/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

