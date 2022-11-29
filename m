Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C3BC4167B
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 14:56:28 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.151926.1669733781324622087
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 06:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RJO5bSW9;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id bj12so34350827ejb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 06:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mtoBukYNFkr+IKXia1o6qCJ3NX27q87A8Kf0TvLlIhk=;
        b=RJO5bSW9zLLuzbBY44XxoT0BPAS9OVa1V7ZzW5j/pIX49rXSBSZ9pPgsXlZQ2sQ+ee
         JBz7GiiavhnRC6Z9TRy/vAikXbmRaKNdWp0fV6RpXP0MPQMcEi3mc6l6oQ96eRUDI6Ig
         fz5XUTPT2kRhwGewWbMwvuI1Cu16YqTVUzUdIt0MKoy4OjGvyRpasA3+7hzQcSiaxAms
         hhYFxS6kTwRsWC0XGZg0SpVgkwClJD/to4EdjChjxD9HYz6O21HehELHX9agwR2Ql1hM
         tt03ANSVC9wkTV0Sc/+2S8SbShkG6cGJtVdLKfA2YDZ8opC7JH7OxZxopYzO5Ehek0fQ
         cTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtoBukYNFkr+IKXia1o6qCJ3NX27q87A8Kf0TvLlIhk=;
        b=qAJ6xlXk3lN8ImzWBza+vxjzQy03Zv7pYMSRSa8rK7iXKSjNWJot5risQ1bVnSArDX
         JOVNB43sTtbf7kO36nZHBhdfKSyYheItBSL2wPvQ24hBRM7QjxypiW85HZXE+9QTNTQU
         rSbLlkJwKzJ3UroCLUvOLGhT8bxeOOznQY3qC0Zothrg43ViDyFnWdYQ0622rwlYK1lk
         0WfMygC3o1aTtWEfujKv499/rg0y1GcZuGVKNwD9Vt1hyXw/H2W/Kqz/fuFeGsXJ0V3Y
         wP0dXMp/pu948WTge+uMAfOtthcfBq8/uT9apXjBX5gi2srZTtlTgVqSlpXb9WJXMNCU
         qGHA==
X-Gm-Message-State: ANoB5pnIMwokgN4T/7uxpfPFdJy29rmZH6w+M3Oaj8Lw+5SmXdyAywbJ
	8l+N0UI+T/zAtY1174/1LaLqRAz5SlZPJlYfRhKHqg==
X-Google-Smtp-Source: AA0mqf7/JwI2w3bLYffFfV7UsgZ8u+SNEtXQA4fzmkOU0SC91U0r+N+//nLHLY4s4jxBRlF8fWDdsM1h4jH217RwyZU=
X-Received: by 2002:a17:906:a991:b0:7ba:85a7:2ec3 with SMTP id
 jr17-20020a170906a99100b007ba85a72ec3mr25493911ejb.36.1669733779398; Tue, 29
 Nov 2022 06:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20221129110832.1040199-1-vkumbhar@mvista.com>
In-Reply-To: <20221129110832.1040199-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 29 Nov 2022 04:56:08 -1000
Message-ID: <CAOSpxdbX=7Wz3m9XWVX6wbkwZeMJu3uMzSM3nS5G4bfc0AkzdQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH v2] qemu: fix CVE-2021-20196 block fdc
 null pointer dereference may lead to guest crash
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 14:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173976

On Tue, Nov 29, 2022 at 1:08 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> From: Vivek Kumbhar <vkumbhar@mvista.com>
>
> Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2021-20196.patch            | 62 +++++++++++++++++++
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 764f948a28..a915b54c1a 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -113,6 +113,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://CVE-2022-0216-2.patch \
>             file://CVE-2021-3750.patch \
>            file://CVE-2021-3638.patch \
> +          file://CVE-2021-20196.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
> new file mode 100644
> index 0000000000..24da80e7db
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196.patch
> @@ -0,0 +1,62 @@
> +From 94608c59045791dfd35102bc59b792e96f2cfa30 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Tue, 29 Nov 2022 15:57:13 +0530
> +Subject: [PATCH] CVE-2021-20196
> +
> +Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233

This should be: Upstream-Status: Backport
[https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233]

I've fixed it, so no need for a v2.

Steve

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
> + hw/block/fdc.c | 19 ++++++++++++++++++-
> + 1 file changed, 18 insertions(+), 1 deletion(-)
> +
> +diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> +index ac5d31e8..e128e975 100644
> +--- a/hw/block/fdc.c
> ++++ b/hw/block/fdc.c
> +@@ -58,6 +58,11 @@
> +         }                                                       \
> +     } while (0)
> +
> ++/* Anonymous BlockBackend for empty drive */
> ++static BlockBackend *blk_create_empty_drive(void)
> ++{
> ++    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
> ++}
> +
> + /********************************************************/
> + /* qdev floppy bus                                      */
> +@@ -1356,7 +1361,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
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
> View/Reply Online (#173964): https://lists.openembedded.org/g/openembedded-core/message/173964
> Mute This Topic: https://lists.openembedded.org/mt/95331908/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

