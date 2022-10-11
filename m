Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F15C433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 21:39:53 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.13423.1665524387456803202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 14:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=P6wer13s;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.50, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f50.google.com with SMTP id r17so34191708eja.7
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 14:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Npa1D1SvCCvgcyH9gWJd6SRMR8SarBq17PM558GrmAE=;
        b=P6wer13sFYh0qyqscUQ8CXp4hXmY6vXnONxwJwoo8cvNzHYXEsoNIDgiwFj5H5dGO6
         c2DfTx1178829PL8JG9D5LnSwt2AIh7ctWOXoGb8XBAhIE9x5lAFaspuYwABP4+ALG9o
         sN2w/59BnUEIvP6+1rj1VctrCngwofvzlx4pKNmsU3MgR9hrcWaKdr6AnnGLVt3nmerB
         TGm2222LTsoTgRSTvtuHeMBq1rUCU8AC2WACRDcKH1O5LVZgkgEVkDMFM0jRF4y2qRF4
         hj11+THvc40C6209mhmk8Jl95UU0UNvgYlV8kUdmFm5fPW/swwp72IU1wEC7OBhHo3ya
         kAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Npa1D1SvCCvgcyH9gWJd6SRMR8SarBq17PM558GrmAE=;
        b=yVVUC7bT5atRsqElkyrWXCYW2KUM694Idb+iWwQeTGPDZ6o/LJTvpmTHn3QGCudR0l
         6Vs8qy8iZs8dBatRB9EQP/WxQJmvpqxx9ssMPdwxhgkA/x27SZZg9ecLurQZxdzWJAfC
         z9wGRjh4GlaQatNMtNugAiV3y0fZb5CY795xSpmeODgXTq/t9b3T1b6q7Drj2WLCzbbf
         fXn08igLTA6tAuOGJqv1E3UBIwPGAdm4StC6pvdYpcl0QmHOq+nHdJPlDQqN2KqGh/A6
         GkROV+eiBsF2P0j4REV5F4wqprMEMqbPK8uDuEpriNXrVbDnfVBow4ML96ZbZOLdHGrO
         Z46Q==
X-Gm-Message-State: ACrzQf1QTzB3b9oLGfivKQLoUNi1EWzAAnC0F4tH0C5lPO5EBPOBP3kP
	2lsFnKpv2m7pteaWu2jrPRFekmRBGg7LT79h0RjM0A==
X-Google-Smtp-Source: AMsMyM6JKdXix4xMw9S8TCS82rVocdJLvNlM1ZzCazo7YDF+9ZAUe3HeMLYBIxaf9XTymGeKCxph6CWNEaL2jU0zm3o=
X-Received: by 2002:a17:907:763b:b0:78d:ed3d:5a8 with SMTP id
 jy27-20020a170907763b00b0078ded3d05a8mr1643817ejc.132.1665524385833; Tue, 11
 Oct 2022 14:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221011150505.36259-1-vkumbhar@mvista.com>
In-Reply-To: <20221011150505.36259-1-vkumbhar@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 11 Oct 2022 11:39:34 -1000
Message-ID: <CAOSpxdZ3_1r5gx+7xP89Qw1nCBGHOr9H1QtcbP3Qzx9oBrg3GQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] qemu: fix CVE-2021-20196
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 21:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171640

On Tue, Oct 11, 2022 at 5:05 AM vkumbhar <vkumbhar@mvista.com> wrote:
>
> Source: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> MR: 111637
> Type: Security Fix
> Disposition: Backport from https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> ChangeID: c1e435aa25bb60b362bb68ab253ff55504e0328d
> Description:
>     hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>
>     Guest might select another drive on the bus by setting the
>     DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
>     The current controller model doesn't expect a BlockBackend
>     to be NULL. A simple way to fix CVE-2021-20196 is to create
>     an empty BlockBackend when it is missing. All further
>     accesses will be safely handled, and the controller state
>     machines keep behaving correctly.
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/0001-CVE-2021-20196.patch       | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch

Again, please name the file CVE-2021-20196.patch

>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 7a963ad57c..2cdb718b1f 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -52,6 +52,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>            file://CVE-2019-20175.patch \
>            file://CVE-2020-24352.patch \
>            file://CVE-2020-25723.patch \
> +          file://0001-CVE-2021-20196.patch \

Same issue here, you are not using current dunfell head so this patch
doesn't apply.

Please rebase on current dunfell head and send a V2.

Thanks!

Steve

>            "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch
> new file mode 100644
> index 0000000000..affc8ead58
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0001-CVE-2021-20196.patch
> @@ -0,0 +1,40 @@
> +From a253e632aea9e0e3f3f2ad3d157f34908e9c2008 Mon Sep 17 00:00:00 2001
> +From: Vivek Kumbhar <vkumbhar@mvista.com>
> +Date: Mon, 10 Oct 2022 10:00:53 +0530
> +Subject: [PATCH] CVE-2021-20196
> +
> +Upstream-Status: https://gitlab.com/qemu-project/qemu/-/commit/1ab95af033a419e7a64e2d58e67dd96b20af5233
> +CVE: CVE-2021-20196
> +Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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
> View/Reply Online (#171629): https://lists.openembedded.org/g/openembedded-core/message/171629
> Mute This Topic: https://lists.openembedded.org/mt/94260757/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

